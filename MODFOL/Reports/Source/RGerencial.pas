// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppSubRpt, uCMClientDataset, DBClient,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, TXRB;

type
  TRptGerencial = class(TFrmCmReport)
    ppGerencial2: TppBDEPipeline;
    dsGerencial2: TwwDataSource;
    ppGerencial3: TppBDEPipeline;
    dsGerencial3: TwwDataSource;
    ppGerencial4: TppBDEPipeline;
    dsGerencial4: TwwDataSource;
    ppGerencial5: TppBDEPipeline;
    dsGerencial5: TwwDataSource;
    ppGerencial6A: TppBDEPipeline;
    dsGerencial6A: TwwDataSource;
    ppGerencial6B: TppBDEPipeline;
    dsGerencial6B: TwwDataSource;
    ppGerencial7: TppBDEPipeline;
    dsGerencial7: TwwDataSource;
    ppGerencial1: TppBDEPipeline;
    dsGerencial1: TwwDataSource;
    rpGerencial: TppReport;
    rpGerencialDtlBnd: TppDetailBand;
    rpGerencialFootBnd: TppFooterBand;
    ppGerencial: TppBDEPipeline;
    dsGerencial: TwwDataSource;
    ppGroup16: TppGroup;
    rpGerencialGrpHdrBnd: TppGroupHeaderBand;
    rpGerencialGrpFootBnd: TppGroupFooterBand;
    rpGerencialLbl1: TppLabel;
    rpGerencialLblMes: TppLabel;
    rpGerencialMemo1: TppMemo;
    rpGerencialLblSetor: TppLabel;
    rpGerencialSR1: TppSubReport;
    rpGerencialChildReport1: TppChildReport;
    rpGerencialCR1HdrBnd: TppHeaderBand;
    rpGerencialCR1Lbl1: TppLabel;
    rpGerencialCR1Lbl3: TppLabel;
    rpGerencialCR1Lbl4: TppLabel;
    rpGerencialCR1DbTxt2: TppDBText;
    rpGerencialCR1DbTxt4: TppDBText;
    rpGerencialCR1DbTxt1: TppDBText;
    rpGerencialCR1DbTxt3: TppDBText;
    rpGerencialCR1Lbl5: TppLabel;
    rpGerencialCR1Line1: TppLine;
    rpGerencialCR1Lbl2: TppLabel;
    rpGerencialCR1DbTxt5: TppDBText;
    rpGerencialCR1LblRef: TppLabel;
    rpGerencialCR1DtlBnd: TppDetailBand;
    rpGerencialCR1DbTxtNomeRubrica: TppDBText;
    rpGerencialCR1DbTxtValRubrica: TppDBText;
    rpGerencialCR1DbTxtCodRubrica: TppDBText;
    rpGerencialCR1FootBnd: TppFooterBand;
    rpGerencialChildReport7Group1: TppGroup;
    rpGerencialCR1GrpHdrBnd0: TppGroupHeaderBand;
    rpGerencialCR1Lbl6: TppLabel;
    rpGerencialCR1DbTxt6: TppDBText;
    rpGerencialCR1LblCodRubrica: TppLabel;
    rpGerencialCR1LblNomeRubrica: TppLabel;
    rpGerencialCR1Line2: TppLine;
    rpGerencialCR1LblValRubrica: TppLabel;
    rpGerencialCR1GrpFootBnd0: TppGroupFooterBand;
    rpGerencialCR1LblT1: TppLabel;
    rpGerencialCR1LblT2: TppLabel;
    rpGerencialCR1Line4: TppLine;
    rpGerencialCR1LblT3: TppLabel;
    rpGerencialCR1LblTotProv: TppLabel;
    rpGerencialCR1LblTotDesc: TppLabel;
    rpGerencialCR1LblTotLiq: TppLabel;
    rpGerencialCR1Lbl7: TppLabel;
    rpGerencialCR1LblTotPerc: TppLabel;
    rpGerencialChildReport7Group2: TppGroup;
    rpGerencialCR1GrpHdrBnd1: TppGroupHeaderBand;
    rpGerencialCR1DbTxtProvDesc: TppDBText;
    rpGerencialCR1GrpFootBnd1: TppGroupFooterBand;
    rpGerencialCR1Line3: TppLine;
    rpGerencialCR1DbCalc3: TppDBCalc;
    rpGerencialCR1DbTxt7: TppDBText;
    rpGerencialSR2: TppSubReport;
    rpGerencialChildReport2: TppChildReport;
    rpGerencialCR2HdrBnd: TppHeaderBand;
    rpGerencialCR2Lbl1: TppLabel;
    rpGerencialCR2Lbl2: TppLabel;
    rpGerencialCR2Lbl3: TppLabel;
    rpGerencialCR2Lbl4: TppLabel;
    rpGerencialCR2DbTxt2: TppDBText;
    rpGerencialCR2DbTxt4: TppDBText;
    rpGerencialCR2DbTxt1: TppDBText;
    rpGerencialCR2DbTxt3: TppDBText;
    rpGerencialCR2LblRef: TppLabel;
    rpGerencialCR2DtlBnd: TppDetailBand;
    rpGerencialCR2DbTxt6: TppDBText;
    rpGerencialCR2DbTxt7: TppDBText;
    rpGerencialCR2FootBnd: TppFooterBand;
    rpGerencialCR2SmryBnd: TppSummaryBand;
    rpGerencialCR2Line4: TppLine;
    rpGerencialCR2Lbl9: TppLabel;
    rpGerencialCR2DbCalc4: TppDBCalc;
    rpGerencialChildReport5Group1: TppGroup;
    rpGerencialCR2GrpHdrBand0: TppGroupHeaderBand;
    rpGerencialCR2Lbl6: TppLabel;
    rpGerencialCR2Line2: TppLine;
    rpGerencialCR2Lbl7: TppLabel;
    rpGerencialCR2Lbl5: TppLabel;
    rpGerencialCR2DbTxt5: TppDBText;
    rpGerencialCR2Line1: TppLine;
    rpGerencialCR2GrpFootBnd0: TppGroupFooterBand;
    rpGerencialCR2Line3: TppLine;
    rpGerencialCR2Lbl8: TppLabel;
    rpGerencialCR2DbCalc3: TppDBCalc;
    rpGerencialSR3: TppSubReport;
    rpGerencialChildReport3: TppChildReport;
    rpGerencialCR3HdrBnd: TppHeaderBand;
    rpGerencialCR3Lbl1: TppLabel;
    rpGerencialCR3Lbl2: TppLabel;
    rpGerencialCR3Lbl3: TppLabel;
    rpGerencialCR3Lbl4: TppLabel;
    rpGerencialCR3DbTxt2: TppDBText;
    rpGerencialCR3DbTxt4: TppDBText;
    rpGerencialCR3DbTxt1: TppDBText;
    rpGerencialCR3DbTxt3: TppDBText;
    rpGerencialCR3LblRef: TppLabel;
    rpGerencialCR3DtlBnd: TppDetailBand;
    rpGerencialCR3DbTxt5: TppDBText;
    rpGerencialCR3DbTxt6: TppDBText;
    rpGerencialCR3FootBnd: TppFooterBand;
    rpGerencialCR3SmryBnd: TppSummaryBand;
    rpGerencialCR3Line4: TppLine;
    rpGerencialChildReport4Group1: TppGroup;
    rpGerencialCR3GrpHdrBnd0: TppGroupHeaderBand;
    rpGerencialCR3Lbl6: TppLabel;
    rpGerencialCR3Line2: TppLine;
    rpGerencialCR3Lbl7: TppLabel;
    rpGerencialCR3Lbl5: TppLabel;
    rpGerencialCR3DbTxtNomeCentroCusto: TppDBText;
    rpGerencialCR3Line1: TppLine;
    rpGerencialCR3GrpFootBnd0: TppGroupFooterBand;
    rpGerencialCR3Line3: TppLine;
    rpGerencialCR3Lbl8: TppLabel;
    rpGerencialCR3DbCalc3: TppDBCalc;
    rpGerencialCR3Lbl9: TppLabel;
    rpGerencialCR3DbTxt7: TppDBText;
    rpGerencialSR4: TppSubReport;
    rpGerencialChildReport4: TppChildReport;
    rpGerencialCR4HdrBnd: TppHeaderBand;
    rpGerencialCR4Lbl5: TppLabel;
    rpGerencialCR4Lbl6: TppLabel;
    rpGerencialCR4Line1: TppLine;
    rpGerencialCR4Lbl1: TppLabel;
    rpGerencialCR4Lbl2: TppLabel;
    rpGerencialCR4Lbl3: TppLabel;
    rpGerencialCR4Lbl4: TppLabel;
    rpGerencialCR4DbTxt2: TppDBText;
    rpGerencialCR4DbTxt4: TppDBText;
    rpGerencialCR4DbTxt1: TppDBText;
    rpGerencialCR4DbTxt3: TppDBText;
    rpGerencialCR4LblRef: TppLabel;
    rpGerencialCR4DtlBnd: TppDetailBand;
    rpGerencialCR4DbTxt5: TppDBText;
    rpGerencialCR4DbTxt6: TppDBText;
    rpGerencialCR4FootBnd: TppFooterBand;
    rpGerencialCR4SmryBnd: TppSummaryBand;
    rpGerencialCR4Line2: TppLine;
    rpGerencialCR4Lbl7: TppLabel;
    rpGerencialCR4DbCalc3: TppDBCalc;
    rpGerencialSR5: TppSubReport;
    rpGerencialChildReport5: TppChildReport;
    rpGerencialCR5HdrBnd: TppHeaderBand;
    rpGerencialCR5Lbl1: TppLabel;
    rpGerencialCR5Lbl2: TppLabel;
    rpGerencialCR5Lbl3: TppLabel;
    rpGerencialCR5Lbl4: TppLabel;
    rpGerencialCR5DbTxt2: TppDBText;
    rpGerencialCR5DbTxt4: TppDBText;
    rpGerencialCR5DbTxt1: TppDBText;
    rpGerencialCR5DbTxt3: TppDBText;
    rpGerencialCR5LblRef: TppLabel;
    rpGerencialCR5DtlBnd: TppDetailBand;
    rpGerencialCR5DbTxt7: TppDBText;
    rpGerencialCR5DbTxt6: TppDBText;
    rpGerencialCR5DbTxt8: TppDBText;
    rpGerencialCR5FootBnd: TppFooterBand;
    rpGerencialCR5SmryBnd: TppSummaryBand;
    rpGerencialCR5Line4: TppLine;
    rpGerencialCR5Lbl10: TppLabel;
    rpGerencialCR5DbCalc3: TppDBCalc;
    rpGerencialCR5DbCalc4: TppDBCalc;
    rpGerencialChildReport6Group1: TppGroup;
    rpGerencialCR5GrpHdrBnd0: TppGroupHeaderBand;
    rpGerencialCR5Lbl6: TppLabel;
    rpGerencialCR5Line2: TppLine;
    rpGerencialCR5Lbl7: TppLabel;
    rpGerencialCR5Lbl5: TppLabel;
    rpGerencialCR5DbTxt5: TppDBText;
    rpGerencialCR5Line1: TppLine;
    rpGerencialCR5Lbl8: TppLabel;
    rpGerencialCR5GrpFootBnd0: TppGroupFooterBand;
    rpGerencialCR5Line3: TppLine;
    rpGerencialCR5Lbl9: TppLabel;
    rpGerencialCR5DbCalc1: TppDBCalc;
    rpGerencialCR5DbCalc2: TppDBCalc;
    rpGerencialSR6: TppSubReport;
    rpGerencialChildReport6: TppChildReport;
    rpGerencialCR6HdrBnd: TppHeaderBand;
    rpGerencialCR6Lbl1: TppLabel;
    rpGerencialCR6Lbl2: TppLabel;
    rpGerencialCR6Lbl3: TppLabel;
    rpGerencialCR6Lbl5: TppLabel;
    rpGerencialCR6Lbl6: TppLabel;
    rpGerencialCR6Lbl7: TppLabel;
    rpGerencialCR6Line1: TppLine;
    rpGerencialCR6Lbl4: TppLabel;
    rpGerencialCR6DbTxt2: TppDBText;
    rpGerencialCR6DbTxt4: TppDBText;
    rpGerencialCR6DbTxt1: TppDBText;
    rpGerencialCR6DbTxt3: TppDBText;
    rpGerencialCR6LblRef: TppLabel;
    rpGerencialCR6DtlBnd: TppDetailBand;
    rpGerencialCR6DbTxt5: TppDBText;
    rpGerencialCR6DbTxt6: TppDBText;
    rpGerencialCR6DbTxt7: TppDBText;
    rpGerencialCR6FootBnd: TppFooterBand;
    rpGerencialCR6SmryBnd: TppSummaryBand;
    rpGerencialCR6Lbl9: TppLabel;
    rpGerencialCR6Lbl10: TppLabel;
    rpGerencialCR6Lbl11: TppLabel;
    rpGerencialCR6Line2: TppLine;
    rpGerencialCR6Lbl8: TppLabel;
    rpGerencialCR6DbTxt8: TppDBText;
    rpGerencialCR6DbTxt10: TppDBText;
    rpGerencialCR6DbTxt9: TppDBText;
    rpGerencialCR6DbCalc1: TppDBCalc;
    rpGerencialCR6DbCalc2: TppDBCalc;
    rpGerencialSR7: TppSubReport;
    rpGerencialChildReport7: TppChildReport;
    rpGerencialCR7HdrBnd: TppHeaderBand;
    rpGerencialCR7Lbl5: TppLabel;
    rpGerencialCR7Lbl6: TppLabel;
    rpGerencialCR7Line1: TppLine;
    rpGerencialCR7Lbl1: TppLabel;
    rpGerencialCR7Lbl2: TppLabel;
    rpGerencialCR7Lbl3: TppLabel;
    rpGerencialCR7Lbl7: TppLabel;
    rpGerencialCR7Lbl8: TppLabel;
    rpGerencialCR7Lbl4: TppLabel;
    rpGerencialCR7DbTxt2: TppDBText;
    rpGerencialCR7DbTxt4: TppDBText;
    rpGerencialCR7DbTxt1: TppDBText;
    rpGerencialCR7DbTxt3: TppDBText;
    rpGerencialCR7LblRef: TppLabel;
    rpGerencialCR7DtlBnd: TppDetailBand;
    rpGerencialCR7DbTxt5: TppDBText;
    rpGerencialCR7DbTxt6: TppDBText;
    rpGerencialCR7DbTxt7: TppDBText;
    rpGerencialCR7DbTxt8: TppDBText;
    rpGerencialCR7DbTxt9: TppDBText;
    rpGerencialCR7FootBnd: TppFooterBand;
    rpGerencialCR7SmryBnd: TppSummaryBand;
    rpGerencialCR7Line2: TppLine;
    rpGerencialCR7Lbl9: TppLabel;
    rpGerencialCR7DbCalc1: TppDBCalc;
    rpGerencialCR7SysVar2: TppSystemVariable;
    rpGerencialCR7SysVar1: TppSystemVariable;
    rpGerencialCR6SysVar2: TppSystemVariable;
    rpGerencialCR6SysVar1: TppSystemVariable;
    rpGerencialCR5SysVar2: TppSystemVariable;
    rpGerencialCR5SysVar1: TppSystemVariable;
    rpGerencialCR4SysVar2: TppSystemVariable;
    rpGerencialCR4SysVar1: TppSystemVariable;
    rpGerencialCR3SysVar2: TppSystemVariable;
    rpGerencialCR3SysVar1: TppSystemVariable;
    rpGerencialCR2SysVar2: TppSystemVariable;
    rpGerencialCR2SysVar1: TppSystemVariable;
    rpGerencialCR1SysVar2: TppSystemVariable;
    rpGerencialCR1SysVar1: TppSystemVariable;
    sqlGerencial: TCMSqlParams;
    CdsGerencial: TCMClientDataSet;
    CdsGerencial1: TCMClientDataSet;
    sqlGerencial1: TCMSqlParams;
    CdsGerencial2: TCMClientDataSet;
    sqlGerencial2: TCMSqlParams;
    CdsGerencial3: TCMClientDataSet;
    sqlGerencial3: TCMSqlParams;
    CdsGerencial4: TCMClientDataSet;
    sqlGerencial4: TCMSqlParams;
    sqlGerencial5: TCMSqlParams;
    CdsGerencial5: TCMClientDataSet;
    CdsGerencial6A: TCMClientDataSet;
    sqlGerencial6A: TCMSqlParams;
    sqlGerencial6B: TCMSqlParams;
    CdsGerencial6B: TCMClientDataSet;
    sqlGerencial7: TCMSqlParams;
    CdsGerencial7: TCMClientDataSet;
    rpGerencialCR3Lbl10: TppLabel;
    rpGerencialCR3LblQuantTotLicenca: TppLabel;
    rpGerencialCR3Lbl11: TppLabel;
    rpGerencialCR3DbCalc4: TppDBCalc;
    rpGerencialCR3Lbl12: TppLabel;
    rpGerencialCR3LblTotal: TppLabel;
    procedure rpGerencialCR1GrpFootBnd1AfterPrint(Sender: TObject);
    procedure rpGerencialCR1GrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpGerencialSR1Print(Sender: TObject);
    procedure rpGerencialCR1DbTxtCodRubricaPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsGerencialAfterScroll(DataSet: TDataSet);
    procedure rpGerencialCR7SmryBndAfterPrint(Sender: TObject);
    procedure rpGerencialCR3LblQuantTotLicencaPrint(Sender: TObject);
    procedure rpGerencialCR3DbCalc4GetText(Sender: TObject; var Text: String);
  private
    sMes, sMesRef, sData, sSQL, sListaIdRubrica, sIdRubrica: string;
    rTotalFolha: real;
    iNumRubSel: integer;

    procedure ObterValorTotalFolha;
    procedure GerarDadosRelatorio0;
    procedure GerarDadosRelatorio1;
    procedure GerarDadosRelatorio2;
    procedure GerarDadosRelatorio3;
    procedure GerarDadosRelatorio4;
    procedure GerarDadosRelatorio5;
    procedure GerarDadosRelatorio6A;
    procedure GerarDadosRelatorio6B;
    procedure GerarDadosRelatorio7;
    procedure GravaDadosDemDespPessoal;
  public
    bImprimindo: boolean;
    rProvento, rDesconto, rOutros: real;
    iQuantTotLicenca: integer;
  end;

