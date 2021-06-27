require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save sale without totalValue and customer_id' do
    sale = Sale.new
    assert_not sale.save
  end

  test 'should save sale with totalValue and customer_id' do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    sale = Sale.new(customer_id:customer.id,totalValue:"0")
    assert sale.save
  end

  test 'should not save sale with totalValue < 0' do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    sale = Sale.new(customer_id:customer.id,totalValue:"-1")
    assert_not sale.save
  end
end
