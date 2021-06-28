Feature: Address
  As a usuario do sistema 
  I want to criar, remover, editar e atualizar um endereco no sistema
  So that eu nao quero fazer isso manualmente

  Scenario: criar um novo endereco sem o cep 
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    Then eu vejo uma mensagem de erro cep nao pode ser vazio
  
  Scenario: criar um novo endereco com tamanho de cep incorreto
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '12', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    Then eu vejo uma mensagem de erro no tamanho do cep

  Scenario: criar um novo endereco sem a cidade
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city '', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    Then eu vejo uma mensagem de erro que cidade nao deve ser vazio

  Scenario: editar um endereco com o bairro com menos de 3 caracters
      Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
      And eu estou na pagina de novo cliente
      When eu crio um cliente com o name 'Mariana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em criar o cliente
      And eu estou na pagina de edicao de cliente
      When eu edito um cliente com o name 'Mariana Soares' e o phone '' e o zip_code '55360000', city 'Caetes', district 'A', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em atualizar o cliente
      Then eu vejo uma mensagem que o numero de caracters do bairro esta incorreto

   Scenario: criar um novo endereco sem o nome da rua
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road '', number: '25', complement: ''
    And eu clico em criar o cliente
    Then eu vejo uma mensagem que campo rua nao deve ser vazio