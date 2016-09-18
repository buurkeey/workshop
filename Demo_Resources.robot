*** Settings ***
Library           AppiumLibrary

*** Variables ***
&{login_username}    ANDROID=id=com.experitest.ExperiBank:id/usernameTextField
&{login_password}    ANDROID=id=com.experitest.ExperiBank:id/passwordTextField
&{login_button}    ANDROID=id=com.experitest.ExperiBank:id/loginButton
&{logout}         ANDROID=id=com.experitest.ExperiBank:id/logoutButton
${P}              ${PLATFORM_NAME}
${DEVICE_NAME}    emulator-5554    # 4df133d912e16f0d
${PLATFORM_NAME}    ANDROID
${APP}            \    # \Users\IEUser\Desktop\Mobil\Applications\eribank.apk
${PLATFORM_VERSION}    4.3
${APP_PACKAGE}    com.experitest.ExperiBank
${APP_ACTIVITY}    .LoginActivity
${UDID}           ${EMPTY}
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${AUTOMATION_NAME}    Appium

*** Keywords ***
login_and_verify
    [Arguments]    ${username}    ${password}
    [Documentation]    Logs in to exepritest client
    Input Text    &{login_username}[${P}]    ${username}
    Input Text    &{login_password}[${P}]    ${password}
    Click Element    &{login_button}[${P}]
    Sleep    2
    Swipe    ${0}    ${600}    ${0}    ${0}
    Wait Until Page Contains Element    &{logout}[${P}]

logout
    Click Element    &{logout}[${P}]
    Wait Until Page Contains Element    &{login_button}[${P}]
    Sleep    1
