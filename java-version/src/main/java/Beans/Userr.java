package Beans;

import java.io.Serializable;
import com.googlecode.objectify.annotation.Entity;

@Entity
public class Userr implements Serializable{
    public Long id;
    
    public String email;

    public Userr(String email, Long id){
        this.email = email;
        this.id = id;
    }
    
    
    
}
