*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://seu-site.com/login
${BROWSER}    chrome
${USERNAME}   seu-usuario
${PASSWORD}   sua-senha
${DASHBOARD}  id=dashboard  # Altere conforme o seu sistema

*** Test Cases ***
Login Com Sucesso
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    css=.login-button
    Wait Until Element Is Visible    ${DASHBOARD}    10s
    Title Should Be    Dashboard
    Close Browser

Login Com Credenciais Invalidas
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=username    usuario-errado
    Input Text    name=password    senha-errada
    Click Button    css=.login-button
    Wait Until Element Is Visible    css=.error-message    10s
    Element Should Contain    css=.error-message    Credenciais inválidas
    Close Browser
