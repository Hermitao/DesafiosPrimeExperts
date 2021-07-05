*** Settings ***
Documentation       teste web, Caso de Teste 2.

Library             SeleniumLibrary
Library             String

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variable ***
${BROWSER}      firefox
${URL}          http://automationpractice.com
${PRODUTO}      ItemNãoExistente


*** Test Case ***  
Cenário: automatizar teste no Automation Practice
    [Tags]      TESTAR
    Abrir navegador
    Acessar Automation Practice
    Digitar pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "${PRODUTO}" foi listado
    Fechar navegador


*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    #Maximize Browser Window

Fechar navegador
    Close Browser

Acessar Automation Practice
    Go To       ${URL}
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul

Digitar pesquisa
    Input Text          name=search_query       ${PRODUTO}

Clicar no botão pesquisar 
    Click Element       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado
    Title Should Be     Search - My Store
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul
    Page Should Contain             No results were found 
