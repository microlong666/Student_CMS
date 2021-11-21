<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学号" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="studentName">
        <el-input
          v-model="queryParams.studentName"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级" prop="classId">
        <el-select v-model="queryParams.classId" placeholder="请选择班级" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="学籍状态" prop="studentStatus">
        <el-select v-model="queryParams.studentStatus" placeholder="请选择学籍状态" clearable size="small">
          <el-option
            v-for="dict in dict.type.student_status"
            :key="dict.value"
            :label="dict.label"
            :value="parseInt(dict.value)"
          ></el-option>
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
          v-hasPermi="['system:student:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:student:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:student:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['system:student:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="照片" align="center" prop="picture" />
      <el-table-column label="姓名" align="center" prop="studentName" />
      <el-table-column label="学号" align="center" prop="studentId" />
      <el-table-column label="院系" align="center" prop="schoolName" />
      <el-table-column label="班级" align="center" prop="className" />
      <el-table-column label="性别" align="center" prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:student:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:student:remove']"
          >删除</el-button>
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

    <!-- 添加或修改个人信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="680px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-tabs v-model="activeName" type="border-card">
          <el-tab-pane label="基本信息" name="basic">
            <el-form-item label="照片">
              <imageUpload v-model="form.picture"/>
            </el-form-item>
            <el-row>
              <el-col :span="12">
                <el-form-item label="姓名" prop="studentName">
                  <el-input v-model="form.studentName" placeholder="请输入姓名" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="性别">
                  <el-radio-group v-model="form.sex">
                    <el-radio
                      v-for="dict in dict.type.sys_user_sex"
                      :key="dict.value"
                      :label="parseInt(dict.value)"
                    >{{dict.label}}</el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="学号" prop="studentId">
                  <el-input v-model="form.studentId" placeholder="请输入学号" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="班级" prop="classId">
                  <el-select v-model="form.classId" placeholder="请选择班级" style="width: 100%">
                    <el-option label="请选择字典生成" value="" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="联系电话" prop="phone">
                  <el-input v-model="form.phone" placeholder="请输入联系电话" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="民族" prop="nation">
                  <el-input v-model="form.nation" placeholder="请输入民族" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="出生日期" prop="birthday">
                  <el-date-picker clearable
                                  style="width: 100%"
                                  v-model="form.birthday"
                                  type="date"
                                  value-format="yyyy-MM-dd"
                                  placeholder="选择出生日期">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="生源地" prop="origin">
                  <el-input v-model="form.origin" placeholder="请输入生源地" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="籍贯" prop="nativePlace">
                  <el-input v-model="form.nativePlace" placeholder="请输入籍贯" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="户口所在地" prop="householdPlace">
                  <el-input v-model="form.householdPlace" placeholder="请输入户口所在地" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="户口性质" prop="householdType">
                  <el-select v-model="form.householdType" placeholder="请选择户口性质" style="width: 100%">
                    <el-option
                      v-for="dict in dict.type.household_type"
                      :key="dict.value"
                      :label="dict.label"
                      :value="parseInt(dict.value)"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="家庭住址" prop="homeAddress">
                  <el-input v-model="form.homeAddress" placeholder="请输入家庭住址" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="是否独生子女">
                  <el-radio-group v-model="form.onlyChild">
                    <el-radio
                      v-for="dict in dict.type.sys_yes_no"
                      :key="dict.value"
                      :label="dict.value"
                    >{{dict.label}}</el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="身份证类型" prop="identityType">
                  <el-select v-model="form.identityType" placeholder="请选择身份证类型" style="width: 100%">
                    <el-option
                      v-for="dict in dict.type.identity_type"
                      :key="dict.value"
                      :label="dict.label"
                      :value="parseInt(dict.value)"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="身份证号" prop="identityNum">
                  <el-input v-model="form.identityNum" placeholder="请输入身份证号" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="政治面貌" prop="politicalStatus">
                  <el-select v-model="form.politicalStatus" placeholder="请选择政治面貌" style="width: 100%">
                    <el-option
                      v-for="dict in dict.type.political_status"
                      :key="dict.value"
                      :label="dict.label"
                      :value="parseInt(dict.value)"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="毕业去向" prop="graduation">
                  <el-input v-model="form.graduation" placeholder="请输入毕业去向" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-tab-pane>
          <el-tab-pane label="学籍信息" name="edu">
            <el-form-item label="学籍状态" prop="studentStatus">
              <el-select v-model="form.studentStatus" placeholder="请选择学籍状态" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.student_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="培养方式" prop="train">
              <el-select v-model="form.train" placeholder="请选择培养方式" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.train"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="学制" prop="eduSystem">
              <el-input v-model="form.eduSystem" placeholder="请输入学制" />
            </el-form-item>
            <el-form-item label="入学时间" prop="enrollmentDate">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.enrollmentDate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择入学时间">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="预计毕业时间" prop="expectedGradate">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.expectedGradate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择预计毕业时间">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="实际毕业时间" prop="actualGradate">
              <el-date-picker clearable
                              style="width: 100%"
                              v-model="form.actualGradate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择实际毕业时间">
              </el-date-picker>
            </el-form-item>
          </el-tab-pane>
          <el-tab-pane label="住宿信息" name="dormitory">
            <el-form-item label="宿舍校区" prop="dormitorySchool">
              <el-select v-model="form.dormitorySchool" placeholder="请选择宿舍校区" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.scms_campus"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="宿舍楼名称" prop="dormitoryName">
              <el-input v-model="form.dormitoryName" placeholder="请输入宿舍楼名称" />
            </el-form-item>
            <el-form-item label="宿舍门牌号" prop="dormitoryNum">
              <el-input v-model="form.dormitoryNum" placeholder="请输入宿舍门牌号" />
            </el-form-item>
            <el-form-item label="宿舍类型" prop="dormitoryType">
              <el-input v-model="form.dormitoryType" placeholder="请输入宿舍类型" />
            </el-form-item>
            <el-form-item label="宿舍成员" prop="dormitoryMember">
              <el-select v-model="form.dormitoryMember" placeholder="请选择宿舍成员" style="width: 100%">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-tab-pane>
        </el-tabs>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="nextTab" v-if="activeName !== 'dormitory'">下一页</el-button>
        <el-button type="primary" @click="submitForm" v-if="activeName === 'dormitory'">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listStudent, getStudent, delStudent, addStudent, updateStudent, exportStudent } from "@/api/system/student";

