package com.excellent.controller.admin;


import com.excellent.model.Admin;
import com.excellent.model.Student;
import com.excellent.model.Teacher;
import com.excellent.service.CourseService;
import com.excellent.service.PageService;
import com.excellent.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

@Controller
@RequestMapping("admin")
public class adminController {

    @Resource
    private UserService userService;
    @Resource
    private CourseService courseService;
    @Resource
    private PageService pageService;

    @RequestMapping("/adminIndex")
    public String adminIndex(){
        return "admin/adminIndex";
    }

    //添加------------------------------------------

    @RequestMapping("/adminList")
    public String adminList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("admList",userService.queryAllAdmin());

        return "admin/adminList";
    }

    @RequestMapping("/editAdmin")
    public String editCourse2(@Param("admid") int admid, Model model){
        model.addAttribute("admin",userService.getAdmInfoById(admid));
        return "admin/editAdmin";
    }

    @RequestMapping("/adminInfo")
    public String adminInfo(@RequestParam("admid") int admid, Model model){
        model.addAttribute("admin",userService.getAdmInfoById(admid));
        return "admin/adminInfo";
    }

    @RequestMapping("/editAdmPass")
    public String editAdmPass(){
        return "admin/editAdmPass";
    }

    @RequestMapping("/changeAdmPass")
    public String changPass(@RequestParam("prepass") String prepass, @RequestParam("nowpass") String nowpass, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("admid");
        if(userService.checkAccount(id,prepass)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return "admin/editAdmPass";
        }
        else{
            Admin admin=new Admin();
            admin.setAdmId(id);
            admin.setAdmPass(nowpass);
            userService.changeAdmPass(admin);
            model.addAttribute("admin",userService.getAdmInfoById(id));
            return "admin/adminInfo";
        }
    }
    @RequestMapping("/updateAdminSuccess")
    public String updateCourseSuccess2(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]);
        Admin admin = new Admin();
        admin.setAdmId(Integer.valueOf(det[0]));
        admin.setAdmName(det[1]);
        admin.setAdmPass(det[2]);
        userService.updateAdmin(admin);
        System.out.println(det[0]+" ");
        model.addAttribute("admList",userService.queryAllAdmin());
        // model.addAttribute("paging",pageService.subList(page,courseService.queryAllById((int)request.getSession().getAttribute("stuid"))));
        return "admin/adminList";
    }

    @RequestMapping("/addAdmin")
    public String addAdmin()throws UnsupportedEncodingException{
        return "admin/addAdmin";
    }

    @RequestMapping("/addAdminAction")
    public String addAdminAction(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]);
        Admin admin=new Admin();
        admin.setAdmId(Integer.valueOf(det[0]));
        admin.setAdmName(det[1]);
        admin.setAdmPass(det[2]);
        userService.insertAdmin(admin);
        model.addAttribute("admList",userService.queryAllAdmin());
        return "admin/adminList";
    }




    //分割--------------------------------------------------------------



    @RequestMapping("/studentList")
    public String studentList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("stuList",userService.queryAllStudent());

        return "admin/studentList";
    }

    @RequestMapping("/editStudent")
    public String editCourse(@Param("stuid") int stuid, Model model){
        model.addAttribute("student",userService.getStuInfoById(stuid));
        model.addAttribute("insList",courseService.queryAllIns());
        return "admin/editStudent";
    }
    @RequestMapping("/teacherList")
    public String teacherList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("teaList",userService.queryAllTeacher());

        return "admin/teacherList";
    }


    @RequestMapping("/addStudent")
    public String addStudent()throws UnsupportedEncodingException{
        return "admin/addStudent";
    }

    @RequestMapping("/addStudentAction")
    public String addStudentAction(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]+" "+det[3]+" "+det[4]);
        Student student=new Student();
        student.setStuId(Integer.valueOf(det[0]));
        student.setStuName(det[1]);
        student.setStuPass(det[2]);
        student.setInsId(Integer.valueOf(det[3]));
        student.setInsName(det[4]);
        userService.insertStudent(student);
        model.addAttribute("stuList",userService.queryAllStudent());
        return "admin/studentList";
    }

    @RequestMapping("/addTeacher")
    public String addTeacher()throws UnsupportedEncodingException{
        return "admin/addTeacher";
    }

    @RequestMapping("/addTeacherAction")
    public String addTeacherAction(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]);
        Teacher teacher=new Teacher();
        teacher.setTeaId(Integer.valueOf(det[0]));
        teacher.setTeaName(det[1]);
        teacher.setTeaPass(det[2]);
        userService.insertTeacher(teacher);
        model.addAttribute("teaList",userService.queryAllTeacher());
        return "admin/teacherList";
    }

    @RequestMapping("/editTeacher")
    public String editCourse1(@Param("teaid") int teaid, Model model){
        model.addAttribute("teacher",userService.getTeaInfoById(teaid));
        model.addAttribute("insList",courseService.queryAllIns());
        return "admin/editTeacher";
    }
    @RequestMapping("/updateStudentSuccess")
    public String updateCourseSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]+" "+det[3]);
        Student student = new Student();
        student.setStuId(Integer.valueOf(det[0]));
        student.setStuName(det[1]);
        student.setStuPass(det[2]);
        student.setInsName(det[3]);
        userService.updateStudent(student);
        model.addAttribute("stuList",userService.queryAllStudent());
       // model.addAttribute("paging",pageService.subList(page,courseService.queryAllById((int)request.getSession().getAttribute("stuid"))));
        return "admin/studentList";
    }
    @RequestMapping("/updateTeacherSuccess")
    public String updateCourseSuccess1(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]);
        Teacher teacher = new Teacher();
        teacher.setTeaId(Integer.valueOf(det[0]));
        teacher.setTeaName(det[1]);
        teacher.setTeaPass(det[2]);
        userService.updateTeacher(teacher);
        model.addAttribute("teaList",userService.queryAllTeacher());
        // model.addAttribute("paging",pageService.subList(page,courseService.queryAllById((int)request.getSession().getAttribute("stuid"))));
        return "admin/teacherList";
    }

}
