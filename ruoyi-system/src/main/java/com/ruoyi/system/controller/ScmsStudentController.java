package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ScmsStudent;
import com.ruoyi.system.service.IScmsStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 学生Controller
 *
 * @author microloong
 * @date 2021-11-17
 */
@RestController
@RequestMapping("/system/student")
public class ScmsStudentController extends BaseController {

    @Autowired
    private IScmsStudentService scmsStudentService;

    /**
     * 查询学生列表
     */
    @PreAuthorize("@ss.hasPermi('system:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScmsStudent scmsStudent) {
        startPage();
        List<ScmsStudent> list = scmsStudentService.selectScmsStudentList(scmsStudent);
        return getDataTable(list);
    }

    /**
     * 查询学生列表
     */
    @GetMapping(value = "/list/{lessonId}")
    public TableDataInfo listByLessonId(@PathVariable("lessonId") Long lessonId) {
        startPage();
        List<ScmsStudent> list = scmsStudentService.selectScmsStudentListByLessonId(lessonId);
        return getDataTable(list);
    }

    /**
     * 导出学生列表
     */
    @PreAuthorize("@ss.hasPermi('system:student:export')")
    @Log(title = "学生", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ScmsStudent scmsStudent) {
        List<ScmsStudent> list = scmsStudentService.selectScmsStudentList(scmsStudent);
        ExcelUtil<ScmsStudent> util = new ExcelUtil<>(ScmsStudent.class);
        return util.exportExcel(list, "学生数据");
    }

    /**
     * 获取学生详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:student:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(scmsStudentService.selectScmsStudentById(id));
    }

    /**
     * 获取学生个人详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:student:query')")
    @GetMapping("/personal")
    public AjaxResult getPersonalInfo() {
        ScmsStudent scmsStudent = scmsStudentService.getInfoByUserId(SecurityUtils.getUserId());
        if (scmsStudent == null) {
            return AjaxResult.error("访问受限");
        }
        Long id = scmsStudent.getId();
        return AjaxResult.success(scmsStudentService.selectScmsStudentById(id));
    }

    /**
     * 新增学生
     */
    @PreAuthorize("@ss.hasPermi('system:student:add')")
    @Log(title = "学生", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ScmsStudent scmsStudent) {
        if (!scmsStudentService.checkStudentIdUnique(scmsStudent)) {
            return AjaxResult.error("新增学生'" + scmsStudent.getStudentName() + "'失败，学号已存在");
        }
        if (!scmsStudentService.checkUserIdUnique(scmsStudent)) {
            return AjaxResult.error("新增学生'" + scmsStudent.getStudentName() + "'失败，该用户已被绑定");
        }
        scmsStudent.setCreateBy(getUsername());
        return toAjax(scmsStudentService.insertScmsStudent(scmsStudent));
    }

    /**
     * 修改学生
     */
    @PreAuthorize("@ss.hasPermi('system:student:edit')")
    @Log(title = "学生", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ScmsStudent scmsStudent) {
        if (!scmsStudentService.checkStudentIdUnique(scmsStudent)) {
            return AjaxResult.error("修改学生'" + scmsStudent.getStudentName() + "'失败，学号已存在");
        }
        if (!scmsStudentService.checkUserIdUnique(scmsStudent)) {
            return AjaxResult.error("修改学生'" + scmsStudent.getStudentName() + "'失败，该用户已被绑定");
        }
        scmsStudent.setUpdateBy(getUsername());
        return toAjax(scmsStudentService.updateScmsStudent(scmsStudent));
    }

    /**
     * 删除学生
     */
    @PreAuthorize("@ss.hasPermi('system:student:remove')")
    @Log(title = "学生", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(scmsStudentService.deleteScmsStudentByIds(ids));
    }
}
