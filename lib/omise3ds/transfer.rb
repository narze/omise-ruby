require "omise3ds/object"
require "omise3ds/bank_account"
require "omise3ds/list"
require "omise3ds/recipient"

module Omise3ds
  class Transfer < OmiseObject
    self.endpoint = "/transfers"

    def self.create(attributes = {})
      new resource(location, attributes).post(attributes)
    end

    def self.retrieve(id, attributes = {})
      new resource(location(id), attributes).get(attributes)
    end

    def self.list(attributes = {})
      List.new resource(location, attributes).get(attributes)
    end

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end

    def update(attributes = {})
      assign_attributes resource(attributes).patch(attributes)
    end

    def destroy(attributes = {})
      assign_attributes resource(attributes).delete
    end

    def recipient(options = {})
      expand_attribute Recipient, "recipient", options
    end

    def bank_account
      expand_attribute BankAccount, "bank_account"
    end
  end
end
