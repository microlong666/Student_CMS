package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 课程对象 scms_lesson
 *
 * @author microloong
 * @date 2021-11-25
 */
public class ScmsLesson extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    private Long id;

    /**
     * 课程名称
     */
    @Excel(name = "课程名称")
    private String lessonName;

    /**
     * 课程类型
     */
    @Excel(name = "课程类型")
    private Integer lessonType;

    /**
     * 任课教师
     */
    private Long teacherId;

    /**
     * 院系对象
     */
    @Excel(name = "任课教师", targetAttr = "teacherName", type = Excel.Type.EXPORT)
    private ScmsTeacher teacher;

    /**
     * 学分
     */
    @Excel(name = "学分")
    private Double credit;

    /**
     * 学时
     */
    @Excel(name = "学时")
    private Double lessonHour;

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

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonType(Integer lessonType) {
        this.lessonType = lessonType;
    }

    public Integer getLessonType() {
        return lessonType;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public ScmsTeacher getTeacher() {
        return teacher;
    }

    public void setTeacher(ScmsTeacher teacher) {
        this.teacher = teacher;
    }

    public void setCredit(Double credit) {
        this.credit = credit;
    }

    public Double getCredit() {
        return credit;
    }

    public void setLessonHour(Double lessonHour) {
        this.lessonHour = lessonHour;
    }

    public Double getLessonHour() {
        return lessonHour;
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
                .append("lessonName", getLessonName())
                .append("lessonType", getLessonType())
                .append("teacherId", getTeacherId())
                .append("teacher", getTeacher())
                .append("credit", getCredit())
                .append("lessonHour", getLessonHour())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .append("remark", getRemark())
                .toString();
    }
}
