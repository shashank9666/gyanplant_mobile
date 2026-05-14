/*
  # Create Progress Tracking Table

  1. New Tables
    - `lesson_progress`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references profiles)
      - `course_id` (uuid, references courses)
      - `lesson_number` (integer)
      - `completed` (boolean, default: false)
      - `completion_date` (timestamp, nullable)
      - `time_spent_minutes` (integer, default: 0)
      - `created_at` (timestamp)
      - Unique constraint on (user_id, course_id, lesson_number)

  2. Security
    - Enable RLS on `lesson_progress` table
    - Add policy for users to view their own progress
    - Add policy for users to update their own progress
*/

CREATE TABLE IF NOT EXISTS lesson_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  course_id uuid NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  lesson_number integer NOT NULL,
  completed boolean DEFAULT false,
  completion_date timestamptz,
  time_spent_minutes integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, course_id, lesson_number)
);

ALTER TABLE lesson_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own progress"
  ON lesson_progress FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert progress"
  ON lesson_progress FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own progress"
  ON lesson_progress FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
