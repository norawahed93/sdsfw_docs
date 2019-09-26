# Actions / Controllers

Action classes act as the controller in the MVC pattern. Action classes respond to a user request, execute business logic, and then return a result that tells Struts what view to render.

Struts 2 Action classes usually extend the `ActionSupport` class, which is provided by the Struts 2 framework. Additionally, SDS Framework has defined several classes that has more functions to accomodate developers needs, such as `BaseAction` and `BaseActionSupport`.

#### BaseAction


#### BaseActionSupport

Some commonly used functions:
- loadAddPage()
- loadEditPage()
- processInsert()
- processUpdate()
- delete()


This is what a basic Action looks like:
```java
public Class ParentAction extends BaseActionSupport {
	public ParentAction() {
	}
}
```

## Request Parameters

In these Action classes, we do not need to use `HttpServletRequest` anymore. To get request parameters, we only need to define the variable name, and create the setter and getter methods. The framework will automatically set the variable value if the setter method exists in the Action class.

Sample:
```java
public Class ParentAction extends BaseActionSupport {

	private String paramName;
	
	public ParentAction() {
	}
	
	public String init() {
		System.out.println("paramName: " + paramName);		
		return SUCCESS;
	}
	
	public String getParamName() {
		return paramName;
	}
	
	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
}
```