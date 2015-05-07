package com.epam.testapp.database.H2;


import com.epam.testapp.database.RowMapper;
import com.epam.testapp.model.entity.AbstractEntity;
import com.epam.testapp.model.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class AbstractDao<T extends AbstractEntity> extends JdbcDaoSupport{

    @Autowired
    public T findById(int id) {

        T entity = (T) getJdbcTemplate().
                queryForObject("SELECT * FROM NEWS WHERE id = ?",
                        new Object[]{id},
                        new NewsMapper()
                );
        return entity;
    }

    @Autowired
    public void insert(News news) {
        T entity = (T) getJdbcTemplate().
                queryForObject("INSERT INTO NEWS VALUES (?, ?, ?, ?)",
                        new Object[]{news.getId(), news.getDate(), news.getBrief(), news.getContent()},
                        new NewsMapper()
                );
    }

    @Autowired
    public void update() {

    }

    @Autowired
    public void delete() {

    }

    @Autowired
    public List<T> findAll() {

        String query = "SELECT * FROM NEWS";
        List<T> entityList = getJdbcTemplate().query(query, new NewsMapper());
        return entityList;
    }

    private class NewsMapper implements RowMapper<T> {

        public T mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            News news = new News();
            news.setId(rs.getInt("ID"));
            news.setTitle(rs.getString("TITLE"));
            news.setDate(rs.getDate("NEWS_DATE"));
            news.setBrief(rs.getString("BRIEF"));
            news.setContent(rs.getString("CONTENT"));
            return (T)news;
        }
    }
}
