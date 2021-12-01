package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 班级课程对象 scms_class_lesson
 *
 * @author microloong
 * @date 2021-11-28
 */
public class ScmsClassLesson {

    /**
     * 班级编号
     */
    private Long classId;

    /**
     * 课程编号
     */
    private Long lessonId;

    /**
     * 学期
     */
    private Integer term;

    /**
     * 上课时间
     */
    private String lessonTime;

    /**
     * 上课地点
     */
    private String lessonPlace;

    /**
     * 课程对象
     */
    private ScmsLesson lesson;

    /**
     * 课程名称
     */
    private String lessonName;

    /**
     * 用户编号
     */
    private Long userId;

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getClassId() {
        return classId;
    }

    public void setLessonId(Long lessonId) {
        this.lessonId = lessonId;
    }

    public Long getLessonId() {
        return lessonId;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getTerm() {
        return term;
    }

    public void setLessonTime(String lessonTime) {
        this.lessonTime = lessonTime;
    }

    public String getLessonTime() {
        return lessonTime;
    }

    public void setLessonPlace(String lessonPlace) {
        this.lessonPlace = lessonPlace;
    }

    public String getLessonPlace() {
        return lessonPlace;
    }

    public ScmsLesson getLesson() {
        return lesson;
    }

    public void setLesson(ScmsLesson lesson) {
        this.lesson = lesson;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("classId", getClassId())
                .append("lessonId", getLessonId())
                .append("term", getTerm())
                .append("lessonTime", getLessonTime())
                .append("lessonPlace", getLessonPlace())
                .append("lesson", getLesson())
                .toString();
    }
}
