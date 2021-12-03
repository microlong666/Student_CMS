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
      <el-form-item label="学期" prop="term">
        <el-select v-model="queryParams.term" placeholder="请选择学期" clearable size="small">
          <el-option
            v-for="dict in dict.type.term"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
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
          icon="el-icon-view"
          size="mini"
          :disabled="single"
          @click="handleDetail"
        >查看学生
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lessonList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="序号" type="index" align="center"/>
      <el-table-column label="课程名称" align="center" prop="lesson.lessonName" :show-overflow-tooltip="true"/>
      <el-table-column label="学期" align="center" prop="term" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.term" :value="scope.row.term"/>
        </template>
      </el-table-column>
      <el-table-column label="上课时间" align="center" prop="lessonTime" :show-overflow-tooltip="true"/>
      <el-table-column label="上课地点" align="center" prop="lessonPlace" :show-overflow-tooltip="true"/>
      <el-table-column label="学分" align="center" width="80" prop="lesson.credit"/>
      <el-table-column label="学时" align="center" width="80" prop="lesson.lessonHour"/>
      <el-table-column label="操作" align="center" width="100" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >查看学生
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
    <el-dialog :title="title" :visible.sync="open" width="60%" append-to-body>
      <el-table v-loading="dialogLoading" :data="studentList">
        <el-table-column label="序号" type="index" align="center"/>
        <el-table-column label="姓名" align="center" prop="studentName" sortable/>
        <el-table-column label="学号" align="center" prop="studentId" sortable :show-overflow-tooltip="true"/>
        <el-table-column label="院系" align="center" prop="scmsClass.school.deptName" sortable
                         :show-overflow-tooltip="true"/>
        <el-table-column label="班级" align="center" prop="scmsClass.className" sortable :show-overflow-tooltip="true"/>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="open = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listClassLessonByTeacher,} from "@/api/system/classLesson";
import {listStudentByLessonId} from "@/api/system/student";

export default {
  name: "teachList",
  dicts: ['term'],
  data() {
    return {
      // 遮罩层
      loading: true,
      dialogLoading: true,
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
      // 学生数据
      studentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        lessonName: null,
        term: null
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询课程列表 */
    getList() {
      this.loading = true;
      listClassLessonByTeacher(this.queryParams).then(response => {
        this.lessonList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
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
      this.ids = selection.map(item => item.lessonId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 修改按钮操作 */
    handleDetail(row) {
      this.dialogLoading = true;
      const lessonId = row.lesson.id || this.ids
      listStudentByLessonId(lessonId).then(response => {
        this.studentList = response.rows;
        if (!this.studentList.length) {
          this.$message.error('该课程未被安排')
          return
        }
        this.open = true;
        this.title = "查看学生";
        this.dialogLoading = false;
      });
    },
  }
};
</script>

<style scoped>
/deep/ .el-dialog__body {
  height: 480px;
  overflow: auto;
}
</style>
