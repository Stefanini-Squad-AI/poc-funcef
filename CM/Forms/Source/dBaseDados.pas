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
unit DBaseDados;

interface
                              
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, wwQuery, uString, FileCtrl, CMDatabase, ADODB, DBClient, uCmSqlParams,
  wwstorep;

type
  TdtmBaseDados = class(TDataModule)
    qry: TwwQuery;
    dbBaseDados: TCMDatabase;
    dbBaseRemota: TCMDatabase;
    Cds: TClientDataSet;
    SQL: TCMSqlParams;
    qryParametroGlobal: TwwQuery;
    spAtualizaCMUserID: TwwStoredProc;
    spUserID: TwwStoredProc;
    procedure dtmBaseDadosDestroy(Sender: TObject);
    procedure dtmBaseDadosCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ssSegur : TSession;
    dbBaseSegur : TCMDataBase;
    function AbreDataBase(db : TDataBase) : boolean ;
    function ConectaSegur : boolean;
  end;

var
  dtmBaseDados: TdtmBaseDados;

implementation

uses USistema, uMensErro, uCmConectaBanco, uCMTypes;

{$R *.DFM}

function TdtmBaseDados.AbreDataBase(db : TDataBase) : boolean ;
Begin
   Result := CmConectaBanco.Conectar(db);
end;

procedure TdtmBaseDados.dtmBaseDadosDestroy(Sender: TObject);
begin
   If Sistema.ConnectionSide = cnsServer Then
   Begin
     dbBaseDados.close;
     dbBaseRemota.close;
     dbBaseSegur.close;
     RemoveDir(dbBaseDados.Session.PrivateDir);
     RemoveDir(dbBaseRemota.Session.PrivateDir);
     RemoveDir(dbBaseSegur.Session.PrivateDir);
     dbBaseSegur.free;
     ssSegur.free;
     CmConectaBanco.Free;
   End;
end;

procedure TdtmBaseDados.dtmBaseDadosCreate(Sender: TObject);
begin
     CmConectaBanco := TCmConectaBanco.Create;
     
     If Sistema.ConnectionSide = cnsServer Then
     Begin
        dbBaseDados.Close ;
        dbBaseRemota.Close ;

        ssSegur := TSession.Create(self);
        ssSegur.SessionName := 'SessionSegur';

        dbBaseSegur := TCMDatabase.Create(self);
        dbBaseSegur.DataBaseName := 'BaseSegur';
        dbBaseSegur.Name := 'dbBaseSegur';
        dbBaseSegur.LoginPrompt := false;
        dbBaseSegur.SessionName := 'SessionSegur';
     End;
     
     if not CmConectaBanco.ConectaServidor then Application.Terminate;
end;

function TdtmBaseDados.ConectaSegur : boolean;
begin
     if AbreDataBase(dbBaseSegur) then
        Result := true
     else
     begin
          MsgDlg( 'Não foi possível localizar o usuario seguro CM.'+#13#10 +'Utilize o CRIASIN',
                  'Usuário seguro', mtWarning, [mbOk], 0);
          Result := false;
     end;
end;
end.

