*** Settings ***
Documentation       Contains variables and keywords that are common to all tests

Resource            pages/home_page.resource
Resource            pages/login_page.resource
Resource            pages/routes_page.resource


*** Variables ***
${APPIUM_SERVER_URL}                    http://localhost:4723
${ANDROID_AUTOMATION_NAME}              UIAutomator2
${ANDROID_APP}                          de.komoot.android
${ANDROID_PLATFORM_NAME}                Android
${ANDROID_DEVICE_NAME}                  a0517c9a
${ANDROID_AUTO_GRANT_PERMISSIONS}       true


*** Keywords ***
Open Test Application
    [Documentation]    Opens komoot app with capabilities and appium server url
    [Arguments]    ${noReset}=false
    Close All Applications
    Open Application
    ...    remote_url=${APPIUM_SERVER_URL}
    ...    automationName=${ANDROID_AUTOMATION_NAME}
    ...    appPackage=${ANDROID_APP}
    ...    platformName=${ANDROID_PLATFORM_NAME}
    ...    deviceName=${ANDROID_DEVICE_NAME}
    ...    autoGrantPermissions=${ANDROID_AUTO_GRANT_PERMISSIONS}
    ...    noReset=${noReset}

Headline Text Is Visible
    [Documentation]    Tests if headline text is visible on the screen
    [Arguments]    ${text}
    Wait Until Page Contains    text=${text}
