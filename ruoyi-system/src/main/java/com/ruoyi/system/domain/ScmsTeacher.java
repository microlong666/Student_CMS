package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

/**
 * 教师管理对象 scms_teacher
 *
 * @author microloong
 * @date 2021-11-23
 */
public class ScmsTeacher extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @Excel(name = "编号")
    private Long id;

    /**
     * 工号
     */
    @Excel(name = "工号")
    private String teacherId;

    /**
     * 用户编号
     */
    private Long userId;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String teacherName;

    /**
     * 院系
     */
    @Excel(name = "院系")
    private Long schoolId;

    /**
     * 院系对象
     */
    @Excel(name = "院系", targetAttr = "deptName", type = Excel.Type.EXPORT)
    private SysDept school;

    /**
     * 职称
     */
    @Excel(name = "职称")
    private String title;

    /**
     * 联系电话
     */
    @Excel(name = "联系电话")
    @Size(min = 0, max = 11, message = "联系电话长度不能超过11个字符")
    private String phone;

    /**
     * 邮箱
     */
    @Excel(name = "邮箱")
    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    private String mail;

    /**
     * 删除标志
     */
    @TableLogic
    private Integer delFlag;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public SysDept getSchool() {
        return school;
    }

    public void setSchool(SysDept school) {
        this.school = school;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMail() {
        return mail;
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
                .append("teacherId", getTeacherId())
                .append("userId", getUserId())
                .append("teacherName", getTeacherName())
                .append("schoolId", getSchoolId())
                .append("school", getSchool())
                .append("title", getTitle())
                .append("phone", getPhone())
                .append("mail", getMail())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .append("remark", getRemark())
                .toString();
    }
}
