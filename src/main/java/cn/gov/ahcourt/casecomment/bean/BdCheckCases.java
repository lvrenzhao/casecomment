package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCheckCases extends BaseEntity {
    private String ccid;

    private String checkid;

    private String ajid;

    private String psgroupid;

    private String jydp;

    private String zzpcdf;

    private String zzzldj;

    private String dpr;

    private String dpsj;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    private String ggmc;
    private String teamleadername;
    private String teammatenames;

    private String ah;

    private String gsfy;

    private String cbbm;

    private String cbr;

    private String xz;

    private String ay;

    private String jafs;

    private String jasj;

    private String lx;

    //前端属性
    private String groupid;

    public String getGroupid() {
        return groupid;
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

    public void setGroupid(String groupid) {
        this.groupid = groupid;
    }

    public String getGgmc() {
        return ggmc;
    }

    public void setGgmc(String ggmc) {
        this.ggmc = ggmc;
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

    public String getCcid() {
        return ccid;
    }

    public void setCcid(String ccid) {
        this.ccid = ccid == null ? null : ccid.trim();
    }

    public String getCheckid() {
        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid == null ? null : checkid.trim();
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

    public String getZzpcdf() {
        return zzpcdf;
    }

    public void setZzpcdf(String zzpcdf) {
        this.zzpcdf = zzpcdf == null ? null : zzpcdf.trim();
    }

    public String getZzzldj() {
        return zzzldj;
    }

    public void setZzzldj(String zzzldj) {
        this.zzzldj = zzzldj == null ? null : zzzldj.trim();
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