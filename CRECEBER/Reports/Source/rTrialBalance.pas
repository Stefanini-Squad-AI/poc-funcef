unit rTrialBalance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlParamIntegra, TXRB;

type
  TRptTrialBalance = class(TFrmCmReport)
    DsAgingtpcli: TwwDataSource;
    PpAgingtpcli: TppBDEPipeline;
    RptAgingtpcli: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel45: TppLabel;
    LblPosSaldos: TppLabel;
    LblTipoCli: TppLabel;
    ppDetailBand15: TppDetailBand;
    RptAgingtpcliDBText1: TppDBText;
    RptAgingtpcliDBText2: TppDBText;
    RptAgingtpcliDBText3: TppDBText;
    RptAgingtpcliDBText4: TppDBText;
    RptAgingtpcliDBText5: TppDBText;
    RptAgingtpcliDBText6: TppDBText;
    RptAgingtpcliLine2: TppLine;
    ppFooterBand15: TppFooterBand;
    ppLabel46: TppLabel;
    RptAgingLine1: TppLine;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    RptAgingSummaryBand1: TppSummaryBand;
    ppLine25: TppLine;
    LTOTAVENC: TppDBCalc;
    LTOT30: TppDBCalc;
    LTOT60: TppDBCalc;
    LTOT90: TppDBCalc;
    LTOT120: TppDBCalc;
    LTOT150: TppDBCalc;
    LTOT180: TppDBCalc;
    LTOTM180: TppDBCalc;
    LTOTGER: TppDBCalc;
    RptAgingtpcliGroup2: TppGroup;
    RptAgingtpcliGroupHeaderBand2: TppGroupHeaderBand;
    RptAgingtpcliDBText8: TppDBText;
    RptAgingtpcliDBText9: TppDBText;
    RptAgingtpcliLabel7: TppLabel;
    RptAgingLine2: TppLine;
    RptAgingLine5: TppLine;
    LblTotalForn: TppLabel;
    LblMais180: TppLabel;
    Lbl180: TppLabel;
    Lbl150: TppLabel;
    Lbl120: TppLabel;
    Lbl90: TppLabel;
    Lbl60: TppLabel;
    Lbl30: TppLabel;
    LblCliFor: TppLabel;
    RptAgingLabel1: TppLabel;
    RptAgingLabel2: TppLabel;
    RptAgingtpcliLine3: TppLine;
    RptAgingtpcliGroupFooterBand2: TppGroupFooterBand;
    RptAgingtpcliLine4: TppLine;
    RptAgingtpcliDBCalc1: TppDBCalc;
    RptAgingtpcliDBCalc2: TppDBCalc;
    RptAgingtpcliDBCalc3: TppDBCalc;
    RptAgingtpcliDBCalc4: TppDBCalc;
    RptAgingtpcliDBCalc5: TppDBCalc;
    RptAgingtpcliDBCalc6: TppDBCalc;
    RptAgingtpcliDBCalc7: TppDBCalc;
    RptAgingtpcliDBCalc8: TppDBCalc;
    RptAgingtpcliDBCalc9: TppDBCalc;
    RptAgingtpcliLabel8: TppLabel;
    RptAgingtpcliLine5: TppLine;
    RptAgingtpcliGroup1: TppGroup;
    RptAgingtpcliGroupHeaderBand1: TppGroupHeaderBand;
    LTOTFORN: TppDBText;
    LM180: TppDBText;
    L180: TppDBText;
    L150: TppDBText;
    L120: TppDBText;
    L90: TppDBText;
    L60: TppDBText;
    L30: TppDBText;
    LAVENC: TppDBText;
    RptAgingtpcliLine1: TppLine;
    RptAgingtpcliLabel1: TppLabel;
    RptAgingtpcliLabel2: TppLabel;
    RptAgingtpcliLabel3: TppLabel;
    RptAgingtpcliLabel4: TppLabel;
    RptAgingtpcliLabel5: TppLabel;
    RptAgingtpcliLabel6: TppLabel;
    RptAgingtpcliDBText7: TppDBText;
    RptAgingtpcliDBText10: TppDBText;
    RptAgingtpcliGroupFooterBand1: TppGroupFooterBand;
    RptAgingtpcliDBCalc10: TppDBCalc;
    RptAgingtpcliLine6: TppLine;
    RptAgingtpcliLine7: TppLine;
    DsAuxAgingtpcli: TwwDataSource;
    DSAuxAgingtpcliDOCS: TwwDataSource;
    CdsAuxAgingtpcliDOCS: TCMClientDataSet;
    SqlAuxAgingtpcli: TCMSqlParams;
    CdsAuxAgingtpcli: TCMClientDataSet;
    SqlAuxAgingtpcliDOCS: TCMSqlParams;
    CdsAgingtpcli: TCMClientDataSet;
    SqlAgingtpcli: TCMSqlParams;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    iSumSaldo: Array [0..7] of Real;
    iDatasSaldo: Array [0..5] of Integer;
    sIdTipoCliente, sDataPagto, sOldCODFORN, SOLDCODTPCLI, sOldFornecedor, sOldTipoCliente : string;
    procedure RodapeTrialBalance;
    procedure DetalheTrialBalance(Cds:TCMClientDataSet);
  public
    { Public declarations }
  end;

