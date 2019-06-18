![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)
---
# Thermal Camera demo application

#### Internal information 
- **Version**        : v1.0.0
- **Date**           : 15/5/2019

## Project description

Ovaj demo projekat ima za cilj da prikaze Termalnu sliku objekta na RGB 64x64 panelu i bitne temperature prikaze na ClickCloud-u.

## Project goals 

Glavna ideja ovog projekta je da se prikaze termalna slika na RGB panel-ima.
Posto se ambientalna temperatura menja i aplikacija zavisi od uslova gde se koristi sada je jednostavno podesiti razliku temperature u odnosu na ambientalnu temperaturu.
Pritiskom na proxFusion click se ulazi u settings mod u kome temperature koja je prikazana kroz boju mozete podesiti i prilagoditi vasim uslovima.
Na Cloudu je omoguceno pracenje ambientalne temperature kao i 3 karakteristicne temperatue: 
Temperatura najmanjeg pixela, najveceg pixela i srednja vrednost temperature svih pixela.  

## Project solved

Korisnik ima potpunu kontrolu u kalibraciji boje temperature pixela koji se pikazuje na RGB panel.
Za analizu i pracene statistike sve globalne informacije su dostupne na ClickCloud-u.

### Design
 
Matrix RGB klik upravlja sa 1 ili vise panela (u nasem demo projektu konkretno su koriscena 4 RGB panela).
IR GRID 2 click cita temperaturnu matricnu sliku objekta u rezoluciji 24x32px a prikazana je prosirena matrica od 48x64px sto daje bolji kvalitet slike.
Korisnik preko web browser-a (cloud aplikacije) moze u svakom trenutku i na svakom mestu da prati stanje temperature.
Reseno je da za svako novo postavaljanja kalibracije temperature boje korisnik ne mora da ponovo programira sistem i da trosi dodatno vreme na programiranje.

### Where it is used

- Sajmovi
- Skole 
- Prezentacije 
- bilo koji drugi vidovi edukativnog i promotivnog prikazivanja

### Hardware

**System**

 - Fusion for ARM v8 
 - MCU kartica STM32F407ZG za pomenuti sistem

**Click boards**

 - Cloud (G2C) click
 - Matrix RGB click
 - ProxFusion click
 - microSD click
 - IR Grid click

**Other hardware**

 - RGB panel 6mm pitch, sa IDC i power kablom, komada 4 
 - DC napajanje, 50W, 5V, 0-10A (http://napajanje.rs/spd/RS-50-5/Mean-Well-RS-50-5-50W-5V-0-10A) 
 - microSD card formatiran na FAT32
 - TFT display v8 5-inch 

## Instructions - hardware

Postaviti pomenutu MCU karticu na STM32 ARM sistem i dovesti napajanje sistema.
Spojiti napajanje sa RGB panelima preko power kablova dobijenih uz svaki RGB panel.
Takodje medjusobno povezati svaki RGB panel uz pomoc IDC kablova takodje dobijenih uz svaki RGB panel.
Semu povezivanja RGB panela preko IDC kablova moguce naci na sledecem linku (http://gitlab/fw-clicks/matrixRGB).
Jedan IDC kabel ide sa prvog RGB panela na Matrix RGB klik.
.RES file prekopirati na vasu SD karticu koja je prethodno formatirana na FAT32..

Tako povezan Matrix RGB klik se postavlja na mikrobus 3 na STM32 razvojnom sistemu, 
G2C (Cloud) klik na mikrobus 4, ProxFusion click na mikrobus 5, dok se IR grid 2 click postavlja na mikrobus 2 a microSD click sa karticom na microbus 1.

### Software

 - mikroC PRO for ARM
 - cloud aplikacija (https://app.clickcloud.io/#/login)

**Library Packages**

 - [G2C click](https://libstock.mikroe.com/projects/view/2628/g2c-click)
 - [mikroSDK](https://libstock.mikroe.com/projects/view/2249/mikrosdk) 
 - [ProxFusion click](https://libstock.mikroe.com/projects/view/2547/proxfusion-2-click)
 - [IR Grid 2 click](https://libstock.mikroe.com/projects/view/2563/ir-grid-2-click)
 - [Matrix RGB click](https://libstock.mikroe.com/projects/view/1840/matrix-rgb-click)

**Architecture**

|        | CEC | MSP | STM | KINETIS | TIVA | AVR | DSPIC | FT90x | PIC | PIC32 |
|--------|-----|-----|-----|---------|------|-----|-------|-------|-----|-------|
|Basic   |  /  |  /  |  /  |    /    |  /   |  /  |   /   |   /   |  /  |   /   |
|C       |  /  |  /  |  X  |    /    |  /   |  /  |   /   |   /   |  /  |   /   |
|Pascal  |  /  |  /  |  /  |    /    |  /   |  /  |   /   |   /   |  /  |   /   |

## Instructions - cloud 

Kreirati device sa vec postojecim (kreiranim) Thermal Camera manifestom.
Zatim izgenerisani device key i password uneti kao parametre u kodu.
Napraviti dashboard za kreirani device koji ce sluziti za pracenje temperatra preko clouda.
Zatim se preko G2C (Cloud) klika konektovati na cloud i proveriti da li je kreirani device-a konektovan (stanje device-a).

## Instructions - software

 - Skinuti i instalirati 'MikroC PRO for ARM' kompajler
 - Skinuti Thermal Camera demo project
 - Instalirati pakete za:
   - mikroSDK
   - G2C click
   - IR Grid 2 click
   - ProxFusion 2 click
   - Matrix RGB click
   
 - Pokrenuti 'MikroC PRO for ARM'
 - Otvoriti G2C - Matrix RGB demo project
 - Proveriti da li su parametri za device key i device password zamenjeni sa izgenerisanim parametrima sa cloud-a
 - Izbildovati projekat
 - Prebaciti RES file na microSD karticu
 - Isprogramirati G2C - Thermal camera demo projekat na 'fusion for ARM v8' sistem 

## Project and click ranges 

 - G2C click board
   - Operating temperature - (-40℃ to 85℃)
   - Operating voltage - (3.0V to 3.6V)
 - Matrix RGB click board
   - Operating temperature - (-40℃ to 85℃)
   - Operating voltage - (3.0V to 3.6V)
 - RGB panels
   - DC source - 5V max

## Project Test 

FW test je izvrsen nekoliko puta u toku i na kraju izrade FW-a za pomenuti projekat pri konstantnom DC izvoru napajanja od 5V.
Korisceno je vise tipova DC napajanja, medju kojima je i onaj nabrojan u opisu HW-a (gore pomenut). 
Prikazivanje i setovanje temperatura pixela je testirano u nekoliko razlicitih uslova i temperaturnih objekata.

## Project upgrades

Unapredjivanje funkcionalnosti projekta je moguce izvrsiti dodavanjem (oduzimanjem po potrebi korisnika) broja RGB panela, koji mogu biti vezani ne samo u kvadratnoj formaciji, 
kako je radjeno u nasem primeru, vec i na red horizontalno, vertikalno, moguce je menjati raspored i broj panela.
Povecanjem broja RGB panela povecava se i rezolucija (koja u nasem slucaju iznosi 64x64, jer su koriscena 4 panela rezolucije 32x32 u kvadtatnoj formaciji vezana na red).
Moguce je dodti i setovanje kalibracije temepature boja koriscenjem aplikacije Click Cloud.
Prosirenje spektra boja temperaturnih pixela.

---
---
