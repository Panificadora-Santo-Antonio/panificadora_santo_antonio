Given ('eu estou na pagina de novo cliente') do
  visit '/customers/new'
end

When("eu crio um cliente com o name {string} e o phone {string} e o zip_code {string}, city {string}, district {string}, road {string}, number: {string}, complement: {string}") do |name, phone, zip_code, city, district, road, number, complement|
  fill_in 'name', :with => name
  fill_in 'phone', :with => phone
  fill_in 'zip_code', :with => zip_code
  fill_in 'city', :with => city
  fill_in 'district', :with => district
  fill_in 'road', :with => road
  fill_in 'number', :with => number
  fill_in 'complement', :with => complement
end

And('eu clico em criar o cliente') do
  click_button 'Create Customer'
 end

Then ('eu vejo uma mensagem de cadastro de cliente com sucesso') do
  expect(page).to have_content("Customer was successfully created.")
end
Then ('eu vejo uma mensagem de erro que nome nao pode ser vazio') do
  expect(page).to have_content("Name can't be blank")
end
Then ('eu vejo uma mensagem de erro que nome tem que ter 3 caracters minimos') do
  expect(page).to have_content("Name 3 characters is the minimum allowed")
end
And('eu estou na pagina de edicao de cliente') do
  click_link 'Edit'
end

When("eu edito um cliente com o name {string} e o phone {string} e o zip_code {string}, city {string}, district {string}, road {string}, number: {string}, complement: {string}") do |name, phone, zip_code, city, district, road, number, complement|
  fill_in 'name', :with => name
  fill_in 'phone', :with => phone
  fill_in 'zip_code', :with => zip_code
  fill_in 'city', :with => city
  fill_in 'district', :with => district
  fill_in 'road', :with => road
  fill_in 'number', :with => number
  fill_in 'complement', :with => complement
end

And('eu clico em atualizar o cliente') do 
  click_button 'Update Customer'
end

Then ('eu vejo uma mensagem que o cliente foi atualizado com sucesso') do
  expect(page).to have_content("Customer was successfully updated.")
end

Then ('eu vejo uma mensagem que o telefone nao pode ser vazio') do
  expect(page).to have_content("Phone can't be blank")
end