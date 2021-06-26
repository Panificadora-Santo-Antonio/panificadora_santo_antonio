Given ('eu estou na pagina de new produto') do
    visit new_produto_path
end

When ('eu preencho o campo nome com {string}, descricao com {string}, preco com {string}, quantidade com {string}, valor total {string}')do |nome,descricao, preco, quantidade, total|
    fill_in 'nome', :with => nome
    fill_in 'descricao', :with => descricao
    fill_in 'preco', :with => preco
    fill_in 'quantiProduto', :with => quantidade
    fill_in 'valorTotalEstoque', :with => total
end

When ('eu coloco validade como {string} {string} {string}') do |year, month, day|
    select(year,   :from => 'produto_validade_1i')
    select(month,  :from => 'produto_validade_2i')
    select(day,    :from => 'produto_validade_3i')
end

Then ('eu vejo mensagem que foi criado com sucesso') do
    expect(page).to have_content("Produto was successfully created")
end

When('eu vou para pagina de edicao de estoque') do
    click_link 'Edit'
end

When ('eu preencho o campo quantidade com {string}')do |quantidade|
    fill_in 'quantiProduto', :with => quantidade
end

When('clico em update produto')do
    click_button 'submit'
end

Then('eu vejo mensagem que foi atualizado com sucesso')do
    expect(page).to have_content("Produto was successfully updated")
end

Then ('eu vejo mensagem insira um numero') do
    expect(page).to have_content("insira um numero")
end

Then ('eu vejo mensagem que quantidade de estoque do produto nao pode ficar em branco') do
    expect(page).to have_content("Estoque quantidadeproduto can't be blank")
end

Then ('eu vejo mensagem que quantidade de estoque do produto deve ser maior ou igual a 1') do
    expect(page).to have_content("Estoque quantidadeproduto must be greater than or equal to 1")
end

Then ('eu vejo mensagem que valor de estoque do produto nao pode ficar em branco') do
    expect(page).to have_content("valortotalestoque can't be blank")
end
