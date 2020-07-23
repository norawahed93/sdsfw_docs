# Maintenance Mode

Maintenance mode can be manually activated by setting the following variables in `AuthorizationInterceptor.java`.

- public static Boolean maintenanceMode = Boolean.TRUE;
- public static Calendar maintenanceStart = null;	// change to desired datetime
- public static Calendar maintenanceEnd = null;	// change to desired datetime
- public static Calendar maintenanceRemark = null; // change to desired message
- public static List<String> allowedIp = null; // change to desired value

### Activate Maintenance Mode Without Re-deployment

Login as `admin`, and navigate to `/startMaintenanceModeLogin`.

The following configuration page will be displayed:
<img class="img-bordered" src="/sdsfw_docs/images/maintenance/configure-maintenance.png" alt="Configure Maintenance Page" />

Enter input into the fields as required, and the maintenance mode will be activated during the date time configured. The IP address of the admin user configuring this page is automatically whitelisted. Only allowed IP addresses are allowed to access the application during maintenance. Others will see the following page. To customize the maintenance page, edit `web/pages/underMaintenance.jsp`.
<img class="img-bordered" src="/sdsfw_docs/images/maintenance/under-maintenance.png" alt="Under Maintenance Page" />

To stop maintenance mode, navigate to `/stopMaintenanceModeLogin`.
