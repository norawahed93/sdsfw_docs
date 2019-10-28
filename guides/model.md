# Model

Each database table should have a corresponding "Model" which is used to interact with that table. Model allows us to query for data in our table, as well as insert new records into the table.

## Model Generator

The easiest way to create a model instance is by using the Model Generator. This tool will examine an existing table in our database and map it into a Model class.

**Model Generator** - <a href="/sdsfw_docs/downloads/ModelGenerator_java.rar" download>/downloads/ModelGenerator_java.rar</a>

## Model Class Conventions

All Model classes extend `ModelBase` and implements `java.io.Serializable`.
We are using annotations to tell the ORM about our table.

#### Table Names
Use `@Table` to define the table name.

```java
@Entity
@Table(name = "t_setup_user") // defines table name
public class User extends ModelBase implements java.io.Serializable {
}
```

#### Column Names
Use `@Column` to define the column name. The column name does not necessarily have to match with the variable name. Additionally, add `@Id` to indicate a primary key column. If adding extra variables / methods not associated with the database, use `@Transient`. Note that the annotations are only needed for getter methods.

```java
public class User extends ModelBase implements java.io.Serializable { 

	private String us_id;
	private String us_name;

	@Id // defines that this column is a primary key
	@Column(name = "us_id") // defines column name, ties column "us_id" to variable "us_id"
	public String getUs_id() {
		return us_id;
	}

	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}

	@Transient // defines this method is not associated with the database.
	public String String getID() {
		return getUs_id();
	}

	public void setID(String id) {
		setUs_id(id);
	}

	@Column(name = "us_user_name") // defines column name, ties column "us_user_name" to variable "us_name"
	public String getUs_name() {
		return us_name;
	}

	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
}
```

#### Table relations
Following is an example on how to define table relationships in Model.

```java
// Many To One
private Module attachedModule;

@ManyToOne(targetEntity = Module.class, optional = true, fetch = FetchType.LAZY)
@JoinColumn(name = "attached_module_id", insertable = false, updatable = false, nullable = true)
public Module getAttachedModule() {
	return attachedModule;
}

public void setAttachedModule(Module attachedModule) {
	this.attachedModule = attachedModule;
}

// One To Many
private List<ApplicationRights> rightsList = new ArrayList();

@OneToMany(targetEntity = ApplicationRights.class, fetch = FetchType.LAZY, mappedBy = "application_id")
public List<ApplicationRights> getRightsList() {
	return rightsList;
}

public void setRightsList(List rightsList) {
	this.rightsList = rightsList;
}
```

## Additional Configurations

Besides the above configurations, we also need to configure the following variables and methods.

```java
public String[] updatableColumns = new String[] {"Us_id", "Us_name"};
public final String[] columnLength = new String[]{"us_id:20", "us_name:100"};
private Map columnLengthMap = null;

@Transient
public Map getColumnLengthMap() {
	if (columnLengthMap == null) {
		columnLengthMap = new HashMap();
		  String[] strA = null;

		for (String str : columnLength) {
			strA = str.split(":");
			columnLengthMap.put(strA[0], strA[1]);
		}
	}

	return columnLengthMap;
}

@Transient
public String getUpdated_date_str() {
	return Formatter.formatDate(updated_date, SystemConstants.DATE.dataEntryFormat);
}

public void setUpdated_date_str(String updated_date) {
	try {
		this.updated_date = DateUtil.getTimestampFromDate(DateUtil.getDate(updated_date, SystemConstants.DATE.dataEntryFormat);
	} catch (Exception e) {
	}
}
```

- `updatableColumns` : String[]  
	This variable tells the framework which columns are allowed to be updated dynamically.  
	**Format:** "Column_name" - first letter is in capital letter.

- `columnLength` : String[]  
	This variable tells the framework the column length of string type.  
	**Format:** "column_name:length" - column name and length separated by colon (`:`).

- `getColumnLengthMap()` : Map  
	Utilise this method in jsp files to set `maxlength` on inputs.

- `get{*}_str()` and `set{*}_str(String date)`  
	These are helper methods when dealing with dates. It is recommended to define these set of methods for every date / datetime column. With these methods, we do not need to format the date / datetime every time when retrieving from database to display to user, and vice versa.

## User Defined Validations

We can add user defined validations in the constructor.
E.g.
```java
public User() {
	userDefined_autoValidation(Boolean.TRUE);
}
```

