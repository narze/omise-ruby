require "omise3ds/object"
require "omise3ds/vault"

module Omise3ds
  class Token < OmiseObject
    self.endpoint = "/tokens"

    extend Vault

    def self.retrieve(id, attributes = {})
      new resource(location(id), attributes).get(attributes)
    end

    def self.create(attributes = {})
      new resource(location, attributes).post(attributes)
    end

    def reload(attributes = {})
      assign_attributes resource(attributes).get(attributes)
    end

    def self.preprocess_attributes!(attributes)
      # noop
    end
  end
end
