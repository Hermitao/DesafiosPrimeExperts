*** Settings ***
Documentation       teste web, Caso de Teste 3 - Listar Produtos.

Library             SeleniumLibrary
Library             String

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variable ***
${BROWSER}      firefox
${URL}          http://automationpractice.com


*** Test Case ***  
Cenário: Listar produtos
    [Tags]      TESTAR
    Acessar Automation Practice
    Passar mouse por cima da categoria Women
    Clicar em Summer Dresses
    Conferir se apareceram os produtos de Summer Dresses


*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser

Acessar Automation Practice
    Go To       ${URL}
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul

Passar mouse por cima da categoria Women
    Mouse Over      xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar em Summer Dresses
    Click Element       xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir se apareceram os produtos de Summer Dresses
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div[2]/div/div[3]/div[2]/div[2]/div[2]/form
    Page Should Contain             Summer Dress