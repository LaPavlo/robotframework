*** Settings ***
Library  SeleniumLibrary
Suite Setup  Go To The Homepage
Suite Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}		https://hotline.ua/
${BROWSER}		chrome
${LINK}			xpath://ul/li[1]/div[3]/div/p/a
*** Test Cases **
Item Search And Click On The First Link
	Open The City Choosing Window
	Enter The City Name    Николаев
	Item Search  		iPhone 7
	Click On The First Item Link	
 
*** Keywords ***
Go To The Homepage
	Open BROWSER 	${HOMEPAGE}		${BROWSER}
Open The City Choosing Window
	Wait Until Page Contains Element	xpath://span[@class="city-name ellipsis"]
	Click Element  	xpath://span[@class="city-name ellipsis"]
Enter The City Name
	[Arguments]		${city}
	Wait Until Page Contains Element	xpath://input[@placeholder]
	Input Text		xpath://input[@placeholder]	${city}
	Sleep		2
	Mouse Down    xpath=//li[contains(.,'Николаевская')]
	Click Element  xpath=//li[contains(.,'Николаевская')]
	Sleep		2
Item Search
	[Arguments]		${searchkey}	
	Input Text		id = searchbox	${searchkey}
	Click Button 		id = doSearch
Click On The First Item Link
	Wait Until Page Contains Element	${LINK}
	Click Element				${LINK}



