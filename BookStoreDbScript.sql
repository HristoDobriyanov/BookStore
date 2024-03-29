USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 07-Jun-19 13:06:58 ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07-Jun-19 13:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 07-Jun-19 13:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 07-Jun-19 13:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CoverImage] [nvarchar](max) NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowedBooks]    Script Date: 07-Jun-19 13:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowedBooks](
	[BorrowerId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
 CONSTRAINT [PK_BorrowedBooks] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[BorrowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowers]    Script Date: 07-Jun-19 13:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Borrowers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190605094802_InitialMigration', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190607094539_DatesInBorrowedBooks', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190607100149_BorrowedBooksModelUpdated', N'2.2.4-servicing-10062')
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1, N'Terry Pratchett')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (3, N'Isaac Asimov')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1002, N'Robert Jordan')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1003, N'Daniel Kahneman')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1004, N'Frank Herbert')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1005, N'George Orwell')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1006, N'Douglas Adams')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (1, N'The Naked Sun', N'The Naked Sun is a science fiction novel by American writer Isaac Asimov, the second in his Robot series. Like its predecessor, The Caves of Steel, this is a whodunit story. The book was first published in 1957 after being serialized in Astounding Science Fiction between October and December 1956.', N'https://upload.wikimedia.org/wikipedia/en/e/e5/The-naked-sun-doubleday-cover.jpg', 3)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (2, N'The Eye of the World', N'The Eye of the World is a fantasy novel by American writer Robert Jordan, the first book of The Wheel of Time series. It was published by Tor Books and released on January 16, 1990. The unabridged audiobook is read by Michael Kramer and Kate Reading. Upon first publication, The Eye of the World consisted of one prologue and 53 chapters, with an additional prologue authored upon re-release.

', N'https://upload.wikimedia.org/wikipedia/en/0/00/WoT01_TheEyeOfTheWorld.jpg', 1002)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (3, N'The Colour of Magic', N'The Colour of Magic is a 1983 comic fantasy novel by Terry Pratchett, and is the first book of the Discworld series. The first printing of the British edition consisted of 506 copies. Pratchett has described it as "an attempt to do for the classical fantasy universe what Blazing Saddles did for Westerns."', N'https://upload.wikimedia.org/wikipedia/en/4/4d/The_Colour_of_Magic_%28cover_art%29.jpg', 1)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (4, N'Thinking, Fast and Slow', N'Thinking, Fast and Slow is a best-selling book published in 2011 by Nobel Memorial Prize in Economic Sciences laureate Daniel Kahneman. It was the 2012 winner of the National Academies Communication Award for best creative work that helps the public understanding of topics in behavioral science, engineering and medicine.', N'https://upload.wikimedia.org/wikipedia/en/c/c1/Thinking%2C_Fast_and_Slow.jpg', 1003)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (5, N'Mort', N'Mort is a fantasy novel by British writer Terry Pratchett. Published in 1987, it is the fourth Discworld novel and the first to focus on the character Death, who only appeared as a side character in the previous novels. The title is the name of its main character, and is also a play on words: in French, mort means "death". The French language edition is titled Mortimer.', N'https://upload.wikimedia.org/wikipedia/en/9/9e/Mort-cover.jpg', 1)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (6, N'Dune', N'Dune is a 1965 science fiction novel by American author Frank Herbert, originally published as two separate serials in Analog magazine. It tied with Roger Zelazny''s This Immortal for the Hugo Award in 1966, and it won the inaugural Nebula Award for Best Novel. It is the first installment of the Dune saga, and in 2003 was cited as the world''s best-selling science fiction novel.', N'https://upload.wikimedia.org/wikipedia/en/d/de/Dune-Frank_Herbert_%281965%29_First_edition.jpg', 1004)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (7, N'Nineteen Eighty-Four', N'Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English writer George Orwell published in June 1949, whose themes center on the risks of government overreach, totalitarianism and repressive regimentation of all persons and behaviors within society.[2][3] The novel is set in an imagined future, the year 1984, when much of the world has fallen victim to perpetual war, omnipresent government surveillance and propaganda.', N'https://upload.wikimedia.org/wikipedia/en/c/c3/1984first.jpg', 1005)
INSERT [dbo].[Books] ([Id], [Title], [Description], [CoverImage], [AuthorId]) VALUES (8, N'The Hitchhiker''s Guide to the Galaxy', N'The Hitchhiker''s Guide to the Galaxy is the first of six books in the Hitchhiker''s Guide to the Galaxy comedy science fiction "trilogy" by Douglas Adams. The novel is an adaptation of the first four parts of Adams'' radio series of the same name. The novel was first published in London on 12 October 1979.It sold 250,000 copies in the first three months.', N'https://upload.wikimedia.org/wikipedia/en/b/bd/H2G2_UK_front_cover.jpg', 1006)
SET IDENTITY_INSERT [dbo].[Books] OFF
INSERT [dbo].[BorrowedBooks] ([BorrowerId], [BookId], [StartDate], [EndDate]) VALUES (4, 5, CAST(N'2019-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2019-06-28T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Borrowers] ON 

INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (1, N'Иван Иванов', N'София, Иван Вазов 1')
INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (2, N'Драган Драганов', N'София, Васил Левски 7')
INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (3, N'Христо Андреев', N'София, Ботевградско шосе 11')
INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (4, N'Калина Андреева', N'Павликени, Иван Чуков 5')
INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (5, N'Панакуди Димитров', N'Ябланица, Рила 24')
INSERT [dbo].[Borrowers] ([Id], [Name], [Address]) VALUES (6, N'Спаска Спасова', N'Якоруда, Пирин 2')
SET IDENTITY_INSERT [dbo].[Borrowers] OFF
/****** Object:  Index [IX_Books_AuthorId]    Script Date: 07-Jun-19 13:06:58 ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorId] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BorrowedBooks_BorrowerId]    Script Date: 07-Jun-19 13:06:58 ******/
CREATE NONCLUSTERED INDEX [IX_BorrowedBooks_BorrowerId] ON [dbo].[BorrowedBooks]
(
	[BorrowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_AuthorId]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Books_BookId]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Borrowers_BorrowerId] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Borrowers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Borrowers_BorrowerId]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
