package com.example.ekka.service;

import com.example.ekka.dto.BrandDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.repository.cart.CartRepository;
import com.example.ekka.repository.product.ProductRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;


@Service
public class BrandService {
    @Autowired
    BrandRepository brandRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CartRepository cartRepository;

    public void save(BrandDto brandDto) throws Exception {
        BrandEntity brandEntity = new BrandEntity();
        BeanUtils.copyProperties(brandDto, brandEntity);

        BrandEntity name = brandRepository.findFirstByNameBrand(brandEntity.getNameBrand());
        System.out.println("Name: "+name);
        if(name == null) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            brandEntity.setCreated_at(timestamp);
            brandEntity.setUpdated_at(timestamp);
            brandEntity.setState(1);

            brandRepository.save(brandEntity);
        }else {
            throw new Exception("Nhãn hiệu đã tồn tại!");
        }
    }

    public List<BrandEntity> listAll() {
        return (List<BrandEntity>) brandRepository.findAll();
    }

    public List<BrandEntity> listAllUpdatedDesc() {
        return (List<BrandEntity>) brandRepository.findAllByUpdate_at();
    }

    public List<BrandEntity> listAllByState() {
        return (List<BrandEntity>) brandRepository.findAllByState();
    }

    public BrandEntity get(long id) {
        return brandRepository.findById(id).get();
    }

    public void deleteBrand(BrandDto brandDto) throws Exception {
        BrandEntity brandEntity = new BrandEntity();
        BeanUtils.copyProperties(brandDto, brandEntity);
        BrandEntity name = brandRepository.findFirstByNameBrand(brandDto.getNameBrand());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        brandEntity.setNameBrand(name.getNameBrand());
        brandEntity.setCreated_at(name.getCreated_at());
        brandEntity.setUpdated_at(timestamp);

        brandRepository.save(brandEntity);
        productRepository.deleteByBrand(brandDto.getId());

    }

    public void restoreBrand(BrandDto brandDto) throws Exception {
        BrandEntity brandEntity = new BrandEntity();
        BeanUtils.copyProperties(brandDto, brandEntity);
        BrandEntity name = brandRepository.findFirstByNameBrand(brandDto.getNameBrand());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        brandEntity.setNameBrand(name.getNameBrand());
        brandEntity.setCreated_at(name.getCreated_at());
        brandEntity.setUpdated_at(timestamp);

        brandRepository.save(brandEntity);
        productRepository.restoreByBrand(brandDto.getId());

    }

    public void editBrand(BrandDto brandDto) throws Exception {
        BrandEntity brandEntity = new BrandEntity();
        BeanUtils.copyProperties(brandDto, brandEntity);
        BrandEntity name = brandRepository.findFirstByNameBrand(brandEntity.getNameBrand());
        BrandEntity id = brandRepository.findAllById(brandEntity.getId());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("name" + name);
        if(name == null || name.getId() == brandDto.getId()) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            brandEntity.setCreated_at(id.getCreated_at());
            brandEntity.setUpdated_at(timestamp);
            brandEntity.setState(id.getState());
//        userDAO.save(userDto);

            brandRepository.save(brandEntity);
        }else {
            throw new Exception("Nhãn hiệu đã tồn tại!");
        }

    }
}
