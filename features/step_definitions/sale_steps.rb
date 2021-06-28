Given ('eu estou na pagina de nova venda') do
    visit new_sale_path
end

Given ('eu clico em criar compra') do
    click_button 'commit'
end

Given ('eu clico adicionar produto') do
    click_link('Add Product')
end

When ('eu preencho o campo quantidade com {string}') do |quantidade|
    fill_in 'product_sale[quantity]', :with => quantidade
end

When ('clico no botao adicionar produto a venda') do
    click_button 'commit'
end

Then ('eu vejo uma mensagem que nao posso adicionar um produto com quantidade vazia a venda') do
    expect(page).to have_content("Quantity of products field must be filled.")
end

When ('clico finalizar venda') do
    click_link('Finalize Sale')
end

Then ('eu vejo uma mensagem que a venda foi finalizada com sucesso') do
    expect(page).to have_content("Sale was successfully finalized")
end

Given ('seleciono o produto {string}') do |nome_produto|
    select(nome_produto, :from => 'product_sale_produto_id')
end 

Then ('eu vejo uma mensagem que nao posso adicionar um produto com quantidade que excede quantidade em estoque') do
    expect(page).to have_content("Products quantity exceeds the quantity in stock")
end

Then ('eu vejo uma mensagem que nao posso adicionar um produto em falta no estoque') do
    expect(page).to have_content("Out of stock product")
end

