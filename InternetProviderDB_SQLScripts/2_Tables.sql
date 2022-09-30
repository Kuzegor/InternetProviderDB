use InternetProvider;

create table Companies(
id int identity primary key,
CompanyName nvarchar(60));

create table Houses(
id int identity primary key,
Street nvarchar(60),
HouseNumber nvarchar(10),
EquipmentLocation nvarchar(100),
CompanyId int references Companies(id) on delete set null on update cascade);

create table Clients(
id  int identity primary key,
FirstName nvarchar(60),
LastName nvarchar(60),
MiddleName nvarchar(60),
ApartmentNumber nvarchar(10),
PassportSeries nvarchar(10),
PassportNumber nvarchar(10),
Phone nvarchar(20),
EmailAddress nvarchar(160));

create table Positions(
id int identity primary key,
PositionName nvarchar(60),
Salary money);

create table Employees(
id int identity primary key,
LastName nvarchar(60),
FirstName nvarchar(60),
MiddleName nvarchar(60),
Phone nvarchar(60),
PositionId int references Positions(id) on delete set null on update cascade);

create table ProvidedProducts(
id int identity primary key,
ProductName nvarchar(60),
Price money);

create table Tariffs(
id int identity primary key,
TariffName nvarchar(60),
PricePerMonth money);

create table ProvidedServices(
id int identity primary key,
ServiceName nvarchar(60),
Price money);

create table Transactions(
id int identity primary key,
PaymentDate date,
ClientId int references Clients(id) on delete set null on update cascade,
EmployeeId int references Employees(id) on delete set null on update cascade);

create table Contracts(
id int identity primary key,
TariffId int references Tariffs(id) on delete set null on update cascade,
TermInMonths int,
ConnectionDate date,
DisconnectionDate date,
ClientLogin nvarchar(100) unique,
ClientPassword nvarchar(100) unique,
ContractIsValid bit);

create table SignedContracts(
id int identity primary key,
TransactionId int references Transactions(id) on delete cascade on update cascade,
ContractId int references Contracts(id) on delete cascade on update cascade);

create table PurchasedProducts(
id int identity primary key,
TransactionId int references Transactions(id) on delete cascade on update cascade,
ProductId int references ProvidedProducts(id) on delete cascade on update cascade);

create table PurchasedServices(
id int identity primary key,
TransactionId int references Transactions(id) on delete cascade on update cascade,
ServiceId int references ProvidedServices(id) on delete cascade on update cascade);

create table ClientHouses(
id int identity primary key,
ClientId int references Clients(id) on delete cascade on update cascade,
HouseId int references Houses(id) on delete cascade on update cascade);


