*** Settings ***
Documentation       Contains locators and reusable keywords for the home page

Library             AppiumLibrary


*** Variables ***
${HOME_NAVBAR_PLAN_BTN}     //android.view.View[@resource-id='navigation_bar_plan']


*** Keywords ***
Click On Routes From Navigation Bar
    [Documentation]    Clicks on 'Routes' Btn when it becomes visible
    Wait Until Element Is Visible    ${HOME_NAVBAR_PLAN_BTN}
    Click Element    ${HOME_NAVBAR_PLAN_BTN}
