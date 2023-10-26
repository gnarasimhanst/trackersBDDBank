Feature: 1 Trackers Conditional Formatting - View/Edit/Add FormattinUser sg rules

    Background: The user has access to Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the Trackers page. A tracker record is created using project fields of all data types supported by Salesforce. Also, the user has clicked on the wrench icon and navigated to the conditional formatting modal.

    Scenario: 1.1 User should be able to view the list of existing rules on that tracker [DT-A]
        Given I am in the conditional formatting modal.
        Then I should be able to view all the existing rules
        And I should be able to view the edit button for each rule
        And I should be able to view the add rule button to add a new rule

    Scenario: 1.2 hould be able to reorder the list of existing rules on that tracker [DT-A]
        Given I am in the conditional formatting modal.
        Then I should be able to reorder the existing rules using drag-and-drop

    Scenario: 1.3 User should be taken to the Edit formatting tab and should be able to view the filters of the selected rule when the Edit button is clicked [DT-A]
        Given I am in the conditional formatting modal.
        When I click on the edit button for any of the existing rules
        Then The screen should navigate to the Edit Formatting tab
        And should have the filters for the selected rule

    Scenario: 1.4 The User should be taken to the Edit formatting tab when the Add Rule button is clicked [DT-A]
        Given I am in the conditional formatting modal.
        When I click on the Add Rule button
        Then The screen should navigate to the Edit Formatting tab
        And I should have the filter value menu to add new filters

    Scenario: 1.5 When the delete button is clicked, the corresponding rule should get deleted [DT-A]
        Given I am in the conditional formatting modal.
        When I click on the Delete button for any of the existing rules
        Then The corresponding rule should get deleted from the list.

    Scenario: 1.6 User should be able to view updated formatting rules [QA-A]
        Given I am in the conditional formatting model.
        When I close the conditional formatting modal.
        And I change the selected tracker in the tracker dropdown
        And I reopen the conditional formatting modal.
        Then I should be able to view all the existing rules for the new tracker

    Scenario: 1.7 The formatting rules without name should have Rule {index} as name [DT-A]
        Given I am in the conditional formatting model.
        And certain rule doesn't have a name.
        Then The rule name should be Rule {index}

    Scenario: 1.8 The rule title and rule background should have style as defined [DT-A]
        Given I am in the conditional formatting model.
        Then I should be able to view all the existing rules for the tracker
        And The rule title should have styling as defined in rule (Bold, Italic, Underline, Strikethrough, text color)
        And The rule background should be as defined in rule

