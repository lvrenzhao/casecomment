package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdMiddleCase extends  BaseEntity {
    private String ajid;

    private String ah;

    private String gsfy;

    private String cbbm;

    private String cbr;

    private String ajxz;

    private String ay;

    private String jafs;

    private Date jasj;

    private String ajlx;

    private String tdhajid;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String flag;

    private Date lasj;

    private String tsyx;

    private String cpws;

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

    public String getAjxz() {
        return ajxz;
    }

    public void setAjxz(String ajxz) {
        this.ajxz = ajxz == null ? null : ajxz.trim();
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

    public Date getJasj() {
        return jasj;
    }

    public void setJasj(Date jasj) {
        this.jasj = jasj;
    }

    public String getAjlx() {
        return ajlx;
    }

    public void setAjlx(String ajlx) {
        this.ajlx = ajlx == null ? null : ajlx.trim();
    }

    public String getTdhajid() {
        return tdhajid;
    }

    public void setTdhajid(String tdhajid) {
        this.tdhajid = tdhajid == null ? null : tdhajid.trim();
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

    public Date getLasj() {
        return lasj;
    }

    public void setLasj(Date lasj) {
        this.lasj = lasj;
    }

    public String getTsyx() {
        return tsyx;
    }

    public void setTsyx(String tsyx) {
        this.tsyx = tsyx == null ? null : tsyx.trim();
    }

    public String getCpws() {
        return cpws;
    }

    public void setCpws(String cpws) {
        this.cpws = cpws == null ? null : cpws.trim();
    }
}