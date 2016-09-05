require "omise3ds/object"

module Omise3ds
  class Account < OmiseObject
    self.endpoint = "/account"
    singleton!
  end
end
