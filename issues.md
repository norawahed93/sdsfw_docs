# Known Issues

> [!DANGER]
> Let us know if you have other issues with the framework so that it can be added to this list and can be referred to by others.

#### 1. defaultPageSize <> 10 and retrieve = Y
	
When auto-populate listing, the framework will retrieve default 10 records even though the defaultPageSize is set to other than 10. Only when user clicks on 'Search' button, it will retrieve based on the defaultPageSize defined.
	
# Suggestions

1. Add option for application to open in a new tab.
2. Show limited page numbers in pagination. Currently, will show 100 buttons for 100 pages.
3. Auto trigger notification instead of need to add Action class to `AuthorizationInterceptor.java` line 323.
	```java
	if (actionClass.equals("RegistrationAction") || actionClass.equals("LoginEssAction") || actionClass.equals("LoginEssAction")) {
		return checkAutomation(invocation);
	}
	```