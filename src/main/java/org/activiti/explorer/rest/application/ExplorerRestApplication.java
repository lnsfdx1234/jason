package org.activiti.explorer.rest.application;

import org.activiti.editor.rest.application.ModelerServicesInit;
import org.activiti.rest.api.DefaultResource;
import org.activiti.rest.application.ActivitiRestApplication;
import org.activiti.rest.filter.JsonpFilter;
import org.restlet.Restlet;
import org.restlet.routing.Router;
import org.restlet.service.ConnectorService;

public class ExplorerRestApplication extends ActivitiRestApplication {

  public ExplorerRestApplication() {
    super();
  }
  /**
   * Creates a root Restlet that will receive all incoming calls.
   */
  @Override
  public synchronized Restlet createInboundRoot() {
	   
	 System.out.println(getContext().getClientDispatcher().getName());
    Router router = new Router(getContext());
   
    router.attachDefault(DefaultResource.class);
    ModelerServicesInit.attachResources(router);
    
    JsonpFilter jsonpFilter = new JsonpFilter(getContext());
    jsonpFilter.setNext(router);
    return jsonpFilter;
  }

}
