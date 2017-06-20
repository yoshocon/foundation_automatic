*** keyword ***
Random Apply People
    [Arguments]    ${maxpeople}
    ${people} =    Evaluate    random.randint(20,${maxpeople})    random
    [Return]    ${people}

Select Building
    Click Need Element    id=lessonBuilding
    Click Need Element    //*[@id="lessonBuilding"]/option[contains(.,"${BUILDING_NAME}")]

Select Floor
    [Arguments]    ${floor}
    Click Need Element    id=lessonFloor
    Click Need Element    //*[@id="lessonFloor"]/option[contains(.,"${floor}")]

Select Classroom
    [Arguments]    ${classroom}
    Click Need Element    id=lessonBuilding
    Click Need Element    //*[@id="lessonClass"]/option[contains(.,"${classroom}")]

Select Period
    [Arguments]    ${period}
    Click Need Element    id=lessonPeriod
    Click Need Element    //*[@id="lessonPeriod"]/option[contains(.,"${period}")]
