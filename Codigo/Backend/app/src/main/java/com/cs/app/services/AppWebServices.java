package com.cs.app.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;


@Service
public class AppWebServices {
    JdbcTemplate jdbcTemplate;
    public AppWebServices(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int getUserCount() {

        return jdbcTemplate.queryForObject("select count(*) from usuario", Integer.class);

    }


}
