package com.epam.testapp.model.form;


import org.apache.struts.validator.ValidatorForm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Newsform extends ValidatorForm {

    private Integer id;
    private String name;
    private String title;
    private Date newsDate;
    private String brief;
    private String content;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate){
        try {
            this.newsDate = new SimpleDateFormat("dd.MM.yyyy").parse(newsDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
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
}
