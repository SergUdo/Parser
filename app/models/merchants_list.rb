class MerchantsList < ApplicationRecord
  #STORAGE_SERVICE = ActiveStorage::Service::DiskService.new(root: Rails.root.to_s + '/storage/')

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
      self.class.create_merchant(*row.first(6)) # Todo: refactor
    end
  end

  def tempfile
    @tempfile ||= ActiveStorage::Blob.service.send :path_for, blob.key
  end

  def open_file
    Roo::Spreadsheet.open tempfile, extension: :ods
  end

  def self.create_merchant(oid, k, o, n, a, c)
    begin
      Merchant.new(
        origin_id: oid, 
        kind: k,
        owner: o,
        name: n,
        city: c,
        address: a
      ).save
    rescue ActiveRecord::RecordNotUnique
      nil
    end
  end
end
