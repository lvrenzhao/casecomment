package cn.gov.ahcourt.casecomment.bean;

import java.math.BigDecimal;
import java.util.Date;

public class BdCasecheckPf extends BaseEntity {
    private String pfid;

    private String psnr;

    private String pfbz;

    private BigDecimal fz;

    private BigDecimal kf;

    private String ly;

    private BigDecimal df;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String flag;

    private Integer px;

    private String ajpcid;

    public String getPfid() {
        return pfid;
    }

    public void setPfid(String pfid) {
        this.pfid = pfid == null ? null : pfid.trim();
    }

    public String getPsnr() {
        return psnr;
    }

    public void setPsnr(String psnr) {
        this.psnr = psnr == null ? null : psnr.trim();
    }

    public String getPfbz() {
        return pfbz;
    }

    public void setPfbz(String pfbz) {
        this.pfbz = pfbz == null ? null : pfbz.trim();
    }

    public BigDecimal getFz() {
        return fz;
    }

    public void setFz(BigDecimal fz) {
        this.fz = fz;
    }

    public BigDecimal getKf() {
        return kf;
    }

    public void setKf(BigDecimal kf) {
        this.kf = kf;
    }

    public String getLy() {
        return ly;
    }

    public void setLy(String ly) {
        this.ly = ly == null ? null : ly.trim();
    }

    public BigDecimal getDf() {
        return df;
    }

    public void setDf(BigDecimal df) {
        this.df = df;
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

    public Integer getPx() {
        return px;
    }

    public void setPx(Integer px) {
        this.px = px;
    }

    public String getAjpcid() {
        return ajpcid;
    }

    public void setAjpcid(String ajpcid) {
        this.ajpcid = ajpcid == null ? null : ajpcid.trim();
    }
}