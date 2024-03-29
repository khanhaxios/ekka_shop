package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class GenderCategoryDto {
    long id;
    @NotEmpty(message = "Vui lòng nhập tên danh mục giới tính...")
    String genderCategoryName;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    int item;
    @NotEmpty(message = "Không được để trống trường logo...")
    String genderCategoryLogo;
    MultipartFile fileGenderCategory;

    List<GenderCategoryDto> genderCategory;
}
