-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2022 lúc 01:55 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `do_an`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add bank', 6, 'add_bank'),
(22, 'Can change bank', 6, 'change_bank'),
(23, 'Can delete bank', 6, 'delete_bank'),
(24, 'Can view bank', 6, 'view_bank'),
(25, 'Can add bank account', 7, 'add_bankaccount'),
(26, 'Can change bank account', 7, 'change_bankaccount'),
(27, 'Can delete bank account', 7, 'delete_bankaccount'),
(28, 'Can view bank account', 7, 'view_bankaccount'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add experience', 9, 'add_experience'),
(34, 'Can change experience', 9, 'change_experience'),
(35, 'Can delete experience', 9, 'delete_experience'),
(36, 'Can view experience', 9, 'view_experience'),
(37, 'Can add degree', 10, 'add_degree'),
(38, 'Can change degree', 10, 'change_degree'),
(39, 'Can delete degree', 10, 'delete_degree'),
(40, 'Can view degree', 10, 'view_degree'),
(41, 'Can add certificate', 11, 'add_certificate'),
(42, 'Can change certificate', 11, 'change_certificate'),
(43, 'Can delete certificate', 11, 'delete_certificate'),
(44, 'Can view certificate', 11, 'view_certificate'),
(45, 'Can add address', 12, 'add_address'),
(46, 'Can change address', 12, 'change_address'),
(47, 'Can delete address', 12, 'delete_address'),
(48, 'Can view address', 12, 'view_address'),
(49, 'Can add job', 13, 'add_job'),
(50, 'Can change job', 13, 'change_job'),
(51, 'Can delete job', 13, 'delete_job'),
(52, 'Can view job', 13, 'view_job'),
(53, 'Can add job image', 14, 'add_jobimage'),
(54, 'Can change job image', 14, 'change_jobimage'),
(55, 'Can delete job image', 14, 'delete_jobimage'),
(56, 'Can view job image', 14, 'view_jobimage'),
(57, 'Can add offer', 15, 'add_offer'),
(58, 'Can change offer', 15, 'change_offer'),
(59, 'Can delete offer', 15, 'delete_offer'),
(60, 'Can view offer', 15, 'view_offer'),
(61, 'Can add category', 16, 'add_category'),
(62, 'Can change category', 16, 'change_category'),
(63, 'Can delete category', 16, 'delete_category'),
(64, 'Can view category', 16, 'view_category'),
(65, 'Can add job video', 17, 'add_jobvideo'),
(66, 'Can change job video', 17, 'change_jobvideo'),
(67, 'Can delete job video', 17, 'delete_jobvideo'),
(68, 'Can view job video', 17, 'view_jobvideo'),
(69, 'Can add payment method', 18, 'add_paymentmethod'),
(70, 'Can change payment method', 18, 'change_paymentmethod'),
(71, 'Can delete payment method', 18, 'delete_paymentmethod'),
(72, 'Can view payment method', 18, 'view_paymentmethod'),
(73, 'Can add review', 19, 'add_review'),
(74, 'Can change review', 19, 'change_review'),
(75, 'Can delete review', 19, 'delete_review'),
(76, 'Can view review', 19, 'view_review'),
(77, 'Can add job payment', 20, 'add_jobpayment'),
(78, 'Can change job payment', 20, 'change_jobpayment'),
(79, 'Can delete job payment', 20, 'delete_jobpayment'),
(80, 'Can view job payment', 20, 'view_jobpayment');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-10 17:00:53.360189', '2', 'test', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 1),
(2, '2022-11-10 17:01:01.929416', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 1),
(3, '2022-11-14 15:10:37.158026', '1', 'Experience object (1)', 1, '[{\"added\": {}}]', 9, 1),
(4, '2022-11-14 15:11:06.464468', '2', 'Experience object (2)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2022-11-14 15:11:52.699469', '1', 'Degree object (1)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2022-11-14 15:13:13.756475', '1', 'Certificate object (1)', 1, '[{\"added\": {}}]', 11, 1),
(7, '2022-11-14 15:13:46.737474', '2', 'Certificate object (2)', 1, '[{\"added\": {}}]', 11, 1),
(8, '2022-11-20 17:09:43.121269', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 16, 1),
(9, '2022-11-20 17:10:35.069568', '2', 'Category object (2)', 1, '[{\"added\": {}}]', 16, 1),
(10, '2022-11-20 17:10:55.021047', '2', 'Category object (2)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 16, 1),
(11, '2022-11-20 17:11:10.830956', '3', 'Category object (3)', 1, '[{\"added\": {}}]', 16, 1),
(12, '2022-11-21 15:17:14.721880', '1', 'PaymentMethod object (1)', 1, '[{\"added\": {}}]', 18, 1),
(13, '2022-11-21 15:17:35.234474', '1', 'PaymentMethod object (1)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 18, 1),
(14, '2022-11-21 15:18:31.969543', '1', 'JobPayment object (1)', 3, '', 20, 1),
(15, '2022-11-21 15:18:45.155030', '1', 'PaymentMethod object (1)', 2, '[]', 18, 1),
(16, '2022-11-21 15:19:02.226898', '2', 'PaymentMethod object (2)', 1, '[{\"added\": {}}]', 18, 1),
(17, '2022-11-21 15:23:56.515901', '2', 'JobPayment object (2)', 3, '', 20, 1),
(18, '2022-11-21 15:39:01.244404', '4', 'JobPayment object (4)', 3, '', 20, 1),
(19, '2022-11-21 15:39:01.427702', '3', 'JobPayment object (3)', 3, '', 20, 1),
(20, '2022-11-21 15:44:15.199948', '11', 'Address object (11)', 3, '', 12, 1),
(21, '2022-11-21 15:44:17.059475', '10', 'Address object (10)', 3, '', 12, 1),
(22, '2022-11-21 15:44:17.159809', '9', 'Address object (9)', 3, '', 12, 1),
(23, '2022-11-21 15:44:17.292350', '8', 'Address object (8)', 3, '', 12, 1),
(24, '2022-11-21 15:44:17.360478', '7', 'Address object (7)', 3, '', 12, 1),
(25, '2022-11-21 15:44:17.426270', '6', 'Address object (6)', 3, '', 12, 1),
(26, '2022-11-21 15:44:17.460375', '5', 'Address object (5)', 3, '', 12, 1),
(27, '2022-11-21 15:44:17.525974', '4', 'Address object (4)', 3, '', 12, 1),
(28, '2022-11-21 15:44:17.560494', '3', 'Address object (3)', 3, '', 12, 1),
(29, '2022-11-21 15:44:17.626367', '2', 'Address object (2)', 3, '', 12, 1),
(30, '2022-11-21 15:44:17.693881', '1', 'Address object (1)', 3, '', 12, 1),
(31, '2022-11-21 15:44:35.184418', '6', 'JobPayment object (6)', 3, '', 20, 1),
(32, '2022-11-21 15:44:35.226970', '5', 'JobPayment object (5)', 3, '', 20, 1),
(33, '2022-11-22 16:52:37.590357', '1', 'Offer object (1)', 1, '[{\"added\": {}}]', 15, 1),
(34, '2022-11-22 17:28:55.057823', '1', 'Offer object (1)', 3, '', 15, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(12, 'job', 'address'),
(16, 'job', 'category'),
(13, 'job', 'job'),
(14, 'job', 'jobimage'),
(20, 'job', 'jobpayment'),
(17, 'job', 'jobvideo'),
(15, 'job', 'offer'),
(18, 'job', 'paymentmethod'),
(19, 'job', 'review'),
(5, 'sessions', 'session'),
(6, 'user', 'bank'),
(7, 'user', 'bankaccount'),
(11, 'user', 'certificate'),
(8, 'user', 'customuser'),
(10, 'user', 'degree'),
(9, 'user', 'experience');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-11-04 00:24:38.343817'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-11-04 00:24:39.033682'),
(3, 'auth', '0001_initial', '2022-11-04 00:24:42.198929'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-11-04 00:24:43.107376'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-11-04 00:24:43.149448'),
(6, 'auth', '0004_alter_user_username_opts', '2022-11-04 00:24:43.192383'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-11-04 00:24:43.239637'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-11-04 00:24:43.266966'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-11-04 00:24:43.317944'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-11-04 00:24:43.359729'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-11-04 00:24:43.407239'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-11-04 00:24:43.567733'),
(13, 'auth', '0011_update_proxy_permissions', '2022-11-04 00:24:43.617722'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-11-04 00:24:43.648753'),
(15, 'user', '0001_initial', '2022-11-04 00:24:50.988728'),
(16, 'admin', '0001_initial', '2022-11-04 00:24:52.533537'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-11-04 00:24:52.597473'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-04 00:24:52.642232'),
(19, 'sessions', '0001_initial', '2022-11-04 00:24:53.634975'),
(20, 'user', '0002_alter_customuser_managers_and_more', '2022-11-04 14:18:44.826841'),
(21, 'user', '0003_customuser_phonenumber_alter_customuser_name_and_more', '2022-11-10 17:03:08.037078'),
(22, 'job', '0001_initial', '2022-11-20 09:45:31.892027'),
(23, 'job', '0002_alter_address_latitude_alter_address_longitude', '2022-11-20 17:03:41.843726'),
(24, 'job', '0003_remove_job_paymentmethod_remove_paymentmethod_amount_and_more', '2022-11-21 00:51:44.501360'),
(25, 'job', '0004_jobpayment_amount', '2022-11-21 14:55:26.754095'),
(26, 'job', '0005_offer_job', '2022-11-22 16:15:10.958108'),
(27, 'job', '0006_offer_status', '2022-11-22 16:28:34.931557'),
(28, 'job', '0007_alter_offer_status', '2022-11-22 16:28:50.101446');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('vudkgf1e93hyd3td938u4funrxz1uz7d', '.eJxVjMEKwyAQRP_FcxFNWBN77L3fIOvuWtMWAzE5hf57I-TQwsDAvJnZVcBtzWGrsoSJ1VVZdfnNItJLSgP8xPKYNc1lXaaoW0WftOr7zPK-nd2_g4w1H2tjO6LOARnvbErOk0jvGIZkpQkjsEXAxDzCYHrwNMJhTiwYn7z6fAHy3jgN:1ownli:DXvzCCkUEqKaYKxe8fq_pG49v6550yx9dwhpECndDCM', '2022-12-04 17:06:10.971601'),
('ymrq5pjven5oeen6q5w6zpjgpwlkyp52', '.eJxVjMEKwyAQRP_FcxFNWBN77L3fIOvuWtMWAzE5hf57I-TQwsDAvJnZVcBtzWGrsoSJ1VVZdfnNItJLSgP8xPKYNc1lXaaoW0WftOr7zPK-nd2_g4w1H2tjO6LOARnvbErOk0jvGIZkpQkjsEXAxDzCYHrwNMJhTiwYn7z6fAHy3jgN:1oqxXO:AkAZUQL8MNkp-ZptG9U7uxvEnS31mTfvsJ4-qiWSje8', '2022-11-18 14:19:14.960019');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_address`
--

CREATE TABLE `job_address` (
  `id` bigint(20) NOT NULL,
  `city` longtext NOT NULL,
  `district` longtext NOT NULL,
  `ward` longtext NOT NULL,
  `detail` longtext NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_address`
--

INSERT INTO `job_address` (`id`, `city`, `district`, `ward`, `detail`, `latitude`, `longitude`) VALUES
(12, 'thành phố Hà Nội', 'huyện Thanh Oai', 'xã Bình Mình', 'số 19, xóm Lầy, thôn Sinh Liên', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_category`
--

CREATE TABLE `job_category` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_category`
--

INSERT INTO `job_category` (`id`, `name`) VALUES
(1, 'IT'),
(2, 'Thiết kế'),
(3, 'Marketing & Bán hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_job`
--

CREATE TABLE `job_job` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `status` longtext NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `poster_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_job`
--

INSERT INTO `job_job` (`id`, `title`, `description`, `status`, `address_id`, `poster_id`, `payment_id`) VALUES
(4, 'Tìm bạn đời', 'Ngoan ngoãn, học giỏi, xinh gái, nhà giàu', 'Pending', 12, 1, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_jobimage`
--

CREATE TABLE `job_jobimage` (
  `id` bigint(20) NOT NULL,
  `image` longtext NOT NULL,
  `job_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_jobimage`
--

INSERT INTO `job_jobimage` (`id`, `image`, `job_id`) VALUES
(3, 'https://firebasestorage.googleapis.com/v0/b/do-an-fe33e.appspot.com/o/files%2Ffbf023c7-68f3-11ed-9db9-44032ce6d722Screenshot_20221022_121144.png?alt=media&token=media/fbf023c7-68f3-11ed-9db9-44032ce6d722Screenshot_20221022_121144.png', 4),
(4, 'https://firebasestorage.googleapis.com/v0/b/do-an-fe33e.appspot.com/o/files%2Ffbf023c7-68f3-11ed-9db9-44032ce6d722Screenshot_20221022_121144.png?alt=media&token=media/fbf023c7-68f3-11ed-9db9-44032ce6d722Screenshot_20221022_121144.png', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_jobpayment`
--

CREATE TABLE `job_jobpayment` (
  `id` bigint(20) NOT NULL,
  `paymentMethod_id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_jobpayment`
--

INSERT INTO `job_jobpayment` (`id`, `paymentMethod_id`, `amount`) VALUES
(7, 1, 100000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_jobvideo`
--

CREATE TABLE `job_jobvideo` (
  `id` bigint(20) NOT NULL,
  `video` longtext NOT NULL,
  `job_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_job_categories`
--

CREATE TABLE `job_job_categories` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_job_categories`
--

INSERT INTO `job_job_categories` (`id`, `job_id`, `category_id`) VALUES
(7, 4, 1),
(8, 4, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_offer`
--

CREATE TABLE `job_offer` (
  `id` bigint(20) NOT NULL,
  `price` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `status` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_offer`
--

INSERT INTO `job_offer` (`id`, `price`, `description`, `user_id`, `job_id`, `status`) VALUES
(2, 1556, 'can co ngan nay tien moi het', 2, 4, 'Pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_paymentmethod`
--

CREATE TABLE `job_paymentmethod` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `title` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `job_paymentmethod`
--

INSERT INTO `job_paymentmethod` (`id`, `description`, `title`) VALUES
(1, 'tiền công sẽ được trả khi bạn hoàn thành công việc', 'theo dự án'),
(2, 'bạn sẽ được trả tiền theo số giờ bạn hoàn thành công việc', 'theo giờ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_review`
--

CREATE TABLE `job_review` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `detail` longtext NOT NULL,
  `offer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_bank`
--

CREATE TABLE `user_bank` (
  `id` bigint(20) NOT NULL,
  `bankId` longtext NOT NULL,
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_bankaccount`
--

CREATE TABLE `user_bankaccount` (
  `id` bigint(20) NOT NULL,
  `owner` longtext NOT NULL,
  `accountNumber` longtext NOT NULL,
  `bank_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_certificate`
--

CREATE TABLE `user_certificate` (
  `id` bigint(20) NOT NULL,
  `_from` date NOT NULL,
  `to` date DEFAULT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_certificate`
--

INSERT INTO `user_certificate` (`id`, `_from`, `to`, `title`, `description`, `user_id`) VALUES
(1, '2022-09-21', '2023-07-31', 'TOEIC', '840/990', 1),
(2, '2022-08-16', '2022-11-14', 'Thuật toán cơ bản', 'SVMC', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customuser`
--

CREATE TABLE `user_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `dob` date NOT NULL,
  `name` longtext NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `cover` varchar(200) DEFAULT NULL,
  `loyaltyPoint` int(11) NOT NULL,
  `gender` longtext NOT NULL,
  `createAt` datetime(6) NOT NULL,
  `updateAt` datetime(6) NOT NULL,
  `bankAccount_id` bigint(20) DEFAULT NULL,
  `phoneNumber` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_customuser`
--

INSERT INTO `user_customuser` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `dob`, `name`, `avatar`, `cover`, `loyaltyPoint`, `gender`, `createAt`, `updateAt`, `bankAccount_id`, `phoneNumber`) VALUES
(1, 'pbkdf2_sha256$320000$Y6tz7TcenR3kn2GZqJq3ek$7HjpNSUCYbcFVGVahc9QNsSQt0K1qgtfT9CZIFLIZec=', '2022-11-20 17:06:10.870073', 1, '', '', 1, 1, '2022-11-04 14:19:00.000000', 'admin@gmail.com', '2000-12-03', 'Admin', NULL, NULL, 0, 'Male', '2022-11-04 14:19:00.539772', '2022-11-10 17:01:01.905963', NULL, NULL),
(2, 'pbkdf2_sha256$320000$KnfLOoziqZsb1xgrHb2QVx$E6vjdz5KZ0Ns3p5aPqbn9HBT5XqBuL7jWccFuHq57zQ=', NULL, 0, '', '', 0, 1, '2022-11-06 15:24:32.000000', 'test@gmail.com', '2000-12-03', 'Tan test', NULL, NULL, 0, 'Male', '2022-11-06 15:24:32.349729', '2022-11-24 16:04:55.133966', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customuser_groups`
--

CREATE TABLE `user_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customuser_user_permissions`
--

CREATE TABLE `user_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_degree`
--

CREATE TABLE `user_degree` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `organization` longtext NOT NULL,
  `year` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_degree`
--

INSERT INTO `user_degree` (`id`, `title`, `organization`, `year`, `user_id`) VALUES
(1, 'Bằng giỏi - Công nghệ Thông tin', 'Học viện Công nghệ Bưu chính Viễn thông', 2023, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_experience`
--

CREATE TABLE `user_experience` (
  `id` bigint(20) NOT NULL,
  `_from` date NOT NULL,
  `to` date DEFAULT NULL,
  `description` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_experience`
--

INSERT INTO `user_experience` (`id`, `_from`, `to`, `description`, `user_id`) VALUES
(1, '2022-11-06', '2022-11-17', 'làm dev ở vuongsoft', 1),
(2, '2022-11-02', '2022-11-29', 'làm dev ở InvestIdea', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_customuser_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `job_address`
--
ALTER TABLE `job_address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Chỉ mục cho bảng `job_job`
--
ALTER TABLE `job_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address_id` (`address_id`),
  ADD KEY `job_job_poster_id_91aef6a3_fk_user_customuser_id` (`poster_id`),
  ADD KEY `job_job_payment_id_9209445e_fk_job_jobpayment_id` (`payment_id`);

--
-- Chỉ mục cho bảng `job_jobimage`
--
ALTER TABLE `job_jobimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_jobimage_job_id_04d175ff_fk_job_job_id` (`job_id`);

--
-- Chỉ mục cho bảng `job_jobpayment`
--
ALTER TABLE `job_jobpayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_jobpayment_paymentMethod_id_855ee1e0_fk_job_paymentmethod_id` (`paymentMethod_id`);

--
-- Chỉ mục cho bảng `job_jobvideo`
--
ALTER TABLE `job_jobvideo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_jobvideo_job_id_be68a608_fk_job_job_id` (`job_id`);

--
-- Chỉ mục cho bảng `job_job_categories`
--
ALTER TABLE `job_job_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_job_categories_job_id_category_id_9ea2a8c9_uniq` (`job_id`,`category_id`),
  ADD KEY `job_job_categories_category_id_03535f60_fk_job_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `job_offer`
--
ALTER TABLE `job_offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_offer_user_id_cc0f4f04_fk_user_customuser_id` (`user_id`),
  ADD KEY `job_offer_job_id_1ab22530_fk_job_job_id` (`job_id`);

--
-- Chỉ mục cho bảng `job_paymentmethod`
--
ALTER TABLE `job_paymentmethod`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `job_review`
--
ALTER TABLE `job_review`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offer_id` (`offer_id`);

--
-- Chỉ mục cho bảng `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_bankaccount`
--
ALTER TABLE `user_bankaccount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bankaccount_bank_id_a72b5bf7_fk_user_bank_id` (`bank_id`);

--
-- Chỉ mục cho bảng `user_certificate`
--
ALTER TABLE `user_certificate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_certificate_user_id_1d607df2_fk_user_customuser_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_customuser`
--
ALTER TABLE `user_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_customuser_bankAccount_id_495c43d5_fk_user_bankaccount_id` (`bankAccount_id`);

--
-- Chỉ mục cho bảng `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customuser_groups_customuser_id_group_id_e0a2f621_uniq` (`customuser_id`,`group_id`),
  ADD KEY `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customuser_user_per_customuser_id_permission_a5da865d_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `user_degree`
--
ALTER TABLE `user_degree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_degree_user_id_a1817359_fk_user_customuser_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_experience`
--
ALTER TABLE `user_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_experience_user_id_3e50e317_fk_user_customuser_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `job_address`
--
ALTER TABLE `job_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `job_category`
--
ALTER TABLE `job_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `job_job`
--
ALTER TABLE `job_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `job_jobimage`
--
ALTER TABLE `job_jobimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `job_jobpayment`
--
ALTER TABLE `job_jobpayment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `job_jobvideo`
--
ALTER TABLE `job_jobvideo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `job_job_categories`
--
ALTER TABLE `job_job_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `job_offer`
--
ALTER TABLE `job_offer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `job_paymentmethod`
--
ALTER TABLE `job_paymentmethod`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `job_review`
--
ALTER TABLE `job_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_bankaccount`
--
ALTER TABLE `user_bankaccount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_certificate`
--
ALTER TABLE `user_certificate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_customuser`
--
ALTER TABLE `user_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_degree`
--
ALTER TABLE `user_degree`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user_experience`
--
ALTER TABLE `user_experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Các ràng buộc cho bảng `job_job`
--
ALTER TABLE `job_job`
  ADD CONSTRAINT `job_job_address_id_7c39514c_fk_job_address_id` FOREIGN KEY (`address_id`) REFERENCES `job_address` (`id`),
  ADD CONSTRAINT `job_job_payment_id_9209445e_fk_job_jobpayment_id` FOREIGN KEY (`payment_id`) REFERENCES `job_jobpayment` (`id`),
  ADD CONSTRAINT `job_job_poster_id_91aef6a3_fk_user_customuser_id` FOREIGN KEY (`poster_id`) REFERENCES `user_customuser` (`id`);

--
-- Các ràng buộc cho bảng `job_jobimage`
--
ALTER TABLE `job_jobimage`
  ADD CONSTRAINT `job_jobimage_job_id_04d175ff_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`);

--
-- Các ràng buộc cho bảng `job_jobpayment`
--
ALTER TABLE `job_jobpayment`
  ADD CONSTRAINT `job_jobpayment_paymentMethod_id_855ee1e0_fk_job_paymentmethod_id` FOREIGN KEY (`paymentMethod_id`) REFERENCES `job_paymentmethod` (`id`);

--
-- Các ràng buộc cho bảng `job_jobvideo`
--
ALTER TABLE `job_jobvideo`
  ADD CONSTRAINT `job_jobvideo_job_id_be68a608_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`);

--
-- Các ràng buộc cho bảng `job_job_categories`
--
ALTER TABLE `job_job_categories`
  ADD CONSTRAINT `job_job_categories_category_id_03535f60_fk_job_category_id` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`id`),
  ADD CONSTRAINT `job_job_categories_job_id_2d32ff81_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`);

--
-- Các ràng buộc cho bảng `job_offer`
--
ALTER TABLE `job_offer`
  ADD CONSTRAINT `job_offer_job_id_1ab22530_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`),
  ADD CONSTRAINT `job_offer_user_id_cc0f4f04_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Các ràng buộc cho bảng `job_review`
--
ALTER TABLE `job_review`
  ADD CONSTRAINT `job_review_offer_id_09cd252c_fk_job_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `job_offer` (`id`);

--
-- Các ràng buộc cho bảng `user_bankaccount`
--
ALTER TABLE `user_bankaccount`
  ADD CONSTRAINT `user_bankaccount_bank_id_a72b5bf7_fk_user_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `user_bank` (`id`);

--
-- Các ràng buộc cho bảng `user_certificate`
--
ALTER TABLE `user_certificate`
  ADD CONSTRAINT `user_certificate_user_id_1d607df2_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Các ràng buộc cho bảng `user_customuser`
--
ALTER TABLE `user_customuser`
  ADD CONSTRAINT `user_customuser_bankAccount_id_495c43d5_fk_user_bankaccount_id` FOREIGN KEY (`bankAccount_id`) REFERENCES `user_bankaccount` (`id`);

--
-- Các ràng buộc cho bảng `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  ADD CONSTRAINT `user_customuser_grou_customuser_id_192632a7_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  ADD CONSTRAINT `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  ADD CONSTRAINT `user_customuser_user_customuser_id_4552d9cc_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  ADD CONSTRAINT `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Các ràng buộc cho bảng `user_degree`
--
ALTER TABLE `user_degree`
  ADD CONSTRAINT `user_degree_user_id_a1817359_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Các ràng buộc cho bảng `user_experience`
--
ALTER TABLE `user_experience`
  ADD CONSTRAINT `user_experience_user_id_3e50e317_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
