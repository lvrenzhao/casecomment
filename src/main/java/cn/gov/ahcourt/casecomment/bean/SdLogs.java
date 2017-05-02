package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class SdLogs extends  BaseEntity{
    private String logid;

    private String mod;

    private String xm;
    private String czr;

    private String czlx;
    private String czlxmc;

    private Date czsj;



    private String czsj1;
    private String czsj2;


    private String xxqk;

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public String getCzlxmc() {
        return czlxmc;
    }

    public void setCzlxmc(String czlxmc) {
        this.czlxmc = czlxmc;
    }

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

    public String getCzsj2() {
        return czsj2;
    }

    public void setCzsj2(String czsj2) {
        this.czsj2 = czsj2;
    }

    public String getCzsj1() {
        return czsj1;
    }

    public void setCzsj1(String czsj1) {
        this.czsj1 = czsj1;
    }
}