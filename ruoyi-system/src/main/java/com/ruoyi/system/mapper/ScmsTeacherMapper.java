package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.ScmsTeacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 教师信息Mapper接口
 *
 * @author microloong
 * @date 2021-11-23
 */
@Mapper
public interface ScmsTeacherMapper {

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
     * 删除教师信息
     *
     * @param id 教师信息主键
     * @return 结果
     */
    int deleteScmsTeacherById(Long id);

    /**
     * 批量删除教师信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteScmsTeacherByIds(Long[] ids);

    /**
     * 校验工号是否唯一
     *
     * @param teacherId 教师工号
     * @return 结果
     */
    int checkTeacherIdUnique(String teacherId);
}
