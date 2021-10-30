*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_register_negative_test.csv
Test Template           Negative - Register Female Daily

*** Keywords ***
Negative - Register Female Daily
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${phone}  ${expected_display}
        GIVEN User open female daily
        AND User click Login or Signup button
        AND Verify after click Login or Signup button
        AND User click signup button
        AND Verify after click signup button
        WHEN User input phone number      ${phone}
        AND User click sign up register button
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN Display warning message phone number      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN Display warning message phone number      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN Display warning message phone number      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN Display warning message phone number      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='4'      THEN Display warning message existing phone number      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Register Female Daily -${test_type}- ${test_desc}   ${phone}  ${expected_display}