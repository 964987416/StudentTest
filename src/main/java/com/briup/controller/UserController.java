package com.briup.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Course;
import com.briup.bean.Person;
import com.briup.bean.Student;
import com.briup.bean.Teacher;
import com.briup.bean.Work;
import com.briup.service.StudentService;

/**
 * @author yyj
 * @version CreateTime：2019年3月19日 下午2:06:54
 * 
 */
@Controller
public class UserController {
	@Autowired
	private StudentService studentService;
	// 日志
	Logger log = LoggerFactory.getLogger(UserController.class);

	// 添加学生功能
	@RequestMapping(value = "/addStu", method = { RequestMethod.POST })
	public String addStu(HttpServletRequest request,
			@RequestParam("UserName") String name,
			@RequestParam("XueHao") String code,
			@RequestParam("Age") String age,
			@RequestParam("Gender") String gender,
			@RequestParam("Birthday") String birthday,
			@RequestParam("Province") String province,
			@RequestParam("City") String city,
			@RequestParam("Town") String town,
			@RequestParam("Note") String note,
			@RequestParam("Classes") String classes,
			@RequestParam("password") String password,
			@RequestParam("coursecode") String coursecode) {

		String address = province + "-" + city + "-" + town;
		Student stu = new Student();
		stu.setName(name);
		stu.setCode(code);
		stu.setAge(age);
		stu.setCourseCode(coursecode);
		stu.setGender(gender);
		stu.setBirthday(birthday);
		stu.setNote(note);
		stu.setClassname(classes);
		stu.setAddress(address);
		stu.setIsDelete("1");// 1表示有效
		System.out.println(password);
		studentService.addStu(stu);

		// 添加学生信息到person表
		Person p = new Person();
		p.setCode(code);
		p.setIsDelete("1");
		p.setName(name);
		p.setPassword(password);
		p.setType("1");// 类型学生;

		studentService.addPerson(p);

		return "adminindex";

	}

	// 删除学生功能
	@RequestMapping(value = "/deleteStu", method = { RequestMethod.GET })
	public String deleteStu(HttpServletRequest request,
			@RequestParam("code") String code) {

		studentService.deletePerson(code);

		return "adminindex";

	}

	// 添加教师功能
	@RequestMapping(value = "/addTeacher", method = { RequestMethod.POST })
	public String addTeacher(HttpServletRequest request,
			@RequestParam("TeacherName") String name,
			@RequestParam("code") String code, @RequestParam("Age") String age,
			@RequestParam("Gender") String gender,
			@RequestParam("course") String course,
			@RequestParam("password") String password,
			@RequestParam("classname") String classname) {

		Teacher teacher = new Teacher();
		teacher.setName(name);
		teacher.setCode(code);
		teacher.setAge(age);
		teacher.setCourse(course);
		teacher.setClassname(classname);
		teacher.setGender(gender);
		teacher.setIsDelete("1");// 1表示有效
		System.out.println(password);
		studentService.addTeacher(teacher);

		// 添加教师信息到person表
		Person p = new Person();
		p.setCode(code);
		p.setIsDelete("1");
		p.setName(name);
		p.setPassword(password);
		p.setType("2");// 类型教师;

		studentService.addPerson(p);

		return "adminindex";

	}

	// 删除教师功能
	@RequestMapping(value = "/deleteTeacher", method = { RequestMethod.GET })
	public String deleteTeacher(HttpServletRequest request,
			@RequestParam("code") String code) {

		studentService.deletePerson(code);

		return "adminindex";

	}

	// 添加课程功能
	@RequestMapping(value = "/addCourse", method = { RequestMethod.POST })
	public String addCourse(HttpServletRequest request,
			@RequestParam("CourseName") String name,
			@RequestParam("CourseCode") String code,
			@RequestParam("TeacherCode") String teachercode,
			@RequestParam("time") String time) {

		Course course = new Course();
		course.setCode(code);
		course.setName(name);
		course.setTeachercode(teachercode);
		course.setTime(time);
		course.setIsDelete("1");// 1表示有效
		studentService.addCourse(course);
		log.info("课程插入成功");
		return "adminindex";
	}

