*** Settings ***
Documentation       Simple test for login and going through onboarding wizard

Resource            resources/common.resource

Test Tags           login


*** Test Cases ***
User Logs In And Goes Through Onboarding
    [Documentation]    Log in and go through the onboarding feature demos
    [Tags]    onboarding
    Open Test Application
    Accept Cookies And Continue
    Perform Login
    Headline Text Is Visible    Discover routes made for you
    Go Through Onboarding Wizard
    Headline Text Is Visible    Home


*** Keywords ***
Perform Login
    [Documentation]    Fills in email and password in relevant fields and Logs In
    Click On Continue With Email Button
    Fill Out User Email
    Click On Next After Typing User Email
    Fill Out User Password
    Click On Login CTA

Go Through Onboarding Wizard
    [Documentation]    Follows through the feature and onboarding wizard
    WHILE    True    limit=10
        ${is_next_visible}=    Run Keyword And Return Status
        ...    Expect Element
        ...    ${ONBOARDING_NEXT_BTN}
        ...    visible
        IF    not ${is_next_visible}    BREAK

        Click Element    ${ONBOARDING_NEXT_BTN}
        Sleep    500ms
    END
