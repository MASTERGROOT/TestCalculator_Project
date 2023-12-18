*** Settings ***
Documentation    Test Calcurator Computation Project
Resource    ../Resource/resource.robot
Suite Setup    LanuchURL
Test Setup    Set Selenium Speed    value=0.5 seconds


*** Variables ***
@{num_list}    1    3    4

*** Test Cases ***
Additional
    [Tags]    computation
    Set Selenium Implicit Wait    value=2 seconds
    Compute    num1=1    num2=2    method="+"
    Check result    expect=3
    CLEAR

Subtraction
    [Tags]    computation
    Compute    1    2    "-"
    Check result    -1
    Sleep   2s
    CLEAR

Mutiplication
    [Tags]    computation
    Compute    2    2    "*"
    Check result    4
    Sleep    2s
    CLEAR

Division
    [Tags]    computation
    Compute    4    2    "/"
    Check result    2
    Sleep    2s
    CLEAR

Delete Test
    [Tags]    Test function
    Press Button In List    @{num_list}
    DELETE    frequently=2
    Check result    1
