require 'test_helper'

class EstoqueTest < ActiveSupport::TestCase
  test "should save estoque" do
    produto = Produto.new nome: 'Pao', preco:'1',validade: '2022-July-15'
    assert produto.save
    estoque = Estoque.new quantidadeProduto: '2',valorTotalEstoque:'2',produto_id: produto.id
    assert estoque.save
  end

  test 'should edit quantidade estoque' do
    produto = Produto.new nome: 'Pao', preco:'1',validade: '2022-July-15'
    assert produto.save
    estoque = Estoque.new quantidadeProduto: '2',valorTotalEstoque:'2',produto_id: produto.id
    estoque.save
    assert estoque.update quantidadeProduto: '10'
  end

  test 'should not edit quantidade estoque violating format' do
    produto = Produto.new nome: 'Pao', preco:'1',validade: '2022-July-15'
    assert produto.save
    estoque = Estoque.new quantidadeProduto: '2',valorTotalEstoque:'2',produto_id: produto.id
    estoque.save
    assert_not estoque.update quantidadeProduto: '-10'
  end

end
