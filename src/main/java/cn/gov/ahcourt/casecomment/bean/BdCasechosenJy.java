package cn.gov.ahcourt.casecomment.bean;


public class BdCasechosenJy extends BaseEntity {
    private String sjpxjyid;

    private String xjpxggid;

    private String jy;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getSjpxjyid() {
        return sjpxjyid;
    }

    public void setSjpxjyid(String sjpxjyid) {
        this.sjpxjyid = sjpxjyid == null ? null : sjpxjyid.trim();
    }

    public String getXjpxggid() {
        return xjpxggid;
    }

    public void setXjpxggid(String xjpxggid) {
        this.xjpxggid = xjpxggid == null ? null : xjpxggid.trim();
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