package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ScmsClass;
import com.ruoyi.system.service.IScmsClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 班级管理Controller
 *
 * @author microloong
 * @date 2021-11-16
 */
@RestController
@RequestMapping("/system/class")
public class ScmsClassController extends BaseController {

    @Autowired
    private IScmsClassService scmsClassService;

    /**
     * 查询班级列表
     */
    @PreAuthorize("@ss.hasPermi('system:class:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScmsClass scmsClass) {
        startPage();
        List<ScmsClass> list = scmsClassService.selectScmsClassList(scmsClass);
        return getDataTable(list);
    }

    /**
     * 导出班级列表
     */
    @PreAuthorize("@ss.hasPermi('system:class:export')")
    @Log(title = "班级管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ScmsClass scmsClass) {
        List<ScmsClass> list = scmsClassService.selectScmsClassList(scmsClass);
        ExcelUtil<ScmsClass> util = new ExcelUtil<ScmsClass>(ScmsClass.class);
        return util.exportExcel(list, "班级管理数据");
    }

    /**
     * 获取班级详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:class:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(scmsClassService.selectScmsClassById(id));
    }

    /**
     * 新增班级
     */
    @PreAuthorize("@ss.hasPermi('system:class:add')")
    @Log(title = "班级管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ScmsClass scmsClass) {
        scmsClass.setCreateBy(getUsername());
        return toAjax(scmsClassService.insertScmsClass(scmsClass));
    }

    /**
     * 修改班级
     */
    @PreAuthorize("@ss.hasPermi('system:class:edit')")
    @Log(title = "班级管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ScmsClass scmsClass) {
        scmsClass.setUpdateBy(getUsername());
        return toAjax(scmsClassService.updateScmsClass(scmsClass));
    }

    /**
     * 删除班级
     */
    @PreAuthorize("@ss.hasPermi('system:class:remove')")
    @Log(title = "班级管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(scmsClassService.deleteScmsClassByIds(ids));
    }
}
