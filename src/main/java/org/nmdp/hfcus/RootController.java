package org.nmdp.hfcus;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * When going to the root(/), the browser will be redirected to the swagger page.
 */

@Controller
public class RootController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:swagger-ui.html";
    }
}
