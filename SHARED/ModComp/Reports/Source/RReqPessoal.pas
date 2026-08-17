// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 183027 KINTANA 1720547
//Responsável : RODRIGO DE BRITO FIGUEREDO
//Data        : 25/09/2012
//Descrição   : Reformulação de relatorio.
//
//------------------------------------------------------------------------------

unit RReqPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppVar,
  ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppSubRpt, TXRB, ppModule,
  raCodMod, ppParameter, myChkBox, jpeg;

type
  TRptReqPessoal = class(TFrmCmReport)
    ppReqPessoal: TppBDEPipeline;
    dsReqPessoal: TwwDataSource;
    rpReqPessoal: TppReport;
    sqlReqPessoal: TCMSqlParams;
    CdsReqPessoal: TCMClientDataSet;
    ppParameterList1: TppParameterList;
    rpReqPessoalHdrBnd: TppHeaderBand;
    rpReqPessoalLbl2: TppLabel;
    rpReqPessoalDtlBnd: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    DBMCARAC: TppDBMemo;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel14: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    rpReqPessoalDBMemo3: TppDBMemo;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLabel16: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel4: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppDBMemo2: TppDBMemo;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel13: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppLabel6: TppLabel;
    ppDBCentcust: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel7: TppLabel;
    ppDBCargo: TppDBText;
    ppLine14: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel12: TppLabel;
    ppSubReport6: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLabel5: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    ppSubReport7: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppDBMemo5: TppDBMemo;
    ppLabel15: TppLabel;
    ppSummaryBand7: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLabel17: TppLabel;
    ppDBText3: TppDBText;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSubReport8: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppDBText4: TppDBText;
    raCodeModule3: TraCodeModule;
    raCodeModule4: TraCodeModule;
    raCodeModule5: TraCodeModule;
    raCodeModule6: TraCodeModule;
    raCodeModule7: TraCodeModule;
    ppDBMemo3: TppDBMemo;
    ppDBText5: TppDBText;
    DBCSubs: TmyDBCheckBox;
    DCBAmpli: TmyDBCheckBox;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSubReport9: TppSubReport;
    ppChildReport9: TppChildReport;
    ppSubReport10: TppSubReport;
    ppChildReport10: TppChildReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    DBMCursoSupInc: TppDBMemo;
    ppLabel27: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand10: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    DBMCursoSupComp: TppDBMemo;
    ppLabel28: TppLabel;
    ppSubReport11: TppSubReport;
    ppChildReport11: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppDetailBand11: TppDetailBand;
    ppSummaryBand9: TppSummaryBand;
    ppLabel29: TppLabel;
    DBMCursoEsp: TppDBMemo;
    DCDPrimInco: TmyDBCheckBox;
    DBCPirmComp: TmyDBCheckBox;
    CBPrim: TmyCheckBox;
    DBCSegInco: TmyDBCheckBox;
    DBCSegComp: TmyDBCheckBox;
    CBSeg: TmyCheckBox;
    DBCSupIn: TmyDBCheckBox;
    DBCSupComp: TmyDBCheckBox;
    DBCEsp: TmyDBCheckBox;
    ppSubReport12: TppSubReport;
    ppChildReport12: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand12: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLine46: TppLine;
    ppLabel30: TppLabel;
    ppLine47: TppLine;
    ppLabel36: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppSubReport13: TppSubReport;
    ppChildReport13: TppChildReport;
    ppTitleBand11: TppTitleBand;
    ppDetailBand13: TppDetailBand;
    ppSummaryBand11: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel42: TppLabel;
    ppDBMemo6: TppDBMemo;
    ppSubReport14: TppSubReport;
    ppChildReport14: TppChildReport;
    ppTitleBand12: TppTitleBand;
    ppDetailBand14: TppDetailBand;
    ppSummaryBand12: TppSummaryBand;
    ppDBMemo4: TppDBMemo;
    ppDBText1: TppDBText;
    ppLabel43: TppLabel;
    ppDBText2: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    ppSubReport15: TppSubReport;
    ppChildReport15: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppDetailBand15: TppDetailBand;
    ppSummaryBand13: TppSummaryBand;
    ppLabel46: TppLabel;
    ppDBText13: TppDBText;
    ppLabel47: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel48: TppLabel;
    ppLine1: TppLine;
    ppLine44: TppLine;
    ppLabel31: TppLabel;
    DBCIndicacao: TmyDBCheckBox;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    raCodeModule2: TraCodeModule;
    raCodeModule8: TraCodeModule;
    raCodeModule9: TraCodeModule;
    ppLine27: TppLine;
    ppLine43: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine45: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CBPrimPrint(Sender: TObject);
    procedure DBMCursoSupIncPrint(Sender: TObject);
  public
    NumRequisicao, NomeEstab, NomeCurso, NomeCargo, NomeGrauInstrucao, TipoRequisicao,
    TipoAmpliacao, Situacao, TipoContrato, Sexo, NomeNovoOcupante, NomeSubstituido,
    NomeResponsavel, NomeSupervisor,
    TempoExperiencia,HorarioTrab,Justificativa, Outros, caracpessoais: string;//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547
  end;

