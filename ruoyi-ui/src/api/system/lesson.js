import request from '@/utils/request'

// 查询课程列表
export function listLesson(query) {
  return request({
    url: '/system/lesson/list',
    method: 'get',
    params: query
  })
}

// 查询课程详细
export function getLesson(id) {
  return request({
    url: '/system/lesson/' + id,
    method: 'get'
  })
}

// 新增课程
export function addLesson(data) {
  return request({
    url: '/system/lesson',
    method: 'post',
    data: data
  })
}

// 修改课程
export function updateLesson(data) {
  return request({
    url: '/system/lesson',
    method: 'put',
    data: data
  })
}

// 删除课程
export function delLesson(id) {
  return request({
    url: '/system/lesson/' + id,
    method: 'delete'
  })
}

// 导出课程
export function exportLesson(query) {
  return request({
    url: '/system/lesson/export',
    method: 'get',
    params: query
  })
}