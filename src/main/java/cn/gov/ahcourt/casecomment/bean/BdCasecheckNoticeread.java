package cn.gov.ahcourt.casecomment.bean;


public class BdCasecheckNoticeread extends  BaseEntity {
    private String ajpcggydid;

    private String gjpcggid;

    private String ydr;

    private String ydsj;

    public String getAjpcggydid() {
        return ajpcggydid;
    }

    public void setAjpcggydid(String ajpcggydid) {
        this.ajpcggydid = ajpcggydid == null ? null : ajpcggydid.trim();
    }

    public String getGjpcggid() {
        return gjpcggid;
    }

    public void setGjpcggid(String gjpcggid) {
        this.gjpcggid = gjpcggid == null ? null : gjpcggid.trim();
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