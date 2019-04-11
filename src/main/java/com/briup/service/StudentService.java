package com.briup.service; 

import java.util.List;

import com.briup.bean.Course;
import com.briup.bean.Person;
import com.briup.bean.Student;
import com.briup.bean.Teacher;
import com.briup.bean.Work;

/** 
 * @author yyj 
 * @version CreateTime：2019年3月19日 下午2:07:19 
 * 
 */
public interface StudentService {

	void addStu(Student stu);

	void addPerson(Person p);

	void deletePerson(String code);

	void addTeacher(Teacher teacher);

	void addCourse(Course course);

	void deleteCourse(String name);

	List<Work> beginExam(String name,String classes);

	void workCommit(Work work);

	List<Work> selectPoint(String classesname,String name);

	void addWork(Work w);

	List<Work> selectWork(String classesname, String name, String time);

	void deletetWork(Integer id);

	List<Work> juggWork(String coursename, String stuname, String time);

	void saveGrade(String id, String note,String grade);

	List<Work> juggWorkForclass(String coursename, String classesname,
			String time);

	List<Work> teacherSelectPoint(String coursename, String classesname);

	List<Work> teacherSelectPointone(String coursename, String classesname,String stuname);

	void addGrade(Work w);

	void updatePwd(String name, String newpwd);

}
 