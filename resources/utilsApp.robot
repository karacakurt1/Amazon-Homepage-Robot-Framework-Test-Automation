*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
create session
    Set Selenium Speed	0.1 seconds
    Open Browser  about:blank  chrome
    Maximize Browser Window

close session
    Close All Browsers
