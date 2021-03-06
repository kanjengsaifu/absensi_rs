DROP TABLE IF EXISTS `abs_bagian`;
CREATE TABLE `abs_bagian` (
  `bag_id` int(11) NOT NULL,
  `bag_name` varchar(100) NOT NULL,
  `bag_void` tinyint(4) NOT NULL,
  `bag_created_at` datetime NOT NULL,
  `bag_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_bagian`
  ADD PRIMARY KEY (`bag_id`);

ALTER TABLE `abs_bagian`
  MODIFY `bag_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_status`;
CREATE TABLE `abs_status` (
  `sta_id` int(11) NOT NULL,
  `sta_name` varchar(100) NOT NULL,
  `sta_void` tinyint(4) NOT NULL,
  `sta_created_at` datetime NOT NULL,
  `sta_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_status`
  ADD PRIMARY KEY (`sta_id`);

ALTER TABLE `abs_status`
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_unit`;
CREATE TABLE `abs_unit` (
  `uni_id` int(11) NOT NULL,
  `uni_name` varchar(100) NOT NULL,
  `uni_bag_id` int(11) NOT NULL,
  `uni_void` tinyint(4) NOT NULL,
  `uni_created_at` datetime NOT NULL,
  `uni_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_unit`
  ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `abs_unit`
  MODIFY `uni_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_jabatan`;
CREATE TABLE `abs_jabatan` (
`jab_id` int(11) NOT NULL,
`jab_name` varchar(100) NOT NULL,
`jab_parent` int(11) NOT NULL,
`jab_void` tinyint(4) NOT NULL,
`jab_created_at` datetime NOT NULL,
`jab_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_jabatan`
  ADD PRIMARY KEY (`jab_id`);

ALTER TABLE `abs_jabatan`
  MODIFY `jab_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_employee`;
CREATE TABLE `abs_employee` (
  `emp_id` int(11) NOT NULL,
  `emp_code` varchar(15) NOT NULL DEFAULT ' ' COMMENT 'Employee Code',
  `emp_NIK` varchar(100) DEFAULT NULL,
  `emp_initial` varchar(100) DEFAULT NULL,
  `emp_name` varchar(100) DEFAULT ' ' COMMENT 'Employee Name',
  `emp_gender` varchar(10) DEFAULT NULL,
  `emp_birthplace` varchar(50) DEFAULT NULL,
  `emp_birthdate` date DEFAULT '2010-01-01',
  `emp_religion` varchar(20) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_address1` varchar(150) DEFAULT ' ' COMMENT 'Employee Address 1',
  `emp_address2` varchar(150) DEFAULT ' ' COMMENT 'Employee Address 2',
  `emp_address3` varchar(150) DEFAULT ' ' COMMENT 'Employee Address 3',
  `emp_post_code` varchar(7) DEFAULT ' ' COMMENT 'Employee Post Code',
  `emp_ext_phone` varchar(5) DEFAULT ' ' COMMENT 'Employee Phone Extension',
  `emp_office_phone` varchar(20) DEFAULT ' ' COMMENT 'Employee Office Phone',
  `emp_home_phone` varchar(100) DEFAULT ' ' COMMENT 'Employee Home Phone',
  `emp_mobile_phone` varchar(100) DEFAULT ' ' COMMENT 'Employee Mobile Phone',
  `emp_pin_bb` varchar(20) DEFAULT ' ' COMMENT 'Employee pin BB',
  `emp_email` varchar(100) DEFAULT ' ' COMMENT 'Employee Email Address',
  `emp_website` varchar(100) DEFAULT ' ' COMMENT 'Employee Website Url',
  `emp_acc_bank` varchar(100) DEFAULT ' ' COMMENT 'Employee Account Bank Name',
  `emp_acc_no` varchar(100) DEFAULT ' ' COMMENT 'Employee Bank Account No',
  `emp_acc_name` varchar(100) DEFAULT ' ' COMMENT 'Employee Name on Bank Account ',
  `emp_insurance` varchar(100) DEFAULT NULL,
  `emp_insurance_no` varchar(100) DEFAULT NULL,
  `emp_active` int(1) NOT NULL DEFAULT '1' COMMENT 'Employee Active Status',
  `emp_start_date` date DEFAULT '2010-01-01',
  `emp_out_date` date DEFAULT '2010-01-01',
  `emp_reason_out` text,
  `emp_photo` longblob,
  `emp_base_salary` int(20) DEFAULT NULL,
  `emp_bag_id` int(11) DEFAULT NULL,
  `emp_uni_id` int(11) DEFAULT NULL,
  `emp_jab_id` int(11) DEFAULT NULL,
  `emp_void` tinyint(4) NOT NULL,
  `emp_created_at` datetime NOT NULL,
  `emp_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_employee`
  ADD PRIMARY KEY (`emp_id`);

ALTER TABLE `abs_employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_cuti`;
CREATE TABLE `abs_cuti` (
  `cut_id` int(11) NOT NULL,
  `cut_name` varchar(200) NOT NULL,
  `cut_jumlah` int(11) NOT NULL,
  `cut_keterangan` text NOT NULL,
  `cut_void` tinyint(4) NOT NULL,
  `cut_created_at` datetime NOT NULL,
  `cut_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_cuti`
  ADD PRIMARY KEY (`cut_id`);

ALTER TABLE `abs_cuti`
  MODIFY `cut_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_holiday`;
CREATE TABLE `abs_holiday` (
  `hol_id` int(11) NOT NULL,
  `hol_name` varchar(200) NOT NULL,
  `hol_tanggal` date NOT NULL,
  `hol_keterangan` text NOT NULL,
  `hol_void` tinyint(4) NOT NULL,
  `hol_created_at` datetime NOT NULL,
  `hol_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_holiday`
  ADD PRIMARY KEY (`hol_id`);

ALTER TABLE `abs_holiday`
  MODIFY `hol_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_employee_cuti`;
CREATE TABLE `abs_employee_cuti` (
  `emcu_id` int(11) NOT NULL,
  `emcu_emp_id` int(11) NOT NULL,
  `emcu_name` varchar(100) NOT NULL,
  `emcu_keterangan` text NOT NULL,
  `emcu_tanggal_awal` date NOT NULL,
  `emcu_tanggal_akhir` date NOT NULL,
  `emcu_status` tinyint(4) NOT NULL,
  `emcu_void` tinyint(4) NOT NULL,
  `emcu_created_at` datetime NOT NULL,
  `emcu_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_employee_cuti`
  ADD PRIMARY KEY (`emcu_id`);

ALTER TABLE `abs_employee_cuti`
  MODIFY `emcu_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_schedule`;
CREATE TABLE `abs_schedule` (
  `schd_id` int(11) NOT NULL,
  `schd_name` varchar(200) NOT NULL,
  `schd_waktu_awal` time NOT NULL,
  `schd_waktu_akhir` time NOT NULL,
  `schd_keterangan` text NOT NULL,
  `schd_void` tinyint(4) NOT NULL,
  `schd_created_at` datetime NOT NULL,
  `schd_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_schedule`
  ADD PRIMARY KEY (`schd_id`);

ALTER TABLE `abs_schedule`
  MODIFY `schd_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_employee_overtime`;
CREATE TABLE `abs_employee_overtime` (
  `emov_id` int(11) NOT NULL,
  `emov_emp_id` int(11) NOT NULL,
  `emov_name` varchar(100) NOT NULL,
  `emov_keterangan` text NOT NULL,
  `emov_tanggal` date NOT NULL,
  `emov_status` tinyint(4) NOT NULL,
  `emov_void` tinyint(4) NOT NULL,
  `emov_created_at` datetime NOT NULL,
  `emov_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_employee_overtime`
  ADD PRIMARY KEY (`emov_id`);

ALTER TABLE `abs_employee_overtime`
  MODIFY `emov_id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `abs_employee_schedule`;
CREATE TABLE `abs_employee_schedule` (
  `emsc_id` int(11) NOT NULL,
  `emsc_emp_id` int(11) NOT NULL,
  `emsc_uniq_code` varchar(50) NOT NULL,
  `emsc_schd_id` int(11) NOT NULL,
  `emsc_created_at` datetime NOT NULL,
  `emsc_updated_at` datetime NOT NULL,
  `emsc_date` date NOT NULL,
  `emsc_void` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `abs_employee_schedule`
  ADD PRIMARY KEY (`emsc_id`);

ALTER TABLE `abs_employee_schedule`
  MODIFY `emsc_id` int(11) NOT NULL AUTO_INCREMENT;
