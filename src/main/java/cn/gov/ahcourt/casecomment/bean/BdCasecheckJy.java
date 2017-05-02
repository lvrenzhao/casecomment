package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCasecheckJy extends BaseEntity {
    private String ajpcjyid;

    private String ajpcggid;

    private String jy;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String flag;

    public String getAjpcjyid() {
        return ajpcjyid;
    }

    public void setAjpcjyid(String ajpcjyid) {
        this.ajpcjyid = ajpcjyid == null ? null : ajpcjyid.trim();
    }

    public String getAjpcggid() {
        return ajpcggid;
    }

    public void setAjpcggid(String ajpcggid) {
        this.ajpcggid = ajpcggid == null ? null : ajpcggid.trim();
    }

    public String getJy() {
        return jy;
    }

    public void setJy(String jy) {
        this.jy = jy == null ? null : jy.trim();
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