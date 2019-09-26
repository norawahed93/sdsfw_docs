# Views

For the views, we can write normal jsp files with / without Struts tag.

It is recommended to write the JSP files using Struts tag as it provides a security net on the front-end.

More about Struts tags: <https://struts.apache.org/tag-developers/tag-reference.html>

Commonly used tags:

```jsp
<!-- get propertyName from properties file -->
<s:text name="propertyName"/>

<!-- get variable value, escape html be default -->
<s:property value="varName"/>
<s:property value="#session.userId"/>

<!-- loop through list; getItemList() must be defined in the Action class -->
<s:iterator value="itemList" var="item" status="itemStatus">
	<s:property value="#itemStatus.count"/> : <s:property value="#item"/>
</s:iterator>

<!-- set variables -->
<s:set var="num" value="5"/>

<!-- if else condition -->
<s:if test="#num > 5">
	If block
</s:if>
<s:elseif test="#num > 0">
	Else If block
</s:elseif>
<s:else>
	Else block
</s:else>
```

> [!TIP]
> - Variables defined in struts should be referred to using `#` in front of variable name.
> - To get java variables, make sure to create the setter method for the variable in the Action class.

## SiteMesh

SDS Framework is using SiteMesh to define templates (page layout). The configurations can be found in `decorators.xml`.

More about SiteMesh: <http://wiki.sitemesh.org/wiki/display/sitemesh/Home>

