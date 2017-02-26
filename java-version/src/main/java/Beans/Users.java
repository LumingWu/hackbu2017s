package Beans;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import java.io.Serializable;

@Entity
public class Users implements Serializable{
    @Id public String users;
}
