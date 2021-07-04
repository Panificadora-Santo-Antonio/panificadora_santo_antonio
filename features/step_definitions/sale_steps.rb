Given ('eu estou na pagina de nova venda') do
    visit new_sale_path
end

Given ('eu clico em criar compra') do
    click_button 'commit'
end

Given ('eu clico adicionar produto') do
    click_link("AddProduct")
end

When ('eu preencho o campo quantidade com {string}') do |quantidade|
    fill_in 'product_sale[quantity]', :with => quantidade
end

When ('clico no botao adicionar produto a venda') do
    click_button 'commit'
end

Then ('eu vejo uma mensagem que nao posso adicionar um produto com quantidade vazia a venda') do
    expect(page).to have_content("Quantidade do produto deve ser preenchida.")
end

When ('clico finalizar venda') do
    click_link("FinalizeSale")
end

Then ('eu vejo uma mensagem que a venda foi finalizada com sucesso') do
    expect(page).to have_content("Venda finalizada com sucesso.")
end

Given ('seleciono o produto {string}') do |nome_produto|
    select(nome_produto, :from => 'product_sale_produto_id')
end 

Then ('eu vejo uma mensagem que nao posso adicionar um produto com quantidade que excede quantidade em estoque') do
    expect(page).to have_content("Quantidade do produto excede quantidade em estoque.")
end

Then ('eu vejo uma mensagem que nao posso adicionar um produto em falta no estoque') do
    expect(page).to have_content("Produto em falta no estoque.")
end

Then ('eu vejo que o produto {string} foi adicionado a venda') do |nome_produto|
    expect(page).to have_content(nome_produto)
end
