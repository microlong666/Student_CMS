package com.ruoyi.system.service;

import com.ruoyi.system.domain.ScmsClass;

import java.util.List;

/**
 * 班级管理Service接口
 *
 * @author microloong
 * @date 2021-11-16
 */
public interface IScmsClassService {

    /**
     * 查询班级管理
     *
     * @param id 班级管理主键
     * @return 班级管理
     */
    ScmsClass selectScmsClassById(Long id);

    /**
     * 查询班级管理列表
     *
     * @param scmsClass 班级管理
     * @return 班级管理集合
     */
    List<ScmsClass> selectScmsClassList(ScmsClass scmsClass);

    /**
     * 新增班级管理
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    int insertScmsClass(ScmsClass scmsClass);

    /**
     * 修改班级管理
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    int updateScmsClass(ScmsClass scmsClass);

    /**
     * 批量删除班级管理
     *
     * @param ids 需要删除的班级管理主键集合
     * @return 结果
     */
    int deleteScmsClassByIds(Long[] ids);

    /**
     * 删除班级管理信息
     *
     * @param id 班级管理主键
     * @return 结果
     */
    int deleteScmsClassById(Long id);
}
