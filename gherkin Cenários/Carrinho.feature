Feature: Adicionar ao Carrinho

  Scenario: Adicionar um filme ao carrinho
    Given que o usuário está na tela de detalhes do filme "Homem Aranha"
    When o usuário clica no botão "Adicionar ao Carrinho"
    Then o sistema adiciona "Homem Aranha" ao carrinho
    And o sistema exibe uma mensagem de confirmação "Item adicionado ao carrinho"


Feature: Adicionar ao Carrinho

  Scenario: Adicionar um filme ao carrinho e verificar o conteúdo
    Given que o usuário está na tela de detalhes do filme "Homem Aranha"
    When o usuário clica no botão "Adicionar ao Carrinho"
    And o usuário navega para a tela do carrinho
    Then o carrinho exibe "Homem Aranha" como um dos itens
    
Feature: Adicionar ao Carrinho

  Scenario: Mostrar o valor total dos filmes adicionados ao carrinho
    Given que o usuário está na tela de detalhes do filme "Homem Aranha"
    And o filme "Homem Aranha" tem o preço de "R$ 29,99"
    When o usuário clica no botão "Adicionar ao Carrinho"
    And o usuário está na tela de detalhes do filme "Shang-Chi"
    And o filme "Shang-Chi" tem o preço de "R$ 39,90"
    When o usuário clica no botão "Adicionar ao Carrinho"
    And o usuário navega para a tela do carrinho
    Then o sistema exibe o valor total dos filmes no carrinho como "R$ 69,89"

Feature: Gerenciar Itens no Carrinho

  Scenario: Excluir um item do carrinho
    Given que o usuário está na tela do carrinho
    And o carrinho contém "Homem Aranha" e "Shang-Chi"
    When o usuário clica no botão "Excluir" ao lado do filme "Homem Aranha"
    Then o sistema remove "Homem Aranha" do carrinho
    And o sistema exibe uma mensagem de confirmação "Item removido do carrinho"
    And o carrinho ainda contém "Shang-Chi"

Feature: Tela de Carrinho Vazia

  Scenario: Exibir a tela de carrinho vazio e opção de voltar para a tela Home
    Given que o usuário está na tela do carrinho
    And o carrinho está vazio
    When o usuário visualiza a tela de carrinho
    Then o sistema exibe uma mensagem "Parece que não há nada por aqui"
    And o sistema exibe uma opção para "Recarregar página"


Feature: Adicionar ao Carrinho

  Scenario: Adicionar múltiplos filmes ao carrinho
    Given que o usuário está na tela de detalhes do filme "Homem Aranha"
    When o usuário clica no botão "Adicionar ao Carrinho"
    And o usuário está na tela de detalhes do filme "Shang-Chi"
    And o usuário clica no botão "Adicionar ao Carrinho"
    Then o sistema adiciona "Homem Aranha" e "Shang-Chi" ao carrinho
    And o sistema exibe uma mensagem de confirmação para cada filme adicionado


Feature: Adicionar ao Carrinho

  Scenario: Alterar a quantidade de um filme no carrinho e atualizar subtotal e valor total
    Given que o usuário está na tela do carrinho
    And o carrinho contém 1 unidade do filme "Homem Aranha" com o preço de "R$ 29,99"
    When o usuário altera a quantidade para "2" unidades de "Homem Aranha"
    Then o sistema atualiza o subtotal para "R$ 59,98"
    And o sistema atualiza o valor total do carrinho automaticamente
    And o carrinho exibe a quantidade correta de "2" unidades de "Homem Aranha"


Feature: Adicionar ao Carrinho

  Scenario: Validar o valor total após alteração da quantidade de um filme no carrinho
    Given que o usuário está na tela do carrinho
    And o carrinho contém 1 unidade do filme "Homem Aranha" com o preço de "R$ 29,99"
    And o valor total do carrinho é "R$ 29,99"
    When o usuário altera a quantidade para "3" unidades de "Homem Aranha"
    Then o sistema atualiza o subtotal do filme para "R$ 89,97"
    And o sistema atualiza o valor total do carrinho para "R$ 89,97"
    And o carrinho exibe a quantidade correta de "3" unidades de "Homem Aranha"


- não irei inserir
Feature: Adicionar ao Carrinho

  Scenario: Tentar adicionar um filme indisponível ao carrinho
    Given que o usuário está na tela de detalhes do filme "Aventura"
    And "Aventura" está indisponível para compra
    When o usuário clica no botão "Adicionar ao Carrinho"
    Then o sistema exibe uma mensagem informando que o filme não está disponível para compra