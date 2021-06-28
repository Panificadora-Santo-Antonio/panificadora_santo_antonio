Feature: sale
  As a usuario vendedor do sistema
  I want to  adicionar, remover, editar, e visualizar lista de vendas
  So that eu nao tenha que fazer isso manualmente


  Scenario: adicionar produto com quantidade vazia em venda
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    And eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    And eu preencho o campo nome com 'teste', preco com '1', quantidade com '1'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com ""
    And clico no botao adicionar produto a venda
    Then eu vejo uma mensagem que nao posso adicionar um produto com quantidade vazia a venda

 Scenario: adicionar produto em venda e finalizar venda
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    And eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    And eu preencho o campo nome com 'teste', preco com '1', quantidade com '1'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com ""
    And clico no botao adicionar produto a venda
    And clico finalizar venda
    Then eu vejo uma mensagem que a venda foi finalizada com sucesso


  Scenario: adicionar produto com quantidade maior que estoque em venda
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    And eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    And eu preencho o campo nome com 'testeCenario', preco com '1', quantidade com '1'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    And seleciono o produto 'testeCenario'
    When eu preencho o campo quantidade com "5"
    And clico no botao adicionar produto a venda
    Then eu vejo uma mensagem que nao posso adicionar um produto com quantidade que excede quantidade em estoque 

    Scenario: adicionar produto em falta em venda
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de novo cliente
    And eu crio um cliente com o name 'Joana' e o phone '87999226421' e o zip_code '55360000', city 'Caetes', district 'Centro', road 'Rua José Frazão', number: '25', complement: ''
    And eu clico em criar o cliente
    And eu estou na pagina de criacao de produto
    And eu preencho o campo nome com 'teste', preco com '1', quantidade com '0'
    And eu seleciono validade como "2022" "March" "2"
    And clico no botao create produto
    And eu estou na pagina de nova venda
    And eu clico em criar compra
    And eu clico adicionar produto
    When eu preencho o campo quantidade com "1"
    And clico no botao adicionar produto a venda
    Then eu vejo uma mensagem que nao posso adicionar um produto em falta no estoque