*** Settings ***
Library           AppiumLibrary

*** Variables ***
${DEVICE_NAME}    emulator-5554    # 4df133d912e16f0d
${PLATFORM_NAME}    ANDROID
${APP}            \    # \Users\IEUser\Desktop\Mobil\Applications\eribank.apk
${PLATFORM_VERSION}    4.3.1
${APP_PACKAGE}    com.experitest.ExperiBank
${APP_ACTIVITY}    .LoginActivity
${UDID}           ${EMPTY}
${REMOTE_URL}     http://localhost:4723/wd/hub
${AUTOMATION_NAME}    Appium
${TIMEOUT}        60

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    [Documentation]    Logs in to exepritest client
    Input Text    id=com.experitest.ExperiBank:id/usernameTextField    ${username}
    Input Text    id=com.experitest.ExperiBank:id/passwordTextField    ${password}
    Click Element    id=com.experitest.ExperiBank:id/loginButton
    Sleep    2
    Swipe    ${0}    ${600}    ${0}    ${0}

Logout
    Click Element    id=com.experitest.ExperiBank:id/logoutButton
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/loginButton
    Sleep    1

Make Payment
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/makePaymentButton    ${TIMEOUT}
    Click Element    id=com.experitest.ExperiBank:id/makePaymentButton
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/phoneTextField    ${TIMEOUT}
    Input Text    id=com.experitest.ExperiBank:id/phoneTextField    05551231212
    Input Text    id=com.experitest.ExperiBank:id/nameTextField    Burak
    Input Text    id=com.experitest.ExperiBank:id/amountTextField    25
    Click Element    id=com.experitest.ExperiBank:id/countryButton
    Wait Until Page Contains    India    ${TIMEOUT}
    Click Element    xpath=//android.widget.TextView[@text='India']
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/countryTextField    ${TIMEOUT}
    Wait Until Page Contains    India    ${TIMEOUT}
    Swipe    ${0}    ${600}    ${0}    ${0}
    Click Element    id=com.experitest.ExperiBank:id/sendPaymentButton
    Wait Until Page Contains Element    id=android:id/button1
    Click Element    id=android:id/button1
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/makePaymentButton

Click Text
    [Arguments]    ${text}
    Click Element    xpath=//*[contains(text(),"${text}")]
