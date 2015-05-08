package com.epam.testapp.model.entity;

import org.apache.struts.action.ActionForm;

public abstract class AbstractEntity{

    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
