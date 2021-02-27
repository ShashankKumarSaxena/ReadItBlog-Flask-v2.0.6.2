-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2021 at 06:09 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskprac2`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `website` text,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(50) DEFAULT 'default_user.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`sno`, `name`, `email`, `website`, `message`, `date`, `image`) VALUES
(1, 'Shashank ', 'shahsank@shahsank.com', 'abcd.com', 'This is a very nice post', '0000-00-00 00:00:00', ''),
(2, 'abcs', 'abcd@abdc.com', '', 'This is a emsssafsaf nj nkn l', '0000-00-00 00:00:00', 'default_user.png'),
(3, 'Test again', 'youremail@gmail.com', '', 'This is my message ', '2020-08-15 13:39:53', ''),
(4, 'hello', 'shashank123@sns.com', '', 'This is a messaghe', '2020-08-15 13:56:34', NULL),
(5, 'Admin', 'admin@admin', '', '@http://127.0.0.1:5000/blog-single/news-ann1\r\nWow! This is very good news \r\n', '2020-08-15 18:42:56', NULL),
(6, 'Admin', 'readit@readit.com', 'https://readit.com', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', '2020-08-15 20:49:33', NULL),
(7, 'shaurya saxena', 'muccusoft@halkat.com', '', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadin ki ek cup chai khud ke sath ho jaye wah taj. neeche bhi hai\r\n\r\n\r\n\r\n\r\n\r\nfadfada bhai fadfada ,fadfada bhai fadfada.neeche bhi hai\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBINOD\r\n\r\n\r\n', '2020-08-16 11:33:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `subject`, `message`, `date`) VALUES
(1, 'test1', 'test1@gmail.com', 'This is a test', 'This is a test message', '2020-08-14 18:48:08'),
(2, 'shashank', 'shahsank@shashank.com', 'shahsank', 'shahsank is hacker\r\nshashank kumar', '2020-08-14 19:20:58'),
(3, 'test send', 'readitoffts2@sns.com', 'This is a test message ', 'This is a test message to locate any issues in database', '2020-08-15 11:37:09'),
(4, 'Shashank', 'vishu@2004admin.com', 'nothing ', 'nothing BINOD', '2020-08-15 18:37:13'),
(5, 'sdas', 'sdas', 'sdsads', 'dsadas', '2020-08-15 18:39:22'),
(6, 'shaurya saxena', 'muccupop@kutta.com', 'muccu is my dog', 'aaj padmavati school ka massage aaya ki \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBINOD', '2020-08-16 11:26:10'),
(7, 'Shashank tes1', 'vishu@readit.com', 'New Message ', 'This is my message for the admin.', '2020-11-11 18:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `main_post_image` text NOT NULL,
  `intro_title` text NOT NULL,
  `intro_para` text NOT NULL,
  `main_title` text NOT NULL,
  `main_para` text NOT NULL,
  `publisher_name` text NOT NULL,
  `publisher_desc` text NOT NULL,
  `sno` int(11) NOT NULL,
  `post_tag` varchar(35) NOT NULL,
  `post_slug` varchar(30) NOT NULL,
  `main_img` text,
  `main_para2` text NOT NULL,
  `pub_img` varchar(55) DEFAULT 'default_user.jpg',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`main_post_image`, `intro_title`, `intro_para`, `main_title`, `main_para`, `publisher_name`, `publisher_desc`, `sno`, `post_tag`, `post_slug`, `main_img`, `main_para2`, `pub_img`, `date`) VALUES
('image_1.jpg', 'This is test post ', 'Test post is test post post is test using database1', 'Test Post', 'THis is jfkd kj kjkl jlk jklj klj kl jlkfjkljdkl jkl jklfjlkdjflsjifjs nljsb jbgk bjbfekj bk', 'Shashank', 'I am hacker!', 1, 'test', 'first-post1', 'image_1.jpg', 'Hello', '', '2020-08-15 19:00:28'),
('image_4.jpg', 'Test post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', 'This is a test post2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat e', 'Shashank', 'Shashank saxena', 2, '', 'second-post1', 'image_3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', '', '2020-11-11 18:33:00'),
('image_6.jpg', 'Lorem ipsum', 'This is a paragraph', 'Test post', 'Image add nahi hor rahi hai abhi?', 'Muccu', 'Muccu is shashank\'s dog', 3, '', 'test-post3', 'image_6.jpg', 'this is main para 2', '', '0000-00-00 00:00:00'),
('image_4.jpg', 'This is intro title', 'This is introduction title', 'This is main title', 'This is main paragraph', 'Shashank Kumar', 'My self', 10, 'Test', 'third-tpost1', 'image_5.jpg', 'This is main para 2', '', '0000-00-00 00:00:00'),
('image_1.jpg', 'This is post from admin panel', 'This post is added from admin panel', 'This is main title', 'This is main para ', 'ADMIN', 'This is admin of blog', 13, 'Test', 'post-4', 'image_1.jpg', 'This is main para2', NULL, '2020-08-15 16:20:49'),
('zee_news.jpg', 'Watch Zee news live from here !!!', 'Now you can watch zee news live from our website by using the link given on the footer.', 'Watch Zee news live!', 'Now you can watch zee news live from our website by using the link given on the footer. This is officially supported by the Zee Network', 'Shashank', 'I am the admin of the blog', 14, 'News', 'news-ann1', 'zee_news.jpg', 'Credits : Zee News, Muccu and Shashank', 'None', '2020-08-15 17:55:14'),
('abp_news.jpg', 'Watch ABP News live from our Website!', 'Now you can watch ABP News live from our webiste using the link given below.', 'News by ABP!', 'Get the latest info around the world by ABP News!', 'Shashank', 'I am the admin', 15, 'News', 'news-ann2', 'abp_news1.jpg', 'Credits : ABP News', 'None', '2020-08-15 18:06:03'),
('image_2.jpg', 'This blog is now officialy up!', 'Welcome to ReadIt powered by ShashankNetSolutions', 'ReadIt is up!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', 'Shashank', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', 16, 'ReadIt', 'readit-news1', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, ad inventore iste sed nesciunt corrupti ea, doloremque optio quia reiciendis deleniti sint dolore, exercitationem consectetur libero accusamus molestiae sunt omnis placeat repellendus fugit laudantium! Libero nobis, tempore itaque fugiat suscipit sequi dolorum sint odio? Veritatis delectus corrupti fugiat odit iste soluta eaque temporibus natus provident commodi pariatur, nemo itaque! Exercitationem, libero fugiat ea vero omnis dolores quis placeat nobis ullam quidem odio officiis facilis pariatur molestias, eaque modi corporis nulla, voluptatum officia iure. Quibusdam tenetur quod itaque nisi ad. Excepturi illum, minus optio hic quaerat ea laboriosam sunt totam officia.', 'None', '2020-08-15 20:48:38'),
('lofi_img1.jpg', 'Lofi Hip Hop is now available on our website!', 'This is to inform all of you that Lofi Hip Hop is now live and streaming on our website. If you want to relax, study or sleep, just listen to them it will be really helpful to you. Trust me!\r\n\r\nLink to listen --> localhost:5000/music-lofi', 'Listen to Lofi', 'I would like to end end my statements right here as there is nothing much to say about it. Just check it out you will surely get to know about it.', 'Shashank', 'I am the admin.', 17, 'Music', 'info-music-lofi1', 'lofi_img1.jpg', 'Credits --> Lofi Hip Hop Radio', 'None', '2020-08-17 22:32:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `sno` (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `post_slug` (`post_slug`),
  ADD UNIQUE KEY `post_slug_2` (`post_slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
