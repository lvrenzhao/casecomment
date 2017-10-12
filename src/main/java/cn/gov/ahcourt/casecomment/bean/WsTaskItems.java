package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsTaskItems {
    private String taskitemid;

    private String taskid;

    private String params;

    private Integer datacount;

    private Integer handlecount;

    private String remark;

    private String remark1;

    private String remark2;

    private String remark3;

    private String exetime;

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

    public Integer getHandlecount() {
        return handlecount;
    }

    public void setHandlecount(Integer handlecount) {
        this.handlecount = handlecount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getRemark1() {
        return remark1;
    }

    public void setRemark1(String remark1) {
        this.remark1 = remark1 == null ? null : remark1.trim();
    }

    public String getRemark2() {
        return remark2;
    }

    public void setRemark2(String remark2) {
        this.remark2 = remark2 == null ? null : remark2.trim();
    }

    public String getRemark3() {
        return remark3;
    }

    public void setRemark3(String remark3) {
        this.remark3 = remark3 == null ? null : remark3.trim();
    }

    public String getExetime() {
        return exetime;
    }

    public void setExetime(String exetime) {
        this.exetime = exetime;
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results == null ? null : results.trim();
    }
}