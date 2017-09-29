package cn.gov.ahcourt.casecomment.bean;

import cn.gov.ahcourt.casecomment.utils.StringUtils;

import java.util.Date;

public class BdMiddleCase extends BaseEntity{

    private int raj;

    public int getRaj() {
        return raj;
    }

    public void setRaj(int raj) {
        this.raj = raj;
    }

    private int randomcount;

    public void setRandomcount(int randomcount) {
        this.randomcount = randomcount;
    }

    public int getRandomcount() {

        return randomcount;
    }

    private String joinedCaseIds;

    public void setJoinedCaseIds(String joinedCaseIds) {
        this.joinedCaseIds = joinedCaseIds;
    }

    public String getJoinedCaseIds() {

        return joinedCaseIds;
    }

    private String [] jcs;

    public String[] getJcs() {
        return jcs;
    }

    public void setJcs(String[] jcs) {
        this.jcs = jcs;
    }

    //自动生成code
    private String ajid;

    private String ah;

    private String gsfy;

    private String cbbm;

    private String cbr;

    private String xz;

    private String ay;

    private String jafs;

    private String jasj;

    private String lx;

    private String thirdid;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    private String formAjxzUnSplited;
    private String[] formAjxz;

    private String formAjlxUnSplited;
    private String[] formAjlx;

    private String formGsfyUnlplited;
    private String[] formGsfy;
    private String formStartJarq;
    private String formEndJqrq;

    private int relatedcasecount;

    public int getRelatedcasecount() {
        return relatedcasecount;
    }

    public void setRelatedcasecount(int relatedcasecount) {
        this.relatedcasecount = relatedcasecount;
    }

    public String getRelatedcaseid() {
        return relatedcaseid;
    }

    public void setRelatedcaseid(String relatedcaseid) {
        this.relatedcaseid = relatedcaseid;
    }

    private String relatedcaseid;

    private String[] formrelatedcaseid;

    public String[] getFormrelatedcaseid() {
        return formrelatedcaseid;
    }

    public void setFormrelatedcaseid(String[] formrelatedcaseid) {
        this.formrelatedcaseid = formrelatedcaseid;
    }

    public String getFormAjxzUnSplited() {
        return formAjxzUnSplited;
    }

    public void setFormAjxzUnSplited(String formAjxzUnSplited) {
        this.formAjxzUnSplited = formAjxzUnSplited;
    }

    public String getFormAjlxUnSplited() {
        return formAjlxUnSplited;
    }

    public void setFormAjlxUnSplited(String formAjlxUnSplited) {
        this.formAjlxUnSplited = formAjlxUnSplited;
    }

    public String getFormGsfyUnlplited() {
        return formGsfyUnlplited;
    }

    public void setFormGsfyUnlplited(String formGsfyUnlplited) {
        this.formGsfyUnlplited = formGsfyUnlplited;
    }

    public String[] getFormGsfy() {
        return formGsfy;
    }

    public void setFormGsfy(String[] formGsfy) {
        this.formGsfy = formGsfy;
    }

    public String[] getFormAjxz() {
        return formAjxz;
    }

    public void setFormAjxz(String[] formAjxz) {
        this.formAjxz = formAjxz;
    }

    public String[] getFormAjlx() {
        return formAjlx;
    }

    public void setFormAjlx(String[] formAjlx) {
        this.formAjlx = formAjlx;
    }

    public String getFormStartJarq() {
        return formStartJarq;
    }

    public void setFormStartJarq(String formStartJarq) {
        this.formStartJarq = formStartJarq;
    }

    public String getFormEndJqrq() {
        return formEndJqrq;
    }

    public void setFormEndJqrq(String formEndJqrq) {
        this.formEndJqrq = formEndJqrq;
    }

    public String getAjid() {
        return ajid;
    }

    public void setAjid(String ajid) {
        this.ajid = ajid == null ? null : ajid.trim();
    }

    public String getAh() {
        return ah;
    }

    public void setAh(String ah) {
        this.ah = ah == null ? null : ah.trim();
    }

    public String getGsfy() {
        return gsfy;
    }

    public void setGsfy(String gsfy) {
        this.gsfy = gsfy == null ? null : gsfy.trim();
    }

    public String getCbbm() {
        return cbbm;
    }

    public void setCbbm(String cbbm) {
        this.cbbm = cbbm == null ? null : cbbm.trim();
    }

    public String getCbr() {
        return cbr;
    }

    public void setCbr(String cbr) {
        this.cbr = cbr == null ? null : cbr.trim();
    }

    public String getXz() {
        return xz;
    }

    public void setXz(String xz) {
        this.xz = xz == null ? null : xz.trim();
    }

    public String getAy() {
        return ay;
    }

    public void setAy(String ay) {
        this.ay = ay == null ? null : ay.trim();
    }

    public String getJafs() {
        return jafs;
    }

    public void setJafs(String jafs) {
        this.jafs = jafs == null ? null : jafs.trim();
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
        this.lx = lx == null ? null : lx.trim();
    }

    public String getThirdid() {
        return thirdid;
    }

    public void setThirdid(String thirdid) {
        this.thirdid = thirdid == null ? null : thirdid.trim();
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