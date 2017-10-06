package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdChosen extends BaseEntity {
    private String chosenid;

    private String bt;

    private String btys;

    private String pclx;

    private String pfb;

    private String fqr;

    private String fqsj;

    private String shr;

    private String shsj;

    private String shyj;

    private String zt;

    private String jzrq;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    private String nr;

    private String msgtoids;
    private String msgtonames;

    public String getMsgtonames() {
        return msgtonames;
    }

    public void setMsgtonames(String msgtonames) {
        this.msgtonames = msgtonames;
    }

    public String getMsgtoids() {
        return msgtoids;
    }

    public void setMsgtoids(String msgtoids) {
        this.msgtoids = msgtoids;
    }

    public String getChosenid() {
        return chosenid;
    }

    public void setChosenid(String chosenid) {
        this.chosenid = chosenid == null ? null : chosenid.trim();
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

    public String getPclx() {
        return pclx;
    }

    public void setPclx(String pclx) {
        this.pclx = pclx == null ? null : pclx.trim();
    }

    public String getPfb() {
        return pfb;
    }

    public void setPfb(String pfb) {
        this.pfb = pfb == null ? null : pfb.trim();
    }

    public String getFqr() {
        return fqr;
    }

    public void setFqr(String fqr) {
        this.fqr = fqr == null ? null : fqr.trim();
    }

    public String getFqsj() {
        return fqsj;
    }

    public void setFqsj(String fqsj) {
        this.fqsj = fqsj;
    }

    public String getShr() {
        return shr;
    }

    public void setShr(String shr) {
        this.shr = shr == null ? null : shr.trim();
    }

    public String getShsj() {
        return shsj;
    }

    public void setShsj(String shsj) {
        this.shsj = shsj;
    }

    public String getShyj() {
        return shyj;
    }

    public void setShyj(String shyj) {
        this.shyj = shyj == null ? null : shyj.trim();
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt == null ? null : zt.trim();
    }

    public String getJzrq() {
        return jzrq;
    }

    public void setJzrq(String jzrq) {
        this.jzrq = jzrq;
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

    public String getNr() {
        return nr;
    }

    public void setNr(String nr) {
        this.nr = nr == null ? null : nr.trim();
    }
}