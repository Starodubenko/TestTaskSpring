package com.epam.testapp.database;


import com.epam.testapp.model.entity.AbstractEntity;

public interface Dao<T extends AbstractEntity> {
    T findById();
    void insert();
    void update();
    void delete();

}
