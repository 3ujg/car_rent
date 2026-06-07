-- Schema for cars table
CREATE TABLE IF NOT EXISTS `cars` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `brand` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `year` INT,
  `registration_number` VARCHAR(50),
  `engine` VARCHAR(100),
  `fuel_type` VARCHAR(50),
  `transmission` VARCHAR(50),
  `seats` INT,
  `price_per_day` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `description` TEXT,
  `image` VARCHAR(255),
  `status` ENUM('available','rented','maintenance') DEFAULT 'available',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
