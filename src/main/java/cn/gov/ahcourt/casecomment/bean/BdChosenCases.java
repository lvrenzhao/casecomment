package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdChosenCases {
    private String ccid;

    private String chosenid;

    private String ajid;

    private String psgroupid;

    private String jydp;

    private String zzpxdf;

    private String dpr;

    private String dpsj;

    private String tjly;

    private String tbrq;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getCcid() {
        return ccid;
    }

    public void setCcid(String ccid) {
        this.ccid = ccid == null ? null : ccid.trim();
    }

    public String getChosenid() {
        return chosenid;
    }

    public void setChosenid(String chosenid) {
        this.chosenid = chosenid == null ? null : chosenid.trim();
    }

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
        this.ajid = ajid == null ? null : ajid.trim();
    }

    public String getPsgroupid() {
        return psgroupid;
    }

    public void setPsgroupid(String psgroupid) {
        this.psgroupid = psgroupid == null ? null : psgroupid.trim();
    }

    public String getJydp() {
        return jydp;
    }

    public void setJydp(String jydp) {
        this.jydp = jydp == null ? null : jydp.trim();
    }

    public String getZzpxdf() {
        return zzpxdf;
    }

    public void setZzpxdf(String zzpxdf) {
        this.zzpxdf = zzpxdf == null ? null : zzpxdf.trim();
    }

    public String getDpr() {
        return dpr;
    }

    public void setDpr(String dpr) {
        this.dpr = dpr == null ? null : dpr.trim();
    }

    public String getDpsj() {
        return dpsj;
    }

    public void setDpsj(String dpsj) {
        this.dpsj = dpsj;
    }

    public String getTjly() {
        return tjly;
    }

    public void setTjly(String tjly) {
        this.tjly = tjly == null ? null : tjly.trim();
    }

    public String getTbrq() {
        return tbrq;
    }

    public void setTbrq(String tbrq) {
        this.tbrq = tbrq;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}