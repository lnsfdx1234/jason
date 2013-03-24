package com.hzbank.activiti.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/history/")
public class HistoryInstanceController {

  @Autowired
  protected HistoryService historyService;

  @RequestMapping(value = "taskList", method = RequestMethod.GET)
  @ResponseBody
  public String running(Model model, HttpServletRequest request) {
    
    HistoricTaskInstanceQuery taskInstanceQuery = historyService.createHistoricTaskInstanceQuery();
    List<HistoricTaskInstance> list = taskInstanceQuery.list();
    Map map = new HashMap();
    map.put("data",list);
    JSONObject result =  JSONObject.fromObject(map);
    System.out.println(result.toString());
    
    return result.toString();
  }
  
  @RequestMapping(value = "processList", method = RequestMethod.GET)
  @ResponseBody
  public String processlist(Model model, HttpServletRequest request) {
    
    HistoricProcessInstanceQuery processInstanceQuery = historyService.createHistoricProcessInstanceQuery();
    List<HistoricProcessInstance> list = processInstanceQuery.list();
    Map map = new HashMap();
    map.put("data",list);
    JSONObject result =  JSONObject.fromObject(map);
    System.out.println(result.toString());
    
    return result.toString();
  }
  
  /**
	 * 将java对象转换成json字符串
	 * 
	 * @param obj java对象
	 * @return json字符串
	 */
	public static String getJsonString4JavaList(Object obj) {
	
		@SuppressWarnings("unused")
		JSONArray jsonArray = JSONArray.fromObject(obj);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new PropertyFilter() {
	        public boolean apply(Object source, String name, Object value) {
	            //忽略birthday属性
	            if (value != null && Set.class.isAssignableFrom(value.getClass())) {
	                return true;
	            }
	            
	            if (value != null && HistoricTaskInstance.class.isAssignableFrom(value.getClass())) {
	                return true;
	            }
	            if (value != null && HistoricTaskInstance.class.isAssignableFrom(value.getClass())) {
	                return true;
	            }
	            if (value != null && Date.class.isAssignableFrom(value.getClass())) {
	                return true;
	            }
	            
	            return false;
	        }
	    });  
		
		return JSONSerializer.toJSON(obj, config).toString();
	}

}
