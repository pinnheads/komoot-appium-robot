*** Settings ***
Documentation       Simple tests for the komoot application

Resource            resources/common.resource


*** Test Cases ***
Test Application is Open
    [Documentation]    Tests if application launches successfully
    Open Test Application
    Headline Text Is Visible    text=We value your privacy
