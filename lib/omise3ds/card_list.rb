require "omise3ds/list"
require "omise3ds/card"
require "omise3ds/token"

module Omise3ds
  class CardList < List
    def initialize(customer, attributes = {})
      super(attributes)
      @customer = customer
    end

    def retrieve(id, attributes = {})
      Card.new self.class.resource(location(id), attributes).get(attributes)
    end

    def create(attributes = {})
      token = Token.create(card: attributes)
      @customer.update(card: token.id)
      retrieve(token.card.id)
    end
  end
end
