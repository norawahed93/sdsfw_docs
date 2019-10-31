# Model Events

In model class, we can add more logic to be executed before and after a create / update / delete operation. These are the methods that can be overriden.

| Method 									         | Description                                                            |
| -------------------------------------------------- | ---------------------------------------------------------------------- |
| defaultAddProperties()							 | Set default model properties before insert function is called.		  |
| preInsert(Session session)                         | Explicit checks inside method before insert function is called.		  |
| postInsert(Session session)                        | Explicit checks inside method when insert function finishes its work.  |
| defaultUpdateProperties()							 | Set default model properties before update function is called. <br/><br/>**Note:** Any columns set in this function will have to be defined in the updatableColumns except updated_by / updated_date columns. |
| preUpdate(Session session) / preUpdate(Session session, Object dataEntryModel) | Explicit checks inside method before update function is called. <br/><br/>**Note:** Any columns set in this function will bypass updatableColumns checking.	  |
| postUpdate(Session session, Object updatingObject) | Explicit checks inside method when update function finishes its work.  |
| preDelete(Session session, Object deletingObject)  | Explicit checks inside method before delete function is called.		  |
| postDelete(Session session, Object deletingObject) | Explicit checks inside method when delete function finishes its work.  |

Sample: <br>
This is an example for `preInsert()` and `postInsert()` method. For `preInsert()` method will checks whether is public and set the value, and encrpyt the password before insert function is called.
Whereas the `postInsert()` method will insert user into public group when the insert function already finishes its work.
```java
@Override
public void preInsert(org.hibernate.Session session) throws Exception {
	Map sessionMap = ActionContext.getContext().getSession();

	try {
		BaseDAOImpl dao = new BaseDAOImpl();
		dao.setSession(session);
		if(get_operation().equalsIgnoreCase("PUBLIC")){
			setUs_admin("N");
			setUs_ldap("N");
			setUs_status("P"); //P - Pending Approval
			setCreated_by(getUs_user_id());
		} else {
			setUs_admin("N");
			setUs_password("password"); // to be removed
			setUs_ldap("N"); // to be set to 'Y'
		}
		// encrypt the password here.
		if (!Validator.isEmpty(getUs_password())) {
			setUs_password(Encriptor.encode(getUs_password()));
		}
		setUs_user_id(getUs_user_id().toLowerCase());
		session.save(this);
	} catch (Exception e) {
		throw e;
	} finally {
	}
}


@Override
public void postInsert(org.hibernate.Session session) throws Exception {
	try {
		System.out.println("post Update User");
		BaseDAOImpl dao = new BaseDAOImpl();
		dao.setSession(session);
		
		//insert new created user into public group
		if(get_operation().equalsIgnoreCase("PUBLIC")){
			SetupGroup group = null;
			group = (SetupGroup)dao.getObjectByCode("group_code", "publicUser", new SetupGroup());
			if(group == null){
				throw new CustomBaseException("error.user.groupNotFound");
			}
			GroupUser gu = new GroupUser();
			dao.setSession(session);
			gu.setUs_id(getID());
			gu.setUg_id(group.getUg_id());
			gu.defaultAddProperties();
			dao.getSession().save(gu);
		}
	} catch (Exception e) {
		throw e;
	} finally {
	}
}
```