//Marcus Oliveira 24823 24/04/2007 Ativar/Des o PortadorForma.
//
//Atualizado :  28/08/2003 - André Tavares -  pendência 13159
//
unit uCtrlDocxCobranca;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uCtrlDocumento, ucmClientDataset;

type

  TCtrlDocxCobranca = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  private
    _CdsDocPendentes: TClientDataSet;
    _CdsDocAssoc: TClientDataSet;
    _CdsRateioDoc: TClientDataSet;
    _CdsAlteradores: TClientDataSet;
    _Documento: TCtrlDocumento;
    //início - André Tavares - 28/08/2003 - pendência 13159
    _bHistoricoMsg : Boolean;
    //fim - André Tavares - 28/08/2003 - pendência 13159
    function InsereMensagensRateio(fCodDocumento : Double; bApagaExistentes : Boolean) : Boolean;
  Public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function ListRateioDoc(fCodDocumento : Double) : OLEVariant;
    function ListAlteradores(fCodDocumento : Double) : OleVariant;
    function ListFormaPag(idEmpresa : Integer; RecPag : String) : OLEVariant;
    function GravarDocxCobranca(ovDocPendentes, ovDocAssoc : OleVariant;
                              sIDConta : String; bApagaExistentes, bMensagens : Boolean;
    //início - André Tavares - 28/08/2003 - pendência 13159
                              bHistorico : Boolean = false ) : Boolean;
   //fim - André Tavares - 28/08/2003 - pendência 13159

    // Rodolpho da Silva - P: 19422
    function SelecionaDocumFinanceiro(sCodFinanc: string): OleVariant;



 end;                         



implementation

{ TCtrlDocxCobranca }




procedure TCtrlDocxCobranca.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(Self)
end;

function TCtrlDocxCobranca.GravarDocxCobranca(ovDocPendentes, ovDocAssoc: OleVariant;
sIDConta : String; bApagaExistentes, bMensagens : Boolean;
//início - André Tavares - 28/08/2003 - pendência 13159
bHistorico : Boolean = false ) : Boolean;
//fim - André Tavares - 28/08/2003 - pendência 13159

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDocxCobranca(ovDocPendentes, ovDocAssoc, sIDConta, bApagaExistentes, bMensagens, bHistorico);
     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;

    //início - André Tavares - 28/08/2003 - pendência 13159
    _bHistoricoMsg := bHistorico;
    //fim - André Tavares - 28/08/2003 - pendência 13159

    if _CdsDocPendentes.Active then _CdsDocPendentes.Close;
    _CdsDocPendentes.Data := ovDocPendentes;

    if _CdsDocAssoc.Active then _CdsDocAssoc.Close;
    _CdsDocAssoc.Data := ovDocAssoc;

    StartTransaction;
    try
      _CdsDocPendentes.First;
      while not _CdsDocPendentes.Eof do
      begin
        if not ExecSQL('UPDATE DOCUMENTO ' +
                       'SET EMISBLOQ = Null ' +
                       'WHERE CODDOCUMENTO = ' + _CdsDocPendentes.FieldByName('CODDOCUMENTO').AsString) then
          raise Exception.Create(MessageInfo);

        if not ExecSQL('DELETE MENSAGENSCNAB WHERE CODDOCUMENTO = ' +
                       _CdsDocPendentes.FieldByName('CODDOCUMENTO').AsString) then
          raise Exception.Create(MessageInfo);
        _CdsDocPendentes.Next;
      end;

      _CdsDocAssoc.First;
      while not _CdsDocAssoc.EOF do
      begin
        if not ExecSQL('UPDATE DOCUMENTO ' +
                       'SET CODPORTFORMA = ' + sIDConta  + ',' +
                       'EMISBLOQ = ''N'' ' +
                       'WHERE CODDOCUMENTO = ' + _CdsDocAssoc.FieldByName('CODDOCUMENTO').AsString) then
          raise Exception.Create(MessageInfo);
        if bMensagens then
          InsereMensagensRateio(_CdsDocAssoc.FieldByName('CODDOCUMENTO').AsInteger, bApagaExistentes);
        _CdsDocAssoc.Next;
      end;
      Commit;
    except
      On E:Exception Do
      Begin
        Result := False;
        MessageInfo := E.Message;
        Rollback;
      end;
    end;
  End;
end;

