package com.epam.testapp.database;

import com.epam.testapp.model.entity.AbstractEntity;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMapper<T extends AbstractEntity> extends org.springframework.jdbc.core.RowMapper {

    public T mapRow(ResultSet resultSet, int i) throws SQLException;
}
