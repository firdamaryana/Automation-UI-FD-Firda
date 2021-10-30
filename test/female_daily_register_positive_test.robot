*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_register_positive_test.csv
Test Template           Positive - Register Female Daily

*** Keywords ***
Positive - Register Female Daily
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${phone}  ${expected_display}
        GIVEN User open female daily
        AND User click Login or Signup button
        AND Verify after click Login or Signup button
        AND User click signup button
        AND Verify after click signup button
        WHEN User input phone number      ${phone}
        AND User click sign up register button
        THEN Verify after click sign up register button
        Close Browser

*** Test Cases ***
${test_number}. Register Female Daily -${test_type}- ${test_desc}   ${phone}  ${expected_display}