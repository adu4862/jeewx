package weixin.cms.controller;

import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import weixin.cms.dao.CourseDaoImpl;
import weixin.cms.entity.CourseBean;
import weixin.cms.entity.ResponseEntity;
import weixin.cms.util.ResponseUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/modifyCourseController")
public class ModifyCourseController {
    @RequestMapping(params = "goCourse")
    public ModelAndView goCourse(HttpServletRequest request,
                               HttpServletResponse response, @RequestParam String courseId) {
        ModelAndView modelAndView = new ModelAndView("courseModify");

        return modelAndView;
    }
    @RequestMapping(params = "getAllCourse")
    public void getAllCourse(HttpServletRequest request,
                                 HttpServletResponse response) {
        List<Map<String, Object>> courseList = new CourseDaoImpl().getCourseList("");

        String s = new Gson().toJson(courseList);

        ResponseUtils.renderJson(response, s);
    }
    @RequestMapping(params = "removeCourse")
    public void removeCourse(HttpServletRequest request,
                             HttpServletResponse response, @RequestParam String course_id) {
//        List<Map<String, Object>> courseList = new CourseDaoImpl().getOrderList("");
//
//        String s = new Gson().toJson(courseList);
//
//        ResponseUtils.renderJson(response, s);
        boolean b = new CourseDaoImpl().deleteCourse(course_id);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);

    }
    @RequestMapping(params = "updateOrder")
    public void updateCourse(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestParam String course_id,
                             @RequestParam String subject,
                             @RequestParam String time,
                             @RequestParam String classroom,
                             @RequestParam String teacher,
                             @RequestParam String cost,
                             @RequestParam String number,
                             @RequestParam String status,
                             @RequestParam String image_url,
                             @RequestParam(required = false) String information,
                             @RequestParam String details,
                             @RequestParam String age,
                             @RequestParam String class_name) {

        String sqlString = "set age=\'" + age + "\',class_name=\'" + class_name + "\',classroom=\'" + classroom + "\',cost=\'" + cost + "\',details=\'" + details
                + "\',information=\'" + information + "\',number=\'" + number + "\',status=\'" + status + "\',subject=\'" + subject
                + "\',teacher=\'" + teacher + "\',time=\'" + time + "\',image_url=\'" + image_url+"\'" ;
        boolean b = new CourseDaoImpl().updateCourse(course_id,sqlString);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);
    }

    private void rend(HttpServletResponse response, boolean b, ResponseEntity responseEntity) {
        if (b) {
            responseEntity.setSuccess(true);
            ResponseUtils.renderJson(response, new Gson().toJson(responseEntity));
        } else {
            responseEntity.setMsg("Some errors occured.");
            ResponseUtils.renderJson(response,  new Gson().toJson(responseEntity));
        }
    }

    @RequestMapping(params = "addCourse")
    public void addCourse(HttpServletRequest request,
                                 HttpServletResponse response,
//                          @RequestParam (required = false)String course_id,
                          @RequestParam String subject,
                          @RequestParam String time,
                          @RequestParam String classroom,
                          @RequestParam String teacher,
                          @RequestParam String cost,
                          @RequestParam String number,
                          @RequestParam String status,
                          @RequestParam String image_url,
                          @RequestParam(required = false) String information,
                          @RequestParam String details,
                          @RequestParam String age,
                          @RequestParam int class_type,
                          @RequestParam String class_name) {
        CourseBean courseBean = new CourseBean();
        courseBean.setAge(age);
        courseBean.setClass_name(class_name);
        courseBean.setClassroom(classroom);
        courseBean.setCost(cost);
        courseBean.setDetails(details);
        courseBean.setInformation(information);
        courseBean.setNumber(number);
        courseBean.setStatus(status);
        courseBean.setSubject(subject);
        courseBean.setTeacher(teacher);
        courseBean.setTime(time);
        image_url = "http://www.fjshhdzx.cn/weisite/" + image_url;
        courseBean.setimage_url(image_url);
        courseBean.setClass_type(class_type);
        boolean b = new CourseDaoImpl().insertCourse(courseBean);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);
    }
}
