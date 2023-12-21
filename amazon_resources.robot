*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    https://www.amazon.com.br/
${MENU_LIVROS}            //a[contains(.,'Livros')]
${HEADER_LIVROS}          //h2[contains(.,'Loja de Livros')]


*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS} 

Verificar se o título da página fica "${TITULO}" 
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]
    
Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de Pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[contains(.,'${PRODUTO}')]