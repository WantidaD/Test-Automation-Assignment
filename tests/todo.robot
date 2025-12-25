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
    Open Application    http://127.0.0.1:4723
    ...   platformName=Android
    ...    deviceName=emulator-5554
    ...    automationName=UiAutomator2
    ...    app=/Users/wantidadechtawee/Projects/Minimal-Todo/app/build/outputs/apk/debug/app-debug.apk
    ...    appPackage=com.avjinder.todo
    ...    appActivity=.MainActivity
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