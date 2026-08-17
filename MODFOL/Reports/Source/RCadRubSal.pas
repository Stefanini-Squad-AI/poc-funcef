// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : CrmRptCMBeforePrint (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCadRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppMemo, ppCtrls, ppClass,
  ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, ppVar, DBTables,
  TXRB;

type
  TRptCadRubSal = class(TFrmCmReport)
    ppCadRubSal2: TppBDEPipeline;
    dsCadRubSal2: TDataSource;
    ppCadRubSal1: TppBDEPipeline;
    dsCadRubSal1: TDataSource;
    rpCadRubSal: TppReport;
    rpCadRubSalHdrBnd: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    rpCadRubSalDBText25: TppDBText;
    rpCadRubSalSysVar1: TppSystemVariable;
    rpCadRubSalSysVar2: TppSystemVariable;
    rpCadRubSalDtlBnd: TppDetailBand;
    rpCadRubSalFootBnd: TppFooterBand;
    rpCadRubSalSmryBnd: TppSummaryBand;
    rpCadRubSalGroup1: TppGroup;
    rpCadRubSalGrpHdrBnd1: TppGroupHeaderBand;
    rpCadRubSalShape6: TppShape;
    rpCadRubSalShape4: TppShape;
    rpCadRubSalShape10: TppShape;
    rpCadRubSalShape9: TppShape;
    rpCadRubSalShape8: TppShape;
    rpCadRubSalShape7: TppShape;
    rpCadRubSalShape1: TppShape;
    rpCadRubSalShape2: TppShape;
    rpCadRubSalShape3: TppShape;
    rpCadRubSalShape5: TppShape;
    rpCadRubSalDBText26: TppDBText;
    rpCadRubSalDBText27: TppDBText;
    rpCadRubSalDBText1: TppDBText;
    rpCadRubSalDBText2: TppDBText;
    rpCadRubSalDBText3: TppDBText;
    rpCadRubSalDBText4: TppDBText;
    rpCadRubSalDBText5: TppDBText;
    rpCadRubSalDBText6: TppDBText;
    rpCadRubSalDBText7: TppDBText;
    rpCadRubSalDBText8: TppDBText;
    rpCadRubSalDBText10: TppDBText;
    rpCadRubSalDBText12: TppDBText;
    rpCadRubSalDBText13: TppDBText;
    rpCadRubSalDBText14: TppDBText;
    rpCadRubSalDBText15: TppDBText;
    rpCadRubSalDBText16: TppDBText;
    rpCadRubSalDBText17: TppDBText;
    rpCadRubSalLabel1: TppLabel;
    rpCadRubSalLabel2: TppLabel;
    rpCadRubSalLabel3: TppLabel;
    rpCadRubSalLabel4: TppLabel;
    rpCadRubSalLabel5: TppLabel;
    rpCadRubSalLabel6: TppLabel;
    rpCadRubSalLabel7: TppLabel;
    rpCadRubSalLabel8: TppLabel;
    rpCadRubSalLabel9: TppLabel;
    rpCadRubSalLabel10: TppLabel;
    rpCadRubSalLabel11: TppLabel;
    rpCadRubSalLabel13: TppLabel;
    rpCadRubSalLabel15: TppLabel;
    rpCadRubSalLabel16: TppLabel;
    rpCadRubSalLabel18: TppLabel;
    rpCadRubSalLabel19: TppLabel;
    rpCadRubSalDBText19: TppDBText;
    rpCadRubSalLine1: TppLine;
    rpCadRubSalGrpFootBnd1: TppGroupFooterBand;
    ppCadRubSal: TppBDEPipeline;
    dsCadRubSal: TDataSource;
    CadRubSalSubRep1: TppSubReport;
    rpCadRubSalChildReport1: TppChildReport;
    rpCadRubSalChildReport1TitleBand1: TppTitleBand;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine5: TppLine;
    rpCadRubSalLabel20: TppLabel;
    rpCadRubSalLabel21: TppLabel;
    rpCadRubSalLabel22: TppLabel;
    rpCadRubSalLabel23: TppLabel;
    rpCadRubSalLabel24: TppLabel;
    rpCadRubSalChildReport1Label1: TppLabel;
    rpCadRubSalChildReport1DetailBand1: TppDetailBand;
    rpCadRubSalSubRepDBTxt1: TppDBText;
    rpCadRubSalSubRepDBTxt2: TppDBText;
    rpCadRubSalSubRepDBTxt3: TppDBText;
    rpCadRubSalSubRepDBTxt4: TppDBText;
    rpCadRubSalSubRepDBTxt5: TppDBText;
    rpCadRubSalSubRepDBTxt6: TppDBText;
    rpCadRubSalSubRepDBTxt7: TppDBText;
    CadRubSalSubRep2: TppSubReport;
    rpCadRubSalChildReport2: TppChildReport;
    rpCadRubSalChildReport2TitleBand1: TppTitleBand;
    rpCadRubSalChildReport2Label1: TppLabel;
    rpCadRubSalChildReport2Label2: TppLabel;
    rpCadRubSalChildReport2Line1: TppLine;
    rpCadRubSalChildReport2Label3: TppLabel;
    rpCadRubSalChildReport2Label4: TppLabel;
    rpCadRubSalChildReport2Label5: TppLabel;
    rpCadRubSalChildReport2Label6: TppLabel;
    rpCadRubSalChildReport2Label7: TppLabel;
    rpCadRubSalChildReport2Label8: TppLabel;
    rpCadRubSalChildReport2DetailBand1: TppDetailBand;
    rpCadRubSalSubRep2DBTxt1: TppDBText;
    rpCadRubSalSubRep2DBTxt2: TppDBText;
    rpCadRubSalSubRep2DBTxt3: TppDBText;
    rpCadRubSalSubRep2DBTxt4: TppDBText;
    rpCadRubSalSubRep2DBTxt5: TppDBText;
    rpCadRubSalSubRep2DBTxt6: TppDBText;
    rpCadRubSalSubRep2DBTxt7: TppDBText;
    qryCadRubSal: TQuery;
    qryCadRubSal2: TQuery;
    qryCadRubSal1: TQuery;
    updSQL: TUpdateSQL;
    ppCadRubSal3: TppBDEPipeline;
    dsCadRubSal3: TDataSource;
    qryCadRubSal3: TQuery;
    CadRubSalSubRep3: TppSubReport;
    rpCadRubSalChildReport3: TppChildReport;
    rpCadRubSalChildReport3TitleBand1: TppTitleBand;
    rpCadRubSalChildReport3Label2: TppLabel;
    rpCadRubSalChildReport3Line1: TppLine;
    rpCadRubSalChildReport3Lbl1: TppLabel;
    rpCadRubSalChildReport3DtlBnd: TppDetailBand;
    rpCadRubSalSubRep3DBTxt1: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadRubSalAfterScroll(DataSet: TDataSet);
    procedure rpCadRubSalSmryBndAfterPrint(Sender: TObject);
  private
    procedure GerarDadosRelat1;
    procedure GerarDadosRelat2;    
  end;

