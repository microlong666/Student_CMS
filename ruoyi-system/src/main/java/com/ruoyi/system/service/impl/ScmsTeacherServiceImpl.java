package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ScmsTeacher;
import com.ruoyi.system.mapper.ScmsTeacherMapper;
import com.ruoyi.system.service.IScmsTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 教师信息Service业务层处理
 *
 * @author microloong
 * @date 2021-11-23
 */
@Service
public class ScmsTeacherServiceImpl implements IScmsTeacherService {

    @Autowired
    private ScmsTeacherMapper scmsTeacherMapper;

    /**
     * 查询教师信息
     *
     * @param id 教师信息主键
     * @return 教师信息
     */
    @Override
    public ScmsTeacher selectScmsTeacherById(Long id) {
        return scmsTeacherMapper.selectScmsTeacherById(id);
    }

    /**
     * 查询教师信息列表
     *
     * @param scmsTeacher 教师信息
     * @return 教师信息
     */
    @Override
    public List<ScmsTeacher> selectScmsTeacherList(ScmsTeacher scmsTeacher) {
        return scmsTeacherMapper.selectScmsTeacherList(scmsTeacher);
    }

    /**
     * 新增教师信息
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    @Override
    public int insertScmsTeacher(ScmsTeacher scmsTeacher) {
        scmsTeacher.setCreateTime(DateUtils.getNowDate());
        return scmsTeacherMapper.insertScmsTeacher(scmsTeacher);
    }

    /**
     * 修改教师信息
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    @Override
    public int updateScmsTeacher(ScmsTeacher scmsTeacher) {
        scmsTeacher.setUpdateTime(DateUtils.getNowDate());
        return scmsTeacherMapper.updateScmsTeacher(scmsTeacher);
    }

    /**
     * 批量删除教师信息
     *
     * @param ids 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteScmsTeacherByIds(Long[] ids) {
        return scmsTeacherMapper.deleteScmsTeacherByIds(ids);
    }

    /**
     * 删除教师信息信息
     *
     * @param id 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteScmsTeacherById(Long id) {
        return scmsTeacherMapper.deleteScmsTeacherById(id);
    }

    /**
     * 校验工号是否唯一
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    @Override
    public Boolean checkTeacherIdUnique(ScmsTeacher scmsTeacher) {
        return scmsTeacherMapper.checkTeacherIdUnique(scmsTeacher) <= 0;
    }

    /**
     * 校验用户编号是否唯一
     *
     * @param scmsTeacher 教师信息
     * @return 结果
     */
    @Override
    public Boolean checkUserIdUnique(ScmsTeacher scmsTeacher) {
        return scmsTeacherMapper.checkUserIdUnique(scmsTeacher) <= 0;
    }

}
