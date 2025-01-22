*** Settings ***
Documentation    Testes usando a biblioteca Selenium
Library          SeleniumLibrary


*** Variables ***
${URL}                https://www.youtube.com
${BARRA_PESQUISA}     //form[contains(@class,'ytSearchboxComponentSearchForm')]
${BTN_PESQUISAR}      //button[contains(@aria-label,'Search')]
${PRIMEIRO_VIDEO}     (//yt-formatted-string[@class='style-scope ytd-video-renderer'])[1]


*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

DADO que o usuário acessa a homepage do ${HOMEPAGE}
    Go To    url=${URL}
    Title Should Be    title=${HOMEPAGE}
    # Capture Page Screenshot    filename=./YouTubeTestes/screenshots/youtube_test-{index}.png

QUANDO clica na barra de pesquisas
    Wait Until Element Is Visible    locator=${BARRA_PESQUISA}    timeout=10s
    Click Element    locator=${BARRA_PESQUISA}

E escreve "${TÍTULO}"
    Input Text    locator=//input[@aria-autocomplete='list']    text=${TÍTULO}
    # Capture Page Screenshot    filename=./YouTubeTestes/screenshots/youtube_test-{index}.png

E clica no botão de busca
    Wait Until Element Is Visible    locator=${BTN_PESQUISAR}    timeout=10s
    Click Element    locator=${BTN_PESQUISAR}

ENTÃO o primeiro vídeo da lista é clicado
    Wait Until Element Is Visible    locator=${PRIMEIRO_VIDEO}
    Click Element     locator=${PRIMEIRO_VIDEO}
    # Capture Page Screenshot    filename=./YouTubeTestes/screenshots/youtube_test-{index}.png
    Sleep    10s    #Apenas para verificar se o vídeo está sendo clicado