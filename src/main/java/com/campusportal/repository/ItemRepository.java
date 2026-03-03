package com.campusportal.repository;

import com.campusportal.model.Item;
import com.campusportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {
    List<Item> findByStatus(String status);
    List<Item> findByStatusNot(String status);
    List<Item> findByUser(User user);
    List<Item> findByUserAndStatus(User user, String status);
    List<Item> findByCategory(String category);
    List<Item> findByCategoryAndStatus(String category, String status);
    List<Item> findAllByOrderByCreatedAtDesc();
}
