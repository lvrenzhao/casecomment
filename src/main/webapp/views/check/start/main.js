//获取组织机构接口
var URL_ORGS = ahcourt.ctx + "/setting/organization/getlist.do";
//案件库接口，接受多个查询条件
var URL_CASES = ahcourt.ctx + '/case/list.do';
//获取随机的案件
var URL_RANDOM_CASES = ahcourt.ctx + '/case/random.do';
//获取专家接口
var URL_PROFESSIONALS = ahcourt.ctx + '/setting/professional/listjson.do';
//发布公告接口
var URL_SUBMIT = ahcourt.ctx + '/case/publish.do';
//获取评分表接口
var URL_PFB = ahcourt.ctx + '/case/pfb.do';

var lo;
//获取ztree中选中节点的下级节点名称,返回数组
function getSubCourtNameBYSelectedCourt() {
    if($("#chx_sfbhxjfy").is(':checked') == true){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var node = treeObj.getSelectedNodes()[0];
        if(node){
            var res = node.name+digui(node);
            return res;
        }
    }
    // return $("#citySel").val();
    if($("#citySel").val()){
        return $("#citySel").val();
    }else{
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getNodes();
        var firstNode = nodes[0];
        if(firstNode){
            // console.log(nodes[0].name)
            return nodes[0].name;
        }
    }
}

function digui(treeNode) {
    //此处treeNode 为当前节点
    var str ='' ;
    str = getAllChildrenNodes(treeNode,str);
    return str;
}

function getAllChildrenNodes(treeNode,result){
    if (treeNode.isParent) {
        var childrenNodes = treeNode.children;
        if (childrenNodes) {
            for (var i = 0; i < childrenNodes.length; i++) {
                result += ";" + childrenNodes[i].name ;
                result = getAllChildrenNodes(childrenNodes[i], result);
            }
        }
    }
    return result;
}

var currentFormValues = {};
//对比抽案表单是否发生条件变更，如存在变更需重新刷新表格。
function formChanged() {
    var changed = true;
    var newFormValues = getFromValues();
    //进行比较 (仅比较抽取条件是否不一致，已分配案件数，和随机抽取数等不参与比较)
    if(newFormValues.formAjxzUnSplited == currentFormValues.formAjxzUnSplited
       && newFormValues.formAjlxUnSplited == currentFormValues.formAjlxUnSplited
       && newFormValues.formGsfyUnlplited == currentFormValues.formGsfyUnlplited
       && newFormValues.cbbm == currentFormValues.cbbm
       && newFormValues.cbr == currentFormValues.cbr
       && newFormValues.ah == currentFormValues.ah
       && newFormValues.ay == currentFormValues.ay
       && newFormValues.formStartJarq == currentFormValues.formStartJarq
       && newFormValues.formEndJqrq == currentFormValues.formEndJqrq){
        changed = false;
    }
    currentFormValues = newFormValues;
    return changed;
}
//返回抽案表单对象
function getFromValues() {
    var newFormValues = {};
    newFormValues.joinedCaseIds = getJoinedCaseIds();
    newFormValues.randomcount = $("#txt_random").val()?parseInt($.trim($("#txt_random").val())):0;

    //获取抽案条件
    newFormValues.formAjxzUnSplited = "";
    $("input[name='ajxz']:checkbox").each(function(){
        if(true == $(this).is(':checked')){
            newFormValues.formAjxzUnSplited += $(this).val()+";";
        }
    });
    newFormValues.formAjlxUnSplited = "";
    $("input[name='ajlx']:checkbox").each(function(){
        if(true == $(this).is(':checked')){
            newFormValues.formAjlxUnSplited += $(this).val()+";";
        }
    });
    newFormValues.formGsfyUnlplited = getSubCourtNameBYSelectedCourt();

    newFormValues.cbbm = $("#txt_cbbm").val();
    newFormValues.cbr = $("#txt_cbr").val();
    newFormValues.ah = $("#txt_ah").val();
    newFormValues.ay = $("#txt_ay").val();
    newFormValues.formStartJarq = $("#txt_jarq1").val();
    newFormValues.formEndJqrq = $("#txt_jarq2").val();


    return newFormValues;
}

var joinedCases = [];
//手动抽取
function extractSelectedCases(caselist) {
    addCases(caselist);
    reloadGrid1();
}
//随机抽取
function extractRandomCases(casecount) {
    var lo ;
    lo = layer.msg("正在随机抽取案件，需要一两分钟，请稍后....",{icon:6,time:99999999});
    $.ajax({
        type : 'POST',
        url : URL_RANDOM_CASES,
        data:getFromValues(),
        datatype : 'json',
        // async : false,
        success : function(data) {
            addCases(data.rows);
            reloadGrid1();
            layer.close(lo);
            layer.msg("已成功随机抽取"+casecount+"条案件。",{icon:1,time:6000});
        }
    });
}

