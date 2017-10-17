package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsCaseInfo {
    private String wsid;

    private String tdhid;

    private Date createtime;

    private String remark;

    private String baseinfoxml;

    private String fileinfoxml;

    public String getWsid() {
        return wsid;
    }

    public void setWsid(String wsid) {
        this.wsid = wsid == null ? null : wsid.trim();
    }

    public String getTdhid() {
        return tdhid;
    }

    public void setTdhid(String tdhid) {
        this.tdhid = tdhid == null ? null : tdhid.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getBaseinfoxml() {
        return baseinfoxml;
    }

    public void setBaseinfoxml(String baseinfoxml) {
        this.baseinfoxml = baseinfoxml == null ? null : baseinfoxml.trim();
    }

    public String getFileinfoxml() {
        return fileinfoxml;
    }

    public void setFileinfoxml(String fileinfoxml) {
        this.fileinfoxml = fileinfoxml == null ? null : fileinfoxml.trim();
    }
}