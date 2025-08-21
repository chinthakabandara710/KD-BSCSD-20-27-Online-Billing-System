package com.icbt.service;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;

import com.icbt.model.User;

public class UserServiceTest {
    
    private UserService userService;
    
    @BeforeEach
    public void setUp() {
        userService = UserService.getInstance();
    }
    
    @Test
    public void testValidateUserRegistration() {
        User user = new User(
        		"BC", 
        		"12qw!@QW", 
        		"Chinthaka Bandra", 
        		"bcwbandara@gmail.com", 
        		"user"
        		);
        
        assertDoesNotThrow(() -> userService.validateUserRegistration(user));
    }
}