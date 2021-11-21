package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.ScmsClass;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 班级管理Mapper接口
 *
 * @author microloong
 * @date 2021-11-16
 */
@Mapper
public interface ScmsClassMapper {

    /**
     * 查询班级
     *
     * @param id 班级管理主键
     * @return 班级管理
     */
    ScmsClass selectScmsClassById(Long id);

    /**
     * 查询班级列表
     *
     * @param scmsClass 班级管理
     * @return 班级管理集合
     */
    List<ScmsClass> selectScmsClassList(ScmsClass scmsClass);

    /**
     * 新增班级
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    int insertScmsClass(ScmsClass scmsClass);

    /**
     * 修改班级
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    int updateScmsClass(ScmsClass scmsClass);

    /**
     * 删除班级
     *
     * @param id 班级管理主键
     * @return 结果
     */
    int deleteScmsClassById(Long id);

    /**
     * 批量删除班级
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteScmsClassByIds(Long[] ids);
}
