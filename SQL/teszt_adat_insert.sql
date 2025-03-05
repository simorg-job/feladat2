-- --------------------------------------------------------
-- Hoszt:                        127.0.0.1
-- Szerver verzió:               Microsoft SQL Server 2022 (RTM-GDR) (KB5046861) - 16.0.1135.2
-- Szerver OS:                   Windows 10 Pro 10.0 <X64> (Build 26100: ) (Hypervisor)
-- HeidiSQL Verzió:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Tábla adatainak mentése KulcsSoftCompanyOrders.Customers: 6 rows
DELETE FROM "Customers";
/*!40000 ALTER TABLE "Customers" DISABLE KEYS */;
INSERT INTO "Customers" ("CustomerID", "LastName", "FirstName", "ZipCode", "City", "Street", "HouseNum", "Telephone", "Email") VALUES
	(1, 'Minta', 'Elek', '1111', 'Budapest', 'Valahol utca', '32', '+36 20 123 4567', 'minta.elek@sample.com'),
	(2, 'Sample', 'Gizella', '1234', 'Budapest', 'Minta utca', '12', '-', 'sample.gizella@valahol.hu'),
	(4, 'Example', 'Edömér', '7140', 'Bátaszék
', 'Budai utca', '34', NULL, NULL),
	(5, 'Minta', 'Ottó', '5623
', 'Békéscsaba
', 'Szarvasi utca', '22', NULL, NULL),
	(7, 'Hajdan', 'Hajnal', '8181
', 'Berhida
', 'Veszprémi út', '55', NULL, NULL),
	(8, 'Noha', 'Álmos', '2051
', 'Biatorbágy
', 'Budai utca', '12', '123456', NULL);
/*!40000 ALTER TABLE "Customers" ENABLE KEYS */;

-- Tábla adatainak mentése KulcsSoftCompanyOrders.OrderItems: 8 rows
DELETE FROM "OrderItems";
/*!40000 ALTER TABLE "OrderItems" DISABLE KEYS */;
INSERT INTO "OrderItems" ("OrderItemID", "OrderID", "ProductID", "Quantity", "Price") VALUES
	(8, 2, 2, 10, 10),
	(10, 2, 4, 10, 10),
	(11, 2, 6, 2, 1000),
	(12, 4, 10, 2, 300),
	(13, 4, 8, 5, 1000),
	(14, 4, 2, 2, 10),
	(16, 9, 6, 10, 100),
	(17, 9, 8, 2, 30);
/*!40000 ALTER TABLE "OrderItems" ENABLE KEYS */;

-- Tábla adatainak mentése KulcsSoftCompanyOrders.Orders: 5 rows
DELETE FROM "Orders";
/*!40000 ALTER TABLE "Orders" DISABLE KEYS */;
INSERT INTO "Orders" ("OrderID", "OrderNum", "OrderDate", "CustomerID") VALUES
	(2, '2025/0001', '2025-01-01 12:00:00.000', 1),
	(4, '2025/0002', '2025-01-11 12:22:00.000', 2),
	(5, '2024/1123', '2024-11-11 11:11:11.000', 2),
	(6, '2023/3300', '2023-11-30 10:12:44.000', 4),
	(9, '2025/0003', '2025-03-05 18:17:00.000', 5);
/*!40000 ALTER TABLE "Orders" ENABLE KEYS */;

-- Tábla adatainak mentése KulcsSoftCompanyOrders.Products: 7 rows
DELETE FROM "Products";
/*!40000 ALTER TABLE "Products" DISABLE KEYS */;
INSERT INTO "Products" ("ProductID", "Name", "Price", "Description") VALUES
	(2, 'Sample Product 1', 10.2, NULL),
	(4, 'Sample product 2', 10, NULL),
	(6, 'Light bulb', 1.2, NULL),
	(7, 'Old textbook', 5.3, NULL),
	(8, 'Mobile phone', 100.3, NULL),
	(9, 'Basket ball plastic', 12.12, NULL),
	(10, 'Math textbook', 1.22, NULL);
/*!40000 ALTER TABLE "Products" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