var
  RptTrialBalance: TRptTrialBalance;

implementation

uses uSistema;
{$R *.DFM}

procedure TRptTrialBalance.CrmRptCMBeforePrint(Sender: TObject);
var
  bIncluiAdiantamento : boolean;
  x : integer;
begin
  inherited;
LblCliFor.Caption := 'Cliente';
LblTipoCli.Visible := False;
SqlAuxAgingTpCli.Open;
CdsAuxAgingTpCli.Delete;

SqlAuxAgingtpcliDOCS.Open;
CdsAuxAgingtpcliDOCS.Delete;

if not CmpRptCM.ParamValues[2].IsNull Then
begin
   sIdTipoCliente := CmpRptCM.ParamValues[2].AsString ;
   LblTipoCli.Text := 'Tipo de Cliente: ' + CmpRptCM.ParamValues[2].AsString;
   LblTipoCli.Visible := True;
end
else
begin
   sIdTipoCliente := ' ' ;
   LblTipoCli.Text := '';
   LblTipoCli.Visible := False;
end;

if CmpRptCM.ParamValues[1].AsBoolean Then
begin
   bIncluiAdiantamento := False;
   LblTipoCli.Text := Trim(LblTipoCli.Text + ' - Adiantamentos Não Inclusos');
   LblTipoCli.Visible := True;
end
else
   bIncluiAdiantamento := True;

if CmpRptCM.ParamValues[0].IsNull Then
   sDataPagto := DateToStr(Date)
else
   sDataPagto := CmpRptCM.ParamValues[0].AsString;

LblPosSaldos.Text := 'Trial Balance em ' + sDataPagto;

for X := 0 to 7 do
    iSumSaldo[X] := 0;

