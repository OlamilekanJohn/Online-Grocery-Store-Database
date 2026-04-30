-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2026 at 08:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_grocery_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `authorization_path` varchar(255) NOT NULL,
  `authorization_code` int(11) NOT NULL,
  `access_path` varchar(255) NOT NULL,
  `access_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `employee_id`, `authorization_path`, `authorization_code`, `access_path`, `access_code`) VALUES
(1, 1, 'path_1', 234, 'access_1', 478),
(2, 2, 'path_2', 867, 'access_2', 293),
(3, 3, 'path_3', 378, 'access_3', 932);

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `time_stamp` datetime NOT NULL,
  `payment` tinyint(1) NOT NULL,
  `sales` tinyint(1) NOT NULL,
  `inventory` tinyint(1) NOT NULL,
  `report` tinyint(1) NOT NULL,
  `action_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `admin_id`, `description`, `time_stamp`, `payment`, `sales`, `inventory`, `report`, `action_type`) VALUES
(1, 1, 'description_1', '2026-02-01 15:00:00', 1, 0, 0, 0, 'action_type'),
(2, 2, 'description_2', '2026-02-03 14:00:00', 0, 1, 0, 0, 'action_type'),
(3, 3, 'description_3', '2026-02-04 16:00:00', 0, 0, 1, 0, 'action_type');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `inactive` tinyint(1) NOT NULL,
  `items` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `product_id`, `created`, `last_updated`, `active`, `inactive`, `items`) VALUES
(1, 1, 1, '2026-01-19 22:14:00', '2026-01-22 15:09:00', 1, 0, 'westcountry salted butter (250g)'),
(2, 2, 2, '2026-01-20 11:30:00', '2026-01-21 10:15:35', 1, 0, 'silver fields granulated sugar (1kg)'),
(3, 3, 3, '2026-01-22 12:05:18', '2026-01-22 12:28:44', 1, 0, 'valley fresh cherry tomatoes(250g)');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `City_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Postal_code` varchar(20) NOT NULL,
  `Areacode` int(11) NOT NULL,
  `Population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`City_id`, `Name`, `Country`, `Postal_code`, `Areacode`, `Population`) VALUES
(1, 'manchester', 'England', 'M11AD', 161, 2853),
(2, 'newcastle', 'england', 'NE18AF', 191, 8400),
(3, 'bristol', 'england', 'S12BP', 114, 7620);

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `contact_firstname` varchar(50) DEFAULT NULL,
  `contact_middlename` varchar(50) DEFAULT NULL,
  `contact_lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_personemail` varchar(50) DEFAULT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) NOT NULL,
  `address3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `city_id`, `name`, `active`, `inactive`, `contact_firstname`, `contact_middlename`, `contact_lastname`, `email`, `contact_personemail`, `api_key`, `contact`, `address1`, `address2`, `address3`) VALUES
(1, 1, 'northern express logistics', 1, 0, 'steven', 'mark', 'harrison', 'info@northern-express.co.uk', 's.harrison@northern-express.co.uk', 'apikey_1', '01614960552', 'unit 4, distribution way', 'trafford park', 'manchester'),
(2, 2, 'tyne & wear rapid delivery', 1, 0, 'eleanor', 'jane', 'ridley', 'support@tyne-rapid.net', 'e.ridley@tyne-rapid.net', 'apikey_2', '01914960331', 'the depot scotswood', 'business park west', 'newcastle upon tyne'),
(3, 3, 'westcountry courier group', 1, 0, 'christopher', 'paul', 'vance', 'logistics@westcountry-courier.com', 'c.vance@westcountry-courier.com', 'apikey_3', '01174960884', 'bridge house', '45 avonmouth docks', 'bristol');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `male` tinyint(4) NOT NULL,
  `female` tinyint(4) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `order_history` varchar(100) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) NOT NULL,
  `postcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `city_id`, `email`, `dob`, `male`, `female`, `first_name`, `middle_name`, `last_name`, `contact`, `order_history`, `address_line1`, `address_line2`, `postcode`) VALUES
(1, 1, 't.wright85@example.co.uk', '0000-00-00', 1, 0, 'thomas', 'edward', 'wright', '07700900212', 'sugar', '15 high street', 'headingley', 'M11AD'),
(2, 2, 'chloe.higgins92@webmail.com', '0000-00-00', 0, 1, 'chloe', 'marie', 'higgins', '07700900543', 'milk', 'apt 4b, riverside view', 'salford quays', 'M503AZ'),
(3, 3, 'a.macledo79@provider.net', '0000-00-00', 1, 0, 'alistar', 'john', 'macloed', '07700900876', 'ice', '42 breahead road', 'wesr end', 'G128QQ');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `tracking_info` varchar(255) NOT NULL,
  `delivery_cost` int(11) NOT NULL,
  `estimated_deliverydate` date NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) NOT NULL,
  `postcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `courier_id`, `tracking_info`, `delivery_cost`, `estimated_deliverydate`, `address1`, `address2`, `postcode`) VALUES
