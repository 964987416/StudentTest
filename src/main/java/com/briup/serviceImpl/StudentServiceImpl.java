package com.briup.serviceImpl; 

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.briup.bean.Course;
import com.briup.bean.Person;
import com.briup.bean.Student;
import com.briup.bean.Teacher;
import com.briup.bean.Work;
import com.briup.dao.Dao;
import com.briup.service.StudentService;


/** 
 * @author yyj 
 * @version CreateTime：2019年3月19日 下午2:07:37 
 * 
 */
@Service("StudentService")
public class StudentServiceImpl implements StudentService{
	@Resource
	private Dao dao;
	@Override
	public void addStu(Student stu) {
		dao.addStu(stu);
		
	}
	@Override
	public void addPerson(Person p) {
		dao.addPerson(p);
		
	}
	@Override
	public void deletePerson(String code) {
		dao.deletePerson(code);		
	}
	@Override
	public void addTeacher(Teacher teacher) {
		dao.addTeacher(teacher);		
		
	}
	@Override
	public void addCourse(Course course) {
		dao.addCourse(course);		
		
	}
	@Override
	public void deleteCourse(String name) {
		dao.deleteCourse(name);		
		
	}
	@Override
	public List<Work> beginExam(String name,String classes) {
		return dao.beginExam(name,classes);		
		
	}
	@Override
	public void workCommit(Work work) {
		dao.workCommit(work);			
	}
	@Override
	public List<Work> selectPoint(String classesname,String name) {
		return dao.selectPoint(classesname,name);		
	}
	@Override
	public void addWork(Work w) {
		dao.addWork(w);	
		
	}
	@Override
	public List<Work> selectWork(String classesname, String name, String time) {
		// TODO Auto-generated method stub
		return dao.selectWork(classesname,name,time);		
	}
	@Override
	public void deletetWork(Integer id) {
		dao.deletetWork(id);	
		
	}
	@Override
	public List<Work> juggWork(String coursename, String stuname, String time) {
		// TODO Auto-generated method stub
		return dao.juggWork(coursename,stuname,time);
	}
	@Override
	public void saveGrade(String id, String note,String grade) {
		dao.saveGrade(id,note,grade);		
	}
	@Override
	public List<Work> juggWorkForclass(String coursename, String classesname,
			String time) {
		// TODO Auto-generated method stub
		return dao.juggWorkForclass(coursename,classesname,time);
	}
	@Override
	public List<Work> teacherSelectPoint(String coursename, String classesname) {
		// TODO Auto-generated method stub
		return dao.teacherSelectPoint(coursename,classesname);
	}
	@Override
	public List<Work> teacherSelectPointone(String coursename,
			String classesname,String stuname) {
		// TODO Auto-generated method stub
		return  dao.teacherSelectPointone(coursename,classesname,stuname);
	}
	@Override
	public void addGrade(Work w) {
		// TODO Auto-generated method stub
		dao.addGrade(w);
	}
	@Override
	public void updatePwd(String name, String newpwd) {
		dao.updatePwd(name,newpwd);
	}
	

}
 