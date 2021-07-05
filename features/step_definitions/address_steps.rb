Then ('eu vejo uma mensagem de erro cep nao pode ser vazio') do
  expect(page).to have_content("Address zip code can't be blank")
end

Then ('eu vejo uma mensagem de erro no tamanho do cep') do
  expect(page).to have_content("Address zip code is the wrong length (should be 8 characters)")
end

Then ('eu vejo uma mensagem que o numero de caracters do bairro esta incorreto') do
  expect(page).to have_content("Address district 3 caracteres é o mínimo permitido")
end

Then ('eu vejo uma mensagem de erro que cidade nao deve ser vazio') do
  expect(page).to have_content("Address city can't be blank")
end

Then ('eu vejo uma mensagem que campo rua nao deve ser vazio') do
  expect(page).to have_content("Address road can't be blank")
end