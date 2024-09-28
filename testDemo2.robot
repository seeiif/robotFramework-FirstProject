*** Settings ***
Documentation  Validate the login form
Library  SeleniumLibrary
Library   Collections
Library    Collections
Test Setup   open the browser with the mortage payment url
Test Teardown   Close Browser Session
Resource   ../PageObjects/resources.robot


*** Variables ***
${errorMsgLocator}  css:.alert-danger
${homePageLoad}  css=.nav-link
${errorMessageLogin}   Incorrect username/password.
*** Test Cases ***
Validate Unssuccessful login
   [Tags]   SMOKE
   fill the login form  ${user_name}  ${invalid_password}
   Wait until element to be visible    ${errorMsgLocator}
   verify error message is correct

Validate Cards display in the Shopping Page
   fill the login form   ${valid_username}  ${valid_password}
   Wait until element to be visible    ${homePageLoad}
   verify card titles in the shop page
   select the card   Blackberry

Select the form and navigate to the child window
   fill the login details and select user option

*** Keywords ***
fill the login form
     [Arguments]   ${username}   ${password}
     Input Text    id:username    ${username}
     Input Text    id:password    ${password}
     Click Button    signInBtn
     

Wait until element to be visible
      [Arguments]    ${element}
      Wait Until Element Is Visible    ${element}

     
verify error message is correct

     #${result}=   Get Text       ${errorMsgLocator}
     #Should Be Equal As Strings    ${result}    ${errorMessageLogin}
     Element Text Should Be    ${errorMsgLocator}    ${errorMessageLogin}

verify card titles in the shop page
     @{phoneList}=  Create List  iphone X  Samsung Note 8   Nokia Edge   Blackberry
     @{elements}=   Get WebElements    css=.card-title

     @{actualList}=   Create List
     FOR    ${element}    IN    @{elements}
            Log   ${element.text}
            Append To List   ${actualList}   ${element.text}
     END
     
     Lists Should Be Equal    ${phoneList}    ${actualList}

select the card
     [arguments]    ${cardName}
     @{elements}=   Get WebElements    css=.card-title

     ${index}=  Set Variable   1
     FOR    ${element}    IN    @{elements}
            Exit For Loop If    '${cardName}' == '${element.text}'
            ${index}=  Evaluate  ${index} + 1
     END

     Click Button    xpath=(//*[@class='card-footer'])[${index}]/button

fill the login details and select user option
     Input Text    id:username    rahulshettyacademy
     Input Text    id:password    learning
     
     Click Element    css=input[value='user']
     Wait Until Element Is Visible    css=.modal-body
     Click Button    id=okayBtn
     Click Button    id=okayBtn
     Wait Until Element Is Not Visible    css=.modal-body
     Select From List By Value    css=select.form-control      teach
     
     Select Checkbox    id=terms
     Checkbox Should Be Selected    id=terms
     