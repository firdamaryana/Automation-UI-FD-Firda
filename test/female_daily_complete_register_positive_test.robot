*** Settings ***
Documentation           Female Daily Technical Test
Resource                ${EXECDIR}/keyword/female_daily.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            female_daily
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/female_daily_complete_register_positive_test.csv
Test Template           Positive - Complete Register Female Daily

*** Keywords ***
Positive - Complete Register Female Daily
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
        AND User open pop up date of birth
        AND select year month date
        AND User click submit button
        THEN Verify success login or register home femaledaily
        Close Browser

*** Test Cases ***
${test_number}. Complete Register Female Daily -${test_type}- ${test_desc}   ${email}  ${username}  ${password}  ${expected_display}