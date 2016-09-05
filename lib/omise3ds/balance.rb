require "omise3ds/object"

module Omise3ds
  class Balance < OmiseObject
    self.endpoint = "/balance"
    singleton!
  end
end
