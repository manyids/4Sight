# include
# include
# include
# include
# include
# include
# include
# include
< boost / archive / b in ar y _o ar ch i ve . hpp >
< boost / serialization / vector . hpp >
< boost / foreach . hpp >
< boost / random . hpp >
< fstream>
< ostream>
< sstream>
< boost / timer . hpp >
void testingSerialization1(){
// start timer
boost :: timer t ;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Random Number generator setup
unsigned long seed =89210;
std :: stringstream stream ; stream << seed ;
// create and open an archive for output
std :: string filename ( " C :\\ Boost \\ S e r i a l i z a t i o n \\ " );
filename += " n o r m a l _ m t _ " + stream . str ()+ " . bin " ;
//
std :: ofstream ostr ( filename . c_str () , std :: ios :: binary );
boost :: archive :: bi na ry _ oa rc hi v e oa ( ostr );
// setup random number generators
boost :: mt19937 rng ( seed );
boost :: normal_distribution < > norm ;
boost :: variate_generator < boost :: mt19937 & , boost :: normal_distribution < > > normGen ( rng , norm );
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
int numVars =5000000;
std :: vector < double > myVec ( numVars );
BOOST_FOREACH ( double & x , myVec )
x = normGen ();
// serialize myVec
oa << myVec ;
// close file
ostr . close ();
std :: cout << " Elapsed time : " << t . elapsed () << std :: endl ;
}