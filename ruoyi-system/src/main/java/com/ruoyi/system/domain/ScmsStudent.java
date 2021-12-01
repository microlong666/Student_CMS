package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.Size;
import java.util.Date;

/**
 * 学生管理对象 scms_student
 *
 * @author microloong
 * @date 2021-11-17
 */
public class ScmsStudent extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 学号
     */
    @Excel(name = "学号")
    private String studentId;

    /**
     * 用户编号
     */
    private Long userId;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String studentName;

    /**
     * 照片
     */
    private String picture;

    /**
     * 性别
     */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知")
    private Integer sex;

    /**
     * 联系电话
     */
    @Excel(name = "联系电话")
    @Size(min = 0, max = 11, message = "联系电话长度不能超过11个字符")
    private String phone;

    /**
     * 班级编号
     */
    @Excel(name = "班级编号")
    private Long classId;

    /**
     * 班级对象
     */
    private ScmsClass scmsClass;

    /**
     * 民族
     */
    @Excel(name = "民族")
    private String nation;

    /**
     * 出生日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /**
     * 生源地
     */
    @Excel(name = "生源地")
    private String origin;

    /**
     * 籍贯
     */
    @Excel(name = "籍贯")
    private String nativePlace;

    /**
     * 户口所在地
     */
    @Excel(name = "户口所在地")
    private String householdPlace;

    /**
     * 户口性质
     */
    @Excel(name = "户口性质", readConverterExp = "0=家庭户口,1=集体户口")
    private Integer householdType;

    /**
     * 家庭住址
     */
    @Excel(name = "家庭住址")
    private String homeAddress;

    /**
     * 是否独生子女
     */
    @Excel(name = "是否独生子女", readConverterExp = "Y=是,N=否")
    private String onlyChild;

    /**
     * 证件类型
     */
    @Excel(name = "证件类型", readConverterExp = "0=居民身份证/社保卡,1=军官证/士兵证,2=护照,3=外国人永久居留证,4=境外永久居留证,5=香港居民身份证明,6=澳门居民身份证明,7=台湾居民身份证明")
    private Integer identityType;

    /**
     * 证件号
     */
    @Excel(name = "证件号")
    private String identityNum;

    /**
     * 政治面貌
     */
    @Excel(name = "政治面貌", readConverterExp = "0=中共党员,1=中共预备党员,2=共青团员,3=民革党员,4=民盟盟员,5=民建会员,6=民进会员,7=农工党党员,8=致公党党员,9=九三学社社员,10=台盟盟员,11=无党派人士,12=群众")
    private Integer politicalStatus;

    /**
     * 毕业去向
     */
    @Excel(name = "毕业去向")
    private String graduation;

    /**
     * 学生类型
     */
    @Excel(name = "学生类型", readConverterExp = "0=本科生,1=研究生,2=博士")
    private Integer studentType;

    /**
     * 学籍状态
     */
    @Excel(name = "学籍状态", readConverterExp = "0=注册学籍,1=休学,2=退学,3=保留学籍")
    private Integer studentStatus;

    /**
     * 培养方式
     */
    @Excel(name = "培养方式", readConverterExp = "0=定向,1=非定向,2=委培,3=自筹")
    private Integer train;

    /**
     * 学制
     */
    @Excel(name = "学制")
    private String eduSystem;

    /**
     * 入学时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入学时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date enrollmentDate;

    /**
     * 预计毕业时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计毕业时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expectedGradate;

    /**
     * 实际毕业时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际毕业时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date actualGradate;

    /**
     * 宿舍校区
     */
    @Excel(name = "宿舍校区", readConverterExp = "0=江湾校区,1=仙溪校区,2=河滨校区")
    private Integer dormitorySchool;

    /**
     * 宿舍楼名称
     */
    @Excel(name = "宿舍楼名称")
    private String dormitoryName;

    /**
     * 宿舍门牌号
     */
    @Excel(name = "宿舍门牌号")
    private String dormitoryNum;

    /**
     * 宿舍类型
     */
    @Excel(name = "宿舍类型")
    private String dormitoryType;

    /**
     * 宿舍成员
     */
    @Excel(name = "宿舍成员")
    private String dormitoryMember;

    /**
     * 删除标注
     */
    @TableLogic
    private Integer delFlag;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPicture() {
        return picture;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getSex() {
        return sex;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getClassId() {
        return classId;
    }

    public ScmsClass getScmsClass() {
        return scmsClass;
    }

    public void setScmsClass(ScmsClass scmsClass) {
        this.scmsClass = scmsClass;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNation() {
        return nation;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getOrigin() {
        return origin;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setHouseholdPlace(String householdPlace) {
        this.householdPlace = householdPlace;
    }

    public String getHouseholdPlace() {
        return householdPlace;
    }

    public void setHouseholdType(Integer householdType) {
        this.householdType = householdType;
    }

    public Integer getHouseholdType() {
        return householdType;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setOnlyChild(String onlyChild) {
        this.onlyChild = onlyChild;
    }

    public String getOnlyChild() {
        return onlyChild;
    }

    public void setIdentityType(Integer identityType) {
        this.identityType = identityType;
    }

    public Integer getIdentityType() {
        return identityType;
    }

    public void setIdentityNum(String identityNum) {
        this.identityNum = identityNum;
    }

    public String getIdentityNum() {
        return identityNum;
    }

    public void setPoliticalStatus(Integer politicalStatus) {
        this.politicalStatus = politicalStatus;
    }

    public Integer getPoliticalStatus() {
        return politicalStatus;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    public String getGraduation() {
        return graduation;
    }

    public Integer getStudentType() {
        return studentType;
    }

    public void setStudentType(Integer studentType) {
        this.studentType = studentType;
    }

    public void setStudentStatus(Integer studentStatus) {
        this.studentStatus = studentStatus;
    }

    public Integer getStudentStatus() {
        return studentStatus;
    }

    public void setTrain(Integer train) {
        this.train = train;
    }

    public Integer getTrain() {
        return train;
    }

    public void setEduSystem(String eduSystem) {
        this.eduSystem = eduSystem;
    }

    public String getEduSystem() {
        return eduSystem;
    }

    public void setEnrollmentDate(Date enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public Date getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setExpectedGradate(Date expectedGradate) {
        this.expectedGradate = expectedGradate;
    }

    public Date getExpectedGradate() {
        return expectedGradate;
    }

    public void setActualGradate(Date actualGradate) {
        this.actualGradate = actualGradate;
    }

    public Date getActualGradate() {
        return actualGradate;
    }

    public void setDormitorySchool(Integer dormitorySchool) {
        this.dormitorySchool = dormitorySchool;
    }

    public Integer getDormitorySchool() {
        return dormitorySchool;
    }

    public void setDormitoryName(String dormitoryName) {
        this.dormitoryName = dormitoryName;
    }

    public String getDormitoryName() {
        return dormitoryName;
    }

    public void setDormitoryNum(String dormitoryNum) {
        this.dormitoryNum = dormitoryNum;
    }

    public String getDormitoryNum() {
        return dormitoryNum;
    }

    public void setDormitoryType(String dormitoryType) {
        this.dormitoryType = dormitoryType;
    }

    public String getDormitoryType() {
        return dormitoryType;
    }

    public void setDormitoryMember(String dormitoryMember) {
        this.dormitoryMember = dormitoryMember;
    }

    public String getDormitoryMember() {
        return dormitoryMember;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("studentId", getStudentId())
                .append("userId", getUserId())
                .append("studentName", getStudentName())
                .append("picture", getPicture())
                .append("sex", getSex())
                .append("phone", getPhone())
                .append("classId", getClassId())
                .append("nation", getNation())
                .append("birthday", getBirthday())
                .append("origin", getOrigin())
                .append("nativePlace", getNativePlace())
                .append("householdPlace", getHouseholdPlace())
                .append("householdType", getHouseholdType())
                .append("homeAddress", getHomeAddress())
                .append("onlyChild", getOnlyChild())
                .append("identityType", getIdentityType())
                .append("identityNum", getIdentityNum())
                .append("politicalStatus", getPoliticalStatus())
                .append("graduation", getGraduation())
                .append("studentType", getStudentType())
                .append("studentStatus", getStudentStatus())
                .append("train", getTrain())
                .append("eduSystem", getEduSystem())
                .append("enrollmentDate", getEnrollmentDate())
                .append("expectedGradate", getExpectedGradate())
                .append("actualGradate", getActualGradate())
                .append("dormitorySchool", getDormitorySchool())
                .append("dormitoryName", getDormitoryName())
                .append("dormitoryNum", getDormitoryNum())
                .append("dormitoryType", getDormitoryType())
                .append("dormitoryMember", getDormitoryMember())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("delFlag", getDelFlag())
                .append("remark", getRemark())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
