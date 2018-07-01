package weixin.cms.controller;

import com.google.gson.Gson;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import weixin.cms.dao.OrderDaoImpl;
import weixin.cms.entity.ORderListResp;
import weixin.cms.entity.OrderBean;
import weixin.cms.entity.ResponseEntity;
import weixin.cms.util.ResponseUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/modifyOrderController")
public class ModifyOrderController {

    @RequestMapping(params = "getAllOrder")
    public void getAllOrder(HttpServletRequest request,
                            HttpServletResponse response) {
        //请求页码、每页显示行数、偏移、总数
        int page, rows, offset;
        //获取
        String course_id = request.getParameter("course_id");
        String subject = request.getParameter("subject");

        String name = request.getParameter("name");
        String input_page = request.getParameter("page");
        page = (input_page == null) ? 1 : Integer.parseInt(input_page);
        String input_rows = request.getParameter("rows");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        rows = (input_rows == null) ? 10 : Integer.parseInt(input_rows);
        offset = (page - 1) * rows;
        String sql = " where payed=1  limit " + offset + "," + rows;
        if (StringUtil.isEmpty(startDate)) {
            //无日期筛选
            if (StringUtil.isNotEmpty(name)) {
                //name不为空
                if (StringUtil.isNotEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    //条件查询为course_id
                    sql =" where payed=1 and course_id = " + course_id + " and name = \'" + name +"\' limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    //subject
                    sql =  " where payed=1 and subject = \'" + subject + "\' and name = \'" + name+ "\' limit " + offset + "," + rows;
                } else if (StringUtil.isNotEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    sql =  " where payed=1 and subject = \'" + subject + "\' and course_id = " + course_id + " and name = \'" + name+ "\' limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    sql =  " where payed=1 and name = \'" + name+ "\' limit " + offset + "," + rows;
                }
            }else{
                //name为空
                if (StringUtil.isNotEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    //条件查询为course_id
                    sql =" where payed=1 and course_id = " + course_id + " limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    //subject
                    sql =  " where payed=1 and subject = \'" + subject + "\' limit " + offset + "," + rows;
                } else if (StringUtil.isNotEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    sql =  " where payed=1 and subject = \'" + subject + "\' and course_id = " + course_id + " limit " + offset + "," + rows;
                }
            }

        } else {
            //有日期筛选
            sql = " where payed=1 "+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" limit " + offset + "," + rows;
            if (StringUtil.isNotEmpty(name)) {
                //name不为空
                if (StringUtil.isNotEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    //条件查询为course_id
                    sql =" where payed=1 and course_id = " + course_id+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate + " and name = \'" + name +"\' limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    //subject
                    sql =  " where payed=1 "+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and subject = \'" + subject + "\' and name = \'" + name+ "\' limit " + offset + "," + rows;
                } else if (StringUtil.isNotEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    sql =  " where payed=1"+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and subject = \'" + subject + "\' and course_id = " + course_id + " and name = \'" + name+ "\' limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    sql =  " where payed=1"+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and name = \'" + name+ "\' limit " + offset + "," + rows;
                }
            }else{
                //name为空
                if (StringUtil.isNotEmpty(course_id) && StringUtil.isEmpty(subject)) {
                    //条件查询为course_id
                    sql =" where payed=1"+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and course_id = " + course_id + " limit " + offset + "," + rows;
                } else if (StringUtil.isEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    //subject
                    sql =  " where payed=1"+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and subject = \'" + subject + "\' limit " + offset + "," + rows;
                } else if (StringUtil.isNotEmpty(course_id) && StringUtil.isNotEmpty(subject)) {
                    sql =  " where payed=1"+" AND order_time BETWEEN "+ startDate  +" AND "+ endDate+" and subject = \'" + subject + "\' and course_id = " + course_id + " limit " + offset + "," + rows;
                }
            }


        }








        OrderDaoImpl orderDao = new OrderDaoImpl();
        List<Map<String, Object>> orderList = orderDao.getOrderList(sql);
        int total = orderDao.getOrderCounts();

        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", orderList);//rows键 存放每页记录 list

        ResponseUtils.renderJson(response, new Gson().toJson(jsonMap));
    }

