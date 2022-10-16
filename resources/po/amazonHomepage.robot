*** Settings ***
Resource  utils.robot

*** Variables ***
${URL} =  https://www.amazon.com.tr/

${signUp} =  css=a[class*='a-button-text']

${photoButtons} =  css=i[class*='a-icon a-icon-']
${photoClickButton} =  css=div[class='a-row a-carousel-controls a-carousel-row a-carousel-has-buttons a-carousel-overlay-buttons a-carousel-rounded-buttons']
${photoCard} =  css=div[class='a-carousel-viewport'] li[class='a-carousel-card']  img[alt]
${photoValue} =  css=input[class='a-carousel-firstvisibleitem']

${featuredDealButtons} =  css=div[class*='feed-carousel first-carousel'] a[aria-label*='Carousel']
${featuredDealCard} =  css=div[class*='feed-carousel first-carousel'] img[src]

${cookie} =  css=input[id='sp-cc-accept']
${texts} =  css=a[class='a-link-normal see-more truncate-1line']
${images} =  css=div[class='a-section a-spacing-none fluid-image-container']

${listtTopButtons}=  css=div[id='desktop-top'] a[aria-label*='Carousel']
${listTopCard} =  css=div[id='desktop-top'] li[class*='feed-carousel-card']

${list1Buttons}=  css=div[id='desktop-1'] a[aria-label*='Carousel']
${list1Card} =  css=div[id='desktop-1'] li[class*='feed-carousel-card']

${list2Buttons} =  css=div[id='desktop-2'] a[aria-label*='Carousel']
${list2Card} =  css=div[id='desktop-2'] li[class*='feed-carousel-card']

${list3Buttons} =  css=div[id='desktop-3'] a[aria-label*='Carousel']
${list3Card} =  css=div[id='desktop-3'] li[class*='feed-carousel-card']

${list4Buttons} =  css=div[id='desktop-4'] a[aria-label*='Carousel']
${list4Card} =  css=div[id='desktop-4'] li[class*='feed-carousel-card']

${list5Buttons} =  css=div[id='desktop-5'] a[aria-label*='Carousel']
${list5Card} =  css=div[id='desktop-5'] li[class*='feed-carousel-card']

${list6Buttons} =  css=div[id='desktop-6'] a[aria-label*='Carousel']
${list6Card} =  css=div[id='desktop-6'] li[class*='feed-carousel-card']

${list7Buttons} =  css=div[id='desktop-7'] a[aria-label*='Carousel']
${list7Card} =  css=div[id='desktop-7'] li[class*='feed-carousel-card']

*** Keywords ***
go to homepage
    Go To    ${URL}

sing in control
    ${GETURL} =     Get Location
    click    ${signUp}
    ${GETURL1} =     Get Location
    Should Not Be Equal    ${GETURL}    ${GETURL1}

home cover photo change click and photo control
    cookie
    @{photoButtonsList} =  Get WebElements    ${photoButtons}
    @{photoCardList} =  Get WebElements    ${photoCard}
    ${SIZECARD} =  Get Length    ${photoCardList}
    ${SIZEBUTTON} =  Get Length    ${photoButtonsList}
    FOR    ${COUNTER}    IN    0    ${SIZEBUTTON-1}
        FOR    ${INDEX}    IN RANGE  1      ${SIZECARD}
            ${COUNT} =  Set Variable    0
            WHILE  ${COUNT}<1
                 TRY
                     cookie
                     @{photoCardList} =  Get WebElements    ${photoCard}
                     ${value} =  attribute    ${photoValue}    value
                     ${value} =  Convert To Integer    ${value}
                     Should Be Equal    ${value}     ${INDEX}
                     ${GETURL} =     Get Location
                     Wait Until Element Is Visible   ${photoClickButton}
                     Click Element    ${photoClickButton}
                     ${GETURL1} =     Get Location
                     Go Back
                     Should Not Be Equal    ${GETURL}    ${GETURL1}
                     ${COUNT} =  Set Variable    1
                 EXCEPT
                    @{photoButtonsList} =  Get WebElements    ${photoButtons}
                     Click Element    ${photoButtonsList}[${COUNTER}]
                 END
            END
        END
    END

control boxes, pictures and texts
    cookie
    @{listTexts} =  Get WebElements    ${texts}
    ${SIZETEXTS} =  Get Length    ${listTexts}
    FOR    ${counter}    IN RANGE    ${SIZETEXTS}
        Continue For Loop If     ${counter}==7
        cookie
        @{listTexts} =  Get WebElements    ${texts}
        ${GETURL} =     Get Location
        Wait Until Element Is Visible    ${listTexts}[${counter}]
        Click Element    ${listTexts}[${counter}]
        ${GETURL1} =     Get Location
        Should Not Be Equal    ${GETURL}    ${GETURL1}
        Go Back
    END
    @{listImages} =  Get WebElements  ${images}
    ${SIZEIMAGES} =  Get Length    ${listImages}
    FOR    ${counter}    IN RANGE    ${SIZEIMAGES}
        cookie
        @{listImages} =  Get WebElements  ${images}
        ${GETURL} =     Get Location
        Wait Until Element Is Visible   ${listImages}[${counter}]
        Click Element    ${listImages}[${counter}]
        ${GETURL1} =     Get Location
        Should Not Be Equal    ${GETURL}    ${GETURL1}
        Go Back
    END
list top control
    utils.list control    ${list1Buttons}      ${list1Card}     1200

list 1 control
    utils.list control    ${list1Buttons}      ${list1Card}     1400

list 2 control
    utils.list control    ${list2Buttons}      ${list2Card}     1700

list 3 control
    utils.list control    ${list3Buttons}      ${list3Card}     2400

list 4 control
    utils.list control    ${list4Buttons}      ${list4Card}     3000

list 5 control
    utils.list control    ${list5Buttons}      ${list5Card}     4000

list 6 control
    utils.list control    ${list6Buttons}      ${list6Card}     5000

list 7 control
    utils.list control    ${list7Buttons}      ${list7Card}     6000

