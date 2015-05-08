package com.epam.testapp.database.H2;

import com.epam.testapp.database.NewsDao;
import com.epam.testapp.model.entity.News;

public class H2NewsDao extends AbstractDao<News> implements NewsDao {
    @Override
    protected Object[] getEntity(News entity) {
        return new Object[]{entity.getId(), entity.getTitle(), entity.getDate(), entity.getBrief(), entity.getContent()};
    }

    @Override
    protected String getUpdateFieldBlock() {
        return "ID = ?, TITLE = ?, NEWS_DATE = ?, BRIEF = ?, CONTENT = ?";
    }

    @Override
    protected Class getEntityClass() {
        return News.class;
    }
}