//将抽取的案件加入到待分配
function addCases(caselist) {
    for(var i =0 ; caselist && i < caselist.length ; i ++){
        var obj = caselist[i];
        delete obj.fmt;
        delete obj.fmt1;
        delete obj.fmt2;
        joinedCases.push(obj);
    }
    reloadTab3();//刷新第三步，将待分配案件数，三个下拉框重置；
    refreshJoinedCasesGrid();

}

//从待分配案件中移除
function removeCase(ajid) {
    layer.confirm('确认将该案件从待分配列表移除吗？', {
        btn : [ '确认', '取消' ]
    }, function(lo) {
        layer.close(lo);
        layer.msg("案件移除成功!",{icon:1});
        var idx = -1;
        for(var i = 0 ; joinedCases && i < joinedCases.length ; i ++){
            if(joinedCases[i].ajid == ajid){
                idx = i;
            }
        }
        if(idx > -1){
            joinedCases.splice(idx,1);
        }
        reloadTab3();//刷新第三步，将待分配案件数，三个下拉框重置；
        refreshJoinedCasesGrid();
    });
}
var dists=[];
function reloadTab3() {
    dists = [];
    $("#lbl_joined_case_count").text(joinedCases.length);
    //计算案件分布
    var qys = [] , xzs = [] , lxs = [] ;

    for(var i = 0 ; joinedCases && i < joinedCases.length ; i ++){
        var item = joinedCases[i];
        //计算区域分布
        var isInQy = false;
        for(var x = 0 ; x < qys.length; x++){
            if(qys[x].gsfy == item.gsfy){
                qys[x].cases += 1;
                isInQy = true;
                break;
            }
        }
        if(!isInQy){
            qys.push({gsfy:item.gsfy,cases:1});
        }
        //计算性质分布
        var isInXz = false;
        for(var x = 0 ; x < xzs.length; x++){
            if(xzs[x].xz == item.xz){
                xzs[x].cases += 1;
                isInXz = true;
                break;
            }
        }
        if(!isInXz){
            xzs.push({xz:item.xz,cases:1});
        }
        //计算类型分布
        var isInLx = false;
        for(var x = 0 ; x < lxs.length; x++){
            if(lxs[x].lx == item.lx){
                lxs[x].cases += 1;
                isInLx = true;
                break;
            }
        }
        if(!isInLx){
            lxs.push({lx:item.lx,cases:1});
        }
    }

    //设置区域分布控件
    var qy_html = "<option value=''>归属法院</option>";
    for(var i = 0 ; qys && i < qys.length ; i ++){
        dists.push({"fbxmc":qys[i].gsfy + " - 被抽中" + qys[i].cases + "条 - 占比" + (qys[i].cases/joinedCases.length * 100).toFixed(2)  +"%",fbxlx:"1","fbx":qys[i].gsfy});
        qy_html += "<option value='"+qys[i].gsfy+"'>"+qys[i].gsfy + " - 被抽中" + qys[i].cases + "条 - 占比" + (qys[i].cases/joinedCases.length * 100).toFixed(2)  +"%</option>";
    }
    $("#form_sel_region").html(qy_html);
    //设置性质分布控件
    var xz_html = "<option value=''>案件性质</option>";
    for(var i = 0 ; xzs && i < xzs.length ; i ++){
        dists.push({"fbxmc":xzs[i].xz + " - 被抽中" + xzs[i].cases + "条 - 占比" + (xzs[i].cases/joinedCases.length * 100).toFixed(2)  +"%",fbxlx:"2","fbx":xzs[i].xz});
        xz_html += "<option value='"+xzs[i].xz+"'>"+xzs[i].xz + " - 被抽中" + xzs[i].cases + "条 - 占比" + (xzs[i].cases/joinedCases.length * 100).toFixed(2)  +"%</option>";
    }
    $("#form_sel_xz").html(xz_html);
    //设置类型分布控件
    var lx_html = "<option value=''>案件类型</option>";
    for(var i = 0 ; lxs && i < lxs.length ; i ++){
        if(!lxs[i].lx){
            lxs[i].lx = "其他";
        }
        dists.push({"fbxmc":lxs[i].lx + " - 被抽中" + lxs[i].cases + "条 - 占比" + (lxs[i].cases/joinedCases.length * 100).toFixed(2)  +"%",fbxlx:"3","fbx":lxs[i].lx});
        lx_html += "<option value='"+lxs[i].lx+"'>"+lxs[i].lx + " - 被抽中" + lxs[i].cases + "条 - 占比" + (lxs[i].cases/joinedCases.length * 100).toFixed(2)  +"%</option>";
    }
    $("#form_sel_lx").html(lx_html);
}

