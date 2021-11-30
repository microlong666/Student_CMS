<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程名称" prop="lessonName">
        <el-input
          v-model="queryParams.lessonName"
          placeholder="请输入课程名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程类型" prop="lessonType">
        <el-select v-model="queryParams.lessonType" placeholder="请选择课程类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.lesson_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="任课教师" prop="teacherId">
        <el-select v-model="queryParams.teacherId" placeholder="请选择任课教师" size="small" clearable filterable
                   style="width: 100%">
          <el-option v-for="item in teacherList" :key="item.id" :label="item.teacherName" :value="item.id"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:lesson:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:lesson:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:lesson:remove']"
        >删除
        </el-button>
      </el-col>
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--          type="warning"-->
      <!--          plain-->
      <!--          icon="el-icon-download"-->
      <!--          size="mini"-->
      <!--          :loading="exportLoading"-->
      <!--          @click="handleExport"-->
      <!--          v-hasPermi="['system:lesson:export']"-->
      <!--        >导出</el-button>-->
      <!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lessonList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="编号" align="center" prop="id" sortable/>
      <el-table-column label="课程名称" align="center" prop="lessonName" :show-overflow-tooltip="true"/>
      <el-table-column label="课程类型" align="center" prop="lessonType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.lesson_type" :value="scope.row.lessonType"/>
        </template>
      </el-table-column>
      <el-table-column label="任课教师" align="center" prop="teacher.teacherName"/>
      <el-table-column label="学分" align="center" prop="credit"/>
      <el-table-column label="学时" align="center" prop="lessonHour"/>
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:lesson:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:lesson:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改课程对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="课程名称" prop="lessonName">
          <el-input v-model="form.lessonName" placeholder="请输入课程名称"/>
        </el-form-item>
        <el-form-item label="课程类型" prop="lessonType">
          <el-select v-model="form.lessonType" placeholder="请选择课程类型" clearable filterable style="width: 100%">
            <el-option
              v-for="dict in dict.type.lesson_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="任课教师" prop="teacherId">
          <el-select v-model="form.teacherId" placeholder="请选择任课教师" clearable filterable style="width: 100%">
            <el-option v-for="item in teacherList" :key="item.id" :label="item.teacherId + ' ' + item.teacherName"
                       :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item label="学分" prop="credit">
          <el-input-number v-model="form.credit" controls-position="right" placeholder="请输入学分" :min="0" :max="10"
                           :step="0.5" style="width: 100%"/>
        </el-form-item>
        <el-form-item label="学时" prop="lessonHour">
          <el-input-number v-model="form.lessonHour" controls-position="right" placeholder="请输入学时" :min="0" :max="100"
                           style="width: 100%"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {addLesson, delLesson, exportLesson, getLesson, listLesson, updateLesson} from "@/api/system/lesson";
import {listTeacher} from "@/api/system/teacher";

export default {
  name: "Lesson",
  dicts: ['lesson_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 课程表格数据
      lessonList: [],
      // 教师数据
      teacherList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        lessonName: null,
        lessonType: null,
        teacherId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        lessonName: [
          {required: true, message: "课程名称不能为空", trigger: "blur"}
        ],
        lessonType: [
          {required: true, message: "课程类型不能为空", trigger: "change"}
        ],
        teacherId: [
          {required: true, message: "班级不能为空", trigger: "change"}
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getTeacherList();
  },
  methods: {
    /** 查询课程列表 */
    getList() {
      this.loading = true;
      listLesson(this.queryParams).then(response => {
        this.lessonList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询教师列表 */
    getTeacherList() {
      listTeacher().then(response => {
        this.teacherList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        lessonName: null,
        lessonType: null,
        teacherId: null,
        credit: null,
        lessonHour: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加课程";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLesson(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改课程";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLesson(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLesson(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除课程编号为"' + ids + '"的数据项？').then(function () {
        return delLesson(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有课程数据项？').then(() => {
        this.exportLoading = true;
        return exportLesson(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {
      });
    }
  }
};
</script>
