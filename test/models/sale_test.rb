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
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    assert user.save
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    sale = Sale.new(totalValue: "0", customer_id: customer.id, user_id: user.id)
    assert sale.save
  end

  test 'should not save sale with totalValue < 0' do
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    assert user.save
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    sale = Sale.new(totalValue: "-1", customer_id: customer.id, user_id: user.id)
    assert_not sale.save
  end
end
