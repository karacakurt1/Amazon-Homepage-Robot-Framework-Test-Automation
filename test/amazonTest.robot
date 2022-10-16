*** Settings ***
Resource  ../resources/utilsApp.robot
Resource    ../resources/amazonHomepageApp.robot

Test Setup  create session
Test Teardown  close session

*** Test Cases ***
home cover photo change
    amazonHomepageApp.home cover photo change combine

sing in
    amazonHomepageApp.sing in combine

boxes, pictures and texts
    amazonHomepageApp.boxes, pictures and texts combine

list top
    amazonHomepageApp.list top combine

list 1
    amazonHomepageApp.list 1 combine

list 2
    amazonHomepageApp.list 2 combine

list 3
    amazonHomepageApp.list 3 combine

list 4
    amazonHomepageApp.list 4 combine

list 5
    amazonHomepageApp.list 5 combine

list 6
    amazonHomepageApp.list 6 combine

list 7
    amazonHomepageApp.list 7 combine



