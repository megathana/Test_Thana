*** Keywords ***
mSwipeLeftOnElement
    [Arguments]    ${locator}    ${amount}=1
    ${bounds}    Get Element Attribute    ${locator}    bounds
    ${bounds}    Replace String    ${bounds}    ][    ,
    ${bounds}    Replace String    ${bounds}    [    ${EMPTY}
    ${bounds}    Replace String    ${bounds}    ]    ${EMPTY}
    ${bounds}    Split String    ${bounds}    ,
    ${bounds[2]}    Evaluate    ${bounds[2]}-20
    FOR    ${i}    IN RANGE    ${amount}
        Swipe    ${bounds[2]}    ${bounds[1]}    ${bounds[0]}    ${bounds[1]}    1000
        Exit For Loop If    '${i}'=='${amount}'
    END
