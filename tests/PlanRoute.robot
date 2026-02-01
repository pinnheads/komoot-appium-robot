*** Settings ***
Documentation       Plan a route in the app

Resource            resources/common.resource


*** Test Cases ***
User Plans A Road Cycling Trip To Bieberstein
    [Documentation]    Planning a Cycling Route
    Open Test Application    true
    Open Route Planning Page
    #    Set Road Cycling Mode
    #    Set Relaxed Pace
    Set Route Type As Round Trip
    Set Start Location    Fulda ZOB
    Set End Location    Bieberstein Castle
    Save The Trip    Trip To Bieberstein Castle
    Verify The Trip Was Saved


*** Keywords ***
Open Route Planning Page
    [Documentation]    Clicks on Routes from the bottom naviagtion bar
    Expect Element    //android.view.View[@resource-id='navigation_bar_plan']    visible
    Click Element    //android.view.View[@resource-id='navigation_bar_plan']
    Expect Element    //android.view.View[@resource-id='navigation_start_planner']    visible
    Click Element    //android.view.View[@resource-id='navigation_start_planner']
    Expect Element    //android.view.ViewGroup[@resource-id="de.komoot.android:id/toolbar"]    visible

Set Road Cycling Mode
    [Documentation]    Selects desired sport in the planning menu

    # Open Sport Selection Menu
    Click Element    //android.widget.RelativeLayout[android.widget.TextView[@text="Sport"]]
    Expect Element
    ...    //android.widget.FrameLayout[@resource-id="de.komoot.android:id/psfb_expanend_row_container_fl"]
    ...    visible
    Click Element    xpath=(//android.widget.FrameLayout[@resource-id="de.komoot.android:id/stlivh_container"])[4]
    Expect Text    Road cycling    visible
    # Close Sport Selection Menu
    Click Element    //android.widget.RelativeLayout[android.widget.TextView[@text="Sport"]]

Set Relaxed Pace
    [Documentation]    Sets the pace as Relaxed for the route in the planning menu
    # Open Pace Setting Menu
    Click Element    //android.widget.RelativeLayout[android.widget.TextView[@text="Pace"]]

    # Decrease the pace to relaxed to start from
    ${is_relaxed_visible}=    Run Keyword And Return Status    Expect Text    Relaxed    visible
    WHILE    not ${is_relaxed_visible}    limit=5
        Click Element    //android.widget.ImageButton[@resource-id="de.komoot.android:id/pflfb_fitness_minus_ib"]
        ${is_relaxed_visible}=    Run Keyword And Return Status    Expect Text    Relaxed    visible
    END

Set Route Type As Round Trip
    [Documentation]    Sets the Route Type as Round Trip in the planning menu
    Click Element    //android.widget.RelativeLayout[android.widget.TextView[@text="Route Type"]]
    Expect Element
    ...    //android.widget.RadioGroup[@resource-id="de.komoot.android:id/porfb_expanend_row_container_rg"]
    ...    visible
    Click Element    //android.widget.RadioButton[@resource-id="de.komoot.android:id/porfb_round_trip_trb"]
    Click Element    //android.widget.RelativeLayout[android.widget.TextView[@text="Route Type"]]

Set Start Location
    [Documentation]    Sets the Start Location for the route
    [Arguments]    ${start_location}
    Click Element
    ...    //android.widget.TextView[@resource-id="de.komoot.android:id/textview_waypoint_name" and @text="Current Location"]
    Expect Element
    ...    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    ...    visible
    Click Element    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    Input Text
    ...    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    ...    ${start_location}
    Expect Element    //*[@text='Fulda Bahnhof / ZOB, Fulda']    visible
    Click Element    //*[@text='Fulda Bahnhof / ZOB, Fulda']

Set End Location
    [Documentation]    Sets the End Location for the route
    [Arguments]    ${end_location}
    Expect Element
    ...    //android.widget.TextView[@resource-id="de.komoot.android:id/textview_waypoint_name" and @text="Choose Waypoint"]
    ...    visible
    Click Element
    ...    //android.widget.TextView[@resource-id="de.komoot.android:id/textview_waypoint_name" and @text="Choose Waypoint"]
    Expect Element
    ...    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    ...    visible
    Click Element    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    Input Text
    ...    //android.widget.AutoCompleteTextView[@resource-id="de.komoot.android:id/search_src_text"]
    ...    ${end_location}
    Expect Element
    ...    //android.widget.LinearLayout[android.widget.TextView[@resource-id="de.komoot.android:id/textview_list_item_label"]]
    ...    visible
    Click Element
    ...    //android.widget.LinearLayout[android.widget.TextView[@resource-id="de.komoot.android:id/textview_list_item_label"]]

Save The Trip
    [Documentation]    Saves the planned trip by clickin on save and typing the title
    [Arguments]    ${title}
    Expect Element    //android.widget.TextView[@resource-id="save_tour"]    visible
    Click Element    //android.widget.TextView[@resource-id="save_tour"]
    Expect Element
    ...    //android.widget.FrameLayout[@resource-id="de.komoot.android:id/edittext_name_container"]
    ...    visible
    Clear Text    //*[@resource-id="de.komoot.android:id/edittext_name"]
    Input Text    //*[@resource-id="de.komoot.android:id/edittext_name"]    ${title}
    Click Element    //android.widget.TextView[@resource-id="de.komoot.android:id/textview_button_okay"]

Verify The Trip Was Saved
    [Documentation]    Checks if trip was saved
    Expect Element    //*[contains(@text, 'You planned a')]    visible
    Expect Element    //*[@text='Navigate']    visible
