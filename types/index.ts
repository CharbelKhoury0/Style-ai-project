export interface User {
  id: string;
  email: string;
  username?: string;
}

export interface StyleProfile {
  id: string;
  user_id: string;
  gender: string;
  preferred_styles: string[];
  preferred_colors: string[];
  size_tops: string;
  size_bottoms: string;
  size_shoes: string;
  typical_occasions: string[];
  created_at: string;
  updated_at: string;
}

export interface ClothingItem {
  id: string;
  user_id: string;
  image_url: string;
  type: string;
  color: string;
  pattern: string;
  material: string;
  formality: string;
  seasons: string[];
  tags: Record<string, any>;
  notes: string;
  created_at: string;
  updated_at: string;
}

export interface Outfit {
  id: string;
  user_id: string;
  name: string;
  item_ids: string[];
  occasion: string;
  weather_data: WeatherData;
  explanation: string;
  is_favorite: boolean;
  event_date?: string;
  created_at: string;
  updated_at: string;
}

export interface WeatherData {
  temperature?: number;
  condition?: string;
  humidity?: number;
  windSpeed?: number;
  location?: string;
  date?: string;
}

export interface WeatherForecast {
  date: string;
  dayName: string;
  temperature: {
    min: number;
    max: number;
  };
  condition: string;
  icon: string;
}

export type ClothingType =
  | 'tops'
  | 'bottoms'
  | 'dresses'
  | 'outerwear'
  | 'shoes'
  | 'accessories'
  | 'bags'
  | 'unknown';

export type Occasion =
  | 'casual'
  | 'work'
  | 'formal'
  | 'gym'
  | 'night out'
  | 'beach';

export type Formality = 'casual' | 'smart casual' | 'business' | 'formal';

export type Season = 'spring' | 'summer' | 'fall' | 'winter';

export type ColorScheme =
  | 'monochromatic'
  | 'complementary'
  | 'analogous'
  | 'neutral'
  | 'bold';

export interface OutfitFilters {
  occasion: Occasion;
  colorScheme?: ColorScheme;
  styleIntensity?: number;
  includeItems?: string[];
  excludeItems?: string[];
  weather?: WeatherData;
}

export interface GeneratedOutfit {
  items: ClothingItem[];
  explanation: string;
  occasion: Occasion;
  weather?: WeatherData;
}

export interface WardrobeStats {
  totalItems: number;
  totalOutfits: number;
  categoryDistribution: Record<string, number>;
  colorDistribution: Record<string, number>;
  formalityDistribution: Record<string, number>;
  mostUsedItems: Array<{
    item: ClothingItem;
    count: number;
  }>;
  recentActivity: {
    itemsAdded: number;
    outfitsCreated: number;
    lastAddedDate?: string;
  };
}

export interface AIDetectionResult {
  type: string;
  color: string;
  pattern: string;
  material: string;
  formality: string;
  seasons: string[];
  tags: Record<string, any>;
  confidence?: number;
}
