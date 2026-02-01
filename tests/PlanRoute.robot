*** Settings ***
Documentation       Plan a round trip route in the app

Resource            resources/common.resource

Test Tags           route-planning


*** Test Cases ***
User Plans A Road Cycling Trip To Bieberstein
    [Documentation]    Planning a Cycling Route
    [Tags]    saving-tour
    Open Test Application    true
    Open Route Planning Page
    Set Route Type As Round Trip
    Set Start Location    Fulda ZOB
    Set End Location    Bieberstein Castle
    Save The Trip    Trip To Bieberstein Castle
    Verify The Trip Was Saved


*** Keywords ***
Open Route Planning Page
    [Documentation]    Clicks on Routes from the bottom naviagtion bar
    Click On Routes From Navigation Bar
    Click On Plan New In Search Bar
    Expect Element    ${PLANNING_TOOLBAR}    visible

Set Route Type As Round Trip
    [Documentation]    Sets the Route Type as Round Trip in the planning menu
    Click On Route Type Selection Menu
    Select Round Trip From Route Type Menu
    Click On Route Type Selection Menu

Set Start Location
    [Documentation]    Sets the Start Location for the route
    [Arguments]    ${start_location}
    Click Start Location
    Type Location In Input Field    ${start_location}
    Click On First Search Result

Set End Location
    [Documentation]    Sets the End Location for the route
    [Arguments]    ${end_location}
    Click On Choose Waypoint
    Type Location In Input Field    ${end_location}
    Click On First Search Result

Save The Trip
    [Documentation]    Saves the planned trip by clickin on save and typing the title
    [Arguments]    ${title}
    Click On Save
    Input Title To Save Trip    ${title}
    Click On Okay In Title Input Field

Verify The Trip Was Saved
    [Documentation]    Checks if trip was saved
    Expect Element    //*[contains(@text, 'You planned a')]    visible
    Expect Element    //*[@text='Navigate']    visible
