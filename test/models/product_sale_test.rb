require 'test_helper'

class ProductSaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save product_sale without attributes' do
    product_sale = ProductSale.new
    assert_not product_sale.save
  end

  test 'should save product_sale with attributes' do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    assert user.save
    sale = Sale.new(customer_id:customer.id,totalValue:"0", user_id: user.id)
    assert sale.save
    produto = Produto.new(nome:"teste", descricao: "", preco:"1", validade:"2025-01-01",quantidade: '1')
    assert produto.save
    product_sale = ProductSale.new(produto_id: produto.id, sale_id: sale.id, quantity: 1)
    assert product_sale.save
  end

  test 'should not save product_sale with quantity < 0' do
    customer = Customer.new(name:'Lucia', phone: 87996226421)
    assert customer.save
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    assert user.save
    sale = Sale.new(customer_id:customer.id,totalValue:"0", user_id: user.id)
    assert sale.save
    produto = Produto.new(nome:"teste", descricao: "", preco:"1", validade:"2025-01-01",quantidade: '1')
    assert produto.save
    product_sale = ProductSale.new(produto_id: produto.id, sale_id: sale.id, quantity: -1)
    assert_not product_sale.save
  end


end
