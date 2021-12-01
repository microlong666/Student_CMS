<template>
  <div class="app-container">
    <el-skeleton :rows="8" :loading="loading" animated>
      <el-form ref="form" :model="form">
        <el-descriptions :column="1" border>
          <el-descriptions-item label="姓名">{{ form.teacherName }}</el-descriptions-item>
          <el-descriptions-item label="工号">{{ form.teacherId }}</el-descriptions-item>
          <el-descriptions-item label="院系">{{ form.schoolId }}</el-descriptions-item>
          <el-descriptions-item label="职称">{{ form.title }}</el-descriptions-item>
          <el-descriptions-item label="联系电话">{{ form.phone }}</el-descriptions-item>
          <el-descriptions-item label="邮箱">{{ form.mail }}</el-descriptions-item>
        </el-descriptions>
      </el-form>
    </el-skeleton>
  </div>
</template>

<script>
import {getPersonal} from "@/api/system/teacher";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "TeacherPersonal",
  components: {Treeselect},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 弹出层标题
      title: "",
      // 表单参数
      form: {},
    };
  },
  created() {
    this.getDetail();
  },
  methods: {
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
    /** 查看按钮操作 */
    getDetail() {
      this.reset();
      this.loading = true
      getPersonal().then(response => {
        this.form = response.data;
        this.form.schoolId = this.form.school.deptName
        this.loading = false;
      });
    },
  }
};
</script>
