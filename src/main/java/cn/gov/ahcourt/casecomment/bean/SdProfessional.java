package cn.gov.ahcourt.casecomment.bean;

public class SdProfessional extends BaseEntity{
    private String zjid;

    private String zy;

    private String bq;

    private String tx;

    private String userid;

    private String js;

    private String zzjgid;

    private String zzjgmc;

    private String dzyx;

    private String dh;

    private String sj;

    private String xm;


    public String getZzjgmc() {
        return zzjgmc;
    }

    public void setZzjgmc(String zzjgmc) {
        this.zzjgmc = zzjgmc;
    }

    public String getZzjgid() {
        return zzjgid;
    }

    public void setZzjgid(String zzjgid) {
        this.zzjgid = zzjgid;
    }

    public String getZjid() {
        return zjid;
    }

    public void setZjid(String zjid) {
        this.zjid = zjid == null ? null : zjid.trim();
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy == null ? null : zy.trim();
    }

    public String getBq() {
        return bq;
    }

    public void setBq(String bq) {
        this.bq = bq == null ? null : bq.trim();
    }

    public String getTx() {
        return tx;
    }

    public void setTx(String tx) {
        this.tx = tx == null ? null : tx.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getJs() {
        return js;
    }


    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public String getSj() {

        return sj;
    }

    public void setSj(String sj) {
        this.sj = sj;
    }

    public String getDzyx() {

        return dzyx;
    }

    public void setDzyx(String dzyx) {
        this.dzyx = dzyx;
    }

    public String getDh() {

        return dh;
    }

    public void setDh(String dh) {
        this.dh = dh;
    }

    public void setJs(String js) {
        this.js = js == null ? null : js.trim();
    }


}