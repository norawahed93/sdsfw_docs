# Access Control

By default, all Action classes are access controlled. It means that user will not be able to trigger an Action class if the user is not granted access to that Action. To make an Action accessible without granting any access, add the Action name in `AuthorizationInterceptor.java` in variable `directRunActionClass`.

To utilise the framework's access control, we need to configure Application and User Group.

## Application

1. Navigate to **System Administration > Module Setup**.

	Every application is tied to a module, so we need to make sure the module is configured first.
		
	> [!NOTE]
	> A module can also be configured as a sub module.
	
	Sample:	
	<img class="img-bordered" src="/sdsfw_docs/images/access-control/sample-module.png" alt="sample module" />
	
1. Navigate to **System Administration > Application Setup**.

	An application represents a page / function in the web application. Here, we need to configure information related to applications, such as URL, Action class, Applications Rights, and so on.

	Once granted access to an application, the Action class tied to the application can run these standard methods:
		
	<ul>
		<li>search2()</li>
		<li>loadViewPage()</li>
		<li>loadAddPage()</li>
		<li>loadEditPage()</li>
		<li>processSearch()</li>
		<li>processInsert()</li>
		<li>processUpdate()</li>
		<li>delete()</li>
		<li>cancel()</li>
		<li>cancelChanges()</li>
		<li>submitVerify()</li>
		<li>populateDynamicActionSetup()</li>
	</ul>
			
	Any methods other than these standard methods need to be defined in the Additional Rights.
	
	> [!TIP]
	> The `Invoking Methods` field accepts multiple methods, just separate the methods with a comma. E.g. `processAddRights, processDeleteRights`
		
	Sample:	
	<img class="img-bordered" src="/sdsfw_docs/images/access-control/sample-application.png" alt="sample application" />
		
## User Group

Navigate to **System Administration > User Group Setup**.

Create a user group by adding users and assigning applications to that group.

> [!NOTE]
> The User Group can also be configured as a workflow. To use `Workflow`, contact the framework developer.

Sample:	
<img class="img-bordered" src="/sdsfw_docs/images/access-control/sample-user-group.png" alt="sample user group" />