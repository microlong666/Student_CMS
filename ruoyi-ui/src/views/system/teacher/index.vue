<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="工号" prop="teacherId">
        <el-input
          v-model="queryParams.teacherId"
          placeholder="请输入工号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="teachername">
        <el-input
          v-model="queryParams.teachername"
          placeholder="请输入姓名"
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:teacher:add']"
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
          v-hasPermi="['system:teacher:edit']"
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
          v-hasPermi="['system:teacher:remove']"
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
      <!--          v-hasPermi="['system:teacher:export']"-->
      <!--        >导出</el-button>-->
      <!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="teacherList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="编号" align="center" prop="id" sortable/>
      <el-table-column label="姓名" align="center" prop="teacherName"/>
      <el-table-column label="工号" align="center" prop="teacherId" sortable :show-overflow-tooltip="true"/>
      <el-table-column label="院系" align="center" prop="school.deptName" sortable :show-overflow-tooltip="true"/>
      <el-table-column label="职称" align="center" prop="title" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >查看
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:teacher:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:teacher:remove']"
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

    <!-- 查看个人信息管理对话框 -->
    <el-dialog :title="detail.title" :visible.sync="detail.open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-descriptions :column="1" border>
          <el-descriptions-item label="姓名">{{ form.teacherName }}</el-descriptions-item>
          <el-descriptions-item label="工号">{{ form.teacherId }}</el-descriptions-item>
          <el-descriptions-item label="院系">{{ form.schoolId }}</el-descriptions-item>
          <el-descriptions-item label="职称">{{ form.title }}</el-descriptions-item>
          <el-descriptions-item label="联系电话">{{ form.phone }}</el-descriptions-item>
          <el-descriptions-item label="邮箱">{{ form.mail }}</el-descriptions-item>
        </el-descriptions>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="detail.open = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改教师对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="teacherName">
          <el-input v-model="form.teacherName" placeholder="请输入姓名"/>
        </el-form-item>
        <el-form-item label="绑定用户" prop="userId">
          <el-select v-model="form.userId" placeholder="请选择用户" clearable filterable style="width: 100%">
            <el-option v-for="item in userList" :key="item.userId" :label="item.userName + ' ' + item.nickName"
                       :value="item.userId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="工号" prop="teacherId">
          <el-input v-model="form.teacherId" placeholder="请输入工号" maxlength="20" show-word-limit/>
        </el-form-item>
        <el-form-item label="院系" prop="schoolId">
          <treeselect v-model="form.schoolId" :options="deptOptions" :default-expand-level="2" :show-count="true"
                      clearable filterable
                      placeholder="请选择院系"/>
        </el-form-item>
        <el-form-item label="职称" prop="title">
          <el-input v-model="form.title" placeholder="请输入职称"/>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" maxlength="11" show-word-limit/>
        </el-form-item>
        <el-form-item label="邮箱" prop="mail">
          <el-input v-model="form.mail" placeholder="请输入邮箱" maxlength="50"/>
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
import {addTeacher, delTeacher, exportTeacher, getTeacher, listTeacher, updateTeacher} from "@/api/system/teacher";
import {listUser} from "@/api/system/user";
import {treeselect} from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Teacher",
  components: {Treeselect},
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
      // 教师表格数据
      teacherList: [],
      // 用户数据
      userList: [],
      // 部门树选项
      deptOptions: undefined,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查看对话框
      detail: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        teacherId: null,
        teacherName: null,
        schoolId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        teacherName: [
          {required: true, message: "姓名不能为空", trigger: "blur"}
        ],
        teacherId: [
          {required: true, message: "工号不能为空", trigger: "blur"}
        ],
        schoolId: [
          {required: true, message: "院系不能为空", trigger: "change"}
        ],
        userId: [
          {required: true, message: "未绑定用户", trigger: "change"}
        ],
        mail: [
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
      }
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
    this.getUserList();
    this.getTreeselect();
  },
  methods: {
    /** 查询教师列表 */
    getList() {
      this.loading = true;
      listTeacher(this.queryParams).then(response => {
        this.teacherList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询用户列表 */
    getUserList() {
      listUser().then(response => {
        this.userList = response.rows
      });
    },
    /** 查询部门下拉树结构 */
    getTreeselect() {
      treeselect().then(response => {
        this.deptOptions = response.data;
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
        userId: null,
        teacherId: null,
        teacherName: null,
        schoolId: null,
        title: null,
        phone: null,
        mail: null,
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
    /** 查看按钮操作 */
    handleDetail(row) {
      this.reset();
      const id = row.id || this.ids
      getTeacher(id).then(response => {
        this.form = response.data;
        this.form.schoolId = this.form.school.deptName
        this.detail.open = true;
        this.detail.title = "查看教师信息";
      });
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加教师";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTeacher(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教师";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTeacher(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTeacher(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除编号为"' + ids + '"的数据项？').then(function () {
        return delTeacher(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有教师数据项？').then(() => {
        this.exportLoading = true;
        return exportTeacher(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {
      });
    }
  }
};
</script>
