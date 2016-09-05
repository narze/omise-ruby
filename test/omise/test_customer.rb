require "support"

class TestCustomer < Omise3ds::Test
  setup do
    @customer = Omise3ds::Customer.retrieve("cust_test_4yq6txdpfadhbaqnwp3")
  end

  def test_that_we_can_create_a_customer
    customer = Omise3ds::Customer.create

    assert_instance_of Omise3ds::Customer, customer
    assert_equal "cust_test_4yq6txdpfadhbaqnwp3", customer.id
  end

  def test_that_we_can_retrieve_a_customer
    assert_instance_of Omise3ds::Customer, @customer
    assert_equal "cust_test_4yq6txdpfadhbaqnwp3", @customer.id
  end

  def test_that_we_can_list_all_customer
    customers = Omise3ds::Customer.list

    assert_instance_of Omise3ds::List, customers
  end

  def test_that_we_can_update_a_customer
    @customer.update(email: "john.doe.the.second@example.com")

    assert_equal @customer.email, "john.doe.the.second@example.com"
  end

  def test_that_we_can_destroy_a_customer
    @customer.destroy

    assert @customer.deleted
    assert @customer.destroyed?
  end

  def test_that_we_can_reload_a_customer
    @customer.attributes.taint
    @customer.reload

    refute @customer.attributes.tainted?
  end

  def test_that_we_can_charge_a_customer
    charge = @customer.charge(amount: 100000, currency: "THB")

    assert_instance_of Omise3ds::Charge, charge
  end

  def test_that_retrieveing_a_non_existing_customer_will_raise_an_error
    assert_raises Omise3ds::Error do
      Omise3ds::Customer.retrieve("404")
    end
  end

  def test_that_a_customer_has_a_list_of_card
    assert_instance_of Omise3ds::CardList, @customer.cards
  end

  def test_that_a_customer_can_fetch_a_list_of_ordered_cards
    cards = @customer.cards(order: "chronological")
    assert_instance_of Omise3ds::CardList, cards
  end

  def test_that_a_customer_has_a_default_card
    assert_instance_of Omise3ds::Card, @customer.default_card
  end
end
