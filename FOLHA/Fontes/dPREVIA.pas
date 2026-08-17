// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 143022 KINTANA 927497
//Responsável : BRUNO AZEVEDO
//Data        : 14/09/2010
//Descrição   : Adicionado a conta contabil no relatório da folha de benefícios.
//--------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
//Autor(a)    : Claudio Faria
// Rotina      : MontaQryMaster e MontaQryMasterAgrupado
// Data        : 07/11/2007
// Pendencia   : 26800
// Alteração   : Ajustar a consulta para mostrar o favorecido qdo EPP.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/11/2006
// Pendência   : 21921
// Descricao   : Inclir no relatório a Opção de Tributação
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/08/2006
// Rotina      : ReportPREVIAGroupHeaderBand2BeforePrint
// Pendência   : 23099
// Descricao   : Tornar campos invisiveis se a qryBenef não retornar processo.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryprevia filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dPREVIA;

interface

uses
  Windows  , Messages, SysUtils, Classes, Graphics, Controls, Forms   , Dialogs ,
  dReports , ppCtrls , ppBands , ppClass, ppPrnabl, ppProd  , ppReport, Db      ,
  DBTables , Wwquery , Wwdatsrc, ppComm , ppCache , ppDB    , ppDBBDE , ppStrtch,
  ppSubRpt , ppRegion, TeEngine, Series , ExtCtrls, TeeProcs, Chart   , DBChart ,
  FMostraRelat, ppVar, ppRelatv, ppDBPipe, ppModule, raCodMod, uDatabase, uSistema;

