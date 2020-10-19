package com.excellent.service;

import com.excellent.model.Admin;
import com.excellent.model.Student;
import com.excellent.model.Teacher;

import java.util.List;

public interface UserService {
    public int checkAccount(int id,String pass);
    public String getAdmNameById(int id);
    public String getStuNameById(int id);
    public String getTeaNameById(int id);
    public Admin getAdmInfoById(int id);
    public Student getStuInfoById(int id);
    public Teacher getTeaInfoById(int id);
    public void changeAdmPass(Admin admin);
    public void changeStuPass(Student student);
    public void changeTeaPass(Teacher teacher);
    public List<Admin> queryAllAdmin();
    public List<Teacher> queryAllTeacher();
    public List<Student> queryAllStudent();
    public void updateAdmin(Admin admin);
    public void updateStudent(Student student);
    public void updateTeacher(Teacher teacher);
    public void insertAdmin(Admin admin);
    public void insertStudent(Student student);
    public void insertTeacher(Teacher teacher);
}
