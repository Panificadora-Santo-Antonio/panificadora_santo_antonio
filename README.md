# Panificadora Santo Antonio

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/5777418b047c49e7a231e887274a7105)](https://app.codacy.com/gh/Panificadora-Santo-Antonio/panificadora_santo_antonio?utm_source=github.com&utm_medium=referral&utm_content=Panificadora-Santo-Antonio/panificadora_santo_antonio&utm_campaign=Badge_Grade_Settings)

## Desenvolvido por

![Allysson G. S. S.](https://github.com/Allysson042) |  ![Hermyson C. M. O.](https://github.com/Hermyson) |  ![Laisy C. F. S.](https://github.com/laisy)

## Projeto de Engenharia de Software - 2020.1

Implementação de um software para a disciplina de Engenharia de Software, no curso de Ciência da Computação na Universidade Federal do Agreste de Pernambuco - UFAPE. Estruturas desenvolvidas conforme orientação de Prof. Dr. Rodrigo Cardoso Amaral de Andrade.

## Sobre o projeto

### Descrição do projeto

Nosso cliente é o proprietário de uma panificadora (Panificadora Santo Antônio), a princípio, ele precisa de um sistema para ter um melhor controle dos produtos vendidos e do estoque do seu estabelecimento. Ele nos pede um sistema onde o usuário terá a acesso através de um login e senha autenticada, o usuário do tipo funcionário poderá adicionar, remover e alterar os produtos em estoque, e também irá poder salvar as informações das vendas de produtos, como: lista de produtos e o valor total da venda. O usuário do tipo administrador poderá ter acesso a todas as informações do sistema, como o controle de estoque e visualizar os valores de entrada do caixa em determinado período de tempo.

### Características do projeto


Produto: nome, descrição, Preço, validade
Estoque: quantidadeProduto, ValorTotalEstoque, id_Produto
ProdutoVenda: id_Produto, quantidade, preçoTotal
Venda: listaProdutos, ValorTotal, data


- Conta de Usuario com autenticação de Login e Senha
- Usuario com cargo: Administrador e Funcionário
- Usuario tipo Adm tem acesso a todo sistema
- Usuario tipo Funcionário tem restrições como:
	- não pode criar outros usuários
	- não tem acesso a prestação de contas, como valores recebidos
- Produtos de Clientes
- Controle de estoque
- Controle de vendas

## URL heroku
