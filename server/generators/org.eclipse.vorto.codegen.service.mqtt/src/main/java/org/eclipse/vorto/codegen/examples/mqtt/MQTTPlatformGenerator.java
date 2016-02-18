/*******************************************************************************
 * Copyright (c) 2015 Bosch Software Innovations GmbH and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *   
 * The Eclipse Public License is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * The Eclipse Distribution License is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *   
 * Contributors:
 * Bosch Software Innovations GmbH - Please refer to git log
 *******************************************************************************/
package org.eclipse.vorto.codegen.examples.mqtt;

import org.eclipse.vorto.codegen.api.ChainedCodeGeneratorTask;
import org.eclipse.vorto.codegen.api.GenerationResultZip;
import org.eclipse.vorto.codegen.api.GeneratorTaskFromFileTemplate;
import org.eclipse.vorto.codegen.api.IGenerationResult;
import org.eclipse.vorto.codegen.api.IMappingContext;
import org.eclipse.vorto.codegen.api.IVortoCodeGenerator;
import org.eclipse.vorto.codegen.examples.mqtt.templates.IClientHandlerTemplate;
import org.eclipse.vorto.codegen.examples.mqtt.templates.MqttConfigurationTemplate;
import org.eclipse.vorto.codegen.examples.mqtt.templates.PomTemplate;
import org.eclipse.vorto.core.api.model.functionblock.FunctionblockModel;
import org.eclipse.vorto.core.api.model.informationmodel.FunctionblockProperty;
import org.eclipse.vorto.core.api.model.informationmodel.InformationModel;
import org.springframework.stereotype.Service;

/**
 * 
 * @author Alexander Edelmann - Robert Bosch (SEA) Pte. Ltd.
 *
 */
@Service
public class MQTTPlatformGenerator implements IVortoCodeGenerator {
		
	@Override
	public IGenerationResult generate(InformationModel context, IMappingContext mappingContext) {
		GenerationResultZip outputter = new GenerationResultZip(context,getServiceKey());
		for (FunctionblockProperty property : context.getProperties()) {			
			ChainedCodeGeneratorTask<FunctionblockModel> generator = new ChainedCodeGeneratorTask<FunctionblockModel>();
			
			if (property.getType().getFunctionblock().getStatus() != null) {
				generator.addTask(new GeneratorTaskFromFileTemplate<>(new IClientHandlerTemplate()));
				generator.addTask(new GeneratorTaskFromFileTemplate<>(new MqttConfigurationTemplate()));
			}
			generator.addTask(new GeneratorTaskFromFileTemplate<>(new PomTemplate()));
			generator.generate(property.getType(),mappingContext, outputter);
		}
		return outputter;
	}
	
	@Override
	public String getServiceKey() {
		return "mqtt";
	}
}
