*** Settings ***
Resource          Demo_Resources.robot

*** Test Cases ***
Demo_Test_Case
    [Setup]
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP}    appPackage= ${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    ...    deviceName=${DEVICE_NAME}
    Comment    Open Application    ${REMOTE_URL}    automationName=${AUTOMATION_NAME}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}
    ...    appActivity=${APP_ACTIVITY}    appPackage=${APP_PACKAGE}    app=${APP}    browserName=${BROWSER_NAME}    apiKey=${API_KEY}    bundleId=${APP_BUNDLE_ID}
    login_and_verify    company    company
    logout
    Close All Applications
