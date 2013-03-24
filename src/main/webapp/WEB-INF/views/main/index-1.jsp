<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/common/global.jsp"%>

<link href="${ctx}/hzbank/css/yun_home_all.css?t=201303194804" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/hzbank/wcss/layout.css">
<script type="text/javascript" src="${ctx}/hzbank/wcss/jquery-1.7.1.js"></script>
<script type="text/javascript" src="${ctx}/hzbank/js/jquery.winResize.js"></script>
<script type="text/javascript" src="${ctx}/hzbank/wcss/header.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/hzbank/wcss/header.css">

<link rel="stylesheet" href="${ctx}/hzbank/css/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="${ctx}/hzbank/css/custom-theme/jquery-ui-1.10.0.custom.css">

<script type="text/javascript" src="${ctx}/hzbank/js/jquery-ui-1.9.2.custom.min.js"></script>

<link rel="stylesheet" type="text/css" href="${ctx}/hzbank/jqGrid/css/ui.jqgrid.css">
<link rel="stylesheet" type="text/css" href="${ctx}/hzbank/jqGrid/css/jqGrid.overrides.css">
<script type="text/javascript" src="${ctx}/hzbank/jqGrid/js/grid.locale-cn.js"></script>
<script type="text/javascript" src="${ctx}/hzbank/jqGrid/js/jquery.jqGrid.min.js"></script>

<link rel="stylesheet" type="text/css" href="${ctx}/hzbank/jQuery-UI-FileInput/css/enhanced.css">
<script type="text/javascript" src="${ctx}/hzbank/jQuery-UI-FileInput/js/fileinput.jquery.js"></script>

<script src="${ctx }/js/common/plugins/qtip/jquery.qtip.pack.js" type="text/javascript"></script>
<script src="${ctx }/js/common/plugins/html/jquery.outerhtml.js" type="text/javascript"></script>
<script src="${ctx }/js/module/activiti/workflow.js" type="text/javascript"></script>
<title>Insert title here</title>

<style>
.container {
	overflow: hidden;
	position: relative;
	min-width: 1180px;
}


</style>

<script type="text/javascript">
	$(function() {
		$(window).wresize(function(){
			if ($(window).height() - 74 > 500) {
				$(".container").css("height", $(window).height() - 74);
			} else {
				$(".container").css("height", 500);
			}
		});
		$(".container").css("height", $(window).height() - 74);
		
		$(".container").empty();
		
		$("#mainmenu").find("li").each(function() {
			var menuid = $(this).attr("id");
			$(".container").load("${ctx}/workflow/process-list");
			$(this).click(function() {
				if (menuid == "newAccountItem") {
					$(".container").load("${ctx}/workflow/process-list");
				}
			});
		});
		
		 ////////////////////////
         $('#researchIcon').click(function() {
         	$.ajax({
				type: "GET",
				url: "${ctx}/main/processInstanceList", 
				success: function(data) {
					console.log("processInstanceList success!--");
					$("#data_content").html(data);
				},
				error: function(m) {
					console.log("processInstanceList error");
				},
			});
         	
         });
         
          $('#tradeBlotterIcon').click(function() {
         	$.ajax({
				type: "GET",
				url: "${ctx}/main/taskInstanceList", 
				success: function(data) {
					console.log("taskInstanceList success!--");
					$("#data_content").html(data);
				},
				error: function(m) {
					console.log("taskInstanceList error");
				},
			});
         	
         });
         
         $('#newTradeIcon').click(function() {
         	$.ajax({
				type: "GET",
				url: "${ctx}/main/historyInstanceList", 
				success: function(data) {
					console.log("taskInstanceList success!--");
					$("#data_content").html(data);
				},
				error: function(m) {
					console.log("taskInstanceList error");
				},
			});
         	
         });
		
		
	});
</script>
</head>

