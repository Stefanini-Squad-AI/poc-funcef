{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Baixa de Documento CAP X CAR 3 Camadas              }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 06/01/2002                             }
{                                                       }
{*******************************************************}


Unit fpgRecxPagtoMT;

interface

uses
  fOKCancelar, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, MAHlpBtn, Buttons, Grids, DBCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, Wwdbgrid, Db, Wwdatsrc, TREdit, MontaSelect, TB97,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, TB97Tlwn, Wwdbigrd;

type
  TfrmpgRecxPagtoMT = class(TfrmOKCancelar)
    dsDocPag: TwwDataSource;
    dsrecpagto: TwwDataSource;
    dsDocRec: TwwDataSource;
    MsDocrec: TMontaSelect;
    Label11: TLabel;
    DsLancFinanc: TwwDataSource;
    CMParamRec: TCmParamReport;
    CMParamPag: TCmParamReport;
    CMParamFinanceiro: TCmParamReport;
    cdsDocRec: TCMClientDataSet;
    cdsDocPag: TCMClientDataSet;
    sqlLancFinanc: TCMSqlParams;
    cdsLancFinanc: TCMClientDataSet;
    PnlFinancTot: TPanel;
    bbtnSelecionaDoc: TBitBtn;
    PnlDocCap: TPanel;
    Label19: TLabel;
    GrdDocCap: TwwDBGrid;
    PnlDocCar: TPanel;
    Label18: TLabel;
    GrdDocCar: TwwDBGrid;
    GrdLancFinanc: TwwDBGrid;
    Label20: TLabel;
    SplDocCar: TSplitter;
    SplDocCap: TSplitter;
    SQLDocPag: TCMSqlParams;
    SQLDocRec: TCMSqlParams;
    TwinTotais: TToolWindow97;
    LblSistema: TLabel;
    LblOutroSistema: TLabel;
    LblDiferenca: TLabel;
    LblTotDepositos: TLabel;
    LblValSistema: TLabel;
    LblValOutroSistema: TLabel;
    LblValTotDepositos: TLabel;
    LblValDiferenca: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape6: TShape;
    SQLSelecionaDoc: TCMSqlParams;
    CdsSelecionaDoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure GrdDocCarFieldChanged(Sender: TObject; Field: TField);
    procedure GrdDocCapFieldChanged(Sender: TObject; Field: TField);
    procedure GrdLancFinancFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    _SQLPortadorForma: String;
    _SQLFormaRecPag: String;
    _sSQL: String;
    _sSQLSub: String;
    _TotRec: Double;
    _TotPag: Double;
    _TotFinanc: Double;

    procedure SelecionaDocPag;
    procedure SelecionaDocRec;
    procedure SelecionaFinanceiro;
    function SQLData(sRecPag: String): OleVariant;
    procedure SetaParametros(var _sSQL, _sSQLSub: String;
      CMTela: TCMParamReport);

  public
    { Public declarations }

  end;

var
  frmpgRecxPagtoMT: TfrmpgRecxPagtoMT;


implementation

Uses uSistema, uCMMath;

{$R *.DFM}

