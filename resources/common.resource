*** Settings ***
Documentation       Contains variables and keywords that are common to all tests

Library             AppiumLibrary


*** Variables ***
${APPIUM_SERVER_URL}            http://localhost:4723
${ANDROID_AUTOMATION_NAME}      UIAutomator2
${ANDROID_APP}                  com.bosch.ebike.onebikeapp
${ANDROID_PLATFORM_NAME}        Android
${ANDROID_DEVICE_NAME}          a0517c9a


*** Keywords ***
Open Test Application
    [Documentation]    Opens flow app with capabilities and appium server url
    Open Application
    ...    remote_url=${APPIUM_SERVER_URL}
    ...    automationName=${ANDROID_AUTOMATION_NAME}
    ...    appPackage=${ANDROID_APP}
    ...    platformName=${ANDROID_PLATFORM_NAME}
    ...    deviceName=${ANDROID_DEVICE_NAME}
