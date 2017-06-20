*** Settings ***
Documentation      Add New Position
Resource           ../init.robot

Suite Setup        SuiteSetup
Suite Teardown     Close All Browsers
Test Setup         TestSetup
Test Teardown      Log Out
Test Timeout       300

*** Test Cases ***
Create Some New Classroom With Success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName1}    ${people1}    success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName2}    ${people2}    success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName3}    ${people3}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName4}    ${people4}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName5}    ${people5}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName6}    ${people6}    success

Create A New Classroom With Success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName1}    ${people1}    fail
    Wait Until Page Does Not Contain Element    //*[@id="area"]//td[6][contains(.,"${classroomName1}")][contains(.,"fail")]

*** keyword ***
SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    Set Suite Variable    ${classroomName1}    class_${time}_1
    Set Suite Variable    ${classroomName2}    class_${time}_2
    Set Suite Variable    ${classroomName3}    class_${time}_3
    Set Suite Variable    ${classroomName4}    class_${time}_4
    Set Suite Variable    ${classroomName5}    class_${time}_5
    Set Suite Variable    ${classroomName6}    class_${time}_6
    ${people1} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people1}
    ${people2} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people2}
    ${people3} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people3}
    ${people4} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people4}
    ${people5} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people5}
    ${people6} =    Evaluate    random.randint(20,200)    random
    Set Suite Variable    ${people6}
    Open Browser    ${FOUNDATION_URL}    ${DEFAULT_BROWSER}
    Maximize Browser Window

TestSetup
    Log In    ${ADMIN_ACCOUNT}    ${ADMIN_PASSWORD}
    Click Need Element    //*[@id="mainDropdown"]/ul[2]/li/a
    Click Need Element    //*[@id="lesson_time"]/font[contains(.,"場地管理")]
    Wait Need Element    //strong[contains(.,"場地管理")]
