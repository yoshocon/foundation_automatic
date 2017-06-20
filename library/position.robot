*** keyword ***
Fill In Form
    [Arguments]    ${building}    ${floor}    ${classroom}    ${people}    ${note}
    Input Need Element    id=areaBuilding    ${building}
    Input Need Element    id=areaFloor    ${floor}
    Input Need Element    id=areaClass    ${classroom}
    Input Need Element    id=areaPeople    ${people}
    Input Need Element    id=areaNote    ${note}

Fill In Form With Position
    [Arguments]    ${building}    ${floor}    ${classroom}    ${people}    ${note}
    Click Need Element    id=create
    Wait Need Element    //font[contains(.,"新增地點")]
    Fill In Form      ${building}    ${floor}    ${classroom}    ${people}    ${note}
    Click Need Element    id=btnSubmit
    Click Need Element    //button[contains(.,"確定申請")]
    Wait Need Element    //td[contains(.,"${classroom}")]
    Sleep    3s