- **userDefined_insertRequired(String)**  
	**Description:** If this value is defined, will check the required values are not empty before insert.  
	**Value:** `"Column_1;Label Column 1,Column_2;Label Column 2"`  
	**Format:** First letter of column name in capital letter followed by ';' and column label. Separate multiple columns with a comma.  
	
- **userDefined_updateRequired(String)**  
	**Description:** If this value is defined, will check the required values are not empty before update.  
	**Value:** `"Column_1;Label Column 1,Column_2;Label Column 2"`  
	**Format:** First letter of column name in capital letter followed by ';' and column label. Separate multiple columns with a comma.  
	
- **userDefined_manualDuplicationCheck(Boolean)**  
	**Description:** If set to `true`, will run method `manualDuplicationCheck(Session session, Object dataEntryModel)`, which needs to be overriden in the Model.  
	**Value**: `true` | `false` (default)   

- **userDefined_autoValidation(Boolean)**  
	**Description:** If set to `true`, will check for duplicate and duplicate range before insert / update.  
	**Default:** `true`  
	**Value:** `true` | `false`  
	
- **userDefined_insertNoDuplicate(String)**  
	**Description:** Will check there is no duplicate for each of the columns defined before insert.  
	**Value:** `"column_1;Label Column 1,column_2;Label Column 2"`  
	**Format:** Each column name is followed by ';' and column label. Separate multiple columns with a comma.  	
	
- **userDefined_insertNoDuplicateRange(String)**  
	**Description:** Will check there is no duplicate for each of the column sets defined before insert.  
	**Value:** `"column_1,column_2;column_3,column_4"`  
	**Format:** Column names separated by comma, different sets of columns separated by ';'.  
		
- **userDefined_duplicateFieldsRangeKeyDescription(String)**  
	**Description:** Number of labels defined here should correspond to the number of sets of columns defined in `userDefined_insertNoDuplicateRange()` and `userDefined_updateNoDuplicateRange()`.  
	**Value:** `"Duplicate msg 1;Duplicate msg 2"`  
	**Format:** Labels separated by ';'.  
	
- **userDefined_updateNoDuplicate(String)**  
	**Description:** Will check there is no duplicate for each of the columns defined before update. If not defined, will get the value from `userDefined_insertNoDuplicate()`.  
	**Value:** `"column_1;Label Column 1,column_2;Label Column 2"`  
	**Format:** Each column name is followed by ';' and column label. Separate multiple columns with a comma.  	
	
- **userDefined_updateNoDuplicateRange(String)**  
	**Description:** Will check there is no duplicate for each of the column sets defined before update. If not defined, will get the value from `userDefined_updateNoDuplicateRange()`.  
	**Value:** `"column_1,column_2;column_3,column_4"`  
	**Format:** Column names separated by comma, different sets of columns separated by ';'.  	
	
- **userDefined_validateRecursive(Boolean)**  
	**Description:** If set to `true`, will check for recursive.  
	**Default:** `false`  
	**Value:** `true` | `false`  	
	
- **userDefined_noRecursive(String)**  
	**Description:** Will check there is no recursive on the column.  
	**Value:** `",ref_parent_id,getID,Error Message"` | `"chk_col:Y,ref_parent_id,getID,Error Message"`  
	**Format:** Check column value, column name (referencing to parent id), get parent id method name, and an error message, separated by comma. For conditional checking, specify the column name to be checked followed by ':' and value before the first comma.  
	**E.g.** The value `"chk_col:Y,ref_parent_id,getID,Error Message"` will only check for recursive if the field `chk_col` value is `Y`.  
	
## Model Events

These are some methods that can be overriden to add in more logic during create / update / delete operations. For more methods list, refer to ModelBase.java.

- `defaultAddProperties()`
- `preInsert(Session session)`
- `postInsert(Session session)`
- `defaultUpdateProperties()` - any columns set in this function will have to be defined in the updatableColumns except updated_by/updated_date columns.
- `preUpdate(Session session)` - any columns set in this function will bypass updatableColumns checking
- `preUpdate(Session session, Object dataEntryModel)` - any columns set in this function will bypass updatableColumns checking
- `postUpdate(Session session, Object updatingObject)`
- `preDelete(Session session, Object deletingObject)`
- `postDelete(Session session, Object deletingObject)`

## Loading Models

After creating Model classes, we need to tell the framework to load these classes. This can be configured in `SessionFactoryImpl.java` in `init()` function.

```java
MetadataSources sources = new MetadataSources(serviceRegistry)
							.addAnnotatedClass(User.class);
```							