package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdChosenMsgto {
    private String msgtoid;

    private String chosenid;

    private String proid;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getMsgtoid() {
        return msgtoid;
    }

    public void setMsgtoid(String msgtoid) {
        this.msgtoid = msgtoid == null ? null : msgtoid.trim();
    }

    public String getChosenid() {
        return chosenid;
    }

    public void setChosenid(String chosenid) {
        this.chosenid = chosenid == null ? null : chosenid.trim();
    }

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid == null ? null : proid.trim();
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