unit RMapaTrein;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina      : CrmRptCMBeforePrint
Data        : 12/05/2009
Autor       : Bruno Bastos
SOL_Kintana : 116806_549481
Descrição   : Ajuste para gravar a query no caminho parametrizado no banco.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, uCtrlPadroes, uCtrlCurso, TXRB, uSistema;

type
  TRptMapaTrein = class(TFrmCmReport)
    sqlMapaTrein: TCMSqlParams;
    CdsMapaTrein: TCMClientDataSet;
    dsMapaTrein: TwwDataSource;
    ppMapaTrein: TppBDEPipeline;
    rpMapaTrein: TppReport;
    rpMapaTreinDtlBnd: TppDetailBand;
    rpAtivCursoSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    lblCurso1: TppLabel;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    lblCurso2: TppLabel;
    ppDBText2: TppDBText;
    lblCurso3: TppLabel;
    ppDBText4: TppDBText;
    lblCurso4: TppLabel;
    ppDBText5: TppDBText;
    lblCurso5: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppLine2: TppLine;
    lblCurso6: TppLabel;
    lblCurso7: TppLabel;
    lblCurso8: TppLabel;
    lblCurso9: TppLabel;
    lblCurso10: TppLabel;
    CdsCurso: TCMClientDataSet;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure GravaDadosQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;
  end;

var
  RptMapaTrein: TRptMapaTrein;

implementation

uses uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptMapaTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);
end;

procedure TRptMapaTrein.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlCurso);
  inherited;
end;

procedure TRptMapaTrein.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
       (CmpRptCM.ParamByName('SelCurso2').asBoolean) or
       (CmpRptCM.ParamByName('SelCurso3').asBoolean) or
       (CmpRptCM.ParamByName('SelCurso4').asBoolean) then
    begin
      Add('SELECT');
      Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, F.MATRICULA,');
      Add('   DECODE(H.DATREINI, NULL, H.DATPLINI, H.DATREINI) AS DATREF,');
      Add('   CC.NOME AS CENTROCUSTO,');
      Add('   CU.DESCRICAO, CU.IDCURSO, ');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   DECODE(H.DATREFIM,NULL,DECODE(H.DATPLFIM,NULL,'' '',''P''),''R'') || ');
      Add('   DECODE(H.DATREFIM,NULL,TO_CHAR(H.DATPLFIM,''DD/MM/YYYY''), TO_CHAR(H.DATREFIM,''DD/MM/YYYY'')) AS RESULTADO');
      Add('FROM PESSOA PJ, PESSOA PF, HSTTRN H, FUNCIONARIO F, CURSO CU, CENTCUST CC');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

      if CmpRptCM.ParamByName('IncPorConta').asInteger = 1 then
        Add('AND     H.FLGCONTROLE = 1');

      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');

      Add('AND     (');

      if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
      begin
        Add('   (H.DATPLINI IS NOT NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
           Add(' OR ');
        Add('   (H.DATPLINI IS NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
           Add(' OR ');
        Add('   (H.DATREFIM IS NULL AND');
        Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso4').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
           Add(' OR ');
        Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
      end;

      Add(' )');

      Add('AND     H.IDCURSO    = CU.IDCURSO');
      Add('AND     H.IDPESSOA   = F.IDPESSOA');
      Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
      Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
      if CmpRptCM.ParamByName('SelCurso5').asBoolean then
        Add('UNION');
    end;

    if CmpRptCM.ParamByName('SelCurso5').asBoolean then
    begin
      Add('SELECT');
      Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, F.MATRICULA,');
      Add('   TO_DATE('''') AS DATREF,');
      Add('   CC.NOME AS CENTROCUSTO,');
      Add('   CU.DESCRICAO, CU.IDCURSO,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   '' '' AS  RESULTADO');
      Add('FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F, CENTCUST CC, CURSO CU');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');
      Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
      Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');
      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
      Add('                     FROM HSTTRN H');
      Add('                     WHERE ');
      Add('                     H.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ') AND');
      if CmpRptCM.ParamByName('IncPorConta').asInteger = 1 then
        Add('                   (H.FLGCONTROLE = 1) AND');
      Add('                     (H.IDPESSOA = F.IDPESSOA)))');
    end;
    Add('ORDER BY');

    case (CmpRptCM.ParamByName('SeqRelat').asInteger) of
      0 : Add('  2 DESC, 4 DESC');
      1 : Add('  3 DESC, 4 DESC');
      2 : Add('  5 DESC, 2 DESC, 4 DESC');
     else Add('  5 DESC, 3 DESC, 4 DESC');
    end;

    //Bruno Bastos - SOL 116806 - Kintana - 549481 - SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Bruno Bastos - SOL 116806 - Kintana - 549481
  end;
  dmCds.SQL.Open;

  // Monta Query Principal
  GravaDadosQuery;
  CdsMapaTrein.First;
end;

procedure TRptMapaTrein.GravaDadosQuery;
var
  c, c2: integer;
  CodCurso: array[1..10] of string;
  sMatricula, sCurso: string;
begin
  // Prepara os códigos e os títulos
  for c := 1 to 10 do
    CodCurso[c] := '';

  sCurso := CmpRptCM.ParamByName('ListaCurso').asString;

  for c:=1 to CmpRptCM.ParamByName('ContaCurso').asInteger do
  begin
    c2 := pos(',', sCurso);
    if (c2 = 0) then
      c2 := length(sCurso) + 1;
    CodCurso[c] := trim(copy(sCurso, 1, c2-1));
    sCurso := copy(sCurso, c2 + 1, length(sCurso) - c2 + 1);
  end;

  for c:=1 to 10 do
    if CodCurso[c] <> '' then
    begin
      CdsCurso.Data := CtrlCurso.ListGeral(StrToFloat(CodCurso[c]));
      TppLabel(Self.FindComponent('lblCurso'+IntToStr(c))).Caption :=
        FU.IFF(CdsCurso.FieldByName('ABREV').asString = '',
          copy(CdsCurso.FieldByName('DESCRICAO').asString,1,10),
          CdsCurso.FieldByName('ABREV').asString);
    end
    else
      TppLabel(Self.FindComponent('lblCurso'+IntToStr(c))).Caption := '';

  sqlMapaTrein.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    // LOOP para todas as linhas
    repeat
      CdsMapaTrein.Insert;
      CdsMapaTrein.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsMapaTrein.FieldByName('PERIODO').asString := dmCds.Cds.FieldByName('PERIODO').asString;
      CdsMapaTrein.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsMapaTrein.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsMapaTrein.FieldByName('CENTROCUSTO').asString := dmCds.Cds.FieldByName('CENTROCUSTO').asString;
      CdsMapaTrein.FieldByName('DATREF').asString := dmCds.Cds.FieldByName('DATREF').asString;
      CdsMapaTrein.FieldByName('DESCRICAO').asString := dmCds.Cds.FieldByName('DESCRICAO').asString;

      sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;

      // Preencho UMA Linha
      repeat
        for c:=1 to 10 do
          if (CodCurso[c] = dmCds.Cds.FieldByName('IDCURSO').asString) then
            break;
        CdsMapaTrein.FieldByName('CURSO_'+IntToStr(c)).asString :=
                                        dmCds.Cds.FieldByName('RESULTADO').asString;
        dmCds.Cds.Next;
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);

      CdsMapaTrein.Post;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsMapaTrein.Insert;
    CdsMapaTrein.Post;
  end;
end;

end.
