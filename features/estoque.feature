#Estoque
Feature: Estoque
  As a usuario do sistema
  I want to adicionar, visualizar e remover quantidade de produto do estoque
  So that eu possa usar o sistema corretamente

  Scenario: criar estoque com quantidade validas
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de new produto
    When eu preencho o campo nome com 'pão', descricao com 'pão doce', preco com '0.50', quantidade com '10', valor total '10' 
    And eu coloco validade como "2021" "July" "15"
    And clico no botao create produto
    Then eu vejo mensagem que foi criado com sucesso

  Scenario: editar quantidade estoque
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de new produto
    When eu preencho o campo nome com 'pão', descricao com 'pão doce', preco com '0.50', quantidade com '10', valor total '10' 
    And eu coloco validade como "2021" "July" "15"
    And clico no botao create produto
    And eu vou para pagina de edicao de estoque
    When eu preencho o campo quantidade com '50'
    And clico em update produto
    Then eu vejo mensagem que foi atualizado com sucesso

  Scenario: criar estoque com valor vazio
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456' 
    And eu estou na pagina de new produto
    When eu preencho o campo nome com 'pão', descricao com 'pão doce', preco com '0.50', quantidade com '11', valor total ' ' 
    And eu coloco validade como "2021" "July" "15"
    And clico no botao create produto
    Then eu vejo mensagem que valor de estoque do produto nao pode ficar em branco

  Scenario: criar estoque com quantidade vazia
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de new produto
    When eu preencho o campo nome com 'pão', descricao com 'pão doce', preco com '0.50', quantidade com '', valor total '10' 
    And eu coloco validade como "2021" "July" "15"
    And clico no botao create produto
    Then eu vejo mensagem que quantidade de estoque do produto nao pode ficar em branco

  Scenario: criar estoque com quantidade negativa
    Given estou logada no sistema com email 'admin@admin.com' e senha '123456'
    And eu estou na pagina de new produto
    When eu preencho o campo nome com 'pão', descricao com 'pão doce', preco com '0.50', quantidade com '-10', valor total '10' 
    And eu coloco validade como "2021" "July" "15"
    And clico no botao create produto
    Then eu vejo mensagem que quantidade de estoque do produto deve ser maior ou igual a 1