type
  TdtmPREVIA = class(TdtmReports)
    qryPREVIA                                  : TwwQuery;
    ReportPREVIA                               : TppReport;
    ppPREVIA                                   : TppBDEPipeline;
    dsPREVIA                                   : TwwDataSource;
    qryFundacao                                : TwwQuery;
    dsFundacao                                 : TwwDataSource;
    ppFundacao                                 : TppBDEPipeline;
    qryDetalhe: TwwQuery;
    ppDetalhe: TppBDEPipeline;
    dsDetalhe: TwwDataSource;
    qryBancoPort: TwwQuery;
    qryBenef: TwwQuery;
    dsBenef: TwwDataSource;
    ppBenef: TppBDEPipeline;
    qryAux: TwwQuery;
    qryRubIndiv: TwwQuery;
    dsRubIndiv: TwwDataSource;
    ppRubIndiv: TppBDEPipeline;
    qryAcJud: TwwQuery;
    dsAcJud: TwwDataSource;
    ppAcJud: TppBDEPipeline;
    qryMatricBenef: TwwQuery;
    dsMatricBenef: TwwDataSource;
    ppMatricBenef: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    LabTitulo: TppLabel;
    ReportPREVIADBImage1: TppDBImage;
    ReportPREVIADBText16: TppDBText;
    ReportPREVIADBText17: TppDBText;
    ReportPREVIADBText18: TppDBText;
    ReportPREVIADBText19: TppDBText;
    lblDescricao: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ReportPREVIADBText11: TppDBText;
    ReportPREVIADBText7: TppDBText;
    ReportPREVIADBText4: TppDBText;
    DbProventos: TppDBText;
    ReportPREVIADBText6: TppDBText;
    ppDBText1: TppDBText;
    dbSumProv: TppDBCalc;
    dbSumDesc: TppDBCalc;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    dbTotProvento: TppDBCalc;
    dbTotDesconto: TppDBCalc;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    lblTotLiq: TppLabel;
    ReportPREVIALine7: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel3: TppLabel;
    ppLabel15: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel46: TppLabel;
    ppLabel16: TppLabel;
    ppLine3: TppLine;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppFooterBand1: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppLabel31: TppLabel;
    ReportPREVIASummaryBand1: TppSummaryBand;
    ReportPREVIALabel1: TppLabel;
    ppLineFinished: TppLine;
    pplTotalLiquido: TppLabel;
    pplTotalProvento: TppLabel;
    pplTotalDesconto: TppLabel;
    ppVarTotalGeral: TppVariable;
    ppLabel17: TppLabel;
    ppLabel23: TppLabel;
    ppLabel41: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ReportPREVIADBText13: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    pplDataFinal: TppLabel;
    DbTotProvPatro: TppDBCalc;
    ReportPREVIALine6: TppLine;
    DbTotDescPatro: TppDBCalc;
    lbTotLiqPatro: TppLabel;
    ReportPREVIADBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ReportPREVIAGroup2: TppGroup;
    ReportPREVIAGroupHeaderBand2: TppGroupHeaderBand;
    ppSubRepBenef: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppdbtxtPatro: TppDBText;
    ppLine2: TppLine;
    ppLblPlano: TppLabel;
    ppdbtxtPlano: TppDBText;
    ppLblPatro: TppLabel;
    ReportPREVIALabel9: TppLabel;
    ReportPREVIADBText8: TppDBText;
    ReportPREVIALabel10: TppLabel;
    ReportPREVIADBText9: TppDBText;
    ReportPREVIALabel19: TppLabel;
    ReportPREVIADBText15: TppDBText;
    ppLblIdLote: TppLabel;
    ppLabel8: TppLabel;
    ppDBText2: TppDBText;
    ReportPREVIALabel2: TppLabel;
    ReportPREVIADBText12: TppDBText;
    ReportPREVIALabel15: TppLabel;
    ReportPREVIADBText10: TppDBText;
    LblBanco: TppLabel;
    ppLabel9: TppLabel;
    lblForma: TppLabel;
    ppLabel1: TppLabel;
    ppLabel26: TppLabel;
    ppDBText11: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppRegion1: TppRegion;
    ppSubReport2: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    lblBenef: TppLabel;
    lblMatricBenef: TppLabel;
    lblNome: TppLabel;
    ppLine7: TppLine;
    ppDetailBand5: TppDetailBand;
    dbMatricBenef: TppDBText;
    dbNomeBenef: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppRegion2: TppRegion;
    ppLabel18: TppLabel;
    ppLabel13: TppLabel;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine9: TppLine;
    lblCPF: TppLabel;
    ppDBText17: TppDBText;
    ppDtBandBenef: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    pplNomebase1: TppLabel;
    pplValorBase1: TppLabel;
    pplNomebase2: TppLabel;
    pplValorBase2: TppLabel;
    pplNomebase3: TppLabel;
    pplValorBase3: TppLabel;
    pplNomeRateio: TppLabel;
    pplValorRateio: TppLabel;
    ppSubRepRubIndiv: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand1: TppTitleBand;
    pplblDataInicio: TppLabel;
    pplblDataFinal: TppLabel;
    pplblNumOcor: TppLabel;
    pplblParcelas: TppLabel;
    pplblCodRub: TppLabel;
    pplblNomeRub: TppLabel;
    pplblSeqRub: TppLabel;
    pplblCodRegra: TppLabel;
    pplblRegra: TppLabel;
    pplblValor: TppLabel;
    pplblPermanente: TppLabel;
    pplblPA: TppLabel;
    pplblTituloRubIndiv: TppLabel;
    ppLine5: TppLine;
    ppDetailBand3: TppDetailBand;
    ppdbtDataInicio: TppDBText;
    ppdbtDataFinal: TppDBText;
    ppdbtNOcor: TppDBText;
    ppdbtParcelas: TppDBText;
    ppdbtCodRub: TppDBText;
    ppdbtRubrica: TppDBText;
    ppdbtSeq: TppDBText;
    ppdbtCodRegra: TppDBText;
    ppdbtNomeRegra: TppDBText;
    ppdbtValor: TppDBText;
    ppdbtPerm: TppDBText;
    ppdbtPA: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppSubRepAcJud: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLine6: TppLine;
    pplblTituloAcaoJud: TppLabel;
    ppLabel2: TppLabel;
    ppLabel19: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    pplblFazDeposito: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppdbtCodRegraAJ: TppDBText;
    ppdbtNomeRegraAJ: TppDBText;
    ppdbtCodRubAJ: TppDBText;
    ppdbtNomeRubAJ: TppDBText;
    ppdbtFazDep: TppDBText;
    ppdbtSituacao: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    RodaPeBeneficiario: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppLabel34: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel35: TppLabel;
    ppDetalheppField16: TppField;
    procedure qrySub01BeforeOpen(DataSet: TDataSet);
    procedure qryPREVIAAfterClose(DataSet: TDataSet);
    procedure ReportPREVIAGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure qryPREVIABeforeOpen(DataSet: TDataSet);
    procedure QryDadosCadastraisAfterOpen(DataSet: TDataSet);
    procedure DbTotDescPatroPrint(Sender: TObject);
    procedure ReportPREVIASummaryBand1BeforePrint(Sender: TObject);
    procedure dtmPREVIACreate(Sender: TObject);
    procedure ReportPREVIAGroupHeaderBand2AfterPrint(Sender: TObject);
    procedure lblTotLiqPrint(Sender: TObject);
    procedure qryDetalheAfterOpen(DataSet: TDataSet);
    procedure qryPREVIAAfterOpen(DataSet: TDataSet);
    procedure ppTitleBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    rTotProventoPatro,
    rTotDescontoPatro,
    rTotProventoPlano,
    rTotDewscontoPlano  : Real;
  public
    { Public declarations }

    bDefinitiva : boolean;
    sTipoFolha  : String;
    ssqltotal: string;
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmPREVIA                : TdtmPREVIA;
  rProvento, rDesconto     : Real;
  iIdFolha                 : Integer;
  SomaTotProv, SomaTotDesc : Double;
  Terminou                 : Boolean;

