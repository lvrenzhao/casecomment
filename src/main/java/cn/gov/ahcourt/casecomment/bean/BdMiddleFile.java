package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdMiddleFile {
    private String fileid;

    private String pfileid;

    private String xname;

    private String xurl;

    private Integer xorder;

    private Integer ajid;

    private String require;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid == null ? null : fileid.trim();
    }

    public String getPfileid() {
        return pfileid;
    }

    public void setPfileid(String pfileid) {
        this.pfileid = pfileid == null ? null : pfileid.trim();
    }

    public String getXname() {
        return xname;
    }

    public void setXname(String xname) {
        this.xname = xname == null ? null : xname.trim();
    }

    public String getXurl() {
        return xurl;
    }

    public void setXurl(String xurl) {
        this.xurl = xurl == null ? null : xurl.trim();
    }

    public Integer getXorder() {
        return xorder;
    }

    public void setXorder(Integer xorder) {
        this.xorder = xorder;
    }

    public Integer getAjid() {
        return ajid;
    }

    public void setAjid(Integer ajid) {
        this.ajid = ajid;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require == null ? null : require.trim();
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