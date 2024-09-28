*** Settings ***
Documentation  Validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser
Resource   ../PageObjects/resources.robot


*** Variables ***
${browserurl}  http://rahulshettyacademy.com/loginpagePractise/
${errorMsgLocator}  css:.alert-danger
${errorMessageLogin}   Incorrect username/password.
*** Test Cases ***
Validate Unssuccessful login
   open the browser with the mortage payment url
   fill the login form
   wait until it checks and display error message
   verify error message is correct

*** Keywords ***
open the browser with the mortage payment url
     Open Browser    ${browserurl}   Edge
     Sleep    2

fill the login form
     Input Text    id:username    saifeddine.kchich@gmail.com
     Input Text    id:password    12345
     Click Button    signInBtn
     
wait until it checks and display error message
     Wait Until Element Is Visible    ${errorMsgLocator}
     
verify error message is correct

     #${result}=   Get Text       ${errorMsgLocator}
     #Should Be Equal As Strings    ${result}    ${errorMessageLogin}
     Element Text Should Be    ${errorMsgLocator}    ${errorMessageLogin}


     
     