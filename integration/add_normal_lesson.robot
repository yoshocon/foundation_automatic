*** Settings ***
Documentation      Add Normal Lesson
Resource           ../init.robot

Suite Setup        SuiteSetup
Suite Teardown     SuiteTeardown
Test Setup         TestSetup
Test Timeout       300

*** Test Cases ***
Create Normal Lesson With Not Conflict
    Click Need Element    //button[contains(.,"新增課程")]
    Input Need Element    id=lessonName    ${lessonName}
    ${lessonCount} =    Evaluate    random.randint(3,20)    random
    Input Need Element    id=lessonCount    ${lessonCount}
    Input Need Element    id=lessonTime    ${lessonTime}
    Select Building
    Select Floor    1
    Select Classroom    ${classroomName1}
    Select Period    A1
    ${lessonPeople} =    Random Apply People    ${people1}
    Input Need Element    id=lessonPeople    ${lessonPeople}
    Input Need Element    id=detailContract    ${lessonContract}
    Input Need Element    id=detailPhone    ${lessonPhone}
    Input Need Element    id=lessonNote    ${lessonReason}
    Click Need Element    id=btnSubmit
    Click Need Element    //button[contains(.,"確定申請")]
    Sleep    3s
    Log Out
    Log In    ${ADMIN_ACCOUNT}    ${ADMIN_PASSWORD}
    Click Need Element    //*[@id="mainDropdown"]/ul[2]/li/a
    Click Need Element    //*[@id="lesson_time"]/font[contains(.,"審核專區")]
    Wait Need Element    //strong[contains(.,"審核專區")]


*** keyword ***
Get New Time
    ${time} =    Evaluate    time.strftime("%Y/%m")    time
    ${day} =    Evaluate    time.strftime("%d")    time
    ${day} =    Convert To Integer    ${day}
    ${day} =    Evaluate    ${day}+1
    ${dayLenght} =    Evaluate    len("${day}")
    ${day} =    Run Keyword If    ${dayLenght}==1    0${day}
                   ...    ELSE    Set Variable    ${day}
    ${time} =    Set Variable    ${time}/${day}
    [Return]    ${time}

SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    Set Suite Variable    ${reg_account}    robot_${time}
    Create Register Data
    Register User    ${reg_account}    ${sex}    ${birthday}
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
    Set Suite Variable    ${lessonName}    lesson_${time}
    ${lessonTime} =    Get New Time
    Set Suite Variable    ${lessonTime}
    Set Suite Variable    ${lessonContract}    機器人
    Set Suite Variable    ${lessonPhone}    0988521234
    Set Suite Variable    ${lessonReason}    機器人測試申請課程
    Open Browser    ${FOUNDATION_URL}    ${DEFAULT_BROWSER}
    Maximize Browser Window
    Log In    ${ADMIN_ACCOUNT}    ${ADMIN_PASSWORD}
    Click Need Element    //*[@id="mainDropdown"]/ul[2]/li/a
    Click Need Element    //*[@id="lesson_time"]/font[contains(.,"場地管理")]
    Wait Need Element    //strong[contains(.,"場地管理")]
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName1}    ${people1}    success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName2}    ${people2}    success
    Fill In Form With Position    ${BUILDING_NAME}    1    ${classroomName3}    ${people3}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName4}    ${people4}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName5}    ${people5}    success
    Fill In Form With Position    ${BUILDING_NAME}    2    ${classroomName6}    ${people6}    success
    Log Out
    Log In    ${reg_account}    ${COMMON_PASSWROD}

SuiteTeardown
    Log out
    Delete User
    Close All Browsers

TestSetup
    Click Need Element    //*[@id="mainDropdown"]/ul[2]/li/a
    Click Need Element    //*[@id="lesson_time"]/font[contains(.,"申請常態課程")]
    Wait Need Element    //strong[contains(.,"申請常態課程")]