constructor TCtrlDocxCobranca.Create;
begin
  inherited;
  _CdsDocPendentes := TClientDataSet.Create(nil);
  _CdsDocAssoc     := TClientDataSet.Create(nil);
  _CdsRateioDoc    := TClientDataSet.Create(nil);
  _CdsAlteradores  := TClientDataSet.Create(nil);
  _Documento       := TCtrlDocumento.Create;
  //início - André Tavares - 28/08/2003 - pendência 13159
  _bHistoricoMsg   := false;
 //fim - André Tavares - 28/08/2003 - pendência 13159
end;

destructor TCtrlDocxCobranca.Destroy;
begin
  _CdsDocPendentes.Free;
  _CdsDocAssoc.Free;
  _CdsRateioDoc.Free;
  _CdsAlteradores.Free;
  _Documento.Free;
  inherited;
end;


function TCtrlDocxCobranca.InsereMensagensRateio(fCodDocumento : Double; bApagaExistentes : Boolean) : Boolean;
var
  iContMensagem, x : Integer;
//início - André Tavares - 28/08/2003 - pendência 13159
  sMensagem        : Array [0..9] of String;
  CdsLocalAux : TcmClientDataset;
//fim - André Tavares - 28/08/2003 - pendência 13159
Begin
  for x := 0 To 8 do sMensagem[x] := '';

  _cdsRateioDoc.Data := ListRateioDoc(fCodDocumento);
  _cdsRateioDoc.First;
  iContMensagem := -1;
  while Not _cdsRateioDoc.EOF do
  begin
    Inc(iContMensagem);
    sMensagem[iContMensagem] := Copy(_cdsRateioDoc.FieldByName('DESCRICAO').AsString,1,26)  + ': ' + FormatFloat('#,##0.00',_cdsRateioDoc.FieldByName('VALORRD').AsFloat);
    if iContMensagem = 8 then
      _cdsRateioDoc.Last
    else
      _cdsRateioDoc.Next;
  end;

  if iContMensagem < 8 then
  begin
    _cdsAlteradores.Data := ListAlteradores(fCodDocumento);
    _cdsAlteradores.First;
    while Not _cdsAlteradores.EOF do
    begin
      Inc(iContMensagem);
      sMensagem[iContMensagem] := Copy(_cdsAlteradores.FieldByName('DESCRICAO').AsString,1,26) + ': ' + FormatFloat('#,##0.00',_cdsAlteradores.FieldByName('VALORALT').AsFloat);
      if iContMensagem = 8 then
       _cdsAlteradores.Last
      else
       _cdsAlteradores.Next;
    end;
  end;
//início - André Tavares - 28/08/2003 - pendência 13159
  if _bHistoricoMsg then
  begin
    CdsLocalAux := TcmClientDataSet.Create(nil);
    cdsLocalAux.Data := GetDataPacket('SELECT HISTORICOCOMPL FROM LANCTODOCUM WHERE OPERACAO = 2 AND CODDOCUMENTO = '+
                                      floatToStr(fCodDocumento));

    sMensagem[9] := cdsLocalAux.FieldByName('HISTORICOCOMPL').asString;
    cdsLocalAux.Free;
  end;
//fim - André Tavares - 28/08/2003 - pendência 13159

  _Documento.IntBanco.SetaMensagensCNAB(StrToInt(FloatToStr(fCodDocumento)), -1, sMensagem, bApagaExistentes);


  Result := True;
end;

function TCtrlDocxCobranca.ListAlteradores(
  fCodDocumento: Double): OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT ' +
          '  DECODE(L.DEBCRE,''C'',L.VALOR*-1,L.VALOR) AS VALORALT,  TA.DESCRICAO ' +
          'FROM ' +
          '  LANCTODOCUM L, TIPOALTERADOR TA ' +
          'WHERE ' +
          '  (L.CODDOCUMENTO = ' + FloatToStr(fCODDOCUMENTO)  + ') AND ' +
          '  (L.CODALTERADOR = TA.CODALTERADOR)';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDocxCobranca.ListFormaPag(idEmpresa: Integer;
  RecPag: String): OLEVariant;
var sSQL : String;
begin
  sSQL := ' SELECT ' +
          '   CODPORTFORMA, DESCRICAO ' +
          ' FROM ' +
          '   PORTADORFORMA ' +
          ' WHERE ' +
          '   RECPAG = ' + QuotedStr(RecPag) +
          '   AND IDPESSOA = ' + IntToStr(idEmpresa) +
          //Marcus Oliveira 24823 24/04/2007
          '   AND NVL (FLGATIVO, ''S'') <> ''N'' ' +

          ' ORDER BY DESCRICAO';
   Result := GetDataPacket(sSQL);
end;

function TCtrlDocxCobranca.ListRateioDoc(
  fCodDocumento: Double): OLEVariant;
