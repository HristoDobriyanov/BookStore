﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace BookStore.Web.Migrations
{
    public partial class DatesInBorrowedBooks : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "EndDate",
                table: "BorrowersBooks",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "StartDate",
                table: "BorrowersBooks",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EndDate",
                table: "BorrowersBooks");

            migrationBuilder.DropColumn(
                name: "StartDate",
                table: "BorrowersBooks");
        }
    }
}
