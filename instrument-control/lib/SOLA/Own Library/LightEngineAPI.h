//============================================================================
/// @file LightEngineAPI.h
//
// LightEngine Application Programming Interface
// Collection of "C" style functions for programming light engines
// For documentation see LumencorAPI reference (auto-generated with Doxygen)
//
// Copyright:  Lumencor Inc, 2017
// ============================================================================

#pragma once

#ifdef _WIN32
   #ifdef LUMENCORAPI_EXPORTS
      #define LUM_API __declspec(dllexport) int
   #else
      #define LUM_API __declspec(dllimport) int
#endif
#else
   #define LUM_API
#endif

#ifdef __cplusplus
   extern "C" {
#endif /* __cplusplus */

   #define LUM_API_VERSION "1.0.11"
	#define LUM_PART_NO		"55-10185-Rev-A" 

   #define LUM_MAX_MESSAGE_LENGTH 1024
   #define LUM_DEFAULT_TCP_PORT 8095
   #define LUM_LEGACY_BAUD_RATE 9600
   #define LUM_STANDARD_BAUD_RATE 115200

   #define LUM_OK 0
   #define LUM_API_CALL_FAILED 11001
   #define LUM_ENGINE_NOT_CONNECTED 11002
   #define LUM_COMMAND_TIMED_OUT 11003
   #define LUM_CONNECTION_FAILURE 11004
   #define LUM_STRINGCOPY_ERROR 11005
	#define LUM_CALL_NOT_SUPPORTED 11006
	#define LUM_LEGACY_MODEL_ERR 11007
	#define LUM_INVALID_HANDLE 11008

   typedef int lum_bool;
   #define lum_true 1
   #define lum_false 0

	// legacy light engine models
	enum LEGACY_MODEL
	{
		NONE = 0,
		AURA2,
		LIDA,
		MIRA,
		RETRA,
		SOLASE,
		SOLA,
		SPECTRA7,
		SPECTRAX,
		LUMA
	};

   /**
    * @name DLL Initialization
    * Create and destroy light engine instances
    */
   ///@{
   LUM_API lum_createLightEngine(void** handle);
	LUM_API lum_createLegacyLightEngine(void** handle, LEGACY_MODEL legacyModel);
	LUM_API lum_createLegacyLightEngineByName(void** handle, const char* legacyName);
	LUM_API lum_deleteLightEngine(void* handle);
   LUM_API lum_getAPIVersion(char* versionTxt, int maxLength);
   ///@}

   /**
   * @name Error Handling
   * Obtain specific error information: code and description
   */
   ///@{
   LUM_API lum_getLastErrorText(void* handle, char* errMessage, int maxLength);
   LUM_API lum_getLastErrorCode(void* handle, int* code);
   LUM_API lum_resetError(void* handle);
   ///@}

   /**
    * @name Connection Management
    * Connect light engine instance to specific hardware unit.
    * Only one unit can be connected to one API instance.
    */
   ///@{
   LUM_API lum_connectCOM(void* handle, const char* port, unsigned int baud);
   LUM_API lum_connectTCP(void* handle, const char* ip, unsigned short port);
   LUM_API lum_disconnect(void* handle);
   LUM_API lum_shutDown(void* handle);
   LUM_API lum_restart(void* handle);
   LUM_API lum_getConnected(void* handle, lum_bool* connected);
	LUM_API lum_getLegacy(void* handle, lum_bool* legacy);
   ///@}

   /**
    * @name Information and Status 
    */
   ///@{
   LUM_API lum_getModel(void* handle, char* modelTxt, int length);
   LUM_API lum_getSerialNumber(void* handle, char* serialNumberTxt, int length);
   LUM_API lum_getVersion(void* handle, char* versionTxt, int length);
   LUM_API lum_getIP(void* handle, char* ipTxt, int length);
   LUM_API lum_setIP(void* handle, const char* ipTxt);
   LUM_API lum_getTemperature(void* handle, double* tempC);
   LUM_API lum_getStatusCode(void* handle, int* statusCode);
   ///@}

   /**
   * @name Light Output Control
   * On/Off switching and intensity commands
   */
   ///@{
   LUM_API lum_getMaximumIntensity(void* handle, int* maxint);
   LUM_API lum_getNumberOfChannels(void* handle, int* numChannels);
   LUM_API lum_getChannelName(void* handle, int channelIndex, char* name, int length);
   LUM_API lum_getChannelIndex(void* handle, const char* name, int* channelIndex);

   LUM_API lum_setChannel(void* handle, int channelIndex, lum_bool state);
   LUM_API lum_getChannel(void* handle, int channelIndex, lum_bool* state);
   LUM_API lum_setMultipleChannels(void* handle, lum_bool* stateArray, int numChannels);
   LUM_API lum_getMultipleChannels(void* handle, lum_bool* stateArray, int numChannels);
   LUM_API lum_setIntensity(void* handle, int channelIndex, int intensity);
   LUM_API lum_getIntensity(void* handle, int channelIndex, int* intensity);
   LUM_API lum_setMultipleIntensities(void* handle, int* intensityArray, int numChannels);
   LUM_API lum_getMultipleIntensities(void* handle, int* intensityArray, int numChannels);
   ///@}

   /**
   * @name Power control
   * power measurements and control
   */
   ///@{
   LUM_API lum_getPowerLock(void* handle, lum_bool* enabled);
   LUM_API lum_setPowerLock(void* handle, lum_bool enable);

   LUM_API lum_getChannelPowerCount(void* handle, int channelIndex, int* power);
	LUM_API lum_getChannelPowerMW(void* handle, int channelIndex, double* power);
	LUM_API lum_setPowerReference(void* handle, int* referenceArray, int numChannels);
   LUM_API lum_getPowerReference(void* handle, int** referenceArray, int* numChannels);
   LUM_API lum_getSupplyPowerW(void* handle, double* power);

   ///@}

   /**
    * @name TTL Input Control
    */ 
   ///@{
   LUM_API lum_setTTLEnable(void* handle, lum_bool state);
   LUM_API lum_getTTLEnable(void* handle, lum_bool* state);
   LUM_API lum_setTTLPolarity(void* handle, lum_bool positive);
   LUM_API lum_getTTLPolarity(void* handle, lum_bool* positive);
   ///@}

   /**
    * @name Raw Command Interface
    * Execute arbitrary light engine commands
    */
   ///@{
   LUM_API lum_executeCommand(void* handle, const char* command, char* response, int length);
   ///@}

   /**
   * @name Automation
   */
   ///@{
   LUM_API lum_executeScript(void* handle, const char* script);
   ///@}

#ifdef __cplusplus
   };
#endif /* __cplusplus */

