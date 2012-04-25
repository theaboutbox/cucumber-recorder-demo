Feature: Welcome Page

    In order to become the greatest oracle since Delphi
    We provide a page where you can receive the answers to all your questions

    @javascript
    Scenario: The answer should be yes
      When I go to the home page
      Then the answer should be "Yes!"
