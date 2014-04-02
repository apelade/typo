#B: SPECIFY FEATURES
#We want to add a useful feature called article merging.
#When there are multiple bloggers on one site, the authors may write more than one article on the
#same topic and say similar things.  The user will be able to visit the article view, and,
#if they are an admin, there should be a form on that article’s edit page that allows an administrator
#to enter in the ID of another article to merge the current article with.  When this happens,
#we want to preserve both articles’ content, but merge them together into one article.
#Note: Before merging articles you should verify that both specified articles exist,
#and that they are not the same article.
#
#
#
#Scenarios: To do this properly, we want to keep the following in mind:
#
#
#A non-admin cannot merge articles.
#When articles are merged, the merged article should contain the text of both previous articles.
#When articles are merged, the merged article should have one author (either one of the authors of the original article).
#Comments on each of the two original articles need to all carry over and point to the new, merged article.
#The title of the new article should be the title from either one of the merged articles.

Feature: Merge Articles
  As an blog administrator
  In order to avoid duplicate content
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And the following articles exist:
      |title   |body           |id |published|state     |allow_comments |
      |Foo     |Lorem Ipsum    |2  |true     |published |t              |
      |Bar     |Dolor sit      |3  |true     |published |t              |
      |Baz     |Aenean massa   |4  |true     |published |t              |

    And the following comments exist:
      |id |article_id |body               |title        |author         |
      |2  |3          |bar1 comment       |bar1 title   |bar1 commentor |
      |3  |4          |bar2 comment       |bar2 title   |bar2 commentor |
      |4  |4          |baz comment        |baz title    |baz commentor  |

  Scenario: merge should be available to admin from the article view page
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Foo"
    Then I should be on the edit page for "Foo"
    And I should see a merge form with "Enter Merge ID" field



  Scenario: merged article should contain the text of both previous articles
  Scenario: merged article should have one author


#    Given I am logged into the admin panel
#    And I should see "My Shiny Weblog!"
#
#  Scenario: Create blog page not shown when blog created
#    Given the blog is set up
#    When I am on the home page
#    Then I should not see "My Shiny Weblog!"
#    And I should see "Teh Blag"