implementation

uses FPRelPrevia, fAguarde, UAdmPrevFB;

{$R *.DFM}

//********************************************************
//*                                                      *
//* Alterado em : 13/10/2000                             *
//* Por.........: Elcio Braga                            *
//* Motivo......: Reestruturação do Relatório de Prévia. *
//*                                                      *
//********************************************************

function TdtmPREVIA.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if UPPERCASE(Form)= 'FRMPRELPREVIA' then
    frm := TfrmPRelPREVIA.Create(Application)
  else frm := nil;

  if frm = nil then Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmPREVIA.ReportPREVIAGroupHeaderBand2BeforePrint(Sender: TObject);
var sBanco, sAgencia, sContaCorr, sNumDepIRRF, sSql: String;
    bFaz: Boolean;
    vsrb, vinss, vsup: double;
begin
  inherited;
  // Inicializa Variáveis
  // Ler Banco, Agencia e Conta Corrente
  bFaz := True;
  sBanco     := '';
  sAgencia   := '';
  sContaCorr := '';
  LblBanco.Caption := '';

  qryAux.close;
  qryAux.SQL.Clear;
  if not qryPREVIA.IsEmpty then
  begin
      sBanco     := qryPREVIA.FieldByName('Banco').AsString;
      sAgencia   := qryPREVIA.FieldByName('NumAgencia').AsString;
      sContaCorr := qryPREVIA.FieldByName('ContaCorrente').AsString;
















      //ABREVIAR INFOS BANCARIAS
    if sContaCorr <> '' then
      LblBanco.Caption:='Bco:'+sBanco+'  Ag:'+sAgencia+'  C/C:'+sContaCorr
    else
      LblBanco.Caption:='Não há informações bancárias cadastradas para este participante';
  end;

  (* Dados para o Sub-Relatório - Benefícios *)
   qryBenef.DataSource := dsPREVIA;
  (* ======================================= *)

  // banco portador
  qryBancoPort.close;
  qryBancoPort.Prepare;
  qryBancoPort.Params[0].AsInteger := qryPREVIA.FieldByName('CODPORTFORMA').AsInteger;
  qryBancoPort.Open;
  try
    if not qryBancoPort.isempty then
      lblForma.caption := qryBancoPort.FieldByName('DESCRICAO').AsString
    else
      lblForma.caption := 'Portador Forma Não Cadastrado';
  except
  end;

  if FazQuery(qryAux, 'select bpv.nomevalorbase1, bpp.valorbase1, '+
                      '       bpv.nomevalorbase2, bpp.valorbase2, '+
                      '       bpv.nomevalorbase3, bpp.valorbase3, '+
                      '       bfc.percentual '+
                      'from benefplanopart bpp, benefplanprev bpv, bfciariotitplan bfc, beneficio b '+
                      'where bpp.idpessoa(+) = '+inttostr(qryPrevia.fieldbyname('IDRESPONSAVEL').asInteger)+' '+
                      'and bpp.idplanoprev(+) = bpv.idplanoprev '+
                      'and bpp.idbeneficio(+) = bpv.idbeneficio '+
                      'and bpv.flgreferencia = 0 '+
                      'and bpv.idplanoprev = bfc.idplanoprev '+
                      'and bpv.idbeneficio = bfc.idbeneficio '+
                      'and bfc.idpessoa = '+inttostr(qryPrevia.fieldbyname('IDRESPONSAVEL').asInteger)+' '+
                      'and bfc.idtitular = 11 '+
                      'and b.idbeneficio = bpv.idbeneficio '+
                      'and b.tipobeneficio < 99 ') then
  begin
    pplNomebase1.visible:=trim(qryAux.fieldbyname('nomevalorbase1').asstring)<>'';
    pplValorbase1.visible:=trim(qryAux.fieldbyname('nomevalorbase1').asstring)<>'';
    pplNomebase1.caption:=qryAux.fieldbyname('nomevalorbase1').asstring;
    pplValorBase1.caption:=formatfloat('#0.000000',qryAux.fieldbyname('valorbase1').asfloat);

    pplNomebase2.visible:=trim(qryAux.fieldbyname('nomevalorbase2').asstring)<>'';
    pplValorbase2.visible:=trim(qryAux.fieldbyname('nomevalorbase2').asstring)<>'';
    pplNomebase2.caption:=qryAux.fieldbyname('nomevalorbase2').asstring;
    pplValorBase2.caption:=formatfloat('#0.000000',qryAux.fieldbyname('valorbase2').asfloat);

    pplNomebase3.visible:=trim(qryAux.fieldbyname('nomevalorbase3').asstring)<>'';
    pplValorbase3.visible:=trim(qryAux.fieldbyname('nomevalorbase3').asstring)<>'';
    pplNomebase3.caption:=qryAux.fieldbyname('nomevalorbase3').asstring;
    pplValorBase3.caption:=formatfloat('#0.000000',qryAux.fieldbyname('valorbase3').asfloat);

    pplNomeRateio.visible:=(qryPrevia.fieldbyname('IDRESPONSAVEL').asInteger <>
                            qryPrevia.fieldbyname('IDTITULAR').asInteger);
    pplValorRateio.visible:=(qryPrevia.fieldbyname('IDRESPONSAVEL').asInteger <>
                             qryPrevia.fieldbyname('IDTITULAR').asInteger);
    pplValorRateio.caption:=formatfloat('#0.000000',qryAux.fieldbyname('percentual').asfloat);
  end
  else
  begin
    pplNomebase1.visible:=False;
    pplValorbase1.visible:=False;
    pplNomebase1.caption:='';
    pplValorBase1.caption:='';
    pplNomebase2.visible:=False;
    pplValorbase2.visible:=False;
    pplNomebase2.caption:='';
    pplValorBase2.caption:='';
    pplNomebase3.visible:=False;
    pplValorbase3.visible:=False;
    pplNomebase3.caption:='';
    pplValorBase3.caption:='';
    pplNomeRateio.visible:=False;
    pplValorRateio.visible:=False;
    pplValorRateio.caption:='';
  end;

 //TORNAR INVISIVEL CAMPOS SE QRYBENEF SEM PROCESSO
  ppDBText3.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;
  ppDBText4.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;
  ppDBText5.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;
  ppDBText6.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;
  ppDBText7.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;
  ppDBText9.visible:=qryBenef.fieldbyname('NUMEROPROCESSO').asinteger<>0;

  If (pplNomebase1.visible)Or(pplValorbase1.visible)Or
      (pplNomebase2.visible)Or(pplValorbase2.visible)Or
       (pplNomebase3.visible)Or(pplValorbase3.visible)Or
        (pplNomeRateio.visible)Or(pplValorRateio.visible) then
    ppDtBandBenef.Height:=28
  else 
    ppDtBandBenef.Height:=14;
