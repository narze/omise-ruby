require "omise3ds/object"
require "omise3ds/list"

module Omise3ds
  class Transaction < OmiseObject
    self.endpoint = "/transactions"

    def self.retrieve(id = nil, attributes = {})
      new resource(location(id), attributes).get(attributes)
    end

    def self.list(attributes = {})
      List.new resource(location, attributes).get(attributes)
    end
  end
end
