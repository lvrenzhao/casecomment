package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCasechosenNotice  extends BaseEntity{
    private String sjpxggid;

    private String bt;

    private String btys;

    private String pxlx;

    private Date scjzrq;

    private String ggnr;

    private String tzry;

    private String zt;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String flag;

    public String getSjpxggid() {
        return sjpxggid;
    }

    public void setSjpxggid(String sjpxggid) {
        this.sjpxggid = sjpxggid == null ? null : sjpxggid.trim();
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt == null ? null : bt.trim();
    }

    public String getBtys() {
        return btys;
    }

    public void setBtys(String btys) {
        this.btys = btys == null ? null : btys.trim();
    }

    public String getPxlx() {
        return pxlx;
    }

    public void setPxlx(String pxlx) {
        this.pxlx = pxlx == null ? null : pxlx.trim();
    }

    public Date getScjzrq() {
        return scjzrq;
    }

    public void setScjzrq(Date scjzrq) {
        this.scjzrq = scjzrq;
    }

    public String getGgnr() {
        return ggnr;
    }

    public void setGgnr(String ggnr) {
        this.ggnr = ggnr == null ? null : ggnr.trim();
    }

    public String getTzry() {
        return tzry;
    }

    public void setTzry(String tzry) {
        this.tzry = tzry == null ? null : tzry.trim();
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt == null ? null : zt.trim();
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

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}