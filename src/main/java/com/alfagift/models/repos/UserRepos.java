package com.alfagift.models.repos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.alfagift.models.entities.User;

import jakarta.websocket.server.PathParam;

public interface UserRepos extends JpaRepository<User, Long> {

    @Query("SELECT u from User u WHERE u.nama LIKE :search")
    public Page<User> findByNamaContains(@PathParam("search") String search, Pageable pageable);
}
