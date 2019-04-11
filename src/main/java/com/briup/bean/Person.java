package com.briup.bean; 
/** 
 * @author yyj 
 * @version CreateTime：2019年3月19日 下午1:50:53 
 * 
 */
public class Person {
	
	private Integer id;//主键
	private String name;//姓名
	private String code;//编号
	private String type;//用户类型
	private String password;//密码
	private String isDelete;//是否有效
	
	public Integer getID() {
		return id;
	}
	public void setID(Integer iD) {
		id = iD;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

}
 