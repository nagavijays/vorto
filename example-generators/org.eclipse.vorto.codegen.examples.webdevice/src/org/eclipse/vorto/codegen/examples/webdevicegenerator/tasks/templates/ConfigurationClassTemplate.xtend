/*******************************************************************************
 * Copyright (c) 2014 Bosch Software Innovations GmbH and others.
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
 *
 *******************************************************************************/
 package org.eclipse.vorto.codegen.examples.webdevicegenerator.tasks.templates

import org.eclipse.vorto.codegen.api.tasks.ITemplate
import org.eclipse.vorto.codegen.examples.webdevicegenerator.tasks.ModuleUtil
import org.eclipse.vorto.core.api.model.datatype.PrimitivePropertyType
import org.eclipse.vorto.core.api.model.functionblock.FunctionblockModel
import org.eclipse.vorto.core.api.model.informationmodel.FunctionblockProperty

class ConfigurationClassTemplate implements ITemplate<FunctionblockProperty> {
		
	override getContent(FunctionblockProperty fbProperty) {
		var FunctionblockModel model = fbProperty.type
		
		return '''
		package «ModuleUtil.getModelPackage(model)»;

		import org.codehaus.jackson.map.annotate.JsonSerialize;
		
		@JsonSerialize
		public class «fbProperty.name»Configuration {			
		«IF model.functionblock.configuration!=null»
			«FOR configurationField : model.functionblock.configuration.properties»	
			«IF configurationField.type instanceof PrimitivePropertyType»			
				«var primitiveType = (configurationField.type as PrimitivePropertyType).getType»
				«var primitiveJavaType = PropertyUtil.toJavaFieldType(primitiveType)»
				
					private «primitiveJavaType» «configurationField.name» = «PropertyUtil.getDefaultValue(primitiveType)»;
				
					public «primitiveJavaType» get«configurationField.name.toFirstUpper»() {
						return «configurationField.name»;
					}
							
					public void set«configurationField.name.toFirstUpper»(«primitiveJavaType» «configurationField.name») {
						this.«configurationField.name» = «configurationField.name»;
					}		
		    «ENDIF»
			«ENDFOR»						
		«ENDIF»			
		}'''
	}
}