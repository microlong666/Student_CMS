package com.ruoyi.system.service;

import com.ruoyi.system.domain.ScmsStudent;

import java.util.List;

/**
 * 学生管理Service接口
 *
 * @author microloong
 * @date 2021-11-17
 */
public interface IScmsStudentService {

    /**
     * 查询学生
     *
     * @param id 学生主键
     * @return 学生
     */
    ScmsStudent selectScmsStudentById(Long id);

    /**
     * 查询学生列表
     *
     * @param scmsStudent 学生
     * @return 学生集合
     */
    List<ScmsStudent> selectScmsStudentList(ScmsStudent scmsStudent);

    /**
     * 查询学生列表
     *
     * @param lessonId 课程编号
     * @return 学生集合
     */
    List<ScmsStudent> selectScmsStudentListByLessonId(Long lessonId);

    /**
     * 新增学生
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    int insertScmsStudent(ScmsStudent scmsStudent);

    /**
     * 修改学生
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    int updateScmsStudent(ScmsStudent scmsStudent);

    /**
     * 批量删除学生
     *
     * @param ids 需要删除的学生主键集合
     * @return 结果
     */
    int deleteScmsStudentByIds(Long[] ids);

    /**
     * 删除学生信息
     *
     * @param id 学生主键
     * @return 结果
     */
    int deleteScmsStudentById(Long id);

    /**
     * 校验学号是否唯一
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    Boolean checkStudentIdUnique(ScmsStudent scmsStudent);

    /**
     * 校验用户编号是否唯一
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    Boolean checkUserIdUnique(ScmsStudent scmsStudent);

    /**
     * 根据用户编号获取学生所在班级
     *
     * @param userId 用户编号
     * @return 结果
     */
    ScmsStudent getInfoByUserId(Long userId);
}
