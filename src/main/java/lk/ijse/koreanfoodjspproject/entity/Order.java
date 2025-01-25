package lk.ijse.koreanfoodjspproject.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Order {
    private int order_id;
    private String customerEmail;
    private  String orderDate;
    private  String total;
    private  String card;

    public Order(String email, String date, String total, String card) {
        this.customerEmail = email;
        this.orderDate = date;
        this.total = total;
        this.card = card;
    }
}
