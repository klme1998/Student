package com.excellent.controller.common;
//Created by Xuan 2019/10/10
import com.excellent.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"username","admid","teaid","stuid"})
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String redirect()
    {
        return "login";
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "check",method = RequestMethod.POST)
    public String checkAccount(@RequestParam("userid") String id1,@RequestParam("userpass") String pass,Model model) {
    /*
      int id = Integer.valueOf(id1);
        if(id1.equals( "admin")){
            id = 000000;
            if(userService.checkAccount(id, pass) == 3){
                model.addAttribute("username","admin");
                return "redirect:admin/adminIndex";
            }
            else{
                model.addAttribute("msg","密码错误");
                //这里不加redirect，否则前端el取不到值
                return "login";
            }


        }
        */
        int id = Integer.valueOf(id1);
        if (userService.checkAccount(id, pass) == 3) {
            model.addAttribute("username",userService.getAdmNameById(id));
            model.addAttribute("admid",id);
            return "redirect:admin/adminIndex";
        }
        else  if (userService.checkAccount(id, pass) == 2){
            //id = Integer.valueOf(id1);
           // if (userService.checkAccount(id, pass) == 2) {
                model.addAttribute("username",userService.getTeaNameById(id));
                model.addAttribute("teaid",id);
                return "redirect:teacher/teacherIndex";
            }
            else if(userService.checkAccount(id, pass) == 1){
                model.addAttribute("username",userService.getStuNameById(id));
                model.addAttribute("stuid",id);
                return "redirect:student/studentIndex";
            } else{
                model.addAttribute("msg","密码错误");
                //这里不加redirect，否则前端el取不到值
                return "login";
            }
     //   }


    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }
}


