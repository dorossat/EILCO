package h.hamza.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(schema="HelloDB", name="HelloTable")

public class HelloBean implements Serializable {
    private int id;
    private String name = "";

    @Id
    @GeneratedValue
    @Column(name = "pk_hello")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column(name = "message")
    public String getName(){ return name; }

    public void setName(String name){ this.name = name; }
}
