package weixin.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/modifyCourseController")
public class ModifyCourseController {
    @RequestMapping(params = "goCourse")
    public ModelAndView goCourse(HttpServletRequest request,
                               HttpServletResponse response, @RequestParam String courseId) {
        ModelAndView modelAndView = new ModelAndView("courseModify");

        return modelAndView;
    }
}
