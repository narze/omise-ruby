require "support"

class TestAccount < Omise3ds::Test
  setup do
    @account = Omise3ds::Account.retrieve
  end

  def test_that_we_can_retrieve_the_account
    assert_instance_of Omise3ds::Account, @account
    assert_equal "/account", @account.location
  end

  def test_that_we_can_reload_a_customer
    @account.attributes.taint
    @account.reload

    refute @account.attributes.tainted?
  end
end
