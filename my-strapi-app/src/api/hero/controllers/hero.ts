/**
 * hero controller
 */

import { factories } from '@strapi/strapi'

export default factories.createCoreController('api::hero.hero', ({ strapi }) => ({
    async find(ctx) {
      // Получаем всех героев с их связанными фракциями
      const heroes = await strapi.db.query('api::hero.hero').findMany({
        populate: {
          fraction: true, // Указываем, что хотим получить связанные фракции
          icon: true,
        },
      });
  
      // Возвращаем результат
      return heroes;
    },
  }));