var
  sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT                                                               ');
    Append('    SUM(R.VALOR) AS VALORRD,                                         ');
    Append('    TRD.CODTIPRECDES,                                                ');
    Append('    TRD.DESCRICAO                                                    ');
    Append('FROM                                                                 ');
    Append('    RATEIODOCUM R,                                                   ');
    Append('    TIPORECEBDESEMB TRD                                              ');
    Append('WHERE                                                                ');
    Append('    (R.CODDOCUMENTO = ' + FloatToStr(fCodDocumento) + ')    AND      ');
    Append('    (R.CODTIPRECDES = TRD.CODTIPRECDES) AND                          ');
    Append('    (R.IDPESSOA     = TRD.IDPESSOA)     AND                          ');
    Append('    (R.RECPAG       = TRD.RECPAG)                                    ');
    Append('GROUP BY                                                             ');
    Append('    TRD.CODTIPRECDES,                                                ');
    Append('    TRD.DESCRICAO                                                    ');
    Append('union                                                                ');
    Append('SELECT                                                               ');
    Append('   SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRD,                ');
    Append('   Q2.CODTIPRECDES  ,  Q2.DESCRICAO                                  ');
    Append('                                                                     ');
    Append('FROM                                                                 ');
    Append('  (SELECT                                                            ');
    Append('     DOC.NUMFATURA,                                                  ');
    Append('     LAN.VALOR                                                       ');
    Append('  FROM                                                               ');
    Append('     DOCUMENTO DOC,                                                  ');
    Append('     LANCTODOCUM LAN                                                 ');
    Append('  WHERE                                                              ');
    Append('    (DOC.CODDOCUMENTO = ' + FloatToStr(fCodDocumento) + ') AND       ');
    Append('    ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND          ');
    Append('    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,                       ');
    Append(' (SELECT                                                             ');
    Append('   D.NUMFATURA,                                                      ');
    Append('   RD.VALOR,                                                         ');
    Append('   TDR.CODTIPRECDES,                                                 ');
    Append('   TDR.DESCRICAO                                                     ');
    Append('  FROM                                                               ');
    Append('   RATEIODOCUM RD,                                                   ');
    Append('   TIPORECEBDESEMB TDR, DOCUMENTO D                                  ');
    Append('  WHERE                                                              ');
    Append('   (D.NUMFATURA IS NOT NULL)                    AND                  ');
    Append('   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND                  ');
    Append('   (TDR.CODTIPRECDES(+)   = RD.CODTIPRECDES)    AND                  ');
    Append('   (TDR.RECPAG(+)         = RD.RECPAG)          AND                  ');
    Append('   (TDR.IDPESSOA(+)       = RD.IDPESSOA)  ) Q2,                      ');
    Append('  (SELECT                                                            ');
    Append('    D.NUMFATURA, SUM(L.VALOR) AS VALOR                               ');
    Append('   FROM                                                              ');
    Append('    LANCTODOCUM L, DOCUMENTO D                                       ');
    Append('   WHERE                                                             ');
    Append('    ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND             ');
    Append('    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                            ');
    Append('    (D.OPERACAO = L.OPERACAO) AND                                    ');
    Append('    (D.NUMFATURA IS NOT NULL)                                        ');
    Append('   GROUP BY D.NUMFATURA) Q3                                          ');
    Append('WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFATURA)');
    Append('GROUP BY                                                             ');
    Append('   Q2.CODTIPRECDES, Q2.DESCRICAO                                     ');
    Append('ORDER BY                                                             ');
    Append(' DESCRICAO                                                           ');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;





function TCtrlDocxCobranca.SelecionaDocumFinanceiro(sCodFinanc: string): OleVariant;
var
  sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   M.DATALANCFINAN, ' +
           '   M.STATUSCONCILIA, ' +
           '   PC.DESCRICAO AS PORTADORFORMA, ' +
           '   M.NUMCHQBORDERO, ' +
           '   M.HISTORICO, ' +
           '   M.VALORLANCFINAN, ' +
           '   M.VALOROUTRAMOEDA ' +
           'FROM ' +
           '   MOVIMFINANC M, ' +
           '   PORTADORCONTA PC ' +
           'WHERE ' +
           '   (M.STATUSCONCILIA = ''X'') AND ' +
           '   (M.CODPORTADOR = PC.CODPORTADOR) AND ' +
           '   (M.CODLANCFINANC IN (' + sCodFinanc + ') )  ' +
           'ORDER BY ' +
           '   M.DATALANCFINAN, M.HISTORICO ';
   Result := GetDataPacket(sSQL);
end;

end.
