# Routing

When your application receives a request, it executes an [Action] to generate the response. The routing configuration defines which action to run for each incoming URL.

Routes can be configured in `struts.xml`. For more information on Struts configuration file, refer to [struts-link].

## Creating routes

The simplest route configuration looks like this.
```xml
<action name="login" method="init" class="com.app.LoginAction">
	<result name="success">/pages/login.jsp</result>
</action>
```
This means that when user navigates to `/login`, the system will run `LoginAction` class and execute `init()` method, and when the function returns `success`, it will render the `login.jsp` file.

The `method` attribute is optional. The system will try to run `execute()` method if no `method` attribute is defined.

## Wildcards

We can also define routes with wildcards.

```xml
<action name="*User" method="{1}" class="com.app.UserAction">
	<result name="load_add_page">/pages/addUser.jsp</result>
	<result name="load_edit_page">/pages/editUser.jsp</result>
</action>
```
According to this configuration, the framework accepts any URL that ends with "User" and any string before the word "User" is regarded as the method name.

E.g. 

- url `/loadAddPageUser` will run `UserAction.loadAddPage()`
- url `/loadEditPageUser` will run `UserAction.loadEditPage()`

## Redirects

```xml
<action name="processLogin" method="processLogin" class="com.app.LoginAction">
	<result name="success" type="redirect">dashboard</result>
	<result name="fail" type="redirectAction">
		<param name="actionName">login</param>
		<param name="msg">${redirectMessage}</param>
	</result>
</action>
```

If `success` is returned, the framework will redirect the user to url `/dashboard`. If `fail` is returned, the framework will redirect to `/login` and append `msg` as a parameter.

[Action]: guides/actions.md
[struts-link]: https://www.javatpoint.com/struts-2-configuration-file