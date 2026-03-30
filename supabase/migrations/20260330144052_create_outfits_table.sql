/*
  # Create Outfits Table

  ## Description
  This migration creates the outfits table to store saved outfit combinations
  with AI-generated explanations and metadata.

  ## New Tables
  1. **outfits**
    - `id` (uuid, primary key) - Unique identifier
    - `user_id` (uuid, references auth.users) - Owner of the outfit
    - `name` (text) - User-given name for the outfit
    - `item_ids` (uuid array) - Array of clothing_items IDs in this outfit
    - `occasion` (text) - Event type (casual, work, formal, gym, night out, beach)
    - `weather_data` (jsonb) - Weather conditions when created (temp, conditions, etc.)
    - `explanation` (text) - AI-generated styling explanation
    - `is_favorite` (boolean) - User marked as favorite
    - `event_date` (date) - Optional planned event date
    - `created_at` (timestamptz) - When outfit was saved
    - `updated_at` (timestamptz) - Last modification time

  ## Security
  - Enable Row Level Security (RLS) on outfits table
  - Users can only access their own saved outfits
  - Full CRUD permissions for authenticated users on their own outfits
*/

CREATE TABLE IF NOT EXISTS outfits (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  name text DEFAULT 'Untitled Outfit',
  item_ids uuid[] NOT NULL,
  occasion text DEFAULT 'casual',
  weather_data jsonb DEFAULT '{}',
  explanation text DEFAULT '',
  is_favorite boolean DEFAULT false,
  event_date date,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE outfits ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own outfits
CREATE POLICY "Users can view own outfits"
  ON outfits
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- Policy: Users can insert their own outfits
CREATE POLICY "Users can insert own outfits"
  ON outfits
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can update their own outfits
CREATE POLICY "Users can update own outfits"
  ON outfits
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can delete their own outfits
CREATE POLICY "Users can delete own outfits"
  ON outfits
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Create indexes for faster filtering
CREATE INDEX IF NOT EXISTS idx_outfits_user_id ON outfits(user_id);
CREATE INDEX IF NOT EXISTS idx_outfits_occasion ON outfits(occasion);
CREATE INDEX IF NOT EXISTS idx_outfits_is_favorite ON outfits(is_favorite);
CREATE INDEX IF NOT EXISTS idx_outfits_event_date ON outfits(event_date);