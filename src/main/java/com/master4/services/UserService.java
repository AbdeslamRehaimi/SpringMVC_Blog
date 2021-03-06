package com.master4.services;

import com.master4.entities.User;
import com.master4.exceptions.ResourceNotFoundException;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface UserService {
    Page<User> getAllUser(Optional<Integer> pageNo, Integer pageSize, String sortBy);
    List<User> getAllUser();

    User findById(long id) throws ResourceNotFoundException;

    void save(User user);

    void deleteById(long id);

    public boolean loginCheck(String email , String password);

    public User findByEmail(String email);
}