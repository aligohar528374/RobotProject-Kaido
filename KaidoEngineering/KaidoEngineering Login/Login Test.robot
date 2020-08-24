*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
 Login TestCase Customer
    [Tags]    SmokeTest    
    [Documentation]   This is a Login Test
    Open Browser    ${url}  Chrome
    Set Browser Implicit Wait    15
    Input Text        id=txtEmail      ${email}
    Input Password    id=txtPass     ${password}
    Click Button      id=btnloginuser    
    Click Element     link=RFQ    
    Click Element     link= Add New RFQ    
    Select From List By Index    id=txtCategory    3  
    Select From List By Index    id=txtProType     4
    Select From List By Index    id=txtNeedBy      2
    Input Text    id=txtTitle    SQA TEST   
    Input Text    id=txtitemcode  001  
    Input Text    id=txtQty       005    
    Select From List By Index    id=txtCountry    2
    Input Text    id=txtLocation  Aus
    Input Text    id=txtlastdate    01112020  
    Input Text    id=txtoem    5258      
    Input Text    id=txtSysApp    Testing
    Choose File    name=txtMain    C:/Users/Ali Gohar/Downloads/signature.png
    Input Text    name=txtDesc    texTsetrt   
    Click Button    id=addquote   
    Click Element    xpath=/html/body/section[1]/div/div/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[5]/a[1]/i      
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
    Click Element     link= Logout 