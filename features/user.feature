Feature: user
  As a usuario do sistema 
  I want to criar, remover, editar e atualização um usuario no sistema
  So that eu nao quero fazer isso manualmente

  Scenario: cadastrar um novo usuario corretamente
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo usuario
    When eu crio um usuario com o email 'maria@email.com' e a senha '123456' e a confirmação de senha '123456' e o nome 'Maria' e a role 'Seller'
    And eu clico em criar o usuario
    Then eu vejo uma mensagem de cadastro com sucesso

  Scenario: editar usuario corretamente
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo usuario
    When eu crio um usuario com o email 'maria@email.com' e a senha '123456' e a confirmação de senha '123456' e o nome 'Maria' e a role 'Seller'
    And eu clico em criar o usuario
    And eu estou na pagina de edicao de usuario de email 'maria@email.com'
    And eu edito um usuario com email 'maria@email.com' e a senha '123456' e a confirmação de senha '123456' e o nome 'Maria Joana' e a role 'Seller'
    And eu clico em atualizar o usuario
    Then eu vejo uma mensagem que o usuario foi atualizado com sucesso

  Scenario: cadastrar um novo usuario sem nome
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo usuario
    When eu crio um usuario com o email 'maria@email.com' e a senha '123456' e a confirmação de senha '123456' e o nome '' e a role 'Seller'
    And eu clico em criar o usuario
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um novo usuario com nome de um caracte 
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo usuario
    When eu crio um usuario com o email 'maria@email.com' e a senha '123456' e a confirmação de senha '123456' e o nome 'a' e a role 'Seller'
    And eu clico em criar o usuario
    Then eu vejo uma mensagem de erro de caracter minum allowed

  Scenario: cadastrar um novo usuario sem senha
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo usuario
    When eu crio um usuario com o email 'maria@email.com' e a senha '' e a confirmação de senha '' e o nome 'Maria' e a role 'Seller'
    And eu clico em criar o usuario
    Then eu vejo uma mensagem de erro de senha nao pode ser vazia