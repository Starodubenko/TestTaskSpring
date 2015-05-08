package com.epam.testapp.database.H2;


import com.epam.testapp.database.RowMapper;
import com.epam.testapp.model.entity.AbstractEntity;
import com.epam.testapp.model.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.util.List;

@Component
public abstract class AbstractDao<T extends AbstractEntity> extends JdbcDaoSupport{

    private final String INSERT = "INSERT INTO %s VALUES %s";
    private final String UPDATE = "UPDATE %s SET %s WHERE ID = %s";
    private final String DELETE = "DELETE FROM %s WHERE ID = %s";

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
    public void insert(T entity) {
        getJdbcTemplate().
                update(String.format(INSERT, getEntityClass().getSimpleName(), generateAnyFieldsCountString(getEntity(entity))),
                        getEntity(entity)
                );
    }

    @Autowired
    public void update(T entity) {
        Object[] entity1 = getEntity(entity);
        String format = String.format(UPDATE, getEntityClass().getSimpleName(), getUpdateFieldBlock(), getEntity(entity)[0]);
        getJdbcTemplate().
                update(String.format(UPDATE, getEntityClass().getSimpleName(), getUpdateFieldBlock(), getEntity(entity)[0]),
                        getEntity(entity)
                );
    }

    @Autowired
    public void delete(int id) {
        getJdbcTemplate().
                execute(String.format(DELETE,getEntityClass().getSimpleName(), id));
    }

    @Autowired
    public List<T> findAll() {

        String query = "SELECT * FROM NEWS ORDER BY NEWS_DATE DESC";
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

    protected abstract Object[] getEntity(T entity);
    protected abstract String getUpdateFieldBlock();
    protected abstract Class getEntityClass();

    private String generateAnyFieldsCountString(Object[] o){
        StringBuilder result = new StringBuilder("(");
        for (int i = 0; i < o.length; i++) {
            if (i == o.length-1)
                result.append("?)");
            else
            result.append("?,");
        }
        return result.toString();
    }
}
