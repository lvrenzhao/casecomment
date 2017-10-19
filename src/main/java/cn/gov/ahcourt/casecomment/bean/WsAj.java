package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsAj {
    private String tdhajid;

    private String ah;

    private String fjm;

    private String fydm;

    private String ajztmc;

    private Date lastupdatetime;

    private Date createtime;

    private String xmlbase;

    private String xmlfile;

    private String jarq;

    private String larq;

    private int start;

    private int pagesize;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    private String begintime;

    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime;
    }

    public String getJarq() {
        return jarq;
    }

    public void setJarq(String jarq) {
        this.jarq = jarq;
    }

    public String getLarq() {
        return larq;
    }

    public void setLarq(String larq) {
        this.larq = larq;
    }

    public String getTdhajid() {
        return tdhajid;
    }

    public void setTdhajid(String tdhajid) {
        this.tdhajid = tdhajid == null ? null : tdhajid.trim();
    }

    public String getAh() {
        return ah;
    }

    public void setAh(String ah) {
        this.ah = ah == null ? null : ah.trim();
    }

    public String getFjm() {
        return fjm;
    }

    public void setFjm(String fjm) {
        this.fjm = fjm == null ? null : fjm.trim();
    }

    public String getFydm() {
        return fydm;
    }

    public void setFydm(String fydm) {
        this.fydm = fydm == null ? null : fydm.trim();
    }

    public String getAjztmc() {
        return ajztmc;
    }

    public void setAjztmc(String ajztmc) {
        this.ajztmc = ajztmc == null ? null : ajztmc.trim();
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getXmlbase() {
        return xmlbase;
    }

    public void setXmlbase(String xmlbase) {
        this.xmlbase = xmlbase == null ? null : xmlbase.trim();
    }

    public String getXmlfile() {
        return xmlfile;
    }

    public void setXmlfile(String xmlfile) {
        this.xmlfile = xmlfile == null ? null : xmlfile.trim();
    }
}