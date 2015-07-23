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
import org.eclipse.vorto.core.api.model.datatype.Entity
import org.eclipse.vorto.core.api.model.datatype.Enum
import org.eclipse.vorto.core.api.model.datatype.ObjectPropertyType
import org.eclipse.vorto.core.api.model.datatype.PrimitivePropertyType
import org.eclipse.vorto.core.api.model.functionblock.FunctionblockModel
import org.eclipse.vorto.core.api.model.informationmodel.FunctionblockProperty

class FaultClassTemplate implements ITemplate<FunctionblockProperty> {
		
	override getContent(FunctionblockProperty fbProperty) {
		var FunctionblockModel model = fbProperty.type
		'''
		package «ModuleUtil.getModelPackage(model)»;

		import org.codehaus.jackson.map.annotate.JsonSerialize;
		«JavaClassGeneratorUtils.getImports(model.functionblock.status.properties)»
		
		@JsonSerialize
		public class «fbProperty.name»Fault {			
		«IF model.functionblock.fault!=null»
			«FOR FaultField : model.functionblock.fault.properties»	
			«IF FaultField.type instanceof PrimitivePropertyType»			
				«var primitiveType = (FaultField.type as PrimitivePropertyType).getType»
				«var primitiveJavaType = PropertyUtil.toJavaFieldType(primitiveType)»
				
					private «primitiveJavaType» «FaultField.name» = «PropertyUtil.getDefaultValue(primitiveType)»;
				
					public «primitiveJavaType» get«FaultField.name.toFirstUpper»() {
						return «FaultField.name»;
					}
							
					public void set«FaultField.name.toFirstUpper»(«primitiveJavaType» «FaultField.name») {
						this.«FaultField.name» = «FaultField.name»;
					}		
		    «ELSEIF FaultField.type instanceof ObjectPropertyType»
				«var objectType = (FaultField.type as ObjectPropertyType).getType»
				«IF objectType instanceof Entity»
					private «objectType.name» «FaultField.name» = new «objectType.name»();
				«ELSEIF objectType instanceof Enum»
					private «objectType.name» «FaultField.name»
				«ENDIF»
				
					public «objectType.name» get«FaultField.name.toFirstUpper»() {
						return «FaultField.name»;
					}
				
					public void set«FaultField.name.toFirstUpper»(«objectType.name» «FaultField.name») {
						this.«FaultField.name» = «FaultField.name»;
					}
			«ENDIF»
			«ENDFOR»						
		«ENDIF»			
		}'''
	}
}