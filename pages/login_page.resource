*** Settings ***
Documentation       Contains locators and reusable keywords for the login page

Library             AppiumLibrary
Variables           resources/.secrets.yaml


*** Variables ***
# Cookies Page
${COOKIES_HEADING}                  //*[@text="We value your privacy"]
${COOKIES_ACCEPT_BUTTON}            //*[@text="Accept All and Continue"]/following-sibling::android.widget.Button

# Login with Email Page
${LOGIN_CONTINUE_WITH_EMAIL_BTN}    //*[contains(@resource-id, 'proceed_with_email_button')]
${LOGIN_EMAIL_FEILD}                id=de.komoot.android:id/lsea_input_field_tet
${LOGIN_NEXT_BUTTON}                //*[contains(@resource-id, 'next_button')]
${LOGIN_PASSWORD_FEILD}             id=de.komoot.android:id/lpa_input_field_tet
${LOGIN_CTA_BUTTON}                 //*[contains(@resource-id, 'login_cta')]

# Onboarding wizard
${ONBOARDING_NEXT_BTN}              //*[@text="Next"]/following-sibling::android.widget.Button


*** Keywords ***
Accept Cookies And Continue
    [Documentation]    Wait for the cookie consent screen and accept all cookies to continue
    Wait Until Element Is Visible    ${COOKIES_HEADING}
    Click Element    ${COOKIES_ACCEPT_BUTTON}

Click On Continue With Email Button
    [Documentation]    Waits until continue with email button is visible and then clicks on it
    Wait Until Element Is Visible    ${LOGIN_CONTINUE_WITH_EMAIL_BTN}
    Click Element    ${LOGIN_CONTINUE_WITH_EMAIL_BTN}

Fill Out User Email
    [Documentation]    Wait until email field is visible and enter email
    Wait Until Element Is Visible    ${LOGIN_EMAIL_FEILD}
    Input Text    ${LOGIN_EMAIL_FEILD}    ${user_email}

Click On Next After Typing User Email
    [Documentation]    Click on next button after filling out user email
    Click Element    ${LOGIN_NEXT_BUTTON}

Fill Out User Password
    [Documentation]    Fills out user password in the password field of the login page
    Input Password    ${LOGIN_PASSWORD_FEILD}    ${user_password}

Click On Login CTA
    [Documentation]    Clicks on Login Button from email login page
    Click Element    ${LOGIN_CTA_BUTTON}
