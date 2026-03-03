package com.campusportal.service;

import com.campusportal.model.Claim;
import com.campusportal.model.Item;
import com.campusportal.repository.ClaimRepository;
import com.campusportal.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ClaimService {

    @Autowired
    private ClaimRepository claimRepository;

    @Autowired
    private ItemRepository itemRepository;

    public Claim saveClaim(Claim claim) {
        return claimRepository.save(claim);
    }

    public List<Claim> getClaimsByUser(com.campusportal.model.User user) {
        return claimRepository.findByUser(user);
    }

    public List<Claim> getAllClaims() {
        return claimRepository.findAllByOrderByCreatedAtDesc();
    }

    public List<Claim> getPendingClaims() {
        return claimRepository.findByStatus("PENDING");
    }

    @Transactional
    public void processClaim(Long claimId, String status) {
        Optional<Claim> claimOpt = claimRepository.findById(claimId);
        if (claimOpt.isPresent()) {
            Claim claim = claimOpt.get();
            claim.setStatus(status);
            claim.setUpdatedAt(java.time.LocalDateTime.now());
            claimRepository.save(claim);
            
            if (status.equals("APPROVED")) {
                Item item = claim.getItem();
                item.setStatus("CLAIMED");
                itemRepository.save(item);
            }
        }
    }
}