//获取待分配案件的案号
function getJoinedCaseIds() {
    var arr=[];
    for(var i = 0 ; joinedCases && i < joinedCases.length ; i ++ ){
        arr.push(joinedCases[i].ajid);
    }
    return arr.join(";");
}

//刷新待分配案件列表
function refreshJoinedCasesGrid() {
    //根据案件性质，类型，区域，及是否分配属性进行过滤。(取所有未分配的案件)
    $("#table2").jqGrid('clearGridData');
    var cases = joinedCases;
    for ( var i = 0; i < cases.length; i++){
        if($("#form_sel_region").val() && $("#form_sel_xz").val() && $("#form_sel_lx").val()){
            var x = $("#form_sel_lx").val();
            if(x == "其他"){
                x = "";
            }
            if(cases[i].gsfy == $("#form_sel_region").val() && cases[i].xz == $("#form_sel_xz").val() && cases[i].lx == x){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_region").val() && $("#form_sel_xz").val()){
            if(cases[i].gsfy == $("#form_sel_region").val() && cases[i].xz == $("#form_sel_xz").val()){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_region").val() && $("#form_sel_lx").val()){
            var x = $("#form_sel_lx").val();
            if(x == "其他"){
                x = "";
            }
            if(cases[i].gsfy == $("#form_sel_region").val() && cases[i].lx == x){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_xz").val() && $("#form_sel_lx").val()){
            var x = $("#form_sel_lx").val();
            if(x == "其他"){
                x = "";
            }
            if(cases[i].xz == $("#form_sel_xz").val() && cases[i].lx == x){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_region").val()){
            if(cases[i].gsfy == $("#form_sel_region").val()){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_xz").val()){
            if(cases[i].xz == $("#form_sel_xz").val()){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else if ($("#form_sel_lx").val()){
            var x = $("#form_sel_lx").val();
            if(x == "其他"){
                x = "";
            }
            if(cases[i].lx == x){
                if(cases[i].groupid){
                    continue;
                }else{
                    $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
                }
            }else{
                continue;
            }
        }else{
            if(cases[i].groupid){
                continue;
            }else{
                $("#table2").jqGrid('addRowData', cases[i].ajid, cases[i]);
            }
        }
    }
}

//刷新专家组列表
var teams = [];
function refreshTeamGrid() {
    var chosedcount= 0;
    for(var i = 0 ; teams && i < teams.length ; i ++){
        teams[i].pc = 0;
        for(var j = 0 ; joinedCases && j < joinedCases.length; j ++){
            if(joinedCases[j].groupid == teams[i].id){
                teams[i].pc = parseInt(teams[i].pc) + 1;
                chosedcount++;
            }
        }
    }

    $("#table3").jqGrid('clearGridData');
    for ( var i = 0; i < teams.length; i++){
        var row = teams[i];
        if(chosedcount > 0){
            row.zb = (parseInt(row.pc)/chosedcount * 100).toFixed(0)+"%";
        }
        $("#table3").jqGrid('addRowData', row.id, row);
    }

}

function addProGroup(groupObject){
    var idx = -1;
    for(var i = 0 ; teams && i < teams.length ; i ++){
        if(teams[i].id == groupObject.id){
            idx = i;
            break;
        }
    }
    if(idx > -1){
        teams.splice(idx,1);
    }
    // teams.push(groupObject);
    teams.splice(0, 0, groupObject);
    refreshTeamGrid();
}

function removeProGroup(id) {
    layer.confirm('确认删除该专家组吗？', {
        btn : [ '确认', '取消' ]
    }, function(lo) {
        layer.close(lo);
        layer.msg("删除专家组成功",{icon:1});
        var idx = -1;
        for(var i = 0 ; teams && i < teams.length ; i ++){
            if(teams[i].id == id){
                idx = i;
                break;
            }
        }
        if(idx > -1){
            teams.splice(idx,1);
        }
        reChooseCasesByTeam(id);//撤销之前对该组的案件分配
        refreshTeamGrid();
    });
}

function editProGroup(id) {
    lo = layer.open({
        type : 1,
        shift : 5,
        title : '编辑组',
        shadeClose : false,
        shade : 0.3,
        area : [ '600px', '400px' ],
        content : $("#div_newGroup"),
        cancel : function(index) {
            layer.close(index);
        },
        success:function () {
            var groupObj = null;
            for(var i = 0 ; teams && i < teams.length ; i ++){
                if(teams[i].id == id){
                    groupObj = teams[i];
                    break;
                }
            }
            //设置form
            $("#from_ipt_groupname").val(groupObj.name);
            $("#form_ipt_groupid").val(groupObj.id);
            $("#form_sel_teamleader").find("option").removeAttr("selected");
            $("#form_sel_teamleader").val(groupObj.teamleaderid);
            $("#form_sel_teamleader").trigger("chosen:updated");
            var teanmates = groupObj.teammateids ? groupObj.teammateids.split(";"):[];
            $("#form_sel_teammate").find("option").removeAttr("selected");
            $("#form_sel_teammate").val(teanmates);
            $("#form_sel_teammate").trigger("chosen:updated");
        }
    });
}

//分配案件
function chooseCases(ids,teamid) {
    for(var i = 0 ; joinedCases && i < joinedCases.length; i ++){
        if(ids.indexOf(joinedCases[i].ajid) > -1){
            joinedCases[i].groupid = teamid;
        }
    }
    refreshJoinedCasesGrid();
    refreshTeamGrid();
}
//撤销分配（整组）
function reChooseCasesByTeam(teamid) {
    for(var i = 0 ; joinedCases && i < joinedCases.length; i ++){
        if(joinedCases[i].groupid && joinedCases[i].groupid == teamid){
            joinedCases[i].groupid = null;
        }
    }
    refreshJoinedCasesGrid();
    refreshTeamGrid();
}
//撤销分配（单个案件）
function reChooseCasesByCase(caseid) {
    for(var i = 0 ; joinedCases && i < joinedCases.length; i ++){
        if(joinedCases[i].groupid && joinedCases[i].ajid == caseid){
            joinedCases[i].groupid = null;
        }
    }
    refreshJoinedCasesGrid();
    refreshTeamGrid();
}

var max_allowed_extract_case_count = 1024;

function docheckFiles() {

}

//============================================================
$(function () {
    
    //初始化jquery.step组件，分步骤引导用户发起评查活动
    // var checkFiles = true;
    $("#wizard").steps({
        enableCancelButton: false,
        enableFinishButton: true,
        onStepChanging: function (event, currentIndex, newIndex) {
            if(currentIndex == 0 && formChanged()){
                reloadGrid1();
            }
            if(newIndex == 3){
                $(".subforms").css("cssText","background-color:#1AB394 !important;color:#fff !important");
            }else{
                $(".subforms").css("cssText","background-color:#eee !important;color:#aaa !important");
            }
            // if(currentIndex == 1){
            //     if(checkFiles) {
            //         docheckFiles();
            //         checkFiles = false;
            //     }
            // }
            return true;
        },
        onFinishing:function (event, currentIndex) {
            if(currentIndex < 3){
                return false;
            }

            for(var x = 0 ; joinedCases && x< joinedCases.length; x++){
                if(!joinedCases[x].groupid){
                    layer.msg("您还有未分配的案件，请将案件分配给专家组。");
                    return false;
                }
            }

            if($("#txt_bt").val() && $("#form_sel_pfb").val()){
                $.ajax({
                    type : 'POST',
                    url : URL_SUBMIT,
                    datatype : 'json',
                    data:{
                        bt:$("#txt_bt").val(),
                        btys:$("#btys1").is(':checked')?"black":"red",
                        pclx:$("#type1").is(':checked')?"常规评查":($("#type2").is(':checked')?"专项评查":"重点评查"),
                        pcrw:$("#task1").is(':checked')?"案件":($("#task2").is(':checked')?"文书":"庭审"),
                        pfb:$("#form_sel_pfb").val(),
                        nr:$('#xxnr').code(),
                        casesjson:JSON.stringify(joinedCases),
                        teamjson:JSON.stringify(teams),
                        distjson:JSON.stringify(dists)

                    },
                    success : function(data) {
                        if(data == "1"){
                            top.loadBadges();
                            window.location.reload(true);
                            top.layer.msg("公告发布成功! 正在等待审核。",{icon:1});
                        }else{
                            window.location.reload(true);
                            top.layer.msg("公告发布失败！请联系系统管理员......",{icon:2});
                        }
                    }
                });
            }else{
                layer.msg("请将所有必填项填写完整");
                return false;
            }
            return true;
        }
    });
    $(".content").css("height",($('body').height()-110)+"px");

    //icheck 初始化
    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green'
    });

    //初始化组织机构选则器
    $.ajax({
        type : 'POST',
        url : URL_ORGS,
        datatype : 'json',
        // async : false,
        success : function(data) {
            var zNodes = data;
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $("#menuBtn").click(function() {
                showMenu();
                return false;
            });
        }
    });
    //设置评分表
    $.ajax({
        type : 'POST',
        url : URL_PFB,
        datatype : 'json',
        // async : false,
        success : function(data) {
            if (data && data.rows && data.rows.length > 0) {
                $("#form_sel_pfb").each(function() {
                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.rows.length; i++) {
                        html += '<option ' + 'value="' + data.rows[i].tableid + '">' + data.rows[i].mbmc + '</option>'
                    }
                    $(this).html(html);
                });
            } else {
                $("#form_sel_pfb").each(function() {
                    $(this).html('<option value="">--请选择--</option>');
                })
            }
        }
    });

    $("#a_refresh_pfb").click(function () {
        $.ajax({
            type : 'POST',
            url : URL_PFB,
            datatype : 'json',
            // async : false,
            success : function(data) {
                if (data && data.rows && data.rows.length > 0) {
                    $("#form_sel_pfb").each(function() {
                        var html = '<option value="">--请选择--</option>';
                        for (var i = 0; i < data.rows.length; i++) {
                            html += '<option ' + 'value="' + data.rows[i].tableid + '">' + data.rows[i].mbmc + '</option>'
                        }
                        $(this).html(html);
                    });
                } else {
                    $("#form_sel_pfb").each(function() {
                        $(this).html('<option value="">--请选择--</option>');
                    })
                }
            }
        });
    });

    $('#btn_clearorgs').click(function(){
        $('#citySel').val("");
        $("#zzid").val("");
        $('#chx_sfbhxjfy').iCheck('uncheck');
    });

    //手动选中案件抽取
    $("#btn_extract_checked").click(function () {
        var ids = $("#table1").jqGrid('getGridParam', 'selarrrow');
        if(ids.length == 0){
            layer.msg("未选中任何数据!");
            return;
        }
        layer.confirm('本次选中案件'+ids.length+'条，是否确定抽取？', {
            btn: ['确定','取消'] //按钮
        }, function(index){
            layer.close(index);
            var lo ;
            lo = layer.msg("正在抽取案件，请稍后....",{icon:6,time:99999999});

            $.ajax({
                type : 'POST',
                url : ahcourt.ctx+"/case/sdcheck.do?ids="+ids.join(";"),
                datatype : 'json',
                // async : false,
                success : function(data) {
                    var drr = data.split(";");

                    var caselist = [];
                    for(var i = 0 ; i< ids.length ; i ++){
                        var rowdata = $("#table1").jqGrid('getRowData',ids[i]);
                        if(drr.indexOf(ids[i]) > -1){
                            rowdata.passcheck = "1";
                        }
                        caselist.push(rowdata);
                    }
                    extractSelectedCases(caselist);
                    layer.close(lo);
                    layer.msg("已成功抽取"+ids.length+"条案件",{icon:1});
                }
            });
        }, function(index){
            layer.close(index);
        });
    });

    $("#btn_extract_random").click(function () {
        var casecount = $("#txt_random").val();
        if(casecount && !isNaN(casecount)){
            var extractedcount = joinedCases.length;
            if(parseInt(casecount) + extractedcount > max_allowed_extract_case_count){
                layer.msg("一次评查活动最多不允许抽取案件超过1024件。");
                return false;
            }
            var gridrecords = $("#table1").jqGrid('getGridParam','records');
            if(parseInt(casecount)>gridrecords){
                layer.msg("案件库符合条件的案件数量小于要抽取的数量，最多只能随机抽取"+gridrecords+"条。");
                return false;
            }
        }else{
            layer.msg("案件数必须输入整数");
            return false;
        }
        extractRandomCases(casecount);
    });

    //各个表格框架先加载，数据随后加载。
    loadGrid1();
    loadGrid2();
    loadGrid3();

    //初始化富文本控件
    $('.summernote').summernote({
        lang: 'zh-CN',
        height:300
    });

    var l_chosen_group;
    $("#btn_chooseTo").click(function () {
        var ids = $("#table2").jqGrid('getGridParam', 'selarrrow');
        if(ids.length == 0){
            layer.msg("请先从待分配案件选择至少一条案件后再分配!");
            return;
        }
        //先动态填充组到选择控件中
        var html = "<option value=''>--请选择专家组--</option>";
        for(var i = 0 ; teams && i < teams.length ; i ++){
            html += "<option value='"+teams[i].id+"'>"+teams[i].name+"</option>";
        }
        $("#from_sel_groups").html(html);
        l_chosen_group = layer.open({
            type : 1,
            shift : 5,
            title : '将选中案件分配至...',
            shadeClose : false,
            shade : 0.3,
            area : [ '400px', '200px' ],
            content : $("#div_chooseTo"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $("#btn_deletebatch").click(function () {
        var ids = $("#table2").jqGrid('getGridParam', 'selarrrow');
        if(ids.length == 0){
            layer.msg("请至少选择一个案件后再删除!");
            return;
        }

        layer.confirm('确认将选中案件从待分配列表移除吗？', {
            btn : [ '确认', '取消' ]
        }, function(lo) {
            layer.close(lo);
            layer.msg("案件移除成功!",{icon:1});
            for(var i =0 ; i <ids.length;i++){
                var idx = -1;
                for(var j = 0 ; joinedCases && j < joinedCases.length ; j ++){
                    if(joinedCases[j].ajid == ids[i]){
                        idx = j;
                    }
                }
                if(idx > -1){
                    joinedCases.splice(idx,1);
                }
            }
            reloadTab3();//刷新第三步，将待分配案件数，三个下拉框重置；
            refreshJoinedCasesGrid();
        });
    });

    $("#btn_chosenCaseToGroup").click(function () {
        if(!$("#from_sel_groups").val()){
            layer.msg("必须选择一个专家组!");
            return false;
        }
        var caselist = [];
        var ids = $("#table2").jqGrid('getGridParam', 'selarrrow');
        chooseCases(ids,$("#from_sel_groups").val());
        layer.close(l_chosen_group);
    });
    $("#btn_newGroup").click(function () {
        //清空form
        $("#from_ipt_groupname").val("");
        $("#form_ipt_groupid").val("");
        $("#form_sel_teamleader").find("option").removeAttr("selected");
        $("#form_sel_teamleader").find("option:first").attr("selected","selected");
        $("#form_sel_teamleader").trigger("chosen:updated");
        $("#form_sel_teammate").find("option").removeAttr("selected");
        $("#form_sel_teammate").trigger("chosen:updated");
        lo = layer.open({
            type : 1,
            shift : 5,
            title : '新建组',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '400px' ],
            content : $("#div_newGroup"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
    
    $("#btn_savegroup").click(function () {
        if(!$("#from_ipt_groupname").val()){
            layer.msg("组名不能为空!");
            return false;
        }
        if(!$("#form_sel_teamleader").val()){
            layer.msg("组长不能为空!");
            return false;
        }
        if("--请选择--" == $("#form_sel_teamleader").val()){
            layer.msg("组长不能为空!");
            return false;
        }
        layer.close(lo);
        var tms = "";
        $("#form_sel_teammate").find("option:selected").each(function () {
            tms += $(this).attr("data-xm")+";"
        });
        addProGroup({
            id:$("#form_ipt_groupid").val()?$("#form_ipt_groupid").val():uuid(),
            name:$("#from_ipt_groupname").val(),
            teamleaderid:$("#form_sel_teamleader").val(),
            teamleadername:$("#form_sel_teamleader").find("option:selected").attr("data-xm"),
            teammateids:$("#form_sel_teammate").val()?$("#form_sel_teammate").val().join(";"):"",
            teammatenames:tms,
            pc:"0",
            zb:"0%"
        });
    });

    $.ajax({
        type : 'POST',
        url : URL_PROFESSIONALS,
        datatype : 'json',
        async : false,
        success : function(data) {
            var html="";
            for (var i = 0; data && data.rows && i < data.rows.length; i++) {
                html += '<option data-xm="'+data.rows[i].xm+'" value="' + data.rows[i].userid + '" >' + data.rows[i].xm + ' (' + data.rows[i].zzjgmc + ')' + '</option>'
            }
            $("#form_sel_teamleader").html("<option>--请选择--</option>"+html);
            $("#form_sel_teammate").html(html);
        }
    });

    for ( var selector in config) {
        $(selector).chosen(config[selector]);
    }
    $(".chosen-choices").css("cssText","height:80px !important");
    
    $("#form_sel_region").change(function () {
        refreshJoinedCasesGrid();
    });
    $("#form_sel_lx").change(function () {
        refreshJoinedCasesGrid();
    });
    $("#form_sel_xz").change(function () {
        refreshJoinedCasesGrid();
    });
    $('#chx_sfbhxjfy').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定
        if(!$("#citySel").val()){
            layer.msg("请先选择归属法院");
            setTimeout("$('#chx_sfbhxjfy').iCheck('uncheck')",500)
        }
    });

    $('#checkAllAjxz').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定
        $('#ajxz80401').iCheck('check');
        $('#ajxz80402').iCheck('check');
        $('#ajxz80403').iCheck('check');
        $('#ajxz80404').iCheck('check');
        $('#ajxz80405').iCheck('check');
    });
    $('#checkAllAjxz').on('ifUnchecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定
        $('#ajxz80401').iCheck('uncheck');
        $('#ajxz80402').iCheck('uncheck');
        $('#ajxz80403').iCheck('uncheck');
        $('#ajxz80404').iCheck('uncheck');
        $('#ajxz80405').iCheck('uncheck');
    });

    $('#checkAllAjlx').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定
        $('#ajlx80601').iCheck('check');
        $('#ajlx80602').iCheck('check');
        $('#ajlx80603').iCheck('check');
        $('#ajlx80604').iCheck('check');
        $('#ajlx80605').iCheck('check');
    });
    $('#checkAllAjlx').on('ifUnchecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定
        $('#ajlx80601').iCheck('uncheck');
        $('#ajlx80602').iCheck('uncheck');
        $('#ajlx80603').iCheck('uncheck');
        $('#ajlx80604').iCheck('uncheck');
        $('#ajlx80605').iCheck('uncheck');
    });
});



function loadGrid1() {
    $("#table1").jqGrid({
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 230,
        width : $('body').width() ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ah',name : 'ah',hidden : true,sortable:false,frozen : true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,sortable:false,frozen : true},
            {label : 'passcheck',name : 'passcheck',hidden : true,sortable:false,frozen : true},
            {label : 'pcjl',name : 'pcjl',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'fmt1', width : 120,sortable:false,frozen : true,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="check(3,\'' + rowObject.ajid + '\')">'+rowObject.ah+'</a>'
                }
            },
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
                }
            },
            {label : '评查记录',name : 'fmt2',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewPcjl(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.pcjl+'</a>';
                }
            },
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 150,sortable:false},
            {label : '结案方式',name : 'jafs', width : 120,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
        ],
        pager:"#pager1",
        viewrecords: true
    });
}

function reloadGrid1() {
    var obj = getFromValues();
    // console.log(obj)
    $("#table1").jqGrid().setGridParam({
        url : URL_CASES,
        postData:obj,
        page : 1
    }).trigger("reloadGrid");
}

function loadGrid2() {
    $("#table2").jqGrid({
        datatype : "local",
        multiselect : true,
        height : $('body').height() - 305,
        width : $('body').width() * 0.5-10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 100000000,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,sortable:false,frozen : true},
            {label : 'passcheck',name : 'passcheck',hidden : true,sortable:false,frozen : true},
            {label : 'pcjl',name : 'pcjl',hidden : true,sortable:false,frozen : true},
            {label : '<i style="color:grey" class="fa fa-trash"></i>',name : 'fmt1', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="removeCase(\'' + rowObject.ajid + '\')"><i class="fa fa-trash"></i> </button>';
            }},
            {label : '<i style="color:grey" class="fa fa-warning"></i>',name : 'fmt2', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                if(rowObject.passcheck == "1"){
                    return '<div style="padding-top:3px"><i style="color: darkgreen;" class="fa fa-check"></i></div>';
                }else{
                    return '<div style="padding-top:3px"><i style="color: orange;" class="fa fa-warning"></i></div>';
                }
            }},
            {label : '案号',name : 'fmt3', width : 120,sortable:false,frozen : true,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="check(3,\'' + rowObject.ajid + '\')">'+rowObject.ah+'</a>'
            }},
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
                }
            },
            {label : '评查记录',name : 'fmt2',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewPcjl(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.pcjl+'</a>';
                }
            },
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 120,sortable:false},
            {label : '结案方式',name : 'jafs', width : 80,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
        ]
    });
}

