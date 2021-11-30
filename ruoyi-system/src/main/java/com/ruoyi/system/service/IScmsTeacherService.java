package com.ruoyi.system.service;

import com.ruoyi.system.domain.ScmsTeacher;

import java.util.List;

/**
 * 教师管理Service接口
 *
 * @author microloong
 * @date 2021-11-23
 */
public interface IScmsTeacherService {

    /**
     * 查询教师信息
     *
     * @param id 教师信息主键
     * @return 教师信息
     */
    ScmsTeacher selectScmsTeacherById(Long id);

    /**
     * 查询教师信息列表
     *
     * @param scmsTeacher 教师信息
     * @return 教师信息集合
     */
    List<ScmsTeacher> selectScmsTeacherList(ScmsTeacher scmsTeacher);

    /**
     * 新增教师信息
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    int insertScmsTeacher(ScmsTeacher scmsTeacher);

    /**
     * 修改教师信息
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    int updateScmsTeacher(ScmsTeacher scmsTeacher);

    /**
     * 批量删除教师信息
     *
     * @param ids 需要删除的教师信息主键集合
     * @return 结果
     */
    int deleteScmsTeacherByIds(Long[] ids);

    /**
     * 删除教师信息信息
     *
     * @param id 教师信息主键
     * @return 结果
     */
    int deleteScmsTeacherById(Long id);

    /**
     * 校验工号是否唯一
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    Boolean checkTeacherIdUnique(ScmsTeacher scmsTeacher);

    /**
     * 校验用户编号是否唯一
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    Boolean checkUserIdUnique(ScmsTeacher scmsTeacher);
}
