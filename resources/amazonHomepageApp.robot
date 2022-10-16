*** Settings ***
Resource  ./po/amazonHomepage.robot

*** Keywords ***
home cover photo change combine
    amazonHomepage.go to homepage
    amazonHomepage.home cover photo change click and photo control

sing in combine
    amazonHomepage.go to homepage
    amazonHomepage.sing in control

list top combine
    amazonHomepage.go to homepage
    amazonHomepage.list top control

boxes, pictures and texts combine
    amazonHomepage.go to homepage
    amazonHomepage.control boxes, pictures and texts

list 1 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 1 control

list 2 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 2 control

list 3 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 3 control

list 4 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 4 control

list 5 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 5 control

list 6 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 6 control

list 7 combine
    amazonHomepage.go to homepage
    amazonHomepage.list 7 control







