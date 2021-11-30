package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.ScmsClassLesson;
import com.ruoyi.system.mapper.ScmsClassLessonMapper;
import com.ruoyi.system.mapper.ScmsStudentMapper;
import com.ruoyi.system.service.IScmsClassLessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 班级课程Service业务层处理
 *
 * @author microloong
 * @date 2021-11-28
 */
@Service
public class ScmsClassLessonServiceImpl implements IScmsClassLessonService {

    @Autowired
    private ScmsClassLessonMapper scmsClassLessonMapper;

    @Autowired
    private ScmsStudentMapper scmsStudentMapper;

    /**
     * 查询班级课程
     *
     * @param classId 班级课程主键
     * @return 班级课程
     */
    @Override
    public List<ScmsClassLesson> selectScmsClassLessonByClassId(Long classId) {
        return scmsClassLessonMapper.selectScmsClassLessonByClassId(classId);
    }

    /**
     * 查询班级课程列表
     *
     * @param scmsClassLesson 班级课程
     * @return 班级课程
     */
    @Override
    public List<ScmsClassLesson> selectScmsClassLessonList(ScmsClassLesson scmsClassLesson) {
        // 获取当前用户id
        scmsClassLesson.setUserId(SecurityUtils.getUserId());
        return scmsClassLessonMapper.selectScmsClassLessonList(scmsClassLesson);
    }

    /**
     * 新增班级课程
     *
     * @param classLessonList 班级课程
     * @return 结果
     */
    @Override
    public int insertScmsClassLesson(List<ScmsClassLesson> classLessonList) {
        int result = 0;
        if (classLessonList.size() > 0) {
            Long classId = classLessonList.get(0).getClassId();
            scmsClassLessonMapper.deleteScmsClassLessonByClassId(classId);
            result = scmsClassLessonMapper.insertScmsClassLesson(classLessonList);
        }
        return result;
    }

    /**
     * 批量删除班级课程
     *
     * @param classIds 需要删除的班级课程主键
     * @return 结果
     */
    @Override
    public int deleteScmsClassLessonByClassIds(Long[] classIds) {
        return scmsClassLessonMapper.deleteScmsClassLessonByClassIds(classIds);
    }

    /**
     * 删除班级课程信息
     *
     * @param classId 班级课程主键
     * @return 结果
     */
    @Override
    public int deleteScmsClassLessonByClassId(Long classId) {
        return scmsClassLessonMapper.deleteScmsClassLessonByClassId(classId);
    }
}
