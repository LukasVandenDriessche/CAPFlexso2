namespace sap.cap.parkingapp;

entity Locations
{
    key Id : UUID;
    name : String;
    lots : Association to many Lots on lots.location = $self;
    registrations : Association to many Registrations on registrations.location = $self;
}

entity Lots
{
    key Id : UUID;
    nr : Integer;
    floor : String;
    available : Lots.available;
    location : Association to one Locations;
}

entity Registrations
{
    key Id : UUID;
    time : DateTime;
    location : Association to Locations;
    registeredlots : Association to many RegisteredLots on registeredlots.registration = $self;
}

entity RegisteredLots 
{
    key Id : UUID;
    originalLotId : String;
    nr : Integer;
    floor : String;
    available : Lots.available;
    registration : Association to one Registrations;
}

type Lots.available : String enum
{
    occupied;
    free;
}
