package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdPublish extends  BaseEntity{
    private String xxid;

    private String bt;

    private String btys;

    private String xxlx;
    private String  xxlxmc;

    private String xxnr;

    private String createBy;

    private String createByMC;

    private String createDate;

    private String createdate1;

    private String createdate2;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String ztmc;

    private String flag;

    private String shr;
    private String shyj;
    private String shsj;

    public String getShyj() {
        return shyj;
    }

    public void setShyj(String shyj) {
        this.shyj = shyj;
    }

    public String getShsj() {

        return shsj;
    }

    public String getXxlxmc() {
        return xxlxmc;
    }

    public void setXxlxmc(String xxlxmc) {
        this.xxlxmc = xxlxmc;
    }

    public void setShsj(String shsj) {
        this.shsj = shsj;
    }

    public String getShr() {

        return shr;
    }

    public void setShr(String shr) {
        this.shr = shr;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getCreateByMC() {
        return createByMC;
    }

    public void setCreateByMC(String createByMC) {
        this.createByMC = createByMC;
    }

    public String getXxid() {
        return xxid;
    }

    public String getCreatedate2() {
        return createdate2;
    }

    public void setCreatedate2(String createdate2) {
        this.createdate2 = createdate2;
    }

    public String getCreatedate1() {
        return createdate1;
    }

    public void setCreatedate1(String createdate1) {
        this.createdate1 = createdate1;
    }

    public void setXxid(String xxid) {
        this.xxid = xxid == null ? null : xxid.trim();
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

    public String getXxlx() {
        return xxlx;
    }

    public void setXxlx(String xxlx) {
        this.xxlx = xxlx == null ? null : xxlx.trim();
    }

    public String getXxnr() {
        return xxnr;
    }

    public void setXxnr(String xxnr) {
        this.xxnr = xxnr == null ? null : xxnr.trim();
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