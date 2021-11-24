import request from '@/utils/request'

// 查询个人信息管理列表
export function listTeacher(query) {
  return request({
    url: '/system/teacher/list',
    method: 'get',
    params: query
  })
}

// 查询个人信息管理详细
export function getTeacher(id) {
  return request({
    url: '/system/teacher/' + id,
    method: 'get'
  })
}

// 新增个人信息管理
export function addTeacher(data) {
  return request({
    url: '/system/teacher',
    method: 'post',
    data: data
  })
}

// 修改个人信息管理
export function updateTeacher(data) {
  return request({
    url: '/system/teacher',
    method: 'put',
    data: data
  })
}

// 删除个人信息管理
export function delTeacher(id) {
  return request({
    url: '/system/teacher/' + id,
    method: 'delete'
  })
}

// 导出个人信息管理
export function exportTeacher(query) {
  return request({
    url: '/system/teacher/export',
    method: 'get',
    params: query
  })
}