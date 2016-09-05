require "support"

class TestTransfer < Omise3ds::Test
  setup do
    @transfer = Omise3ds::Transfer.retrieve("trsf_test_4yqacz8t3cbipcj766u")
  end

  def test_that_we_can_create_a_transfer
    transfer = Omise3ds::Transfer.create

    assert_instance_of Omise3ds::Transfer, @transfer
  end

  def test_that_we_can_retrieve_a_transfer
    assert_instance_of Omise3ds::Transfer, @transfer
    assert_equal "trsf_test_4yqacz8t3cbipcj766u", @transfer.id
  end

  def test_that_we_can_update_a_transfer
    @transfer.update(amount: 192189)

    assert_equal 192189, @transfer.amount
  end

  def test_that_we_can_destroy_a_transfer
    @transfer.destroy

    assert @transfer.deleted
    assert @transfer.destroyed?
  end

  def test_that_we_can_list_all_transfer
    transfers = Omise3ds::Transfer.list

    assert_instance_of Omise3ds::List, transfers
  end

  def test_that_a_transfer_has_a_recipient
    assert_instance_of Omise3ds::Recipient, @transfer.recipient
  end

  def test_that_a_transfer_has_a_bank_account
    assert_instance_of Omise3ds::BankAccount, @transfer.bank_account
  end
end
