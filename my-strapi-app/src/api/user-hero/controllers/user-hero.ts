/**
 * user-hero controller
 */

import { factories } from '@strapi/strapi'

export default factories.createCoreController('api::user-hero.user-hero', ({ strapi }) => ({
    async find(ctx) {
      // Получаем идентификатор текущего пользователя из контекста
      const userId = ctx.state?.user?.id || undefined;
  
      // Проверяем, есть ли идентификатор пользователя
      if (!userId) {
        return ctx.badRequest('User not authenticated');
      }
  
      // Выполняем запрос к базе данных для получения всех героев пользователя
      const heroes = await strapi.db.query('api::user-hero.user-hero').findMany({
        where: {
          users_permissions_user: userId, // Фильтруем по идентификатору пользователя
        },
        populate: ['hero', 'hero.icon', 'hero.fraction'], // Если нужно, можно также загрузить связанные данные о героях
      });
  
      // Возвращаем результат
      return heroes;
    },
      async create(ctx) {
        try {
          // Получаем токен из авторизации
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
          const { hero, engraving, furniture, signature_item, rarity } = ctx.request.body.data;
    
          if (!hero || !engraving || !furniture || !signature_item || !rarity) {
            return ctx.badRequest('Missing required fields');
          }
    
          // Создаем новую запись user-hero с привязкой к пользователю
          const userHero = await strapi.db.query('api::user-hero.user-hero').create({
            data: {
              hero,  // ID героя, получаем из запроса
              engraving,
              furniture,
              signature_item,
              rarity,
              users_permissions_user: userId,  // Привязываем к текущему пользователю
            },
          });
    
          return ctx.send(userHero);
        } catch (err) {
          console.error('Error creating user-hero:', err);
          return ctx.internalServerError('An error occurred while creating user-hero');
        }
      },
    }));