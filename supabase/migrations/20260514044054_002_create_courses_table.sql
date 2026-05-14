/*
  # Create Courses Table

  1. New Tables
    - `courses`
      - `id` (uuid, primary key)
      - `title` (text)
      - `description` (text)
      - `category` (text: 'programming', 'placement', 'interview', 'skills')
      - `level` (text: 'beginner', 'intermediate', 'advanced')
      - `instructor` (text)
      - `thumbnail_url` (text)
      - `duration_hours` (integer)
      - `lessons_count` (integer, default: 0)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `courses` table
    - Add policy for authenticated users to read all courses
*/

CREATE TABLE IF NOT EXISTS courses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  category text NOT NULL CHECK (category IN ('programming', 'placement', 'interview', 'skills')),
  level text NOT NULL CHECK (level IN ('beginner', 'intermediate', 'advanced')),
  instructor text,
  thumbnail_url text,
  duration_hours integer DEFAULT 0,
  lessons_count integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE courses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view courses"
  ON courses FOR SELECT
  TO authenticated
  USING (true);
