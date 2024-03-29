package com.example.ekka.service;

import com.example.ekka.dto.GenderCategoryDto;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.repository.genderCategory.GenderCategoryRepository;
import com.example.ekka.repository.product.ProductRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class GenderCategoryService {
    @Autowired
    GenderCategoryRepository genderCategoryRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ProductRepository productRepository;

    public void save(GenderCategoryDto genderCategoryDto) throws Exception {
        GenderCategoryEntity genderCategoryEntity = new GenderCategoryEntity();
        BeanUtils.copyProperties(genderCategoryDto, genderCategoryEntity);

        GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryEntity.getGenderCategoryName());
        System.out.println("Name: "+name);
        if(name == null) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            genderCategoryEntity.setCreated_at(timestamp);
            genderCategoryEntity.setUpdated_at(timestamp);
            genderCategoryEntity.setState(1);

            genderCategoryRepository.save(genderCategoryEntity);
        }else {
            throw new Exception("Danh mục giới tính đã tồn tại!");
        }
    }

    public List<GenderCategoryEntity> listAll() {
        return (List<GenderCategoryEntity>) genderCategoryRepository.findAll();
    }
    public List<GenderCategoryEntity> listAllUpdatedDesc() {
        return (List<GenderCategoryEntity>) genderCategoryRepository.findAllByUpdate_at();
    }

    public List<GenderCategoryEntity> listAllByState() {
        return (List<GenderCategoryEntity>) genderCategoryRepository.findAllByState();
    }

    public GenderCategoryEntity get(long id) {
        return genderCategoryRepository.findById(id).get();
    }

    public void deleteGenderCategory(GenderCategoryDto genderCategoryDto) throws Exception {
        GenderCategoryEntity genderCategoryEntity = new GenderCategoryEntity();
        BeanUtils.copyProperties(genderCategoryDto, genderCategoryEntity);
        GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryDto.getGenderCategoryName());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        genderCategoryEntity.setGenderCategoryName(name.getGenderCategoryName());
        genderCategoryEntity.setCreated_at(name.getCreated_at());
        genderCategoryEntity.setUpdated_at(timestamp);

        genderCategoryRepository.save(genderCategoryEntity);
        categoryRepository.deleteByGenderCategory(genderCategoryDto.getId());
//        productRepository.deleteByGenderCategory(genderCategoryDto.getId());
    }

    public void restoreGenderCategory(GenderCategoryDto genderCategoryDto) throws Exception {
        GenderCategoryEntity genderCategoryEntity = new GenderCategoryEntity();
        BeanUtils.copyProperties(genderCategoryDto, genderCategoryEntity);
        GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryDto.getGenderCategoryName());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        genderCategoryEntity.setGenderCategoryName(name.getGenderCategoryName());
        genderCategoryEntity.setCreated_at(name.getCreated_at());
        genderCategoryEntity.setUpdated_at(timestamp);

        genderCategoryRepository.save(genderCategoryEntity);
        categoryRepository.restoreByGenderCategory(genderCategoryDto.getId());
//        productRepository.restoreByGenderCategory(genderCategoryDto.getId());
    }

    public void editGenderCategory(GenderCategoryDto genderCategoryDto) throws Exception {
        GenderCategoryEntity genderCategoryEntity = new GenderCategoryEntity();
        BeanUtils.copyProperties(genderCategoryDto, genderCategoryEntity);
        GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryEntity.getGenderCategoryName());
        GenderCategoryEntity id = genderCategoryRepository.findAllById(genderCategoryEntity.getId());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("name" + name);
        if(name == null || name.getId() == genderCategoryDto.getId()) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            genderCategoryEntity.setCreated_at(id.getCreated_at());
            genderCategoryEntity.setUpdated_at(timestamp);
            genderCategoryEntity.setState(id.getState());
//        userDAO.save(userDto);

            System.out.println("gender category: " + genderCategoryEntity);
            genderCategoryRepository.save(genderCategoryEntity);
        }else {
            throw new Exception("Danh mục giới tính đã tồn tại!");
        }

    }
}
