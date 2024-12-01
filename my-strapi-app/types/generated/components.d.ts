import type { Schema, Struct } from '@strapi/strapi';

export interface FormationFormation extends Struct.ComponentSchema {
  collectionName: 'components_formation_formations';
  info: {
    displayName: 'formation';
    icon: 'expand';
  };
  attributes: {
    fifth: Schema.Attribute.Component<'formation.hero-place', false>;
    firth: Schema.Attribute.Component<'formation.hero-place', false>;
    fourth: Schema.Attribute.Component<'formation.hero-place', false>;
    second: Schema.Attribute.Component<'formation.hero-place', false>;
    third: Schema.Attribute.Component<'formation.hero-place', false>;
  };
}

export interface FormationHero extends Struct.ComponentSchema {
  collectionName: 'components_formation_heroes';
  info: {
    displayName: 'hero';
    icon: 'alien';
  };
  attributes: {
    hero: Schema.Attribute.Relation<'oneToOne', 'api::hero.hero'>;
  };
}

export interface FormationHeroPlace extends Struct.ComponentSchema {
  collectionName: 'components_formation_hero_places';
  info: {
    displayName: 'hero-place';
  };
  attributes: {
    hero: Schema.Attribute.Component<'formation.hero', true>;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'formation.formation': FormationFormation;
      'formation.hero': FormationHero;
      'formation.hero-place': FormationHeroPlace;
    }
  }
}
