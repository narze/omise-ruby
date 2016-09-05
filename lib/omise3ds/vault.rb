require "omise3ds/config"

module Omise3ds
  module Vault
    private

    def resource_url
      Omise3ds.vault_url
    end

    def resource_key
      Omise3ds.vault_key
    end
  end
end
