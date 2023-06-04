package com.alfagift.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alfagift.models.entities.UserRoles;
import com.alfagift.services.UserRoleService;

@RestController
@CrossOrigin(origins = "http://127.0.0.1:5173")
@RequestMapping("/api/userRoles")
public class UserRolesController {
    @Autowired
    private UserRoleService userRoleService;

    @PostMapping
    public UserRoles create(@RequestBody UserRoles userRoles) {
        return userRoleService.save(userRoles);
    }

    @GetMapping
    public Iterable<UserRoles> findAll() {
        return userRoleService.findAll();
    }
}
