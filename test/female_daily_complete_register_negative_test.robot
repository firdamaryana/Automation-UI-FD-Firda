*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_complete_register_negative_test.csv
Test Template           Negative - Complete Register Female Daily

*** Keywords ***
Negative - Complete Register Female Daily
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${email}  ${username}  ${password}  ${expected_display}
        GIVEN User open female daily
        AND User click Login or Signup button
        AND Verify after click Login or Signup button
        AND User click signup button
        AND Verify after click signup button
        AND Complete Register - User input phone number
        AND User click sign up register button
        AND Verify after click sign up register button
        AND User input verify code
        AND User click confirm button
        AND Verify after click confirm button
        WHEN User input email username password  ${email}  ${username}  ${password}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='4'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='5'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='6'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='7'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='8'      THEN Display warning message email or username      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='9'      THEN Display warning message password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='10'     THEN Display warning message password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='11'     THEN Display warning message password      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Complete Register Female Daily -${test_type}- ${test_desc}   ${email}  ${username}  ${password}  ${expected_display}