function loadGrid3() {
    $("#table3").jqGrid({
        datatype : "local",
        height : $('body').height() - 225,
        width : $('body').width() * 0.45-10,
        shrinkToFit : true,
        rowNum : 2000,
        colModel : [
            {label : 'id',name : 'id',hidden : true,key : true,sortable:false,frozen : true},
            {label : '&nbsp;',name : '', width : 90,sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="editProGroup(\'' + rowObject.id + '\')" title="编辑"><i class="fa fa-edit"></i> </button>'
                    +  '<button class="btn btn-link btn-xs " type="button" onclick="removeProGroup(\'' + rowObject.id + '\')" title="移除"><i class="fa fa-trash"></i> </button>';
            }},
            {label : '组名',name : 'name',width : 100,sortable:false},
            {label : '组长',name : 'teamleadername',width : 80,sortable:false},
            {label : '组员',name : 'teammatenames', width : 200,sortable:false},
            {label : '评查',name : 'pc', width : 60,sortable:false,align:'right'},
            {label : '占比',name : 'zb', width : 60,sortable:false,align:'right'}
        ],
        pager:"#pager3",
        subGrid : true,
        subGridRowExpanded : initChildGrid1,
        subGridOptions : {
            "plusicon" : "fa fa-plus",
            "minusicon" : "fa fa-minus",
            "expandOnLoad" : false
        }
    });
}

