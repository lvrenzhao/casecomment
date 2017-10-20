package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdMiddleFile extends BaseEntity {

    public BdMiddleFile(){

    }

    public BdMiddleFile(String fileid,String pfileid,String name,int xorder){
        this.fileid = fileid;
        this.pfileid = pfileid;
        this.xname = name;
        this.xorder = xorder;
    }

    //ztree model
    private String id;
    private String pId;
    private String name;
    private String open;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOpen() {
        return open;
    }

    public void setOpen(String open) {
        this.open = open;
    }

    private String fileid;

    private String pfileid;

    private String xname;

    private String xurl;

    private Integer xorder;

    private String ajid;

    private String require;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;


    private String pgtype;

    private String jzlb;

    public String getJzlb() {
        return jzlb;
    }

    public void setJzlb(String jzlb) {
        this.jzlb = jzlb;
    }

    public String getPgtype() {
        return pgtype;
    }

    public void setPgtype(String pgtype) {
        this.pgtype = pgtype;
    }

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

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
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