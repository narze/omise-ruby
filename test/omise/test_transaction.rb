require "support"

class TestTransaction < Omise3ds::Test
  setup do
    @transaction = Omise3ds::Transaction.retrieve("trxn_test_4yq7duwb9jts1vxgqua")
  end

  def test_that_we_can_retrieve_a_transaction
    assert_instance_of Omise3ds::Transaction, @transaction
    assert_equal "trxn_test_4yq7duwb9jts1vxgqua", @transaction.id
  end

  def test_that_we_can_list_all_transaction
    transactions = Omise3ds::Transaction.list

    assert_instance_of Omise3ds::List, transactions
  end
end
