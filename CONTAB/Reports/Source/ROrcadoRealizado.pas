{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidad               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit ROrcadoRealizado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, RRelatWeb, DBClient,
  Provider, Db, ADODB, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc,
  DBTables, usistema, uCMTypes, uCMClientDataSet, TXRB;

type
  TrptOrcadoRealizado = class(TRptRelatWeb)
    dsOrcamento: TwwDataSource;
    pplOrcamento: TppBDEPipeline;
    pplOrcamentoppField1: TppField;
    pplOrcamentoppField2: TppField;
    pplOrcamentoppField3: TppField;
    pplOrcamentoppField4: TppField;
    pplOrcamentoppField5: TppField;
    pplOrcamentoppField6: TppField;
    pplOrcamentoppField7: TppField;
    pplOrcamentoppField8: TppField;
    pplOrcamentoppField9: TppField;
    pplOrcamentoppField10: TppField;
    pplOrcamentoppField11: TppField;
    pplOrcamentoppField12: TppField;
    pplOrcamentoppField13: TppField;
    pplOrcamentoppField14: TppField;
    pplOrcamentoppField15: TppField;
    pplOrcamentoppField16: TppField;
    pplOrcamentoppField17: TppField;
    pplOrcamentoppField18: TppField;
    pplOrcamentoppField19: TppField;
    pplOrcamentoppField20: TppField;
    pplOrcamentoppField21: TppField;
    pplOrcamentoppField22: TppField;
    pplOrcamentoppField23: TppField;
    rptOrcamento: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLblTituloOrcamento: TppLabel;
    ppLine27: TppLine;
    ppLabel44: TppLabel;
    txtContaOrc: TppLabel;
    ppLine28: TppLine;
    txtNomeContaOrc: TppLabel;
    ppLblTituloOrcamento2: TppLabel;
    txtReal: TppLabel;
    txtPeriodo: TppLabel;
    txtAcumulado: TppLabel;
    txtOrc: TppLabel;
    txtVar: TppLabel;
    txtRealAcu: TppLabel;
    txtOrcAcu: TppLabel;
    txtVarAcu: TppLabel;
    rptOrcamentoLine1: TppLine;
    rptOrcamentoLine2: TppLine;
    rptOrcamentoLine3: TppLine;
    rptOrcamentoLine4: TppLine;
    bndDetOrcamento: TppDetailBand;
    dbtxtContaOrc: TppDBText;
    dbtxtCorrespOrc: TppDBText;
    dbtxtNomeContaOrc: TppDBText;
    dbtxtVarPer: TppDBText;
    dbtxtRealPerOrc: TppDBText;
    dbtxtDCRealPerOrc: TppDBText;
    ppDBText20: TppDBText;
    dbtxtOrcPerOrc: TppDBText;
    dbtxtDCOrcPerOrc: TppDBText;
    txtVarPer: TppLabel;
    txtVarAcum: TppLabel;
    dbtxtVarAcum: TppDBText;
    dbtxtDCOrcAcumOrc: TppDBText;
    dbtxtOrcAcumOrc: TppDBText;
    dbtxtReaLAcumOrc: TppDBText;
    dbtxtDCRealAcumOrc: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine29: TppLine;
    ppLabel52: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    rptOrcamentoSummaryBand1: TppSummaryBand;
    rptOrcamentoLabel8: TppLabel;
    rptOrcamentoLine5: TppLine;
    rptOrcamentoLabel9: TppLabel;
    rptOrcamentoLabel10: TppLabel;
    rptOrcamentoLabel11: TppLabel;
    rptOrcamentoLabel12: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    cdSaldoOrc: TClientDataSet;
    cdAux: TClientDataSet;
    cdTotais: TClientDataSet;
    cdsSaldoRea: TClientDataSet;
    Cds: TCMClientDataSet;
    CMClientDataSet1: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure bndDetOrcamentoBeforePrint(Sender: TObject);
    procedure bndDetOrcamentoBeforeGenerate(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CdsBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses uCtrlPadroes;

Var
  dtPeriodoFinal : TdateTime;
  sNomeOutLing, sNomePeriodo,
  sNomeCentoCustoIni, sNomeCentoCustoFim,
  sMascara, sSintAnal : string;
  bValores, bCodigo, bIngles,
  bIndenta, bEspaco : boolean;
  


{$R *.DFM}

procedure TrptOrcadoRealizado.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo : string;
    iNumero : Integer;
    sEspacos : string;
    i : integer;
    sContaIni, sContaFin: String;
begin
  inherited;

  if trim(CmpRptCM.ParamValues[3].Asstring) <> '' then
     sContaIni := QuotedStr(Espaco(CmpRptCM.ParamValues[3].Asstring,18))
  else
     sContaIni := QuotedStr(Espaco('0',18));
  //
  if trim(CmpRptCM.ParamValues[4].Asstring) <> '' then
     sContaFin := QuotedStr(Espaco(CmpRptCM.ParamValues[4].Asstring,18))
  else
     sContaFin := QuotedStr('999999999999999999');

  If cdsAux.Active Then cdsAux.Close;
  cdsAux.Data := Padroes.GetDataPacket('SELECT '+
                        '   PERNUMERO, PERNOME, PERNOMEOUTLING, '+
                        '   PERDATFIM '+
                        '  FROM PERIODO' +
                        ' WHERE IDPESSOA = '+ floatTostr(CrmRptCM.IdEmpresa) + ' '+
                        '   AND PERNUMERO = '+CmpRptCM.ParamValues[1].AsString + ' '+
                        ' ORDER BY PERNUMERO');
  dtPeriodoFinal := cdsAux.fieldByname('PERDATFIM').AsdateTime;
  sNomeOutLing   := cdsAux.fieldByname('PERNOMEOUTLING').AsString;
  sNomePeriodo   := cdsAux.fieldByname('PERNOME').AsString;


  If cdsAux.Active Then cdsAux.Close;
  cdsAux.Data := Padroes.GetDataPacket('SELECT CODCENTROCUSTO, NOME '+
                        '  FROM CENTCUST '+
                        ' WHERE CODCENTROCUSTO = '+ QuotedStr(CmpRptCM.ParamValues[5].AsString));
  sNomeCentoCustoIni := cdsAux.fieldByname('NOME').Asstring;

  If cdsAux.Active Then cdsAux.Close;
  cdsAux.Data := Padroes.GetDataPacket('SELECT CODCENTROCUSTO, NOME '+
                        '  FROM CENTCUST '+
                        ' WHERE CODCENTROCUSTO = '+ QuotedStr(CmpRptCM.ParamValues[6].AsString));
  sNomeCentoCustoFim := cdsAux.fieldByname('NOME').Asstring;


   if trim(CmpRptCM.ParamValues[17].AsString) = '' then
     begin
       If cdsAux.Active Then cdsAux.Close;
       cdAux.Data := Padroes.GetDataPacket(
                     ' SELECT ' +
                     '    PERNUMERO ' +
                     ' FROM ' +
                     '    PERIODO ' +
                     ' WHERE ' +
                     '    (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' +
                     '    (PEREXERCICIO=' + CmpRptCM.ParamValues[0].AsString + ') AND ' +
                     '    (PERNUMERO<=' + CmpRptCM.ParamValues[1].AsString + ') AND ' +
                     '    ((PERBLOQUE IS NULL) OR (PERBLOQUE = ''N''))');

      if cdAux.isEmpty then
      begin
       if CmpRptCM.ParamValues[11].AsBoolean then
          begin
           sTitulo := 'Budgeted x Actual - ' + sNomeOutLing + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
          end
        else
          Begin
           sTitulo := 'Orçado x Realizado - ' + sNomePeriodo + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
          end;
      end
      else
      Begin
        if CmpRptCM.ParamValues[11].AsBoolean then
          Begin
            sTitulo := 'Budgeted x Actual Partial - ' + sNomeOutLing + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
          end
        else
          Begin
            sTitulo := 'Orçado x Realizado Provisório - ' + sNomePeriodo + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
          end;
      end;

      //Imprime os títulos
      pplblTituloOrcamento.caption := sTitulo;

      sTitulo := '';
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      Begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sNomeCentoCustoIni;
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      Begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + sNomeCentoCustoFim;
      end;
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      Begin
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + CmpRptCM.ParamValues[7].AsString;
      end;

      pplblTituloOrcamento2.caption := sTitulo;
   end
   else
   begin
      pplblTituloOrcamento.caption  := CmpRptCM.ParamValues[17].AsString;
      pplblTituloOrcamento2.caption := CmpRptCM.ParamValues[18].AsString;
   end;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[13].AsBoolean then
   begin
      dbtxtCorrespOrc.visible := true;
      dbtxtContaOrc.visible   := false;
   end
   else
   begin
      dbtxtCorrespOrc.visible := false;
      dbtxtContaOrc.visible   := true;
   end;

   //Configura a quebra de página
   if CmpRptCM.ParamValues[10].AsBoolean then
      rptOrcamento.Groups[0].NewPage := true
   else
      rptOrcamento.Groups[0].NewPage := false;

   bValores := CmpRptCM.ParamValues[9].AsBoolean;
   bCodigo  := CmpRptCM.ParamValues[16].AsBoolean;
   bIngles  := CmpRptCM.ParamValues[11].AsBoolean;


   iNumero := CalcNumEleGrau(sMascaraContas, 1);
   //
   with Padroes do
   begin
      SQL.Clear;
      SQL.Add('SELECT                                                           ');
      if CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal then
         SQL.Add('   MA.MOVDATA AS REAL, ')
      else
      Begin
         SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         SQL.Add('     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS REAL,  ');
      end;
      SQL.Add('   SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
      SQL.Add('     - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS ORC,    ');
      SQL.Add('   SA.SALDOREAL, SA.SALDOORC                                     ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S,PLANOCONTA C,                                    ');
      if CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal then
      Begin
         SQL.Add('   (SELECT                                                       ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''D'',L.LACVALOR, (L.LACVALOR*-1))) AS MOVDATA ');
         SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
         SQL.Add('    WHERE (L.PLANO =' + sIntegra_Plano  + ') AND                                  ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND                       ');
         SQL.Add('          (P.PERNUMERO =' + CmpRptCM.ParamValues[1].AsString + ' ) AND                            ');
         SQL.Add('          (P.PLNDATDIA <=TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[2].Asstring) + ',''DD/MM/YYYY'')) AND   ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('       ((L.UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND                               ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('       ((L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
            SQL.Add('       (L.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('       ((L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
            SQL.Add('       (L.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
         end;
         SQL.Add('          (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                              ');
         SQL.Add('          (L.PLACONTA >= ' + sContaIni  + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + sContaFin  + ')) MA,             ');
         SQL.Add('                                                                   ');
      end;
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,  ');
      SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO) ');
      SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =' + sIntegra_Plano  + ') AND                                    ');
      SQL.Add('          (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND                         ');
      SQL.Add('          ((PERNUMERO <=' + CmpRptCM.ParamValues[1].AsString + ') OR (PERNUMERO IS NULL)) AND    ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         SQL.Add('       ((UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         SQL.Add('       ((CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
         SQL.Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      begin
         SQL.Add('       ((CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
         SQL.Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
      end;
      SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                              ');
      SQL.Add('          (PLACONTA >= ' + sContaIni  + ') AND              ');
      SQL.Add('          (PLACONTA <= ' + sContaFin  + ') AND              ');
      SQL.Add('          (PLSTIPO = ''A'') ) SA                                 ');
      SQL.Add('                                                                 ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');
      SQL.Add('    (C.PLANO =' + sIntegra_Plano  + ') AND                                        ');
      SQL.Add('    (S.PEREXERCICIO(+) =' + CmpRptCM.ParamValues[0].AsString + ') AND                          ');
      SQL.Add('    (S.PERNUMERO(+) =' + CmpRptCM.ParamValues[1].AsString + ') AND                               ');
      SQL.Add('    (C.PLATIPO = ''A'') AND                                      ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         SQL.Add(' ((S.UNIDNEGOC(+) =' + CmpRptCM.ParamValues[7].AsString + ') AND                            ');
         SQL.Add(' (S.IDPESSOA(+) =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND                                ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         SQL.Add(' ((S.CODCENTROCUSTO(+) >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND         ');
         SQL.Add(' (S.IDEMPRESA(+) ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      begin
         SQL.Add(' ((S.CODCENTROCUSTO(+) <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND         ');
         SQL.Add(' (S.IDEMPRESA(+) ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                              ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                               ');
      SQL.Add('    (C.PLACONTA >= ' + sContaIni  + ') AND                  ');
      SQL.Add('    (C.PLACONTA <= ' + sContaFin  + ')                      ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('    SA.SALDOREAL, SA.SALDOORC                                    ');
      if CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal then
         SQL.Add('   ,MA.MOVDATA    ');

            //Abre a query e soma os valores //qrytotais

            If cdTotais.Active Then cdTotais.Close;
            cdTotais.Data := Padroes.GetDataPacket(SQL.GetText);

            if cdTotais.FieldByName('REAL').AsFloat > 0  then
               rptOrcamentoLabel9.Caption := FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('REAL').AsFloat))+' D'
            else
               rptOrcamentoLabel9.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('REAL').AsFloat))+' C';

            //
            if cdTotais.FieldByName('ORC').AsFloat > 0  then
               rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('ORC').AsFloat))+' D'
            else
               rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('ORC').AsFloat))+' C';

            //
            if cdTotais.FieldByName('SALDOREAL').AsFloat > 0  then
               rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('SALDOREAL').AsFloat))+' D'
            else
               rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('SALDOREAL').AsFloat))+' C';
            //
            if cdTotais.FieldByName('SALDOORC').AsFloat > 0  then
               rptOrcamentoLabel12.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('SALDOORC').AsFloat))+' D'
            else
               rptOrcamentoLabel12.Caption :=FormatFloat('#,##0.00', ABS(cdTotais.FieldByName('SALDOORC').AsFloat))+' C';
   end;
   //
   //Faz a query principal do Relatório
   with Padroes.Sql do
   Begin
      Clear;
      if CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal then
      Begin
         Add('SELECT                                                           ');
         Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
         Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
         if CmpRptCM.ParamValues[11].AsBoolean then
            Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOME, C.PLANOMEOUTLING,    ')
         else
            Add('   C.PLANOME AS CONTA, C.PLANOMEOUTLING, C.PLANOME,           ');

         Add('   (0) AS REAL,      (0) AS ORC,                                 ');
         Add('   (0) AS SALDOREAL, (0) AS  SALDOORC,                            ');

         //Adicionei no logar dos CalcFields
         Add('   (0) AS SORCABS, (0) AS SREALABS, (0) AS ORCABS, (0) AS REALABS,  ');
         Add('   (0) AS VARPER, (0) AS VARACUM, ('' '') AS DEBCREORC, ('' '') AS DEBCREREAL, ');
         Add('   ('' '') AS DEBCRESORC, ('' '') AS DEBCRESREAL, ('' '') AS NOMEINDENTADO ');

         Add('FROM                                                             ');
         Add('   PLANOCONTA C                                                  ');
         Add('WHERE                                                            ');
         Add('    (C.PLANO =' + sIntegra_Plano  + ') AND                                        ');
         Add('    (C.PLAGRAU <=' + CmpRptCM.ParamValues[12].AsString + ') AND                                      ');
         Add('    (C.PLACONTA >= ' + sContaIni  + ') AND                                ');
         Add('    (C.PLACONTA <= ' + sContaFin  + ')                                    ');
         Add('ORDER BY                                                         ');
         if CmpRptCM.ParamValues[13].AsBoolean then
            Add(' C.PLACONCORRESP                                              ')
         else
            Add(' C.PLACONTA                                                   ');
      end
      else
      Begin
         Add('SELECT                                                           ');
         Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
         Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
         if CmpRptCM.ParamValues[11].AsBoolean then
            Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOME, C.PLANOMEOUTLING,    ')
         else
            Add('   C.PLANOME AS CONTA, C.PLANOMEOUTLING, C.PLANOME,           ');

         Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         Add('     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS REAL,  ');
         Add('   SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
         Add('     - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS ORC,    ');

         Add('   SA.SALDOREAL, SA.SALDOORC                                     ');
         Add('FROM                                                             ');
         Add('   PLANOSALDO S, PLANOCONTA C,                                   ');
         Add('                                                                 ');
         Add('   (SELECT                                                       ');
         Add('       PLACONTA,                                                 ');

         Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
         Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,  ');

         Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO) ');
         Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');

         Add('    FROM PLANOSALDO                                              ');
         Add('    WHERE (PLANO =' + sIntegra_Plano  + ') AND                                    ');
         Add('          (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND                         ');
         Add('          ((PERNUMERO <=' + CmpRptCM.ParamValues[1].AsString + ') OR (PERNUMERO IS NULL)) AND    ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         Begin
            Add('       ((UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
            Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND                               ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         Begin
            Add('       ((CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
            Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         Begin
            Add('       ((CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
            Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
         end;
         Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                              ');
         Add('          (PLACONTA >= ' + sContaIni  + ') AND              ');
         Add('          (PLACONTA <= ' + sContaFin  + ')                  ');
         Add('    GROUP BY PLACONTA ) SA                                       ');
         Add('                                                                 ');
         Add('WHERE                                                            ');
         Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
         Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');
         Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
         Add('    (C.PLANO =' + sIntegra_Plano  + ') AND                                        ');
         Add('    (S.PEREXERCICIO(+) =' + CmpRptCM.ParamValues[0].AsString + ') AND                          ');
         Add('    (S.PERNUMERO(+) =' + CmpRptCM.ParamValues[1].AsString + ') AND                               ');
         Add('    (C.PLAGRAU <=' + CmpRptCM.ParamValues[12].AsString + ') AND                                      ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         Begin
            Add(' ((S.UNIDNEGOC(+) =' + CmpRptCM.ParamValues[7].AsString + ') AND                            ');
            Add(' (S.IDPESSOA(+) =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND                                ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            Add(' ((S.CODCENTROCUSTO(+) >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND         ');
            Add(' (S.IDEMPRESA(+) ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                              ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         Begin
            Add(' ((S.CODCENTROCUSTO(+) <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND         ');
            Add(' (S.IDEMPRESA(+) ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                              ');
         end;
         Add('    (S.IDPESSOA(+) =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                               ');
         Add('    (C.PLACONTA >= ' + sContaIni  + ') AND                  ');
         Add('    (C.PLACONTA <= ' + sContaFin  + ')                      ');
         Add('GROUP BY                                                         ');
         Add('    C.PLACONTA, SA.SALDOREAL, SA.SALDOORC,                       ');
         Add('    C.PLAGRAU, C.PLATIPO,                                        ');
         Add('    C.PLANOMEOUTLING, C.PLANOME, C.PLACONCORRESP                 ');
         Add('HAVING                                                           ');
         Add('   (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         Add('             - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)), 0,');
         Add('   (DECODE(SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
         Add('             - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)), 0,    ');
         Add('   (DECODE(SA.SALDOREAL,NULL,                                    ');
         Add('   (DECODE(SA.SALDOORC,NULL,''0'',''1'')),                       ');
         Add('   ''1'')),''1'')),''1'')) = ''1''                               ');
         Add('ORDER BY                                                         ');
         if CmpRptCM.ParamValues[13].AsBoolean then
            Add(' C.PLACONCORRESP                                              ')
         else
            Add(' C.PLACONTA                                                   ');
      end;

      If cds.Active Then cds.Close;
      cds.Data := Padroes.GetDataPacket(Padroes.Sql.GetText);

      cds.First;
      while not cds.EOF do
      Begin
         //O Teste foi colocado "pra dentro" do while para a atribuição dos antigos CalcFieldsS
         if CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal then
         Begin
            with Padroes do
            Begin
                SQL.Clear;
                SQL.Add('SELECT    ');
                SQL.Add('   SUM(DECODE(P.PLSORCADODEBITO,NULL,0,P.PLSORCADODEBITO)-DECODE(P.PLSORCADOCREDITO,NULL,0,P.PLSORCADOCREDITO)) AS SALDOORC, ');
                SQL.Add('   M.SALDOORCMES ');
                SQL.Add('FROM          ');
                SQL.Add('   PLANOSALDO P,  ');
                SQL.Add('   (SELECT        ');
                SQL.Add('       SUM(DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO)-DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO)) AS SALDOORCMES ');
                SQL.Add('    FROM ');
                SQL.Add('       PLANOSALDO ');
                SQL.Add('    WHERE         ');
                SQL.Add('      (IDPESSOA    =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
                SQL.Add('      (PEREXERCICIO=' + CmpRptCM.ParamValues[0].AsString + ') AND ');
                SQL.Add('      (PERNUMERO   =' + CmpRptCM.ParamValues[1].AsString + ') AND    ');
                SQL.Add('      (PLACONTA    =' + QuotedStr(Espaco(cds.FieldByName('PLACONTA').AsString,18))  + ') AND     ');
                if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
                   SQL.Add('       (UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');

                if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
                Begin
                   SQL.Add('       ((CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ' ) AND        ');
                   SQL.Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;

                if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
                Begin
                   SQL.Add('       ((CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
                   SQL.Add('       (IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;

                SQL.Add('      (PLANO       =' + sIntegra_Plano + ')) M         ');
                SQL.Add('WHERE                                  ');
                SQL.Add('   (P.IDPESSOA    =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND      ');
                SQL.Add('   (P.PEREXERCICIO=' + CmpRptCM.ParamValues[0].AsString + ') AND  ');
                SQL.Add('   ((P.PERNUMERO  <=' + CmpRptCM.ParamValues[1].AsString + ') OR (P.PERNUMERO IS NULL)) AND ');
                if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
                   SQL.Add('       (P.UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
                end;
                if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
                   SQL.Add('       ((P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
                   SQL.Add('       (P.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
                   SQL.Add('       ((P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
                   SQL.Add('       (P.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                SQL.Add('   (P.PLACONTA    =' + QuotedStr(Espaco(cds.FieldByName('PLACONTA').AsString,18))  + ') AND                             ');
                SQL.Add('   (P.PLANO       = ' + sIntegra_Plano + ')                                    ');
                SQL.Add('GROUP BY M.SALDOORCMES                                        ');

                If cdSaldoOrc.Active Then cdSaldoOrc.Close;
                cdSaldoOrc.Data := Padroes.GetDataPacket(Sql.GetText);
            end;
           //
            with Padroes do
            begin
                SQL.Clear;
                SQL.Add('SELECT         ');
                SQL.Add('   (SUM(DECODE(P.PLSDEBITOCORRENTE,NULL,0,P.PLSDEBITOCORRENTE)-DECODE(P.PLSCREDITOCOR,NULL,0,P.PLSCREDITOCOR))+SALDOREAMES) AS SALDOREA, ');
                SQL.Add('   M.SALDOREAMES  ');
                SQL.Add('FROM              ');
                SQL.Add('   PLANOSALDO P,  ');
                SQL.Add('   (SELECT        ');
                SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREAMES  ');
                SQL.Add('    FROM                                                                       ');
                SQL.Add('       PLANILHA P, LANCAMENTO L                                                ');
                SQL.Add('    WHERE                                                                      ');
                SQL.Add('      (P.IDPESSOA    =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                                           ');
                SQL.Add('      (P.PEREXERCICIO=' + CmpRptCM.ParamValues[0].AsString + ') AND                                       ');
                SQL.Add('      (P.PERNUMERO   =' + CmpRptCM.ParamValues[1].AsString + ') AND                                          ');
                SQL.Add('      (P.PLNDATDIA   <=TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[2].Asstring) + ',''DD/MM/YYYY'')) AND                   ');
                SQL.Add('      (L.PLACONTA    LIKE ' + QuotedStr(trim(cds.FieldByName('PLACONTA').AsString)+'%') + ') AND                                    ');
                SQL.Add('      (L.PLANO       =' + sIntegra_Plano  + ') AND                                              ');
                SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                               ');
                if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
                   SQL.Add('       (L.UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
                end;
                if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
                   SQL.Add('       ((L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
                   SQL.Add('       (L.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
                   SQL.Add('       ((L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
                   SQL.Add('       (L.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                                         ');
                SQL.Add('WHERE                                                                          ');
                SQL.Add('   (P.IDPESSOA    =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                                              ');
                SQL.Add('   (P.PEREXERCICIO=' + CmpRptCM.ParamValues[0].AsString + ') AND                                          ');
                SQL.Add('   ((P.PERNUMERO  <' + CmpRptCM.ParamValues[1].AsString + ') OR (P.PERNUMERO IS NULL)) AND                   ');
                if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
                   SQL.Add('       (P.UNIDNEGOC =' + CmpRptCM.ParamValues[7].AsString + ') AND                           ');
                end;
                if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
                   SQL.Add('       ((P.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].Asstring,10)) + ') AND        ');
                   SQL.Add('       (P.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
                   SQL.Add('       ((P.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].Asstring,10)) + ') AND        ');
                   SQL.Add('       (P.IDEMPRESA ='+ FloatToStr(CrmRptCM.IdEmpresa)+')) AND                             ');
                end;
                SQL.Add('   (P.PLACONTA    =' + QuotedStr(Espaco(cds.FieldByName('PLACONTA').AsString,18))  + ') AND                                              ');
                SQL.Add('   (P.PLANO       =' + sIntegra_Plano  + ') ');
                SQL.Add('GROUP BY M.SALDOREAMES ');

                If cdsSaldoRea.Active Then cdsSaldoRea.Close;
                cdsSaldoRea.Data := Padroes.GetDataPacket(Sql.GetText);
            end;
         End;
         //
         if (cdSaldoOrc.FieldByName('SALDOORC').AsFloat = 0) and (cdSaldoOrc.FieldByName('SALDOORCMES').asFloat = 0) and
            (cdsSaldoRea.FieldByName('SALDOREA').AsFloat = 0) and (cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat = 0) and
            (CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal) then
            cds.Delete
         else
         Begin
            with cds do
            begin
               Edit;

               If CmpRptCM.ParamValues[2].AsDateTime <> dtPeriodoFinal Then
               Begin
                  FieldByName('REAL').AsFloat      := cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat;
                  FieldByName('ORC').AsFloat       := cdSaldoOrc.FieldByName('SALDOORCMES').asFloat;
                  FieldByName('SALDOREAL').AsFloat := cdsSaldoRea.FieldByName('SALDOREA').AsFloat;
                  FieldByName('SALDOORC').AsFloat  := cdSaldoOrc.FieldByName('SALDOORC').AsFloat;
               End;

               //Gera a label de débito/crédito
               if not bValores then begin
                  if FieldByName('ORC').asFloat = 0 then begin
                     FieldByName('DEBCREORC').asString := ' ';
                  end;
                  if FieldByName('ORC').asFloat < 0 then begin
                     FieldByName('DEBCREORC').asString := 'C';
                  end else begin
                     FieldByName('DEBCREORC').asString := 'D';
                  end;

                  if FieldByName('REAL').asFloat = 0 then begin
                     FieldByName('DEBCREREAL').asString := ' ';
                  end;
                  if FieldByName('REAL').asFloat < 0 then begin
                     FieldByName('DEBCREREAL').asString := 'C';
                  end else begin
                     FieldByName('DEBCREREAL').asString := 'D';
                  end;

                  if FieldByName('SALDOORC').asFloat = 0 then begin
                     FieldByName('DEBCRESORC').asString := ' ';
                  end;
                  if FieldByName('SALDOORC').asFloat < 0 then begin
                     FieldByName('DEBCRESORC').asString := 'C';
                  end else begin
                     FieldByName('DEBCRESORC').asString := 'D';
                  end;

                  if FieldByName('SALDOREAL').asFloat = 0 then begin
                     FieldByName('DEBCRESREAL').asString := ' ';
                  end;
                  if FieldByName('SALDOREAL').asFloat < 0 then begin
                     FieldByName('DEBCRESREAL').asString := 'C';
                  end else begin
                     FieldByName('DEBCRESREAL').asString := 'D';
                  end;

                  //Tira o sinal dos saldos
                  FieldByName('SORCABS').asFloat  := ABS(FieldByName('SALDOORC').asFloat);
                  FieldByName('SREALABS').asFloat := ABS(FieldByName('SALDOREAL').asFloat);
                  FieldByName('ORCABS').asFloat   := ABS(FieldByName('ORC').asFloat);
                  FieldByName('REALABS').asFloat  := ABS(FieldByName('REAL').asFloat);

               end else begin
                  FieldByName('DEBCREORC').asString := ' ';
                  FieldByName('DEBCREREAL').asString := ' ';
                  FieldByName('DEBCRESORC').asString := ' ';
                  FieldByName('DEBCRESREAL').asString := ' ';

                  //Tira o sinal dos saldos
                  FieldByName('SORCABS').asFloat  := FieldByName('SALDOORC').asFloat;
                  FieldByName('SREALABS').asFloat := FieldByName('SALDOREAL').asFloat;
                  FieldByName('ORCABS').asFloat   := FieldByName('ORC').asFloat;
                  FieldByName('REALABS').asFloat  := FieldByName('REAL').asFloat;

               end;


               //Indenta o Nome da Conta Contábil de acordo com o grau
               sEspacos := '';

               if bIndenta then begin
                  for i := 1 to ((Trunc(FieldByName('PLAGRAU').AsFloat) - 1) * 5) do begin
                     sEspacos := sEspacos + ' ';
                  end;
               end;

               FieldByName('NOMEINDENTADO').asString := sEspacos + (FieldByName('CONTA').asString);

               if FieldByName('ORC').asFloat = 0 then begin
                  FieldByName('VARPER').asFloat := 0;
               end else begin
                  FieldByName('VARPER').asFloat := (((FieldByName('REAL').asFloat - FieldByName('ORC').asFloat) /
                                                    FieldByName('ORC').asFloat)*100);
               end;

               if FieldByName('SALDOORC').asFloat = 0 then begin
                  FieldByName('VARACUM').asFloat := 0;
               end else begin
                  FieldByName('VARACUM').asFloat := (((FieldByName('SALDOREAL').asFloat - FieldByName('SALDOORC').asFloat) /
                                                     FieldByName('SALDOORC').asFloat)*100);
               end;

               Post;
               Next;
            end;
         end;
      end;


      sMascara := '';
      if CmpRptCM.ParamValues[8].asboolean then
      Begin
         sMascara := sMascaraContas;
      end;

      bIndenta := CmpRptCM.ParamValues[14].AsBoolean;
      bEspaco  := CmpRptCM.ParamValues[15].AsBoolean;
   end;
end;

procedure TrptOrcadoRealizado.ppHeaderBand10BeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then begin
      txtContaOrc.visible   := false;
      txtNomeContaOrc.left  := 5;
   end;

   if bIngles then begin
      txtContaOrc.caption     := 'Code';
      txtNomeContaOrc.caption := 'Name';
      txtPeriodo.caption      := 'Current Month';
      txtOrc.caption          := 'Budget';
      txtReal.caption         := 'Actual';
      txtVar.caption          := 'Ratio';
      txtAcumulado.caption    := 'Year to Date';
      txtOrcAcu.caption       := 'Budget';
      txtRealAcu.caption      := 'Actual';
      txtVarAcu.caption       := 'Ratio';
   end else begin
      txtContaOrc.caption     := 'Código';
      txtNomeContaOrc.caption := 'Nome';
      txtPeriodo.caption      := 'Período';
      txtOrc.caption          := 'Orçado';
      txtReal.caption         := 'Realizado';
      txtVar.caption          := 'Variação';
      txtAcumulado.caption    := 'Acumulado no Exercício';
      txtOrcAcu.caption       := 'Orçado';
      txtRealAcu.caption      := 'Realizado';
      txtVarAcu.caption       := 'Variação';
   end;

end;

procedure TrptOrcadoRealizado.bndDetOrcamentoBeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then begin
      dbtxtContaOrc.visible   := false;
      dbtxtCorrespOrc.visible := false;
      dbtxtNomeContaOrc.left  := 5;
   end;

end;

procedure TrptOrcadoRealizado.bndDetOrcamentoBeforeGenerate(
  Sender: TObject);
var PlaTipo : string;
    PlGrau : integer;
begin
  inherited;

   //Controla a altura da banda
   if crmrptcm.ConnectionType = cntBDE then
     Begin
       PlaTipo := cds.FieldByName('PLATIPO').asString;
       PlGrau  := Trunc(cds.FieldByName('PLAGRAU').AsFloat)
     end
   else
     Begin
       PlaTipo := cds.FieldByName('PLATIPO').asString;
       PlGrau  := Trunc(cds.FieldByName('PLAGRAU').AsInteger)
     end;

   if bEspaco then begin
      if (sSintAnal = 'S') or (PlaTipo = 'S') then begin
         bndDetOrcamento.Height := 23;
         dbtxtContaOrc.top      := 9;
         dbtxtCorrespOrc.top    := 9;
         dbtxtNomeContaOrc.top  := 9;
         dbtxtRealPerOrc.top    := 9;
         dbtxtDCRealPerOrc.top  := 9;
         dbtxtOrcPerOrc.top     := 9;
         dbtxtDCOrcPerOrc.top   := 9;
         dbtxtVarPer.top        := 9;
         txtVarPer.top          := 9;
         dbtxtOrcAcumOrc.top    := 9;
         dbtxtDCOrcAcumOrc.top  := 9;
         dbtxtReaLAcumOrc.top   := 9;
         dbtxtDCRealAcumOrc.top := 9;
         dbtxtVarAcum.top       := 9;
         txtVarAcum.top         := 9;
      end else begin
         bndDetOrcamento.Height := 16;
         dbtxtContaOrc.top      := 2;
         dbtxtCorrespOrc.top    := 2;
         dbtxtNomeContaOrc.top  := 2;
         dbtxtRealPerOrc.top    := 2;
         dbtxtDCRealPerOrc.top  := 2;
         dbtxtOrcPerOrc.top     := 2;
         dbtxtDCOrcPerOrc.top   := 2;
         dbtxtVarPer.top        := 2;
         txtVarPer.top          := 2;
         dbtxtOrcAcumOrc.top    := 2;
         dbtxtDCOrcAcumOrc.top  := 2;
         dbtxtReaLAcumOrc.top   := 2;
         dbtxtDCRealAcumOrc.top := 2;
         dbtxtVarAcum.top       := 2;
         txtVarAcum.top         := 2;
      end;
      sSintAnal := PlaTipo;
   end else begin
      bndDetOrcamento.Height := 16;
      dbtxtContaOrc.top      := 2;
      dbtxtCorrespOrc.top    := 2;
      dbtxtNomeContaOrc.top  := 2;
      dbtxtRealPerOrc.top    := 2;
      dbtxtDCRealPerOrc.top  := 2;
      dbtxtOrcPerOrc.top     := 2;
      dbtxtDCOrcPerOrc.top   := 2;
      dbtxtVarPer.top        := 2;
      txtVarPer.top          := 2;
      dbtxtOrcAcumOrc.top    := 2;
      dbtxtDCOrcAcumOrc.top  := 2;
      dbtxtReaLAcumOrc.top   := 2;
      dbtxtDCRealAcumOrc.top := 2;
      dbtxtVarAcum.top       := 2;
      txtVarAcum.top         := 2;
   end;

   if bValores then begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;(#,0.00)';
      dbtxtVarPer.DisplayFormat      := '#,0.00;(#,0.00)';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;(#,0.00)';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;(#,0.00)';
   end else begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;-#,0.00';
      dbtxtVarPer.DisplayFormat      := '#,0.00;-#,0.00';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;-#,0.00';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;-#,0.00';
   end;

   //Configura a máscara das contas contábeis

   if sMascara <> '' then begin
      sMascara := CalcMascaraPorGrau(sMascaraContas, PlGrau);
      dbtxtContaOrc.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptOrcadoRealizado.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:= 'SELECT Distinct '+
                                                     '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEXERNOME, ' +
                                                     '       PERNUMERO, '+
                                                     '       PERNOME, PERNOMEOUTLING, ' +
                                                     '       PERDATFIM '+
                                                     '  FROM PERIODO '+
                                                     ' WHERE (IDPESSOA = '+ FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     ' ORDER BY PEXERNOME';

  CmpRptCM.ParamValues[7].LookupSettings.SQL.Text := ' SELECT UNIDNEGOC, NOME, CONCAT(CONCAT(TO_CHAR(UNIDNEGOC,'+#39+'999'+#39+'),'+#39+' '+#39+ '),NOME) AS DESCRICAO '+
                                                  ' FROM UNIDNEGOCIO '+
                                                  ' WHERE IDPESSOA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                  ' ORDER BY NOME ';

  CmpRptCM.ParamValues[5].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME,CONCAT(CONCAT(CODCENTROCUSTO,'+#39+' '+#39+'),NOME) AS DESCRICAO ' +
                                                ' FROM CENTCUST ' +
                                                ' WHERE IDEMPRESA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                ' ORDER BY CODCENTROCUSTO ';

  CmpRptCM.ParamValues[6].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME,CONCAT(CONCAT(CODCENTROCUSTO,'+#39+' '+#39+'),NOME) AS DESCRICAO ' +
                                                ' FROM CENTCUST ' +
                                                ' WHERE IDEMPRESA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                ' ORDER BY CODCENTROCUSTO ';


end;

procedure TrptOrcadoRealizado.CdsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   //Inicializa a variável de controle de Conta Sistética/Analitica
   sSintAnal := 'A';

end;

end.
