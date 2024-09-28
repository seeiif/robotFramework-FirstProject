*** Settings ***
Documentation  Validate the login form
Library  DataDriver   ../tests/resources/data.csv    encoding=utf-8  dialect=unix
Library  SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Unsuccessful login

*** Variables ***
${browserurl}         http://rahulshettyacademy.com/loginpagePractise/
${errorMsgLocator}    css:.alert-danger
${errorMessageLogin}  Incorrect username/password.
${BROWSER}            edge

*** Test Cases ***
Login with user ${username} and password ${password}   ngtg   1254

*** Keywords ***
Validate Unsuccessful login
    [Arguments]    ${username}    ${password}
    Open the browser with the login page URL
    Fill the login form    ${username}    ${password}
    Wait until the error message is displayed
    Verify error message is correct

Open the browser with the login page URL
    Open Browser    ${browserurl}    ${BROWSER}
    Sleep    2

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Text    id:password    ${password}
    Click Button    id:signInBtn

Wait until the error message is displayed
    Wait Until Element Is Visible    ${errorMsgLocator}

Verify error message is correct
    Element Text Should Be    ${errorMsgLocator}    ${errorMessageLogin}
