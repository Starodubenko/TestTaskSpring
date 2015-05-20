package com.epam.testapp.model.form;


import org.apache.struts.validator.ValidatorForm;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Newsform extends ValidatorForm {

    private String id;
    private String title;
    private String newsDate;
    private String brief;
    private String content;

    private String operationType;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        if (id == null || id.equals("")) this.id = null;
        else this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) throws ParseException {
        this.newsDate = newsDate;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOperationType() {
        return operationType;
    }

    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }
}
