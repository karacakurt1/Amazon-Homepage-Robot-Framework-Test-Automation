*** Settings ***
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${TIME} =  5

*** Keywords ***
attribute
    [Arguments]     ${LOCATOR}      ${TYPE}
    ${COUNT} =  Set Variable    0
    WHILE  ${COUNT}<1
        ${value} =  Get Element Attribute    ${LOCATOR}    ${TYPE}
        TRY
             ${value} =  Convert To Integer  ${value}
             Should Be Equal    ${value}     ${EMPTY}
        EXCEPT
             ${COUNT} =  Set Variable    1
        END
    END
    [Return]    ${value}

click
    [Arguments]     ${LOCATOR}
    Wait Until Element Is Visible    ${LOCATOR}     ${TIME}
    Click Element    ${LOCATOR}     ${TIME}

window scrolling
    [Arguments]  ${y}
    Execute Javascript  window.scroll(0,${y})

find
    [Arguments]     ${LOCATOR}
    ${y} =  Set Variable    300
    ${COUNT} =  Set Variable    0
    WHILE  ${COUNT}<1
         TRY
             Wait Until Element Is Visible      ${LOCATOR}    10
             ${COUNT} =     Set Variable    1
         EXCEPT
             Execute Javascript     window.scroll(0,${y})
             ${y} =     Convert To Integer      ${y}
             ${y} =     Set Variable     ${y+200}
         END
    END

cookie
    TRY
        Wait Until Element Is Visible    ${cookie}
        Click Element    ${cookie}
    EXCEPT
        Wait Until Element Is Not Visible    ${cookie}
    END

list control
    [Arguments]     ${Buttons}      ${Card}     ${y}
    utils.cookie
    window scrolling  ${y}
    @{ButtonsList} =  Get WebElements    ${Buttons}
    @{CardList} =  Get WebElements    ${Card}
    ${SIZEBUTTON} =  Get Length  ${ButtonsList}
    ${SIZECARD} =  Get Length    ${CardList}
    FOR    ${INDEX}    IN RANGE  ${SIZECARD}
        ${COUNT} =  Set Variable    0
        WHILE  ${COUNT}<1
            TRY
                utils.cookie
                @{ButtonsList} =  Get WebElements    ${Buttons}
                @{CardList} =  Get WebElements    ${Card}
                Wait Until Element Is Visible    ${CardList}[${INDEX}]    ${TIME}
                ${GETURL} =     Get Location
                Click Element    ${CardList}[${INDEX}]
                ${GETURL1} =     Get Location
                Should Not Be Equal    ${GETURL}    ${GETURL1}
                Go Back
                ${COUNT} =  Set Variable    1
            EXCEPT
                Click Element   ${ButtonsList}[1]
            END
        END
    END

    FOR    ${counter}    IN RANGE    3
        cookie
        @{ButtonsList} =  Get WebElements    ${Buttons}
        Click Element   ${ButtonsList}[1]
    END
    ${COUNT} =  Set Variable    0
    WHILE  ${COUNT}<1
        @{ButtonsList} =  Get WebElements    ${Buttons}
        @{CardList} =  Get WebElements    ${Card}
        TRY
            Wait Until Element Is Visible    ${CardList}[0]   ${TIME}
            ${COUNT} =  Set Variable    1
        EXCEPT
            Click Element   ${ButtonsList}[0]
        END
    END

control of pictures and texts

