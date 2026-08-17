{ --------------------------------------------------------------------------------------------------
Rotina......: ConectaServidor -> SetupServidor
Nº SOL......: 262702/18060
Nº KINTANA..: 1239390
Data........: 23/10/2015
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração automática para SHARED AUTOCOMMIT para o módulo do Empréstimo
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144043
Nº KINTANA..: 943598
Data........: 16/09/2010
Responsável.: Thaise Amaral Martins
Descrição...: Na Função 'SetupServidor', colocar o Blob Size em 9999 ao invés de 2000 para
              que ele aceite arquivos acima de 2MB.
-------------------------------------------------------------------------------------------------- }

{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCmConectaBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMDatabase, uSistema, dB, dbTables, wwQuery, uMensErro, dBaseDados, FileCtrl,
  UDataBase, RipeMD;

type
  TCmConectaBanco = class
  private
    { Private declarations }
    Procedure AlteraAfonsoPenna(sIdUsuario, sNomeUsuario :String;db :TDataBase);
  protected
    { Protected declarations }
  public
    { Public declarations }
    Class function GetSenhaUsuario(sUsuariobanco, sUsuarioSistema :String; bUpper: Boolean) :String;
    function ConectaServidor :boolean;
    function Conectar(db :TDataBase) :boolean;

  published
    { Published declarations }
  end;

Var
  CmConectaBanco :TCmConectaBanco;

implementation

Uses uCMTypes, JclFileUtils, uCMRegister;

CONST
   GERACM0 = 'CMLUA';
   GERACHAVE = 'CMSOL';
   CONSTCRIPTO = '1';

function TCmConectaBanco.ConectaServidor : boolean;
var
  Driver, Alias, NomeServidor : string;

procedure PreencheParams(var db : TCMDataBase; Tipo : TTipoServidor);
var
   aNomes, aValores : TStringList;
   i : integer;
begin
     with db do
     begin
          aNomes   := TStringList.Create;
          aValores := TStringList.Create;
          case Tipo of
               tsLocal :
               begin
                    Driver := Sistema.DriverServidor;
                    Sistema.GetServidorParams(tsLocal,aNomes,aValores);
                    Alias := Sistema.AliasServidor;
                    NomeServidor := Sistema.NomeServidor;
               end;

               tsRemoto :
               begin
                    Driver := Sistema.DriverServidorRemoto ;
                    Sistema.GetServidorParams(tsRemoto,aNomes,aValores);
                    Alias := Sistema.AliasServidorRemoto;
                    NomeServidor := Sistema.NomeServidorSecundario;
               end;
          end;
          DriverName  := Driver ;

          If Sistema.ConnectionSide = cnsServer Then Session.GetDriverParams(Driver, Params);

          for i := 0 to aNomes.Count-1 do
              Params.Values[aNomes[i]] := aValores[i];
          aNomes.free;
          aValores.free;
     end;
end;

function SetupServidor(Tipo:TTipoServidor; db : TCMDataBase) : Boolean;
begin
     with db do
     begin
          PreencheParams(db, Tipo);

          Sistema.CarregaDadosConexao;

          if AnsiUpperCase(Driver) = AnsiUpperCase(DriverOracle) then
          begin
               Params.Values['SERVER NAME']  := Alias ;
               if not Sistema.UsuarioUnico then
               begin
                  Params.Values['USER NAME']    := 'CM0' ;
                  Params.Values['PASSWORD']     := GetSenhaUsuario('CM0',GERACM0,True);
               end
               else
               begin
                  Params.Values['USER NAME']    := Sistema.UserUnico;
                  Params.Values['PASSWORD']     := Sistema.SenhaUserUnico;
               end;

               Params.Values['NET PROTOCOL'] := 'TNS' ;
               Params.Values['BLOB SIZE'] := '9999' ;
               Params.Values['BLOBS TO CACHE'] := '1024' ;

               // FHBS SOL 262702/18060 PPM 1239390 23/10/2015 - Alteração automática para SHARED AUTOCOMMIT para o módulo do Empréstimo
               if Sistema.IdModulo = 15 then Params.Values['SQLPASSTHRU MODE'] := 'SHARED AUTOCOMMIT';
               if Sistema.IdModulo = 4  then Params.Values['SQLPASSTHRU MODE'] := 'SHARED NOAUTOCOMMIT';

          end
          else
             if AnsiUpperCase(Driver) = 'STANDARD' then
             begin
                  Params.Values['PATH'] := Alias;
             end
             else
               if AnsiUpperCase(Driver) = AnsiUpperCase(DriverDB2) then
               begin
                    Params.Values['DB2 DSN']      := Alias ;
                    Params.Values['USER NAME']    := 'cm0' ;
                    Params.Values['PASSWORD']     := 'apenna';
               end
               Else
                  if AnsiUpperCase(Driver) = AnsiUpperCase(DriverSQL) then
                  begin
                       Params.Values['DATABASE NAME']      := Alias ;
                       Params.Values['SERVER NAME']      := NomeServidor ;
                       Params.Values['USER NAME']    := 'CM' ;
                       Params.Values['PASSWORD']     := 'CMSOL';
                  end
                  Else
                     if AnsiUpperCase(Driver) = AnsiUpperCase(DriverSQLODBC) then
                     begin
                          Params.Values['ODBC DSN']   := NomeServidor ;
                          Params.Values['USER NAME']     := 'cm' ;
                          Params.Values['PASSWORD']      := 'cmsol';
                     end
                       Else
                          if AnsiUpperCase(Driver) = AnsiUpperCase(DriverPGODBC) then
                          begin
                               Params.Values['ODBC DSN']   := NomeServidor ;
                               Params.Values['USER NAME']     := 'CM' ;
                               Params.Values['PASSWORD']      := 'CMSOL';
                          end;


          if Conectar(db) then
          begin
             Result := true;
             Sistema.UsuarioUnico := Sistema.RetornaTipoConexao;
          end
          else
          begin
               MsgDlg( 'Não foi possível conectar com o serviço '+Driver+'/'+
                       Alias, 'Conexão com o servidor de banco de dados', mtError, [mbOk],0);
               Result := false;
          end;
     end;
end;

begin
     Sistema.CarregaDadosConexao;

     if Sistema.UsuarioUnico then
     begin
        Result := Sistema.VersaoOk;
        if Not Result then Application.Terminate;
     end;

     Result := SetupServidor(tsLocal, DtmBaseDados.dbBaseDados);

     if Result And (Sistema.ConnectionSide = CnsServer) then
     begin
       PreencheParams( DtmBaseDados.dbBaseSegur, tsLocal);
       DtmBaseDados.dbBaseSegur.Params.Values['SERVER NAME']  := Alias;
       DtmBaseDados.dbBaseSegur.Params.Values['USER NAME']    := 'CMDBA' ;
       DtmBaseDados.dbBaseSegur.Params.Values['PASSWORD']     := 'lsbispo57645' ;
       DtmBaseDados.dbBaseSegur.Params.Values['NET PROTOCOL'] := 'TNS' ;
       if (Sistema.ConectaRemoto) then Result := SetupServidor(tsRemoto, DtmBaseDados.dbBaseRemota);
     end;
end;

function TCmConectaBanco.Conectar(db : TDataBase) : boolean ;
var
   lFim : boolean;
   Tentativas : integer;
   iDir : integer;
   sUserName,  sNomeUsuario :String;
begin
     lFim := false;
     Tentativas := 0;
     Result := false;

     if (db.Connected) and  (Sistema.UsuarioUnico) then
        Sistema.AtualizaCMUserID(2,-1);

     while not lFim do
     begin
          try
             with db do
             begin
                Close;


                sUserName := Params.Values['USER NAME'];

                If (UpperCase(sUserName) = 'CM0') Then
                   sNomeUsuario := GERACM0
                Else
                   sNomeUsuario := Sistema.NomeUsuario;

                If Sistema.DriverServidor = DriverDb2 Then
                   Params.Values['PASSWORD'] := 'apenna'
                Else
                   If Sistema.DriverServidor = DriverSQL Then
                      Params.Values['PASSWORD'] := 'CMSOL'
                   Else
                      If Sistema.DriverServidor = DriverSQLODBC Then
                         Params.Values['PASSWORD'] := 'cmsol'
                      Else
                         If Sistema.DriverServidor = DriverPGODBC Then
                            Params.Values['PASSWORD'] := 'CMSOL'
                         Else
                             if not Sistema.UsuarioUnico then
                                Params.Values['PASSWORD'] := GetSenhaUsuario(sUserName,sNomeUsuario,True)
                             else
                                Params.Values['PASSWORD'] := Sistema.SenhaUserUnico;

                If Sistema.ConnectionSide = cnsServer Then
                Begin
                   RemoveDir(db.Session.PrivateDir);

                   With TCmRegister.Create Do
                     Try


                       iDir := 0;

                       repeat
                         Inc(iDir);
                       until (not DirectoryExists(Sistema.TempDir+db.Name+IntToStr(iDir)));



                       ForceDirectories(Sistema.TempDir+ db.Name + IntToStr(iDir));

                       db.Session.PrivateDir := Sistema.TempDir+db.Name+IntToStr(iDir) ;


                     finally
                       free;
                     end;

                   Open;
                End;

                Result := true;
                lFim := true;
             end;
          except
             On E:Exception Do
             Begin
                If Pos('ORA-01017',E.Message) > 0 Then
                   AlteraAfonsoPenna(sUserName,sNomeUsuario,Db)
                Else
                Begin
                   db.Connected := false;
                   Result := false;
                End;
             End;
          end;

          Inc(Tentativas);

          if Tentativas = 3 then
             lFim := true;
     end;
End;

Procedure TCmConectaBanco.AlteraAfonsoPenna(sIdUsuario, sNomeUsuario :String;db :TDataBase);
Var
  OldTraceFlags :TTraceFlags;
Begin
    //Inibe o trace do comando pelo SQLMONITOR
    If Not db.Connected Then
    Begin
       db.Params.Values['PASSWORD'] := 'AFONSOPENNA';
       db.Open;
    End;

    If Sistema.ConnectionSide = cnsServer Then OldTraceFlags := Session.TraceFlags;
    Try
       If Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := [];

       ExecutarQuery(dtmBaseDados.qry, 'ALTER USER '+ sIdUsuario +
                                       ' IDENTIFIED BY ' + GetSenhaUsuario(sIdUsuario,sNomeUsuario,True) + ' DEFAULT TABLESPACE DADOS TEMPORARY TABLESPACE TEMP PROFILE DEFAULT');
    finally
       If Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := OldTraceFlags;
    End;
End;

Class function TCmConectaBanco.GetSenhaUsuario(sUsuariobanco, sUsuarioSistema: String; bUpper: Boolean) :String;
var
   Digest :TDigest;
   Crypto :TRipeMD;
begin
   Crypto := TRipeMD.Create(Application);
   Try
     Crypto.Init;
     Crypto.HashString(sUsuariobanco + sUsuarioSistema + CONSTCRIPTO);
     Digest := Crypto.Finish;
     Result := 'C' + Copy(Crypto.GetHashString,1,19);
   finally
     Crypto.Free;
   End;
End;

end.

