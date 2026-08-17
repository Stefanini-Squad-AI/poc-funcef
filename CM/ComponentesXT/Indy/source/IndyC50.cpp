//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("IndyC50.res");
USEPACKAGE("vcl50.bpi");
USERES("IdRegister.dcr");
USEUNIT("IdAntiFreeze.pas");
USEUNIT("IdAntiFreezeBase.pas");
USEUNIT("IdBaseComponent.pas");
USEUNIT("IdChargenServer.pas");
USEUNIT("IdCoder.pas");
USEUNIT("IdCoder3To4.pas");
USEUNIT("IdCoderIMF.pas");
USEUNIT("IdCoderMessageDigest.pas");
USEUNIT("IdCoderText.pas");
USEUNIT("IdComponent.pas");
USEUNIT("IdDateTimeStamp.pas");
USEUNIT("IdDayTime.pas");
USEUNIT("IdDayTimeServer.pas");
USEUNIT("IdDICTServer.pas");
USEUNIT("IdDiscardServer.pas");
USEUNIT("IdDNSResolver.pas");
USEUNIT("IdEcho.pas");
USEUNIT("IdEchoServer.pas");
USEUNIT("IdEMailAddress.pas");
USEUNIT("IdException.pas");
USEUNIT("IdFinger.pas");
USEUNIT("IdFingerServer.pas");
USEUNIT("IdFTP.pas");
USEUNIT("IdGlobal.pas");
USEUNIT("IdGopher.pas");
USEUNIT("IdGopherConsts.pas");
USEUNIT("IdGopherServer.pas");
USEUNIT("IdHeaderCoder.pas");
USEUNIT("IdHeaderList.pas");
USEUNIT("IdHostnameServer.pas");
USEUNIT("IdHTTP.pas");
USEUNIT("IdHTTPServer.pas");
USEUNIT("IdIcmpClient.pas");
USEUNIT("IdIMAP4Server.pas");
USEUNIT("IdIntercept.pas");
USEUNIT("IdIPWatch.pas");
USEUNIT("IdIrcServer.pas");
USEUNIT("IdLogBase.pas");
USEUNIT("IdLogDebug.pas");
USEUNIT("IdMappedPortTCP.pas");
USEUNIT("IdMessage.pas");
USEUNIT("IdMessageClient.pas");
USEUNIT("IdMIMETypes.pas");
USEUNIT("IdNetworkCalculator.pas");
USEUNIT("IdNNTP.pas");
USEUNIT("IdNNTPServer.pas");
USEUNIT("IdPOP3.pas");
USEUNIT("IdQotd.pas");
USEUNIT("IdQotdServer.pas");
USEUNIT("IdRawBase.pas");
USEUNIT("IdRawClient.pas");
USEUNIT("IdRawFunctions.pas");
USEUNIT("IdRawHeaders.pas");
USEUNIT("IdResourceStrings.pas");
USEUNIT("IdSimpleServer.pas");
USEUNIT("IdSMTP.pas");
USEUNIT("IdSNTP.pas");
USEUNIT("IdSocketHandle.pas");
USEUNIT("IdSocks.pas");
USEUNIT("IdSSLIntercept.pas");
USEUNIT("IdSSLOpenSSL.pas");
USEUNIT("IdSSLOpenSSLHeaders.pas");
USEUNIT("IdStack.pas");
USEUNIT("IdStackConsts.pas");
USEUNIT("IdStackWinsock.pas");
USEUNIT("IdTCPClient.pas");
USEUNIT("IdTCPConnection.pas");
USEUNIT("IdTCPServer.pas");
USEUNIT("IdTelnet.pas");
USEUNIT("IdTelnetServer.pas");
USEUNIT("IdThread.pas");
USEUNIT("IdThreadMgr.pas");
USEUNIT("IdThreadMgrDefault.pas");
USEUNIT("IdThreadMgrPool.pas");
USEUNIT("IdTime.pas");
USEUNIT("IdTimeServer.pas");
USEUNIT("IdTrivialFTP.pas");
USEUNIT("IdTrivialFTPBase.pas");
USEUNIT("IdTrivialFTPServer.pas");
USEUNIT("IdTunnelCommon.pas");
USEUNIT("IdTunnelMaster.pas");
USEUNIT("IdTunnelSlave.pas");
USEUNIT("IdUDPBase.pas");
USEUNIT("IdUDPClient.pas");
USEUNIT("IdUDPServer.pas");
USEUNIT("IdURI.pas");
USEUNIT("IdVCard.pas");
USEUNIT("IdWhois.pas");
USEUNIT("IdWhoIsServer.pas");
USEUNIT("IdWinsock.pas");

//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
