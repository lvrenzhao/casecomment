package cn.gov.ahcourt.casecomment.bean;

public class WsTaskItems {
    private String taskitemid;

    private String taskid;

    private String wsadd;

    private String wsusername;

    private String wspassword;

    private String params;

    private String results;

    public String getTaskitemid() {
        return taskitemid;
    }

    public void setTaskitemid(String taskitemid) {
        this.taskitemid = taskitemid == null ? null : taskitemid.trim();
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid == null ? null : taskid.trim();
    }

    public String getWsadd() {
        return wsadd;
    }

    public void setWsadd(String wsadd) {
        this.wsadd = wsadd == null ? null : wsadd.trim();
    }

    public String getWsusername() {
        return wsusername;
    }

    public void setWsusername(String wsusername) {
        this.wsusername = wsusername == null ? null : wsusername.trim();
    }

    public String getWspassword() {
        return wspassword;
    }

    public void setWspassword(String wspassword) {
        this.wspassword = wspassword == null ? null : wspassword.trim();
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results == null ? null : results.trim();
    }
}