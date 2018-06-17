*** Settings ***
Library  SeleniumLibrary
Suite Setup  Go to homepage
Suite Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}		https://hotline.ua/
${BROWSER}		chrome
${LINK}			xpath://ul/li[1]/div[3]/div/p/a
*** Test Cases **
Hotline iPhone 7 search and first link clicking
	Hotline click on the first link  iPhone 7	${LINK}
 
*** Keywords ***
Hotline click on the first link
	[Arguments]		${searchkey}	${result}
	Input Text		id = searchbox	${searchkey}
	Click Button 		id = doSearch
	
	Wait Until Page Contains Element	${LINK}
	Click Element				${LINK}

Go to homepage
	Open BROWSER 	${HOMEPAGE}		${BROWSER}

