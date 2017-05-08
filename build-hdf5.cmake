set(CTEST_BUILD_NAME "$ENV{SGEN}-hdf5")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/hdf5-1.8.14/hdf5-1.8.14")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/hdf5-1.8.14/hdf5-1.8.14")

set(BUILD_OPTIONS 
-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/bin
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/hdf5-1.8.14/${CONF_DIR}/bin
-DMSVC12_REDIST_DIR:PATH=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/VC/redist
-DBUILD_SHARED_LIBS:BOOL=ON
-DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON
-DHDF5_ENABLE_SZIP_SUPPORT:BOOL=ON
-DHDF5_BUILD_HL_LIB:BOOL=ON
-DSZIP_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/build/hdf5-1.8.14/SZip
-DZLIB_DIR:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/build/hdf5-1.8.14/ZLib
-DSZIP_INCLUDE_DIRS:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/SZip/${CONF_DIR}/include
-DZLIB_INCLUDE_DIRS:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-1.8.14/ZLib/${CONF_DIR}/include
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET INSTALL)
