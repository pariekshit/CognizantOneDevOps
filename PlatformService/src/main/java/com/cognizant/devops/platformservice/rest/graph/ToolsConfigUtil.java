/*******************************************************************************
 * Copyright 2017 Cognizant Technology Solutions
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations under
 * the License.
 ******************************************************************************/
package com.cognizant.devops.platformservice.rest.graph;

import java.util.List;

import javax.ws.rs.core.MediaType;

import com.cognizant.devops.platformcommons.config.ApplicationConfigProvider;
import com.cognizant.devops.platformcommons.config.MessageQueueDataModel;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class ToolsConfigUtil {
	private ToolsConfigUtil(){
		
	}
	
	public static JsonObject createSubscriberConfig(String category, String tool, int agentId){
		JsonObject json = new JsonObject();
		json.addProperty("config", category+"."+tool+"."+agentId+".config");
		return json;
	}
	
	public static JsonObject createPublisherConfig(String category, String tool){
		JsonObject json = new JsonObject();
		json.addProperty("data", category+"."+tool+".DATA");
		json.addProperty("health", category+"."+tool+".HEALTH");
		return json;
	}
	
	public static JsonObject createCommunicationConfig(String type){
		JsonObject json = new JsonObject();
		json.addProperty("type", type);
		return json;
	}
	
	public static JsonObject createMqConfig(String exchange){
		JsonObject json = new JsonObject();
		MessageQueueDataModel mqDataModel = ApplicationConfigProvider.getInstance().getMessageQueue();
		json.addProperty("user", mqDataModel.getUser());
		json.addProperty("password", mqDataModel.getPassword());
		json.addProperty("host", mqDataModel.getHost());
		json.addProperty("exchange", exchange);
		return json;
	}
	
	public static ClientResponse doEngineCall(String url, JsonElement request) {
		WebResource resource = Client.create()
				.resource(url);
		ClientResponse response = resource.accept( MediaType.APPLICATION_JSON )
				.type(MediaType.APPLICATION_JSON)
				.entity(request.toString())
				.post(ClientResponse.class);
		return response;
	}
	
	public static JsonElement createUserInputs(List<String> userInputs){
		return new JsonParser().parse(new Gson().toJson(userInputs));
	}
}
