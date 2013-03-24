package com.hzbank.activiti.modules.bean;

import javax.annotation.Resource;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations = { "classpath:spring/applicationContext_test.xml" })
public class TestBase extends AbstractJUnit4SpringContextTests {

	@Resource
	private RepositoryService repositoryService;
	
	@Test
	public void testConn() throws Exception {
		ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
		query.list();
		
	}
}
