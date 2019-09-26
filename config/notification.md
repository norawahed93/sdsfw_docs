# Auto Notification

## Notification

Navigate to **System Administration > Notification Setup**.

Here we can define the notification message and related information. 

The `Body` field accepts HTML codes and can be previewed after saving the record. Parameters are also accepted in `<param>paramName</param>` format. Any parameters will be substituted before the notification is sent.

Sample:  
<img src="/sdsfw_docs/images/notification/sample-body.png" alt="sample body" />

## Auto Email / SMS Notification

Navigate to **System Administration > Email / SMS Setup**.

Here we can configure the Action and Method name to trigger the notification. All parameters to be used in the notification's body must be defined here as it tells the framework where to get the parameter's value.

- **Status** - The notification will only be triggered if the request returns the same string as the status.

- **Mail To** - Input the method name to get the recipient's email address in this field.

- **Parameters** - For each of the parameters, we should define a function in the Action class so that the framework can get the parameters value to be substituted in the notification message.

> [!NOTE]
> The Email / SMS setup can also be configured as a workflow. To use `Workflow`, contact the framework developer.

Sample:  
<img src="/sdsfw_docs/images/notification/sample-notification.png" alt="sample notification" />

## Configure AuthorizationInterceptor.java

Next we need to add the Action class in `AuthorizationInterceptor.java` line 323.

```java
if (actionClass.equals("RegistrationAction") || actionClass.equals("LoginEssAction") || actionClass.equals("LoginEssAction")) {
	return checkAutomation(invocation);
}
```

This tells the framework that everytime the specified Action class is run, it should check whether there is a notification setup for that Action.

If there is a notification that matches the class & method that is running, the notification will be triggered.