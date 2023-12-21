*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}                chrome
${URL}                    https://www.amazon.com.br/
${MENU_LIVROS}            //a[contains(.,'Livros')]
${HEADER_LIVROS}          //h2[contains(.,'Loja de Livros')]


*** Keywords ***
Abrir o navegador
    Open Browser   browser=${BROWSER}  options=add_experimental_option("detach", True)
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


# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Livros"
    Entrar no menu "Livros"

Então o título da página deve ficar "Livros | Amazon.com.br"
    Verificar se o título da página fica "Livros | Amazon.com.br"

E o texto "Loja de Livros" deve ser exibido na página
    Verificar se aparece a frase "Loja de Livros"
    
E a categoria "Lançamentos" deve ser exibida na página
    Verificar se aparece a categoria "Lançamentos"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"