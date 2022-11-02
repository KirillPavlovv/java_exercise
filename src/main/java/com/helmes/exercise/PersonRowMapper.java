package com.helmes.exercise;

import org.springframework.jdbc.core.RowMapper;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonRowMapper implements RowMapper<Person> {

    public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
        Person person = new Person();
        person.setId(rs.getInt("id"));
        person.setName(rs.getString("name"));
        person.setAgree(rs.getBoolean("is_agree"));
        Array sector_ids = rs.getArray("sector_ids");
        Integer[] array = (Integer[]) sector_ids.getArray();
        person.setSectorIds(array);
        return person;
    }
}
