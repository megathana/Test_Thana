*** Settings ***
Library           Collections

*** Variables ***
@{ListA}          1    2    3    5    6    8    9
@{ListB}          3    2    1    5    6    0

*** Test Cases ***
TC01_CheckDuplicateItems
    [Documentation]    Check duplicate items from list A and list B and append to a new list
    ${OnlyDuplicate}    Create List
    FOR    ${i}    IN    @{ListA}
        Run Keyword If    '${i}' in ${ListB}    Append To List    ${OnlyDuplicate}    ${i}
    END
    Log many    ${OnlyDuplicate}

*** Keywords ***
