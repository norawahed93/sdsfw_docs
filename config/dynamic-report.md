# Dynamic Report

Follow through these steps to generate the dynamic report.

## 1. Create view in database

**Format** : `Create view` **[view's name]** `as (`**[SQL query]**`)`  

E.g. 
```SQL
CREATE VIEW mainsLayerList AS (
  SELECT 
    a.*, 
    b.remarks, 
    a.application_date, 
    expiryDate, 
    CASE WHEN a.application_type = "N" THEN "New Application" ELSE "Renewal Application" END AS applicationType 
  FROM 
    t_lic_mainslayer_apps a 
    JOIN t_lic_mainslayer_register b ON a.lic_mainslayer_register_id = b.lic_mainslayer_register_id
)
```

## 2. Create record in database

Insert created view record (from step 1) in the table **t_dq_datasource**.
- set **[view's name]** to column **ds_view_name** 
- set description to column **ds_desc**.  

E.g. 
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-db.png" alt="sample db" />

## 3. Dynamic Query Template  

Navigate to **System Administration > Dynamic Query Template**.

The following configuration page will be displayed.
- click on the **Add** button, in order to add report template.  
Sample:
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr1.png" alt="sample dynamic report 1" />

- After clicked on the **Add** button, the following page will be displayed.  
Sample: 
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr2.png" alt="sample dynamic report 2" />
- The **View** that created in step 1 will be shown in **Select DataSource** for selection.  
- Fill in the **Template Name**, **Template Description** and **Condition**. Then, click on the **Next** button.  
The following page will be shown.  
Sample:  
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr3.png" alt="sample dynamic report 3" />
- Select the field that you want to display, by check on the checkbox.
- Change the label's name and fill in the placeholder.
- Adjust the order of the field by **drag and drop** the row.
- After that, click **save** button, to save the template report.

## 4. Dynamic Query Report
> [!NOTE]
> The dynamic report can only be search in textfield.

Navigate to **Dynamic Query Report**. 
- Click on the **template report** that created in step 3.  
Sample:
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr4.png" alt="sample dynamic report 4" />

- The fields that selected in step 3 had been shown as sample below for search criteria.  
Sample:
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr5.png" alt="sample dynamic report 5" />

- Fill in the condition in respective search field and then click on the **generate** button, for particular report.  
- By default without any search condition, the report still will be generated as sample below.  
Sample:
	<img class="img-bordered" src="/sdsfw_docs/images/dynamic-report/sample-dr6.png" alt="sample dynamic report 6" />
- The report can be generated in the form of pdf, csv and excel.