package com.ruoyi.system.service;

import com.ruoyi.system.domain.ScmsClassLesson;

import java.util.List;

/**
 * 班级课程Service接口
 *
 * @author microloong
 * @date 2021-11-28
 */
public interface IScmsClassLessonService {

    /**
     * 查询班级课程
     *
     * @param classId 班级课程主键
     * @return 班级课程
     */
    List<ScmsClassLesson> selectScmsClassLessonByClassId(Long classId);

    /**
     * 查询班级课程列表
     *
     * @param scmsClassLesson 班级课程
     * @return 班级课程集合
     */
    List<ScmsClassLesson> selectScmsClassLessonListByStudent(ScmsClassLesson scmsClassLesson);

    /**
     * 查询班级课程列表
     *
     * @param scmsClassLesson 班级课程
     * @return 班级课程集合
     */
    List<ScmsClassLesson> selectScmsClassLessonListByTeacher(ScmsClassLesson scmsClassLesson);

    /**
     * 新增班级课程
     *
     * @param classLessonList 班级课程
     * @return 结果
     */
    int insertScmsClassLesson(List<ScmsClassLesson> classLessonList);

    /**
     * 批量删除班级课程
     *
     * @param classIds 需要删除的班级课程主键集合
     * @return 结果
     */
    int deleteScmsClassLessonByClassIds(Long[] classIds);

    /**
     * 删除班级课程信息
     *
     * @param classId 班级课程主键
     * @return 结果
     */
    int deleteScmsClassLessonByClassId(Long classId);
}
