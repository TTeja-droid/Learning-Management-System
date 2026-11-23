# Learning Management System (LMS)

## Project Overview

The **Learning Management System (LMS)** is a database management
project designed to manage students, mentors, courses, enrollments, and
assessments.

The database organizes learning-related information and maintains
relationships between students, mentors, courses, and assessments.

## Project Objectives

-   Manage student information.
-   Maintain mentor details and areas of expertise.
-   Store and manage course information.
-   Track student course enrollments.
-   Maintain assessment details and student scores.
-   Establish relationships between database tables using primary keys
    and foreign keys.

## Technologies and Concepts Used

-   SQL
-   Database Management Systems (DBMS)
-   Relational Database Concepts
-   Entity Relationship Diagram (ERD)
-   Primary Keys and Foreign Keys

## Database Structure

The database contains five main tables.

### 1. MENTORS

Stores mentor information.

  Column           Description
  ---------------- -------------------
  MENTOR_ID (PK)   Unique mentor ID
  MENTOR_NAME      Mentor name
  EXPERTISE        Area of expertise

### 2. STUDENTS

Stores student information.

  Column            Description
  ----------------- -------------------
  STUDENT_ID (PK)   Unique student ID
  STUDENT_NAME      Student name
  EMAIL             Email address
  PHONE             Contact number
  CITY              Student city

### 3. COURSES

Stores course information.

  Column           Description
  ---------------- -------------------------
  COURSE_ID (PK)   Unique course ID
  MENTOR_ID (FK)   Reference to the mentor
  COURSE_NAME      Course name
  DURATION         Course duration
  CATEGORY         Course category

### 4. ENROLLMENT

Stores student enrollment details.

  Column               Description
  -------------------- --------------------------
  ENROLLMENT_ID (PK)   Unique enrollment ID
  STUDENT_ID (FK)      Reference to the student
  COURSE_ID (FK)       Reference to the course
  STATUS               Enrollment status
  ENROLL_DATE          Enrollment date

### 5. ASSESSMENTS

Stores assessment details and student scores.

  Column               Description
  -------------------- --------------------------
  ASSESSMENT_ID (PK)   Unique assessment ID
  STUDENT_ID (FK)      Reference to the student
  ASSESSMENT_NAME      Assessment name
  ASSESSMENT_DATE      Assessment date
  COURSE_ID (FK)       Reference to the course
  SCORE                Assessment score

## Entity Relationships

-   **Mentors and Courses:** Mentors teach courses.
-   **Students and Enrollment:** Students can have multiple enrollments.
-   **Courses and Enrollment:** Courses can have multiple enrollments.
-   **Students and Assessments:** Students can have multiple
    assessments.
-   **Courses and Assessments:** Courses conduct assessments.

## Key Features

-   Student information management.
-   Mentor information management.
-   Course management.
-   Student enrollment tracking.
-   Assessment management.
-   Student performance tracking.
-   Relational database design.

## Future Enhancements

-   Student login and registration.
-   Online course content management.
-   Assignment submission and tracking.
-   Automated assessment evaluation.
-   Student progress tracking.
-   Mentor and student dashboards.
-   Performance reports.

## Author

**Teja**

## Conclusion

The Learning Management System provides a structured approach to
managing students, mentors, courses, enrollments, and assessments. This
project demonstrates the practical use of relational database concepts
and relationships.

------------------------------------------------------------------------
