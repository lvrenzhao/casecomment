package cn.gov.ahcourt.casecomment.bean;

import java.math.BigDecimal;

public class BdCasecheck extends BaseEntity {
    private String ajpcid;

    private String ajpcggid;

    private String ajid;

    private String fpzj;

    private String pssj;

    private BigDecimal df;

    private String zldj;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String zt;

    private String jydp;

    private String flag;

    public String getAjpcid() {
        return ajpcid;
    }

    public void setAjpcid(String ajpcid) {
        this.ajpcid = ajpcid == null ? null : ajpcid.trim();
    }

    public String getAjpcggid() {
        return ajpcggid;
    }

    public void setAjpcggid(String ajpcggid) {
        this.ajpcggid = ajpcggid == null ? null : ajpcggid.trim();
    }

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
        this.ajid = ajid == null ? null : ajid.trim();
    }

    public String getFpzj() {
        return fpzj;
    }

    public void setFpzj(String fpzj) {
        this.fpzj = fpzj == null ? null : fpzj.trim();
    }

    public String getPssj() {
        return pssj;
    }

    public void setPssj(String pssj) {
        this.pssj = pssj;
    }

    public BigDecimal getDf() {
        return df;
    }

    public void setDf(BigDecimal df) {
        this.df = df;
    }

    public String getZldj() {
        return zldj;
    }

    public void setZldj(String zldj) {
        this.zldj = zldj == null ? null : zldj.trim();
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

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt == null ? null : zt.trim();
    }

    public String getJydp() {
        return jydp;
    }

    public void setJydp(String jydp) {
        this.jydp = jydp == null ? null : jydp.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}