	// 删除课程
	@RequestMapping(value = "/deleteCourse", method = { RequestMethod.GET })
	public String deleteCourse(HttpServletRequest request,
			@RequestParam("name") String name) {

		studentService.deleteCourse(name);

		return "adminindex";

	}

	// 开始答题
	@RequestMapping(value = "/beginExam", method = { RequestMethod.GET })
	public String beginExam(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("username") String classes) {
		List<Work> questionList = new ArrayList<Work>();
		//通过学生科目班级来查作业
		questionList = studentService.beginExam(name, classes);

		request.setAttribute("questionList", questionList);

		return "beginTest";

	}

	// 回答问题
	@RequestMapping(value = "/workCommit", method = { RequestMethod.POST })
	public String workCommit(HttpServletRequest request,
			@RequestParam("answer") String answer, @RequestParam("id") String id,@RequestParam("name") String name) {
		try {
			// 如果题目大于一个
			if (id.length() >= 2) {
				String[] ids = id.split(",");// 将id字符串 分割为数组
				String[] answers = answer.split(",");// 将answer字符分割为字符
				for (int i = 0; i < ids.length; i++) {
					Integer Id = Integer.valueOf(ids[i]);
					Work work = new Work();
					work.setAnswer(answers[i]);
					work.setId(Id);
					work.setStuname(name);
					studentService.workCommit(work);

				}

			} else {
				Integer Id = Integer.valueOf(id);
				Work work = new Work();
				work.setAnswer(answer);
				work.setId(Id);
				work.setStuname(name);
				studentService.workCommit(work);
			}
		} catch (Exception e) {

		}

		return "studentindex";

	}

	// 查询分数
	@RequestMapping(value = "/selectPoint", method = { RequestMethod.GET })
	public String selectPoint(HttpServletRequest request,
			@RequestParam("classesname") String classesname,
			@RequestParam("name") String name) {
		try {
			List<Work> questionList = new ArrayList<Work>();
			questionList = studentService.selectPoint(classesname, name);
			request.setAttribute("questionList", questionList);

		} catch (Exception e) {

		}

		return "SelectPoint";

	}

