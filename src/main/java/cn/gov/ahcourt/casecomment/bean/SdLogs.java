package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class SdLogs extends  BaseEntity{
    private String logid;

    private String mod;

    private String czr;

    private String czlx;

    private Date czsj;

    private String xxqk;

    public String getLogid() {
        return logid;
    }

    public void setLogid(String logid) {
        this.logid = logid == null ? null : logid.trim();
    }

    public String getMod() {
        return mod;
    }

    public void setMod(String mod) {
        this.mod = mod == null ? null : mod.trim();
    }

    public String getCzr() {
        return czr;
    }

    public void setCzr(String czr) {
        this.czr = czr == null ? null : czr.trim();
    }

    public String getCzlx() {
        return czlx;
    }

    public void setCzlx(String czlx) {
        this.czlx = czlx == null ? null : czlx.trim();
    }

    public Date getCzsj() {
        return czsj;
    }

    public void setCzsj(Date czsj) {
        this.czsj = czsj;
    }

    public String getXxqk() {
        return xxqk;
    }

    public void setXxqk(String xxqk) {
        this.xxqk = xxqk == null ? null : xxqk.trim();
    }
}