*** Settings ***
Documentation        Essa suíte executa testes no site Youtube.com
Resource             youtube_resources.robot
Test Setup           Abrir o navegador
Test Teardown        Fechar o navegador


*** Test Cases ***

Caso de Testes 01 - Reproduzir o primeiro vídeo da lista
    [Documentation]    Esse teste busca e reproduz o primeiro vídeo listado
    [Tags]             video    pesquisarVideo    reproduzVideo

    DADO que o usuário acessa a homepage do YouTube
    QUANDO clica na barra de pesquisas
    E escreve "Robot Framework"
    E clica no botão de busca
    ENTÃO o primeiro vídeo da lista é clicado