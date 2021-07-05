*** Settings ***
Documentation               Exercicio de variáveis, curso Prime Experts. Escrito por Vinicius Krieger Granemann.

Library     Collections

*** Test Case ***
Cenário: Imprimir lista
    [Tags]      LISTA
    Imprimir lista


*** Keywords ***
Imprimir lista
    ${Frutas}=      Create List  
    

    Append To List      ${Frutas}   Banana
    Append To List      ${Frutas}   Maçã  
    Append To List      ${Frutas}   Cereja  
    Append To List      ${Frutas}   Laranja   
    Append To List      ${Frutas}   Bergamota

    Log To Console  \n
    FOR     ${Fruta}    IN      @{FRUTAS}
        Log To Console      ${Fruta}
    END
    Log To Console  \n
