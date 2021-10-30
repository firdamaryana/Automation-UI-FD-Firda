*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_login_positive_test.csv
Test Template           Positive - Login Female Daily

*** Keywords ***
Positive - Login Female Daily
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${password_login}  ${expected_display}
        GIVEN User open female daily
        AND User click Login or Signup button
        AND Verify after click Login or Signup button
        AND User input Phone number for login
        AND User click login button
        AND Verify after click login button
        WHEN User input password login for login  ${password_login}
        AND User click login button
        THEN Verify success login or register home femaledaily
        Close Browser

*** Test Cases ***
${test_number}. Login Female Daily -${test_type}- ${test_desc}   ${password_login}  ${expected_display}