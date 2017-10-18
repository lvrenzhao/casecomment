package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsAjid {
    private String tdhajid;

    private Date createtime;

    private Date updatetime;

    private String fjm;

    public String getTdhajid() {
        return tdhajid;
    }

    public void setTdhajid(String tdhajid) {
        this.tdhajid = tdhajid == null ? null : tdhajid.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getFjm() {
        return fjm;
    }

    public void setFjm(String fjm) {
        this.fjm = fjm == null ? null : fjm.trim();
    }
}