Feature: 2 Trackers - Edit formatting Filter Criteria
    Background: The user can access Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the Trackers page. A tracker record is created using project fields of all data types supported by Salesforce. Also, the user has clicked on the wrench icon and navigated to the conditional formatting modal.

    Scenario: 2.1  Users should be able to view the initial state of the Filter Criteria section in the Edit Formatting tab [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        Then I should see a row present in the filter criteria section
        And the row should have a + and - button
        And the fields column should have a searchable dropdown with all the fields Present in the tracker columns list with the default option selected as 'None'
        And the operator column should have all the operators populated with default None selected
        And the value column should have a text box with an empty value
        And the last columns should have a button with the label 'Relative Values'

    Scenario: 2.2 The User should be able to view only applicable operators upon selecting a field [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select a field of type <field_type> in the filter criteria section
        Then the operator options should be updated
        And The first option should be auto-selected

    field_type | operator options |
    checkbox   | equals, not equal to
    currency   | equals, not equal to, less than, greater than, less or equal, greater or equal
    date/dateTime/time | equals, not equal to, less than, greater than, less or equal, greater or equal
    email/picklist/phone/picklist/picklist(multi-select)/text/text area/Url | equals, not equal to, starts with, contains, does not contain
    geolocation/number/percent | equals, not equal to, less than, greater than, less or equal, greater or equal

    Scenario: 2.3 User should be able to view all the picklist values when the selected field type is a picklist [QA-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select a field of type 'picklist' or 'multi-select picklist'
        Then A search icon should be visible next to the Value
        When I click on the search icon
        Then The list of all the records with a maximum limit of 200 should be listed.
        When I select a set of values
        And click OK
        Then The value should be populated in the filter criteria.

    Scenario: 2.4 User should be able to view the modal box with records when clicking on the search icon [QA-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select a field of type 'Name'
        Then the value input should be replaced with a lookup component
        When I start typing the name I am looking for
        Then I should see the available records with that name for selection
        When I select the record I want
        Then selected value should be populated

    Scenario: 2.5 The User should be able to view the value textbox when the Relative Values Button is clicked again [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select a field of any type
        And I click on the 'Relative values' button
        Then the value textbox will not be displayed
        And a combo box for field selection will be displayed
        When I click on the 'Relative values' button again
        Then the combo box for field selection will not be displayed
        And the value textbox will  be displayed

    Scenario: 2.6 The User should be able to view the relative fields when the Relative Values Button is clicked [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select a field of type <field_type>
        And I click on the 'Relative values' button
        Then the list of fields with <matching_field_type> should be visible as a dropdown in the Value
        When I change the field to another <field_type>
        Then the list of fields with <matching_field_type> should be updated in dropdown options

    field_type | matching_field_type
    checkbox | checkbox
    currency/percent/geolocation/number | currency, geolocation, number, percent
    date | date, dateTime
    dateTime | date, dateTime
    time | time
    text/picklist/text area | email, phone, picklist, picklist(multi-select), text, text area, URL
    percent | percent, number

    Scenario: 2.7 The User is able to add/delete a new row of filter criteria in the Conditional Formatting modal [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select any field from the list of fields in the first row of the Filter criteria section
        And I click on the + sign button.
        Then A new row gets added.
        When I click on - the sign button.
        Then The newly added row gets deleted.

    Scenario: 2.8 User sees a lightening toast when trying to add a new row when no rows exist in the filter criteria [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I click on the + sign button.
        Then A toast is shown with the message “Please choose a filter before trying to add a new one”.

    Scenario: 2.9 User sees None in Field and Operator when - sign button is used for one row in filter criteria [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I select any field from the searchable drop-down
        And I click on - the sign button.
        Then The Field shows None and the Operator shows “--None--”.

    Scenario: 2.10: The User sees a lightning toast when clicking on relative values without adding any field [DT-A]
        Given I am in the conditional formatting modal box
        When I click on the 'Edit Formatting' tab
        And I click on the 'Relative Values' button
        Then A toast is shown with the message “You must select a field first”.

Feature: 3 Conditional Formatting - Filter Logic
    Background: The user has access to Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the Trackers page. A tracker record is created using project fields of all data types supported by Salesforce. Also, the user has clicked on the wrench icon and navigated to the conditional formatting modal. And the user has either chosen one rule and moved to edit or has clicked add rule

    Scenario: 3.1 User should be able to view the input box to add filter logic [DT-A]
        Given I am in the edit formatting tab from Add Rule.
        Then I should be able to view a text box to add filter logic

    Scenario: 3.2 User should be able to add/update values to filter logic [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I add/update value to filter logic
        Then The filter logic should be updated

    Scenario: 3.3 User to should be able to see prefilled values for edit rule [QA-A]
        Given I am in the edit formatting tab from Edit Rule.
        Then I should be able to see all filter logic values to be pre-filled based on rule id

    Scenario: 3.4 User should see a validation message when fields arent filled and they focus on filter logic [DT-A]
        Given I in the edit formatting tab.
        When I focus on filter logic input text box and it is empty
        Then If fields of filter criteria aren't filled I should see a toast message
        And The message should be 'Please ensure that all filter criteria is updated with appropriate values'

    Scenario: 3.5 User should see a filter logic prefilled  on focus if fields are entered in filter criteria [DT-A]
        Given I in the edit formatting tab.
        When I focus on filter logic input text box and it is empty
        Then If fields of filter criteria are filled, the Filter logic should be auto populated

Feature: 4 Conditional Formatting - Filter Formatting

    Background: The user has access to Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the Trackers page. A tracker record is created using project fields of all data types supported by Salesforce. Also, the user has clicked on the wrench icon and navigated to the conditional formatting modal. And the user has either chosen one rule and moved to edit or has clicked add rule

    Scenario: 4.1 User should be able to view the options to add filter formatting [DT-A]
        Given I am in the edit formatting tab from Add Rule.
        Then I should be able to view a drop down to add format field
        And I should be able to view a text box to add format name
        And I should be able to view a button group for styling (Bold, Italic, Underline, Strikethrough)
        And I should be able to view color pickers to choose colors for text and background

    Scenario: 4.2 User should be able to add/update format field [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I add/update value to format field
        Then The filter field should be updated

    Scenario: 4.3 User should be able to add/update format name [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I add/update value to filter name
        Then The format name should be updated

    Scenario: 4.4 User should be able to add/update format styling (Bold, Italic) [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I click/unclick buttons of button group for styling (Bold, Italic)
        Then The buttons should be highlighting accordingly

    Scenario: 4.5 User should be able to add/update format styling (Underline) [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I click button Underline of button group
        Then The buttons Underline should be highlighted and Strikethrough shouldn't be if it was before

    Scenario: 4.6 User should be able to add/update format styling (Strikethrough) [DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I click button strikethrough of button group
        Then The buttons strikethrough should be highlighted and underline shouldn't be if it was before

    Scenario: 4.7 User should be able to see default color for text and background [DT-A]
        Given I am in the edit formatting tab from Add Rule.
        Then I should be able to see #5679c0 as default background color
        And I should be able to see #000000 as default text color

    Scenario: 4.8 User should be able to add/update colors for text and background[DT-A]
        Given I am in the edit formatting tab from Add Rule/Edit Rule.
        When I pick colour for text and background
        Then The colour should be upgraded accordingly

    Scenario: 4.9 Format Field Dropdown should have tracker columns [DT-A]
        Given I am in the edit formatting tab from Add Rule.
        Then I should be able to view all the columns in dropdown of format field
        And a Row option in dropdown of format field

    Scenario: 4.10 User to should be able to see prefilled values for edit rule [QA-A]
        Given I am in the edit formatting tab from Edit Rule.
        Then I should be able to see all filter formatting values to be pre-filled based on rule id

Feature: 4 Trackers Conditional Formatting - Delete a formatting rule from the list and Submit

    Background: The user can access Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the Trackers page. A tracker record is created using project fields of all data types supported by Salesforce. Also, the user has clicked on the wrench icon and selected Conditional formatting.

    Scenario: 4.1 The user should be able to delete a rule from the list of existing conditional formatting rules on that tracker [QA-A]
        Given I am in the conditional formatting model
        And I can view all the existing conditional formatting rules
        When I click on the delete button for any of the existing rules
        Then That rule should be removed from the list
        When I click on the Submit button
        Then the conditional formatting modal dialog should be closed
        And the tracker that is opened is refreshed
        When I click on the wrench icon and open conditional formatting
        Then I should see the updated rules list in the Formatting Rules tab

    Scenario: 4.2 The user should be able to re-order the  existing list of conditional formatting rules on that tracker [QA-A]
        Given I am in the conditional formatting model
        And I can view all the existing conditional formatting rules which are more than 4
        When I drag the first rule and drop it at the third position
        Then That rule should be placed in the lowered position
        When I click on the Submit button
        Then the conditional formatting modal dialog should be closed
        And the tracker that is opened is refreshed with conditional formatting applied in modified sequence
        When I click on the wrench icon and open conditional formatting
        Then I should see the re-ordered rules list in the Formatting Rules tab

Feature: 5 Trackers Conditional Formatting - Add a new rule and save it

    Scenario: 5.1 The user can create a new rule and submit it successfully [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I click on the Submit button
        Then the conditional formatting modal dialog should be closed
        And the tracker that is opened is refreshed with the conditional formatting applied to the rows in the tracker that are eligible for the filter criteria selected earlier
        When I click on the wrench icon and open conditional formatting
        Then I should see the new rule created with the name Rule 1 in the Formatting Rules tab

    Scenario: 5.2 The user can't create a new rule and submit it successfully with invalid filter criteria row [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I don't select a field, but just the operand and provide a value
        And I click on the Submit button
        Then it should display a validation error message in the modal header with the message 'Please select a field and operand for row number 1 in Filter Criteria'

    Scenario: 5.3 The user can't create a new rule and submit it successfully with no filter logic [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I click on the + button
        And I select a field, operand, and provide a value
        And I click on the Submit button
        Then it should display a validation error message in the modal header with the message 'Please enter valid filter logic'

    Scenario: 5.4 The user can't create a new rule and submit it successfully with invalid filter logic query [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I click on the + button
        And I select a field, operand, and provide a value
        And I enter the string '1 AND' or 'AND 1' or '1 AND 2 OR'
        And I click on the Submit button
        Then it should display a validation error message in the modal header with the message 'Please enter valid filter logic'

    Scenario: 5.5 The user can't create a new rule and submit it successfully with invalid filter logic number [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I click on the + button
        And I select a field, operand, and provide a value
        And I enter the string '1 AND 3'
        And I click on the Submit button
        Then it should display a validation error message in the modal header with the message 'Please enter valid filter logic'

    Scenario: 5.6 The user can create a new rule and submit it successfully with a valid filter logic [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I click on the + button
        And I select a field, operand, and provide a value
        And I click on the + button
        And I select a field, operand, and provide a value
        And I enter the string '1 AND 2 AND 3' or '1 AND 2 OR 3' or '(1 AND 2) OR 3'
        And I click on the Submit button
        Then the conditional formatting modal dialog should be closed
        And the tracker that is opened is refreshed with the conditional formatting applied to the rows in the tracker that are eligible for the filter criteria selected earlier
        When I click on the wrench icon and open conditional formatting
        Then I should see the new rule created with the name 'Rule 2' in the Formatting Rules tab

    Scenario: 5.7 The user can create a new rule and submit it successfully with a valid filter logic [QA-A]
        Given I am in the conditional formatting model
        When I click on the Add Rule button
        Then it should open the Edit Formatting tab with a new filter criteria row
        When I select a field, operand, and provide a value
        And I enter a value 'tracker rule' in the Format Name field
        And I click on the Bold icon button
        And I select the background color as '#e3abec'
        And I select the text color as '#ffffff'
        And I click on the Submit button
        Then the conditional formatting modal dialog should be closed
        And the tracker that is opened is refreshed with the rows in the tracker that are eligible for the filter criteria selected earlier in Bold also having background color '#e3abec' and text color '#ffffff'
        When I click on the wrench icon and open conditional formatting
        Then I should see the new rule created with the name 'tracker rule' in the Formatting Rules tab