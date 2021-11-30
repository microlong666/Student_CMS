package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ScmsLesson;
import com.ruoyi.system.mapper.ScmsLessonMapper;
import com.ruoyi.system.service.IScmsLessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 课程Service业务层处理
 *
 * @author microloong
 * @date 2021-11-25
 */
@Service
public class ScmsLessonServiceImpl implements IScmsLessonService {

    @Autowired
    private ScmsLessonMapper scmsLessonMapper;

    /**
     * 查询课程
     *
     * @param id 课程主键
     * @return 课程
     */
    @Override
    public ScmsLesson selectScmsLessonById(Long id) {
        return scmsLessonMapper.selectScmsLessonById(id);
    }

    /**
     * 查询课程列表
     *
     * @param scmsLesson 课程
     * @return 课程
     */
    @Override
    public List<ScmsLesson> selectScmsLessonList(ScmsLesson scmsLesson) {
        return scmsLessonMapper.selectScmsLessonList(scmsLesson);
    }

    /**
     * 新增课程
     *
     * @param scmsLesson 课程
     * @return 结果
     */
    @Override
    public int insertScmsLesson(ScmsLesson scmsLesson) {
        scmsLesson.setCreateTime(DateUtils.getNowDate());
        return scmsLessonMapper.insertScmsLesson(scmsLesson);
    }

    /**
     * 修改课程
     *
     * @param scmsLesson 课程
     * @return 结果
     */
    @Override
    public int updateScmsLesson(ScmsLesson scmsLesson) {
        scmsLesson.setUpdateTime(DateUtils.getNowDate());
        return scmsLessonMapper.updateScmsLesson(scmsLesson);
    }

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的课程主键
     * @return 结果
     */
    @Override
    public int deleteScmsLessonByIds(Long[] ids) {
        return scmsLessonMapper.deleteScmsLessonByIds(ids);
    }

    /**
     * 删除课程信息
     *
     * @param id 课程主键
     * @return 结果
     */
    @Override
    public int deleteScmsLessonById(Long id) {
        return scmsLessonMapper.deleteScmsLessonById(id);
    }
}
