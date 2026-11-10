# Learning-Management-System

Project Overview

The primary objective of this project is to build an organized relational database infrastructure capable of handling core LMS operations. The platform tracks user interactions from initial course enrollment to final grading criteria.

Key Objectives

• User Management: Maintain distinct structural entries for students and domain mentors.
• Academic Cataloging: Organise comprehensive course listings categorized by technology tracks.
• Progress Tracking: Monitor active, completed, or dropped student enrollment states.
• Performance Analytics: Log individual scores across assignments, quizzes, and project evaluations.
• Automation: Use stored procedures and automated triggers to log structural history and update metadata.

📐 Database Design & Architecture


Entity-Relationship (ER) Schema

The relational database structure consists of five core tables optimized for data integrity with appropriate Primary Keys (PK) and Foreign Keys (FK):
• Students: Stores student profile baselines.
	• student_id (PK), student_name, email, phone, city
• Mentors: Tracks teaching faculty metadata.
	• mentor_id (PK), mentor_name, expertise
• Courses: Catalogues active instructional subjects linked to mentors.
	• course_id (PK), mentor_id (FK), course_name, category, duration
• Enrollment: Logs relational connection mapping students to chosen tracks.
	• enrollment_id (PK), student_id (FK), course_id (FK), enroll_date, status
• Assessments: Contains graded operational evaluations.
	• assessment_id (PK), student_id (FK), course_id (FK), assessment_name, score, assessment_date
  
 Key Project Takeaways

1. Relational Integrity: Implemented foreign key constraints to maintain clean data records across student enrollments and graded assignments.
2. Text Processing & Calculation: Used built-in SQL string and date functions to dynamically mask sensitive user phone records and calculate performance durations.
3. Advanced Automation Elements: Created custom procedures, modular virtual views, and audit logging triggers to minimize redundant code and monitor platform updates automatically.