<body>
<div class="doc-inner">
  <div class="doc-triple">
    <header class="hd-main b-rlv clearfix"> 
      <!--
      <div class="logo-main"> <a class="yun-logo" href="#" target="_blank" title="百度云">百度云</a> <a class="pan-logo" href="#" target="_blank" title="网盘">网盘</a> </div> -->
      <div class="header" style="background-image: url(${ctx}/hzbank/wcss/bgHeader.png);">
        <div id="navigation">
          <div id="dstLogo"><span>&nbsp;</span> 
        <img src="${ctx}/hzbank/wcss/logo_a.png" width="65%" height="90%">
          </div>
          <a id="logOut" class="logOutClose" href="javascript:void(0)"><span></span></a>
          <input type="hidden" value="false" id="indenpentLoginFlag">
          <ul id="mainmenu">
            <li class="enabled" id="newAccountItem" style=""> <img src="${ctx}/hzbank/wcss/inactiveNewAccount.png" class="inactiveIcon"><img src="${ctx}/hzbank/wcss/activeNewAccount.png" class="activeImage activeIconRestrict hide"><span class="headerText hide">仓库</span>

            </li>
            <li class="enabled" id="newTradeIcon" style=""> <img src="${ctx}/hzbank/wcss/inactiveNewTrade.png" class="inactiveIcon"><img src="${ctx}/hzbank/wcss/activeNewTrade.png" class="activeImage activeIconRestrict hide"><span class="headerText hide comingSoon">历史信息</span> </li>
            <li class="enabled" id="researchIcon" style=""> <img src="${ctx}/hzbank/wcss/inactiveResearch.png" class="inactiveIcon"><img src="${ctx}/hzbank/wcss/activeResearch.png" class="activeImage activeIconRestrict hide"><span class="headerText hide comingSoon">流程</span> </li>
            <li class="enabled" id="tradeBlotterIcon" style="background-image:none"> <img src="${ctx}/hzbank/wcss/inactiveTradeBlotter.png" class="inactiveIcon"><img src="${ctx}/hzbank/wcss/activeTradeBlotter.png" class="activeImage tradeBlotterSpace hide"><span class="headerText hide comingSoon">任务</span> </li>
            <li class="enabled" rel="#closeConfirmOverlay" id="wip" style=""> <img src="${ctx}/hzbank/wcss/inactiveWIP.png" class="inactiveIcon"><img src="${ctx}/hzbank/wcss/activeWIP.png" class="activeImage activeIconRestrict hide" style=""><span class="headerText hide comingSoon">身份</span> </li>
            <li class="last enabled borderLeftTransparent" id="alertIcon" style=""> <img src="${ctx}/hzbank/wcss/inactiveAlert.png" class="inactiveIcon" style="display: inline-block;"><img src="${ctx}/hzbank/wcss/activeAlert.png" class="activeImage alertSpace hide" style="display: none;"><span class="headerText hide comingSoon">管理</span> </li>
          </ul>
        </div>
      </div>
    </header>
    <section id="data_content" class="bd b-rlv clearfix container">
      <section class="main clearfix"> 
      	<aside class="aside">
          <div class="aside-inner b-rlv" id="aside">
            <div class="b-view genere scrollbar-holder">
              <div class="b-view genere jfk-scrollbar" id="genere">
                <div class="minheight-forfooter">
                  <ul class="b-list-3" id="aside-menu">
                    <li class="b-list-item"><a class="sprite2 on" hideFocus="true" href="javascript:;" id="tab-home" unselectable="on"><span class="text1"><span class="img-ico aside-disk"></span>信贷流程定义</span></a></li>
                    <li class="b-list-item separator-1"></li>
                    <li class="b-list-item"><a cat="2" class="b-no-ln type-a-pic" hideFocus="true" href="javascript:;"><span class="text1"><span class="img-ico aside-mpic"></span>风险流程定义</span></a></li>
                  </ul>           
                </div>              
              </div>
            </div>
          </div>
        </aside>
        <section class="pan" id="subwindowContainer" style="margin-left: 209px;">
          <div class="pan-inner b-bdr-2" id="panInner">
            <section class="fns">
              <div id="header-shaw">
                <div class="location clearfix b-header b-bdr-7">
                  <ul class="bar-cmd-view-list clearfix">
                    <!--
                    <li><a class="select" href="javascript:;" id="barCmdViewList" title="列表模式"><span></span></a></li>
                    <li class="end"><a href="javascript:;" id="barCmdViewSmall" title="缩略图模式"><span></span></a></li>
                    -->
                  </ul>
                  <ul class="b-list-2 bar-cmd-list">
                    <li class="b-list-item"><a class="lbtn icon-pl35" href="javascript:;" id="barCmdUpload"><em class="icon-update"></em><b>部署流程</b></a></li>
                    <li class="b-list-item"><a class="icon-btn-createfile" hidefocus="true" href="javascript:;" id="barCmdDelete" title="删除部署">删除部署</a></li>
                    <li class="b-list-item b-rlv haspulldown" id="barCmdOffline" style="display: none;"> <a class="icon-btn-download" hidefocus="true" href="javascript:;" title="离线下载">离线下载</a>
                      <ul class="pull-down-menu">
                        <li><a href="javascript:;" id="barCmdNewOffline">新建普通任务</a></li>
                        <li class="bt-plugin-hidden"><a href="javascript:;" id="barCmdNewBTOffline">新建BT任务</a></li>
                        <li><a href="javascript:;" id="barCmdOfflineList">查看下载列表</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="list-loc dir-path clearfix" label="全部流程" style="display: none;">
                  <li><a class="a-back disabled" href="javascript:;" id="parentDir" title="返回上一级"></a></li>
                  <li id="dirPath"> <a class="b-no-ln disabled" href="javascript:;" id="dirRoot">全部流程</a> <span id="dirLocation"> </span> </li>
                  <li id="dirData"> <span><span class="loadedDate">-</span></span> </li>
                </div>
              </div>
              <div class="b-rlv share-line clearfix">
               
                <div class="property-trs clearfix" id="propertyFilePathContainer" style="display:none"> <span class="property-spans property-stable">路径：</span> <span class="property-spans property-data" id="property-file-path" style="work-break:break-all;width:140px;word-wrap:break-word"></span> </div>
				<section class="files">
                  <header id="netdiskTips">
                    <div class="close-tips"></div>
                    <div class="tips"><em class="sprite-ic"></em>分享功能全新升级，旧版的加密分享和完全公开数据都已导入。<a href="javascript:;" id="share_tips_show">查看详情</a></div>
                  </header>
                  
                  <form action="javascript:void(0)" class="file-list b-rlv" id="fileList" method="get" name="fileList" onSubmit="return false" unselectable="on">
                    <div class="center loading-data clearfix" id="inifiniteListViewEmptyNote" style="display:none">没有数据</div>
                    <table id="demoGrid"></table>
                    <div id="gridPager"></div>
                    <dl class="infinite-listview" id="infiniteListView" style="">
                      <dl class="infinite-listview" id="infiniteListView" style="display:none">
                        <dd class="center loading-data">正在加载数据，请稍候…</dd>
                      </dl>
                    </dl>
                    <dl class="infinite-gridview" id="infiniteGridView" style="display:none">
                      <dd class="center loading-data">正在加载数据，请稍候…</dd>
                    </dl>
                  </form>
                </section>
              </div>
            </section>
          </div>
        </section>
      </section>
    </section>
  </div>
  <div class="scrollbar" id="scrollbar" style="display:none" unselectable="on">
    <div class="scrollbar-arrow scrollbar-arrow-up sprite" id="scrollbarArrowUp" unselectable="on"></div>
    <div class="scrollbar-tracker" id="scrollbarTracker" unselectable="on">
      <div class="scrollbar-thumb" id="scrollbarThumb" unselectable="on"></div>
    </div>
    <div class="scrollbar-arrow scrollbar-arrow-down sprite" id="scrollbarArrowDown" unselectable="on"></div>
  </div>
  <div class="scrollbar" id="scrollbarGrid" style="display:none" unselectable="on">
    <div class="scrollbar-arrow scrollbar-arrow-up sprite" id="scrollbarArrowUpGrid" unselectable="on"></div>
    <div class="scrollbar-tracker" id="scrollbarTrackerGrid" unselectable="on">
      <div class="scrollbar-thumb" id="scrollbarThumbGrid" unselectable="on"></div>
    </div>
    <div class="scrollbar-arrow scrollbar-arrow-down sprite" id="scrollbarArrowDownGrid" unselectable="on"></div>
  </div>
</div>
</div>

<div id="dialog-form" title="流程部署">
  <p class="validateTips"></p>
  <form id="deploy-form" method="post" enctype="multipart/form-data" action="${ctx}/workflow/deploy">
  <fieldset style="margin: 20px">
    <label for="name">流程文件:</label>
    <input type="file" class="span3" name="file" id="file">
  </fieldset>
  </form>
</div>

<div id="dialog-confirm" title="确定要删除该流程吗?">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>确认信息</p>
</div>

</body>
</html>