package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsTask {
    private String taskid;

    private String tasktype;

    private String begeindate;

    private String enddate;

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid == null ? null : taskid.trim();
    }

    public String getTasktype() {
        return tasktype;
    }

    public void setTasktype(String tasktype) {
        this.tasktype = tasktype == null ? null : tasktype.trim();
    }

    public String getBegeindate() {
        return begeindate;
    }

    public void setBegeindate(String begeindate) {
        this.begeindate = begeindate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
}