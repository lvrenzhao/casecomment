package cn.gov.ahcourt.casecomment.bean;


public class BdCasechosenNoticeread extends BaseEntity{
    private String sjpxggydid;

    private String sjpxggid;

    private String ydr;

    private String ydsj;

    public String getSjpxggydid() {
        return sjpxggydid;
    }

    public void setSjpxggydid(String sjpxggydid) {
        this.sjpxggydid = sjpxggydid == null ? null : sjpxggydid.trim();
    }

    public String getSjpxggid() {
        return sjpxggid;
    }

    public void setSjpxggid(String sjpxggid) {
        this.sjpxggid = sjpxggid == null ? null : sjpxggid.trim();
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