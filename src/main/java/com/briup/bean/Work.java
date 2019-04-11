package com.briup.bean; 
/** 
 * @author yyj 
 * @version CreateTime：2019年3月22日 上午10:33:43 
 * 
 */
public class Work {

	private Integer id;
	private String question;
	private String answer;
	private String coursename;
	private String grade;
	private String stucode;
	private String stuname;
	private String classesname;
	private String teachername;
	private String note;
	private String type;
	private String time;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getStucode() {
		return stucode;
	}
	public void setStucode(String stucode) {
		this.stucode = stucode;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getClassesname() {
		return classesname;
	}
	public void setClassesname(String classesname) {
		this.classesname = classesname;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Work [id=" + id + ", question=" + question + ", answer="
				+ answer + ", coursename=" + coursename + ", grade=" + grade
				+ ", stucode=" + stucode + ", stuname=" + stuname
				+ ", classesname=" + classesname + ", teachername="
				+ teachername + ", note=" + note + ", type=" + type + ", time="
				+ time + "]";
	}
	
	
	
}
 