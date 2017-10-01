package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCheckPros {
    private String cpid;

    private String checkid;

    private String groupid;

    private String proid;

    private String sfzz;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getCpid() {
        return cpid;
    }

    public void setCpid(String cpid) {
        this.cpid = cpid == null ? null : cpid.trim();
    }

    public String getCheckid() {
        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid == null ? null : checkid.trim();
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid == null ? null : groupid.trim();
    }

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid == null ? null : proid.trim();
    }

    public String getSfzz() {
        return sfzz;
    }

    public void setSfzz(String sfzz) {
        this.sfzz = sfzz == null ? null : sfzz.trim();
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