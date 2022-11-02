package com.helmes.exercise;

import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MainRepository {

    private final NamedParameterJdbcTemplate jdbcTemplate;

    public MainRepository(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Sector> getSectors() {
        return jdbcTemplate.query("""
                SELECT *, nlevel(path) as depth FROM sectors ORDER BY path;
                """, new DataClassRowMapper<>(Sector.class));
    }

    public int save(Person person) {
        return jdbcTemplate.queryForObject("""
                INSERT INTO persons (name, sector_ids, is_agree)
                VALUES (:name, :sectorIds, :isAgree) RETURNING id
                """, Map.of("id", person.getId(), "name", person.getName(), "sectorIds", person.getSectorIds(),
                "isAgree", person.isAgree()), Integer.class);
    }

    public Person getData(int id) {
        return jdbcTemplate.queryForObject("""
                SELECT * FROM persons WHERE id=:id""", Map.of("id", id), new PersonRowMapper());
    }

    public int update(Person person) {
        jdbcTemplate.update("""
                UPDATE persons SET name = :name, sector_ids = :sectorIds, is_agree=:isAgree WHERE id=:id;
                """, new MapSqlParameterSource(Map.of("name", person.getName(), "sectorIds", person.getSectorIds(),
                "isAgree", person.isAgree, "id", person.getId())));
        return person.getId();
    }
}
