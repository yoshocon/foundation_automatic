*** Settings ***
Documentation      All authority login web
Resource           ../init.robot

Suite Setup        SuiteSetup
Suite Teardown     SuiteTeardown
Test Timeout       300

*** Test Cases ***
# Login Account About User
#     [Template]    Log In With Different Authority Account
#     ${USER_ACCOUNT}    ${USER_PASSWORD}
#     ${OWNER_ACCOUNT}    ${OWNER_PASSWORD}

Register Account Via API And Login
    Create Register Data
    Register User    ${reg_account}    ${sex}    ${birthday}
    Log In    ${reg_account}    a1234567
    Log Out

*** keyword ***
Log In With Different Authority Account
    [Arguments]    ${account}    ${password}
    Log In    ${account}    ${password}
    Log Out

SuiteSetup
    ${time} =    Evaluate    time.strftime("%Y%m%d%H%M%S")    time
    Set Suite Variable    ${reg_account}    robot_${time}
    Open Browser    ${FOUNDATION_URL}    ${DEFAULT_BROWSER}
    Maximize Browser Window

SuiteTeardown
    Delete User
    Close All Browsers
