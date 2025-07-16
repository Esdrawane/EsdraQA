*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${FIRSTNAME}      Esdra
${LASTNAME}       Wanessa
${ZIP}            12345

*** Test Cases ***
Fluxo Completo De Compra
    [Documentation]    Faz login, adiciona item ao carrinho e finaliza a compra
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    Login No Site
    Adicionar Produto Ao Carrinho
    Acessar Carrinho E Ir Para Checkout
    Preencher Dados E Finalizar Compra

    Close Browser

*** Keywords ***
Login No Site
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button  id=login-button
    Wait Until Element Is Visible    xpath=//span[text()="Products"]

Adicionar Produto Ao Carrinho
    Click Button    xpath=//div[text()="Sauce Labs Backpack"]/ancestor::div[contains(@class,"inventory_item")]//button[text()="Add to cart"]
    Wait Until Element Is Visible    xpath=//button[text()="Remove"]

Acessar Carrinho E Ir Para Checkout
    Click Element    id=shopping_cart_container
    Wait Until Page Contains Element    id=checkout
    Click Button    id=checkout
    Sleep    10s
    # Verifica se há popup com botão "OK"
    Run Keyword And Ignore Error    Esperar E Clicar Em Popup

Preencher Dados E Finalizar Compra
    Input Text    id=first-name    ${FIRSTNAME}
    Input Text    id=last-name     ${LASTNAME}
    Input Text    id=postal-code   ${ZIP}
    Click Button  id=continue
    Wait Until Page Contains Element    id=finish
    Click Button  id=finish
    Page Should Contain    Thank you for your order!

Esperar E Clicar Em Popup
    Wait Until Element Is Visible    xpath=//button[text()="OK"]    timeout=5s
    Click Button    xpath=//button[text()="OK"]
