# Dynamic Config

Follow through these steps to create a standard CRUD (Create, Read, Update, Delete) page.

## 1. Configure dynamic-config.xml

Refer to file `dynamic-config.xml`. If you are using Oracle Database, refer to file `dynamic-config_o.xml`. This is where we tell the framework about what we want to display on the page, and where to get the data from.

By default, the list is not populated until user clicks on the 'Search' button. If you want to auto-populate the listing, add a parameter to the URL, `&retrieve=Y`.

The dynamic page can be accessed through url `/dynamicAction?action={dynamicActionName}`.

Sample:
```xml
<!-- URL for this config : /dynamicAction?action=Parent -->
<dynamicAction name="Parent">
	<property name="searchDescription" value="Sample.appName" />
	<property name="searchFields"      value="parent_name;Sample.parentName;parent_name, parend_dob;Sample.parentDOB;parent_dob, 
											parent_gender;Sample.parentGender;parent_gender, child_name;Sample.childName;t_child.child_name" />
	<property name="parent_gender_dd" value="com.sains.framework.base.CommonList;getGenderOptions;option;keyData;valueData;pleaseSelect" />
	<property name="retrievingColumns" value="t_parent.parent_id, t_parent.parent_name, t_parent.parent_dob, t_parent.parent_gender" />
	<property name="displayFields"      value="parent_name, parend_dob, parent_gender" />
	<property name="displayFieldsHeader" value="Sample.parentName, Sample.parentDOB, Sample.parentGender" />
	<property name="propertyText_parent_gender" value="Sample.parentGender" />
	<property name="sortingFields"      value="asDisplayFields" />
	<property name="groupBy" value="t_parent.parent_id" />
	<!--<property name="sqlTables" value="t_parent left join t_child on t_parent.parent_id = t_child.parent_id" />-->
	<property name="sqlTables" value="t_parent " />
	<property name="t_child.child_name_join" value="inner join t_child on t_parent.parent_id = t_child.parent_id " />
	<property name="primaryKey" value="parent_id" />
	<property name="editLinkColumn" value="parent_name" />
	<!--<property name="session_us_id_filter" value="t_parent.created_by" />-->
</dynamicAction>
```

### List of Properties

<!-- TODO : mark required properties -->

> [!TIP]
> - In the dynamic config, all labels will be retrieved from the properties file. Therefore, use the property name instead of hard coding the labels.
> - Lookout for the `{*}` sign. It means that you need to replace this with the column name.

> [!WARNING]
> For Oracle Database, the column names need to be specified in uppercase letters.

#### Page UI

| Name 					| Value 									| Description 																								| 
| --------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| <span class="required">[required]</span><br/> searchDescription		| &bull; {label}							| Page title; will be shown on top of the search criteria. 													|
| hideAddButton 		| &bull; Default: `N` <br/>&bull; Y 		| Show / hide add button. The button will be hidden if Add rights is not assigned to the user.				|
| hideDeleteButton 		| &bull; Default: `N` <br/>&bull; Y			| Show / hide delete button. The button will be hidden if Delete rights is not assigned to the user.		|
| showRecordPerPage 	| &bull; Default: `true` <br/>&bull; false 	| Enable / disable to change number of records shown per page.												|			
| recordPerPage 		| &bull; Default: `10;10,20,30,40,50` <br/>&bull; {defaultValue;List of numbers separated by commas} | Customize options in the show record per page options. |
| searchPage			| &bull; {jsp filename}						| Specify the jsp file for the search page.																	|
| listPage				| &bull; {jsp filename}						| Specify the jsp file for the result listing page.															|	

#### Search Criteria

