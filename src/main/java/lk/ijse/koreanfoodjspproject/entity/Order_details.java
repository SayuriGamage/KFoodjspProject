package lk.ijse.koreanfoodjspproject.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Order_details {
    private int orderDetail_id;
    private int order_id;
    private  int product_id;
}
