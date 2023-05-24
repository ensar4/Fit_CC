using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace hackhaton_API.Migrations
{
    /// <inheritdoc />
    public partial class baza : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Home",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Adresa = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Home", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Klima",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Stanje = table.Column<bool>(type: "bit", nullable: false),
                    Temperatura = table.Column<int>(type: "int", nullable: false),
                    Mod = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BrzinaPuhanja = table.Column<int>(type: "int", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Klima", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Klima_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Korisnik",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Prezime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BrojTelefona = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Mail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Korisnik", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Korisnik_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Kuhalo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StanjeStruje = table.Column<bool>(type: "bit", nullable: false),
                    VrijemeGasenja = table.Column<DateTime>(type: "datetime2", nullable: true),
                    VrijemePaljenja = table.Column<DateTime>(type: "datetime2", nullable: true),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kuhalo", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Kuhalo_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MotionSensor",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PokretDetektovan = table.Column<bool>(type: "bit", nullable: false),
                    OsobaPala = table.Column<bool>(type: "bit", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MotionSensor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MotionSensor_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Pegla",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StanjeStruje = table.Column<bool>(type: "bit", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pegla", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pegla_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProciscivacZraka",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Stanje = table.Column<bool>(type: "bit", nullable: false),
                    VlaznostZraka = table.Column<int>(type: "int", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProciscivacZraka", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProciscivacZraka_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Prozori",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    otvoren = table.Column<bool>(type: "bit", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Prozori", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Prozori_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "RobotskiUsisivac",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Stanje = table.Column<bool>(type: "bit", nullable: false),
                    VrijemePaljenja = table.Column<DateTime>(type: "datetime2", nullable: false),
                    VrijemeGasenja = table.Column<DateTime>(type: "datetime2", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RobotskiUsisivac", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RobotskiUsisivac_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SenzorDima",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Stanje = table.Column<bool>(type: "bit", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SenzorDima", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SenzorDima_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Tlakomjer",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OtkucajiSrca = table.Column<int>(type: "int", nullable: false),
                    Tlak = table.Column<int>(type: "int", nullable: false),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tlakomjer", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Tlakomjer_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Vrata",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Stanje = table.Column<bool>(type: "bit", nullable: false),
                    VrijemeZakljucavanja = table.Column<DateTime>(type: "datetime2", nullable: true),
                    VrijemeOtkljucavanja = table.Column<DateTime>(type: "datetime2", nullable: true),
                    HomeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vrata", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Vrata_Home_HomeId",
                        column: x => x.HomeId,
                        principalTable: "Home",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Klima_HomeId",
                table: "Klima",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Korisnik_HomeId",
                table: "Korisnik",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Kuhalo_HomeId",
                table: "Kuhalo",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_MotionSensor_HomeId",
                table: "MotionSensor",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Pegla_HomeId",
                table: "Pegla",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_ProciscivacZraka_HomeId",
                table: "ProciscivacZraka",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Prozori_HomeId",
                table: "Prozori",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_RobotskiUsisivac_HomeId",
                table: "RobotskiUsisivac",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_SenzorDima_HomeId",
                table: "SenzorDima",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Tlakomjer_HomeId",
                table: "Tlakomjer",
                column: "HomeId");

            migrationBuilder.CreateIndex(
                name: "IX_Vrata_HomeId",
                table: "Vrata",
                column: "HomeId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Klima");

            migrationBuilder.DropTable(
                name: "Korisnik");

            migrationBuilder.DropTable(
                name: "Kuhalo");

            migrationBuilder.DropTable(
                name: "MotionSensor");

            migrationBuilder.DropTable(
                name: "Pegla");

            migrationBuilder.DropTable(
                name: "ProciscivacZraka");

            migrationBuilder.DropTable(
                name: "Prozori");

            migrationBuilder.DropTable(
                name: "RobotskiUsisivac");

            migrationBuilder.DropTable(
                name: "SenzorDima");

            migrationBuilder.DropTable(
                name: "Tlakomjer");

            migrationBuilder.DropTable(
                name: "Vrata");

            migrationBuilder.DropTable(
                name: "Home");
        }
    }
}
