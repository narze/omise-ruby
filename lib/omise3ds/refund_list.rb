require "omise3ds/list"
require "omise3ds/refund"

module Omise3ds
  class RefundList < List
    def initialize(charge, attributes = {})
      super(attributes)
      @charge = charge
    end

    def create(attributes = {})
      Refund.new self.class.resource(location, attributes).post(attributes)
    end

    def retrieve(id, attributes = {})
      Refund.new self.class.resource(location(id), attributes).get(attributes)
    end
  end
end
