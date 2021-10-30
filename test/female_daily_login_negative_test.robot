*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_login_negative_test.csv
Test Template           Negative - Login Female Daily

*** Keywords ***
Negative - Login Female Daily
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${password_login}  ${expected_display}
        GIVEN User open female daily
        AND User click Login or Signup button
        AND Verify after click Login or Signup button
        AND User input Email or Username or Phone number for login
        AND User click login button
        AND Verify after click login button
        WHEN User input password login for login  ${password_login}
        AND User click login button
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN Display blank password warning message      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN Display login warning message      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN Display blank or space password warning message      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Login Female Daily -${test_type}- ${test_desc}   ${password_login}  ${expected_display}