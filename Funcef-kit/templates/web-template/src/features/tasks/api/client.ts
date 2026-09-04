import { api } from '@/core/api';
import { endpoints } from './endpoints';
import type { CreateTaskData, Task } from '../types';

export const tasksApi = {
  getAll: () => api.get<Task[]>(endpoints.list()),

  create: (data: CreateTaskData) =>
    api.post<Task, CreateTaskData>(endpoints.create(), data),
};
