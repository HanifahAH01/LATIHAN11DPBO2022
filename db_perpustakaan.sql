/*
Navicat MySQL Data Transfer

Source Server         : MyKomeksi
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_perpustakaan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-05-05 17:33:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_author`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', 'Richard Adkins', 'Senior');
INSERT INTO `author` VALUES ('2', 'Pein Akatsuki', 'Senior');
INSERT INTO `author` VALUES ('4', 'Ken Northwood', 'Senior');
INSERT INTO `author` VALUES ('5', 'ad', 'Senior');
INSERT INTO `author` VALUES ('11', 'Raditya Dika', 'Senior');

-- ----------------------------
-- Table structure for `buku`
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL AUTO_INCREMENT,
  `judul_buku` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_author` int(11) NOT NULL,
  PRIMARY KEY (`id_buku`) USING BTREE,
  KEY `id_author` (`id_author`) USING BTREE,
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of buku
-- ----------------------------
INSERT INTO `buku` VALUES ('1', 'Alan Wade', 'Premium #', 'Cerita dibalik cerita', 'Best Seller', '2');
INSERT INTO `buku` VALUES ('2', 'Awan', 'Akamedia', 'buku tentang cerita awan, hujan, langit', 'Best Seller', '1');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `nim` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  PRIMARY KEY (`nim`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('20000', 'Uzumaki Nartanto', 'Teknik Ninja');
INSERT INTO `member` VALUES ('20004333', 'Julius', 'Psikolog');
INSERT INTO `member` VALUES ('2004305', 'Hidayat', 'TEKNIK FILSAFAT');

-- ----------------------------
-- Table structure for `peminjaman`
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `Buku` int(11) NOT NULL,
  `Member` varchar(50) CHARACTER SET latin1 NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_peminjaman`) USING BTREE,
  KEY `Buku` (`Buku`) USING BTREE,
  KEY `Member` (`Member`) USING BTREE,
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`Buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`Member`) REFERENCES `member` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of peminjaman
-- ----------------------------
INSERT INTO `peminjaman` VALUES ('100', '2', '20000', 'Sudah');
INSERT INTO `peminjaman` VALUES ('104', '1', '20000', 'Dikembalikan');