var
  RptReqPessoal: TRptReqPessoal;

implementation

uses uSistema;

{$R *.DFM}

procedure TRptReqPessoal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlReqPessoal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  NUMREQ,');
    Add('  '+QuotedStr(Trim(NomeCurso))+' AS NOMECENTROCUSTO,');
    Add('  '+QuotedStr(Trim(NomeCargo))+' AS CARGO,');
    Add('  DATAREQ,');
    Add('  '+QuotedStr(Trim(Sexo))+' AS SEXO,');
    Add('  '+QuotedStr(Trim(NomeResponsavel))+' AS RESPONSAVEL,');
    //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Inicio
    Add('  '+QuotedStr(Trim(TempoExperiencia))+' AS TEMPOEXP,');
    Add('  '+QuotedStr(Trim(HorarioTrab))+' AS HORARIO,');
    Add( Justificativa );
    Add('  (SELECT NOME FROM PESSOA WHERE IDPESSOA = (SELECT IDPESSOA ');
    Add('          FROM REQUICAND WHERE NUMREQ =' +NumRequisicao+ ' AND FLGAPROVADO = 1 )) AS NOME, ');
    Add('   (SELECT COUNT(*) FROM REQUICAND WHERE NUMREQ =' +NumRequisicao+ ') AS CANDENCAMINHADOS, ');
    Add('   DATAPLAN, NVL(OBSERV3,'' '') OBSERV3, NVL(OBSERV2,'' '') OBSERV2,OBSERV, OBSERV4,NVL(OBSERV5,'' '') OBSERV5, IDPROCESSO, ');
    Add('   (SELECT CASE ');
    Add('         WHEN IDGRINSTR BETWEEN  1 AND  3 THEN   0  ');
    Add('         WHEN IDGRINSTR BETWEEN  10 AND  12 THEN  10  ');
    Add('         Else IDGRINSTR ');
    Add('       END IDGRINSTR  ');
    Add('   FROM REQUIPES  ');
    Add('   WHERE NUMREQ = ' +NumRequisicao+') AS IDGRINSTR ,');
    Add('   NVL((SELECT WMSYS.WM_CONCAT(C.DESCRICAO) ||'','' ');
    Add('   FROM CARACPESSOAIS C, REQUIPESXCARACPESSOAIS RC, REQUIPES R ');
    Add('   WHERE RC.NUMREQ =' +NumRequisicao+'  AND RC.NUMREQ = R.NUMREQ');
    Add('         AND RC.IDCARACPESSOAIS = C.IDCARACPESSOAIS GROUP BY R.OBSERV3),'' '') AS AUXCARACPESSOAIS, ');
    Add('   ('''+Outros+''') AS CARACPESSOAIS, ');
    Add('   NUMVAGAS, TIPOREQ, NVL(CURSO,'' '') CURSO, FORMASELECAO, DATAADMISSAO ');
    //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Fim
    Add('FROM');
    Add('  REQUIPES');
    Add('WHERE');
    Add('  (NUMREQ = ' +NumRequisicao+ ')');
  end;
  sqlReqPessoal.Open;
  //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - INICIO
  outros:= CdsReqPessoal.FieldByName('AUXCARACPESSOAIS').AsString+(StringReplace(CdsReqPessoal.FieldByName('OBSERV').AsString,#$D#$A,' ',[rfReplaceAll]));
  outros := trim(outros);
  if(outros <> '')then
  begin
     if ((outros[Length(outros)]) = ',') then
         begin
            outros[Length(outros)] := ' ';
          end;
   end;
  //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - FIM                                    }
end;

//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Inicio
procedure TRptReqPessoal.CBPrimPrint(Sender: TObject);
begin
  inherited;
  CBPrim.Checked:=((DBCPirmComp.Checked)or(DCDPrimInco.Checked));
  CBSeg.Checked:=((DBCSegComp.Checked)or(DBCSegInco.Checked));
end;
//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Fim

//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Inicio
procedure TRptReqPessoal.DBMCursoSupIncPrint(Sender: TObject);
begin
  inherited;
  DBMCursoSupInc.Visible:=(DBCSupIn.Checked);
  DBMCursoSupComp.Visible:=(DBCSupComp.Checked);
  DBMCursoEsp.Visible:=(DBCEsp.Checked);
end;
//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Fim
end.
