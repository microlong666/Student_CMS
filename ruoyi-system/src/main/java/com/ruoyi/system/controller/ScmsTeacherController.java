package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ScmsTeacher;
import com.ruoyi.system.service.IScmsTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 教师Controller
 *
 * @author microloong
 * @date 2021-11-23
 */
@RestController
@RequestMapping("/system/teacher")
public class ScmsTeacherController extends BaseController {

    @Autowired
    private IScmsTeacherService scmsTeacherService;

    /**
     * 查询教师列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScmsTeacher scmsTeacher) {
        startPage();
        List<ScmsTeacher> list = scmsTeacherService.selectScmsTeacherList(scmsTeacher);
        return getDataTable(list);
    }

    /**
     * 导出教师列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:export')")
    @Log(title = "教师", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ScmsTeacher scmsTeacher) {
        List<ScmsTeacher> list = scmsTeacherService.selectScmsTeacherList(scmsTeacher);
        ExcelUtil<ScmsTeacher> util = new ExcelUtil<ScmsTeacher>(ScmsTeacher.class);
        return util.exportExcel(list, "教师数据");
    }

    /**
     * 获取教师详细
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(scmsTeacherService.selectScmsTeacherById(id));
    }

    /**
     * 新增教师
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:add')")
    @Log(title = "教师", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ScmsTeacher scmsTeacher) {
        if (!scmsTeacherService.checkTeacherIdUnique(scmsTeacher)) {
            return AjaxResult.error("新增教师'" + scmsTeacher.getTeacherName() + "'失败，工号已存在");
        }
        if (!scmsTeacherService.checkUserIdUnique(scmsTeacher)) {
            return AjaxResult.error("新增教师'" + scmsTeacher.getTeacherName() + "'失败，该用户已被绑定");
        }
        scmsTeacher.setCreateBy(getUsername());
        return toAjax(scmsTeacherService.insertScmsTeacher(scmsTeacher));
    }

    /**
     * 修改教师
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:edit')")
    @Log(title = "教师", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ScmsTeacher scmsTeacher) {
        if (!scmsTeacherService.checkTeacherIdUnique(scmsTeacher)) {
            return AjaxResult.error("修改教师'" + scmsTeacher.getTeacherName() + "'失败，工号已存在");
        }
        if (!scmsTeacherService.checkUserIdUnique(scmsTeacher)) {
            return AjaxResult.error("修改教师'" + scmsTeacher.getTeacherName() + "'失败，该用户已被绑定");
        }
        scmsTeacher.setUpdateBy(getUsername());
        return toAjax(scmsTeacherService.updateScmsTeacher(scmsTeacher));
    }

    /**
     * 删除教师
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:remove')")
    @Log(title = "教师", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(scmsTeacherService.deleteScmsTeacherByIds(ids));
    }
}
