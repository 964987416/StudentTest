package com.briup.bean; 
/** 
 * @author yyj 
 * @version CreateTime：2019年3月20日 下午6:14:55 
 * 
 */
public class Course {
	
	private Integer Id;
	private String name;
	private String code;
	private String teachercode;
	private String isDelete;
	private String time;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTeachercode() {
		return teachercode;
	}
	public void setTeachercode(String teachercode) {
		this.teachercode = teachercode;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

}
 