procedure TfrmpgRecxPagtoMT.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  inherited;

  SQLDocRec.Open;
  SQLDocPag.Open;

  _SQLPortadorForma := ' SELECT' +
                      '   DESCRICAO, CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA, CODPORTADOR, DESCFINAN' +
                      ' FROM' +
                      '   PORTADORFORMA' +
                      ' WHERE' +
                      '   IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND ';

  _SQLFormaRecPag   := ' SELECT' +
                      '   CODFORMA,' +
                      '   DESCRICAO' +
                      ' FROM' +
                      '   FORMARECPAG' +
                      ' WHERE' +
                      ' (IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ') AND';

  CMParamFinanceiro.ParamValues[0].LookupSettings.SQL.Text := 'SELECT ' +
                                                              ' CODPORTADOR, ' +
                                                              ' DESCRICAO ' +
                                                              'FROM ' +
                                                              ' PORTADORCONTA ' +
                                                              'WHERE ' +
                                                              ' IDPESSOA = ' + IntToStr(Sistema.IDEmpresa);
{ ------------------------------------------------------------------------------
  CONTAS A RECEBER
  ------------------------------------------------------------------------------ }
  with CMParamRec do
  begin
    {Portador Forma}
    ParamValues[3].LookupSettings.SQL.Text := _SQLPortadorForma +
                                              ' RECPAG   = ''R'' ' +
                                              'ORDER BY DESCRICAO';
    {Tipo de Documento}
    ParamValues[4].LookupSettings.SQL.Text := 'SELECT ' +
                                              '  CODTIPDOC, ' +
                                              '  DESCRICAO, ' +
                                              '  DEBCRE, ' +
                                              '  FLGENGLOBAPARCELA, ' +
                                              '  FLGGERANUMDOC, ' +
                                              '  FLGDOCFISCAL ' +
                                              'FROM ' +
                                              '  TIPODOCRECPAG TD ' +
                                              'WHERE ' +
                                              ' TD.RECPAG = ''R'' ' +
                                              ' AND NOT EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''R'') ' +
                                              ' UNION ' +
                                              ' SELECT ' +
                                              '   CODTIPDOC, ' +
                                              '   DESCRICAO, ' +
                                              '   DEBCRE, ' +
                                              '   FLGENGLOBAPARCELA, ' +
                                              '   FLGGERANUMDOC, ' +
                                              '   FLGDOCFISCAL ' +
                                              ' FROM TIPODOCRECPAG TD ' +
                                              ' WHERE TD.RECPAG = ''R'' AND ' +
                                              ' EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE TD.CODTIPDOC = UTD.CODTIPDOC AND ' +
                                              '        UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''R'' ) ' +
                                              'ORDER BY DESCRICAO';

    {Forma de Recebimento}
    ParamValues[5].LookupSettings.SQL.Text := _SQLFormaRecPag +
                                              ' (RECPAG = ''R'') '+
                                              'ORDER BY DESCRICAO';
  end;

{ ------------------------------------------------------------------------------
  CONTAS A PAGAR
  ------------------------------------------------------------------------------ }
  with CMParamPag do
  begin
    {Portador Forma}
    ParamValues[3].LookupSettings.SQL.Text := _SQLPortadorForma +
                                              ' RECPAG   = ''P'' ' +
                                              'ORDER BY DESCRICAO';
    {Tipo de Documento}
    ParamValues[4].LookupSettings.SQL.Text := 'SELECT ' +
                                              '  CODTIPDOC, ' +
                                              '  DESCRICAO, ' +
                                              '  DEBCRE, ' +
                                              '  FLGENGLOBAPARCELA, ' +
                                              '  FLGGERANUMDOC, ' +
                                              '  FLGDOCFISCAL ' +
                                              'FROM ' +
                                              '  TIPODOCRECPAG TD ' +
                                              'WHERE ' +
                                              ' TD.RECPAG = ''P'' ' +
                                              ' AND NOT EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''P'' )' +
                                              ' UNION ' +
                                              ' SELECT ' +
                                              '   CODTIPDOC, ' +
                                              '   DESCRICAO, ' +
                                              '   DEBCRE, ' +
                                              '   FLGENGLOBAPARCELA, ' +
                                              '   FLGGERANUMDOC, ' +
                                              '   FLGDOCFISCAL ' +
                                              ' FROM TIPODOCRECPAG TD ' +
                                              ' WHERE TD.RECPAG = ''P'' AND ' +
                                              ' EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE TD.CODTIPDOC = UTD.CODTIPDOC AND ' +
                                              '        UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''P'') ' +
                                              'ORDER BY DESCRICAO';

    {Forma de Pagamento}
    ParamValues[5].LookupSettings.SQL.Text := _SQLFormaRecPag +
                                              ' (RECPAG = ''P'') '+
                                              'ORDER BY DESCRICAO';
  end;
end;

