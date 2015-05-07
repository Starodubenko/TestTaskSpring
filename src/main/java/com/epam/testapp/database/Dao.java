package com.epam.testapp.database;


import com.epam.testapp.model.entity.AbstractEntity;

import java.util.List;

public interface Dao<T extends AbstractEntity> {
    T findById(int id);
    void insert(T entity);
    void update();
    void delete();

    List<T> findAll();
}
