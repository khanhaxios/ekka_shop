package com.example.ekka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDto {
    long id;
    int productId;
    int userId;
    String color_product;
    String size_product;
    int item;
    String price;
    double total_price;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
