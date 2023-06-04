package com.alfagift.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alfagift.dto.ResponseData;
import com.alfagift.dto.SearchData;
import com.alfagift.models.entities.User;
import com.alfagift.services.UserService;

import jakarta.validation.Valid;

@RestController
@CrossOrigin(origins = "http://127.0.0.1:5173")
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<ResponseData<User>> create(@Valid @RequestBody User user, Errors errors) {
        ResponseData<User> responseData = new ResponseData<>();

        if (errors.hasErrors()) {
            for (ObjectError error : errors.getAllErrors()) {
                responseData.getMessages().add(error.getDefaultMessage());
            }
            responseData.setStatus(false);
            responseData.setPayload(null);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseData);
        }
        responseData.setStatus(true);
        responseData.setPayload(userService.save(user));
        return ResponseEntity.ok(responseData);
    }

    @GetMapping("/{size}/{page}")
    public Page<User> findAll(@PathVariable("size") int size, @PathVariable("page") int page) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("nama").ascending());
        return userService.findAll(pageable);
    }

    @GetMapping("{id}")
    public User findOne(@PathVariable("id") Long id) {
        return userService.findOne(id);
    }

    @DeleteMapping("/{id}")
    public void removeOne(@PathVariable("id") Long id) {
        userService.deleteOne(id);
    }

    @PutMapping
    public ResponseEntity<ResponseData<User>> update(@Valid @RequestBody User user, Errors errors) {
        ResponseData<User> responseData = new ResponseData<>();

        if (errors.hasErrors()) {
            for (ObjectError error : errors.getAllErrors()) {
                responseData.getMessages().add(error.getDefaultMessage());
            }
            responseData.setStatus(false);
            responseData.setPayload(null);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseData);
        }
        responseData.setStatus(true);
        responseData.setPayload(userService.save(user));
        return ResponseEntity.ok(responseData);
    }

    @PostMapping("/search/{size}/{page}")
    public Iterable<User> getUserName(@RequestBody SearchData searchData, @PathVariable("size") int size,
            @PathVariable("page") int page) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("nama").ascending());
        return userService.findByName(searchData.getSearch(), pageable);
    }

}
