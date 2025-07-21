# Portfólio de Qualidade e Automação | Esdra Wanessa

Bem‑vindo(a) ao meu portfólio! Aqui você encontrará uma visão geral dos projetos e testes que desenvolvi em **Quality Assurance (QA)**, automação de testes e desenvolvimento de bots.

---

## Índice

1. [Bot Telegram](#bot-telegram)
2. [Teste Prático — Fluxo de Compra](#teste-prático—fluxo-de-compra)
3. [Cenários de Teste — Gherkin](#cenários-de-teste—gherkin)
4. [Documentação de API](#documentação-de-api)
5. [Autor](#autor)

---

## Bot Telegram

### Descrição

Cliente do **Telegram** criado em **Python** para enviar mensagens diretas (DM) aos usuários de grupos. Totalmente personalizável conforme a necessidade do projeto.

### Tecnologias & Ferramentas

* **Python 3.10**
* Biblioteca de interação com Telegram (ex.: `telethon` ou `python-telegram-bot`)
* **VS Code** como IDE

### Como Executar

```bash
# clone o repositório

# instale as dependências
pip install -r requirements.txt

# configure suas variáveis de ambiente (API_ID, API_HASH, etc.)

# execute o bot
python bot.py
```

---

## Teste Prático: Fluxo de Compra

Fluxo criado para avaliação técnica utilizando **Robot Framework**. O objetivo é validar o processo completo de compra no site [Sauce Demo](https://www.saucedemo.com/).

### Validações Implementadas

1. **Adicionar produto ao carrinho**
2. **Acessar o carrinho e ir para o checkout**
3. **Preencher dados e finalizar a compra**

### Estrutura do Projeto

```
tests/
├── resources/
│   └── keywords.robot
├── suites/
│   └── fluxo_compra.robot
└── requirements.txt
```

### Executando os Testes

```bash
# instale Robot Framework
pip install robotframework seleniumlibrary

# (opcional) baixe o WebDriver compatível com seu navegador

# execute a suíte
obot -d reports tests/suites/fluxo_compra.robot
```

Casos de teste de **API** complementares estão anexados em PDF na pasta `api-tests/`.

---

## Cenários de Teste — Gherkin

Conjunto de cenários escritos em **Gherkin** para validar um fluxo de compra em outro site.

Exemplo:

```gherkin
Feature: Compra de Produto
  Scenario: Usuário finaliza compra com sucesso
    Given que o usuário está logado
    When adiciona um produto ao carrinho
    And navega até o checkout
    Then o pedido é concluído com a mensagem "Thank you for your order!"
```

Os arquivos `.feature` estão em `gherkin-scenarios/` e podem ser executados com **Cucumber**, **Behave** ou similares.

---

## Documentação de API

Testes realizados via **Postman** para o cliente **BNI de Angola (Positiva)**.

* **Documentação online:** [https://documenter.getpostman.com/view/24228642/2s8YmNRiak#a90339df-cb3b-491a-9e11-072093f0d39f](https://documenter.getpostman.com/view/24228642/2s8YmNRiak#a90339df-cb3b-491a-9e11-072093f0d39f)

obs: Como é uma documentação de um projeto para um cliente, deixo apenas para visualização. 

---

## Autor

| ![Foto](https://avatars.githubusercontent.com/u/0000000) |
| -------------------------------------------------------- |
| **Esdra Wanessa**                                        |
| QA Analyst • Test Automation • Python Learner            |

Entre em contato:

* [LinkedIn](https://www.linkedin.com/in/esdrawanessa)
* [GitHub](https://github.com/Esdrawane)
* Email: [Esdra.wanessa.08@gmail.com]

---

