package cn.gov.ahcourt.casecomment.bean;

public class WsTaskItems {
    private String taskitemid;

    private String taskid;

    private String params;

    private Integer datacount;

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

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
    }

    public Integer getDatacount() {
        return datacount;
    }

    public void setDatacount(Integer datacount) {
        this.datacount = datacount;
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results == null ? null : results.trim();
    }
}