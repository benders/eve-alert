require 'reve'

module EveRecord
  def self.included(base)
    base.validates_numericality_of :id
    base.validates_uniqueness_of :id
  end

  private

  # We assign to 'id', even though it's bad
  def attributes_protected_by_default
    []
  end
end