package com.mailer.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mailer.model.Category;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 4:03 PM
 */
public interface categoryRepository extends JpaRepository<Category, Integer> {
}
