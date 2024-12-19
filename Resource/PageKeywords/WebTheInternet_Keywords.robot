*** Keywords ***
wVerifyNotification
    [Arguments]    ${Notification_Expected}
    Wait Until Element Is Visible    xpath=//div[@id='flash']
    ${RawText}    Get Text    xpath=//div[@id='flash']
    ${TextLine}    Split To Lines    ${RawText}
    ${Notification_Actual}    Get From List    ${TextLine}    0
    Should Be Equal    ${Notification_Actual}    ${Notification_Expected}
