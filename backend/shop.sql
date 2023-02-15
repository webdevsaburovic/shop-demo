-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses_users1_idx` (`user_id`),
  CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `title`) VALUES
(1,	'Shoes'),
(2,	'Electronics'),
(3,	'Classes'),
(4,	'Equipment'),
(5,	'UFO');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE `orders_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`),
  CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `cat_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_ibfk_1` (`cat_id`),
  FULLTEXT KEY `description` (`description`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`id`, `title`, `image`, `images`, `description`, `price`, `quantity`, `short_desc`, `cat_id`) VALUES
(1,	'Swimming Classes',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/swimming-fins-speedo-biofuse.jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/swimming-fins-speedo-biofuse.jpg',	'Swimming classes taught by professionals',	240.99,	0,	'Swimming',	3),
(2,	'Mütze und Brille',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-468490647-612x612.jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-468490647-612x612.jpg',	'Blue-Mütze und Brille\r\n\r\n',	59.99,	51,	'Mütze und Brille',	4),
(3,	'Rettungsring ',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-1190061305-612x612.jpg',	NULL,	'Realistische rot-weiße Rettungsring mit einem Seil. Vektor-Sicherheitstorus\r\n\r\n',	39.99,	69,	'Rettungsring',	5),
(5,	'PlayStation 4',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-687958304-612x612.jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-687958304-612x612+(1).jpg;https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-929234882-612x612.jpg',	'Sony Play Station 4 und Dualshock Videospiel-Konsole\r\n',	555,	12342,	'Gaming console',	2),
(54,	'PlayStation 5',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed.jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed.jpg;https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed+(1).jpg',	'Sony Play Station 5 und Dualshock Videospiel-Konsole\r\n\r\nDescription\r\nStandard Disc Edition 825GB\r\nProcessor: 3.5 GHz AMD x86-64 Ryzen Zen 2 8-core\r\nRAM: 16,000 (MB)\r\nGraphics: 10.3 TFLOPS AMD Radeon RDNA 2\r\nCompatible with: 4K UHD Blu-ray;DVD\r\nWiFi: Yes, Wi-Fi 6\r\nBluetooth: Yes\r\nHDMI connection: Yes\r\nSony Playstation 5 (PS5) 825GB Disc Edition Game Console\r\nHarness the power of a custom processor, graphics processor and SSD with integrated I/O that rewrites the rules of what a PlayStation console can handle. Playstation 5 (PS5) gives you an epic gaming experience with up to 120 fps in compatible games and the console supports 120HZ output on 4K displays.\r\n\r\nPlay your favorite PS5 games on a 4K TV. Backward compatibility: Play PS4™ games on your PS5 console.\r\n\r\nEnjoy faster and smoother refresh rates in select PS4 and PS VR games.\r\n\r\nConnections: HDMI output (8K, HDR) | USB-C Superspeed (10 Gbps) | 2x USB-A Superspeed (10 Gbps) | USB-A Hi-Speed | LAN (Gigabit Ethernet) | WiFi (802.11ac) | Bluetooth 5.1\r\nSpecial Features: Built-in 4K Ultra HD Blu-ray player | Tempest 3D audio technology | Ray tracing acceleration (ray tracing) | 4K 120 FPS',	1600,	133,	'Gaming console',	2),
(55,	'PlayStation 6',	'https://akket.com/wp-content/uploads/2019/07/Sony-PlayStation-6-PS6-1.jpg',	'https://akket.com/wp-content/uploads/2019/07/Sony-PlayStation-6-PS6-1.jpg',	'Sony Play Station 6 und Dualshock Videospiel-Konsole\r\n\r\nPRE-ORDER PRE-ORDER PRE-ORDER',	160011,	133,	'Gaming console',	2),
(56,	'PlayStation 7',	'https://i.ytimg.com/vi/UY7bnLxPE-I/maxresdefault.jpg',	'https://i.ytimg.com/vi/UY7bnLxPE-I/maxresdefault.jpg',	'Sony Play Station 7 und Dualshock Videospiel-Konsole\r\n\r\nPRE-ORDER PRE-ORDER PRE-ORDER',	15553300,	11,	'Gaming console',	2),
(57,	'Mütze und Brille LIMITED EDITION',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-468490647-612x612.jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-468490647-612x612.jpg',	'Blue-Mütze und Brille\r\n\r\n',	1159.99,	15,	'Mütze und Brille SPECIAL',	5),
(58,	'Rettungsring + AI',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/istockphoto-1190061305-612x612.jpg',	NULL,	'Realistische rot-weiße Rettungsring mit einem Seil. Vektor-Sicherheitstorus\r\n\r\n',	391.99,	69,	'Rettungsring',	5),
(59,	'8Bitdo USB Wireless Adapter',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed+(2).jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed+(2).jpg',	'Connect almost any wireless controller to your Switch, PC, Mac, Raspberry Pi and more with the 8bitdo USB Wireless Adapter. The adapter is compatible with all 8BitDo controllers, Xbox Series, Xbox One, PS5, PS4, PS3, Switch Pro, Switch Joy-con, Wii Mote, Wii U Pro and more. Play comfortably wherever you are and no matter what platform you are playing on!',	11,	988,	'Wireless Adapter',	2),
(60,	'JBL Tuner 2 White',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed+(3).jpg',	'https://muamer-saburovic-shop.s3.eu-central-1.amazonaws.com/unnamed+(3).jpg',	'12 hours of playtime\r\nPortable\r\nDAB/DAB+/FM radio\r\nBluetooth\r\nCrystal clear sound\r\nFrom news and weather to music and entertainment, you can enjoy all your favorite radio stations on digital DAB/DAB+ and FM frequencies with crystal-clear JBL Pro audio.\r\n\r\n \r\n\r\nBluetooth wireless streaming\r\nListen to everything you enjoy. Connect the JBL Tuner 2 to your smartphone or tablet via Bluetooth and quickly switch from the radio to your playlists.\r\n\r\n \r\n\r\n12 hours of playtime\r\nPlay longer. Thanks to the built-in battery, you can enjoy your favorite stations for up to 12 hours.\r\n\r\n \r\n\r\nWater resistant according to IPX7\r\nBring your favorite stations to the park or pool. JBL Tuner 2 is water resistant according to IPX7, so you can listen almost anywhere.',	11,	988,	'Radio',	2);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT 'not set',
  `lname` varchar(255) DEFAULT 'not set',
  `age` int(10) DEFAULT '18',
  `role` int(10) DEFAULT '555',
  `photoUrl` text,
  `type` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`, `age`, `role`, `photoUrl`, `type`) VALUES
(1,	'',	'5e8edd851d2fdfbd7415232c67367cc3',	'foo@bar.com',	'developer',	'not set',	18,	777,	NULL,	'local');

-- 2023-02-15 21:34:35
