*** Settings ***
Documentation    Variables and Keywords Resourse
Library    SeleniumLibrary


*** Variables ***
${url}    https://mastergroot.github.io/TestCalculator_Project/index.html
${Browser}    Chrome

*** Keywords ***
LanuchURL
    [Documentation]    Run Keyword for open url and Maximize it
    Open Browser    url=${url}    browser=${Browser}
    Maximize Browser Window
    Wait Until Page Contains    CALCULATOR
    Title Should Be    title=CALCULATOR


Press Button In List
    [Documentation]    keyword for clicks all button in list
    [Arguments]    @{list}
    FOR  ${item}  IN  @{list}
        Click Element    locator=xpath://p[@class='button-text'][text() = ${item}]
    END

Compute
    [Arguments]    ${num1}    ${num2}    ${method}
    Click Element    locator=xpath://p[@class='button-text'][text() = ${num1}]
    Click Element    locator=xpath://p[@class='button-text'][text() = ${method}]
    Click Element    locator=xpath://p[@class='button-text'][text() = ${num2}]
    Click Element    locator=xpath://p[@class='button-text'][text() = "="]

Check result
    [Arguments]    ${expect}
    TRY
        ${value}=    Get Value    locator=//input[@id='calculator-display']
        Should Be Equal    first=${value}    second=${expect}
    EXCEPT
        Skip
    END
CLEAR
    Click Element    locator=xpath://p[@class='button-text'][text() = "CLEAR"]

DELETE
    [Arguments]    ${frequently}
    WHILE  ${frequently} > 0
        Click Element    locator=xpath://p[@class='button-text'][text() = "DEL"]
        ${frequently}=    Evaluate    ${frequently} - 1
    END