var
  RptCadRubSal: TRptCadRubSal;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptCadRubSal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (qryCadRubSal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ')  AS EMPRESA,');
    Add('  PD.IDPROVENTO,');
    Add('  RP.CODPROVDESC AS COD_RUBRICA,');
    Add('  PD.DESCRICAO AS NOME_RUBRICA,');
    Add('  DECODE(PD.FLGDESCONTO,0,''Provento'',1,''Desconto'',''Outro'') AS TIPO,');
    Add('  RB.DESCRICAO AS RUBRICACLT,');
    Add('  R1.NOMEREGRA AS REGRA,');
    Add('  INF.NOMEINFORME AS INFORME,');
    Add('  NAT.DESCRICAO AS NATUROPER,');
    Add('  PD.NUMPRIORIDADE,');
    Add('  DECODE(PD.FLGCONSTAFOLHA,0,'' '',''X'') AS CONSTAFOLHA,');
    Add('  DECODE(PD.FLGOBRIGAFAVOREC,0,'' '',''X'') AS OBRIGAFAVOREC,');
    Add('  DECODE(PD.FLGCONSOLIDA,0,'' '',''X'') AS CONSOLIDA,');
    Add('  DECODE(PD.FLGESPECIAL,0,'' '',''X'') AS ESPECIAL,');
    Add('  DECODE(PD.FLGPRORATA,0,'' '',''X'') AS PRORATA,');
    // INICIO - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
    Add('  DECODE(RXE.FLGSALFAMILIA,0,'' '',''X'') AS FOLHANORMAL,');
    Add('  DECODE(RXE.FLGFERIAS,0,'' '',''X'') AS FERIAS,');
    Add('  DECODE(RXE.FLGFERIAS,1,R2.NOMEREGRA,'''') AS REGRAFERIAS,');
    Add('  DECODE(RXE.FLGDECIMOTERCEIRO,0,'' '',''X'') AS DECIMOTERCEIRO,');
    Add('  DECODE(RXE.FLGDECIMOTERCEIRO,1,R3.NOMEREGRA,'''') AS REGRADECIMOTERCEIRO,');
    Add('  DECODE(RXE.FLGRESCISAO,0,'' '',''X'') AS RESCISAO,');
    Add('  DECODE(RXE.FLGRESCISAO,1,R4.NOMEREGRA,'''') AS REGRARESCISAO');
    // FIM - edilaine - SOL 191668 / KTN 1820235
    Add('FROM');
    Add('  PROVDESC PD, RUBRICAXPESS RP, RUBRICACLT RB, REGRA R1, REGRA R2,');
    Add('  REGRA R3, REGRA R4, INFORME INF, NATURENDIMENTO NAT,');
    Add('  VW_RUBXEVENTO RXE ');   // edilaine - SOL 191668 / KTN 1820235
    // ------------------------------------------------------------------------------- //
    Add('WHERE');

    // Rubrica(s) selecionada(s)
    if (Trim(CmpRptCM.ParamByName('ListaIdRubrica').asString) <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
        Add('  (RP.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
      else
        Add('  (RP.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

    Add('  (RP.IDPESSOA        = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    Add('  (RP.IDRUBRICA       = PD.IDPROVENTO) AND');

    Add('  (PD.IDPROVENTO      = RXE.IDPROVENTO(+)) AND ');   // edilaine - SOL 191668 / KTN 1820235

    Add('  (PD.CODRUBCLT       = RB.CODRUBCLT(+)) AND');
    Add('  (PD.IDREGRA         = R1.IDREGRA(+)) AND');
    // inicio - edilaine - SOL 191668 / KTN 1820235
    {Add('  (PD.IDREGRAFERIAS   = R2.IDREGRA(+)) AND');
    Add('  (PD.IDREGRA13       = R3.IDREGRA(+)) AND');
    Add('  (PD.IDREGRARESCISAO = R4.IDREGRA(+)) AND');}
    Add('  (RXE.IDREGRAFERIAS   = R2.IDREGRA(+)) AND');
    Add('  (RXE.IDREGRA13       = R3.IDREGRA(+)) AND');
    Add('  (RXE.IDREGRARESCISAO = R4.IDREGRA(+)) AND');
    // fim - edilaine - SOL 191668 / KTN 1820235

    Add('  (PD.IDINFORME       = INF.IDINFORME(+)) AND');
    Add('  (PD.CODIRRFDARF     = NAT.CODNATUREZA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,1 : Add('  COD_RUBRICA');
      2,3 : Add('  NOME_RUBRICA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  CadRubSalSubRep1.Visible := CmpRptCM.ParamByName('ImprimeRubIncidEm').asBoolean;
  CadRubSalSubRep2.Visible := CmpRptCM.ParamByName('ImprimeRubIncidDe').asBoolean;
  CadRubSalSubRep3.Visible := CmpRptCM.ParamByName('ImprimeIncidAfast').asBoolean;

  if (CadRubSalSubRep1.Visible) then
  begin
    CadRubSalSubRep1.DataPipeline := ppCadRubSal1;
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,2 : qryCadRubSal1.SQL.Add('ORDER BY CODIGO');
      1,3 : qryCadRubSal1.SQL.Add('ORDER BY NOME');
    end;
  end
  else
    CadRubSalSubRep1.DataPipeline := nil;

  if (CadRubSalSubRep2.Visible) then
  begin
    CadRubSalSubRep2.DataPipeline := ppCadRubSal2;
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,2 : qryCadRubSal2.SQL.Add('ORDER BY CODIGO');
      1,3 : qryCadRubSal2.SQL.Add('ORDER BY NOME');
    end;
  end
  else
    CadRubSalSubRep2.DataPipeline := nil;

  if (CadRubSalSubRep3.Visible) then
  begin
    CadRubSalSubRep3.DataPipeline := ppCadRubSal3;
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,2 : qryCadRubSal3.SQL.Add('ORDER BY IDSITFUNC');
      1,3 : qryCadRubSal3.SQL.Add('ORDER BY DESCRICAO');
    end;
  end
  else
    CadRubSalSubRep3.DataPipeline := nil;

  qryCadRubSal.Open;
  frmAguarde.Max := qryCadRubSal.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCadRubSal.CdsCadRubSalAfterScroll(DataSet: TDataSet);
begin
  if (CadRubSalSubRep1.Visible) then
    GerarDadosRelat1;
  if (CadRubSalSubRep2.Visible) then
    GerarDadosRelat2;

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadRubSal.rpCadRubSalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptCadRubSal.GerarDadosRelat1;
begin
{  with (sqlCadRubSal1) do
  begin
    SQL.Clear;
    SQL.Add('SELECT DISTINCT');
    SQL.Add('  RXB.IDRUBPRINC,');
    SQL.Add('  PD.DESCRICAO AS NOME,');
    SQL.Add('  RP.CODPROVDESC AS CODIGO,');
    SQL.Add('  DECODE(RXB.FLGBASECALC,1,''Não'',0,''Sim'') AS BASECALC,');
    SQL.Add('  DECODE(RXB.FLGTIPOFOLHA,1,''Não'',0,''Sim'') AS TIPOFOLHA,');
    SQL.Add('  RXB.INDPERIODO AS PER_INCID,');
    SQL.Add('  DECODE(RXB.FLGACAOINCIDE,1,''Não'',0,''Sim'') AS SOMA,');
    SQL.Add('  PD.NUMPRIORIDADE AS SEQ');
    SQL.Add('FROM');
    SQL.Add('  RUBXRUB RXB, PROVDESC PD, RUBRICAXPESS RP');
    SQL.Add('WHERE');
    SQL.Add('  (RXB.IDRUBPRINC  = ' +CdsCadRubSal.FieldByName('IDPROVENTO').asString+ ') AND');
    SQL.Add('  (RP.IDPESSOA     = ' +IntToStr(CmpRptCM.ParamByName('IdEmpresa').asInteger)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (RXB.IDRUBSECUND = PD.IDPROVENTO) AND');
    SQL.Add('  (PD.IDPROVENTO   = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,1 : SQL.Add('  CODIGO');
      2,3 : SQL.Add('  NOME');
    end;
    SQL.SaveToFile('c:\qryDetalhe1.txt');
  end;
  sqlCadRubSal1.Open;}
end;

procedure TRptCadRubSal.GerarDadosRelat2;
begin
{  with (sqlCadRubSal2) do
  begin
    SQL.Clear;
    SQL.Add('SELECT DISTINCT');
    SQL.Add('  RXB.IDRUBSECUND,');
    SQL.Add('  PD.DESCRICAO AS NOME,');
    SQL.Add('  RP.CODPROVDESC AS CODIGO,');
    SQL.Add('  DECODE(RXB.FLGBASECALC,1,''Não'',0,''Sim'') AS BASECALC,');
    SQL.Add('  DECODE(RXB.FLGTIPOFOLHA,1,''Não'',0,''Sim'') AS TIPOFOLHA,');
    SQL.Add('  RXB.INDPERIODO AS PER_INCID,');
    SQL.Add('  DECODE(RXB.FLGACAOINCIDE,1,''Não'',0,''Sim'') AS SOMA,');
    SQL.Add('  PD.NUMPRIORIDADE AS SEQ');
    SQL.Add('FROM');
    SQL.Add('  RUBXRUB RXB, PROVDESC PD, RUBRICAXPESS RP');
    SQL.Add('WHERE');
    SQL.Add('  (RXB.IDRUBSECUND = ' +CdsCadRubSal.FieldByName('IDPROVENTO').asString+ ') AND');
    SQL.Add('  (RP.IDPESSOA     = ' +IntToStr(CmpRptCM.ParamByName('IdEmpresa').asInteger)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (RXB.IDRUBPRINC  = PD.IDPROVENTO) AND');
    SQL.Add('  (PD.IDPROVENTO   = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0,1 : SQL.Add('  CODIGO');
      2,3 : SQL.Add('  NOME');
    end;
    SQL.SaveToFile('c:\qryDetalhe2.txt');
  end;
  sqlCadRubSal2.Open;}
end;

end.
