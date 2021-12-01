<template>
  <div class="app-container">
    <el-skeleton :rows="16" :loading="loading" animated>
      <el-form ref="form" :model="form">
        <el-tabs v-model="activeName" type="border-card">
          <el-tab-pane label="基本信息" name="basic">
            <el-descriptions :column="2" border>
              <el-descriptions-item label="照片">
                <el-image style="width: 100px; height: 100px" :src="baseUrl + form.picture"
                          :preview-src-list="[baseUrl + form.picture]"/>
              </el-descriptions-item>
              <el-descriptions-item label="姓名">{{ form.studentName }}</el-descriptions-item>
              <el-descriptions-item label="性别">
                <dict-tag :options="dict.type.sys_user_sex" :value="form.sex"/>
              </el-descriptions-item>
              <el-descriptions-item label="学号">{{ form.studentId }}</el-descriptions-item>
              <el-descriptions-item label="院系">{{ form.schoolName }}</el-descriptions-item>
              <el-descriptions-item label="班级">{{ form.className }}</el-descriptions-item>
              <el-descriptions-item label="联系电话">{{ form.phone }}</el-descriptions-item>
              <el-descriptions-item label="民族">{{ form.nation }}</el-descriptions-item>
              <el-descriptions-item label="出生日期">{{ form.birthday }}</el-descriptions-item>
              <el-descriptions-item label="生源地">{{ form.origin }}</el-descriptions-item>
              <el-descriptions-item label="籍贯">{{ form.nativePlace }}</el-descriptions-item>
              <el-descriptions-item label="户口所在地">{{ form.householdPlace }}</el-descriptions-item>
              <el-descriptions-item label="户口性质">
                <dict-tag :options="dict.type.household_type" :value="form.householdType"/>
              </el-descriptions-item>
              <el-descriptions-item label="家庭住址">{{ form.address }}</el-descriptions-item>
              <el-descriptions-item label="是否独生子女">
                <dict-tag :options="dict.type.sys_yes_no" :value="form.onlyChild"/>
              </el-descriptions-item>
              <el-descriptions-item label="证件类型">
                <dict-tag :options="dict.type.identity_type" :value="form.identityType"/>
              </el-descriptions-item>
              <el-descriptions-item label="证件号">{{ form.identityNum }}</el-descriptions-item>
              <el-descriptions-item label="政治面貌">
                <dict-tag :options="dict.type.political_status" :value="form.politicalStatus"/>
              </el-descriptions-item>
              <el-descriptions-item label="毕业去向">{{ form.graduation }}</el-descriptions-item>
            </el-descriptions>
          </el-tab-pane>
          <el-tab-pane label="学籍信息" name="edu">
            <el-descriptions :column="1" border>
              <el-descriptions-item label="学生类型">
                <dict-tag :options="dict.type.student_type" :value="form.studentType"/>
              </el-descriptions-item>
              <el-descriptions-item label="学籍状态">
                <dict-tag :options="dict.type.student_status" :value="form.studentStatus"/>
              </el-descriptions-item>
              <el-descriptions-item label="培养方式">
                <dict-tag :options="dict.type.train" :value="form.train"/>
              </el-descriptions-item>
              <el-descriptions-item label="学制">{{ form.eduSystem }}</el-descriptions-item>
              <el-descriptions-item label="入学时间">{{ form.enrollmentDate }}</el-descriptions-item>
              <el-descriptions-item label="预计毕业时间">{{ form.expectedGradate }}</el-descriptions-item>
              <el-descriptions-item label="实际毕业时间">{{ form.actualGradate }}</el-descriptions-item>
            </el-descriptions>
          </el-tab-pane>
          <el-tab-pane label="住宿信息" name="dormitory">
            <el-descriptions :column="1" border>
              <el-descriptions-item label="宿舍校区">
                <dict-tag :options="dict.type.scms_campus" :value="form.dormitorySchool"/>
              </el-descriptions-item>
              <el-descriptions-item label="宿舍楼名称">{{ form.dormitoryName }}</el-descriptions-item>
              <el-descriptions-item label="宿舍门牌号">{{ form.dormitoryNum }}</el-descriptions-item>
              <el-descriptions-item label="宿舍类型">{{ form.dormitoryType }}</el-descriptions-item>
              <el-descriptions-item label="宿舍成员">{{ form.dormitoryMember }}</el-descriptions-item>
            </el-descriptions>
          </el-tab-pane>
        </el-tabs>
      </el-form>
    </el-skeleton>
  </div>
</template>

<script>
import {getPersonal, listStudent} from "@/api/system/student";
import {CodeToText, provinceAndCityData} from 'element-china-area-data';

export default {
  name: "StudentPersonal",
  dicts: ['sys_user_sex', 'household_type', 'sys_yes_no', 'identity_type', 'political_status', 'student_type', 'student_status', 'train', 'scms_campus'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 个人信息管理表格数据
      studentList: [],
      // 地域选项
      areaOptions: provinceAndCityData,
      // 是否显示弹出层
      open: false,
      // tab 默认页
      activeName: 'basic',
      baseUrl: process.env.VUE_APP_BASE_API,
      // 表单参数
      form: {},
    };
  },
  created() {
    this.getList();
    this.getDetail();
    this.getClassList();
  },
  methods: {
    /** 查询个人信息管理列表 */
    getList() {
      listStudent(this.queryParams).then(response => {
        this.studentList = response.rows;
      });
    },
    toStudentName(value) {
      if (value.length) {
        value.forEach((item, index, array) => {
          array[index] = item + ' ' + this.studentList.find(element => {
            return element.studentId === item
          }).studentName
        })
        return value.join('、')
      }
      return ''
    },
    // 下一个
    nextTab() {
      if (this.activeName === 'basic') {
        this.activeName = 'edu'
      } else if (this.activeName === 'edu') {
        this.activeName = 'dormitory'
      }
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        studentId: null,
        studentName: null,
        picture: null,
        sex: 0,
        phone: null,
        classId: null,
        nation: null,
        birthday: null,
        origin: [],
        nativePlace: [],
        householdPlace: [],
        householdType: null,
        homeAddress: null,
        onlyChild: "Y",
        identityType: null,
        identityNum: null,
        politicalStatus: null,
        graduation: null,
        studentType: null,
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
        dormitoryMember: [],
      };
      this.resetForm("form");
    },
    /** 查看按钮操作 */
    getDetail() {
      this.loading = true;
      this.reset();
      getPersonal().then(response => {
        this.form = response.data;
        this.form.origin = this.form.origin !== '[]' ? CodeToText[JSON.parse(this.form.origin)[0]] + CodeToText[JSON.parse(this.form.origin)[1]] : ''
        this.form.nativePlace = this.form.nativePlace !== '[]' ? CodeToText[JSON.parse(this.form.nativePlace)[0]] + CodeToText[JSON.parse(this.form.nativePlace)[1]] : ''
        this.form.householdPlace = this.form.householdPlace !== '[]' ? CodeToText[JSON.parse(this.form.householdPlace)[0]] + CodeToText[JSON.parse(this.form.householdPlace)[1]] : ''
        this.form.dormitoryMember = this.toStudentName(JSON.parse(this.form.dormitoryMember))
        this.form.schoolName = this.form.scmsClass.school.deptName
        this.form.className = this.form.scmsClass.className
        this.loading = false
      });
    },
  }
};
</script>

<style scoped>
.el-tabs--border-card {
  box-shadow: none;
  -webkit-box-shadow: none;
}
</style>
