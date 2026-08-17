//***************************************************************************************
//Rotina.............: ListFormaRecPag, GravarFormaRecPag, ExcluiParametrizacaoRecPag,
//                     DoChangeDataBase, Destroy    
//N. SIG.............: 102320
//Data da Alteração..: 30/09/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de campo para identificação de Tipo de Pagamento/Recebimento.
//***************************************************************************************
//Rotina.............: ListFormaRecPag
//N. SIG.............: 99868
//Data da Alteração..: 02/09/2020 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos para parametrização de Forma de Pagamento.
//***************************************************************************************
//Rotina.............: ListFormaRecPag
//N. SIG.............: 101753
//Data da Alteração..: 24/08/2020
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para tratamento de indicação de Remessa Eletrônica.
//***************************************************************************************
//Rotina.............: ListFormaRecPag
//N. SIG.............: 100343
//Data da Alteração..: 12/06/2020
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para tratamento de pagamento de Autônomos.
//***************************************************************************************
Unit uCtrlFormaRecPag;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbFormaRecPag, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes, uDbFormaRecPagXTipoFormaRecPag;

Type

  TCtrlFormaRecPag = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbFormaRecPag: TDbFormaRecPag;
    _DbFormaRecPagXTipoFormaRecPag: TDbFormaRecPagXTipoFormaRecPag;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    FcdsFormaRecPagXTipoFormaRecPag: TClientDataSet;
    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);
    procedure SetcdsFormaRecPagXTipoFormaRecPag(
      const Value: TClientDataSet); //Cássio Rovaroto - SIG nº 102320

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    property cdsFormaRecPagXTipoFormaRecPag: TClientDataSet read FcdsFormaRecPagXTipoFormaRecPag write SetcdsFormaRecPagXTipoFormaRecPag;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListFormaRecPag(idpessoa: double = 0; CODFORMA: double = 0;
      RECPAG: String = ''): OleVariant;
    function ListTipoFormaRecPag: OleVariant;
    function ListFormaRecPagXTipoFormaRecPag(pCodForma: integer = -1): OleVariant;
    Function GravarFormaRecPag(IdPessoa, IdModulo, IdUsuario: Integer; PossuiParam: boolean = false): Boolean;
    function ExcluiParametrizacaoRecPag(pCodForma: integer): Boolean;  // Cássio Rovaroto - SIG nº 102320
  End;

Implementation

{ TCtrlFormaRecPag }

Constructor TCtrlFormaRecPag.Create;
Begin
  Inherited;
  _DbFormaRecPag := TDbFormaRecPag.Create(self);
  _DbFormaRecPagXTipoFormaRecPag := TDbFormaRecPagXTipoFormaRecPag.Create(Self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlFormaRecPag.Destroy;
Begin
  _DbFormaRecPag.Free;
  _DbFormaRecPagXTipoFormaRecPag.Free; //Cássio Rovaroto - SIG nº 102320
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlFormaRecPag.DoChangeDataBase;
Begin
  Inherited;
  _DbFormaRecPag.DataBaseName := DataBaseName;
  _DbFormaRecPagXTipoFormaRecPag.DataBaseName := DataBaseName; // Cássio Rovaroto - SIG nº 102320
End;

Function TCtrlFormaRecPag.ListFormaRecPag(idpessoa: double = 0; CODFORMA: double = 0;
  RECPAG: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                     ' +
    '  CODFORMA,               ' +
    '  RECPAG   ,              ' +
    '  DESCRICAO ,             ' +
    '  IDPESSOA  ,             ' +
    '  IDUSUARIOINCLUSAO ,     ' +
    '  FLGDADOSBANCARIOS       ' +
    '  , CODFORMABANCO         ' + //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
    '  , NVL(FLGPAGTOAUTONOMO, 0) AS FLGPAGTOAUTONOMO ' + //Cássio Rovaroto - SIG nº 100343
    '  , NVL(FLGARQUIVO, ''N'') AS FLGARQUIVO ' + //Cássio Rovaroto - SIG nº 101753
    '  , NVL(FLGPERMITELISTAFAVORECIDO, ''N'') AS FLGPERMITELISTAFAVORECIDO ' + //Cássio Rovaroto - SIG nº 99868
    '  , NVL(FLGPERMITETITULOSPAGTO, ''N'') AS FLGPERMITETITULOSPAGTO ' + //Cássio Rovaroto - SIG nº 99868
    '  , NVL(TIPOFORMA, -1) AS TIPOFORMA ' + //Cássio Rovaroto - SIG nº 102320
    'FROM  FormaRecPag  ' +
    '  where (1=1) ';
  If idpessoa <> 0 Then
    ssql := ssql + ' and IDPESSOA = ' + floattostr(idpessoa);
  If CODFORMA <> 0 Then
    ssql := ssql + ' and CODFORMA = ' + floattostr(CODFORMA);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and  RECPAG = ''' + RECPAG + '''';
  ssql := ssql + ' ORDER BY DESCRICAO               ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlFormaRecPag.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlFormaRecPag.GravarFormaRecPag(IdPessoa, IdModulo, IdUsuario: Integer; PossuiParam: boolean): Boolean;
Var
  Msg: String;
  sDscLog: String;
  bParamRemessa: Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarFormaRecPag(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      Result := ApplyCds(Cds, _DbFormaRecPag, [], []);
      Msg := _DbFormaRecPag.MessageInfo;

      if PossuiParam then //Cássio Rovaroto - SIG nº 102320
      begin
        Result := ApplyCds(cdsFormaRecPagXTipoFormaRecPag, _DbFormaRecPagXTipoFormaRecPag,[_DbFormaRecPag.Codforma], [_DbFormaRecPagXTipoFormaRecPag.CodForma]);
        Msg := _DbFormaRecPagXTipoFormaRecPag.MessageInfo;
      end;

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Forma de Pagamento'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Forma de Pagamento'
      Else
        sDscLog := 'Alteracao de Forma de Pagamento ';

      If Not Result Then
        Raise Exception.create(Msg);
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);
      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Procedure TCtrlFormaRecPag.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlFormaRecPag.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

function TCtrlFormaRecPag.ListTipoFormaRecPag: OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT IDTIPOFORMARECPAG, DESCRICAO ' +
          '  FROM TIPOFORMARECPAG ' +
          ' WHERE FLGATIVO = ''S'' ' ;
  Result := GetDataPacket(sSQL);

end;

procedure TCtrlFormaRecPag.SetcdsFormaRecPagXTipoFormaRecPag(
  const Value: TClientDataSet);
begin
  FcdsFormaRecPagXTipoFormaRecPag := Value;
end;

function TCtrlFormaRecPag.ListFormaRecPagXTipoFormaRecPag(
  pCodForma: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CODFORMA, IDTIPOFORMARECPAG ' +
          '  FROM FORMARECPAGXTIPOFORMARECPAG ' +
          ' WHERE CODFORMA = ' + IntToStr(pCodForma);
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlFormaRecPag.ExcluiParametrizacaoRecPag(
  pCodForma: integer): Boolean;
var
  sSQL: string;
begin
  Result := True;
  try
    StartTransaction;
    sSQL := 'DELETE FROM FORMARECPAGXTIPOFORMARECPAG WHERE CODFORMA = ' + IntToStr(pCodForma);

    if not ExecSQL(sSQL) then
      raise Exception.Create( MessageInfo );

    Commit;
  except
    on e : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := e.message;
    end;
  end;
end; 

End.

