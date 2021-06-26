require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "new customer without valid nome" do
    customer = Customer.new(name:'', phone: 87996226421)
    assert_not customer.save
    end

  test "new customer" do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    end

  test "update name customer" do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    assert Customer.update(name:'Lucia Maria')
    end
  
end
