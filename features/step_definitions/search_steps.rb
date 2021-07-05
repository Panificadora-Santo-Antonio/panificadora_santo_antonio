Given ('eu estou na pagina de busca') do
  visit '/search'
end
When ('eu preencho o campo nome ou telefone com {string}') do |nome|
  fill_in 'name_or_phone', :with => nome
end
When ('eu preencho o campo com valor {string}') do |valor|
  fill_in 'value_of',:with => valor
end

When ('eu preencho o campo data de com {string}') do |data|
  fill_in "start_date", :with => data
end

When ('eu vejo que a busca retornou {string} vendas') do |vendas|
  expect(page).to have_content("Quantidade de Vendas: " + vendas)
end

Given('eu clico no botao search') do
  click_button 'Search'
end
Then ('eu vejo o cliente com nome {string}') do |nome_cliente|
  expect(page).to have_content (nome_cliente)

end