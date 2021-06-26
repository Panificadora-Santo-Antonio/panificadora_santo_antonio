require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test "new address" do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    address = Address.new(zip_code: 55360000, city: 'Caetes', district: 'Centro', road: 'Rua José Frazão', number: 25, complement: '', customer_id: customer.id)
    assert address.save
  end

  test "new address  without attributes" do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    address = Address.new()
    assert_not address.save
  end

  test "update complement address" do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    address = Address.new(zip_code: 55360000, city: 'Caetes', district: 'Centro', road: 'Rua José Frazão', number: 25, complement: '', customer_id: customer.id)
    assert address.save
    assert Address.update(zip_code: 55360000, city: 'Caetes', district: 'Centro', road: 'Rua José Frazão', number: 25, complement: 'Rua do samu', customer_id: customer.id)
  end

end
