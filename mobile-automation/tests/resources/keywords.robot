*** Settings ***
Library    AppiumLibrary
Resource   ../variables/android_caps.robot

*** Keywords ***
Open Todo App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}

Add New Todo
    [Arguments]    ${todo_text}
    Click Element    id=com.avjinder.todo:id/addToDoItemFAB
    Input Text      id=com.avjinder.todo:id/userToDoEditText    ${todo_text}
    Click Element   id=com.avjinder.todo:id/makeToDoFloatingActionButton

Delete Todo
    [Arguments]    ${todo_text}
    Long Press      xpath=//android.widget.TextView[@text='${todo_text}']
    Click Element   id=com.avjinder.todo:id/deleteToDoItem