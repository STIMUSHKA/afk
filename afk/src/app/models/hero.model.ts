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

export interface Hero {
  id: number;
  documentId: string;
  name: string;
  awakened: boolean;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  locale: string | null;
  type: string;
  class: string;
  fraction: Fraction | null;
  icon: Icon;
}