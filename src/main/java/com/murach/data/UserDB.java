package com.murach.data;

import com.murach.model.User;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for User operations
 * Simulates database operations using an in-memory list
 */
public class UserDB {
    
    // Static list to simulate database storage
    private static final List<User> users = new ArrayList<>();
    
    // Static initialization block to add some sample users
    static {
        users.add(new User("Trần Bách", "Thăng", "thang2005@email.com"));
        users.add(new User("Lê Xuân", "Tài", "tai2005@email.com"));
        users.add(new User("Nguyễn Duy", "Tân", "tan2005@email.com"));
    }
    
    /**
     * Insert a new user into the database
     * @param user User object to insert
     * @return true if insertion successful, false otherwise
     */
    public static boolean insert(User user) {
        if (user != null && user.getEmail() != null && !user.getEmail().isEmpty()) {
            // Check if user with same email already exists
            for (User existingUser : users) {
                if (existingUser.getEmail().equalsIgnoreCase(user.getEmail())) {
                    // Update existing user instead of adding duplicate
                    existingUser.setFirstName(user.getFirstName());
                    existingUser.setLastName(user.getLastName());
                    return true;
                }
            }
            // Add new user if email doesn't exist
            users.add(user);
            return true;
        }
        return false;
    }
    
    /**
     * Get all users from the database
     * @return List of all users
     */
    public static List<User> selectAll() {
        return new ArrayList<>(users); // Return copy to prevent external modification
    }
    
    /**
     * Find a user by email address
     * @param email Email address to search for
     * @return User object if found, null otherwise
     */
    public static User selectByEmail(String email) {
        if (email != null) {
            for (User user : users) {
                if (user.getEmail().equalsIgnoreCase(email)) {
                    return user;
                }
            }
        }
        return null;
    }
    
    /**
     * Update an existing user
     * @param user User object with updated information
     * @return true if update successful, false otherwise
     */
    public static boolean update(User user) {
        if (user != null && user.getEmail() != null) {
            for (int i = 0; i < users.size(); i++) {
                if (users.get(i).getEmail().equalsIgnoreCase(user.getEmail())) {
                    users.set(i, user);
                    return true;
                }
            }
        }
        return false;
    }
    
    /**
     * Delete a user by email
     * @param email Email of user to delete
     * @return true if deletion successful, false otherwise
     */
    public static boolean delete(String email) {
        if (email != null) {
            return users.removeIf(user -> user.getEmail().equalsIgnoreCase(email));
        }
        return false;
    }
    
    /**
     * Get the total number of users
     * @return Number of users in the database
     */
    public static int getUserCount() {
        return users.size();
    }
}