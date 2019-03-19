*** Settings ***
Library    Selenium2Library

*** Variables ***
${SERVER}    http://10.199.66.227/SoftEn2019/Sec2/Together/
${BROWSER}    Chrome
${Login Success}    http://10.199.66.227/SoftEn2019/Sec2/Together/login-valid.php
${ValidUserName}    12345
${ValidPassWord}    1234
${InvalidUserName}    abcd
${InvalidPassword}    4321

*** Test Cases ***

TC001 Valid Login :
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="defaultForm-email"]    ${ValidUserName}
    Input Text    //*[@id="defaultForm-pass"]    ${ValidPassWord}
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=validLogin.jpg
    [Teardown]  Close Window

TC001 Invalid Username:
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="defaultForm-email"]    ${InvalidUserName} 
    Input Text    //*[@id="defaultForm-pass"]    ${ValidPassWord}
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=InvalidUserName.jpg
    [Teardown]  Close Window

TC003 Invalid Password :
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="defaultForm-email"]    ${ValidUserName}
    Input Text    //*[@id="defaultForm-pass"]    ${InvalidPassword}
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=InvalidPassword.jpg
    [Teardown]  Close Window
    
TC004 Empty Username :
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="defaultForm-pass"]    ${ValidPassWord}
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=EmptyUsernamen.jpg
    [Teardown]  Close Window

TC005 Empty Password :
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Input Text    //*[@id="defaultForm-email"]    ${ValidUserName}
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=EmptyPassword.jpg
    [Teardown]  Close Window

TC006 Empty Username and Password :
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Click Button    //*[@id="login-box"]/div/form/div/div[3]/button
    Capture Page Screenshot    filename=EmptyUsernameAndPassword.jpg
    [Teardown]  Close Window


   