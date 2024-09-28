*** Settings ***
Documentation  Validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Unssuccessful login


*** Variables ***
${browserurl}  http://rahulshettyacademy.com/loginpagePractise/
${errorMsgLocator}  css:.alert-danger
${errorMessageLogin}   Incorrect username/password.

*** Test Cases ***   username   password
Invalid username  dash   learning
Invalid password  rahulshetty  122545
special characters  @#//   learning


*** Keywords ***
Validate Unssuccessful login
     [Arguments]   ${username}    ${password}
     open the browser with the mortage payment url
     fill the login form   ${username}    ${password}
     wait until it checks and display error message
     verify error message is correct

open the browser with the mortage payment url
     Open Browser    ${browserurl}   Edge
     Sleep    2

fill the login form
     [Arguments]   ${username}    ${password}
     Input Text    id:username    ${username}
     Input Text    id:password    ${password}
     Click Button    signInBtn
     
wait until it checks and display error message
     Wait Until Element Is Visible    ${errorMsgLocator}
     
verify error message is correct

     #${result}=   Get Text       ${errorMsgLocator}
     #Should Be Equal As Strings    ${result}    ${errorMessageLogin}
     Element Text Should Be    ${errorMsgLocator}    ${errorMessageLogin}


     
     