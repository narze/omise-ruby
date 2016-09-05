require "omise3ds/object"
require "omise3ds/charge"
require "omise3ds/transaction"

module Omise3ds
  class Refund < OmiseObject
    self.endpoint = "/refunds"

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end

    def charge(options = {})
      expand_attribute Charge, "charge", options
    end

    def transaction(options = {})
      expand_attribute Transaction, "transaction", options
    end
  end
end
