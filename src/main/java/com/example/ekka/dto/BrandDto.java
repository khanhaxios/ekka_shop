package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class BrandDto {
    long id;
    @NotEmpty(message = "Vui lòng nhập tên nhãn hiệu...")
    String nameBrand;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    int item;

    @NotEmpty(message = "Không được để trống trường logo...")
    String logo;
    MultipartFile fileLogo;
}