procedure TfrmpgRecxPagtoMT.bbtnSelecionaDocClick(Sender: TObject);
begin
  inherited;
  if CMParamRec.Execute then
  begin
     SelecionaDocRec;
     if CMParamPag.Execute then
     begin
        SelecionaDocPag;
        if CMParamFinanceiro.Execute then SelecionaFinanceiro;
     End;
  End;
end;

procedure TfrmpgRecxPagtoMT.SelecionaDocRec;
begin
  _sSQL    := '';
  _sSQLSub := '';
  SetaParametros(_sSQL, _sSQLSub, CMParamRec);
  cdsDocRec.Data := SQLData('R');
end;

procedure TfrmpgRecxPagtoMT.SelecionaFinanceiro;
begin
  with sqlLancFinanc do
  begin
    SQL.Clear;
    SQL.Append('SELECT                                                       ');
    SQL.Append('  ''N'' AS SELECIONA,                                        ');
    SQL.Append('  CODLANCFINANC,                                             ');
    SQL.Append('  STATUSCONCILIA,                                            ');
    SQL.Append('  VALORLANCFINAN,                                            ');
    SQL.Append('  VALOROUTRAMOEDA,                                           ');
    SQL.Append('  NUMCHQBORDERO,                                             ');
    SQL.Append('  DATALANCFINAN,                                             ');
    SQL.Append('  ENTRADASAIDA,                                              ');
    SQL.Append('  HISTORICO                                                  ');
    SQL.Append('FROM                                                         ');
    SQL.Append('  MOVIMFINANC                                                ');
    SQL.Append('WHERE                                                        ');
    SQL.Append('  IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND         ');
    SQL.Append('  STATUSCONCILIA = ''I''                                     ');
    {Verifica se a Conta Bancária\Caixa foi Informada}
    if not CMParamFinanceiro.ParamValues[0].ISNull then
      SQL.Append(' AND CODPORTADOR = ' + CMParamFinanceiro.ParamValues[0].AsString);
    if not CMParamFinanceiro.ParamValues[1].ISNull then
      SQL.Append(' AND IDMODULO = ' + CMParamFinanceiro.ParamValues[1].AsString);
    SQL.Append('ORDER BY DATALANCFINAN, NUMCHQBORDERO                        ');
    Open;
  end;
end;

procedure TfrmpgRecxPagtoMT.SelecionaDocPag;
begin
  _sSQL    := '';
  _sSQLSub := '';
  SetaParametros(_sSQL, _sSQLSub, CMParamPag);
  cdsDocPag.Data := SQLData('P');
end;

procedure TfrmpgRecxPagtoMT.SetaParametros(var _sSQL, _sSQLSub: String;
  CMTela: TCMParamReport);