(1, 1, 'tracking_info_1', 0, '2026-02-02', '142 cavendish road', 'west didsbury', 'M201JG'),
(2, 2, 'tracking_info_2', 0, '2026-03-02', 'apt 24 horizon wharf', 'quayside', 'NE13DX'),
(3, 3, 'tracking_info_3', 0, '2026-04-02', '89 pembroke road', 'clifton', 'BSB3ED');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `discount_code` int(11) NOT NULL,
  `discount_limit` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `inactive` tinyint(1) NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `percentage` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `product_id`, `expiry_date`, `discount_code`, `discount_limit`, `active`, `inactive`, `fixed`, `percentage`, `shipping`) VALUES
(1, 1, '2026-06-13', 452, 'per customer', 1, 0, 1, 0, 0),
(2, 2, '2026-05-10', 678, 'per transaction', 1, 0, 0, 1, 0),
(3, 3, '2026-07-24', 893, 'more than 10 product', 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_firstname` varchar(50) NOT NULL,
  `employee_middlename` varchar(50) NOT NULL,
  `employee_lastname` varchar(50) NOT NULL,
  `employee_address1` varchar(50) NOT NULL,
  `employee_address2` varchar(50) NOT NULL,
  `employee_address3` varchar(50) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `male` tinyint(1) NOT NULL,
  `female` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_firstname`, `employee_middlename`, `employee_lastname`, `employee_address1`, `employee_address2`, `employee_address3`, `contact`, `male`, `female`) VALUES
