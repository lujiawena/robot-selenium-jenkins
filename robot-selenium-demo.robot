*** Settings ***
Library		Selenium2Library
Suite Setup	 Open Browser  ${HOMEPAGE}  ${BROWSER}
Test Setup      Go to  ${HOMEPAGE}
Suite Teardown	Close Browser
Documentation   Demonstrate Selenium2Library by googling.

*** Variables ***
${HOMEPAGE}  https://www.baidu.com
${BROWSER}   chrome

*** Test Cases ***
Google searches and verifying results
  [Tags]  templated-tests
  [Template]  Google and check results
  饿了么   www.ele.me
  deveo   deveo.com
  robot framework   robot framework
  
Google elem and find ele.me
  [Tags]  饿了么  ele.me  smoke
  Google and check results  饿了么  www.ele.me

Google deveo and find its web site
  [Tags]  deveo  eficode
  Google and check results  deveo  deveo.com

Google robot and find its web site
  [Tags]  robot
  Google and check results  robot framework  robot framework

*** Keywords ***
Google and check results
  [Arguments]  ${searchkey}  ${result}
  Input text   id=kw  ${searchkey}
  Click button  id=su
  Wait Until Page Contains  ${result}

