require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test 'should not save produto without attributes' do
    produto = Produto.new
    assert_not produto.save
  end

  test 'should save produto with valid nome, preco e validade' do
    produto = Produto.new(nome:"teste", descricao: "", preco:"1", validade:"2025-01-01",quantidade: '1')
    assert produto.save
  end

  test 'should save produto without valid nome' do
    produto = Produto.new(nome:"", preco:"1", descricao: "", validade:"2000-01-01", quantidade:'1')
    assert_not produto.save
  end
 


end
