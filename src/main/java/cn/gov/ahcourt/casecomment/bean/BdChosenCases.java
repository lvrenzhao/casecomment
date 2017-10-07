package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdChosenCases extends BaseEntity {
    private String ccid;

    private String chosenid;

    private String ajid;

    private String psgroupid;

    private String jydp;

    private String zzpxdf;

    private String dpr;

    private String dpsj;

    private String tjly;

    private String tbrq;
    private String tbrq1;
    private String tbrq2;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;



    private String keyid;
    private String teamleadername;
    private String teammatenames;

    private String bt;

    private String ah;

    private String gsfy;

    private String cbbm;

    private String cbr;

    private String xz;

    private String ay;

    private String jafs;

    private String jasj;

    private String lx;

    private int relatedcasecount;

    private String pcjl;

    private String ischecked;

    private String fqr;
    private String fqrxm;
    private String fqrmc;
    private String fqsj;
    private String fqsj1;
    private String fqsj2;
    private String pclx;
    private String pcrw;
    private String tdcy;
    private String tasktype;//1:待评查，2已评查

    private String sfzz;
    private String proid;

    public String getTbrq1() {
        return tbrq1;
    }

    public void setTbrq1(String tbrq1) {
        this.tbrq1 = tbrq1;
    }

    public String getTbrq2() {
        return tbrq2;
    }

    public void setTbrq2(String tbrq2) {
        this.tbrq2 = tbrq2;
    }

    public String getKeyid() {
        return keyid;
    }

    public void setKeyid(String keyid) {
        this.keyid = keyid;
    }

    public String getTeamleadername() {
        return teamleadername;
    }

    public void setTeamleadername(String teamleadername) {
        this.teamleadername = teamleadername;
    }

    public String getTeammatenames() {
        return teammatenames;
    }

    public void setTeammatenames(String teammatenames) {
        this.teammatenames = teammatenames;
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt;
    }

    public String getAh() {
        return ah;
    }

    public void setAh(String ah) {
        this.ah = ah;
    }

    public String getGsfy() {
        return gsfy;
    }

    public void setGsfy(String gsfy) {
        this.gsfy = gsfy;
    }

    public String getCbbm() {
        return cbbm;
    }

    public void setCbbm(String cbbm) {
        this.cbbm = cbbm;
    }

    public String getCbr() {
        return cbr;
    }

    public void setCbr(String cbr) {
        this.cbr = cbr;
    }

    public String getXz() {
        return xz;
    }

    public void setXz(String xz) {
        this.xz = xz;
    }

    public String getAy() {
        return ay;
    }

    public void setAy(String ay) {
        this.ay = ay;
    }

    public String getJafs() {
        return jafs;
    }

    public void setJafs(String jafs) {
        this.jafs = jafs;
    }

    public String getJasj() {
        return jasj;
    }

    public void setJasj(String jasj) {
        this.jasj = jasj;
    }

    public String getLx() {
        return lx;
    }

    public void setLx(String lx) {
        this.lx = lx;
    }

    public int getRelatedcasecount() {
        return relatedcasecount;
    }

    public void setRelatedcasecount(int relatedcasecount) {
        this.relatedcasecount = relatedcasecount;
    }

    public String getPcjl() {
        return pcjl;
    }

    public void setPcjl(String pcjl) {
        this.pcjl = pcjl;
    }

    public String getIschecked() {
        return ischecked;
    }

    public void setIschecked(String ischecked) {
        this.ischecked = ischecked;
    }

    public String getFqr() {
        return fqr;
    }

    public void setFqr(String fqr) {
        this.fqr = fqr;
    }

    public String getFqrxm() {
        return fqrxm;
    }

    public void setFqrxm(String fqrxm) {
        this.fqrxm = fqrxm;
    }

    public String getFqrmc() {
        return fqrmc;
    }

    public void setFqrmc(String fqrmc) {
        this.fqrmc = fqrmc;
    }

    public String getFqsj() {
        return fqsj;
    }

    public void setFqsj(String fqsj) {
        this.fqsj = fqsj;
    }

    public String getFqsj1() {
        return fqsj1;
    }

    public void setFqsj1(String fqsj1) {
        this.fqsj1 = fqsj1;
    }

    public String getFqsj2() {
        return fqsj2;
    }

    public void setFqsj2(String fqsj2) {
        this.fqsj2 = fqsj2;
    }

    public String getPclx() {
        return pclx;
    }

    public void setPclx(String pclx) {
        this.pclx = pclx;
    }

    public String getPcrw() {
        return pcrw;
    }

    public void setPcrw(String pcrw) {
        this.pcrw = pcrw;
    }

    public String getTdcy() {
        return tdcy;
    }

    public void setTdcy(String tdcy) {
        this.tdcy = tdcy;
    }

    public String getTasktype() {
        return tasktype;
    }

    public void setTasktype(String tasktype) {
        this.tasktype = tasktype;
    }

    public String getSfzz() {
        return sfzz;
    }

    public void setSfzz(String sfzz) {
        this.sfzz = sfzz;
    }

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid;
    }

    public String getCcid() {
        return ccid;
    }

    public void setCcid(String ccid) {
        this.ccid = ccid == null ? null : ccid.trim();
    }

    public String getChosenid() {
        return chosenid;
    }

    public void setChosenid(String chosenid) {
        this.chosenid = chosenid == null ? null : chosenid.trim();
    }

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
        this.ajid = ajid == null ? null : ajid.trim();
    }

    public String getPsgroupid() {
        return psgroupid;
    }

    public void setPsgroupid(String psgroupid) {
        this.psgroupid = psgroupid == null ? null : psgroupid.trim();
    }

    public String getJydp() {
        return jydp;
    }

    public void setJydp(String jydp) {
        this.jydp = jydp == null ? null : jydp.trim();
    }

    public String getZzpxdf() {
        return zzpxdf;
    }

    public void setZzpxdf(String zzpxdf) {
        this.zzpxdf = zzpxdf == null ? null : zzpxdf.trim();
    }

    public String getDpr() {
        return dpr;
    }

    public void setDpr(String dpr) {
        this.dpr = dpr == null ? null : dpr.trim();
    }

    public String getDpsj() {
        return dpsj;
    }

    public void setDpsj(String dpsj) {
        this.dpsj = dpsj;
    }

    public String getTjly() {
        return tjly;
    }

    public void setTjly(String tjly) {
        this.tjly = tjly == null ? null : tjly.trim();
    }

    public String getTbrq() {
        return tbrq;
    }

    public void setTbrq(String tbrq) {
        this.tbrq = tbrq;
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