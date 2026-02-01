*** Settings ***
Documentation       Contains locators and reusable keywords for the routes page

Library             AppiumLibrary


*** Variables ***
${PLAN_NEW_BUTTON}                      //android.view.View[@resource-id='navigation_start_planner']

# Custom Route Planning Menu
${PLANNING_TOOLBAR}                     //android.view.ViewGroup[@resource-id="de.komoot.android:id/toolbar"]
${PLANNING_ROUTE_TYPE_MENU}             //android.widget.RelativeLayout[android.widget.TextView[@text="Route Type"]]
${PLANNING_ROUTE_TYPE_OPTIONS}          //android.widget.RadioGroup[@resource-id="de.komoot.android:id/porfb_expanend_row_container_rg"]
${ROUTE_TYPE_ROUND_TRIP_BTN}            //android.widget.RadioButton[@resource-id="de.komoot.android:id/porfb_round_trip_trb"]
${START_LOCATION_SEARCH_FIELD}          //android.widget.TextView[@resource-id="de.komoot.android:id/textview_waypoint_name" and contains(@text, "Current Location")]
${LOCATION_INPUT_FIELD}                 //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
${FIRST_LOCATION_SEARCH_RESULT}         xpath=(//android.widget.LinearLayout[android.widget.TextView[@resource-id="de.komoot.android:id/textview_list_item_label"]])[1]
${WAYPOINT_LOCATION_SEARCH_FIELD}       //android.widget.TextView[@resource-id="de.komoot.android:id/textview_waypoint_name" and @text="Choose Waypoint"]
${SAVE_TOUR_BUTTON}                     //android.widget.TextView[@resource-id="save_tour"]
${SAVE_TOUR_TITLE_MODAL}                //android.widget.FrameLayout[@resource-id="de.komoot.android:id/edittext_name_container"]
${SAVE_TOUR_TITLE_INPUT_FIELD}          //*[@resource-id="de.komoot.android:id/edittext_name"]
${SAVE_TOUR_OKAY_BUTTON}                //android.widget.TextView[@resource-id="de.komoot.android:id/textview_button_okay"]


*** Keywords ***
Click On Plan New In Search Bar
    [Documentation]    Clicks on plan new btn in the search bar
    Wait Until Element Is Visible    ${PLAN_NEW_BUTTON}
    Click Element    ${PLAN_NEW_BUTTON}

Click On Route Type Selection Menu
    [Documentation]    Opens route type selection menu by clicking on it
    Click Element    ${PLANNING_ROUTE_TYPE_MENU}

Select Round Trip From Route Type Menu
    [Documentation]    Clicks on round trip radio button by clicking on it
    Wait Until Element Is Visible    ${ROUTE_TYPE_ROUND_TRIP_BTN}
    Click Element    ${ROUTE_TYPE_ROUND_TRIP_BTN}

Click Start Location
    [Documentation]    Click the start location search area
    Wait Until Element Is Visible    ${START_LOCATION_SEARCH_FIELD}
    Click Element    ${START_LOCATION_SEARCH_FIELD}

Type Location In Input Field
    [Documentation]    Enter text into the location search field
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${LOCATION_INPUT_FIELD}
    Input Text    ${LOCATION_INPUT_FIELD}    ${text}

Click On First Search Result
    [Documentation]    Click on the first search result for location
    Wait Until Element Is Visible    ${FIRST_LOCATION_SEARCH_RESULT}
    Click Element    ${FIRST_LOCATION_SEARCH_RESULT}

Click On Choose Waypoint
    [Documentation]    Click on Choose Waypoint search area
    Wait Until Element Is Visible    ${WAYPOINT_LOCATION_SEARCH_FIELD}
    Click Element    ${WAYPOINT_LOCATION_SEARCH_FIELD}

Click On Save
    [Documentation]    Click on save tour button after tour planning
    Wait Until Element Is Visible    ${SAVE_TOUR_BUTTON}
    Click Element    ${SAVE_TOUR_BUTTON}

Input Title To Save Trip
    [Documentation]    Input text in the save trip as 'title' modal
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${SAVE_TOUR_TITLE_MODAL}
    Clear Text    ${SAVE_TOUR_TITLE_INPUT_FIELD}
    Input Text    ${SAVE_TOUR_TITLE_INPUT_FIELD}    ${text}

Click On Okay In Title Input Field
    [Documentation]    Click on okay in input title modal
    Click Element    ${SAVE_TOUR_OKAY_BUTTON}
