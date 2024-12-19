*** Settings ***
Library           BuiltIn
Library           String
Library           Collections
Library           SeleniumLibrary
Resource          ../Resource/PageRepositories/WebTheInternet_Repository.robot
Resource          ../Resource/PageVariable/WebTheInternet_Variable.robot
Resource          ../Resource/PageKeywords/WebTheInternet_Keywords.robot

*** Variables ***

*** Test Cases ***
TC01_LoginSuccess
    [Documentation]    *Step*
    ...    1. Open browser and go to
    ...    'http://the-internet.herokuapp.com/login'. \
    ...    2. Input username 'tomsmith' and password 'SuperSecretPassword!'. \
    ...    3. Click the 'Logout' button.
    ...
    ...    *Expected*
    ...    1. Login page is shown.
    ...    2. Login success and message 'You logged into a secure area!' is shown.
    ...    3. Go back to the Login page and the message ' You logged out of the secure area!' is shown.
    # เปิดเว็บ the-internet
    Open Browser    https://the-internet.herokuapp.com/login    gc
    Maximize Browser Window
    # กรอก Username & Password
    Input Text    ${Home_input_Username}    tomsmith
    Input Text    ${Home_input_Password}    SuperSecretPassword!
    # กดปุ่ม Login
    Click Element    ${Home_btn_Login}
    # ตรวจสอบข้อความ Notification หน้า Secure Area
    wVerifyNotification    ${Noti_ValidLogin_Expected}
    # กดปุ่ม Logout
    Click Element    ${Home_btn_Logout}
    # ตรวจสอบข้อความ Notification หน้า Login
    wVerifyNotification    ${Noti_ValidLogout_Expected}
    [Teardown]    Close Browser

TC02_Loginfailed_PasswordIncorrect
    [Documentation]    *Step*
    ...    1. Open browser and go to
    ...    'http://the-internet.herokuapp.com/login'. \
    ...    2. Input username 'tomsmith' and password 'Password!'.
    ...
    ...    *Expected*
    ...    1. Login page is shown.
    ...    2. Login failed and the message 'Your password is invalid!' is shown.
    # เปิดเว็บ the-internet
    Open Browser    https://the-internet.herokuapp.com/login    gc
    Maximize Browser Window
    # กรอก Username & Password
    Input Text    ${Home_input_Username}    tomsmith
    Input Text    ${Home_input_Password}    Password!
    # กดปุ่ม Login
    Click Element    ${Home_btn_Login}
    # ตรวจสอบข้อความ Notification หน้า Login
    wVerifyNotification    ${Noti_InvalidPassword_Expected}
    [Teardown]    Close Browser

TC03_Loginfailed_UsernameNotFound
    [Documentation]    *Step*
    ...    1. Open browser and go to
    ...    'http://the-internet.herokuapp.com/login'. \
    ...    2. Input username 'tomholland' and password 'Password!'.
    ...
    ...    *Expected*
    ...    1. Login page is shown.
    ...    2. Login failed and the message 'Your username is invalid!' is shown.
    # เปิดเว็บ the-internet
    Open Browser    https://the-internet.herokuapp.com/login    gc
    Maximize Browser Window
    # กรอก Username & Password
    Input Text    ${Home_input_Username}    tomholland
    Input Text    ${Home_input_Password}    Password!
    # กดปุ่ม Login
    Click Element    ${Home_btn_Login}
    # ตรวจสอบข้อความ Notification หน้า Login
    wVerifyNotification    ${Noti_InvalidUserAndPassword_Expected}
    [Teardown]    Close Browser

*** Keywords ***