end;

procedure TdtmPREVIA.qrySub01BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  rProvento := 0; rDesconto := 0;
end;

procedure TdtmPREVIA.qryPREVIAAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryRubIndiv.close;
  qryAcJud.close;
  qryDetalhe.Close;
  qryFundacao.Close;
  qryMatricBenef.Close;
end;

procedure TdtmPREVIA.qryPREVIABeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryDetalhe.Open;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmPREVIA.QryDadosCadastraisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  rProvento := 0;
end;

procedure TdtmPREVIA.DbTotDescPatroPrint(Sender: TObject);
begin
  inherited;
  // Calcula Total Líquido por Patrocinadora
  lbTotLiqPatro.Caption := FormatFloat('###,###,##0.00',(DbTotProvPatro.Value - DbTotDescPatro.Value));
end;

procedure TdtmPREVIA.ReportPREVIASummaryBand1BeforePrint(Sender: TObject);
begin
  inherited;
  pplTotalLiquido.Caption := '';
  pplTotalProvento.Caption := '';
  pplTotalDesconto.Caption := '';
  try
    if (ssqltotal <> '') then
      if FazQuery(qryAux, ssqltotal) then
      begin
        pplTotalLiquido.Caption := FormatFloat('#,##0.00',qryAux.fieldbyname('LIQUIDO').asfloat);
        pplTotalProvento.Caption := FormatFloat('#,##0.00',qryAux.fieldbyname('PROVENTO').asfloat);
        pplTotalDesconto.Caption := FormatFloat('#,##0.00',qryAux.fieldbyname('DESCONTO').asfloat);
      end;
  except
  end;
