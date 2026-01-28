*** Settings ***
Documentation       Simple tests for the eBike Flow App

Resource            common.resource


*** Test Cases ***
Test Application is Open
    [Documentation]    Tests if application launches successfully
    Open Test Application
    Headline Text Is Visible    Enhance your smart system eBike


*** Keywords ***
Headline Text Is Visible
    [Documentation]    Tests if headline text is visible on the screen
    [Arguments]    ${text}
    Expect Text    text=${text}    state=visible    message=${text} was not visible
