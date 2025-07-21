Feature: Pesquisa na Tela Home

  Scenario: Realizar uma busca que faz uma requisição à API e exibe filmes disponíveis para o carrinho
    Given que o usuário está na tela Home
    When o usuário insere "Homem Aranha" na barra de pesquisa e clica no botão de pesquisa
    And o sistema faz uma requisição para buscar filmes relacionados a "Homem Aranha"
    Then o sistema exibe uma lista de filmes retornados pela API que podem ser adicionados ao carrinho
    And o sistema exibe uma mensagem informando que nenhum resultado foi encontrado, se a API não retornar filmes correspondentes

Feature: Pesquisa na Tela Home

  Scenario: Realizar uma busca com um termo vago
    Given que o usuário está na tela Home
    When o usuário insere "Ação" na barra de pesquisa e clica no botão de pesquisa
    Then o sistema exibe uma lista de filmes que contém "Ação" em qualquer parte do título

Feature: Pesquisa na Tela Home

  Scenario: Realizar uma busca com um termo que não retorna resultados
    Given que o usuário está na tela Home
    When o usuário insere "Zero" na barra de pesquisa e clica no botão de pesquisa
    Then o sistema exibe uma mensagem informando que nenhum resultado foi encontrado

Feature: Pesquisa na Tela Home

  Scenario: Realizar uma busca com sinônimos ou termos relacionados
    Given que o usuário está na tela Home
    When o usuário insere "Co" na barra de pesquisa e clica no botão de pesquisa
    Then o sistema exibe uma lista de filmes que também pode incluir filmes relacionados ao termo "Sci-Fi", como "Comédia"

-talvez exclua
Feature: Pesquisa na Tela Home

  Scenario: Validar o recurso de autocompletar na barra de pesquisa
    Given que o usuário está na tela Home
    When o usuário começa a digitar "Action" na barra de pesquisa
    Then o sistema sugere opções relacionadas como "Action Movies", "Action Adventure", e "Action Comedy"