var
  RptGerencial: TRptGerencial;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptGerencial.CrmRptCMBeforePrint(Sender: TObject);
var
  iMes, iAno: integer;
begin
  inherited;
  rpGerencialCR1DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR1DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR1DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR2DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR2DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR2DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR3DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR3DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR3DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR4DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR4DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR4DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR5DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR5DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR5DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR6DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR6DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR6DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR7DbTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR7DbTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpGerencialCR7DbTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  iMes := CmpRptCM.ParamByName('Mes').asInteger;
  iAno := CmpRptCM.ParamByName('Ano').asInteger;
  sMes := QuotedStr(FU.PoeZero(iMes) +'/'+ IntToStr(iAno));
  sMesRef := QuotedStr(IntToStr(iAno) +'/'+ FU.PoeZero(iMes));
  sData := QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+
                     FU.PoeZero(iMes) +'/'+ IntToStr(iAno));

  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Relatório Gerencial');

  ObterValorTotalFolha;
  // Nome e Endereço do estabelecimento selecionado
  GerarDadosRelatorio0;
  // Demonstrativo Geral de Despesas com Pessoal
  GerarDadosRelatorio1;
  // Relação de Cargos com Remuneração por Centro de Custo
  GerarDadosRelatorio2;
  // Distribuição de Cargos por Centro de Custo
  GerarDadosRelatorio3;
  // Distribuição de Pessoal por Salário
  GerarDadosRelatorio4;
  // Distribuição de Gratificações por Centro de Custo
  GerarDadosRelatorio5;
  // Contratações e Desligamentos de Pessoal
  GerarDadosRelatorio6A;
  GerarDadosRelatorio6B;
  // Relação de Pessoal por Tempo de Serviço
  GerarDadosRelatorio7;

  bImprimindo := false;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsGerencial.RecordCount + CdsGerencial1.RecordCount +
    CdsGerencial2.RecordCount + CdsGerencial3.RecordCount + CdsGerencial4.RecordCount +
    CdsGerencial5.RecordCount + CdsGerencial6A.RecordCount + CdsGerencial7.RecordCount;

  rpGerencialLblSetor.Caption := CmpRptCM.ParamByName('NomeSetorResp').asString;
  rpGerencialLblMes.Caption := 'Referente ao Mês de '+
    FU.MesExtensoAno(IntToStr(iAno) +'/'+ FU.PoeZero(iMes));
  rpGerencialCR1LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR2LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR3LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR4LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR5LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR6LblRef.Caption := rpGerencialLblMes.Caption;
  rpGerencialCR7LblRef.Caption := rpGerencialLblMes.Caption;

  bImprimindo := true;
