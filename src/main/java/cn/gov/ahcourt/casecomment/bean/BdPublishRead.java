package cn.gov.ahcourt.casecomment.bean;


public class BdPublishRead extends  BaseEntity{
    private String xxggydid;

    private String xxggid;

    private String ydr;

    private String ydsj;

    public String getXxggydid() {
        return xxggydid;
    }

    public void setXxggydid(String xxggydid) {
        this.xxggydid = xxggydid == null ? null : xxggydid.trim();
    }

    public String getXxggid() {
        return xxggid;
    }

    public void setXxggid(String xxggid) {
        this.xxggid = xxggid == null ? null : xxggid.trim();
    }

    public String getYdr() {
        return ydr;
    }

    public void setYdr(String ydr) {
        this.ydr = ydr == null ? null : ydr.trim();
    }

    public String getYdsj() {
        return ydsj;
    }

    public void setYdsj(String ydsj) {
        this.ydsj = ydsj;
    }
}