*** Keyword ***
Click Need Element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Page Should Contain Element    ${element}
    Click Element    ${element}
    sleep    0.5s

Create Register Data
    ${sex} =    Evaluate    random.randint(1,2)    random
    ${sex} =    Run Keyword If    ${sex}==1    Set Variable    male
                   ...    ELSE    Set Variable    female
    ${year} =    Evaluate    random.randint(1970,2000)    random
    ${month} =    Evaluate    random.randint(1,12)    random
    ${day} =    Evaluate    random.randint(1,28)    random
    ${birthday} =    Set Variable    ${year}/${month}/${day}
    Set Suite Variable    ${sex}
    Set Suite Variable    ${birthday}


Input Need Element
    [Arguments]    ${element}    ${text}
    Wait Until Page Contains Element    ${element}
    Page Should Contain Element    ${element}
    Input Text    ${element}   ${text}
    sleep    0.5s

Log Out
    Click Need Element    id=hamberger
    Click Need Element    id=logout
    Wait Need Element    //*[@id="layui-layer1"]/div[1]/b[contains(.,"尚未登入")]

Wait Need Element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Page Should Contain Element    ${element}
    sleep    0.5s
