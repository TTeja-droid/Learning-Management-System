# Learning Management System (LMS) - MySQL Database Project
The objective of this database engine is to model a data framework for academic platforms. It captures user state changes—from a student's initial entry activation to historical enrollment logs and performance metrics across multiple evaluation levels.

Key Design Objectives

• Faculty & Student Allocation: Map professional subject-matter experts to target student groups.
• Course Cataloging & Granularity: Manage multi-category educational courses with varying tracking durations.
• Enrollment State Automation: Track operational status flows (Active, Completed, Dropped) dynamically.
• Performance Analysis Metrics: Perform analytical calculations over multi-tier metrics such as project evaluations, quizzes, and final scores.
• System Auditing & Security Logs: Use automated row triggers to track platform events and capture change histories.


 Relational Database Schema Design

The data engine comprises 5 primary transactional tables and specialized audit logging layers:
    ┌───────────────┐          ┌───────────────┐
    │    Mentors    │          │   Students2   │
    └───────┬───────┘          └───────┬───────┘
            │ 1                        │ 1
            │                          │
            │ M                        │ M
    ┌───────▼───────┐          ┌───────▼───────┐
    │    Courses    │          │  Enrollment   │
    └───────┬───────┘          └───────▲───────┘
            │ 1                        │
            │                          │ M
            └───────────┐  ┌───────────┘
                      M │  │ M
                    ┌───▼──┴────────┐
                    │  Assessments  │
                    └───────────────┘

Table Definitions & Primary Baselines

1. Students2: Base registry for registered student profiles.
	• Columns: student_id (PK), student_name, email (Unique), phone, city.
2. Mentors: Registry for tracking domain faculty expertise areas.
	• Columns: mentor_id (PK), mentor_name, expertise.
3. Courses: Catalog mapping active tracks, specific instructional categories, and class durations.
	• Columns: course_id (PK), mentor_id (FK), course_name, category, duration.
4. Enrollment: Roster managing courses, target student profiles, enrollment tracking timestamps, and statuses.
	• Columns: enrollment_id (PK), student_id (FK), course_id (FK), enroll_date, status.
5. Assessments: Metrics ledger containing transactional exam categories, performance parameters, and dates.
1. 
	• Columns: assessment_id (PK), student_id (FK), course_id (FK), assessment_name, score, assessment_date.


 Key project  Takeaways

• Relational Accuracy & Key Optimization: Enforced structural relational matching constraints across core transactional entities to maintain perfect platform data alignment.
• Advanced Programmatic Development: Encapsulated frequently executed system tasks using high-performance stored procedures to streamline database application layers.
• Real-time Event Automation & Auditing: Automated real-time log tracking by binding reactive row triggers onto mutation workflows to create a reliable historical record for core metrics changes.
