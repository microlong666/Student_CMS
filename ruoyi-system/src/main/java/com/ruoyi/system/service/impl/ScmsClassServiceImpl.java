package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ScmsClass;
import com.ruoyi.system.mapper.ScmsClassMapper;
import com.ruoyi.system.service.IScmsClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 班级管理Service业务层处理
 *
 * @author microloong
 * @date 2021-11-16
 */
@Service
public class ScmsClassServiceImpl implements IScmsClassService {

    @Autowired
    private ScmsClassMapper scmsClassMapper;

    /**
     * 查询班级管理
     *
     * @param id 班级管理主键
     * @return 班级管理
     */
    @Override
    public ScmsClass selectScmsClassById(Long id) {
        return scmsClassMapper.selectScmsClassById(id);
    }

    /**
     * 查询班级管理列表
     *
     * @param scmsClass 班级管理
     * @return 班级管理
     */
    @Override
    public List<ScmsClass> selectScmsClassList(ScmsClass scmsClass) {
        return scmsClassMapper.selectScmsClassList(scmsClass);
    }

    /**
     * 新增班级管理
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    @Override
    public int insertScmsClass(ScmsClass scmsClass) {
        scmsClass.setCreateTime(DateUtils.getNowDate());
        return scmsClassMapper.insertScmsClass(scmsClass);
    }

    /**
     * 修改班级管理
     *
     * @param scmsClass 班级管理
     * @return 结果
     */
    @Override
    public int updateScmsClass(ScmsClass scmsClass) {
        scmsClass.setUpdateTime(DateUtils.getNowDate());
        return scmsClassMapper.updateScmsClass(scmsClass);
    }

    /**
     * 批量删除班级管理
     *
     * @param ids 需要删除的班级管理主键
     * @return 结果
     */
    @Override
    public int deleteScmsClassByIds(Long[] ids) {
        return scmsClassMapper.deleteScmsClassByIds(ids);
    }

    /**
     * 删除班级管理信息
     *
     * @param id 班级管理主键
     * @return 结果
     */
    @Override
    public int deleteScmsClassById(Long id) {
        return scmsClassMapper.deleteScmsClassById(id);
    }
}
