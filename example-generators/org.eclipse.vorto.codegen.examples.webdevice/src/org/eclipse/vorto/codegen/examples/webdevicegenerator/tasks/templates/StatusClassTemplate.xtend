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
import org.eclipse.vorto.core.api.model.datatype.ObjectPropertyType
import org.eclipse.vorto.core.api.model.datatype.Entity
import org.eclipse.vorto.core.api.model.datatype.Enum
import org.eclipse.vorto.codegen.examples.webdevicegenerator.tasks.templates.JavaClassGeneratorUtils

class StatusClassTemplate implements ITemplate<FunctionblockProperty> {

	override getContent(FunctionblockProperty fbProperty) {
		var FunctionblockModel model = fbProperty.type
		return '''
		package «ModuleUtil.getModelPackage(model)»;
		
		import org.codehaus.jackson.map.annotate.JsonSerialize;
		«JavaClassGeneratorUtils.getImports(model.functionblock.status.properties)»
		
		@JsonSerialize
		public class «fbProperty.name»Status {			
		«IF model.functionblock.status!=null»
			«FOR statusField : model.functionblock.status.properties»	
			«IF statusField.type instanceof PrimitivePropertyType»			
				«var primitiveType = (statusField.type as PrimitivePropertyType).getType»
				«var primitiveJavaType = PropertyUtil.toJavaFieldType(primitiveType)»
					private «primitiveJavaType» «statusField.name» = «PropertyUtil.getDefaultValue(primitiveType)»;

					public «primitiveJavaType» get«statusField.name.toFirstUpper»() {
						return «statusField.name»;
					}
				
					public void set«statusField.name.toFirstUpper»(«primitiveJavaType» «statusField.name») {
						this.«statusField.name» = «statusField.name»;
					}
					
					«ELSEIF statusField.type instanceof ObjectPropertyType»
					«var objectType = (statusField.type as ObjectPropertyType).getType»
					«IF objectType instanceof Entity»
					private «objectType.name» «statusField.name» = new «objectType.name»();
				«ELSEIF objectType instanceof Enum»
					private «objectType.name» «statusField.name»
				«ENDIF»
				
					public «objectType.name» get«statusField.name.toFirstUpper»() {
						return «statusField.name»;
					}
				
					public void set«statusField.name.toFirstUpper»(«objectType.name» «statusField.name») {
						this.«statusField.name» = «statusField.name»;
					}
			«ENDIF»
		«ENDFOR»						
		«ENDIF»			
		}'''
	}
	
	
}