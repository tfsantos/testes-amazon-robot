*** Settings ***
Documentation    Esta suíte testa o site da amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Livros"
    [Documentation]  Este teste verifica o menu Livros do site da Amazon
    ...              e a categoria Livros em Oferta
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Livros | Amazon.com.br"  
    Verificar se aparece a categoria "Lançamentos"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]  Este teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "É Assim que Acaba" no campo de Pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa, listando o produto "É Assim que Acaba"
