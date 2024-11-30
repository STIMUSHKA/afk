export default [
  'strapi::logger',
  'strapi::errors',
  'strapi::security',
  {
    name: 'strapi::cors',
    config: {
      enabled: true,
      origin: '*', // Указывайте разрешенные домены
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], // Укажите методы, которые будут разрешены
      headers: '*', // Разрешает все заголовки
      credentials: true, // Если нужно поддерживать cookies
    },
  },
  'strapi::poweredBy',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];