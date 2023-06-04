package com.alfagift.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
// import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.alfagift.models.entities.User;
import com.alfagift.models.repos.UserRepos;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepos userRepos;

    public User save(User user) {
        return userRepos.save(user);
    }

    public User findOne(Long id) {
        Optional<User> temp = userRepos.findById(id);
        if (!temp.isPresent()) {
            return null;
        }
        return userRepos.findById(id).get();
    }

    public Page<User> findAll(Pageable pageable) {
        // Sort sort = Sort.by(Sort.Direction.ASC, "nama");
        return userRepos.findAll(pageable);
    }

    public void deleteOne(Long id) {
        userRepos.deleteById(id);
    }

    public Iterable<User> findByName(String search, Pageable pageable) {
        return userRepos.findByNamaContains("%" + search + "%", pageable);
    }
}
