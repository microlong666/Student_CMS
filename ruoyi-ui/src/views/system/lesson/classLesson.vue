<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="deptName"
            placeholder="请输入院系名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="deptOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            default-expand-all
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">
        <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="班级" prop="className">
            <el-input
              v-model="queryParams.className"
              placeholder="请输入班级"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="年级" prop="grade">
            <el-input
              v-model="queryParams.grade"
              placeholder="请输入年级"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="专业" prop="major">
            <el-input
              v-model="queryParams.major"
              placeholder="请输入专业"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
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
              :disabled="single"
              icon="el-icon-setting"
              size="mini"
              @click="handleArrange"
            >安排课程
            </el-button>
          </el-col>
        </el-row>

        <el-table v-loading="loading" :data="classList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center"/>
          <el-table-column label="班级" align="center" prop="className" :show-overflow-tooltip="true" sortable/>
          <el-table-column label="年级" align="center" prop="grade" width="80" :show-overflow-tooltip="true" sortable/>
          <el-table-column label="专业" align="center" prop="major" :show-overflow-tooltip="true"/>
          <el-table-column label="院系" align="center" prop="school.deptName" :show-overflow-tooltip="true"/>
          <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-setting"
                @click="handleArrange(scope.row)"
              >安排课程
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
      </el-col>
    </el-row>

    <!--课程安排对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="70%" append-to-body>
      <el-table border :data="classLessonList">
        <el-table-column label="序号" type="index" align="center" width="60"/>
        <el-table-column label="课程" align="center" prop="lessonId">
          <template slot-scope="scope">
            <el-select v-model="classLessonList[scope.$index].lessonId" placeholder="请选择课程" clearable filterable
                       style="width: 100%">
              <el-option v-for="item in lessonList" :key="item.id" :label="item.lessonName" :value="item.id"/>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="学期" align="center" prop="term">
          <template slot-scope="scope">
            <el-select v-model="classLessonList[scope.$index].term" placeholder="请选择学期" clearable filterable
                       style="width: 100%">
              <el-option v-for="dict in dict.type.term" :key="dict.value" :label="dict.label"
                         :value="parseInt(dict.value)"/>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="上课时间" align="center" prop="lessonTime">
          <template slot-scope="scope">
            <el-input v-model="classLessonList[scope.$index].lessonTime" placeholder="请输入上课时间"/>
          </template>
        </el-table-column>
        <el-table-column label="上课地点" align="center" prop="lessonPlace">
          <template slot-scope="scope">
            <el-input v-model="classLessonList[scope.$index].lessonPlace" placeholder="请输入上课地点"/>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="60" class-name="small-padding">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="removeRow(scope.$index)"
            >删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button icon="el-icon-plus" @click="addRow" style="width: 100%; border-radius: unset; margin-top: -1px">
        添加
      </el-button>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm" :disabled="!classLessonList.length">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listClass} from "@/api/system/class";
import {addClassLesson, getClassLesson} from "@/api/system/classLesson";
import {listLesson} from "@/api/system/lesson";
import {treeselect} from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Class",
  dicts: ['term'],
  components: {Treeselect},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: false,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 选中的班级
      selectedClassId: null,
      // 班级管理表格数据
      classList: [],
      // 课程数据
      lessonList: [],
      // 班级课程数据
      classLessonList: [],
      // 部门树选项
      deptOptions: undefined,
      // 部门名称
      deptName: undefined,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        className: null,
        grade: null,
        major: null,
        schoolId: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
    };
  },
  watch: {
    // 根据名称筛选部门树
    deptName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getList();
    this.getLessonList();
    this.getTreeselect();
  },
  methods: {
    /** 查询班级列表 */
    getList() {
      this.loading = true;
      if (this.queryParams.schoolId === 100) {
        this.queryParams.schoolId = undefined
      }
      listClass(this.queryParams).then(response => {
        this.classList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询课程列表 */
    getLessonList() {
      listLesson().then(response => {
        this.lessonList = response.rows;
      });
    },
    /** 查询部门下拉树结构 */
    getTreeselect() {
      treeselect().then(response => {
        this.deptOptions = response.data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.schoolId = data.id;
      this.getList();
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 安排课程按钮操作 */
    handleArrange(row) {
      this.selectedClassId = row.id
      getClassLesson(row.id).then(response => {
        this.classLessonList = response.data;
        this.open = true;
        this.title = "安排课程";
      });
    },
    /** 增行按钮 */
    addRow() {
      this.classLessonList.push({
        classId: this.selectedClassId,
        lessonId: null,
        term: null,
        lessonTime: null,
        lessonPlace: null
      })
    },
    /** 删除按钮 */
    removeRow(index) {
      this.classLessonList.splice(index, 1)
    },
    /** 提交按钮 */
    submitForm() {
      // 判空判重
      for (let i = 0; i < this.classLessonList.length; i++) {
        if (!this.classLessonList[i].lessonId || this.classLessonList[i].lessonId === '') {
          this.$message.error('课程不能为空')
          return
        }
      }
      if (this.classLessonList.length > 1) {
        for (let i = 0; i < this.classLessonList.length - 1; i++) {
          for (let j = i + 1; j < this.classLessonList.length; j++) {
            if (this.classLessonList[i].lessonId === this.classLessonList[j].lessonId) {
              this.$message.error('课程重复')
              return
            }
          }
        }
      }
      addClassLesson(this.classLessonList).then(() => {
        this.$modal.msgSuccess("新增成功");
        this.open = false;
        this.getList();
      });
    }
  }
}
</script>

<style scoped>
/deep/ .el-tabs__content {
  height: 480px;
  overflow: auto;
}
</style>
