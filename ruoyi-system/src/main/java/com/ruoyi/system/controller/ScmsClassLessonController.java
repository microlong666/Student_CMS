package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ScmsClassLesson;
import com.ruoyi.system.service.IScmsClassLessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 班级课程Controller
 *
 * @author microloong
 * @date 2021-11-28
 */
@RestController
@RequestMapping("/system/classLesson")
public class ScmsClassLessonController extends BaseController {

    @Autowired
    private IScmsClassLessonService scmsClassLessonService;

    /**
     * 查询班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScmsClassLesson scmsClassLesson) {
        startPage();
        List<ScmsClassLesson> list = scmsClassLessonService.selectScmsClassLessonList(scmsClassLesson);
        return getDataTable(list);
    }

    /**
     * 导出班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:export')")
    @Log(title = "班级课程", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ScmsClassLesson scmsClassLesson) {
        List<ScmsClassLesson> list = scmsClassLessonService.selectScmsClassLessonList(scmsClassLesson);
        ExcelUtil<ScmsClassLesson> util = new ExcelUtil<ScmsClassLesson>(ScmsClassLesson.class);
        return util.exportExcel(list, "班级课程数据");
    }

    /**
     * 获取班级课程详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:query')")
    @GetMapping(value = "/{classId}")
    public AjaxResult getInfo(@PathVariable("classId") Long classId) {
        return AjaxResult.success(scmsClassLessonService.selectScmsClassLessonByClassId(classId));
    }

    /**
     * 新增班级课程
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:add')")
    @Log(title = "班级课程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<ScmsClassLesson> classLessonList) {
        return toAjax(scmsClassLessonService.insertScmsClassLesson(classLessonList));
    }

    /**
     * 删除班级课程
     */
    @PreAuthorize("@ss.hasPermi('system:lesson:remove')")
    @Log(title = "班级课程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{classIds}")
    public AjaxResult remove(@PathVariable Long[] classIds) {
        return toAjax(scmsClassLessonService.deleteScmsClassLessonByClassIds(classIds));
    }
}
