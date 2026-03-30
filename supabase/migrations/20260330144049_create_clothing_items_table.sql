/*
  # Create Clothing Items Table

  ## Description
  This migration creates the clothing_items table to store all wardrobe items
  with AI-detected attributes like type, color, pattern, and material.

  ## New Tables
  1. **clothing_items**
    - `id` (uuid, primary key) - Unique identifier
    - `user_id` (uuid, references auth.users) - Owner of the item
    - `image_url` (text) - Stored image path/URL
    - `type` (text) - Category (shirt, pants, shoes, etc.)
    - `color` (text) - Primary color
    - `pattern` (text) - Pattern type (solid, striped, plaid, etc.)
    - `material` (text) - Fabric type (cotton, denim, leather, etc.)
    - `formality` (text) - Formality level (casual, smart casual, business, formal)
    - `seasons` (text array) - Suitable seasons (spring, summer, fall, winter)
    - `tags` (jsonb) - AI-detected additional metadata
    - `notes` (text) - User notes
    - `created_at` (timestamptz) - When item was added
    - `updated_at` (timestamptz) - Last modification time

  ## Security
  - Enable Row Level Security (RLS) on clothing_items table
  - Users can only access their own clothing items
  - Full CRUD permissions for authenticated users on their own items
*/

CREATE TABLE IF NOT EXISTS clothing_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  image_url text NOT NULL,
  type text DEFAULT 'unknown',
  color text DEFAULT 'unknown',
  pattern text DEFAULT 'solid',
  material text DEFAULT 'unknown',
  formality text DEFAULT 'casual',
  seasons text[] DEFAULT '{"spring","summer","fall","winter"}',
  tags jsonb DEFAULT '{}',
  notes text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE clothing_items ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own clothing items
CREATE POLICY "Users can view own clothing items"
  ON clothing_items
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- Policy: Users can insert their own clothing items
CREATE POLICY "Users can insert own clothing items"
  ON clothing_items
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can update their own clothing items
CREATE POLICY "Users can update own clothing items"
  ON clothing_items
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can delete their own clothing items
CREATE POLICY "Users can delete own clothing items"
  ON clothing_items
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Create indexes for faster filtering and queries
CREATE INDEX IF NOT EXISTS idx_clothing_items_user_id ON clothing_items(user_id);
CREATE INDEX IF NOT EXISTS idx_clothing_items_type ON clothing_items(type);
CREATE INDEX IF NOT EXISTS idx_clothing_items_color ON clothing_items(color);
CREATE INDEX IF NOT EXISTS idx_clothing_items_formality ON clothing_items(formality);