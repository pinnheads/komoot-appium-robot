*** Settings ***
Documentation       Simple tests for the komoot application

Resource            resources/common.resource
Variables           resources/.secrets.yaml


*** Variables ***
${NEXT_BTN}     //*[@text="Next"]/following-sibling::android.widget.Button


*** Test Cases ***
User Logs In And Skips Onboarding
    [Documentation]    Log in skip the onboarding feature demos
    Open Test Application
    Accept Cookies And Continue
    Perform Login
    Wait Until Page Contains    text=Discover routes made for you    timeout=10s
    Headline Text Is Visible    Discover routes made for you
    Skip Onboarding Wizard
    Headline Text Is Visible    Home


*** Keywords ***
Accept Cookies And Continue
    [Documentation]    Wait for the cookie consent screen and accept all cookies to continue
    Wait Until Element Is Visible    //*[@text="We value your privacy"]
    Click Element    //*[@text="Accept All and Continue"]/following-sibling::android.widget.Button

Perform Login
    [Documentation]    Fills in email and password in relevant fields and Logs In
    Wait Until Element Is Visible    //*[@text="Where every\nroute becomes\na story"]
    Click Element    //*[contains(@resource-id, 'proceed_with_email_button')]
    Wait Until Element Is Visible    //*[@text="Enter your email address"]
    Input Text    id=de.komoot.android:id/lsea_input_field_tet    ${user_email}
    Click Element    //*[contains(@resource-id, 'next_button')]
    Input Password    id=de.komoot.android:id/lpa_input_field_tet    ${user_password}
    Click Element    //*[contains(@resource-id, 'login_cta')]

Skip Onboarding Wizard
    [Documentation]    Skips through the feature and onboarding wizard
    WHILE    True    limit=10
        ${is_next_visible}=    Run Keyword And Return Status
        ...    Expect Element
        ...    ${NEXT_BTN}    visible
        IF    not ${is_next_visible}    BREAK

        Click Element    ${NEXT_BTN}
        Sleep    500ms
    END
