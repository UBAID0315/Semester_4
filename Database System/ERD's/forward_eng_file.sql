-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Define the schema and set SQL mode
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 ;
USE `mydb`;

-- Payment table
CREATE TABLE IF NOT EXISTS `Payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `amount` DECIMAL(10, 2) NOT NULL,
  `method` ENUM('Cash', 'Jazzcash', 'Easypaisa', 'VISA') NOT NULL,
  `pay_date` DATE NOT NULL,
  `status` TINYINT NOT NULL,
  `notes` TEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Reservation table
CREATE TABLE IF NOT EXISTS `Reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_in_date` DATE NULL,
  `special_request` VARCHAR(255) NULL,
  `Payment_id` INT NOT NULL,
  `preference` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reservation_Payment_idx` (`Payment_id`),
  CONSTRAINT `fk_Reservation_Payment`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `Payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Guest table
CREATE TABLE IF NOT EXISTS `Guest` (
  `id` VARCHAR(50) NOT NULL,
  `name` VARCHAR(70) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(14) NULL,
  `email` VARCHAR(60) NULL,
  `membership` TINYINT NULL,
  `requirement` TEXT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Guest_Reservation table
CREATE TABLE IF NOT EXISTS `Guest_Reservation` (
  `Reservation_id` INT NOT NULL,
  `Guest_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Reservation_id`, `Guest_id`),
  INDEX `fk_Guest_Reservation_Guest1_idx` (`Guest_id`),
  CONSTRAINT `fk_Guest_Reservation_Reservation1`
    FOREIGN KEY (`Reservation_id`)
    REFERENCES `Reservation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guest_Reservation_Guest1`
    FOREIGN KEY (`Guest_id`)
    REFERENCES `Guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Check_Out table
CREATE TABLE IF NOT EXISTS `Check_Out` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tax` DECIMAL(10, 2) NULL,
  `generate_date` DATE NULL,
  `Reservation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Check_Out_Reservation1_idx` (`Reservation_id`),
  CONSTRAINT `fk_Check_Out_Reservation1`
    FOREIGN KEY (`Reservation_id`)
    REFERENCES `Reservation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Feedback table
CREATE TABLE IF NOT EXISTS `Feedback` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ratings` INT NULL,
  `comments` TEXT NULL,
  `Guest_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Feedback_Guest1_idx` (`Guest_id`),
  CONSTRAINT `fk_Feedback_Guest1`
    FOREIGN KEY (`Guest_id`)
    REFERENCES `Guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Report table
CREATE TABLE IF NOT EXISTS `Report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `generate_date` DATE NULL,
  `Guest_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Report_Guest1_idx` (`Guest_id`),
  CONSTRAINT `fk_Report_Guest1`
    FOREIGN KEY (`Guest_id`)
    REFERENCES `Guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Hotel_Property table (renamed due to space)
CREATE TABLE IF NOT EXISTS `Hotel_Property` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `zip_code` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Inventory table
CREATE TABLE IF NOT EXISTS `Inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(20) NULL,
  `item_quantity` INT NULL,
  `item_threshold` INT NULL,
  `Hotel_Property_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Inventory_Hotel_Property1_idx` (`Hotel_Property_id`),
  CONSTRAINT `fk_Inventory_Hotel_Property1`
    FOREIGN KEY (`Hotel_Property_id`)
    REFERENCES `Hotel_Property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Work_Schedule table (renamed due to space)
CREATE TABLE IF NOT EXISTS `Work_Schedule` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `day_of_week` ENUM('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun') NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Staff_Member table
CREATE TABLE IF NOT EXISTS `Staff_Member` (
  `id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(14) NULL,
  `payroll` DECIMAL(10, 2) NULL,
  `Hotel_Property_id` INT NOT NULL,
  `Work_Schedule_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Staff_Member_Hotel_Property1_idx` (`Hotel_Property_id`),
  INDEX `fk_Staff_Member_Work_Schedule1_idx` (`Work_Schedule_id`),
  CONSTRAINT `fk_Staff_Member_Hotel_Property1`
    FOREIGN KEY (`Hotel_Property_id`)
    REFERENCES `Hotel_Property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Staff_Member_Work_Schedule1`
    FOREIGN KEY (`Work_Schedule_id`)
    REFERENCES `Work_Schedule` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Performance Evaluation`
-- -----------------------------------------------------
-- Performance_Evaluation table
CREATE TABLE IF NOT EXISTS `Performance_Evaluation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evaluation_date` DATE NULL,
  `job_knowledge_rating` INT(5) NULL,
  `work_quality_rating` INT(5) NULL,
  `productivity_rating` INT(5) NULL,
  `communication_skill_rating` INT(5) NULL,
  `team_work_rating` INT(5) NULL,
  `overall_rating` INT(5) NULL,
  `comments` TEXT NULL,
  `Staff_Member_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Performance_Evaluation_Staff_Member1_idx` (`Staff_Member_id`),
  CONSTRAINT `fk_Performance_Evaluation_Staff_Member1`
    FOREIGN KEY (`Staff_Member_id`)
    REFERENCES `Staff_Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Permission` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Security`
-- -----------------------------------------------------
-- Security table
CREATE TABLE IF NOT EXISTS `Security` (
  `Staff_Member_id` VARCHAR(20) NOT NULL,
  `Role_id` INT NOT NULL,
  `Permission_id` INT NOT NULL,
  PRIMARY KEY (`Staff_Member_id`, `Role_id`, `Permission_id`),
  INDEX `fk_Security_Role1_idx` (`Role_id`),
  INDEX `fk_Security_Permission1_idx` (`Permission_id`),
  CONSTRAINT `fk_Security_Staff_Member1`
    FOREIGN KEY (`Staff_Member_id`)
    REFERENCES `Staff_Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Security_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Security_Permission1`
    FOREIGN KEY (`Permission_id`)
    REFERENCES `Permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
-- Room table
CREATE TABLE IF NOT EXISTS `Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `room_type` ENUM('Single', 'Double', 'Suite') NULL,
  `capacity` INT(20) NULL,
  `amenities` VARCHAR(255) NULL,
  `availability_status` TINYINT NULL,
  `preference` VARCHAR(50) NULL,
  `Reservation_id` INT NOT NULL,
  `Hotel_Property_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Room_Reservation1_idx` (`Reservation_id`),
  INDEX `fk_Room_Hotel_Property1_idx` (`Hotel_Property_id`),
  CONSTRAINT `fk_Room_Reservation1`
    FOREIGN KEY (`Reservation_id`)
    REFERENCES `Reservation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_Hotel_Property1`
    FOREIGN KEY (`Hotel_Property_id`)
    REFERENCES `Hotel_Property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
