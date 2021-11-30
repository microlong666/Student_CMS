import request from '@/utils/request'

// 查询班级课程列表
export function listClassLesson(query) {
  return request({
    url: '/system/classLesson/list',
    method: 'get',
    params: query
  })
}

// 查询班级课程详细
export function getClassLesson(classId) {
  return request({
    url: '/system/classLesson/' + classId,
    method: 'get'
  })
}

// 新增班级课程
export function addClassLesson(data) {
  return request({
    url: '/system/classLesson',
    method: 'post',
    data: data
  })
}

// 修改班级课程
export function updateClassLesson(data) {
  return request({
    url: '/system/classLesson',
    method: 'put',
    data: data
  })
}

// 删除班级课程
export function delClassLesson(classId) {
  return request({
    url: '/system/classLesson/' + classId,
    method: 'delete'
  })
}
