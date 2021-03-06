/*******************************************************************************
 *  Copyright (c) 2015 Bosch Software Innovations GmbH and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  and Eclipse Distribution License v1.0 which accompany this distribution.
 *   
 *  The Eclipse Public License is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *  The Eclipse Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *   
 *  Contributors:
 *  Bosch Software Innovations GmbH - Please refer to git log
 *******************************************************************************/
package org.eclipse.vorto.wizard.datatype;

import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.jface.wizard.Wizard;
import org.eclipse.vorto.wizard.WizardCreateProjectHandler;

public class NewDatatypeProjectHandler extends WizardCreateProjectHandler {

	private String wizardType;

	@Override
	public Object execute(ExecutionEvent executionEvent)
			throws ExecutionException {
		wizardType = executionEvent
				.getParameter("org.eclipse.vorto.editor.datatype.newdatatype.project");
		return super.execute(executionEvent);
	}

	@Override
	public Wizard getWizard() {

		AbstractDatatypeWizard wizard;
		if ("entity".equals(wizardType)) {
			wizard = new EntityWizard();
		} else {
			wizard = new EnumWizard();
		}
		return wizard;
	}

}
