package com.excellent.controller.admin;


import com.excellent.model.Student;
import com.excellent.model.Teacher;
import com.excellent.service.CourseService;
import com.excellent.service.PageService;
import com.excellent.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String studentIndex(){
        return "admin/adminIndex";
    }

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
