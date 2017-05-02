package cn.gov.ahcourt.casecomment.bean;

import java.math.BigDecimal;
import java.util.Date;

public class BdCasechosen extends BaseEntity {
    private String sjpxid;

    private String sjpxggid;

    private String ajid;

    private String fpzj;

    private Date pssj;

    private BigDecimal df;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String zt;

    private String jydp;

    private String flag;

    public String getSjpxid() {
        return sjpxid;
    }

    public void setSjpxid(String sjpxid) {
        this.sjpxid = sjpxid == null ? null : sjpxid.trim();
    }

    public String getSjpxggid() {
        return sjpxggid;
    }

    public void setSjpxggid(String sjpxggid) {
        this.sjpxggid = sjpxggid == null ? null : sjpxggid.trim();
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

    public Date getPssj() {
        return pssj;
    }

    public void setPssj(Date pssj) {
        this.pssj = pssj;
    }

    public BigDecimal getDf() {
        return df;
    }

    public void setDf(BigDecimal df) {
        this.df = df;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
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