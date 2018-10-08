/*******************************************************************************
*
* Justin M Selfridge, PhD
* Gradient Consulting, LLC
* jselfridge@gmail.com
*
* main.c
* Entry point for the 'XPlane_Sim' source code.
*
*******************************************************************************/
#include "main.h"




/*******************************************************************************
* int main ( void )
* Primary function for the running the 'XPlane_Sim' program.
*******************************************************************************/
int main( void ) {

  // Begin the program
  #ifdef DEBUG
    printf("\nBegin XPlane_Sim program\n");
  #endif

  // Exit program
  return 0;
}




/*
// Copied from example code...

  // Open Socket
  const char* IP = "127.0.0.1";
  XPCSocket sock = openUDP(IP);
  float tVal[1];
  int tSize = 1;
  if( getDREF( sock, "sim/test/test_float", tVal, &tSize ) < 0 ) {
    printf( "Error (main): Unable to read data from X-Plane. /n" );
    return EXIT_FAILURE;
  }

  // Set Location/Orientation (sendPOSI)
  // Set Up Position Array
  float POSI[9] = { 0.0f };
  POSI[0] = 37.524;     // Lat
  POSI[1] = -122.06899; // Lon
  POSI[2] = 2500;       // Alt
  POSI[3] = 0;          // Pitch
  POSI[4] = 0;          // Roll
  POSI[5] = 0;          // Heading
  POSI[6] = 1;          // Gear

  // Set position of the player aircraft
  sendPOSI( sock, POSI, 7, 0 );

  POSI[0] = 37.52465;   // Move a second aircraft a bit North of us
  POSI[4] = 20;         // Give that aircraft a bit or right roll

  // Set position of a multiplayer aircraft
  sendPOSI( sock, POSI, 7, 1 );

  // Set Rates (sendDATA)
  float data[3][9] = { 0.0f };

  // Initialize data values to -998 to not overwrite values.
  for( int i=0; i<3; i++ ) {
    for( int j=0; j<9; j++ ) {
      data[i][j] = -998.0f;
    }
 }

  // Set up Data Array (first item in row is item number (example: 20=position)
  data[0][0] = 18; // Alpha
  data[0][1] = 0;
  data[0][3] = 0;

  data[1][0] = 3;  //Velocity
  data[1][1] = 130;
  data[1][2] = 130;
  data[1][3] = 130;
  data[1][4] = 130;

  data[2][0] = 16; //PQR
  data[2][1] = 0;
  data[2][2] = 0;
  data[2][3] = 0;

  sendDATA( sock, data, 3 );

  // Set throttle on the player aircraft using sendCTRL
  float CTRL[5] = { 0.0 };
  CTRL[3] = 0.8;  // Throttle
  sendCTRL( sock, CTRL, 5, 0 );

  // pauseSim
  pauseSim( sock, 1 );  // Sending 1 to pause
  sleep(5);  // Pause for 5 seconds

  // Unpause
  pauseSim( sock, 0 );  // Sending 0 to unpause
  printf("- Resuming Simulation\n");

  // Simulate for 10 seconds
  sleep(10);

  // SendDREF (Landing Gear)
  printf("- Stowing Landing Gear\n");
  const char* dref = "sim/cockpit/switches/gear_handle_status";  // Gear handle data reference
  float gear = 0.0f;  // Stow gear
  sendDREF( sock, dref, &gear, 1 );  // Set gear to stow

  // Simulate for 10 seconds
  sleep(10);

  // Check Landing gear, Pause
  printf("- Confirming Gear Status\n");
  const char* drefs[2] =
  {
    "sim/cockpit/switches/gear_handle_status",
    "sim/operation/override/override_planepath"
  };

  float* results[2];
  int sizes[2] = { 20, 20 };
  for( int i=0; i<2; ++i ) {
    results[i] = (float*)malloc( 20 * sizeof(float) );
  }
  getDREFs( sock, drefs, results, 2, sizes );

  if( results[0][0] >= 0.0f && results[0][0] <= 0.0f ) {
    printf("\tGear Stowed\n");
  }
  else {
    printf("\tERROR: Gear Stowage unsuccessful\n");
  }

  printf("---End Program---\n");
*/




