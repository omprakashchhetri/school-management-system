-- School Management System Database Schema
-- MySQL Database Schema for phpMyAdmin Import
-- Created with utf8mb4 character set for full Unicode support

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database Character Set
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

-- Table structure for table `tools`

CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `classes`

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `short_form` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `sections`

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_label` varchar(255) NOT NULL,
  `related_class` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `roles`

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `teachers`

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `related_class_teacher` int(11) DEFAULT NULL,
  `related_section_class_teacher` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) NOT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `email1` varchar(255) NOT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `district` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `students`

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `roll_no` varchar(50) NOT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `student_contact_no` varchar(20) DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_religion` varchar(100) DEFAULT NULL,
  `student_caste` varchar(100) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `father_contact_no` varchar(20) NOT NULL,
  `mother_contact_no` varchar(20) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `district` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `subjects`

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `documents`

CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `related_teacher` int(11) DEFAULT NULL,
  `related_student` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `role_permissions`

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `can_view` boolean NOT NULL DEFAULT 0,
  `can_edit` boolean NOT NULL DEFAULT 0,
  `can_delete` boolean NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `subject_allocations`

CREATE TABLE `subject_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `teacher` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `student_attendance`

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `punch_in` time DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  `date` date NOT NULL,
  `attendance_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `teacher_attendance`

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `punch_in` time DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  `date` date NOT NULL,
  `attendance_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `fees_slabs`

CREATE TABLE `fees_slabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `fees_payments`

CREATE TABLE `fees_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `payable_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL,
  `payment_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `payment_gateways`

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(255) NOT NULL,
  `config_params` text DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  `check_status_url` varchar(255) DEFAULT NULL,
  `repayment_url` varchar(255) DEFAULT NULL,
  `payment_url_request_params` text DEFAULT NULL,
  `check_status_url_request_params` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `period_time_slots`

CREATE TABLE `period_time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `schedules`

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_period` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `related_subject` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `syllabus`

CREATE TABLE `syllabus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_subject` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `uploaded_syllabus_file` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `lesson_plans`

CREATE TABLE `lesson_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_subject` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `chapter_no` varchar(50) DEFAULT NULL,
  `topic_name` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `holidays`

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `assignments`

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_subject` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `deadline_date` date NOT NULL,
  `deadline_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `assignment_submissions`

CREATE TABLE `assignment_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_assignment` int(11) NOT NULL,
  `related_student` int(11) NOT NULL,
  `upload_answers` varchar(255) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `marks` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `notes`

CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_subject` int(11) NOT NULL,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `upload_file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `tests`

CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_subject` int(11) NOT NULL,
  `related_class` int(11) NOT NULL,
  `related_section` int(11) NOT NULL,
  `related_teacher` int(11) NOT NULL,
  `test_date` date NOT NULL,
  `max_marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `exams`

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_title` varchar(255) NOT NULL,
  `exam_description` text DEFAULT NULL,
  `exam_startdate` date NOT NULL,
  `exam_enddate` date NOT NULL,
  `exam_createdby` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `exam_items`

CREATE TABLE `exam_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_exam` int(11) NOT NULL,
  `related_subject` int(11) NOT NULL,
  `related_class` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `question_paper` varchar(255) DEFAULT NULL,
  `max_marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `test_marks`

CREATE TABLE `test_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_test` int(11) NOT NULL,
  `related_student` int(11) NOT NULL,
  `obtained_marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `exam_marks`

CREATE TABLE `exam_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_exam_item` int(11) NOT NULL,
  `related_student` int(11) NOT NULL,
  `obtained_marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `report_cards`

CREATE TABLE `report_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_student` int(11) NOT NULL,
  `related_exam` int(11) NOT NULL,
  `average` decimal(5,2) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `total` int(11) NOT NULL,
  `ranking` int(11) NOT NULL,
  `outcome` enum('Pass','Fail') NOT NULL,
  `total_possible_marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `drivers`

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(150) NOT NULL,
  `dl_no` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `vehicles`

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `routes`

CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(100) NOT NULL,
  `related_vehicle` int(11) NOT NULL,
  `related_driver` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `route_items`

CREATE TABLE `route_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_route` int(11) NOT NULL,
  `place_name` varchar(150) NOT NULL,
  `time_of_arrival` time NOT NULL,
  `time_of_departure` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Table structure for table `transport_student_rel`

CREATE TABLE `transport_student_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_route` int(11) NOT NULL,
  `related_student` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;