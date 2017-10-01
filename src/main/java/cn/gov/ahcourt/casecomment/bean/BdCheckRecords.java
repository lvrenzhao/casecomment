package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCheckRecords extends BaseEntity {
    private String crid;

    private String checkid;

    private String ajid;

    private String pcr;

    private String pcsj;

    private String pcfs;

    private String pczt;

    private String zldj;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid == null ? null : crid.trim();
    }

    public String getCheckid() {
        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid == null ? null : checkid.trim();
    }

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
        this.ajid = ajid == null ? null : ajid.trim();
    }

    public String getPcr() {
        return pcr;
    }

    public void setPcr(String pcr) {
        this.pcr = pcr == null ? null : pcr.trim();
    }

    public String getPcsj() {
        return pcsj;
    }

    public void setPcsj(String pcsj) {
        this.pcsj = pcsj;
    }

    public String getPcfs() {
        return pcfs;
    }

    public void setPcfs(String pcfs) {
        this.pcfs = pcfs == null ? null : pcfs.trim();
    }

    public String getPczt() {
        return pczt;
    }

    public void setPczt(String pczt) {
        this.pczt = pczt == null ? null : pczt.trim();
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

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }
}