*** Keywords ***
Get Verification Code
    [Arguments]    ${code}
    ${code2} =    Split String    ${code}    <div id="verification" style="float:left;" class="check_img">
    ${code3} =    Split String    ${code2[1]}    </div><img src="images/reload.png"
    ${code4} =    Split String    ${code3[0]}    ><
    ${code4[0]} =    Replace String    ${code4[0]}    <    ${EMPTY}
    ${code4[3]} =    Replace String    ${code4[3]}    >    ${EMPTY}
    ${code5} =    Split String To Characters    ${code4[0]}
    ${code6} =    Split String To Characters    ${code4[1]}
    ${code7} =    Split String To Characters    ${code4[2]}
    ${code8} =    Split String To Characters    ${code4[3]}
    ${currectCode} =    Set Variable    ${code5[21]}${code6[21]}${code7[21]}${code8[21]}
    [Return]    ${currectCode}

Go To Login Page
    Click Need Element    id=hamberger
    Click Need Element    id=login
    Wait Until Page Contains    還沒有帳號

Input User Account
    [Arguments]     ${account}
    Input Need Element    id=account    ${account}

Input User Password
    [Arguments]     ${password}
    Input Need Element    id=pwd    ${password}

Input Verification Code
    ${currentCode} =    Wait All Verification Code Is Appear
    Input Need Element    id=code    ${currentCode}

Log In
    [Arguments]    ${account}    ${password}
    Go To Login Page
    Input User Account    ${account}
    Input User Password    ${password}
    Input Verification Code
    Click Button    id=login

Wait All Verification Code Is Appear
    Wait Until Page Contains Element    id=verification
    Page Should Contain Element    id=verification
    ${code} =    Get Source
    ${currentCode} =    Get Verification Code    ${code}
    [Return]    ${currentCode}
