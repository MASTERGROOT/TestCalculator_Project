*** Settings ***
Documentation    Test Simple Calcurator Project
Resource    ../Resource/resource.robot


*** Variables ***
@{button_list}    7    8    9    "/"    4    5    6    "*"    1    2    3    "-"    0    "."    "+"    "CLEAR"    "DEL"    "="

*** Test Cases ***
OpenCalculator_Project
    TRY
        LanuchURL
    EXCEPT    AS    ${error_message}
        Log To Console    ${error_message}
    FINALLY
        Close Browser
    END

ClickTest
    [Tags]    Test function
    LanuchURL
    Set Selenium Speed    value=0.5 seconds
    Set Selenium Implicit Wait    value=2 seconds
    TRY
        Wait Until Page Contains    SIMPLE CALCULATOR
        Press Button In List    @{button_list}
        
    EXCEPT    AS    ${error_message}
        Log To Console    ${error_message}
    FINALLY
        Set Browser Implicit Wait    3
        Close Browser
    END

ClickFooter
    [Tags]    Test function
    LanuchURL
    Click Link    locator=link:SIMPLE CALCULATOR
    Set Browser Implicit Wait    3
    [Teardown]    Close All Browsers

