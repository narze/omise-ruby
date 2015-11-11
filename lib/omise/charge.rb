require "omise/object"
require "omise/list"
require "omise/customer"
require "omise/dispute"
require "omise/refund_list"
require "omise/transaction"

module Omise
  class Charge < OmiseObject
    self.endpoint = "/charges"

    # Retrieves a charge object. Calling this method will issue a single HTTP
    # request:
    #
    #   - GET https://api.omise.co/charges/CHARGE_ID
    #
    # Example:
    #
    #     charge = Omise::Charge.retrieve(charge_id)
    #
    # Returns a new `Omise::Charge` instance if successful and raises an
    # `Omise::Error` if the request fails.
    #
    def self.retrieve(id, attributes = {})
      new resource(location(id), attributes).get(attributes)
    end

    # Retrieves a list of charge objects. By default the list will be returned
    # in reverse chronological order. You can inverse the order to start from
    # the very first charge in your account by passing `chronological` to the
    # `order:` option. You can also restrict what charges will be returned by
    # passing the `from:` and/or `to:` options. Lastly you can paginate the
    # result by using the `offset:` and `limit:` options.
    #
    # You can find out more about pagination and list options by visiting this
    # page: https://www.omise.co/api-pagination
    #
    # Calling this method will issue a single HTTP request:
    #
    #   - GET https://api.omise.co/charges
    #
    # Examples:
    #
    #     # Latest charges
    #     charges = Omise::Charge.list
    #
    #     # First charges
    #     charges = Omise::Charge.list(order: "chronological")
    #
    # Returns a new `Omise::Charge` instance if successful and raises an
    # `Omise::Error` if the request fails.
    #
    def self.list(attributes = {})
      List.new resource(location, attributes).get(attributes)
    end

    def self.create(attributes = {})
      new resource(location, attributes).post(attributes)
    end

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end

    def update(attributes = {})
      assign_attributes resource(attributes).patch(attributes)
    end

    def capture(options = {})
      assign_attributes nested_resource("capture", options).post
    end

    def customer(options = {})
      expand_attribute Customer, "customer", options
    end

    def dispute(options = {})
      expand_attribute Dispute, "dispute", options
    end

    def transaction(options = {})
      expand_attribute Transaction, "transaction", options
    end

    def refunds
      list_attribute RefundList, "refunds"
    end

    def captured
      lookup_attribute_value :captured, :paid
    end

    def paid
      lookup_attribute_value :paid, :captured
    end
  end
end
