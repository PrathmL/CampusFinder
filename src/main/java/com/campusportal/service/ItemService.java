package com.campusportal.service;

import com.campusportal.model.Item;
import com.campusportal.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@Service
public class ItemService {

    @Autowired
    private ItemRepository itemRepository;

    private final String UPLOAD_DIR = "uploads/";

    public Item saveItem(Item item, MultipartFile image) throws IOException {
        if (image != null && !image.isEmpty()) {
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            
            String fileName = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            item.setImagePath(fileName);
        }
        return itemRepository.save(item);
    }

    public List<Item> getAllItems() {
        return itemRepository.findAllByOrderByCreatedAtDesc();
    }

    public List<Item> getActiveItems() {
        return itemRepository.findByStatusNot("CLAIMED");
    }

    public List<Item> getItemsByStatus(String status) {
        return itemRepository.findByStatus(status);
    }

    public List<Item> getItemsByCategoryAndStatus(String category, String status) {
        return itemRepository.findByCategoryAndStatus(category, status);
    }

    public void deleteItem(Long id) {
        itemRepository.deleteById(id);
    }
}
