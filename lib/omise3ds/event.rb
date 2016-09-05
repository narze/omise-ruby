require "omise3ds/object"
require "omise3ds/list"

module Omise3ds
  class Event < OmiseObject
    self.endpoint = "/events"

    def self.retrieve(id, attributes = {})
      new resource(location(id), attributes).get(attributes)
    end

    def self.list(attributes = {})
      List.new resource(location, attributes).get(attributes)
    end

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end
  end
end
