*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
 Login TestCase Customer
    [Tags]    SmokeTest    
    [Documentation]   This is a Login Test
    Open Browser    ${url}  Chrome
    Set Browser Implicit Wait    5
    Input Text        id=txtEmail      ${email}
    Input Password    id=txtPass     ${password}
    Click Button      id=btnloginuser    
    Click Element     link=RFQ    
    Click Element     link= Add New RFQ    
    Click Element     link= Logout
Login Test Supplier
    [Tags]    SmokeTest
    Click Element     link=Sign In  
    Input Text        id=txtEmail    ${logindata}[username] 
    Input Password    id=txtPass     ${logindata}[pass]    
    Click Button      id=btnloginuser  
    Click Element     link= Logout 
Login Test Customer
    [Tags]    Retest
    LoginKW         #User Custom Keyword

    
    
*** Variables ***
${url}  http://kaidaoengineering.systemsjunction.com/sign-in
${email}  Qa@gmail.com        # Scalar Variable
${password}  AAb1234567
&{logindata}    username=QaT@gmail.com    pass=AAb1234567    #Dictionary var
@{Login2}    Qa@gmail.com     AAb1234567      #List var

*** Keywords ***
LoginKW
    Click Element     link=Sign In
    Input Text        id=txtEmail      ${Login2}[0]
    Input Password    id=txtPass       ${Login2}[1]
    Click Button      id=btnloginuser   