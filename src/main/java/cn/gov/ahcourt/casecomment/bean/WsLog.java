package cn.gov.ahcourt.casecomment.bean;

public class WsLog {
    private String errorid;

    private String taskid;

    private String tdhid;

    private String log;

    public String getErrorid() {
        return errorid;
    }

    public void setErrorid(String errorid) {
        this.errorid = errorid == null ? null : errorid.trim();
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid == null ? null : taskid.trim();
    }

    public String getTdhid() {
        return tdhid;
    }

    public void setTdhid(String tdhid) {
        this.tdhid = tdhid == null ? null : tdhid.trim();
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log == null ? null : log.trim();
    }
}