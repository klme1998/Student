package com.excellent.service.impl;

import com.excellent.dao.UserDao;
import com.excellent.model.Student;
import com.excellent.model.Teacher;
import com.excellent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public int checkAccount(int id, String pass) {
        if(id == 000000){
            if("00000000".equals(pass))
                return 3;
            else
                return 0;
        }
        else if(Integer.toString(id).charAt(4)=='1'){
            if(userDao.selectTeaById(id).getTeaPass().equals(pass))
                return 2;
            else
                return 0;
        }
        else {
            if(userDao.selectStuById(id).getStuPass().equals(pass))
                return 1;
            else
                return 0;
        }
    }

    @Override
    public String getStuNameById(int id) {
        return userDao.selectStuById(id).getStuName();
    }

    @Override
    public String getTeaNameById(int id) {
        return userDao.selectTeaById(id).getTeaName();
    }

    @Override
    public Student getStuInfoById(int id) {
        return userDao.selectStuById(id);
    }

    @Override
    public Teacher getTeaInfoById(int id) {
        return userDao.selectTeaById(id);
    }

    @Override
    public void changeStuPass(Student student) {
        userDao.updateStuPass(student);
    }

    @Override
    public void updateStudent(Student student) {
        userDao.updateStudent(student);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        userDao.updateTeacher(teacher);
    }

    @Override
    public void changeTeaPass(Teacher teacher) {
        userDao.updateTeaPass(teacher);
    }

    @Override
    public List<Teacher> queryAllTeacher() {
        return userDao.queryAllTeacher();
    }

    @Override
    public List<Student> queryAllStudent() {
        return userDao.queryAllStudent();
    }

    @Override
    public void insertStudent(Student student){
        userDao.insertStudent(student);

    }
    @Override
    public void insertTeacher(Teacher teacher){
        userDao.insertTeacher(teacher);

    }
}
