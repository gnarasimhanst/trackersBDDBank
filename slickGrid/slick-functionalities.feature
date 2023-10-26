Feature: Slick Grid

    Background: There are 2 record types test 1 and test 2 configured for Site object. The picklist values for 'Site status' for 'test 1' can be 'Active, On-Air' and 'Backlog, De-comissioned' for 'test 2'. The picklist values for Site type for test 1 can be Manhole, Handhole and Small Cell, Fibre Node for test 2 The site records in the org are associated with either of the record type. There is a tracker created on Sites object with columns 'Site status' and 'Site type'.

    Scenario: Picklist values to be shown based on the record type configuration
        Given The user is on Trackers tab of Sitetracker App
        When I open tracker for Site object
        And I Edit site type column for a site record associated with record type 'test 1'
        Then the pick list values should have 'Manhole, Handhole' values to select from
        When I Edit site type column for a site record associated with record type 'test 2'
        Then the pick list values should have 'Small Cell, Fibre Node' values to select from
        And I Edit site type column for a site record associated with record type 'test 1'
        Then the pick list values should have 'Manhole, Handhole' values to select from
        When I Edit site status column for a site record associated with record type 'test 1'
        Then the pick list values should have 'Active, On-Air' values to select from
        When I Edit site status column for a site record associated with record type 'test 2'
        Then the pick list values should have 'Backlog, De-comissioned' values to select from