(1, 'daniel', 'george', 'patterson', '54 highfield terrace', 'sale', 'manchester', '07700900114', 1, 0),
(2, 'hannah', 'elizabeth', 'forster', 'apt 12 grey street apartments', 'city centre', 'newcastle upon tyne', '07700900662', 0, 1),
(3, 'samuel', 'isaac', 'webber', '19 greenbank view', 'easton', 'bristol', '07700900889', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_count` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `last_updated` date NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `instock` tinyint(1) NOT NULL,
  `outofstock` tinyint(1) NOT NULL,
  `discontinued` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `order_id`, `product_id`, `quantity_count`, `date_added`, `last_updated`, `product_name`, `instock`, `outofstock`, `discontinued`) VALUES
(1, 1, 1, 3, '2025-12-05', '2026-01-01', 'salted butter', 1, 0, 0),
(2, 2, 2, 3, '2025-12-06', '2026-01-05', 'sugar', 1, 0, 0),
(3, 3, 3, 3, '2025-11-25', '2026-02-15', 'tomatoes', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `non_admin`
--

CREATE TABLE `non_admin` (
  `employee_id` int(11) NOT NULL,
  `access_request` varchar(255) NOT NULL,
  `request_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `non_admin`
--

INSERT INTO `non_admin` (`employee_id`, `access_request`, `request_date`) VALUES
(4, 'request_1', '2026-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `shipping_fee` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `incomplete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `product_id`, `cart_id`, `discount_id`, `amount`, `date`, `shipping_fee`, `complete`, `incomplete`) VALUES
(1, 1, 1, 1, 3, '2026-02-01', 1, 1, 0),
(2, 2, 2, 2, 1, '2026-03-01', 1, 1, 0),
(3, 3, 3, 3, 3, '2026-04-01', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `ship_address1` varchar(50) NOT NULL,
  `ship_address2` varchar(50) NOT NULL,
  `ship_address3` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `pending` tinyint(1) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `failed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `amount`, `payment_method`, `ship_address1`, `ship_address2`, `ship_address3`, `date`, `pending`, `completed`, `failed`) VALUES
(1, 1, 3, 'credit card', '142 cavendish road', 'west didsbury', 'M201JG', '2026-02-01', 0, 1, 0),
(2, 2, 1, 'debit card', 'Apt 24, horizon whary', 'quayside', 'NE13DX', '2026-03-01', 0, 1, 0),
(3, 3, 2, 'Klarna', '89 pembroke road', 'clifton', 'BS83ED', '2026-04-01', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `warehouse_id`, `vendor_id`, `name`, `description`, `price`, `cost`, `units`, `image`) VALUES
(1, 1, NULL, 'salted butter', '100% british made', 3, 2, 50, 'image1'),
(2, 2, NULL, 'sugar', 'all purpose premium', 2, 1, 100, 'image2'),
(3, NULL, 2, 'vine tomatoes', 'mixed variety', 3, 2, 50, 'image3');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `product_id`, `name`, `description`) VALUES
(1, 1, 'dairy and spreads', 'perishable dairy blocks and spreads requiring constant refrigeration'),
(2, 2, 'pantry staples', 'dry, shelf-stable granulated and sweeteners for baking and beverages'),
(3, 3, 'fresh produce', 'fresh, high-turnover salad vegetables graded by variety and ripeness');

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `detail_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `production_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `specs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`detail_id`, `product_id`, `name`, `production_date`, `expiry_date`, `Brand`, `size`, `volume`, `specs`) VALUES
(1, 1, 'british salted creamery butter', '2026-01-05', '2026-04-05', 'westcountry dairy', 250, 250, 'minimum 80% milk fat, 1.5% salt content. keep refrigerated below 5 degrees. sutable for vegetarians'),
(2, 2, 'fine granulated white sugar', '2025-11-10', '2027-11-10', 'sliver fields', 1, 1, '100% pure cane sugar. fine grain size (0.4mm-0.6mm).store in a cool, dry place.'),
(3, 3, 'premuim vine-ripened cherry tomatoes', '2026-01-19', '2026-01-29', 'valley fresh', 250, 250, 'class i quality 18mm-22mm diameter sweetness ratings (brix) 8.5');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `date_report` date NOT NULL,
  `total_amount` int(11) NOT NULL,
  `opening_stock` int(11) NOT NULL,
  `closing_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `sales_id`, `inventory_id`, `date_report`, `total_amount`, `opening_stock`, `closing_stock`) VALUES
(1, 1, 1, '2026-02-01', 4, 3, 2),
(2, 2, 2, '2026-03-01', 2, 3, 2),
(3, 3, 3, '2026-04-01', 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `return_s`
--

CREATE TABLE `return_s` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `return_date` date NOT NULL,
  `condition_` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return_s`
--

INSERT INTO `return_s` (`return_id`, `order_id`, `reason`, `return_date`, `condition_`) VALUES
(1, 1, 'item damaged', '2026-02-04', 'partially used'),
(2, 2, 'incorrect item recieved', '2026-03-04', 'must be unopened and sealed'),
(3, 3, 'expired upon arrival', '2026-04-04', 'unopended');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` tinyint(1) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `customer_id`, `product_id`, `rating`, `comment`) VALUES
(1, 1, 1, 5, 'incredibly creamy and perfectly salted'),
(2, 2, 2, 5, 'great value for money, the 1kg bag lasts ages'),
(3, 3, 3, 1, 'way too expensive for the amount you get. disappointing');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `payment_id`, `amount`, `sales_date`, `quantity`) VALUES
(1, 1, 4, '2026-02-02', 1),
(2, 2, 2, '2026-03-02', 1),
(3, 3, 3, '2026-04-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_firstname` varchar(50) NOT NULL,
  `contact_middlename` varchar(50) NOT NULL,
  `contact_lastname` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  `contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `city_id`, `name`, `email`, `contact_firstname`, `contact_middlename`, `contact_lastname`, `active`, `inactive`, `contact`) VALUES
(1, 1, 'north west provisions ltd', 'sales@nwprovisions-mcr.co.uk', 'robert', 'paul', 'harrison', 1, 0, 1614960112),
(2, 2, 'city fresh wholesalers', 'orders@cityfresh-ncl.co.uk', 'sarah', 'jane', 'thompson', 1, 0, 1914960774),
(3, 3, 'westcountry fine foods', 'info@westcountry-brsitol.net', 'david', 'anthony', 'clarke', 0, 1, 1174960339);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `closed` tinyint(4) NOT NULL,
  `maintenance` tinyint(4) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) NOT NULL,
  `address_line3` varchar(50) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `operating_hours` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `city_id`, `name`, `email`, `active`, `closed`, `maintenance`, `address_line1`, `address_line2`, `address_line3`, `contact`, `operating_hours`, `capacity`) VALUES
(1, 1, 'titan manchester hub', 'mcr.ops@titannetwork.co.uk', 1, 0, 0, 'unit 8 northpoint', 'tenax road', 'traford park', '01614960221', '24/7 operations', 55000),
(2, 2, 'titan tyne distribution', 'ncl.ops@titannetwork.co.uk', 1, 0, 0, 'beacon', 'kingsway north', 'team valley', '01914960448', '24/7 operations', 32000),
(3, 3, 'titan west gateway', 'brs.ops@titannetwork.co.uk', 0, 0, 1, 'Unit 4A access 18', 'Avonmouth way', 'Bristol', '01174960993', 'closed for maintenance', 28500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `access_path` (`access_path`),
  ADD UNIQUE KEY `authorization_path` (`authorization_path`),
  ADD KEY `fk_admin_employee` (`employee_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_audit_admin` (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_product` (`product_id`),
  ADD KEY `fk_cart_customer` (`customer_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`City_id`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_courier_city` (`city_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_city` (`city_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_delivery_courier` (`courier_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD UNIQUE KEY `discount_code` (`discount_code`),
  ADD KEY `fk_discount_product` (`product_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `fk_inventory_order` (`order_id`),
  ADD KEY `fk_inventory_product` (`product_id`);

--
-- Indexes for table `non_admin`
--
ALTER TABLE `non_admin`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `access_request` (`access_request`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_product` (`product_id`),
  ADD KEY `fk_order_cart` (`cart_id`),
  ADD KEY `fk_order_discount` (`discount_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD KEY `fk_payment_order` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_warehouse` (`warehouse_id`),
  ADD KEY `fk_product_vendor` (`vendor_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `fk_category_product` (`product_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_detail_product` (`product_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_report_sales` (`sales_id`),
  ADD KEY `fk_report_inventory` (`inventory_id`);

--
-- Indexes for table `return_s`
--
ALTER TABLE `return_s`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_return_order` (`order_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `unique_customer_review` (`customer_id`,`product_id`),
  ADD KEY `fk_review_product` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `fk_sales_payment` (`payment_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`),
  ADD KEY `fk_vendor_city` (`city_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_warehouse_city` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `City_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `non_admin`
--
ALTER TABLE `non_admin`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `return_s`
--
ALTER TABLE `return_s`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `courier`
--
ALTER TABLE `courier`
  ADD CONSTRAINT `fk_courier_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`City_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`City_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_delivery_courier` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `fk_discount_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inventory_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_discount` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_category_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `fk_detail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `fk_report_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_report_sales` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `return_s`
--
ALTER TABLE `return_s`
  ADD CONSTRAINT `fk_return_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vendor`
--
ALTER TABLE `vendor`
  ADD CONSTRAINT `fk_vendor_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`City_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `fk_warehouse_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`City_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
