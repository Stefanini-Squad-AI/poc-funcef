// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RDemPagEspecial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppCache, TXRB;

type
  TRptDemPagEspecial = class(TFrmCmReport)
    rpDemPagEspecial: TppReport;
    ppDemPagEspecial: TppBDEPipeline;
    dsDemPagEspecial: TwwDataSource;
    CdsDemPagEspecial: TCMClientDataSet;
    sqlDemPagEspecial: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    lblPeriodo: TppLabel;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppCalc1: TppSystemVariable;
    rpFolhaNormalCalc1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsDemPagEspecialAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  end;

var
  RptDemPagEspecial: TRptDemPagEspecial;

implementation

uses uSistema, uCtrlUsoGeralRH, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TRptDemPagEspecial.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  iMes, iAno: integer;
begin
  inherited;
  iMes := StrToInt(Copy(CmpRptCM.ParamByName('Mes2').asString,6,2));
  iAno := StrToInt(Copy(CmpRptCM.ParamByName('Mes2').asString,1,4));
  rpDemPagEspecial.PrinterSetup.DocumentName := CmpRptCM.ParamByName('Titulo').asString;
  lblPeriodo.Caption :=
    'Período: '+ Copy(CmpRptCM.ParamByName('Mes1').asString,6,2) + '/' +
                 Copy(CmpRptCM.ParamByName('Mes1').asString,1,4) + ' a ' +
                 Copy(CmpRptCM.ParamByName('Mes2').asString,6,2) + '/' +
                 Copy(CmpRptCM.ParamByName('Mes2').asString,1,4);

  with (sqlDemPagEspecial.SQL) do
  begin
    Clear;
    for c:=1 to 8 do
    begin
      if CmpRptCM.ParamByName('Titulo'+IntToStr(c)+'Linha1').asString <> '' then
      begin
        if (length(GetText) > 10) then
           Add('UNION');
        Add('SELECT');
        Add('  PJ.NOME AS EMPRESA,');
        Add('  F.MATRICULA,');
        Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Ef.Especial'',');
        Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
        Add('    ''P'',''Prop/Diretor'', ''A'',''Autônomo'', ''Indefinido'') AS TIPOCONTRATO,');
        Add('  PF.NOME AS EMPREGADO,');
        Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
        Add('  CC.CODCENTROCUSTO,');
        Add('  F.DATAADMISSAO,');
        Add('  C.TITULO AS CARGO,');
        Add('  SQ.DESCRICAO AS RUBRICA, SQ.VALOR,');
        Add('  '+IntToStr(c)+' AS IDGRUPO,');
        Add('  '+QuotedStr(CmpRptCM.ParamByName('Titulo'+IntToStr(c)+'Linha1').asString)+' AS GRUPO');


        Add('FROM');
        Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F,');
        Add('  CARGO C, CENTCUST CC, SITFUNC ST,');

        Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO,');
        Add('   SUM(H.VALORPROVENTO*DECODE(P.FLGDESCONTO,1,-1,1)) AS VALOR');
        Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC P');
        Add('   WHERE ');

        if (Pos(',', CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString) > 0) then
          Add('          (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString+ ')) AND')
        else
          Add('          (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString+ ') AND');

        Add('          (H.MES             BETWEEN ' +QuotedStr(CmpRptCM.ParamByName('Mes1').asString));
        Add('           AND ' +QuotedStr(CmpRptCM.ParamByName('Mes2').asString)+ ') AND');
        Add('          (H.IDPESSJUR       = RP.IDPESSOA)  AND');
        Add('          (H.IDRUBRICA       = RP.IDRUBRICA) AND');
        Add('          (H.IDRUBRICA       = P.IDPROVENTO)');
        Add('   GROUP BY H.IDPESSOA, RP.DESCRPROVDESC) SQ');

        if (CmpRptCM.ParamByName('BuscaHist').AsInteger = 0) then
        begin
          // Última evolução Funcional do Funcionário
          // --------------------------------------------------------------------------------------
          Add('  ,(SELECT EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
          Add('    FROM   EVOLFUNC EVOL,');
          Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
          Add('           FROM   EVOLFUNC');
          Add('           WHERE');
          Add('            (DATAALTERFUNC <= TO_DATE('+
            QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
            ',''DD/MM/YYYY''))');
          Add('           GROUP BY IDPESSOA) HST2,');
          Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
          Add('           FROM   EVOLFUNC');
          Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
            QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
            IntToStr(iAno))+ ',''DD/MM/YYYY''))');
          Add('           GROUP BY IDPESSOA) HST3');
          Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
          Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
          Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
          Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
          // -----------------------------------------------------------------------
        end;
        Add('WHERE');
        Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');


        if (CmpRptCM.ParamByName('BuscaHist').AsInteger = 0) then
        begin
          // C. Custo(s) selecionado(s)
          if (CmpRptCM.ParamByName('CodCCusto').asString <> '') then
            if (Pos(',', CmpRptCM.ParamByName('CodCCusto').asString) > 0) then
              Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('CodCCusto').asString+ ')) AND')
            else
              Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CmpRptCM.ParamByName('CodCCusto').asString+ ') AND');

          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end
        else
        begin
          // C. Custo(s) selecionado(s)
          if (CmpRptCM.ParamByName('CodCCusto').asString <> '') then
            if (Pos(',', CmpRptCM.ParamByName('CodCCusto').asString) > 0) then
              Add('        (TRIM(F.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('CodCCusto').asString+ ')) AND')
            else
              Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CmpRptCM.ParamByName('CodCCusto').asString+ ') AND');

          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('        (TRIM(F.CODCENTROCUSTO) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        Add('  (F.DATAADMISSAO   <= TO_DATE(' +
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
          ',''DD/MM/YYYY'')) AND');

        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
        Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
        Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
        Add('  (F.IDPESSOA        = SQ.IDPESSOA) AND');
        if (CmpRptCM.ParamByName('BuscaHist').AsInteger = 0) then
        begin
          Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
          Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)  = CC.CODCENTROCUSTO) AND');
          Add('  (DECODE(HST.IDFUNCAO,NULL,DECODE(HST.IDCARGO,NULL,DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO),HST.IDCARGO),HST.IDFUNCAO) = C.IDCARGO) AND');
          Add('  (F.IDPESSOA        = HST.IDPESSOA(+))');
        end
        else
        begin
          Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
          Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
          Add('  (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO)');
        end;

      end; // final do CmpRptCM.ParamByName('TituloLinha').asString <> ''
    end; //   final do:  for c:=1 to 8 do

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordem').asInteger) of
      0 : Add('  4, 11, 9');
      1 : Add('  2, 11, 9');
      2 : Add('  8, 4, 11, 9');
      3 : Add('  8, 2, 11, 9');
      4 : Add('  5, 4, 11, 9');
      5 : Add('  5, 2, 11, 9');
      6 : Add('  6, 4, 11, 9');
      7 : Add('  6, 2, 11, 9');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra(CmpRptCM.ParamByName('Titulo').asString);
  frmAguarde.Pos := 0;
  frmAguarde.Update;

  sqlDemPagEspecial.Open;
  frmAguarde.Max := CdsDemPagEspecial.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptDemPagEspecial.CdsDemPagEspecialAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptDemPagEspecial.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
