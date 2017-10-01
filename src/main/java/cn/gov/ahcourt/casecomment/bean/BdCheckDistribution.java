package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCheckDistribution extends BaseEntity {
    private String cdid;

    private String checkid;

    private String fbxmc;

    private String fbxlx;

    private String fbx;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getCdid() {
        return cdid;
    }

    public void setCdid(String cdid) {
        this.cdid = cdid == null ? null : cdid.trim();
    }

    public String getCheckid() {
        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid == null ? null : checkid.trim();
    }

    public String getFbxmc() {
        return fbxmc;
    }

    public void setFbxmc(String fbxmc) {
        this.fbxmc = fbxmc == null ? null : fbxmc.trim();
    }

    public String getFbxlx() {
        return fbxlx;
    }

    public void setFbxlx(String fbxlx) {
        this.fbxlx = fbxlx == null ? null : fbxlx.trim();
    }

    public String getFbx() {
        return fbx;
    }

    public void setFbx(String fbx) {
        this.fbx = fbx == null ? null : fbx.trim();
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