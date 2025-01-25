package lk.ijse.koreanfoodjspproject.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Cart{
 private int pro_id;
 private  String u_email;
 private String pro_name;
 private  String pro_category;
 private String pro_price;
 private String image;


}