export default {
  name: "Student",
  dicts: ['sys_user_sex', 'household_type', 'sys_yes_no', 'identity_type', 'political_status', 'student_status', 'train', 'scms_campus'],
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
      // 个人信息管理表格数据
      studentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // tab 默认页
      activeName: 'basic',
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        studentName: null,
        classId: null,
        studentStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        studentName: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
        studentId: [
          { required: true, message: "学号不能为空", trigger: "blur" }
        ],
        classId: [
          { required: true, message: "班级不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询个人信息管理列表 */
    getList() {
      this.loading = true;
      listStudent(this.queryParams).then(response => {
        this.studentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 下一个
    nextTab() {
      if (this.activeName === 'basic') {
        this.activeName = 'edu'
      } else if (this.activeName === 'edu') {
        this.activeName = 'dormitory'
      }
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
        studentId: null,
        studentName: null,
        picture: null,
        sex: 0,
        phone: null,
        classId: null,
        nation: null,
        birthday: null,
        origin: null,
        nativePlace: null,
        householdPlace: null,
        householdType: null,
        homeAddress: null,
        onlyChild: "0",
        identityType: null,
        identityNum: null,
        politicalStatus: null,
        graduation: null,
        studentStatus: null,
        train: null,
        eduSystem: null,
        enrollmentDate: null,
        expectedGradate: null,
        actualGradate: null,
        dormitorySchool: null,
        dormitoryName: null,
        dormitoryNum: null,
        dormitoryType: null,
        dormitoryMember: null,
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加学生信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getStudent(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改学生信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateStudent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStudent(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除学生编号为"' + ids + '"的数据项？').then(function() {
        return delStudent(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有学生信息数据项？').then(() => {
        this.exportLoading = true;
        return exportStudent(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>

<style scoped>
/deep/ .el-dialog__body {
  padding: 0;
}

.el-tabs--border-card {
  box-shadow: none;
  -webkit-box-shadow: none;
}

/deep/ .el-tabs__content {
  height: 500px;
  overflow: auto;
}

/deep/ .el-dialog__footer {
  padding: 10px 20px;
}
</style>
