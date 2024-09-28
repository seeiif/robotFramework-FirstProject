*** Settings ***
Documentation  Validate the login form
Library  SeleniumLibrary
Library   Collections
Library    ../customLibrary/Shop.py
Test Setup   open the browser with the mortage payment url
Test Teardown   Close Browser
Resource   ../PageObjects/resources.robot
Resource    ../PageObjects/LandingPage.robot
Resource    ../PageObjects/ShopPage.robot
Resource    ../PageObjects/CheckoutPage.robot
Resource    ../PageObjects/ConfirmationPage.robot


*** Variables ***
${errorMsgLocator}  css:.alert-danger
${errorMessageLogin}   Incorrect username/password.
@{phoneNames}      Blacberry   Nokia Edge
${country_name}    India
*** Test Cases **
Validate Cards display in the Shopping Page
   [Tags]   SMOKE  Regression
   LandingPage.fill the login form   ${valid_username}  ${valid_password}
   ShopPage.Wait until element to be visible
   ShopPage.verify card titles in the shop page
   Add Items To Cart And Checkout    ${phoneNames}
   CheckoutPage.Verify items in the checkout page
   ConfirmationPage.Enter the country   ${country_name}
   ConfirmationPage.Purchase the product and confirm the purchase




     