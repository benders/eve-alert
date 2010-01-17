require 'reve'

module EveRecord
  def self.included(base)
    base.validates_numericality_of :id
    base.validates_uniqueness_of :id
  end

  def if_stale(account_id, url, options, timeout, &block)
    request = LastRequest.find_or_initialize_by_account_id_and_url_and_options(account_id, url, options.to_yaml)
    if request.new_record? || request.updated_at < timeout.ago
      yield
      request.touch
    end
  end

  private

  # We assign to 'id', even though it's bad
  def attributes_protected_by_default
    []
  end
end