package myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * MyAppController.
 * @author Regis Humana.
 */
@Controller
public class MyAppController {
    /**
     * Index.
     * @return string.
     */
    @RequestMapping("/")
    public String index() {
        return "index.html";
    }
}
