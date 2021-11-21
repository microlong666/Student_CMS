package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 班级管理对象 scms_class
 *
 * @author microloong
 * @date 2021-11-16
 */
public class ScmsClass extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 院系对象
     */
    @Excel(name = "院系", targetAttr = "deptName", type = Excel.Type.EXPORT)
    private SysDept school;

    /**
     * 班级
     */
    @Excel(name = "班级")
    private String grade;

    /**
     * 年级
     */
    @Excel(name = "年级")
    private String className;

    /**
     * 专业
     */
    @Excel(name = "专业")
    private String major;

    /**
     * 院系
     */
    @Excel(name = "院系编号", type = Excel.Type.IMPORT)
    private Long schoolId;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassName() {
        return className;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMajor() {
        return major;
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

    public void setDelFlag(Long delFlag) {
        this.delFlag = delFlag;
    }

    public Long getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("grade", getGrade())
                .append("className", getClassName())
                .append("major", getMajor())
                .append("schoolId", getSchoolId())
                .append("school", getSchool())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .append("remark", getRemark())
                .toString();
    }
}
