Given('estou logada no sistema com email {string} e senha {string}') do |email, password|
    visit '/'
    visit '/my/users/sign_in'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Log in'
end

Given ('eu estou na pagina de novo usuario') do
  visit new_user_registration_path
end

When("eu crio um usuario com o email {string} e a senha {string} e a confirmacao de senha {string} e o nome {string} e a role {string}") do |email, senha, confirmacao_senha, nome, role|
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => confirmacao_senha
  fill_in 'user[name]', :with => nome
  select(role, :from => 'user[role]')
end

And('eu clico em criar o usuario') do
 click_button 'Sign up'
end

Then ('eu vejo uma mensagem de cadastro com sucesso') do
  expect(page).to have_content("Usuário foi criado com sucesso.")
end

And('eu estou na pagina de edicao de usuario de email {string}') do |email|
  click_link "EditUser"
end

When("eu edito um usuario com email {string} e a senha {string} e a confirmacao de senha {string} e o nome {string} e a role {string}") do |email, senha, confirmacao_senha, nome, role|
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => confirmacao_senha
  fill_in 'user[name]', :with => nome
end
And('eu clico em atualizar o usuario') do 
  click_button 'Update'
end
Then ('eu vejo uma mensagem que o usuario foi atualizado com sucesso') do
  expect(page).to have_content("Usuário foi atualizado com sucesso.")
end
Then ('eu vejo uma mensagem de erro') do
  expect(page).to have_content("Name can't be blank")
end
Then ('eu vejo uma mensagem de erro de minimo caracter alocado') do
  expect(page).to have_content("Name 3 caracteres é o mínimo permitido")
end
Then ('eu vejo uma mensagem de erro de senha nao pode ser vazia') do
  expect(page).to have_content("Password can't be blank")
end
