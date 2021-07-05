Given ('eu estou na pagina de criacao de produto') do
    visit new_produto_path
end

When ('eu preencho o campo nome com {string}') do |valorCampo|
    fill_in 'nome', :with => valorCampo
end

When ('clico no botao create produto') do
    click_button 'submit'
end

Then ('eu vejo uma mensagem que nao posso criar um produto com nome vazio') do
    expect(page).to have_content("Nome can't be blank")
end

When ('eu seleciono validade como {string} {string} {string}') do |year, month, day|
    select(year,   :from => 'produto_validade_1i')
    select(month,  :from => 'produto_validade_2i')
    select(day,    :from => 'produto_validade_3i')
  end

Then ('eu vejo uma mensagem o campo validade esta invalida') do
    expect(page).to have_content("Validade must be after")
end

When ('eu preencho o campo nome com {string}, preco com {string}, quantidade com {string}')do |nome, preco, quantidade|
    fill_in 'nome', :with => nome
    fill_in 'preco', :with => preco
    fill_in 'quantidade', :with => quantidade

end

Then ('eu vejo uma mensagem que o produto foi criado com sucesso') do
    expect(page).to have_content("Produto criado com sucesso")
end

When('eu vou para a pagina de edicao do produto criado anteriormente') do
    click_link 'Edit'
end

When ('e preencho o campo preco para {string}')do |preco|
    fill_in 'preco', :with => preco
end

When('clico no botao update produto')do
    click_button 'submit'
end

Then('eu vejo uma mensagem que o produto foi atualizado com sucesso')do
    expect(page).to have_content("Produto atualizado com sucesso")
end




