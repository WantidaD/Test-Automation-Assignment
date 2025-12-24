*** Settings ***
Resource        ../resources/keywords.robot
Suite Setup     Open Todo App
Suite Teardown  Close Application

*** Test Cases ***
TC_01 Add Todo Successfully
    [Documentation]    Verify user can add a new todo
    Add New Todo    Buy milk
    Page Should Contain Text    Buy milk

TC_02 Delete Todo Successfully
    [Documentation]    Verify user can delete existing todo
    Delete Todo    Buy milk
    Page Should Not Contain Text    Buy milk