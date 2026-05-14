/*
  # Seed Initial Data

  1. Insert sample courses
  2. Insert sample achievements
*/

INSERT INTO courses (title, description, category, level, instructor, duration_hours, lessons_count)
VALUES
  ('JavaScript Fundamentals', 'Learn the basics of JavaScript programming', 'programming', 'beginner', 'John Doe', 12, 24),
  ('React for Beginners', 'Build interactive UIs with React', 'programming', 'beginner', 'Jane Smith', 20, 32),
  ('System Design Mastery', 'Design scalable systems for interviews', 'interview', 'advanced', 'Mike Johnson', 15, 18),
  ('Placement Preparation', 'Complete guide to ace job interviews', 'placement', 'intermediate', 'Sarah Williams', 30, 40),
  ('DSA in Python', 'Master data structures and algorithms', 'skills', 'intermediate', 'Alex Chen', 25, 35),
  ('Web Development Bootcamp', 'Full-stack web development from scratch', 'programming', 'intermediate', 'Emma Davis', 40, 50)
ON CONFLICT DO NOTHING;

INSERT INTO achievements (name, description, icon_url, type, requirement, xp_reward)
VALUES
  ('First Steps', 'Complete your first lesson', '', 'milestone', 1, 50),
  ('Week Warrior', 'Maintain a 7-day streak', '', 'streak', 7, 100),
  ('Course Master', 'Complete an entire course', '', 'completion', 1, 500),
  ('XP Collector', 'Earn 1000 XP', '', 'score', 1000, 0),
  ('Dedication Badge', 'Maintain a 30-day streak', '', 'streak', 30, 300),
  ('Knowledge Seeker', 'Enroll in 5 courses', '', 'milestone', 5, 200)
ON CONFLICT DO NOTHING;