| Name 					| Value 									| Description 																								| 
| --------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| <span class="required">[required]</span><br/> searchFields			| &bull; {html input names separated by commas} | Specify fields to be shown in the search criteria.													|
| <span class="required">[required]</span><br/> searchFieldsLabel		| &bull; {html input labels separated by commas}| Labels for fields specified in searchFields.															|
| <span class="required">[required]</span><br/> searchFieldsDbName	| &bull; {db column names separated by commas} | Map html input names in `searchFields` to database column names.										|
| moreSearchFields		| &bull; {input_name;label;db_column_name, input_name2;label2;db_column_name2} | Specify fields to be shown in the 'More' section of search criteria.	|
| pageRequired			| &bull; {input_name;label,input_name2;label2} 	| Specify required fields to do searching.																|
| {*}_dd 				| &bull; {Action's full page;methodName;option;keyData;valueData;all OR pleaseSelect OR none} | Fields to be searched in combobox format.				|
| {*}_lookupSearch 		| &bull; {javascript function to be called to do lookup} | Fields to be searched with lookup button. 													|
| lookupRetrievingColumnsLabel | &bull; {column_name;label, column_name2;label2} | Specify fields to be shown in the lookup result.												|
| preSearchMethod		| &bull; {method name}						| Specify method to be called prior to search. Method must be implemented in `DynamicPreSearch.java`.		|
| prePopulateSearchPage	| &bull; {method name}						| Specify method to be called prior to search. Method must be implemented in `DynamicPrePopulateSearchPage.java`. |

<!-- TODO : hiddenFields | Hidden inputs to be included in the search form. |  | -->
<!-- TODO : searchInputStyleFormat_* |  |  | -->

#### Query

| Name 					| Value 									| Description 																								| 
| --------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| <span class="required">[required]</span><br/> retrievingColumns		| &bull; {SELECT statement without SELECT keyword}	| Specify SQL's SELECT clause.																		|
| <span class="required">[required]</span><br/> sqlTables				| &bull; {FROM statement without FROM keyword}	| Specify SQL's FROM clause.																			|
| defaultSearchValue 	| &bull; {WHERE statement without WHERE keyword}	| Specify default SQL's WHERE clause.																|
| groupBy				| &bull; {GROUP BY statment without GROUP BY keyword}	| Specify SQL's GROUP BY clause.																|
| sortingFields			| &bull; asDisplayFields <br/>&bull; {ORDER BY statement without ORDER BY keyword}	| Specify ordering of results.										|
| session_us_id_filter	| &bull; {database column names separated by commas} | Specify name of the columns that will be used to compare with login user's Primary Key. 			|
| countDistinctColumns	| &bull; {distinct column names} 			| Specify distinct column names to be used to retrieve record counts.										|
| lookupRetrievingColumns | &bull; {SELECT statement without SELECT keyword}	| Specify SQL's SELECT clause for lookups.														|
| defaultLookupSearchValue | &bull; {WHERE statement without WHERE keyword} | Specify default SQL's WHERE clause for lookups.													|

<!-- TODO : StartEndDateField | Specify if a date range is to be compared against two different columns. | "sdt;edt,reg_dt;exp_dt" | -->

#### Result

| Name 					| Value 									| Description 																								| 
| --------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| <span class="required">[required]</span><br/> displayFields			| &bull; {column names separated by commas} | Specify which columns to be displayed in the result.														|
| <span class="required">[required]</span><br/> displayFieldsHeader	| &bull; {labels separated by commas} 		| Specify labels for the `displayFields`. 																	|
| primaryKey			| &bull; {primary key column name}			| Specify primary key's column name. To be used for retrieving record.										|
| formData 				| &bull; {column names separated by commas} | Specify which columns to be included to bring to the detail page other than the `primaryKey`.				|
| editLinkColumn		| &bull; {column names separated by commas} | Specify clickable columns to open details page.															|
| editLinkStyle			| &bull; {inline CSS}						| Specify inline CSS for the edit links.																	|
| edtLinkAtNewPage		| &bull; {column names separated by commas}	| Specify which `editLinkColumns` will open in a new page.													|
| editPageURL 			| &bull; {url}								| Specify the URL to be called when click on edit links. 													|
| addPageURL 			| &bull; {url}								| Specify the URL to be called when click on Add button.													|
| deleteURL 			| &bull; {url}								| Specify the URL to be called when click on Delete button.													|
| pagingURL				| &bull; {url}								| Specify the url for when navigating through paginations.													|	

<!-- TODO : displayFieldsLink | To create hyperlink other than to edit page. | | -->

#### Result Formatting

| Name 					| Value 									| Description 																								| 
| --------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| decFormat_{*}			| &bull; {format}							| Specify the format to format a number column.																|
| propertyText_{*}		| &bull; {property}							| Retrieve the label from properties file based on the property defined and the column's value.				|
| styleFormat_{*}		| &bull; {inline CSS}						| Specify inline CSS for the column.																		|

<!-- TODO : functionText_* | com.elasis.cart.dao.PurchaseDetailDAOImpl;getPODNormalDesc;Boolean;false | -->
<!-- TODO : styleFromPackage |  -->

## 2. Create Action class

Next, we need to create an Action class to process the request.
It's better to create the Action class which extends `BaseActionSupport` as it provides `loadAddPage()` and `loadEditPage()` functions. In this case, we can directly utilize these functions as the URLs to the add / edit page.

Sample:
```java
public Class ParentAction extends BaseActionSupport {
	public ParentAction() {
		setAction("Parent");
	}
}
```

The Action can also be tied to a model:
```java
public Class ParentAction extends BaseActionSupport<ParentModel> implements ModelDriven<ParentModel> {
	public ParentAction() {
		setAction("Parent");
		model = new ParentModel();
	}
	
	@Override
	public ParentModel getModel() {
		return model;
	}
}
```

## 3. Create add / edit page

The add / edit page URL will be `loadAddPage{dynamicActionName}()` and `loadEditPage{dynamicActionName}` respectively, the `{dynamicActionName}` replaced with the dynamicAction name defined earlier. But, the framework does not know which jsp file to render. So we need to configure `struts.xml` so that it can render the correct files.

By default, the functions `loadAddPage()` and `loadEditPage()` return `load_add_page` and `load_edit_page` respectively.

```xml
<action name="*Parent" method="{1}" class="com.sample.ParentAction">
	<result name="load_add_page" >/sample/addParent.jsp</result>
	<result name="load_edit_page" >/sample/editParent.jsp</result>
</action>
```