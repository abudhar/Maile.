package com.sambit.repository;

import com.sambit.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 4:03 PM
 */
public interface categoryRepository extends JpaRepository<Category, Integer> {
}
