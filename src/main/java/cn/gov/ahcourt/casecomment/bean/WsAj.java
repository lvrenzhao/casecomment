package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class WsAj {
    private String tdhajid;

    private String ah;

    private String fjm;

    private String fydm;

    private String ajztmc;

    private Date lastupdatetime;

    private String xmlbase;

    private String xmlfile;

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