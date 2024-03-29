package com.example.ekka.service;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.CategoryDto;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.repository.genderCategory.GenderCategoryRepository;
import com.example.ekka.repository.product.ProductRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    GenderCategoryRepository genderCategoryRepository;

    @Autowired
    ProductRepository productRepository;

    public void save(CategoryDto categoryDto) throws Exception {
        CategoryEntity categoryEntity = new CategoryEntity();
        BeanUtils.copyProperties(categoryDto, categoryEntity);

        CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryEntity.getCategoryName());
        System.out.println("Name: " + name);
        if (name == null || name.getGenderCategory().getId() != categoryDto.getGenderCategoryId()) {
//            GenderCategoryEntity genderCategoryEntity = new GenderCategoryEntity();
//            genderCategoryEntity.setId(categoryDto.getId());
//            categoryEntity.setGenderCategory(genderCategoryEntity);
//            genderCategoryEntity.setCategoryEntityCollection(Collections.singleton(categoryEntity));
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            categoryEntity.setCreated_at(timestamp);
            categoryEntity.setUpdated_at(timestamp);
            categoryEntity.setState(1);
            categoryEntity.setGenderCategory(genderCategoryRepository.findById(categoryDto.getGenderCategoryId()).orElse(null));

            categoryRepository.save(categoryEntity);
        } else {
            throw new Exception("Loại sản phẩm đã tồn tại!");
        }
    }

    public List<CategoryEntity> listAll() {
        return (List<CategoryEntity>) categoryRepository.findAll();
    }
    public List<CategoryEntity> listAllUpdatedDesc() {
        return (List<CategoryEntity>) categoryRepository.findAllByUpdate_at();
    }
    public List<CategoryEntity> listAllByState() {
        return (List<CategoryEntity>) categoryRepository.findAllByState();
    }

    public CategoryEntity get(long id) {
        return categoryRepository.findById(id).get();
    }

    public void deleteCategory(CategoryDto categoryDto) throws Exception {
        CategoryEntity categoryEntity = new CategoryEntity();
        BeanUtils.copyProperties(categoryDto, categoryEntity);
        CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryDto.getCategoryName());

        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        categoryEntity.setCategoryName(name.getCategoryName());
        categoryEntity.setCreated_at(name.getCreated_at());
        categoryEntity.setUpdated_at(timestamp);
        categoryEntity.setGenderCategory(genderCategoryRepository.findById(categoryDto.getGenderCategoryId()).orElse(null));

        categoryRepository.save(categoryEntity);
        productRepository.deleteByCategory(categoryDto.getId());

    }

    public void restoreCategory(CategoryDto categoryDto) throws Exception {
        CategoryEntity categoryEntity = new CategoryEntity();
        BeanUtils.copyProperties(categoryDto, categoryEntity);
        CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryDto.getCategoryName());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        categoryEntity.setCategoryName(name.getCategoryName());
        categoryEntity.setCreated_at(name.getCreated_at());
        categoryEntity.setUpdated_at(timestamp);
        categoryEntity.setGenderCategory(genderCategoryRepository.findById(categoryDto.getGenderCategoryId()).orElse(null));


        categoryRepository.save(categoryEntity);
        productRepository.restoreByCategory(categoryDto.getId());

    }

    public void editCategory(CategoryDto categoryDto) throws Exception {
        CategoryEntity categoryEntity = new CategoryEntity();
        BeanUtils.copyProperties(categoryDto, categoryEntity);
        CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryEntity.getCategoryName());
        CategoryEntity id = categoryRepository.findAllById(categoryEntity.getId());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("name" + name);
        if (name == null || id.getGenderCategory().getId() == categoryDto.getGenderCategoryId()) {
            if (id.getGenderCategory().getId() == categoryDto.getGenderCategoryId() && !id.getCategoryName().equals(categoryDto.getCategoryName())) {
                Long datetime = System.currentTimeMillis();
                Timestamp timestamp = new Timestamp(datetime);
                categoryEntity.setCreated_at(id.getCreated_at());
                categoryEntity.setUpdated_at(timestamp);
                categoryEntity.setState(id.getState());
                categoryEntity.setGenderCategory(genderCategoryRepository.findById(categoryDto.getGenderCategoryId()).orElse(null));

//        userDAO.save(userDto);

                categoryRepository.save(categoryEntity);
            }else {
                throw new Exception("Loại sản phẩm đã tồn tại!");
            }
        } else {
            throw new Exception("Loại sản phẩm theo giới tính đã tồn tại!");
        }

    }
}
