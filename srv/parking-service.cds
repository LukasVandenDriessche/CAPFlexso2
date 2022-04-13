using sap.cap.parkingapp as my from '../db/data-model';
//using parkingapp as my from '../db/data-model';

@impl: './ParkingService.js'
service ParkingService {
    // entity Lots as projection on my.Lots;
    entity Locations     as projection on my.Locations;

    extend my.Lots with {
        virtual Available : Boolean;
    };

    entity Lots          as projection on my.Lots;
    entity Registrations as projection on my.Registrations;
}
