*** Settings ***
Resource          Demo_Resources.robot

*** Test Cases ***
Login_Logout
    [Setup]
    Comment    General version    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}
    ...    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    deviceName=${DEVICE_NAME}
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}    deviceName=${DEVICE_NAME}    deviceOrientation=${DEVICE_ORIENTATION}
    ...    appiumVersion=${APPIUM_VERSION}    browserName=${BROWSER_NAME}
    Comment    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}
    Login    company    company
    Wait Until Page Contains Element    id=com.experitest.ExperiBank:id/logoutButton
    Logout
    Close All Applications

Make_Payment
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    ...    deviceName=${DEVICE_NAME}
    Login    company    company
    Make Payment
    Logout
    Close All Applications

Invalid_Login
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    ...    deviceName=${DEVICE_NAME}
    Login    Burak    1234
    Wait Until Page Contains    Invalid username or password!    ${TIMEOUT}
    Wait Until Page Contains Element    id=android:id/button3    ${TIMEOUT}
    Click Element    id=android:id/button3
    Wait Until Page Does Not Contain Element    id=android:id/button3
    Close All Applications

*** Keywords ***
