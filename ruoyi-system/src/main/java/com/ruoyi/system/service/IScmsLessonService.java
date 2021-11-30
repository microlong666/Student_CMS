package com.ruoyi.system.service;

import com.ruoyi.system.domain.ScmsLesson;

import java.util.List;

/**
 * 课程Service接口
 *
 * @author microloong
 * @date 2021-11-25
 */
public interface IScmsLessonService {

    /**
     * 查询课程
     *
     * @param id 课程主键
     * @return 课程
     */
    ScmsLesson selectScmsLessonById(Long id);

    /**
     * 查询课程列表
     *
     * @param scmsLesson 课程
     * @return 课程集合
     */
    List<ScmsLesson> selectScmsLessonList(ScmsLesson scmsLesson);

    /**
     * 新增课程
     *
     * @param scmsLesson 课程
     * @return 结果
     */
    int insertScmsLesson(ScmsLesson scmsLesson);

    /**
     * 修改课程
     *
     * @param scmsLesson 课程
     * @return 结果
     */
    int updateScmsLesson(ScmsLesson scmsLesson);

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的课程主键集合
     * @return 结果
     */
    int deleteScmsLessonByIds(Long[] ids);

    /**
     * 删除课程信息
     *
     * @param id 课程主键
     * @return 结果
     */
    int deleteScmsLessonById(Long id);
}