function initChildGrid1(parentRowID, parentRowKey) {
    var tabid = parentRowID + "_table";
    $('#' + parentRowID).append('<table id="' + tabid + '"></table>');
    $("#" + tabid).jqGrid({
        datatype : "local",
        height : 150,
        width : $('body').width() * 0.45 - 60,
        autowidth : true,
        shrinkToFit : false,
        rowNum : 100000,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'teamid',name : 'teamid',hidden : true,sortable:false,frozen : true},
            {label : 'ah',name : 'ah',hidden : true,sortable:false,frozen : true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,sortable:false,frozen : true},
            {label : 'passcheck',name : 'passcheck',hidden : true,sortable:false,frozen : true},
            {label : 'pcjl',name : 'pcjl',hidden : true,sortable:false,frozen : true},
            {label : '-',name : 'fmt1', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="reChooseCasesByCase(\'' + rowObject.ajid + '\')"><i class="fa fa-long-arrow-left"></i> </button>';
            }},
            // {label : '<i style="color:grey" class="fa fa-warning"></i>',name : 'fmt2', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
            //     if(rowObject.passcheck == "1"){
            //         return '<div style="padding-top:3px"><i style="color: darkgreen;" class="fa fa-check"></i></div>';
            //     }else{
            //         return '<div style="padding-top:3px"><i style="color: orange;" class="fa fa-warning"></i></div>';
            //     }
            // }},
            {label : '案号',name : 'fmt2', width : 120,sortable:false,frozen : true,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="check(3,\'' + rowObject.ajid + '\')">'+rowObject.ah+'</a>'
            }},
            // {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,align:'right',
            //     formatter:function (cellvalue,options,rowObject) {
            //         return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
            //     }
            // },
            // {label : '评查记录',name : 'fmt2',frozen : true,width : 80,sortable:false,align:'right',
            //     formatter:function (cellvalue,options,rowObject) {
            //         return '<a onclick="viewPcjl(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.pcjl+'</a>';
            //     }
            // },
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 120,sortable:false},
            {label : '结案方式',name : 'jafs', width : 80,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
        ],
        loadComplete:function () {
            //在此查询专家评查案件并展示
            for(var i = 0 ; joinedCases && i < joinedCases.length ; i ++){
                if(joinedCases[i].groupid == parentRowKey){
                    // console.log(2222)
                    $("#" + tabid).jqGrid('addRowData', joinedCases[i].ajid, joinedCases[i]);
                }
            }
        }
    });
}



function viewRelated(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看关联案件',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/view_relatedcases.jsp?ajid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function viewPcjl(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看评查记录',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/view_pcjl.jsp?ajid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function check(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看案件资料',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/check.jsp?ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}


var setting = {
    view : {dblClickExpand : false},
    data : {simpleData : { enable : true}},
    callback : { onClick : onClick}
};

function onClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "", zzid = "";
    nodes.sort(function compare(a, b) {
        return a.id - b.id;
    });
    v += nodes[0].name;
    zzid = nodes[0].id;
    if (v.length > 0)
        v = v.substring(0, v.length);
    var cityObj = $("#citySel");
    cityObj.val(v);
    $("#zzid").val(zzid);
    cityObj.removeClass("border-red");
    hideMenu();
}
function showMenu() {
    $("#menuContent").slideDown("fast");
    $("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
        hideMenu();
    }
}
var config = {
    '.chosen-select' : {},
    '.chosen-select-deselect' : {
        allow_single_deselect : true
    },
    '.chosen-select-no-single' : {
        disable_search_threshold : 10
    },
    '.chosen-select-no-results' : {
        no_results_text : 'Oops, nothing found!'
    },
    '.chosen-select-width' : {
        width : "95%"
    }
};


function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}