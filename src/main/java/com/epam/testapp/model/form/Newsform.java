package com.epam.testapp.model.form;

import java.text.ParseException;

public class Newsform extends AbstractForm {

    private String title;
    private String newsDate;
    private String brief;
    private String content;

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
}
