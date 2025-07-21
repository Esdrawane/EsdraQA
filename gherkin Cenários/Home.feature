Feature: Exibição de elementos na tela Home

  Scenario: Exibir logo, carrinho de compras e catálogo de filmes na tela Home
    Given que o usuário acessa a tela Home
    When a tela Home é carregada
    Then o sistema exibe a logo no canto superior esquerdo
    And o sistema exibe o ícone do carrinho de compras no canto superior direito
    And o sistema exibe o catálogo de filmes na tela principal

Feature: Tela Home

  Scenario: Responsividade da tela Home em diferentes dispositivos
    Given que o usuário acessa a tela Home em um dispositivo móvel
    When o sistema carrega a tela Home
    Then o sistema ajusta o layout da tela Home para uma visualização otimizada no dispositivo móvel
    And todos os elementos são exibidos corretamente no tamanho da tela do dispositivo

Feature: Tela Home

  Scenario: Carregar a tela Home com uma conexão de internet lenta
    Given que o usuário está com uma conexão de internet lenta
    When o usuário acessa a tela Home
    Then o sistema exibe um indicador de carregamento
    And o conteúdo da tela Home é carregado gradualmente à medida que a conexão permite
    And o sistema exibe uma mensagem "Carregando" enquanto o conteúdo ainda não foi completamente carregado