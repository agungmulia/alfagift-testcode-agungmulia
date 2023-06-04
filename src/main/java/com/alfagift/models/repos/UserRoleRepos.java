package com.alfagift.models.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alfagift.models.entities.UserRoles;

public interface UserRoleRepos extends JpaRepository<UserRoles, Long> {

}
