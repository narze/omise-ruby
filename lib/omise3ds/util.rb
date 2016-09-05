require "json"

require "omise3ds/object"
require "omise3ds/error"

module Omise3ds
  module Util module_function
    def typecast(object)
      klass = begin
        klass_name = object["object"].split("_").map(&:capitalize).join("")
        Omise3ds.const_get(klass_name)
      rescue NameError
        OmiseObject
      end

      klass.new(object)
    end

    def load_response(response)
      object = JSON.load(response)
      raise Omise3ds::Error.new(object) if object["object"] == "error"
      object
    end
  end
end
