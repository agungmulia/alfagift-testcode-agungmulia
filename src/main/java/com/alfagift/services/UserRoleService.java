package com.alfagift.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alfagift.models.entities.UserRoles;
import com.alfagift.models.repos.UserRoleRepos;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserRoleService {
    @Autowired
    private UserRoleRepos userRoleRepos;

    public UserRoles save(UserRoles userRoles) {
        return userRoleRepos.save(userRoles);
    }

    public UserRoles findOne(Long id) {
        Optional<UserRoles> userRoles = userRoleRepos.findById(id);
        if (!userRoles.isPresent()) {
            return null;
        }
        return userRoles.get();
    }

    public Iterable<UserRoles> findAll() {
        // Sort sort = Sort.by(Sort.Direction.ASC, "nama");
        return userRoleRepos.findAll();
    }

    public void deleteOne(Long id) {
        userRoleRepos.deleteById(id);
    }

}
