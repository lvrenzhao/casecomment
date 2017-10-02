package cn.gov.ahcourt.casecomment.bean;

import java.util.Date;

public class BdCheckGroups extends BaseEntity {
    private String cgid;

    private String checkid;

    private String groupname;

    private Integer pcajs;

    private String zb;

    private String createBy;

    private String createDate;

    private String updateBy;

    private String updateDate;

    private String remarks;

    private String flag;

    private String teamleadername;
    private String teammatenames;

    //前端属性
    private String id;
    private String name;
    private String teamleaderid;
    private String teammateids;
    private int pc;


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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeamleaderid() {
        return teamleaderid;
    }

    public void setTeamleaderid(String teamleaderid) {
        this.teamleaderid = teamleaderid;
    }

    public String getTeammateids() {
        return teammateids;
    }

    public void setTeammateids(String teammateids) {
        this.teammateids = teammateids;
    }

    public int getPc() {
        return pc;
    }

    public void setPc(int pc) {
        this.pc = pc;
    }

    public String getCgid() {
        return cgid;
    }

    public void setCgid(String cgid) {
        this.cgid = cgid == null ? null : cgid.trim();
    }

    public String getCheckid() {
        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid == null ? null : checkid.trim();
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public Integer getPcajs() {
        return pcajs;
    }

    public void setPcajs(Integer pcajs) {
        this.pcajs = pcajs;
    }

    public String getZb() {
        return zb;
    }

    public void setZb(String zb) {
        this.zb = zb == null ? null : zb.trim();
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