begin
  with CMTela do
  begin
    {Verifica se o Cliente foi selecionado}
    if ParamValues[0].AsInteger = 0 then
    begin
      _sSQL := 'D.IDFORCLI = ' + ParamValues[0].AsString + ' AND ';
      _sSQLSub := ' D.IDFORCLI= ' + ParamValues[0].AsString + ' AND ';
    end;

    {Verifica se Número do Documento foi digitado}
    if ParamValues[1].AsInteger <> 0 then
    begin
      _sSQL := _sSQL + 'D.NODOCUMENTO = ' + ParamValues[1].AsString + ' AND ';
      _sSQLSub := _sSQLSub + 'D.NODOCUMENTO = '+  ParamValues[1].AsString + ' AND ';
    end;

    {Verifica se o CODGRUPOCNAB foi digitado}
    if ParamValues[2].AsInteger <> 0 then
    begin
      _sSQL := _sSQL + 'D.CODGRUPOCNAB = ' + ParamValues[2].AsString + ' AND ';
      _sSQLSub := _sSQLSub + 'D.CODGRUPOCNAB = ' + ParamValues[2].AsString + ' AND ';
    end;

    {Verifica se o Portador Forma foi selecionado}
    if not ParamValues[3].ISNull then
    begin
      _sSQL := _sSQL + 'D.CODPORTFORMA= ' + ParamValues[3].AsString + ' AND ';
      _sSQLSub := _sSQLSub + 'D.CODPORTFORMA= ' + ParamValues[3].AsString + ' AND ';
    end;

    {Verifica se o Tipo de Documento foi selecionado}
    if not ParamValues[4].ISNull then
    begin
      _sSQL := _sSQL + 'D.CODTIPDOC = ' + ParamValues[4].AsString + ' AND ';
      _sSQLSub := _sSQLSub + ' D.CODTIPDOC = ' + ParamValues[4].AsString + ' AND ';
    end;

    {Verifica se a Forma de Recebimento foi selecionada}
    if not ParamValues[5].ISNull then
    begin
      _sSQL := _sSQL + 'D.CODFORMA = ' + ParamValues[5].AsString + ' AND ';
      _sSQLSub := _sSQLSub + 'D.CODFORMA = ' + ParamValues[5].AsString + ' AND ';
    end;

    {Verifica se o Sistema de Origem foi selecionado}
    if not ParamValues[6].ISNull then
    begin
      _sSQL := _sSQL + 'D.IDMODULO = ' +  ParamValues[6].AsString + ' AND ';
      _sSQLSub := _sSQLSub + 'D.IDMODULO = ' + ParamValues[6].AsString + ' AND ';
    end;

    {Verifica se a Data Programada foi selecionada}
    if not ParamValues[7].IsNull then
    begin
      _sSQL := _sSQL + 'D.DATAPROGRAMADA =  TO_DATE('+ QuotedStr(ParamValues[7].AsString) + ',''DD/MM/YYYY'') AND ';
      _sSQLSub := _sSQLSub + 'D.DATAPROGRAMADA =  TO_DATE('+ QuotedStr(ParamValues[7].AsString) + ',''DD/MM/YYYY'') AND ';
    end;

    {Verifica se a Data de Lançamento foi selecionada}
    if not ParamValues[8].IsNull then
      _sSQL := _sSQL + 'L.DATALANCTO = TO_DATE(' + QuotedStr(ParamValues[8].AsString) + ',''DD/MM/YYYY'') AND ';
  end;
end;

