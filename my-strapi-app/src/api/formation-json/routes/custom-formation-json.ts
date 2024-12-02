// src/api/formation-json/routes/formation-json.js

export default {
  routes: [
  {
    method: 'GET',
    path: '/formation-json/my-formations',
    handler: 'formation-json.myFormations', // Указываем метод контроллера
    config: {
      middlewares: [],
    },
  },
]
}
