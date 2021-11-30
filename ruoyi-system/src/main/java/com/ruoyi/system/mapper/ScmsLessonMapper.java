package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.ScmsLesson;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 课程Mapper接口
 *
 * @author microloong
 * @date 2021-11-25
 */
@Mapper
public interface ScmsLessonMapper {

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
     * 删除课程
     *
     * @param id 课程主键
     * @return 结果
     */
    int deleteScmsLessonById(Long id);

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteScmsLessonByIds(Long[] ids);
}
