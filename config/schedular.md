# Schedular Maintenance 

Follow through these steps to schedule and run cron job.

## 1. Configure TimerBase.java

Add new schedular job here. 
```java
if (customisableJob == null) {
    customisableJob = new HashMap();
    customisableJob.put("DayOfWeekJob", new DayOfWeekJob());
    customisableJob.put("DailyJob", new DailyJob());
    customisableJob.put("MonthlyJob", new MonthlyJob());
    customisableJob.put("YearlyJob", new YearlyJob());
    customisableJob.put("NormalMailJob", new NormalMailJob());
    //add your new schedular job here...
}
```

## 2. Create new job class 
Following is an example on how to create new job class. 
```java
public class DailyJob extends TimerJob {
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
    private SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private String dateString = f.format(new Date());

    public DailyJob() {
        super();
        jobSwitch_on = Boolean.TRUE;
        alwaysTriggerOnce = Boolean.FALSE;
        jobRepeat = REPEAT.Daily;
        jobRunEvery = "01:00"; //HH:MM 
    }

    @Override
    public void run() {
        if (jobSwitch_on) {
            ModelBase.threadVar.remove(Thread.currentThread().getId()); //remove everytime
            try {
                runMe();
            } catch (Exception e) {
                Debug.printError("Error when running runMe() ");
                e.printStackTrace();
            } finally {
                jobScheduler.shutdown();
            }
        }
    }
  
    public void runMe() {
        //add your process here...
    }
}
```

- `jobSwitch_on` : Boolean  
    This variable need to set to `TRUE`, to allow job run. 

- `alwaysTriggerOnce` : Boolean  
    This variable will trigger the job once, when it is set to `TRUE`.

- `jobRepeat` : String  
    This variable can be set to `Repeat.Default`, `Repeat.Daily`, `Repeat.DayOfWeek`, `Repeat.Monthly`, or `Repeat.Yearly`.

- `jobRunEvery`  
    The format is defferent based on the `jobRepeat` variable.  
    - **Default** format : **HH:MM** (Hours:Minute) For midnight(12am), the setup is 00:00.  
    E.g. `jobRunEvery = "00:00";`

    - **Dailly** format : **HH:MM** (Hours:Minute) For midnight(12am), the setup is 00:00.  
    E.g. `jobRunEvery = "00:00";`

    - **DayOfWeek** format : **HH:MM Calendar.day** (Hours:Minute Day)  
    E.g. `jobRunEvery = "11:08 " + Calendar.THURSDAY;`

    - **Monthly** format : **DD** (Day) Day of the month in 2 digits.  
    E.g. `jobRunEvery = "01";`

    - **Yearly** format : **MM-DD** (Month:Day)  
    E.g. `jobRunEvery = "01-01";`

- `runMe()`  
    This method is use to add your process of the cron job.

## 3. Schedular Maintenance  

Navigate to **System Administration > Schedular Maintenance**.

The following configuration page will be displayed, if the job is added at `TimerBase.java` follow step 1.  
- Check the **Job Enabled** checkbox, to allow to run the job.
- Click **Update Changes** in order to save or create the the newly added job in database.

Sample: 
    <img class="img-bordered" src="/sdsfw_docs/images/schedular/sample-schedular.png" alt="sample schedular" />



