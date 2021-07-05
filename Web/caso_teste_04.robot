*** Settings ***
Documentation       teste web, Caso de Teste 4 - Adicionar Cliente.

Library             SeleniumLibrary
Library             String

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variable ***
${BROWSER}      firefox
${URL}          http://automationpractice.com


*** Test Case ***  
Cenário: Adicionar cliente
    [Tags]      TESTAR
    Acessar Automation Practice
    Clicar em Sign in
    Inserir e-mail
    Pressionar Create an account
    Preencher campos
    Conferir conta registrada com sucesso


*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window


Fechar navegador
    Close Browser

Acessar Automation Practice
    Go To       ${URL}
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div[1]/header/div[2]/div/div/nav/div[1]/a

Clicar em Sign in
    Click Element                       xpath=/html/body/div[1]/div[1]/header/div[2]/div/div/nav/div[1]/a

Inserir e-mail
    Click Element       xpath=//*[@id="email_create"]
    Input Text      xpath=//*[@id="email_create"]       batata1@gmail.com

Pressionar Create an account
    Click Element       xpath=html/body/div[1]/div[2]/div/div[3]/div/div/div[1]/form/div/div[3]/button/span

Preencher campos
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div[2]/div/div[3]/div/div/form/div[4]/button/span
    Wait Until Element Is Visible       xpath=//*[@id="address1"]
    Input Text      xpath=//*[@id="customer_firstname"]     Senhor
    Input Text      xpath=//*[@id="customer_lastname"]      Batata
    Input Text      xpath=//*[@id="passwd"]                 123456
    Input Text      xpath=//*[@id="address1"]               Rua Aleatória 1845
    Execute Javascript      window.scrollTo(0, 900)
    Input Text      xpath=//*[@id="city"]                   Cidade Aleatória
    Select From List By Index       xpath=//*[@id="id_country"]     1
    Input Text      xpath=//*[@id="postcode"]               13275
    Input Text      xpath=//*[@id="phone_mobile"]           989498848
    Click Element   xpath=/html/body/div[1]/div[2]/div/div[3]/div/div/form/div[4]/button/span

Conferir conta registrada com sucesso
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div[2]/div/div[3]/div/h1
    Title Should Be         My account - My Store