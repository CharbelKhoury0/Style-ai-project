export const CLOTHING_TYPES = [
  'all',
  'tops',
  'bottoms',
  'dresses',
  'outerwear',
  'shoes',
  'accessories',
  'bags',
] as const;

export const OCCASIONS = [
  'casual',
  'work',
  'formal',
  'gym',
  'night out',
  'beach',
] as const;

export const FORMALITY_LEVELS = [
  'casual',
  'smart casual',
  'business',
  'formal',
] as const;

export const SEASONS = ['spring', 'summer', 'fall', 'winter'] as const;

export const PATTERNS = [
  'solid',
  'striped',
  'plaid',
  'floral',
  'polka dot',
  'animal print',
  'geometric',
  'tie-dye',
] as const;

export const MATERIALS = [
  'cotton',
  'denim',
  'leather',
  'silk',
  'wool',
  'polyester',
  'linen',
  'cashmere',
  'suede',
  'nylon',
] as const;

export const COLORS = [
  'black',
  'white',
  'gray',
  'beige',
  'brown',
  'red',
  'pink',
  'orange',
  'yellow',
  'green',
  'blue',
  'navy',
  'purple',
  'multicolor',
] as const;

export const COLOR_SCHEMES = [
  'monochromatic',
  'complementary',
  'analogous',
  'neutral',
  'bold',
] as const;

export const STYLE_CATEGORIES = [
  'casual',
  'business',
  'formal',
  'streetwear',
  'bohemian',
  'minimalist',
  'athletic',
  'vintage',
  'preppy',
  'edgy',
] as const;

export const GENDER_OPTIONS = ['male', 'female', 'unisex', 'prefer not to say'] as const;

export const SIZE_OPTIONS = {
  tops: ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL'],
  bottoms: ['24', '26', '28', '30', '32', '34', '36', '38', '40'],
  shoes: ['5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12'],
};