function TfrmpgRecxPagtoMT.SQLData(sRecPag : String) : OleVariant;
begin
  with sqlSelecionaDoc do
  begin
    SQL.Clear;
    SQL.Append('SELECT                                                           ');
    SQL.Append('  ''N'' AS SELECIONA,                                            ');
    SQL.Append('  ''N'' AS BAIXAPARCIAL,                                         ');
    SQL.Append('  0 AS VALORPAGO,                                                ');
    SQL.Append('  0 as VALORPAGOOOTRMOE,                                         ');
    SQL.Append('  U.SALDO,                                                       ');
    SQL.Append('  U.SALDO1,                                                      ');
    SQL.Append('  D.IDFORCLI,                                                    ');
    SQL.Append('  D.OPERACAO,                                                    ');
    SQL.Append('  D.IDPESSOA,                                                    ');
    SQL.Append('  D.CODDOCUMENTO,                                                ');
    SQL.Append('  D.NODOCUMENTO,                                                 ');
    SQL.Append('  D.COMPLDOCUMENTO,                                              ');
    SQL.Append('  D.DATAPROGRAMADA,                                              ');
    SQL.Append('  D.DATAVENCTO,                                                  ');
    SQL.Append('  D.RECPAG,                                                      ');
    SQL.Append('  P.NOME,                                                        ');
    SQL.Append('  D.STATUS,                                                      ');
    SQL.Append('  D.MOECODIGO,                                                   ');
    SQL.Append('  D.PLANO,                                                       ');
    SQL.Append('  D.PLACONTA,                                                    ');
    SQL.Append('  D.CODCENTROCUSTO,                                              ');
    SQL.Append('  D.CODSUBCONTA,                                                 ');
    SQL.Append('  D.CODGRUPOCNAB,                                                ');
    SQL.Append('  D.NOSSONUMERO,                                                 ');
    SQL.Append('  L.NUMLANCTO,                                                   ');
    SQL.Append('  L.VLRLIQUIDO,                                                  ');
    SQL.Append('  L.DEBCRE,                                                      ');
    SQL.Append('  L.VALOROUTRAMOEDA,                                             ');
    SQL.Append('  0 AS IMPRET,                                                   ');
    SQL.Append('  0 AS IMP,                                                      ');
    SQL.Append('  0 AS DIF                                                       ');
    SQL.Append('FROM                                                             ');
    SQL.Append('  DOCUMENTO D,                                                   ');
    SQL.Append('  PESSOA P,                                                      ');
    SQL.Append('  LANCTODOCUM L,                                                 ');
    SQL.Append('  (SELECT L.CODDOCUMENTO,                                        ');
    SQL.Append('          SUM(DECODE(DEBCRE,''D'', VALOR, VALOR *-1)) AS SALDO,  ');
    SQL.Append('          SUM(DECODE(DEBCRE,''D'', VALOROUTRAMOEDA, VALOROUTRAMOEDA * -1)) AS SALDO1 ');
    SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D                               ');
    SQL.Append('   WHERE ' + _sSQLSub                                              );
    SQL.Append('        D.CODDOCUMENTO = L.CODDOCUMENTO AND                      ');
    SQL.Append('        D.RECPAG = ' + QuotedStr(sRecPag) + ' AND                ');
    SQL.Append('        D.STATUS <> ''2''                                        ');
    SQL.Append('   GROUP BY L.CODDOCUMENTO) U                                    ');
    SQL.Append('WHERE                                                            ');
    SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND                    ');
    SQL.Append('  D.CODTIPDOC IN                                                 ');
    SQL.Append('       (SELECT CODTIPDOC                                         ');
    SQL.Append('        FROM TIPODOCRECPAG A                                     ');
    SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
    SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B  ');
    SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
    SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
    SQL.Append('                                )                                ');
    SQL.Append('        UNION                                                    ');
    SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A                    ');
    SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS   ');
    SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B  ');
    SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
    SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
    SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
    SQL.Append(' (D.OPERACAO = L.OPERACAO) AND                                   ');
    SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                           ');
    SQL.Append(' (L.ESTORNO IS NULL) AND                                         ');
    SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND           ');
    SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND  ');
    SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND                  ');
    SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND                                   ');
    SQL.Append(   _sSQL + ' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
    SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
    SQL.Append(' (U.SALDO >0  ) AND                                              ');
    SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)                               ');
    SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NoDOCUMENTO                ');
    Open;
    
    Result := cdsSelecionaDoc.Data;
  end;
end;


procedure TfrmpgRecxPagtoMT.GrdDocCarFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field.FieldName = 'SELECIONA' then
  begin
    if Field.AsString = 'S' then
      _TotRec := _TotRec + CdsDocRec.FieldByName('SALDO').AsFloat
    else
      _TotRec := _TotRec - CdsDocRec.FieldByName('SALDO').AsFloat;

    LblValSistema.Caption := Trim(FloatToStrf(_TotRec, ffNumber, 15, 2));
  end;
end;

procedure TfrmpgRecxPagtoMT.GrdDocCapFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field.FieldName = 'SELECIONA' then
  begin
    if Field.AsString = 'S' then
      _TotPag := _TotPag + CdsDocPag.FieldByName('SALDO').AsFloat
    else
      _TotPag := _TotPag - CdsDocPag.FieldByName('SALDO').AsFloat;

    LblValOutroSistema.Caption := Trim(FloatToStrf(_TotPag, ffNumber, 15, 2));
  end;
end;

procedure TfrmpgRecxPagtoMT.GrdLancFinancFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field.FieldName = 'SELECIONA' then
  begin
    if Field.AsString = 'S' then
      _TotFinanc := _TotFinanc + cdsLancFinanc.FieldByName('SALDO').AsFloat
    else
      _TotFinanc := _TotFinanc - cdsLancFinanc.FieldByName('SALDO').AsFloat;

    LblValTotDepositos.Caption := Trim(FloatToStrf(_TotFinanc, ffNumber, 15, 2));
  end;
end;

end.
