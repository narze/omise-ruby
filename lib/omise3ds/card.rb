require "omise3ds/object"

module Omise3ds
  class Card < OmiseObject
    self.endpoint = "/cards"

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end

    def update(attributes = {})
      assign_attributes resource(attributes).patch(attributes)
    end

    def destroy(attributes = {})
      assign_attributes resource(attributes).delete
    end
  end
end
