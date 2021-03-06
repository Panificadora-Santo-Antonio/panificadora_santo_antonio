Feature: customer
  As a usuario do sistema 
  I want to criar, remover, editar e atualizar um cliente no sistema
  So that eu nao quero fazer isso manualmente

  Scenario: criar um novo cliente corretamente
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    Then eu vejo uma mensagem de cadastro de cliente com sucesso

  Scenario: criar um novo cliente sem nome
      Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
      And eu estou na pagina de novo cliente
      When eu crio um cliente com o name '' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em criar o cliente
      Then eu vejo uma mensagem de erro que nome nao pode ser vazio

  Scenario: criar um novo cliente com nome com um caracter
      Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
      And eu estou na pagina de novo cliente
      When eu crio um cliente com o name 'A' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em criar o cliente
      Then eu vejo uma mensagem de erro que nome tem que ter 3 caracters minimos

  Scenario: editar um novo cliente corretamente
      Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
      And eu estou na pagina de novo cliente
      When eu crio um cliente com o name 'Mariana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em criar o cliente
      And eu estou na pagina de edicao de cliente
      When eu edito um cliente com o name 'Mariana Soares' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em atualizar o cliente
      Then eu vejo uma mensagem que o cliente foi atualizado com sucesso
  
  Scenario: editar um novo cliente sem o telefone
      Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
      And eu estou na pagina de novo cliente
      When eu crio um cliente com o name 'Mariana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em criar o cliente
      And eu estou na pagina de edicao de cliente
      When eu edito um cliente com o name 'Mariana Soares' e o phone '' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
      And eu clico em atualizar o cliente
      Then eu vejo uma mensagem que o telefone nao pode ser vazio
  