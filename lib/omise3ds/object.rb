require "omise3ds/config"
require "omise3ds/attributes"
require "omise3ds/resource"

module Omise3ds
  class OmiseObject
    include Attributes

    class << self
      attr_accessor :endpoint

      def location(id = nil)
        [endpoint, id].compact.join("/")
      end

      def resource(path, attributes = {})
        key = attributes.delete(:key) { resource_key }
        preprocess_attributes!(attributes)
        Omise3ds.resource.new(resource_url, path, key)
      end

      private

      def collection
        self
      end

      def singleton!
        require "omise3ds/singleton_resource"
        include SingletonResource
      end

      def preprocess_attributes!(attributes)
        if attributes[:card].is_a?(Hash)
          require "omise3ds/token"
          card_attributes = attributes.delete(:card)
          attributes[:card] = Token.create(card: card_attributes).id
        end
      end

      def resource_url
        Omise3ds.api_url
      end

      def resource_key
        Omise3ds.api_key
      end
    end

    private

    def collection
      self.class
    end

    def resource(*args)
      collection.resource(location, *args)
    end

    def nested_resource(path, *args)
      collection.resource([location, path].compact.join("/"), *args)
    end
  end
end
