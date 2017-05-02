package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCasecheckZldjsz extends  BaseEntity {
    private String ajzldjid;

    private Integer px;

    private String dj;

    private Integer qsfz;

    private Integer jsfz;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String flag;

    public String getAjzldjid() {
        return ajzldjid;
    }

    public void setAjzldjid(String ajzldjid) {
        this.ajzldjid = ajzldjid == null ? null : ajzldjid.trim();
    }

    public Integer getPx() {
        return px;
    }

    public void setPx(Integer px) {
        this.px = px;
    }

    public String getDj() {
        return dj;
    }

    public void setDj(String dj) {
        this.dj = dj == null ? null : dj.trim();
    }

    public Integer getQsfz() {
        return qsfz;
    }

    public void setQsfz(Integer qsfz) {
        this.qsfz = qsfz;
    }

    public Integer getJsfz() {
        return jsfz;
    }

    public void setJsfz(Integer jsfz) {
        this.jsfz = jsfz;
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