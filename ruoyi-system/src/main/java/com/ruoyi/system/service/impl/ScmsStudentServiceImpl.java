package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ScmsStudent;
import com.ruoyi.system.mapper.ScmsStudentMapper;
import com.ruoyi.system.service.IScmsStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生Service业务层处理
 *
 * @author microloong
 * @date 2021-11-17
 */
@Service
public class ScmsStudentServiceImpl implements IScmsStudentService {

    @Autowired
    private ScmsStudentMapper scmsStudentMapper;

    /**
     * 查询学生
     *
     * @param id 学生主键
     * @return 学生
     */
    @Override
    public ScmsStudent selectScmsStudentById(Long id) {
        return scmsStudentMapper.selectScmsStudentById(id);
    }

    /**
     * 查询学生列表
     *
     * @param scmsStudent 学生
     * @return 学生
     */
    @Override
    public List<ScmsStudent> selectScmsStudentList(ScmsStudent scmsStudent) {
        return scmsStudentMapper.selectScmsStudentList(scmsStudent);
    }

    /**
     * 新增学生
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    @Override
    public int insertScmsStudent(ScmsStudent scmsStudent) {
        scmsStudent.setCreateTime(DateUtils.getNowDate());
        return scmsStudentMapper.insertScmsStudent(scmsStudent);
    }

    /**
     * 修改学生
     *
     * @param scmsStudent 学生
     * @return 结果
     */
    @Override
    public int updateScmsStudent(ScmsStudent scmsStudent) {
        scmsStudent.setUpdateTime(DateUtils.getNowDate());
        return scmsStudentMapper.updateScmsStudent(scmsStudent);
    }

    /**
     * 批量删除学生
     *
     * @param ids 需要删除的学生主键
     * @return 结果
     */
    @Override
    public int deleteScmsStudentByIds(Long[] ids) {
        return scmsStudentMapper.deleteScmsStudentByIds(ids);
    }

    /**
     * 删除学生信息
     *
     * @param id 学生主键
     * @return 结果
     */
    @Override
    public int deleteScmsStudentById(Long id) {
        return scmsStudentMapper.deleteScmsStudentById(id);
    }

    /**
     * 校验学号是否唯一
     *
     * @param studentId 学号
     * @return 结果
     */
    @Override
    public Boolean checkStudentIdUnique(String studentId) {
        return scmsStudentMapper.checkStudentIdUnique(studentId) <= 0;
    }

}
