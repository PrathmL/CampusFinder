package com.campusportal.repository;

import com.campusportal.model.Claim;
import com.campusportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ClaimRepository extends JpaRepository<Claim, Long> {
    List<Claim> findByStatus(String status);
    List<Claim> findByUser(User user);
    List<Claim> findAllByOrderByCreatedAtDesc();
}
