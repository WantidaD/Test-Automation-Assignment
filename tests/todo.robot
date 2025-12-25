*** Settings ***
Library    AppiumLibrary

Suite Setup     Open Todo App
Suite Teardown  Close Todo App

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${DEVICE_NAME}   emulator-5554
${APP_PACKAGE}   com.avjinder.todo
${APP_ACTIVITY}  .MainActivity

*** Test Cases ***
TC_01 Add Todo Successfully
    [Documentation]    Verify user can add a new todo
    Add New Todo    Buy milk
    Page Should Contain Text    Buy milk

TC_02 Delete Todo Successfully
    [Documentation]    Verify user can delete existing todo
    Add New Todo    Buy bread
    Delete Todo     Buy bread
    Page Should Not Contain Text    Buy bread

*** Keywords ***
Open Todo App
    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=UiAutomator2
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    autoGrantPermissions=true
    Set Appium Timeout    10s

Close Todo App
    Close Application

Add New Todo
    [Arguments]    ${todo}
    Click Element    id=com.avjinder.todo:id/fab
    Wait Until Page Contains Element    id=com.avjinder.todo:id/editTextTodo    10s
    Input Text      id=com.avjinder.todo:id/editTextTodo    ${todo}
    Click Element   id=com.avjinder.todo:id/saveButton
    Wait Until Page Contains Text    ${todo}    10s

Delete Todo
    [Arguments]    ${todo}
    Long Press    xpath=//*[@text='${todo}']    2000
    Click Element    id=com.avjinder.todo:id/delete
    Wait Until Page Does Not Contain Text    ${todo}    10s