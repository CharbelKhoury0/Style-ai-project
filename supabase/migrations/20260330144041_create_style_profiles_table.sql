/*
  # Create Style Profiles Table

  ## Description
  This migration creates the style_profiles table to store user style preferences,
  sizes, and fashion-related information for personalized outfit recommendations.

  ## New Tables
  1. **style_profiles**
    - `id` (uuid, primary key) - Unique identifier
    - `user_id` (uuid, references auth.users) - Links to authenticated user
    - `gender` (text) - User's gender preference for styling
    - `preferred_styles` (text array) - Fashion styles they prefer (casual, formal, etc.)
    - `preferred_colors` (text array) - Favorite colors
    - `size_tops` (text) - Shirt/top size (XS, S, M, L, XL, etc.)
    - `size_bottoms` (text) - Pants/skirt size
    - `size_shoes` (text) - Shoe size
    - `typical_occasions` (text array) - Common events they dress for
    - `created_at` (timestamptz) - Record creation timestamp
    - `updated_at` (timestamptz) - Last update timestamp

  ## Security
  - Enable Row Level Security (RLS) on style_profiles table
  - Users can view and update only their own style profile
  - Users can insert their own style profile
*/

CREATE TABLE IF NOT EXISTS style_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL UNIQUE,
  gender text DEFAULT 'unspecified',
  preferred_styles text[] DEFAULT '{}',
  preferred_colors text[] DEFAULT '{}',
  size_tops text DEFAULT '',
  size_bottoms text DEFAULT '',
  size_shoes text DEFAULT '',
  typical_occasions text[] DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE style_profiles ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own style profile
CREATE POLICY "Users can view own style profile"
  ON style_profiles
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- Policy: Users can insert their own style profile
CREATE POLICY "Users can insert own style profile"
  ON style_profiles
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can update their own style profile
CREATE POLICY "Users can update own style profile"
  ON style_profiles
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_style_profiles_user_id ON style_profiles(user_id);