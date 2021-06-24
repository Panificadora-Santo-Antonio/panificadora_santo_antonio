Feature: produtos
  As a usuario do sistema
  I want to adicionar, deletar e atualizar informações dos produtos
  So that tenha acesso as informações dos produtos no sistema


Scenario: adicionar produto com nome em branco
    Given acesso o sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de criacao de produto
    When eu preencho o campo nome com ''
    And clico no botao create produto
    Then eu vejo uma mensagem que nao posso criar um produto com nome vazio

Scenario: adicionar produto com validade invalida
  Given acesso o sistema com email 'admin@admin.com' e senha '123456'
  And eu estou na pagina de criacao de produto
  When eu seleciono validade como "2016" "March" "2"
  And clico no botao create produto
  Then eu vejo uma mensagem o campo validade esta invalida

Scenario: adicionar produto valido
  Given acesso o sistema com email 'admin@admin.com' e senha '123456'
  And eu estou na pagina de criacao de produto
  When eu preencho o campo nome com 'teste', preco com '1', quantidade com '1', valor total '1'
  And eu seleciono validade como "2022" "March" "2"
  And clico no botao create produto
  Then eu vejo uma mensagem que o produto foi criado com sucesso

Scenario: atualizar preco de produto
  Given acesso o sistema com email 'admin@admin.com' e senha '123456'
  And eu estou na pagina de criacao de produto
  When eu preencho o campo nome com 'teste2', preco com '1', quantidade com '1', valor total '1'
  And eu seleciono validade como "2022" "March" "2"
  And clico no botao create produto
  And eu vou para a pagina de edição do produto criado anteriormente
  When e preencho o campo preco para '99' 
  And clico no botao update produto
  Then eu vejo uma mensagem que o produto foi atualizado com sucesso


Scenario: atualizar nome de produto
  Given acesso o sistema com email 'admin@admin.com' e senha '123456'
  And eu estou na pagina de criacao de produto
  When eu preencho o campo nome com 'teste3', preco com '1', quantidade com '1', valor total '1'
  And eu seleciono validade como "2022" "March" "2"
  And clico no botao create produto
  And eu vou para a pagina de edição do produto criado anteriormente
  When eu preencho o campo nome com 'teste99' 
  And clico no botao update produto
  Then eu vejo uma mensagem que o produto foi atualizado com sucesso


