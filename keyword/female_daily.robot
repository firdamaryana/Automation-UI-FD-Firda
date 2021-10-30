*** Settings ***
Documentation           Female Daily Technical Test
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Variables ***
#dashboard femaledaily
${btn_login_or_signup}              id:id_loginsignup_home
${lbl_welcome}                      xpath=//p[@class='jsx-2482766057 home-subtitle']

#account page
${btn_signup}                       id:id_btn1_signup
${btn_login}                        id:id_btn_login
${lbl_welcome_back}                 xpath=//h1[@class='jsx-3668868328'][contains(text(),'Welcome back to Female Daily Network!')]
${lbl_create_new_account}           xpath=//h1[@class='jsx-3668868328'][contains(text(),'Create New Account')]
${txt_email_orusername_or_phone}    xpath=//input[@id='id_field_login']
${txt_password_login}               xpath=//input[@id='id_field_pass']
${btn_forgot_password}              xpath=//a[@id='id_forgot_pass']
${warning_login}                    xpath=//p[@class='jsx-2382724270']
${warning_blank_password}           xpath=//p[@class='jsx-2232325766 desktop-taste-input-text-warning']

#register page
${btn_signup_register}              id:id_btn2_signup
${txt_phone_number}                 xpath=//input[@id='id_field_signup']
${lbl_phone_number}                 xpath=//small[@class='jsx-1812373193 title'][contains(text(),'Phone number')]
${warning_phone_number}             xpath=//p[@class='jsx-3320856539 desktop-taste-input-text-warning']
${btn_login_here}                   xpath=//a[@id='id_btn_login_here']
${warning_existing_phone}           xpath=//h1[@class='jsx-1863635072'][contains(text(),'Phone number has been registered')]

#verification page
${lbl_phone_number_verify}          xpath=//p[@class='jsx-3676245989']
${lbl_verify_phone_number}          xpath=//h1[@class='jsx-308160394']
${btn_change}                       xpath=//span[@id='id_change_signup']
${txt_verify_code}                  xpath=//input[@id='id_code_signup']
${btn_confirm}                      xpath=//button[@id='id_confirm_signup']

#complete account page
${lbl_complete_account}             xpath=//h1[@class='jsx-415508548']
${txt_email}                        xpath=//input[@id='id_field_email']
${txt_username}                     xpath=//input[@id='id_field_username']
${txt_password}                     xpath=//input[@id='id_field_password']
${btn_password_eye}                 xpath=//span[@class='jsx-628143892 icon-eye']
${txt_date_of_birth}                xpath=//input[@id='id_field_dob']
${select_mount}                     xpath=//select[@class='react-datepicker__month-select']//option[@value='1']
${select_year}                      xpath=//select[@class='react-datepicker__year-select']//option[@value='1994']
${select_date}                      xpath=//div[@aria-label='day-18']
${btn_submit}                       xpath=//button[@id='id_btn_submit']
${warning_email_or_username}        xpath=//p[@class='jsx-3320856539 desktop-taste-input-text-warning']
${warning_password}                 xpath=//p[@class='jsx-2232325766 desktop-taste-input-text-warning']

#login success
${lbl_profile}                      xpath=//div[@class='profile-menu-wrapper']
${lbl_start_here}                   xpath=//h3[@class='jsx-2482766057 home-title']

*** Keywords ***
User open female daily
    SeleniumLibrary.Open Browser         https://femaledaily.net/       browser=Chrome
    Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_login_or_signup}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_welcome}

User click Login or Signup button
    SeleniumLibrary.Click Element          ${btn_login_or_signup}

Verify after click Login or Signup button
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_signup}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_login}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_welcome_back}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_create_new_account}

User input Username for login
    SeleniumLibrary.Input Text    ${txt_email_orusername_or_phone}         gazaagung

User User input Email for login
    SeleniumLibrary.Input Text    ${txt_email_orusername_or_phone}         gazaagung@gmail.com

User input Phone number for login
    SeleniumLibrary.Input Text    ${txt_email_orusername_or_phone}         085716768792

User click login button
    SeleniumLibrary.Click Element          ${btn_login}

Verify after click login button
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_password_login}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_forgot_password}

User input password login for login
    [Arguments]         ${password_login}
    login - Input password             ${password_login}

login - Input password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_password_login}         ${input}

Display login warning message
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_login_text}         SeleniumLibrary.Get Text       ${warning_login}
    Should Be Equal As Strings    ${warning_login_text}          ${expected_display}

Display blank or space password warning message
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_blank_password_text}         SeleniumLibrary.Get Text       ${warning_blank_password}
    Should Be Equal As Strings    ${warning_blank_password_text}          ${expected_display}

User click signup button
    SeleniumLibrary.Click Element          ${btn_signup}

Verify after click signup button
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_signup_register}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_phone_number}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_phone_number}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_login_here}

Complete Register - User input phone number
    SeleniumLibrary.Input Text    ${txt_phone_number}         085692404729

User input phone number
    [Arguments]         ${phone}
    Register - Input phone             ${phone}

Register - Input phone
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_phone_number}         ${input}

Display warning message phone number
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_phone_number_text}         SeleniumLibrary.Get Text       ${warning_phone_number}
    Should Be Equal As Strings    ${warning_phone_number_text}          ${expected_display}

Display warning message existing phone number
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_existing_phone_text}         SeleniumLibrary.Get Text       ${warning_existing_phone}
    Should Be Equal As Strings    ${warning_existing_phone_text}          ${expected_display}

User click sign up register button
    SeleniumLibrary.Click Element          ${btn_signup_register}

Verify after click sign up register button
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_phone_number_verify}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_verify_phone_number}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_verify_code}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_confirm}

User input verify code
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_verify_code}
    SeleniumLibrary.Input Text                       ${txt_verify_code}     111111
    #Biasanya automation yg saya buat cara untuk dapetin verify code ambil dari API atau dari table, karena sekarang belum punya aksesnya jadi di input manual

User click confirm button
    SeleniumLibrary.Click Element          ${btn_confirm}

Verify after click confirm button
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_complete_account}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_email}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_username}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_password}

User input email username password
    [Arguments]         ${email}  ${username}  ${password}
    Register - Input email             ${email}
    Register - Input username          ${username}
    Register - Input password          ${password}

Register - Input email
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_email}         ${input}

Register - Input username
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_username}      ${input}

Register - Input password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_password}      ${input}

Display warning message email or username
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_email_or_username_text}         SeleniumLibrary.Get Text       ${warning_email_or_username}
    Should Be Equal As Strings    ${warning_email_or_username_text}          ${expected_display}

Display warning message password
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_password_text}         SeleniumLibrary.Get Text       ${warning_password}
    Should Be Equal As Strings    ${warning_password_text}          ${expected_display}

User open pop up date of birth
    SeleniumLibrary.Click Element       ${txt_date_of_birth}

User select year month date
    SeleniumLibrary.Click Element       ${select_year}
    SeleniumLibrary.Click Element       ${select_mount}
    SeleniumLibrary.Click Element       ${select_date}

User click submit button
    SeleniumLibrary.Click Element       ${btn_submit}

Verify success login or register home femaledaily
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_profile}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_start_here}