Feature: Realizar Compra

  Scenario: Finalizar a compra com itens no carrinho
    Given que o usuário está na tela do carrinho
    And o carrinho contém "Homem Aranha" e "Shang-Chi"
    And o valor total do carrinho é "R$ 69,89"
    When o usuário clica no botão "Finalizar Pedido"
    Then o sistema solicita informações de pagamento e envio
    And o usuário preenche as informações necessárias e confirma a compra
    Then o sistema exibe uma mensagem de confirmação "Compra realizada com sucesso"
    And o sistema envia um e-mail de confirmação de compra para o usuário

Feature: Realizar Compra

  Scenario: Aplicar um cupom de desconto durante a compra
    Given que o usuário está na tela do carrinho
    And o carrinho contém "Aventura" e "Comédia"
    And o valor total do carrinho é "R$ 50,00"
    When o usuário insere o cupom de desconto "PROMO10"
    And o sistema aplica um desconto de 10% no valor total
    And o usuário clica no botão "Finalizar Compra"
    Then o sistema solicita informações de pagamento e envio
    And o usuário preenche as informações necessárias e confirma a compra
    Then o sistema exibe uma mensagem de confirmação "Compra realizada com sucesso com desconto aplicado"
    And o sistema envia um e-mail de confirmação de compra para o usuário

- talvez excluir 
Feature: Realizar Compra

  Scenario: Cancelar a compra antes de finalizar
    Given que o usuário está na tela do carrinho
    And o carrinho contém "Homem Aranha" e "Shang-Chi"
    When o usuário clica no botão "Cancelar Compra"
    Then o sistema remove os itens do carrinho e retorna à tela inicial
    And o sistema exibe uma mensagem "Compra cancelada. Itens removidos do carrinho"


Feature: Realizar Compra

  Scenario: Voltar para a tela Home após a compra realizada
    Given que o usuário completou uma compra com sucesso
    And o sistema exibe a tela de "Compra Realizada com sucesso"
    When o usuário clica no botão "Voltar para a Tela Home"
    Then o sistema redireciona o usuário para a tela Home
    And a tela Home é exibida corretamente com as opções e informações esperadas

Feature: Realizar Compra

  Scenario: Falha ao confirmar pagamento
    Given que o usuário está na tela de finalização de compra
    And o carrinho contém filmes no valor total de "R$ 69,89"
    When o usuário preenche as informações de pagamento e clica em "Finalizar Compra"
    Then o sistema tenta processar o pagamento
    And o sistema exibe a mensagem "Falha no processamento do pagamento. Tente novamente."
    And a compra não é finalizada