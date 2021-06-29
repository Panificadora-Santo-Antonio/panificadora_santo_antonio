Feature: busca vendas
  As a ADM do sistema
  I want to visualizar vendas por cliente
  So that eu nao tenha que fazer isso manualmente

  Scenario: realizar busca com campo em branco
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    When eu preencho o campo nome com 'teste', preco com '1', quantidade com '5'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com "2"
    And clico no botao adicionar produto a venda
    And clico finalizar venda
    And eu estou na pagina de busca
    And eu preencho o campo nome ou telefone com ""
    And eu clico no botao search
    Then eu vejo o cliente com nome 'Joana'

   Scenario: realizar busca pelo telefone
     Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
     And eu estou na pagina de novo cliente
     When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
     And eu clico em criar o cliente
     And eu estou na pagina de criacao de produto
     When eu preencho o campo nome com 'teste', preco com '1', quantidade com '5'
     And eu seleciono validade como "2022" "March" "2"
     And clico no botao create produto
     And eu estou na pagina de nova venda
     And eu clico em criar compra
     And eu clico adicionar produto
     When eu preencho o campo quantidade com "2"
     And clico no botao adicionar produto a venda
     And clico finalizar venda
     And eu estou na pagina de busca
     And eu preencho o campo nome ou telefone com "999226421"
     And eu clico no botao search
     Then eu vejo o cliente com nome 'Joana'

  Scenario:realizar busca pelo valor
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Pedro' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    When eu preencho o campo nome com 'teste', preco com '1', quantidade com '5'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com "2"
    And clico no botao adicionar produto a venda
    And clico finalizar venda
    And eu estou na pagina de busca
    And eu preencho o campo com valor "2"
    And eu clico no botao search
    Then eu vejo o cliente com nome 'Pedro'

  Scenario: realizar busca por data
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Pedro' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    When eu preencho o campo nome com 'teste', preco com '1', quantidade com '5'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com "2"
    And clico no botao adicionar produto a venda
    And clico finalizar venda
    And eu estou na pagina de busca
    And eu preencho o campo data de com "20/06/2021"
    And eu clico no botao search
    Then eu vejo o cliente com nome 'Pedro'

  Scenario: realizar busca com nome ou telefone nao existente
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    When eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    When eu preencho o campo nome com 'teste', preco com '1', quantidade com '5'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com "2"
    And clico no botao adicionar produto a venda
    And clico finalizar venda
    And eu estou na pagina de busca
    And eu preencho o campo nome ou telefone com "Jose"
    And eu clico no botao search
    Then eu vejo que a busca retornou "0" vendas