SqlAux.SQL.Clear;
SqlAux.SQL.Add('SELECT DD30, DD60, DD90, DD120, DD150, DD180 '+
               '    FROM PARAMCAP '+
               '    WHERE RECPAG = '''+ParamIntegra.RecPag+''' AND '+
               '          IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa));
SqlAux.open;

iDatasSaldo[0] := CdsAux.FieldByName('DD30').AsInteger;
iDatasSaldo[1] := CdsAux.FieldByName('DD60').AsInteger;
iDatasSaldo[2] := CdsAux.FieldByName('DD90').AsInteger;
iDatasSaldo[3] := CdsAux.FieldByName('DD120').AsInteger;
iDatasSaldo[4] := CdsAux.FieldByName('DD150').AsInteger;
iDatasSaldo[5] := CdsAux.FieldByName('DD180').AsInteger;

Lbl30.Caption      := IntToStr(iDatasSaldo[0]);
Lbl60.Caption      := IntToStr(iDatasSaldo[1]);
Lbl90.Caption      := IntToStr(iDatasSaldo[2]);
Lbl120.Caption     := IntToStr(iDatasSaldo[3]);
Lbl150.Caption     := IntToStr(iDatasSaldo[4]);
Lbl180.Caption     := IntToStr(iDatasSaldo[5]);
LblMais180.Caption := '+ ' + IntToStr(iDatasSaldo[5]);

Lbl30.Visible      := not (iDatasSaldo[0] = 0);
Lbl60.Visible      := not (iDatasSaldo[1] = 0);
Lbl90.Visible      := not (iDatasSaldo[2] = 0);
Lbl120.Visible     := not (iDatasSaldo[3] = 0);
Lbl150.Visible     := not (iDatasSaldo[4] = 0);
Lbl180.Visible     := not (iDatasSaldo[5] = 0);
LblMais180.Visible := not (iDatasSaldo[5] = 0);

L30.Visible      := not (iDatasSaldo[0] = 0);
L60.Visible      := not (iDatasSaldo[1] = 0);
L90.Visible      := not (iDatasSaldo[2] = 0);
L120.Visible     := not (iDatasSaldo[3] = 0);
L150.Visible     := not (iDatasSaldo[4] = 0);
L180.Visible     := not (iDatasSaldo[5] = 0);
LM180.Visible    := not (iDatasSaldo[5] = 0);

LTOT30.Visible      := not (iDatasSaldo[0] = 0);
LTOT60.Visible      := not (iDatasSaldo[1] = 0);
LTOT90.Visible      := not (iDatasSaldo[2] = 0);
LTOT120.Visible     := not (iDatasSaldo[3] = 0);
LTOT150.Visible     := not (iDatasSaldo[4] = 0);
LTOT180.Visible     := not (iDatasSaldo[5] = 0);
LTOTM180.Visible    := not (iDatasSaldo[5] = 0);

RptAgingtpcliDBCalc2.Visible      := not (iDatasSaldo[0] = 0);
RptAgingtpcliDBCalc3.Visible      := not (iDatasSaldo[1] = 0);
RptAgingtpcliDBCalc4.Visible      := not (iDatasSaldo[2] = 0);
RptAgingtpcliDBCalc5.Visible      := not (iDatasSaldo[3] = 0);
RptAgingtpcliDBCalc6.Visible      := not (iDatasSaldo[4] = 0);
RptAgingtpcliDBCalc7.Visible      := not (iDatasSaldo[5] = 0);
RptAgingtpcliDBCalc8.Visible      := not (iDatasSaldo[5] = 0);

with SqlAgingtpcli do
begin
   SQL.TEXT := 'SELECT  /*+ RULE */ P.RAZAOSOCIAL, DOCUMENTO.IDFORCLI, T.IDTIPOCLIENTE, T.DESCRICAO, '+
            'DOCUMENTO.CODDOCUMENTO, DOCUMENTO.NODOCUMENTO, DOCUMENTO.COMPLDOCUMENTO, '+
            'DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.DATAEMISSAO, DOCUMENTO.DATAVENCTO, '+
            'DECODE(RTRIM(DOCUMENTO.OPERACAO), ''3'', S2.SALDOS2*SUM(DECODE(DOCUMENTO.RECPAG, '+
            '    ''P'', DECODE(LANCTODOCUM.DEBCRE, ''D'', LANCTODOCUM.VALOR*-1, LANCTODOCUM.VALOR), ' +
            ' DECODE(LANCTODOCUM.DEBCRE, ''D'', LANCTODOCUM.VALOR, LANCTODOCUM.VALOR*-1)))/S1.SALDOS1, '+
            'SUM(DECODE(DOCUMENTO.RECPAG, ''P'', DECODE(LANCTODOCUM.DEBCRE, ''D'', LANCTODOCUM.VALOR*-1, '+
            'LANCTODOCUM.VALOR), DECODE(LANCTODOCUM.DEBCRE, ''D'', LANCTODOCUM.VALOR, LANCTODOCUM.VALOR*-1)))) AS SALDO '+
            'FROM DOCUMENTO, LANCTODOCUM, PESSOA P, TIPOCLIENTE T, CLIENTEPESS C, ' +
            '(SELECT D.NUMFATURA, SUM(DECODE(D.RECPAG, ''P'', DECODE(L.DEBCRE, ''D'', L.VALOR*-1, L.VALOR), '+
                     'DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1))) AS SALDOS1 '+
             'FROM DOCUMENTO D, LANCTODOCUM L '+
             'WHERE (L.ESTORNO IS NULL) AND (L.VALOR <> 0) AND (RTRIM(D.OPERACAO) = ''1'') AND '+
               '((D.NUMFATURA IS NOT NULL) AND (D.NUMFATURA <> 0)) AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
             'GROUP BY D.NUMFATURA ' +
             'HAVING SUM(DECODE(D.RECPAG, ''P'', DECODE(L.DEBCRE, ''D'', L.VALOR*-1, L.VALOR), ' +
                     'DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1))) <> 0) S1, '+
               '(SELECT D.NUMFATURA, SUM(DECODE(D.RECPAG, ''P'', DECODE(L.DEBCRE, ''D'', L.VALOR*-1, L.VALOR), '+
                        'DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1))) AS SALDOS2 '+
                'FROM DOCUMENTO D, LANCTODOCUM L '+
                'WHERE (L.ESTORNO IS NULL) AND (L.DATALANCTO <= :PDATAFIM) AND (RTRIM(D.OPERACAO) = ''1'') AND '+
                  '((D.NUMFATURA IS NOT NULL) AND (D.NUMFATURA <> 0)) AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
                'GROUP BY D.NUMFATURA) S2 '+
          'WHERE '+
            '(DOCUMENTO.IDPESSOA = :PIDPESSOA) AND '+
            '(LANCTODOCUM.ESTORNO IS NULL) AND '+
            '(((LANCTODOCUM.DATALANCTO <= :PDATAFIM) AND '+
            '(RTRIM(LANCTODOCUM.OPERACAO) <> ''3'')) OR '+
            '(RTRIM(LANCTODOCUM.OPERACAO) = ''3'')) AND '+
            '(DOCUMENTO.RECPAG = :PRECPAG) AND '+
            '(((RTRIM(DOCUMENTO.OPERACAO) = ''1'') AND '+
              '(RTRIM(DOCUMENTO.STATUS)  <> ''2'')) OR '+
              'RTRIM(DOCUMENTO.OPERACAO) IN (''2'',''3'''+
                FuncaoGeral.Decode(
                  bIncluiAdiantamento,
                  true,
                  ',''15''',
                  '')+
                  ')) AND '+
            '(LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO) AND '+
            '(S1.NUMFATURA(+) = DOCUMENTO.NUMFATURA) AND '+
            '(S2.NUMFATURA(+) = DOCUMENTO.NUMFATURA) AND '+
            '(DOCUMENTO.IDFORCLI = P.IDPESSOA)  AND '+
            '(DOCUMENTO.IDFORCLI = C.IDPESSOA(+)) '+
              FuncaoGeral.Decode(
                Trim(sIdTipoCliente),
                '',
                '',
                'AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+)) AND '+
                  '(T.IDTIPOCLIENTE = '+sIdTipoCliente+')')+
          'GROUP BY ' +
            'P.RAZAOSOCIAL, '+
            'DOCUMENTO.IDFORCLI, '+
            'DOCUMENTO.CODDOCUMENTO, '+
            'DOCUMENTO.NODOCUMENTO, '+
            'DOCUMENTO.COMPLDOCUMENTO, '+
            'T.IDTIPOCLIENTE, '+
            'T.DESCRICAO, '+
            'DOCUMENTO.DATAPROGRAMADA, '+
            'DOCUMENTO.DATAEMISSAO, '+
            'DOCUMENTO.DATAVENCTO, '+
            'DOCUMENTO.OPERACAO, '+
            'S1.SALDOS1, '+
            'S2.SALDOS2 '+
          'HAVING '+
            'DECODE('+
              'RTRIM(DOCUMENTO.OPERACAO), '+
              '''3'', '+
              'S2.SALDOS2*SUM(DECODE('+
                               'DOCUMENTO.RECPAG, '+
                               '''P'', '+
                               'DECODE('+
                                 'LANCTODOCUM.DEBCRE, '+
                                 '''D'', '+
                                 'LANCTODOCUM.VALOR*-1, '+
                                 'LANCTODOCUM.VALOR), '+
                               'DECODE('+
                                 'LANCTODOCUM.DEBCRE, '+
                                 '''D'', '+
                                 'LANCTODOCUM.VALOR, '+
                                 'LANCTODOCUM.VALOR*-1)))/S1.SALDOS1, ' +
              'SUM(DECODE('+
                    'DOCUMENTO.RECPAG, '+
                    '''P'', '+
                    'DECODE('+
                      'LANCTODOCUM.DEBCRE, '+
                      '''D'', '+
                      'LANCTODOCUM.VALOR*-1, '+
                      'LANCTODOCUM.VALOR), '+
                    'DECODE('+
                      'LANCTODOCUM.DEBCRE, '+
                      '''D'', '+
                      'LANCTODOCUM.VALOR, '+
                     'LANCTODOCUM.VALOR*-1)))) <> 0 '+
          'ORDER BY '+
            'T.DESCRICAO, '+
            'T.IDTIPOCLIENTE, '+
            'P.RAZAOSOCIAL, '+
            'DOCUMENTO.IDFORCLI, '+
            'DOCUMENTO.DATAPROGRAMADA ';

   Prepare;
   ParamByName('PRECPAG').AsString    := ParamIntegra.RecPag;
   ParamByName('PDATAFIM').AsDateTime := StrToDate(sDataPagto);
   ParamByName('PIDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;

   Open;
end;
with CdsAgingtpcli do
begin
   if IsEmpty then Exit;

   for X := 0 to 7 do
     iSumSaldo[x] := 0;

   First;
   sOldCODFORN   := FieldByName('IDFORCLI').AsString;
   SOLDCODTPCLI  := FieldByName('IDTIPOCLIENTE').AsString;
   while not Eof do
   begin
      if (sOldCODFORN = FieldByName('IDFORCLI').AsString) and
         (SOLDCODTPCLI  = FieldByName('IDTIPOCLIENTE').AsString) then
            DetalheTrialBalance(CdsAgingTpCli)
          else
          begin
            RodapeTrialBalance;
            DetalheTrialBalance(CdsAgingTpCli);
          end;
          sOldCODFORN   := FieldByName('IDFORCLI').AsString;
          SOLDCODTPCLI  := FieldByName('IDTIPOCLIENTE').AsString;
          sOldFornecedor := FieldByName('RAZAOSOCIAL').AsString;
          sOldTipoCliente:= FieldByName('DESCRICAO').AsString;
          Next;
        end;
        RodapeTrialBalance;
      end;
end;

procedure TRptTrialBalance.DetalheTrialBalance(Cds: TCMClientDataSet);
begin
With Cds Do
Begin
   CdsAuxAgingtpcliDOCS.Append;
   CdsAuxAgingtpcliDOCS.FieldByName('COMPL').ASSTRING       := Cds.FieldByName('COMPLDOCUMENTO').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('DOCUMENTO').ASSTRING   := Cds.FieldByName('NODOCUMENTO').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('SALDO').Asfloat        := Cds.FieldByName('Saldo').Asfloat;
   CdsAuxAgingtpcliDOCS.FieldByName('DTEMISSAO').ASSTRING   := Cds.FieldByName('DATAEMISSAO').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('DTPROG').ASSTRING      := Cds.FieldByName('DataProgramada').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('DTVENCTO').ASSTRING    := Cds.FieldByName('DATAVENCTO').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('CODTPCLI').ASSTRING    := Cds.FieldByName('IDTIPOCLIENTE').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('CODFORN').ASSTRING     := Cds.FieldByName('IDFORCLI').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('FORNECEDOR').ASSTRING  := Cds.FieldByName('razaosocial').AsString;
   CdsAuxAgingtpcliDOCS.FieldByName('TIPOCLIENTE').ASSTRING := Cds.FieldByName('descricao').AsString;
   CdsAuxAgingtpcliDOCS.POST;

   If FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) Then
      iSumSaldo[0] :=  iSumSaldo[0] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto)) AND
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[0]) Then
       iSumSaldo[1] := iSumSaldo[1] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[0])  And
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[1]) Then
       iSumSaldo[2] := iSumSaldo[2] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[1])  And
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[2]) Then
       iSumSaldo[3] := iSumSaldo[3] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[2])  And
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[3]) Then
       iSumSaldo[4] := iSumSaldo[4] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[3])  And
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[4]) Then
       iSumSaldo[5] := iSumSaldo[5] + FieldByName('Saldo').AsFloat;

   If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[4])  And
      (FieldByName('DataProgramada').AsDateTime >= StrToDate(sDataPagto) - iDatasSaldo[5]) Then
       iSumSaldo[6] := iSumSaldo[6] + FieldByName('Saldo').AsFloat;

   If (iDatasSaldo[5] <> 0) then
      If (FieldByName('DataProgramada').AsDateTime < StrToDate(sDataPagto) - iDatasSaldo[5]) Then
         iSumSaldo[7] := iSumSaldo[7] + FieldByName('Saldo').AsFloat;
End;

end;

procedure TRptTrialBalance.RodapeTrialBalance;
Var
  X: Integer;
  primeiro:boolean;
begin
       //-----------------------------------------------------------------------
       //Monta Lista Com os Valores do Cross-Tab
    CdsAuxAgingTpCli.Append;
    CdsAuxAgingTpCli.Fields[0].AsString := sOldTipoCliente ;
    CdsAuxAgingTpCli.Fields[1].AsString := sOldFornecedor ;
    CdsAuxAgingTpCli.Fields[2].AsString := sOldCODFORN ;
    CdsAuxAgingTpCli.Fields[3].AsString := SOLDCODTPCLI ;
    CdsAuxAgingTpCli.Fields[4].AsFloat  := iSumSaldo[0];
    CdsAuxAgingTpCli.Fields[5].AsFloat  := iSumSaldo[1];
    CdsAuxAgingTpCli.Fields[6].AsFloat  := iSumSaldo[2];
    CdsAuxAgingTpCli.Fields[7].AsFloat  := iSumSaldo[3];
    CdsAuxAgingTpCli.Fields[8].AsFloat  := iSumSaldo[4];
    CdsAuxAgingTpCli.Fields[9].AsFloat  := iSumSaldo[5];
    CdsAuxAgingTpCli.Fields[10].AsFloat  := iSumSaldo[6];
    CdsAuxAgingTpCli.Fields[11].AsFloat  := iSumSaldo[7];
    CdsAuxAgingTpCli.Fields[12].AsFloat  := iSumSaldo[0]+
                                            iSumSaldo[1]+
                                            iSumSaldo[2]+
                                            iSumSaldo[3]+
                                            iSumSaldo[4]+
                                            iSumSaldo[5]+
                                            iSumSaldo[6]+
                                            iSumSaldo[7];

    CdsAuxAgingtpcliDOCS.first;
    primeiro:=true;
    while not CdsAuxAgingtpcliDOCS.EOF do
    begin
       if not primeiro then
          CdsAuxAgingTpCli.Append;
       primeiro:=false;
       CdsAuxAgingtpcli.fieldbyname('COMPL').ASSTRING       := CdsAuxAgingtpcliDOCS.fieldbyname('COMPL').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('DOCUMENTO').ASSTRING   := CdsAuxAgingtpcliDOCS.fieldbyname('DOCUMENTO').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('SALDO').ASfloat        := CdsAuxAgingtpcliDOCS.fieldbyname('SALDO').ASfloat;
       CdsAuxAgingtpcli.fieldbyname('DTEMISSAO').ASSTRING   := CdsAuxAgingtpcliDOCS.fieldbyname('DTEMISSAO').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('DTPROG').ASSTRING      := CdsAuxAgingtpcliDOCS.fieldbyname('DTPROG').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('DTVENCTO').ASSTRING    := CdsAuxAgingtpcliDOCS.fieldbyname('DTVENCTO').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('CODTPCLI').ASSTRING    := CdsAuxAgingtpcliDOCS.fieldbyname('CODTPCLI').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('CODFORN').ASSTRING     := CdsAuxAgingtpcliDOCS.fieldbyname('CODFORN').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('FORNECEDOR').ASSTRING  := CdsAuxAgingtpcliDOCS.fieldbyname('FORNECEDOR').ASSTRING;
       CdsAuxAgingtpcli.fieldbyname('TIPOCLIENTE').ASSTRING := CdsAuxAgingtpcliDOCS.fieldbyname('TIPOCLIENTE').ASSTRING;
       CdsAuxAgingTpCli.Post;
       CdsAuxAgingtpcliDOCS.next;
    end;

    For X:=0 To 7 Do iSumSaldo[X] := 0;

    SqlAuxAgingtpcliDOCS.Open;
    CdsAuxAgingtpcliDOCS.Delete;

end;

end.
