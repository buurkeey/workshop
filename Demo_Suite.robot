*** Settings ***
Resource          Demo_Resources.robot

*** Test Cases ***
Demo_Test_Case
    [Setup]
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    ...    deviceName=${DEVICE_NAME}
    login_and_verify    company    company
    logout
    Close All Applications
