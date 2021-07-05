*** Settings ***
Documentation               Caso Teste 03, curso Prime Experts. Escrito por Vinicius Krieger Granemann.

Library                     AppiumLibrary

Test Setup                  Abrir o aplicativo
Test Teardown               Fechar o aplicativo


*** Test Case ***
Cenário: Pesquisar cursos do robot
    [Tags]      EXPL
    Dado que o cliente precisa selecionar a conta
    E seleciona a conta
    Dado que o cliente esteja na tela home
    E clique no botão Explore
    E deslize até o vídeo 10
    E clique no vídeo 10


*** Keywords ***
Abrir o aplicativo
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=uiautomator2
    ...                     platformName=Android
    ...                     deviceName=521012abeefbb4d7
    ...                     autoGrantPermissions=true
    ...                     appPackage=com.google.android.youtube
    ...                     appActivity=com.google.android.youtube.HomeActivity



Fechar o aplicativo
    Capture Page Screenshot
    Close Application

# caso o usuário tenha mais de uma conta e precise selecionar na tela home, que é o meu caso. Cada uma delas possui um accessibility_id que é igual ao nome registrado do usuário.
Dado que o cliente precisa selecionar a conta
    Wait Until Element Is Visible   accessibility_id=Vinicius Krieger Granemann

E seleciona a conta
    Click Element                   accessibility_id=Vinicius Krieger Granemann



Dado que o cliente esteja na tela home
    Wait Until Element Is Visible   accessibility_id=YouTube

E clique no botão Explore
    Click Element                   accessibility_id=Explore
    Wait Until Element Is Visible   xpath=(//android.view.ViewGroup[@content-desc="Trending"])[1]/android.widget.ImageView[1]

E deslize até o vídeo 10
    FOR     ${i}    IN RANGE    0   4   # pode ser que isso não funcione perfeitamente em todos os celulares, dependendo do tamanho dos elementos devido a resolução da tela.
        Swipe By Percent    50
        ...                 85 
        ...                 50 
        ...                 10
    END

E clique no vídeo 10
    # como os accessibility_id dos vídeos no Explore não são disponibilizados, optei para utilizar o xpath; isso significa que, se no momento do teste o vídeo
    # disponibilizado no YouTube não estiver nessa posição, o teste falhará. É necessário colocar o xpath correto antes do teste. Abaixo está o décimo item no
    # dia em que criei esse script. Outra opção seria clicar em uma posição específica da tela, mas ainda sofre com a imprevisibilidade de cada tela.
    Click Element                   xpath=//android.view.ViewGroup[@content-desc="Live Gazin - Movimento Pintando o 7 em prol da APAE - 03/07 às 19h - 5 hours, 10 minutes - Go to channel - Gazin Oficial - 122K views - Streamed 21 hours ago - play video"]/android.view.ViewGroup