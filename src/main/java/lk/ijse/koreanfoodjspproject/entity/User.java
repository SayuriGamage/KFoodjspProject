package lk.ijse.koreanfoodjspproject.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private  String role;

    public User(String name, String email, String password, String customer) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = customer;
    }
}
