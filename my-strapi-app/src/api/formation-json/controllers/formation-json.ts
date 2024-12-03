/**
 * formation-json controller
 */

import { factories } from '@strapi/strapi'

export default factories.createCoreController('api::formation-json.formation-json', ({ strapi }) => ({

  async create(ctx) {
    try {
      const token = ctx.request.header.authorization?.split(' ')[1];
      if (!token) {
        return ctx.badRequest('Authorization token is missing');
      }

      // Проверяем валидность токена и извлекаем user_id
      const decodedToken = await strapi.plugins['users-permissions'].services.jwt.verify(token);
      const userId = decodedToken.id;
      if (!userId) {
        return ctx.badRequest('User ID not found in token');
      }

      // Извлекаем данные из тела запроса
      const { name, formation } = ctx.request.body.data;

      if (!name || !formation ) {
        return ctx.badRequest('Missing required fields');
      }

      // Создаем новую запись formation-json.formation-json с привязкой к пользователю
      const userHero = await strapi.db.query('api::formation-json.formation-json').create({
        data: {
          name,  // ID героя, получаем из запроса
          formation,
          users_permissions_user: userId,  // Привязываем к текущему пользователю
        },
      });

      return ctx.send(userHero);
    } catch (err) {
      console.error('Error creating formation-json.formation-json:', err);
      return ctx.internalServerError('An error occurred while creating formation-json.formation-json');
    }
  },

  async myFormations(ctx) {
  
    try {
      const { authorization } = ctx.request.headers;
      if (!authorization) {
        return ctx.badRequest('Authorization token is missing');
      }
  
      const token = authorization.replace('Bearer ', '');
  
      // Декодируем токен и проверяем наличие пользователя
      const user = await strapi.plugins['users-permissions'].services.jwt.verify(token);
  
      // Используем strapi.db.query для выполнения запроса
      const formations = await strapi.db.query('api::formation-json.formation-json').findMany({
        where: {
          'users_permissions_user': user.id, // Фильтрация по ID пользователя
        },
      });
  
      return formations;
    } catch (err) {
      ctx.throw(500, 'Error fetching formations for the user');
    }
  } 
}))