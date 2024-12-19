*** Settings ***
Library           AppiumLibrary
Library           String
Library           Collections
Library           OperatingSystem
Library           Dialogs
Library           Process
Library           DateTime
Resource          ../Resource/PageRepositories/MinimalToDoList_Repository.robot
Resource          ../Resource/PageKeywords/MinimalToDoList_Keywords.robot

*** Test Cases ***
TC01_Verify user can add to do list success
    [Documentation]    *Step*
    ...    1. Open app : Minimal
    ...    2. Click '+' button
    ...    3. Enter title = วันเกิดแม่
    ...    4. Click toggle for remind
    ...    5. Click date field
    ...    6. Click year and select year = 2024
    ...    7. Click date = 15
    ...    8. Click ok button
    ...    9. Click submit button
    ...
    ...    *Expected*
    ...    User can add to do list success
    # Expected ระบุชื่อ ปี วัน ที่จะสร้าง
    ${Title}    Set Variable    วันเกิดแม่
    ${Year}    Set Variable    2024
    ${Date}    Set Variable    15
    # เปิดแอป Minimal ToDo
    Open Application    http://127.0.0.1:4723    platformName=Android    platformVersion=14    deviceName=A5CS024313002688    appPackage=com.avjindersinghsekhon.minimaltodo    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity    noReset=true    unicodeKeyboard=true    automationName=UiAutomator2    newCommandTimeout=5000
    # คลิกปุ่ม Add
    Wait Until Element Is Visible    ${HomeBtnAdd}
    Click Element    ${HomeBtnAdd}
    # ระบุชื่อ Title
    Wait Until Element Is Visible    ${AddInputTitle}
    Input Text    ${AddInputTitle}    ${Title}
    # คลิกปุ่ม Toggle
    Click Element    ${AddBtnDateSwitch}
    # คลิกปุ่ม เลือกปี
    Click Element    ${AddInputDate}
    Wait Until Element Is Visible    ${AddTxtYearList}
    Click Element    ${AddTxtYearList}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Year}"]
    Click Element    xpath=//android.widget.TextView[@text="${Year}"]
    # คลิกปุ่ม เลือกวันที่
    Wait Until Element Is Visible    xpath=//android.widget.ViewAnimator[@resource-id="com.avjindersinghsekhon.minimaltodo:id/animator"]/*/*/*[${Date}]
    Click Element    xpath=//android.widget.ViewAnimator[@resource-id="com.avjindersinghsekhon.minimaltodo:id/animator"]/*/*/*[${Date}]
    # คลิกปุ่ม ตกลง
    Click Element    ${AddTxtOk}
    # คลิกปุ่ม Submit
    Click Element    ${AddBtnSubmit}
    # คลิกที่ Title to do ที่จะแก้ไข
    Wait Until Element Is Visible    ${HomeBtnAdd}
    [Teardown]    Close Application

TC02_Verify user can edit to do list success
    [Documentation]    *Step*
    ...    1. Open app : Minimal
    ...    2. Click to do list = วันเกิดแม่
    ...    3. Enter title for edit = วันเกิดพ่อ
    ...    5. Click date field
    ...    6. Click year and change year to = 2025
    ...    7. Click date = 28
    ...    7. Click ok button
    ...    8. Click submit button
    ...
    ...    *Expected*
    ...    User can edit to do list success
    # Expected ระบุชื่อ ปี วัน ที่จะแก้ไข
    ${TitleToSearch}    Set Variable    วันเกิดแม่
    ${TitleEditedTo}    Set Variable    วันเกิดพ่อ
    ${YearEditedTo}    Set Variable    2025
    ${DateEditedTo}    Set Variable    28
    # เปิดแอป Minimal ToDo
    Open Application    http://127.0.0.1:4723    platformName=Android    platformVersion=14    deviceName=A5CS024313002688    appPackage=com.avjindersinghsekhon.minimaltodo    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity    noReset=true    unicodeKeyboard=true    automationName=UiAutomator2    newCommandTimeout=5000
    # คลิกที่ Title to do ที่จะแก้ไข
    Wait Until Element Is Visible    ${HomeBtnAdd}
    Click Element    xpath=//android.widget.LinearLayout[@resource-id="com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout"]/*/*[@text="${TitleToSearch}"]
    # แก้ไขชื่อ Title
    Wait Until Element Is Visible    ${AddInputTitle}
    Clear Text    ${AddInputTitle}
    Input Text    ${AddInputTitle}    ${TitleEditedTo}
    # คลิกปุ่ม เลือกปี
    Click Element    ${AddInputDate}
    Wait Until Element Is Visible    ${AddTxtYearList}
    Click Element    ${AddTxtYearList}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${YearEditedTo}"]
    Click Element    xpath=//android.widget.TextView[@text="${YearEditedTo}"]
    # คลิกปุ่ม เลือกวันที่
    Wait Until Element Is Visible    xpath=//android.widget.ViewAnimator[@resource-id="com.avjindersinghsekhon.minimaltodo:id/animator"]/*/*/*[${DateEditedTo}]
    Click Element    xpath=//android.widget.ViewAnimator[@resource-id="com.avjindersinghsekhon.minimaltodo:id/animator"]/*/*/*[${DateEditedTo}]
    # คลิกปุ่ม ตกลง
    Click Element    ${AddTxtOk}
    # คลิกปุ่ม Submit
    Click Element    ${AddBtnSubmit}
    [Teardown]    Close Application

TC03_Verify user can delete to do list success
    [Documentation]    *Step*
    ...    1. Open app : Minimal
    ...    2. Swipe left on to do list = วันเกิดพ่อ
    ...
    ...    *Expected*
    ...    User can delete to do list success
    # Expected ระบุชื่อที่จะลบ
    ${TitleToSearch}    Set Variable    วันเกิดพ่อ
    # เปิดแอป Minimal ToDo
    Open Application    http://127.0.0.1:4723    platformName=Android    platformVersion=14    deviceName=A5CS024313002688    appPackage=com.avjindersinghsekhon.minimaltodo    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity    noReset=true    unicodeKeyboard=true    automationName=UiAutomator2    newCommandTimeout=5000
    # ปัด To do list ไปทางซ้ายเพื่อลบ
    mSwipeLeftOnElement    xpath=//android.widget.LinearLayout[@resource-id="com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout"]/*/*[@text="${TitleToSearch}"]
    [Teardown]    Close Application
