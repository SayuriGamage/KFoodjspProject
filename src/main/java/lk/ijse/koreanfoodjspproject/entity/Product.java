package lk.ijse.koreanfoodjspproject.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Product {
    private int id;
    private String name;
    private String category;
    private String price;
    private String image;

    public Product(String name, String category, String price, String image) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;

    }
}
