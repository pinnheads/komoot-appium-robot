*** Settings ***
Documentation       Simple tests for the eBike Flow App

Library             AppiumLibrary


*** Variables ***
${APPIUM_SERVER_URL}            http://localhost:4723
${ANDROID_AUTOMATION_NAME}      UIAutomator2
${ANDROID_APP}                  com.bosch.ebike.onebikeapp
${ANDROID_PLATFORM_NAME}        Android
${ANDROID_DEVICE_NAME}          a0517c9a


*** Test Cases ***
Test Application is Open
    [Documentation]    Tests if application launches successfully
    Open Test Application
    Headline Text Is Visible    Enhance your smart system eBike


*** Keywords ***
Open Test Application
    [Documentation]    Opens flow app with capabilities url
    Open Application
    ...    remote_url=${APPIUM_SERVER_URL}
    ...    automationName=${ANDROID_AUTOMATION_NAME}
    ...    appPackage=${ANDROID_APP}
    ...    platformName=${ANDROID_PLATFORM_NAME}
    ...    deviceName=${ANDROID_DEVICE_NAME}

Headline Text Is Visible
    [Documentation]    Tests if headline text is visible on the screen
    [Arguments]    ${text}
    Expect Text    text=${text}    state=visible    message=${text} was not visible
