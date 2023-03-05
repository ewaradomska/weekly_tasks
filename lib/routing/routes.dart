enum CommonRoute {
  tasks(name: 'tasks', path: '/tasks'),
  task(name: 'task', path: ':id');

  const CommonRoute({required this.name, required this.path});
  final String name, path;
}
