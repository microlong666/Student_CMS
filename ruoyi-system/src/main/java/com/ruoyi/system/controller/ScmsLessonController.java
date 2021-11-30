package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ScmsLesson;
import com.ruoyi.system.service.IScmsLessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 课程Controller
 *
 * @author microloong
 * @date 2021-11-25
 */
@RestController
@RequestMapping("/system/lesson")
public class ScmsLessonController extends BaseController {

    @Autowired
    private IScmsLessonService scmsLessonService;

    /**
     * 查询课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScmsLesson scmsLesson) {
        startPage();
        List<ScmsLesson> list = scmsLessonService.selectScmsLessonList(scmsLesson);
        return getDataTable(list);
    }

    /**
     * 导出课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:export')")
    @Log(title = "课程", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ScmsLesson scmsLesson) {
        List<ScmsLesson> list = scmsLessonService.selectScmsLessonList(scmsLesson);
        ExcelUtil<ScmsLesson> util = new ExcelUtil<>(ScmsLesson.class);
        return util.exportExcel(list, "课程数据");
    }

    /**
     * 获取课程详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(scmsLessonService.selectScmsLessonById(id));
    }

    /**
     * 新增课程
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:add')")
    @Log(title = "课程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ScmsLesson scmsLesson) {
        return toAjax(scmsLessonService.insertScmsLesson(scmsLesson));
    }

    /**
     * 修改课程
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:edit')")
    @Log(title = "课程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ScmsLesson scmsLesson) {
        return toAjax(scmsLessonService.updateScmsLesson(scmsLesson));
    }

    /**
     * 删除课程
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:remove')")
    @Log(title = "课程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(scmsLessonService.deleteScmsLessonByIds(ids));
    }
}