	// 教师添加作业
	@RequestMapping(value = "/addWork", method = { RequestMethod.GET })
	public String addWork(HttpServletRequest request,
			@RequestParam("CourseName") String CourseName,
			@RequestParam("ClassesName") String ClassesName,
			@RequestParam("qusetion") String qusetion,
			@RequestParam("teacherName") String teacherName,
			@RequestParam("time") String time) {
		try {
			Work w = new Work();
			w.setCoursename(CourseName);
			w.setClassesname(ClassesName);
			w.setQuestion(qusetion);
			w.setTeachername(teacherName);
			w.setTime(time);
			studentService.addWork(w);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "ManageWork";

	}

	// 教师查询已布置的作业
	@RequestMapping(value = "/selectWork", method = { RequestMethod.GET })
	public String selectWork(HttpServletRequest request,
			@RequestParam("classesname") String classesname,
			@RequestParam("name") String teachername,
			@RequestParam("time") String time) {
		try {
			List<Work> questionList = new ArrayList<Work>();
			questionList = studentService.selectWork(classesname, teachername,
					time);
			for (Work work : questionList) {
				System.out.println(work);
			}
			request.setAttribute("questionList", questionList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "ManageWork1";

	}

	// 删除作业
	@RequestMapping(value = "/deleteWork", method = { RequestMethod.GET })
	public String deleteWork(HttpServletRequest request,
			@RequestParam("id") String id) {
		try {
			Integer Id = Integer.valueOf(id);
			studentService.deletetWork(Id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageWork";
	}

	// 教师查询要批改的作业 通过学生姓名 班级名称 时间
	@RequestMapping(value = "/juggWorkForPerson", method = { RequestMethod.GET })
	public String juggWorkForPerson(HttpServletRequest request,
			@RequestParam("coursename") String coursename,
			@RequestParam("stuname") String stuname,
			@RequestParam("time") String time) {
		try {
			// 通过学生姓名 班级名称 时间 来查询作业
			List<Work> questionList = new ArrayList<Work>();
			questionList = studentService.juggWork(coursename, stuname, time);
			for (Work work : questionList) {
				System.out.println(work);
			}
			request.setAttribute("questionList", questionList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "JuggWork";

	}

	// 教师保存成绩
	@RequestMapping(value = "/saveGrade", method = { RequestMethod.POST })
	public String saveGrade(HttpServletRequest request,
			@RequestParam("id") String id, @RequestParam("note") String note,@RequestParam("grade") String grade) {
		try {
			String [] ids = id.split(","); //id
			String [] notes = note.split(",");//评语
			String [] grades = grade.split(",");//分数
			//分别将每个人的评语修改至数据库
			for (int i = 0; i < ids.length; i++) {
				studentService.saveGrade(ids[i], notes[i],grades[i]);
			}

		} catch (Exception e) {
			
		}
		return "JuggWork";
	}
	//教师查询班级作业 班级 课程 时间
	@RequestMapping(value = "/juggWorkForclass", method = { RequestMethod.GET })
	public String juggWorkForclass(HttpServletRequest request,
			@RequestParam("coursename") String coursename,
			@RequestParam("classesname") String classesname,
			@RequestParam("time") String time) {
		try {
			// 通过学生姓名 班级名称 时间 来查询作业
			List<Work> questionList = new ArrayList<Work>();
			questionList = studentService.juggWorkForclass(coursename, classesname, time);
			for (Work work : questionList) {
				System.out.println(work);
			}
			request.setAttribute("questionList", questionList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "JuggWork";
	}
	
	//教师查询班成绩
		@RequestMapping(value = "/teacherSelectPoint", method = { RequestMethod.GET })
		public String teacherSelectPoint(HttpServletRequest request,
				@RequestParam("coursename") String coursename,
				@RequestParam("classesname") String classesname) {
			try {
				// 通过 班级名称 课程名称 查询成绩
				List<Work> questionList = new ArrayList<Work>();
				questionList = studentService.teacherSelectPoint(coursename, classesname);
				
				request.setAttribute("questionList", questionList);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "CommitPointAndUploadWork";

		}
	//教师查询期末成绩
		@RequestMapping(value = "/teacherSelectPointone", method = { RequestMethod.GET })
		public String teacherSelectPointone(HttpServletRequest request,
				@RequestParam("coursename") String coursename,
				@RequestParam("classesname") String classesname,@RequestParam("stuname") String stuname) {
			try {
				// 通过 班级名称 课程名称 查询成绩
				List<Work> questionList = new ArrayList<Work>();
				questionList = studentService.teacherSelectPointone(coursename, classesname,stuname);
				//取平均
				Integer sum =0;
				for (Work work : questionList) {
					sum += Integer.valueOf(work.getGrade());
				}
				sum = Math.round(sum/questionList.size());
				Work w = questionList.get(0);
				w.setGrade(sum.toString());
				w.setTime(null);
				questionList.clear();
				questionList.add(w);
				request.setAttribute("questionList", questionList);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "CommitPointAndUploadWork";
		}
		// 教师保存成绩
		@RequestMapping(value = "/addGrade", method = { RequestMethod.GET })
		public String addGrade(HttpServletRequest request,
				@RequestParam("coursename") String coursename, @RequestParam("classesname") String classesname,@RequestParam("grade") String grade
				,@RequestParam("stuname") String stuname) {
			try {
				Work w = new Work();
				w.setCoursename(coursename);
				w.setClassesname(classesname);
				w.setGrade(grade);
				w.setStuname(stuname);
					studentService.addGrade(w);
			} catch (Exception e) {
				
			}
			return "CommitPointAndUploadWork";
		}
		// 学生修改密码
		@RequestMapping(value = "/updatePwd", method = { RequestMethod.GET })
		public String updatePwd(HttpServletRequest request, @RequestParam("name") String name,
				@RequestParam("newpwd") String newpwd) {
			try {
				studentService.updatePwd(name,newpwd);
				
			} catch (Exception e) {
				
			}
			return "studentindex";
		}
		
		// 教师修改密码
				@RequestMapping(value = "/updatePwdT", method = { RequestMethod.GET })
				public String updatePwdT(HttpServletRequest request, @RequestParam("name") String name,
						@RequestParam("newpwd") String newpwd) {
					try {
						studentService.updatePwd(name,newpwd);
						
					} catch (Exception e) {
						
					}
					return "teacherindex";
				}
		
}
