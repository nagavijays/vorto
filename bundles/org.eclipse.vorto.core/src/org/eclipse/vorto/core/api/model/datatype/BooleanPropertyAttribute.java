/**
 */
package org.eclipse.vorto.core.api.model.datatype;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Boolean Property Attribute</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttribute#getType <em>Type</em>}</li>
 *   <li>{@link org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttribute#isValue <em>Value</em>}</li>
 * </ul>
 * </p>
 *
 * @see org.eclipse.vorto.core.api.model.datatype.DatatypePackage#getBooleanPropertyAttribute()
 * @model
 * @generated
 */
public interface BooleanPropertyAttribute extends PropertyAttribute {
	/**
	 * Returns the value of the '<em><b>Type</b></em>' attribute.
	 * The literals are from the enumeration {@link org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttributeType}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Type</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Type</em>' attribute.
	 * @see org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttributeType
	 * @see #setType(BooleanPropertyAttributeType)
	 * @see org.eclipse.vorto.core.api.model.datatype.DatatypePackage#getBooleanPropertyAttribute_Type()
	 * @model
	 * @generated
	 */
	BooleanPropertyAttributeType getType();

	/**
	 * Sets the value of the '{@link org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttribute#getType <em>Type</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Type</em>' attribute.
	 * @see org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttributeType
	 * @see #getType()
	 * @generated
	 */
	void setType(BooleanPropertyAttributeType value);

	/**
	 * Returns the value of the '<em><b>Value</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Value</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Value</em>' attribute.
	 * @see #setValue(boolean)
	 * @see org.eclipse.vorto.core.api.model.datatype.DatatypePackage#getBooleanPropertyAttribute_Value()
	 * @model
	 * @generated
	 */
	boolean isValue();

	/**
	 * Sets the value of the '{@link org.eclipse.vorto.core.api.model.datatype.BooleanPropertyAttribute#isValue <em>Value</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Value</em>' attribute.
	 * @see #isValue()
	 * @generated
	 */
	void setValue(boolean value);

} // BooleanPropertyAttribute
