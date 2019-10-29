# CRUD Action

**CRUD** is an acronym for CREATE, READ, UPDATE and DELETE, which are basic functions. In Action class, create, update and delete records can be done, we only need to extend `BaseActionSupport` which provides some commonly used functions.
- Create 
	- loadAddPage()
	- processInsert()
- Update
	- loadEditPage()
	- processUpdate()
- Delete 
	- delete()
	
	
| Modifier Return-type                           | Method 		      													| Description 																								                                                 | 
| ---------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <span style="color:blue">public</span> String  | loadAddPage()			 													| Load the add form (view). Can be overriden but is optional.																					             |
| <span style="color:blue">public</span> String  | processInsert()         														| Create the new records in the database. Can be overriden but is optional.																			         |
| <span style="color:blue">public</span> String  | loadEditPage()		     													| Load the edit form (view). Can be overriden but is optional.																					             |
| <span style="color:blue">public</span> String  | processUpdate()	     														| Update the records in the database. Can be overriden but is optional.																			             |
| <span style="color:blue">public</span> String  | delete()	                                                                    | Delete the specified records in the database. It is mandatory to override. If not, error message "HTTP Status 500 – Internal Server Error" will be shown.  |
| <span style="color:blue">public void </span>   | specificValidation(String <span style="color:#ca8a04">validationType</span>) | Check the conditions before insert / update. It will be triggered upon insert / update.														             |


Sample:
```java
public class ParentAction extends BaseActionSupport<ParentModel> implements ModelDriven<ParentModel>{

    public ParentAction() {
        setDaoService_(serviceFactory.getSampleService());
        setAction("Parent");
        model = new ParentModel();
    }

    @Override 
    public ParentModel getModel() {
        return model;
    }
	
	//Method to create a parent in the database
    public String loadAddPage() {
        try {
        } catch (Exception e) {
            new LogFunction().logError(this.getClass(), "", e);
        }
        return SystemConstants.ACTION_Status.LOAD_ADD_PAGE;
    }
	
	//Method retrieve parent's data for update
    public String loadEditPage() {
        try {
			//call the processEdit function from BaseActionSupport
            model = super.processEdit(getModel());
        } catch (Exception e) {
            new LogFunction().logError(this.getClass(), "", e);
        }
        return SystemConstants.ACTION_Status.LOAD_EDIT_PAGE;
    }
	
	//Method to delete a parent from the database
    public String delete() {
        try {
            if (getSelected() != null) {
				//call the DAO class to perform delete operation
                getDaoService_().frameworkDelete(getSelected(), ParentModel.class);
            }
            addActionMessage(getText("deleteSuccess"));
        } catch (BaseException be) {
            setRedirectMessage(be.getMessage());
        } catch (Exception e) {
            new LogFunction().logError(this.getClass(), "", e);
            setRedirectMessage(getText("updateFail"));
            return SystemConstants.ACTION_Status.INSERT_FAIL;
        }
        return SUCCESS;
    }
	
	//Method triggered upon insert/update
	public void specificValidation(String validationType) throws Exception {
		//if the parent's age is less than or equal to 10, error message will be prompted
        if (getModel().getParent_age() <= 10) {
            addActionError("Cannot be lah, parent to young");
        }
    }
}
```