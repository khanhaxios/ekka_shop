package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class UserDto {
    Long id;
    @NotEmpty(message = "Vui lòng nhập Email...")
    @Email(message = "Định dạng Email...")
    String email;
    String fullName;
    String phone;
    String address;
    String role;
    Timestamp created_at;
    Timestamp updated_at;
    @NotEmpty(message = "Vui lòng nhập mật khẩu...")
    String password;
    @NotEmpty(message = "Vui lòng nhập lại mật khẩu chính xác...")
    String rePassword;

    String avatar;
    MultipartFile fileImage;

    String background_profile;
    MultipartFile fileImageBackground;
    int state;
}
