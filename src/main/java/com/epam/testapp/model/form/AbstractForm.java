package com.epam.testapp.model.form;

import org.apache.struts.validator.ValidatorForm;

public abstract class AbstractForm extends ValidatorForm{

    String id;
    String OperationType;

    public String getOperationType() {
        return OperationType;
    }

    public void setOperationType(String operationType) {
        OperationType = operationType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