    @RequestMapping(params = "removeOrder")
    public void removeOrder(HttpServletRequest request,
                            HttpServletResponse response, @RequestParam String orderId) {

        boolean b = new OrderDaoImpl().deleteOrder(orderId);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);

    }

    @RequestMapping(params = "updateOrder")
    public void updateOrder(HttpServletRequest request,
                            HttpServletResponse response,
//                            @RequestParam String course_id,
                            @RequestParam(required = false) String name,
                            @RequestParam(required = false) String age,
                            @RequestParam(required = false) String sex,
//                            @RequestParam (required = false)String born,
                            @RequestParam(required = false) String school,
                            @RequestParam(required = false) String grade,
                            @RequestParam(required = false) String hobby,
                            @RequestParam(required = false) String phone,
                            @RequestParam(required = false) String address,
                            @RequestParam(required = false) String father_name,
                            @RequestParam(required = false) String father_phone,
                            @RequestParam(required = false) String mother_name,
                            @RequestParam(required = false) String mother_phone,
                            @RequestParam(required = false) String openId,
                            @RequestParam(required = false) String cost,
                            @RequestParam(required = false) String orderId,
                            @RequestParam(required = false) boolean payed) {
        orderId = orderId.split(",")[0];
        String sqlString = "set name=\'" + name + "\',age=\'" + age + "\',sex=\'" + sex + "\',school=\'" + school
                + "\',grade=\'" + grade + "\',hobby=\'" + hobby + "\',phone=\'" + phone + "\',address=\'" + address
                + "\',mother_phone=\'" + mother_phone + "\',openId=\'" + openId + "\',cost=\'" + cost + "\',orderId=\'" + orderId
                + "\',father_name=\'" + father_name + "\',father_phone=\'" + father_phone + "\',mother_name=\'" + mother_name
                + "\',payed=" + payed + "  ";

        boolean b = new OrderDaoImpl().updateOrder(orderId, sqlString);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);
    }

    private void rend(HttpServletResponse response, boolean b, ResponseEntity responseEntity) {
        if (b) {
            responseEntity.setSuccess(true);
            ResponseUtils.renderJson(response, new Gson().toJson(responseEntity));
        } else {
            responseEntity.setMsg("Some errors occured.");
            ResponseUtils.renderJson(response, new Gson().toJson(responseEntity));
        }
    }

    @RequestMapping(params = "addOrder")
    public void addOrder(HttpServletRequest request,
                         HttpServletResponse response,
//                         @RequestParam String course_id,
                         @RequestParam String name,
                         @RequestParam String age,
                         @RequestParam String sex,
//                         @RequestParam String born,
                         @RequestParam String school,
                         @RequestParam String grade,
                         @RequestParam String hobby,
                         @RequestParam String phone,
                         @RequestParam String address,
                         @RequestParam String father_name,
                         @RequestParam String father_phone,
                         @RequestParam String mother_name,
                         @RequestParam String mother_phone,
                         @RequestParam String openId,
                         @RequestParam String cost,
                         @RequestParam String orderId,
                         @RequestParam boolean payed) {
        OrderBean orderBean = new OrderBean();
//        orderBean.setCourse_id(course_id);
        orderBean.setName(name);
        orderBean.setAge(age);
        orderBean.setSex(sex);
//        orderBean.setBorn(born);
        orderBean.setSchool(school);
        orderBean.setGrade(grade);
        orderBean.setHobby(hobby);
        orderBean.setPhone(phone);
        orderBean.setAddress(address);
        orderBean.setFather_name(father_name);
        orderBean.setFather_phone(father_phone);
        orderBean.setMother_name(mother_name);
        orderBean.setMother_phone(mother_phone);
        orderBean.setOpenId(openId);
        orderBean.setCost(cost);
        orderBean.setOrderId(orderId);
        orderBean.setPayed(payed);
        boolean b = new OrderDaoImpl().insertOrder(orderBean);
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, b, responseEntity);
    }
}
