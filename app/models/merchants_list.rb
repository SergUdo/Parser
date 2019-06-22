class MerchantsList < ApplicationRecord
  validates :address_column, presence: true
  validates :kind_column, presence: true
  validates :city_column, presence: true
  validates :owner_column, presence: true
  validates :name_column, presence: true

  has_one_attached :list_file

  attr_writer :list_file_rows

  after_create :enqueue_parse

  delegate :blob, to: :list_file, prefix: false, allow_nil: true

  def enqueue_parse
    ParseDocumentJob.perform_later(self)
  end

  def parse!
    open_file.each_with_index do |row, index|
      next if index.zero? && ignore_header

      create_merchant row
    end
  end

  def tempfile
    @tempfile ||= ActiveStorage::Blob.service.send :path_for, blob.key
  end

  def open_file
    Roo::Spreadsheet.open tempfile, extension: :ods
  end

  def create_merchant(row)
    Merchant.new(
      kind: row[kind_column],
      owner: row[owner_column],
      name: row[name_column],
      city: row[city_column],
      address: row[address_column]
    ).save
  end
end
