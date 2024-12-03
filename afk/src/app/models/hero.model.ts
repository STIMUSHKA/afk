export interface Icon {
  id: number;
  documentId: string;
  name: string;
  alternativeText: string | null;
  caption: string | null;
  width: number;
  height: number;
  formats: any | null;
  hash: string;
  ext: string;
  mime: string;
  size: number;
  url: string;
  previewUrl: string | null;
  provider: string;
  provider_metadata: any | null;
  folderPath: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  locale: string | null;
}

export interface Fraction {
  id: number;
  documentId: string;
  name: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  locale: string | null;
}

export class Hero {
  id: number;
  documentId: string;
  name: string;
  awakened: boolean;
  type: string;
  class: string;
  fraction: Fraction;
  icon: Icon;
  iconUrl: string;

  constructor(data: {
    id: number;
    documentId: string;
    name: string;
    awakened: boolean;
    type: string;
    class: string;
    fraction: Fraction | null;
    icon: Icon;
  }) {
    this.id = data.id;
    this.documentId = data.documentId;
    this.name = data.name;
    this.awakened = data.awakened;
    this.type = data.type;
    this.class = data.class;
    this.fraction = data.fraction!;
    this.icon = data.icon;
    this.iconUrl = data.icon.url
  }

  public isAwakened(): boolean {
    return this.awakened;
  }
}

export class HeroList {
  private heroes: Hero[];
  public classes: string[] = [];
  public types: string[] = [];
  public fractions: string[] = [];

  constructor(heroes: Hero[] = []) {
    this.heroes = heroes;
    this.classes = [...new Set(heroes.map(hero => hero.class))];
    this.types = [...new Set(heroes.map(hero => hero.type))];
    this.fractions = [...new Set(heroes.map(hero => hero.fraction.name).filter((name): name is string => name !== undefined))];
  }

  // Метод для получения всех героев
  public getHeroes(): Hero[] {
    return this.heroes;
  }

  // Метод для получения героя по ID
  public getHeroById(heroId: number): Hero | undefined {
    console.log('ddedededed', heroId, this.heroes.find(hero => hero.id === heroId))
    return this.heroes.find(hero => hero.id === heroId);
  }

  public getHeroByDocId(heroDocId: string): Hero | undefined {
    return this.heroes.find(hero => hero.documentId == heroDocId);
  }

  // Метод для получения количества героев
  public count(): number {
    return this.heroes.length;
  }
}

export class UserHero {
  id: number;
  documentId: string;
  signature_item: number;
  furniture: number;
  engraving: number;
  rarity: string;
  hero: Hero;

  constructor(data: any) {
    this.id = data.id;
    this.documentId = data.documentId;
    this.signature_item = data.signature_item;
    this.furniture = data.furniture;
    this.engraving = data.engraving;
    this.rarity = data.rarity;

    this.hero = data.hero
    console.log(this.hero)    
  }

  public getHero(): Hero {
    return this.hero;
  }

  public getRarity(): string {
    // Преобразуем название в более удобный формат
    let rarityName = this.rarity.split('_')[0].toLowerCase();  // "Elite", "Ascended", и т.д.
    let plus = this.rarity.includes('plus') ? 'plus' : ''; // Проверяем, есть ли "plus"
    

    // Собираем финальный результат
    let result = `${rarityName} ${plus}`.trim();  // Собираем результат, удаляя лишние пробелы
    return result;
  }

  public getHeroEngraving(): string {
    if (this.engraving < 30) {
      return 'yellow'
    } else if ( this.engraving >= 30 && this.engraving < 60) {
      return 'orange'
    } else if ( this.engraving >= 60 && this.engraving < 80) {
      return 'red'
    } else {
      return 'white'
    }
  }

  public getStars(): number {
    if (/\d+/.test(this.rarity)) {
      const numMatch = this.rarity.match(/\d+/);  // Ищем число
      if (numMatch) {
        console.log(numMatch)
        const num = parseInt(numMatch[0]);
        return num;
      }
    }
    return 0;
  }

  public getInfo(): string {
    return `${this.hero.name} (ID: ${this.id}) - Rarity: ${this.rarity}, Engraving: ${this.engraving}`;
  }
}

export class UserHeroList {
  private heroes: Hero[];
  private userHeroes: UserHero[];
  private notObtained: Hero[];

  constructor(heroes: Hero[]) {
    this.heroes = [...heroes];  // Создаем копию массива героев
    this.userHeroes = [];
    this.notObtained = [...this.heroes];  // Изначально все герои считаются "не полученными"
  }

  // Метод для добавления UserHero
  public addUserHero(data: {
    id: number;
    documentId: string;
    signature_item: number;
    furniture: number;
    engraving: number;
    rarity: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
    locale: string | null;
    heroId: number; // ID героя
  }): void {
    const userHero = new UserHero(data);
    this.userHeroes.push(userHero);

    // Обновляем notObtained после добавления нового UserHero
    this.updateNotObtained();
  }

  // Метод для получения всех UserHero
  public getUserHeroes(): UserHero[] {
    return this.userHeroes;
  }

  // Метод для получения всех героев
  public getHeroes(): Hero[] {
    return this.heroes;
  }

  // Метод для получения всех героев, которых нет у пользователя
  public getNotObtained(): Hero[] {
    return this.notObtained;
  }

  // Метод для поиска героя по ID
  public getHeroById(heroId: number): Hero | undefined {
    return this.heroes.find(hero => hero.id === heroId);
  }

  // Метод для обновления списка notObtained
  private updateNotObtained(): void {
    // Сравниваем всех героев с уже полученными и обновляем notObtained
    this.notObtained = this.heroes.filter(hero => 
      !this.userHeroes.some(userHero => userHero.hero.documentId === hero.documentId)
    );
  }
}

export const rarity = [
  'Elite',
  'Elite_plus',
  'Legendary',
  'Legendary_plus',
  'Mythic',
  'Mythic_plus',
  'Ascended',
  'Ascended_1*',
  'Ascended_2*',
  'Ascended_3*',
  'Ascended_4*',
  'Ascended_5*'
]

export const engraving = [
  0, 30, 60, 80, 100
]

export const signature_item = [
  0, 10, 20, 30, 40
]

export const furniture = [
  0, 3, 9
]