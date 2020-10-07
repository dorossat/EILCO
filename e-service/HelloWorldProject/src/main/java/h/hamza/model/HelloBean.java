package h.hamza.model;

import javax.servlet.http.HttpSession;
import java.io.Serializable;

public class HelloBean implements Serializable {
    private String name = "";

    public String getName(){ return name; }

    public void setName(String name){ this.name = name; }
}