end;

procedure TdtmPREVIA.dtmPREVIACreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        ReportPREVIA.Template.FileName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FolhaPagamento.rtm';

  bDefinitiva:=false;
end;

procedure TdtmPREVIA.ReportPREVIAGroupHeaderBand2AfterPrint(
  Sender: TObject);
begin
  inherited;
  LblBanco.Caption := '';
end;

procedure TdtmPREVIA.lblTotLiqPrint(Sender: TObject);
begin
  inherited;
  lblTotLiq.Caption := FormatFloat('###,###,##0.00',(DbTotProvento.Value-DbTotDesconto.Value));

end;

procedure TdtmPREVIA.qryDetalheAfterOpen(DataSet: TDataSet);
begin
  inherited;
  rTotProventoPatro := 0;
  rTotDescontoPatro := 0;
  rTotProventoPlano := 0;
  rTotDewscontoPlano := 0;

end;

{------------------------------------------------------------------------------}
procedure TdtmPREVIA.qryPREVIAAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
  qryRubIndiv.open;
  qryAcJud.open;
  qryMatricBenef.Open;
  ppRegion1.Visible := not qryMatricBenef.IsEmpty;
end;

procedure TdtmPREVIA.ppTitleBand2BeforePrint(Sender: TObject);
begin
  inherited;

  //CPRev - 26800  - Inicio
  ppDBText19.Visible := Not (ReportPREVIADBText12.Text = ppDBText19.Text);
  ppLabel35.Visible  := Not (ReportPREVIADBText12.Text = ppDBText19.Text);
  //CPRev - 26800  - Fim
end;

end.
{------------------------------------------------------------------------------|
| UNIT: DPREVIA                                                                |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE PARA RELATÓRIO DE PAGAMENTO INDIVIDUAL NA PREVIA E NA          |
| HISTRUBSAL.                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NO RELATÓRIO DA PREVIA. NO DATASET DE DETALHE FAZER O UNION CON- |
| SODERANDO TAMBEM O IDTITULAR NA TABELA PREVIA.                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/04/2002 A 17/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12K                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NO RELATÓRIO DA PREVIA. A IMPRESSÃO DA DIB AGORA É FEITA APARTIR |
| DA QUERY QRYNUMPROC, PARA EVITAR O CASO DAS DUPLICAÇÕES DE REGISTROS  QUANDO |
| O PARTICIPANTE POSSUI O NUMERO DO PROCESSO DO BENEFICIO DO INSS DIFERENTE    |
| DO BENEFICIO DE SUPLEMENTAÇÃO.                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/05/2002 A 07/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12M                                              |
| CLIENTE: (CBS   )                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  -  O LABEL DO BANCO AGORA SO MOSTRA A INFORMACAO DO BANCO, CASO EXISTA      |
|  -  INCLUSAO DE UM LABEL ESPECIFICO PARA O PORTADOR FORMA                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/08/2002 A 23/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DE VALORES BASE, SRB, INSS E VALORINTEGRAL NO RELATORIO.          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/08/2002 A 29/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado no quadro do relatório os campos plano e patrocinadora.    |
|    - Também está sendo mostrado, dependendo da forma de ordenção escolhida,  |
|    os valores total do relatório.                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/11/2002 A 27/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT) Pendência 10544.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração do Relatório para mostrar detalhes     |
|   de benefícios, criação da qryBenef. Arrumação nos campos do relatório.     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

