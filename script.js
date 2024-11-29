const cheerio = require('cheerio');
const fs = require('fs');

// Читаем HTML из файла
// fs.readFile('input.txt', 'utf8', (err, htmlString) => {
//     if (err) {
//         console.error('Ошибка при чтении файла:', err);
//         return;
//     }

//     // Функция для парсинга HTML и извлечения данных в JSON
//     function parseTableToJSON(html) {
//         const $ = cheerio.load(html);
//         const data = [];
//         let currentFraction = '';

//         // Ищем заголовки и таблицы
//         $('h3').each((index, element) => {
//             // Извлекаем текст заголовка
//             const headerText = $(element).find('span.mw-headline').text().trim();
//             currentFraction = headerText; // Сохраняем текущее значение fraction

//             // Находим следующую таблицу после заголовка
//             const nextTable = $(element).next('table.wikitable');
//             if (nextTable.length) {
//                 const headers = [];
//                 nextTable.find('th').each((index, thElement) => {
//                     headers.push($(thElement).text().trim());
//                 });

//                 nextTable.find('tr').each((rowIndex, rowElement) => {
//                     if (rowIndex === 0) return; // Пропускаем заголовок
//                     const rowData = { fraction: currentFraction }; // Добавляем fraction
//                     $(rowElement).find('td').each((cellIndex, cellElement) => {
//                         const cellText = $(cellElement).text().trim();
//                         rowData[headers[cellIndex]] = cellText;

//                         // Если это первая ячейка (иконка героя), извлекаем URL
//                         if (cellIndex === 1) { // Индекс 1 соответствует ячейке с иконкой
//                             const iconLink = $(cellElement).find('a').attr('href');
//                             if (iconLink) {
//                                 rowData['Icon URL'] = iconLink; // Добавляем URL иконки в объект
//                             }
//                         }
//                     });
//                     data.push(rowData);
//                 });
//             }
//         });

//         return data;
//     }

//     // Преобразуем таблицу в JSON
//     const jsonData = parseTableToJSON(htmlString);

//     // Записываем JSON в файл
//     fs.writeFile('output.json', JSON.stringify(jsonData, null, 2), (err) => {
//         if (err) {
//             console.error('Ошибка при записи в файл:', err);
//         } else {
//             console.log('Данные успешно записаны в файл output.json');
//         }
//     });
// });


const axios = require('axios');
const FormData = require('form-data');

const STRAPI_URL = 'http://127.0.0.1:1337/api/heroes'; // URL вашего Strapi
const UPLOAD_URL = 'http://127.0.0.1:1337/api/upload'; // URL для загрузки изображений

// Загрузка данных из JSON файла

const fractionMap = {
    "Lightbearers": 2,
    "Maulers": 3,
    "Wilders": 4,
    "Graveborns": 5,
    "Celestials": 6,
    "Hypogeans": 7,
    "Dimensionals": 8,
    "Dragons": 9
};

fs.readFile('output.json', 'utf8', async (err, data) => {
    if (err) {
        console.error('Ошибка при чтении файла:', err);
        return;
    }

    const heroes = JSON.parse(data);
    console.log(`Загружено ${heroes.length} героев из файла.`);

    for (const hero of heroes) {
        try {
            console.log(`Обработка героя: ${hero.Name}`);
            // Загрузка изображения в Strapi
            let iconUrl = hero['Icon URL'];
            let iconId = null;

            if (iconUrl) {
                console.log(`Загрузка изображения с URL: ${iconUrl}`);
                const response = await axios.get(iconUrl, { responseType: 'arraybuffer' });
                const imageBuffer = Buffer.from(response.data, 'binary');

                // Проверка содержимого буфера
                console.log(`Размер буфера изображения: ${imageBuffer.length} байт`);

                // Создание FormData для загрузки изображения
                const form = new FormData();
                form.append('files', imageBuffer, { filename: 'image.jpg', contentType: 'image/jpeg' });

                // Загрузка изображения в Strapi
                const uploadResponse = await axios.post(UPLOAD_URL, form, {
                    headers: {
                        ...form.getHeaders(), // Добавляем заголовки FormData
                    }
                });

                iconId = uploadResponse.data[0].id; // Получаем ID загруженного изображения
                console.log(`Изображение загружено с ID: ${iconId}`);
            }
            const fractionId = fractionMap[hero.fraction] || null;
            // Создание записи героя в Strapi
            const heroData = {
                data: {
                    name: hero.Name,
                    Awakened: false, // Установите значение по умолчанию или измените по необходимости
                    icon: iconId ? iconId : null, // Устанавливаем ID изображения
                    fraction: fractionId, // Убедитесь, что это правильный ID фракции
                    type: hero.Type,
                    Class: hero.Class
                }
            };

            const createResponse = await axios.post(STRAPI_URL, heroData, {
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            console.log(`Герой ${hero.Name} успешно загружен с ID: ${createResponse.data.id}`);
        } catch (error) {
            console.error(`Ошибка при загрузке героя ${hero.Name}:`, error.response ? error.response.data : error.message);
            console.error('Полная ошибка:', error);
        }
    }
});
