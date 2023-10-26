Feature: Trackers Tab Landing Page
    Background: The user has access to Projects, Project Templates, and Sites. The user has logged in to Salesforce and is on the the Sitetracker Application
    Scenario: User should be able to view the new Tracker Tab
        Given I am in the Sitetracker Application
        When I click on Trackers Tab
        Then I should be navigated to the new Tracker Tab