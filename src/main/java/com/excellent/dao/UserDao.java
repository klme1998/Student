package com.excellent.dao;

import com.excellent.model.Admin;
import com.excellent.model.Student;
import com.excellent.model.Teacher;

import java.util.List;

public interface UserDao {
    public Admin selectAdmById(int id);
    public Student selectStuById(int id);
    public Teacher selectTeaById(int id);
    public void updateAdmPass(Admin admin);
    public void updateAdmin(Admin admin);
    public void updateStuPass(Student student);
    public void updateStudent(Student student);
    public void updateTeaPass(Teacher teacher);
    public void updateTeacher(Teacher teacher);
    public List<Admin> queryAllAdmin();
    public List<Teacher> queryAllTeacher();
    public List<Student> queryAllStudent();
    public void insertAdmin(Admin admin);
    public void insertStudent(Student student);
    public void insertTeacher(Teacher teacher);
}
