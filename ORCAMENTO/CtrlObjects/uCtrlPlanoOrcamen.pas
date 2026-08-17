{ --------------------------------------------------------------------------------------------------
Rotina......: Todo o Formulário
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Rotina......: Procurar
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado campo Ano, alterado método Procurar
----------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlPlanoOrcamen;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uDbPlanoOrcamen, uCMTypes;

Type
  TCtrlPlanoOrcamen = Class(TCmControlObject)

  Protected

    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private

    _dbPlanoOrcamen: TdbPlanoOrcamen;
    FCdsPlanoOrcamen: TClientDataSet;
    Procedure SetCdsPlanoOrcamen(const Value: TClientDataSet);

  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    property CdsPlanoOrcamen: TClientDataSet read FCdsPlanoOrcamen write SetCdsPlanoOrcamen;

    function AplicaOperacaoPlanoOrcamen : Boolean;
    function Procurar(idPlanoOrcamen:Double): OleVariant;
  End;

Implementation
//************************************************
Procedure TCtrlPlanoOrcamen.OnCreateAppServer;
Begin
  Inherited;

  FCdsPlanoOrcamen := TClientDataSet.Create(nil);
End;
//************************************************
Procedure TCtrlPlanoOrcamen.DoChangeDataBase;
Begin
  Inherited;
  _dbPlanoOrcamen.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlPlanoOrcamen.Create;
Begin
  Inherited;

  _dbPlanoOrcamen  := TdbPlanoOrcamen.Create( Self );
End;
//************************************************
Destructor TCtrlPlanoOrcamen.Destroy;
Begin
  Inherited;

  _dbPlanoOrcamen.Free;

  If ( isAppServer ) Then Begin

    FCdsPlanoOrcamen.Free;
  End;
End;
//************************************************
Function TCtrlPlanoOrcamen.AplicaOperacaoPlanoOrcamen: Boolean;
Begin
  If ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.AplicaOperacaoPlanoOrcamen(FCdsPlanoOrcamen.Data);
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    MessageInfo := '';
    Try
      StartTransaction;
      Result := ApplyCDS(FCdsPlanoOrcamen,_DbPlanoOrcamen,[],[]);
      If Not Result Then Begin
         MessageInfo := _DbPlanoOrcamen.MessageInfo;
         Abort;
      End Else
         Commit;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlPlanoOrcamen.Procurar(idPlanoOrcamen:Double): OleVariant;
Begin

  _DbPlanoOrcamen.IdPlanoOrcamen.AsFloat := idPlanoOrcamen;

  //Ricardo SOL 159242/6041 KINTANA 1385831
  Result := GetDataPacket('SELECT * FROM PLANOORCAMENTARIO WHERE IDPLANOORCAMEN = ' + FloatToStr(idPlanoOrcamen));

  //GetDataPacket(_DbPlanoOrcamen.SSqlSelect);
End;
//************************************************
Procedure TCtrlPlanoOrcamen.SetCdsPlanoOrcamen(
  const Value: TClientDataSet);
Begin

  FCdsPlanoOrcamen := Value;
End;
//************************************************
End.


