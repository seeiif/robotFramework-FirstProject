*** Settings ***
Documentation  Validate the login form
Library  SeleniumLibrary
Library  String
Library    Collections
Test Setup   open the browser with the mortage payment url
Test Teardown   Close Browser Session
Resource   ../PageObjects/resources.robot


*** Variables ***

${errorMsgLocator}  css:.alert-danger

*** Test Cases ***
Validate child window functionality
     Select the link of child window
     Verify the user is switched to child window
     Grab the email id in the child window
     Switch to parent window and enter the email

*** Keywords ***
Select the link of child window
      Click Element    css=.blinkingText
      Sleep    5

Verify the user is switched to child window
      Switch Window  NEW
      Element Text Should Be    css=h1    DOCUMENTS REQUEST

Grab the email id in the child window
      ${GetText}=  Get Text    css=.red
      @{words}=  Split String    ${GetText}     at
      ${textSplit}=  Get From List     ${words}    1
      Log   ${textSplit}
      @{words2}=  Split String    ${textSplit}
      ${email}=  Get From List     ${words2}    0
      Set Global Variable    ${email}
      Log   ${email}

Switch to parent window and enter the email
      Switch Window   MAIN
      Title Should Be    LoginPage Practise | Rahul Shetty Academy
      Input Text    id=username    ${email}