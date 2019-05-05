class ParseDocumentJob < ApplicationJob
  queue_as :default

  def perform(merchants_list)
    merchants_list.parse!
  end
end