end;

procedure TRptGerencial.CdsGerencialAfterScroll(DataSet: TDataSet);
begin
  if (bImprimindo) then
  begin
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;
end;

procedure TRptGerencial.rpGerencialSR1Print(Sender: TObject);
begin
  rProvento := 0;
  rDesconto := 0;
  rOutros := 0;
end;

procedure TRptGerencial.rpGerencialCR1DbTxtCodRubricaPrint(Sender: TObject);
begin
  rpGerencialCR1DbTxtCodRubrica.Visible :=
    (CdsGerencial1.FieldByName('CODRUBRICA').asString <> #255#255);
end;

procedure TRptGerencial.rpGerencialCR1GrpFootBnd1AfterPrint(Sender: TObject);
begin
  if (CdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'DESPESAS') then
    rProvento := rpGerencialCR1DbCalc3.Value
  else
  if (CdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'ABATIMENTOS') then
    rDesconto := rpGerencialCR1DbCalc3.Value
  else
  if (CdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'ENCARGOS') then
    rOutros := rpGerencialCR1DbCalc3.Value;
end;

procedure TRptGerencial.rpGerencialCR1GrpFootBnd0BeforePrint(Sender: TObject);
begin
  rpGerencialCR1LblTotProv.Caption := FU.ValStr(rProvento+rOutros,12,2,true,',');
  rpGerencialCR1LblTotDesc.Caption := FU.ValStr(rDesconto,12,2,true,',');
  rpGerencialCR1LblTotLiq.Caption := FU.ValStr(rProvento+rOutros-rDesconto,12,2,true,',');

  if (CdsGerencial1.FieldByName('TOT_FOLHA').asFloat > 0) then
    rpGerencialCR1LblTotPerc.Caption := FU.ValStr(((rProvento+rOutros-rDesconto)
      * 100)/CdsGerencial1.FieldByName('TOT_FOLHA').asFloat,12,2,true,',')+'%'
  else
    rpGerencialCR1LblTotPerc.Caption := '0 %';

  rProvento := 0;
  rDesconto := 0;
  rOutros := 0;
end;

procedure TRptGerencial.rpGerencialCR3LblQuantTotLicencaPrint(Sender: TObject);
begin
  rpGerencialCR3LblQuantTotLicenca.Caption := IntToStr(iQuantTotLicenca);
end;

procedure TRptGerencial.rpGerencialCR3DbCalc4GetText(Sender: TObject; var Text: String);
begin
  rpGerencialCR3LblTotal.Caption := IntToStr(StrToIntDef(Text,0) + iQuantTotLicenca);
end;

procedure TRptGerencial.rpGerencialCR7SmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptGerencial.ObterValorTotalFolha;
begin
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  SUM(H.VALORPROVENTO) AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('WHERE');
    Add('  (ST.TIPOSIT    IN (''A'',''F'')) AND');
    Add('  (F.IDESTAB     IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (Trim(CmpRptCM.ParamByName('ListaIdRubricaTotFolha').asString) <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubricaTotFolha').asString) > 0) then
        Add('  (H.CODPROVDESC IN (' +CmpRptCM.ParamByName('ListaIdRubricaTotFolha').asString+ ')) AND')
      else
        Add('  (H.CODPROVDESC  = ' +CmpRptCM.ParamByName('ListaIdRubricaTotFolha').asString+ ') AND');
    end;

    Add('  (H.MES          = ' +sMesRef+ ') AND');
    Add('  (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('  (F.IDPESSOA     = H.IDPESSOA)');
    Add('GROUP BY');
    Add('  F.IDESTAB');
  end;
  dmCds.sql.Open;
  rTotalFolha := dmCds.Cds.FieldByName('VALOR').asFloat;
end;

procedure TRptGerencial.GerarDadosRelatorio0;
begin
  with (sqlGerencial.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,'' - '' || RTRIM(E.BAIRRO)) ||'' - '' ||');
    Add('    RTRIM(CIDADES.NOME) ||'' - ''|| RTRIM(ES.CODESTADO) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) || ''-'' ||');
    Add('    RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES, ESTADO ES,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio1;
begin
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE(P.FLGDESCONTO,0,''DESPESAS'',1,''ABATIMENTOS'',''ENCARGOS'') AS PROVENTODESCONTO,');
    Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
    Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
    Add('  RTRIM(RP.CODPROVDESC) AS CODRUBRICA,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  P.CODRUBCLT,');
    Add('  (CC.NOME || DECODE (CC.CODREDUZIDO,NULL,NULL,');
    Add('     '' (''||RTRIM(CC.CODREDUZIDO)||'')'')) AS C_CUSTO,');
    Add('  HIST.VALOR');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  HISTRUBSAL H, PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F, CENTCUST CC,');
    // ------------------------------------------------------------------ //
    Add('  (SELECT');
    Add('     F.CODCENTROCUSTO, F.IDESTAB, H.IDRUBRICA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F');
    Add('   WHERE');
    Add('     (F.IDESTAB      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (Trim(CmpRptCM.ParamByName('ListaIdRubricaRelDespPessoal').asString) <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubricaRelDespPessoal').asString) > 0) then
        Add('     (H.CODPROVDESC  IN (' +CmpRptCM.ParamByName('ListaIdRubricaRelDespPessoal').asString+ ')) AND')
      else
        Add('     (H.CODPROVDESC   = ' +CmpRptCM.ParamByName('ListaIdRubricaRelDespPessoal').asString+ ') AND');
    end;

    Add('     (H.MES           = ' +sMesRef+ ') AND');
    Add('     (H.IDMOTIVO      = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    Add('     (H.IDPESSJUR     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (F.TIPOCONTRATO <> ''G'') AND');
    Add('     (F.IDEMPRESA     = RP.IDPESSOA) AND');
    Add('     (F.IDPESSOA      = H.IDPESSOA) AND');
    Add('     (H.IDRUBRICA     = RP.IDRUBRICA) AND');
    Add('     (H.IDRUBRICA     = P.IDPROVENTO)');
    Add('   GROUP BY');
    Add('     F.CODCENTROCUSTO, H.IDRUBRICA, F.IDESTAB) HIST');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add('  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (H.MES             = ' +sMesRef+ ') AND');
    Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    Add('  (H.IDPESSJUR       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('  (HIST.IDESTAB      = F.IDESTAB) AND');
    Add('  (HIST.IDRUBRICA    = RP.IDRUBRICA) AND');
    Add('  (HIST.IDRUBRICA    = P.IDPROVENTO) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA       = F.IDEMPRESA) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('  (F.CODCENTROCUSTO  = HIST.CODCENTROCUSTO) AND');
    Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
    Add('  ((P.CODRUBCLT  <> ''40999'') OR (P.CODRUBCLT IS NULL)) AND');
    Add('  ((P.CODRUBCLT  <> ''40998'') OR (P.CODRUBCLT IS NULL)) AND');
    Add('  ((P.CODRUBCLT  <> ''50999'') OR (P.CODRUBCLT IS NULL))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('OrdemRelDespPessoal').asInteger) of
      0 : Add('  CODCENTROCUSTO, TIPOPROVDESC, CODRUBRICA');
      1 : Add('  C_CUSTO, TIPOPROVDESC, CODRUBRICA');
    end;
    //SaveToFile('c:\qry1.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  GravaDadosDemDespPessoal;
end;

procedure TRptGerencial.GerarDadosRelatorio2;
var
  c: word;
begin
  iNumRubSel := FU.ContaCaracter(CmpRptCM.ParamByName('ListaIdRubricaRelCargoRemCC').asString, ',')+1;

  with (sqlGerencial2.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE (CC.NOME,NULL,NULL,CC.NOME) || DECODE(CC.CODREDUZIDO,NULL,NULL,'' (''||');
    Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
    Add('  C.TITULO AS CARGO,');
    // --------------------------------------------------------------------------------- //
    // Calculo o valor total da remuneração (Rubrica1 + Rubrica2 + ... + RubricaN)
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := 'NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)'
      else
        sSQL := sSQL + ' + NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)';
    end;
    Add('  SUM((' +sSQL+ ')) AS REMUNERACAO');
    // --------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
    // --------------------------------------------------------------------------------- //
    // Seleciono cada Rubrica com a(s) Rubrica(s) selecionada(s) pelo Usuário
    c := 1;
    sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubricaRelCargoRemCC').asString;
    while (sListaIdRubrica <> '') do
    begin
      FU.ExtraiString(sListaIdRubrica, sIdRubrica, ',');
      Add('  (SELECT IDPESSOA, VALORPROVENTO');
      Add('   FROM   HISTRUBSAL');
      Add('   WHERE  (CODPROVDESC = ' +sIdRubrica+ ') AND');
      Add('          (MES         = ' +sMesRef+ ')) R' + IntToStr(c) +
        FU.IFF(c=iNumRubSel,'',','));
      Inc(c);
    end;
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (ST.TIPOSIT      <> ''D'') AND');
    Add('  (F.IDESTAB       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (F.TIPOCONTRATO  <> ''G'') AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    // --------------------------------------------------------------------------------- //
    // Faço o JOIN com a(s) Rubrica(s) selecionada(s)
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := '    (F.IDPESSOA = R' +IntToStr(c)+ '.IDPESSOA(+))'
      else
        sSQL := sSQL +CR_LF+ 'AND (F.IDPESSOA = R' +IntToStr(c)+ '.IDPESSOA(+))';
    end;
    Add(sSQL);
    // ----------------------------------------------------------------------------- //
    Add('GROUP BY');
    Add('  CC.NOME, CC.CODREDUZIDO, C.TITULO');
    Add('ORDER BY');
    Add('  C_CUSTO');
    //SaveToFile('c:\qry2.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry2.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial2.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio3;
var
  sCCusto: string;
begin
  with (sqlGerencial3.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
    Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
    Add('  C.TITULO AS CARGO,');
    Add('  ATIVO.QUANTIDADE AS ATIVOS,');
    Add('  NVL(EM_LICENCA.QUANTIDADE,0) AS LICENCA');
    Add('FROM');
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Funcionários que não estão em uma das licenças escolhidas
    Add('  (SELECT');
    Add('     CC.CODCENTROCUSTO, F.IDCARGO, COUNT(F.IDPESSOA) AS QUANTIDADE');
    Add('   FROM');
    Add('     FUNCIONARIO F, CENTCUST CC, SITFUNC ST');
    Add('   WHERE');
    Add('     (ST.TIPOSIT      <> ''D'')       AND');
    Add('     (F.IDESTAB       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('ListaIdSitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdSitFunc').asString) > 0) then
        Add('     (ST.IDSITFUNC NOT IN (' +CmpRptCM.ParamByName('ListaIdSitFunc').asString +')) AND')
      else
        Add('     (ST.IDSITFUNC    <> ' +CmpRptCM.ParamByName('ListaIdSitFunc').asString +') AND');

    Add('     (F.TIPOCONTRATO  <> ''G'' ) AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('     (F.IDEMPRESA      = CC.IDEMPRESA)');
    Add('   GROUP BY');
    Add('     CC.CODCENTROCUSTO, F.IDCARGO) ATIVO,');
    // ------------------------------------------------------------------------------- //
    // Funcionários que não estão em uma das licenças escolhidas
    Add('  (SELECT');
    Add('     CC.CODCENTROCUSTO, COUNT(F.IDPESSOA) AS QUANTIDADE');
    Add('   FROM');
    Add('     FUNCIONARIO F, CENTCUST CC, SITFUNC ST');
    Add('   WHERE');
    Add('     (ST.TIPOSIT      <> ''D'')       AND');
    Add('     (F.IDESTAB       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('ListaIdSitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdSitFunc').asString) > 0) then
        Add('     (ST.IDSITFUNC   IN (' +CmpRptCM.ParamByName('ListaIdSitFunc').asString +')) AND')
      else
        Add('     (ST.IDSITFUNC    = ' +CmpRptCM.ParamByName('ListaIdSitFunc').asString +') AND');

    Add('     (F.TIPOCONTRATO  <> ''G'' ) AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('     (F.IDEMPRESA      = CC.IDEMPRESA)');
    Add('   GROUP BY');
    Add('     CC.CODCENTROCUSTO) EM_LICENCA');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDESTAB       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    Add('  (F.CODCENTROCUSTO = ATIVO.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO        = ATIVO.IDCARGO) AND');
    Add('  (F.CODCENTROCUSTO = EM_LICENCA.CODCENTROCUSTO(+))');
    Add('ORDER BY');
    Add('  C_CUSTO');
    //SaveToFile('c:\qry3.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry3.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial3.Open;

  CdsGerencial3.AfterScroll := nil;
  iQuantTotLicenca := 0;
  while not(CdsGerencial3.EOF) do
  begin
    sCCusto := CdsGerencial3.FieldByName('C_CUSTO').asString;
    iQuantTotLicenca := iQuantTotLicenca + CdsGerencial3.FieldByName('LICENCA').asInteger;
    repeat
      CdsGerencial3.Next;
    until (CdsGerencial3.EOF) or (sCCusto <> CdsGerencial3.FieldByName('C_CUSTO').asString);
  end;
  CdsGerencial3.First;
  CdsGerencial3.AfterScroll := CdsGerencialAfterScroll;
end;

procedure TRptGerencial.GerarDadosRelatorio4;
begin
  with (sqlGerencial4.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  COUNT(F.IDPESSOA) AS NUM_FUNC, F.SALARIOATUAL');
    Add('FROM');
    Add('  PESSOA PJ, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC ST, FILIALPESSOA FP, EMPRESAPROP EP');
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (EP.IDPESSOA       = PJ.IDGRUPO) AND');
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (F.SALARIOATUAL    > 0) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (ST.TIPOSIT       <> ''D'') AND');
    Add('  (F.TIPOCONTRATO   <> ''G'' ) AND');
    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)');
    Add('GROUP BY');
    Add('  F.SALARIOATUAL, PJ.NOME');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('OrdemRelDistribPessSal').asInteger) of
      0 : Add('  NUM_FUNC');
      1 : Add('  NUM_FUNC DESC');
      2 : Add('  F.SALARIOATUAL');
      3 : Add('  F.SALARIOATUAL DESC');
    end;
    //SaveToFile('c:\qry4.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry4.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial4.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio5;
var
  c: word;
begin
  iNumRubSel := FU.ContaCaracter(CmpRptCM.ParamByName('ListaIdRubricaRelGratifCC').asString, ',')+1;

  with (sqlGerencial5.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
    Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
    Add('  C.TITULO AS CARGO,');
    // --------------------------------------------------------------------------------- //
    // Calculo o número de gratificações (Rubrica1 + Rubrica2 + ... + RubricaN)
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := 'NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)'
      else
        sSQL := sSQL + ' + NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)';
    end;
    Add('  COUNT((' +sSQL+ ')) AS NUM_GRATIF,');
    // --------------------------------------------------------------------------------- //
    // Calculo o valor total de gratificações (Rubrica1 + Rubrica2 + ... + RubricaN)
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := 'NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)'
      else
        sSQL := sSQL + ' + NVL(R'+IntToStr(c)+'.VALORPROVENTO,0)';
    end;
    Add('  SUM((' +sSQL+ ')) AS VAL_GRATIF');
    // --------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
    // --------------------------------------------------------------------------------- //
    // Seleciono cada Rubrica com a(s) Rubrica(s) selecionada(s)
    c := 0;
    sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubricaRelGratifCC').asString;
    while (sListaIdRubrica <> '') do
    begin
      FU.ExtraiString(sListaIdRubrica, sIdRubrica, ',');
      Inc(c);
      Add('  (SELECT IDPESSOA, VALORPROVENTO');
      Add('   FROM   HISTRUBSAL');
      Add('   WHERE  (CODPROVDESC = ' +sIdRubrica+ ') AND');
      Add('          (MES         = ' +sMesRef+ ')) R' + IntToStr(c) + FU.IFF(c=iNumRubSel,'',','));
    end;
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (ST.TIPOSIT       <> ''D'') AND');
    Add('  (F.IDESTAB       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (F.TIPOCONTRATO   <> ''G'' ) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    // --------------------------------------------------------------------------------- //
    // Faço o JOIN com a(s) Rubrica(s) selecionada(s)
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := '    (F.IDPESSOA = R' +IntToStr(c)+ '.IDPESSOA(+))'
      else
        sSQL := sSQL +CR_LF+ 'AND (F.IDPESSOA = R' +IntToStr(c)+ '.IDPESSOA(+))';
    end;
    Add(sSQL);

    // CONDIÇÃO PARA PEGAR SÓ OS QUE TÊM VALOR
    sSQL := '';
    for c:=1 to iNumRubSel do
    begin
      if (sSQL = '') then
        sSQL := 'AND (NVL(R' +IntToStr(c)+ '.VALORPROVENTO,0)'
      else
        sSQL := sSQL +CR_LF+ '   + NVL(R' +IntToStr(c)+ '.VALORPROVENTO,0)';
    end;
    Add(sSQL + ' > 0)');
    // ----------------------------------------------------------------------------- //
    Add('GROUP BY');
    Add('  CC.NOME, CC.CODREDUZIDO, C.TITULO');
    Add('ORDER BY');
    Add('  C_CUSTO');
    //SaveToFile('c:\qry5.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry5.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial5.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio6A;
begin
  with (sqlGerencial6A.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
    Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
    Add('  NVL(ADMITIDOS.NUMERO,0) AS ADMITIDOS,');
    Add('  NVL(DEMITIDOS.NUMERO,0) AS DEMITIDOS');
    Add('FROM');
    Add('  PESSOA PJ, FUNCIONARIO F, CENTCUST CC,');
    // -------------------------------------------------------------------- //
    // Funcionários Admitidos no mês
    Add('  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO');
    Add('   FROM');
    Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA     IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') = '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT      <> ''D'') AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (F.TIPOCONTRATO  <> ''G'' ) AND');
    Add('     (CC.IDEMPRESA     = PJ.IDGRUPO) AND');
    Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    Add('   GROUP BY');
    Add('     CC.CODCENTROCUSTO) ADMITIDOS,');
    // -------------------------------------------------------------------- //
    // Funcionários Demitidos no mês
    Add('  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO');
    Add('   FROM');
    Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY''),''MM/YYYY'') = '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT        = ''D'') AND');
    Add('     (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('     (F.TIPOCONTRATO    <> ''G'' ) AND');
    Add('     (CC.IDEMPRESA      = PJ.IDGRUPO) AND');
    Add('     (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)');
    Add('   GROUP BY');
    Add('     CC.CODCENTROCUSTO) DEMITIDOS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA               IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (F.IDESTAB                  = PJ.IDPESSOA) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (F.CODCENTROCUSTO           = CC.CODCENTROCUSTO) AND');
    Add('  ((DEMITIDOS.CODCENTROCUSTO IS NOT NULL) OR');
    Add('   (ADMITIDOS.CODCENTROCUSTO IS NOT NULL)) AND');
    Add('  (F.CODCENTROCUSTO           = DEMITIDOS.CODCENTROCUSTO(+)) AND');
    Add('  (F.CODCENTROCUSTO           = ADMITIDOS.CODCENTROCUSTO(+))');
    Add('ORDER BY');
    Add('  C_CUSTO');
    //SaveToFile('c:\qry6A.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry6A.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial6A.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio6B;
begin
  with (sqlGerencial6B.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  NVL(TOT_ESTAGIARIOS.NUMERO,0) AS NUM_ESTAGIARIOS,');
    Add('  TOT_EMPREGADOS_ANT.NUMERO AS POS_ANTERIOR,');
    Add('  (TOT_EMPREGADOS_ANT.NUMERO+NVL(TOT_ADMITIDOS.NUMERO,0)) -');
    Add('    NVL(TOT_DEMITIDOS.NUMERO,0) AS POS_ATUAL');
    Add('FROM');
    Add('  PESSOA PJ, FUNCIONARIO F,');
    // -------------------------------------------------------------------- //
    // Total de Funcionários Admitidos no mês
    Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') = '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT      <> ''D'') AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (F.TIPOCONTRATO  <> ''G'' ) AND');
    Add('     (CC.IDEMPRESA     = PJ.IDGRUPO) AND');
    Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    Add('   GROUP BY');
    Add('     PJ.IDPESSOA) TOT_ADMITIDOS,');
    // -------------------------------------------------------------------- //
    // Total de Funcionários Demitidos no mês
    Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY''),''MM/YYYY'') = '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT       = ''D'') AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (F.TIPOCONTRATO   <> ''G'' ) AND');
    Add('     (CC.IDEMPRESA     = PJ.IDGRUPO) AND');
    Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    Add('   GROUP BY');
    Add('     PJ.IDPESSOA) TOT_DEMITIDOS,');
    // -------------------------------------------------------------------- //
    // Posição anterior de Funcionários anterior ao mês
    Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') < '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB       = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT     <> ''D'') AND');
    Add('     (ST.IDSITFUNC    = F.IDSITFUNC) AND');
    Add('     (F.TIPOCONTRATO <> ''G'' ) AND');
    Add('     (F.IDPESSOA      = PF.IDPESSOA)');
    Add('   GROUP BY');
    Add('     PJ.IDPESSOA) TOT_EMPREGADOS_ANT,');
    // -------------------------------------------------------------------- //
    // Estagiários até o mês
    Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');
    Add('     (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
              'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('     (F.IDESTAB      = PJ.IDPESSOA) AND');
    Add('     (ST.TIPOSIT    <> ''D'') AND');
    Add('     (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('     (F.IDPESSOA     = PF.IDPESSOA) AND');
    Add('     (F.TIPOCONTRATO = ''G'')');
    Add('   GROUP BY');
    Add('     PJ.IDPESSOA) TOT_ESTAGIARIOS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (F.IDESTAB   = PJ.IDPESSOA) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (PJ.IDPESSOA = TOT_EMPREGADOS_ANT.IDEMPRESA) AND');
    Add('  (PJ.IDPESSOA = TOT_ADMITIDOS.IDEMPRESA(+)) AND');
    Add('  (PJ.IDPESSOA = TOT_DEMITIDOS.IDEMPRESA(+)) AND');
    Add('  (PJ.IDPESSOA = TOT_ESTAGIARIOS.IDEMPRESA(+))');
    //SaveToFile('c:\qry6B.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry6B.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial6B.Open;
end;

procedure TRptGerencial.GerarDadosRelatorio7;
begin
  with (sqlGerencial7.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PF.NOME,');
    Add('  TEMPO_CASA.MATRICULA,');
    Add('  TEMPO_CASA.DTADMISSAO,');
    Add('  TO_CHAR(SYSDATE,''DD/MM/YYYY'') AS DTHOJE,');
    Add('  MOD(TO_NUMBER(TEMPO_CASA.VALOR),12) AS MES,');
    Add('  TRUNC(TEMPO_CASA.VALOR/12,0) ANO,');
    Add('  TEMPO_CASA.VALOR');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST, FILIALPESSOA FP, EMPRESAPROP EP,');
    Add('  (SELECT DISTINCT');
    Add('     IDPESSOA,');
    Add('     MATRICULA,');
    Add('     TO_CHAR(DATAADMISSAO,''DD/MM/YYYY'') AS DTADMISSAO,');
    // ANO ATUAL MENOS ANO DA DATA DE ADMISSAO
    Add('     (((TO_NUMBER(SUBSTR(' +sData+ ',7,10)) -');
    Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
    // MES ATUAL MENOS MES DA ANO DE ADMISSAO
    Add('      (TO_NUMBER(SUBSTR(' +sData+ ',4,2)) -');
    Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2))) +');
    Add('      DECODE(');
    Add('        (TO_NUMBER(SUBSTR(' +sData+ ',1,2)) -');
    Add('         TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
    Add('        DECODE(SUBSTR(' +sData+ ',1,2),');
    Add('               SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),');
    Add('               1,');
    Add('               ABS(TO_NUMBER(SUBSTR(' +sData+ ',1,2)) -');
    Add('                   TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),');
    Add('               -1,');
    Add('               -1,');
    Add('               0))) AS VALOR');
    Add('  FROM');
    Add('    FUNCIONARIO');
    Add('  WHERE');
    Add('  (TO_DATE(TO_CHAR(DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
    Add('     TO_DATE(' +sMes+ ',''MM/YYYY''))) TEMPO_CASA');
    Add('WHERE');
    Add('  (ST.TIPOSIT       <> ''D'') AND');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (EP.IDPESSOA       = PJ.IDGRUPO) AND');
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.TIPOCONTRATO   <> ''G'') AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
           'TO_DATE(' +sMes+ ',''MM/YYYY'')) AND');
    Add('  (PF.IDPESSOA       = TEMPO_CASA.IDPESSOA)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('OrdemRelEmprTempServ').asInteger) of
      0 : Add('  VALOR');
      1 : Add('  VALOR DESC');
      2 : Add('  PF.NOME');
      3 : Add('  TEMPO_CASA.MATRICULA');
    end;
    //SaveToFile('c:\qry7.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry7.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGerencial7.Open;
end;

procedure TRptGerencial.GravaDadosDemDespPessoal;
var
  rTotParcial: double;
  y, iNumLin: integer;
  sCCusto, sLinhasCompl, sLinhaComplAtual, sNomeRubrica, sCampoAtual: string;
begin
  CdsGerencial1.AfterScroll := nil;
  dmCds.sql.Open;
  CdsGerencial1.IndexName := '';
  sqlGerencial1.Open;

  if not(dmCds.Cds.IsEmpty) then
  begin
    // Inserir linhas que tenham vindo da seleção das Linhas da Query Auxiliar
    while not(dmCds.Cds.EOF) do
    begin
      rTotParcial := 0;
      repeat
        sCCusto := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;

        CdsGerencial1.Insert;
        CdsGerencial1.FieldByName('PROVENTODESCONTO').asString := dmCds.Cds.FieldByName('PROVENTODESCONTO').asString;
        CdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger;
        CdsGerencial1.FieldByName('CODRUBRICA').asString := dmCds.Cds.FieldByName('CODRUBRICA').asString;
        CdsGerencial1.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;

        case (dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger) of
          0 : CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
          1 : CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE ABATIMENTOS:';
          2 : CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE ENCARGOS:';
        end;

        CdsGerencial1.FieldByName('RUBRICA').asString := dmCds.Cds.FieldByName('RUBRICA').asString;
        CdsGerencial1.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
        CdsGerencial1.FieldByName('VALOR').asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
        CdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;

        rTotParcial := rTotParcial + dmCds.Cds.FieldByName('VALOR').asFloat;

        dmCds.Cds.Next;

        if (dmCds.Cds.FieldByName('CODCENTROCUSTO').asString <> sCCusto) or
           (dmCds.Cds.EOF) then
          CdsGerencial1.FieldByName('TOT_PARCIAL').asFloat := rTotParcial;

        CdsGerencial1.Post;
      until (CdsGerencial1.FieldByName('TOT_PARCIAL').asFloat <> 0);
    end;

    // Inserir linhas venham da entrada do Usuário na Tela (Informações Complementares)
    sLinhasCompl := CmpRptCM.ParamByName('LinhasComplRelDemDespPessoa').asString;
    if (sLinhasCompl <> '') then
    begin
      iNumLin := FU.ContaCaracter(sLinhasCompl, CR) + 1;
      for y:=1 to iNumLin do
      begin
        FU.ExtraiString(sLinhasCompl, sLinhaComplAtual, CR_LF);
        sNomeRubrica := Copy(sLinhaComplAtual, 1, 130);
        Delete(sLinhaComplAtual, 1, 130);
        while (sLinhaComplAtual <> '') do
        begin
          CdsGerencial1.Insert;
          CdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
          CdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
          CdsGerencial1.FieldByName('CODRUBRICA').asString := #255#255;
          CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
          CdsGerencial1.FieldByName('RUBRICA').asString := sNomeRubrica;

          FU.ExtraiString(sLinhaComplAtual, sCampoAtual, ',');
          CdsGerencial1.FieldByName('CODCENTROCUSTO').asString := sCampoAtual;

          FU.ExtraiString(sLinhaComplAtual, sCampoAtual, ',');
          CdsGerencial1.FieldByName('C_CUSTO').asString := sCampoAtual;

          FU.ExtraiString(sLinhaComplAtual, sCampoAtual, ',');
          CdsGerencial1.FieldByName('VALOR').asFloat := FU.String2Float(sCampoAtual);

          CdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
          CdsGerencial1.Post;

          if (Pos(',', sLinhaComplAtual) = 1) then
            Delete(sLinhaComplAtual, 1, 1);
        end;
      end;
    end;

    if (CmpRptCM.ParamByName('ApanhaDadosTrein').asBoolean) then
    begin
      with (dmCds.sql.SQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  F.CODCENTROCUSTO,');
        Add('  DECODE (CC.NOME,'''','''',NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
        Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
        Add('  SUM(H.VALOR + H.DESP_VIAG + H.DESP_ESTAD + H.DESP_OUTR) AS TOTCURSOS');
        Add('FROM');
        Add('  HSTTRN H, FUNCIONARIO F, CENTCUST CC');
        Add('WHERE');

        if (CmpRptCM.ParamByName('ConsideraDataTreinInicial').asBoolean) then
          Add('  (TO_CHAR(H.DATREINI, ''YYYY/MM'') = ' +sMesRef+ ') AND')
        else
          Add('  (TO_CHAR(H.DATREFIM, ''YYYY/MM'') = ' +sMesRef+ ') AND');

        Add('  (H.IDPESSOA       = F.IDPESSOA) AND');
        Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
        Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
        Add('GROUP BY');
        Add('  F.CODCENTROCUSTO, CC.NOME, CC.CODREDUZIDO');
      end;
      dmCds.sql.Open;

      sNomeRubrica := CmpRptCM.ParamByName('LinhasComplRelDemDespPessoaLin6').asString;
      while not(dmCds.Cds.EOF) do
      begin
        CdsGerencial1.Insert;
        CdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
        CdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
        CdsGerencial1.FieldByName('CODRUBRICA').asString := #255#255;
        CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
        CdsGerencial1.FieldByName('RUBRICA').asString := sNomeRubrica;
        CdsGerencial1.FieldByName('CODCENTROCUSTO').asString :=
          dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsGerencial1.FieldByName('C_CUSTO').asString :=
          dmCds.Cds.FieldByName('C_CUSTO').asString;
        CdsGerencial1.FieldByName('VALOR').asFloat :=
          dmCds.Cds.FieldByName('TOTCURSOS').asFloat;
        CdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
        CdsGerencial1.Post;

        dmCds.Cds.Next;
      end;
    end;

    // A Ordem deve ser pelo Código ou Nome do C. de Custo
    case (CmpRptCM.ParamByName('OrdemRelDespPessoal').asInteger) of
      0 : CdsGerencial1.IndexName := 'IndexCodigoCC';
      1 : CdsGerencial1.IndexName := 'IndexNomeCC';
    end;

    CdsGerencial1.First;
  end
  else
  begin
    CdsGerencial1.Insert;
    CdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
    CdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
    CdsGerencial1.FieldByName('CODRUBRICA').asString := '';
    CdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
    CdsGerencial1.FieldByName('RUBRICA').asString := '';
    CdsGerencial1.FieldByName('C_CUSTO').asString := '';
    CdsGerencial1.FieldByName('VALOR').asFloat := 0;
    CdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
    CdsGerencial1.Post;
  end;
  CdsGerencial1.AfterScroll := CdsGerencialAfterScroll;
end;

end.
