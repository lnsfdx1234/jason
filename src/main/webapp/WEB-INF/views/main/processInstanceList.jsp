<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/common/global.jsp"%>

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
	
	function getProcessInstances(data) {
		
		function openDiagram(cellValue,option,rowObject){
			return '<a class="trace" href="#" onclick=graphTrace({"pid":"'+rowObject.id+'"}) pid= "' +rowObject.id+ '" title="点击查看流程图">'+cellValue+'</a>';
		}
		$("#demoGrid").jqGrid({
             data: data.data,
             datatype: "local",
             height: 250,
             rowNum: 10,
             rowList: [10],
             colNames:['流程实例ID', '流程定义ID', '业务KEY','开始时间','创建人(查看流程图)'],
             colModel:[
                 {name:'id',index:'id', width:60, align:"center", sorttype:"int",search:true},
                 {name:'processDefinitionId',index:'processDefinitionId', width:120},
                 {name:'businessKey',index:'businessKey', width:100},
                 {name:'startTime',index:'startTime', width:80,sorttype:"date", formatter:"date"},
                 {name:'startUserId',index:'startUserId', width:150,formatter:openDiagram}   
             ],
             pager: "#gridPager",
             viewrecords: true,
             hidegrid:true,
             altRows: true,
             shrinkToFit:true,
             autowidth: true,
             height: '100%',
             multiselect: true,
             beforeSelectRow: function(rowid, e) {
                 var $this = $(this), rows = this.rows,
                     // get id of the previous selected row
                     startId = $this.jqGrid('getGridParam', 'selrow'),
                     startRow, endRow, iStart, iEnd, i, rowidIndex;

                 if (!e.ctrlKey && !e.shiftKey && !e.metaKey) {
                     $this.jqGrid('resetSelection');
                 } else if (startId && e.shiftKey) {
                     $this.jqGrid('resetSelection');

                     // get DOM elements of the previous selected and
                     // the currect selected rows
                     startRow = rows.namedItem(startId);
                     endRow = rows.namedItem(rowid);
                     if (startRow && endRow) {
                         // get min and max from the indexes of the previous selected
                         // and the currect selected rows 
                         iStart = Math.min(startRow.rowIndex, endRow.rowIndex);
                         rowidIndex = endRow.rowIndex;
                         iEnd = Math.max(startRow.rowIndex, rowidIndex);
                         for (i = iStart; i <= iEnd; i++) {
                             // the row with rowid will be selected by
                             // jqGrid. So we don't need select it
                             if (i != rowidIndex) {
                                 $this.jqGrid('setSelection', rows[i].id, false);
                             }
                         }
                     }

                     // clear text selection (needed in IE)
                     if(document.selection && document.selection.empty) {
                         document.selection.empty();
                     } else if(window.getSelection) {
                         window.getSelection().removeAllRanges();
                     }
                 }
                 return true;
             }                
         });
         jQuery("#demoGrid").jqGrid('navGrid','#gridPager',{add:false,del:false});
	};
//	$("#demoGrid").replaceWith($('<table id="demoGrid">'));
         $('#tab-home').click(function() {
         	$.ajax({
				contentType: "application/json",
				type: "GET",
				url: "${ctx}/rest/process-instances?start=0&size=10&sort=id&order=asc", 
				success: function(data) {
					console.log(data);
					//var a = jQuery('<table>');
					//a.insertAfter(jQuery("#demoGrid"));
					//a.GridDestroy();
					getProcessInstances(data.data);
					jQuery("#demoGrid").clearGridData();
					jQuery("#demoGrid").jqGrid('setGridParam',{data:data.data}).trigger('reloadGrid');
					//$('a.trace').on('click',graphTrace);
				},
				error: function(m) {
					console.log(11);
				},
				headers: {
					"Authorization":"Basic YWRtaW46MDAwMDAw"
				}
		  });
        });
        
        $('#tab-sec').click(function() {
         	$.ajax({
				contentType: "application/json",
				type: "GET",
				url: "${ctx}/service/process-instances?start=0&size=10&sort=id&order=asc&businessKey=4&processDefinitionId=leave:1:27", 
				success: function(data) {
					console.log(data);
					//getProcessInstances(data);
					jQuery("#demoGrid").clearGridData();
					jQuery("#demoGrid").jqGrid('setGridParam',{data:data.data}).trigger('reloadGrid');
				},
				error: function(m) {
					console.log(11);
				},
				headers: {
					"Authorization":"Basic YWRtaW46MDAwMDAw"
				}
		  });
        });
        
        $('#tab-home').trigger("click"); 
        
		
	});
</script>

</head>

<body>

<section class="main clearfix"> 
      	<aside class="aside">
          <div class="aside-inner b-rlv" id="aside">
            <div class="b-view genere scrollbar-holder">
              <div class="b-view genere jfk-scrollbar" id="genere">
                <div class="minheight-forfooter">
                  <ul class="b-list-3" id="aside-menu">
                    <li class="b-list-item"><a class="sprite2 on" hideFocus="true" href="javascript:;" id="tab-home" unselectable="on"><span class="text1"><span class="img-ico aside-disk"></span>信贷流程实例</span></a></li>
                    <li class="b-list-item separator-1"></li>
                    <li class="b-list-item"><a cat="2" id="tab-sec" class="b-no-ln type-a-pic" hideFocus="true" href="javascript:;"><span class="text1"><span class="img-ico aside-mpic"></span>风险流程实例</span></a></li>
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
                  <div style="margin:43px;"></div>
                  <form action="javascript:void(0)" class="file-list b-rlv" id="fileList" method="get" name="fileList" onSubmit="return false" unselectable="on">
                    <div class="center loading-data clearfix" id="inifiniteListViewEmptyNote" style="display:none">没有数据</div>
                    <table id="demoGrid" ></table>
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
</body>
</html>