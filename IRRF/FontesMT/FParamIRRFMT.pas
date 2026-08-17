unit FParamIRRFMT;

// Alterações:
//***************************************************************************************
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Alteração Form.....: FParamIRRFMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novas linhas de parametrização de informe.
//***************************************************************************************
{ --------------------------------------------------------------------------------------------------
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Data.....: 22/11/2011
Kintana..: 1489901
Sol......: 163982/7003
Descrição: Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
********************************************************************************
********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 18/09/2009
Kintana..: 121847
Sol......: 591283
Descrição: Saldo de contribuição 13º: Caso permaneça o valor negativo, depois de
           percorrido os meses referentes ao 13º salário, lançar o saldo como
           rendimento 13º salário.
********************************************************************************
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : Inclusão de campo na tela
Data      : 29/10/2009
Autor     : Bruno Bastos
Pendencia : Sol 122590 - Kintana
Descrição : Criação de parâmetro na tela para utilização no processo de compensação de valor negativo.
----------------------------------------------------------------------------------------------------
Rotina    : ControlaTela
Data      : 08/11/2007
Autor     : Bruno Bastos
Pendencia : 26817
Descrição : Criação dessa rotina para não permitir a parametrização da mesma linha de informe de
            rendimento nos dois parâmetros de busca de inss.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 30/03/2007
Autor     : Bruno Bastos
Pendencia : 22661
Descrição : Retirado group box de descrição "Alteradores para Integração do IRRF do CAR", com os
            campos CodAltComissao e CodAltIrrfCAR.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 21/03/2007
Autor     : André Pontes
Pendencia : 24513
Descrição : Criado novo campo: CCustoBuscaCaP, representando Centro de Custo único para geração de
            documentos de recolhimento de impostos. Esse centro de custo será gravado na LancIRRF
            no momento da busca de impostos de Contas a Pagar.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 06/03/2007
Autor     : André Pontes
Pendencia :
Descrição : Retirados os campos CodAltINSS e CodAltIRRFCaP, pois não fazem mais sentido para as
            funcionalidades refeitas.
            Ajuste geral no layout de tela
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 19/04/2006
Autor     : Bruno Bastos
Pendencia : 21544
Descrição : Foram colocados dois novos parãmetros na nova aba de Busca do INSS,
            referente a Linha do Informe para o Valor Base e a Linha do Informe
            para o Valor do INSS, que serão utilizadas na busca do inss, para
            gravar na lancxinforme.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  CMProcuraSubTipo, TREdit, wwdblook, ComCtrls, uCtrlParamIRRF,
  USistema, UMensErro, UDatabase, DBaseDados,UAutorizacao, DBTables,
  uCmSqlParams, uCtrlInforme,uCtrlNatuRendimento, Mask, wwdbedit, Provider;

type
  TfrmParamIRRFMT = class(TFrmCadastroMT)
    pcnParametros: TPageControl;
    tbsGeral: TTabSheet;
    GroupBox1: TGroupBox;
    Multa: TLabel;
    Label7: TLabel;
    dblcmbMulta: TwwDBLookupCombo;
    dblcmbJuros: TwwDBLookupCombo;
    TabSheet1: TTabSheet;
    cdsTipoAlterador: TCMClientDataSet;
    cdsMultaJurosDesc: TCMClientDataSet;
    cdsTipoDesembolso: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsCentCust: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    Label2: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label3: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label5: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    dbrgPagLanc: TDBRadioGroup;
    Label1: TLabel;
    dblcDesconto: TwwDBLookupCombo;
    cdsDesconto: TCMClientDataSet;
    cmprocForCli: TCMProcuraForCli;
    tbsInss: TTabSheet;
    lblTetoInss: TLabel;
    dblkTetoInss: TwwDBLookupCombo;
    cdsTetoInss: TCMClientDataSet;
    Label6: TLabel;
    dblkInssAutonomo: TwwDBLookupCombo;
    cdsInssAutonomo: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    tbsInforme: TTabSheet;
    cdsInforme: TCMClientDataSet;
    tbsEmprestimo: TTabSheet;
    dbgIOF: TDBRadioGroup;
    cdsNatuRendimento: TCMClientDataSet;
    gbInss: TGroupBox;
    dbrgDocDarfIRJud: TDBRadioGroup;
    tbsBuscaINSS: TTabSheet;
    dblkInformeVlrBase: TwwDBLookupCombo;
    dblkInformeVlrINSS: TwwDBLookupCombo;
    lblInformeVlrBase: TLabel;
    Label8: TLabel;
    GroupBox10: TGroupBox;
    dblcAcima65Abono: TwwDBLookupCombo;
    dblcAcima65: TwwDBLookupCombo;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblcMolestiaGrave: TwwDBLookupCombo;
    cboInforme65INSS: TwwDBLookupCombo;
    cboInformeMolINSS: TwwDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    cboInforme65INSSAbono: TwwDBLookupCombo;
    Label13: TLabel;
    Label14: TLabel;
    dblcAcaoJudicial: TwwDBLookupCombo;
    Label15: TLabel;
    dblcAcaoJudicialAbono: TwwDBLookupCombo;
    grpbxTipoGeraDARF: TGroupBox;
    dbckbTipoGeraDARF: TDBCheckBox;
    Label16: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label17: TLabel;
    dblcNatRendMantido: TwwDBLookupCombo;
    Label18: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    Label19: TLabel;
    Label20: TLabel;
    wwDBLookupCombo7: TwwDBLookupCombo;
    DBedtCodigoGPS: TDBEdit;
    Label21: TLabel;
    dbchkUsaDadosTelaManual: TDBCheckBox;
    dbedNumDiasAvisoDarf: TwwDBEdit;
    lblNumDiasAviso: TLabel;
    dblcEgibilidadeSuspensa: TwwDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    dblcAcaoJudicialInss: TwwDBLookupCombo;
    Label24: TLabel;
    dblcAcaoJudicialInss13: TwwDBLookupCombo;
    dblcRegraAcaoJudicialINSS: TwwDBLookupCombo;
    Label25: TLabel;
    cdsRegra: TCMClientDataSet;
    lblCompensaVlrNegativo: TLabel;
    dblcInfRendCompNeg: TwwDBLookupCombo;
    wwDBLookupCombo8: TwwDBLookupCombo;
    Label26: TLabel;
    dblcInfRendCompNeg13s: TwwDBLookupCombo;
    lblCompensaVlrNegativo13s: TLabel;
    lblInformeContribExtra: TLabel;
    lblInformeContribExtra13: TLabel;
    dblcIDINFORMECONTRIBEXTRA: TwwDBLookupCombo;
    dblcIDINFORMECONTRIBEXTRA13: TwwDBLookupCombo;

    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);


  private // Private declarations

    ParamIRRF : TCtrlParamIRRF;
    Informe   : TCtrlInforme;
    Natureza  : TCtrlNatuRendimento;

    function ControlaTela: Boolean;

  public  // Public declarations


  end;



var
  frmParamIRRFMT: TfrmParamIRRFMT;



implementation
{$R *.DFM}



procedure TfrmParamIRRFMT.FormCreate(Sender: TObject);
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  ParamIRRF := TCtrlParamIRRF.Create;
  Natureza  := TCtrlNatuRendimento.Create;
  Informe   := TCtrlInforme.create;

  ParamIRRF.Initialize(DtmBaseDados.dbBaseDados,
                       True,
                       Sistema.ConnectionType,
                       Sistema.ConnectionSide,
                       Sistema.AppRemoteServer,
                       True,
                       nil,
                       nil,
                       False
                      );

  Natureza.InitializeAs(ParamIRRF);
  Informe.InitializeAs(ParamIRRF);

  // -----------------------------------------------------------------------------------------------

  cds.data := ParamIRRF.ProcurarParamIRRF(sistema.idEmpresa);

  gbInss.Visible := ParamIRRF.DeveMostrarDadosINSS;

  ParamIRRF.CdsParamIRRF := cds;

  cdsTipoAlterador.data  := ParamIRRF.ListTipoAlterador(Sistema.IdEmpresa);
  cdsMultaJurosDesc.data := ParamIRRF.ListTipoAlteradorMultaJuros(Sistema.IdEmpresa);
  cdsTipoDesembolso.data := ParamIRRF.ListTipoDesembolso(sistema.IdEmpresa);
  cdsAtivProj.data       := ParamIRRF.ListAtivProjeto(sistema.IdEmpresa);
  cdsCentCust.data       := ParamIRRF.ListCentroCusto(sistema.IdEmpresa);
  cdsTipoDoc.data        := ParamIRRF.ListTipoDoc;
  cdsDesconto.data       := ParamIRRF.ListTipoAlteradorDesconto(sistema.IdEmpresa);
  cdsTetoInss.Data       := ParamIRRF.ListSiglaMoeda;
  cdsInssAutonomo.Data   := ParamIRRF.ListImpostos;
  cdsInforme.data        := Informe.ListInforme;
  cdsNatuRendimento.data := Natureza.ListNaturendimento;
  cdsRegra.Data          := ParamIRRF.ListRegras;
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
  if((wwDBLookupCombo2.Text = '') and (wwDBLookupCombo2.LookupValue <> '')) then
  wwDBLookupCombo2.Text := ParamIRRF.recuperaAtividadePerd(wwDBLookupCombo2.LookupValue)
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
end;



procedure TfrmParamIRRFMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not ControlaTela then
    exit;

  inherited;
  tbsGeral.Enabled  := False;
  tbsInforme.Enabled := false;
  tbsInss.Enabled   := False;
  TabSheet1.Enabled := False;
  bbtnCancelar.Click;
end;



procedure TfrmParamIRRFMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  tbsGeral.Enabled      := True;
  tbsInforme.Enabled    := true;
  tbsInss.Enabled       := True; 
  TabSheet1.Enabled     := True;
  tbsEmprestimo.enabled := true;
  if (cds.Eof) then
  Begin
     ds.DataSet.Insert;
     cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  end;
  inherited;
  if cds.FieldByName('FLGPAGLANC').isNull then
     cds.FieldByName('FLGPAGLANC').AsString := 'P';
  pcnParametros.ActivePage:=tbsGeral;
end;



procedure TfrmParamIRRFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  tbsGeral.Enabled  := False;
  tbsInforme.enabled := true;
  tbsInss.Enabled   := False; 
  TabSheet1.Enabled := False;
  tbsEmprestimo.enabled := false;
end;



procedure TfrmParamIRRFMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  ParamIRRF.GravarParamIRRF;
end;



procedure TfrmParamIRRFMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
   if cboInforme65INSS.LookupValue = '' then
      cds.FieldByname('IDINFORME65INSS').Clear;

   if cboInformeMolINSS.LookupValue = '' then
      cds.FieldByname('IDINFORMEMOLINSS').Clear;

  ParamIRRF.GravarParamIRRF;
end;



procedure TfrmParamIRRFMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   if cboInforme65INSS.LookupValue = '' then
      cds.FieldByname('IDINFORME65INSS').Clear;

   if cboInformeMolINSS.LookupValue = '' then
      cds.FieldByname('IDINFORMEMOLINSS').Clear;

  ParamIRRF.GravarParamIRRF;
end;



procedure TfrmParamIRRFMT.FormActivate(Sender: TObject);
begin
  inherited;
  tbsGeral.Enabled      := False;
  tbsInforme.enabled    := false;
  tbsInss.Enabled       := False;
  TabSheet1.Enabled     := False;
  tbsEmprestimo.enabled := false;
  pcnParametros.ActivePage := tbsGeral;
end;



procedure TfrmParamIRRFMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if cds.IsEmpty then
    Begin
      sbtnInserir.Enabled := True;
      sbtnAlterar.Enabled := False;
      sbtnProcurar.Enabled := False;
    end
  else
    Begin
      if not sbtnInserir.Down then
        Begin
          sbtnInserir.Enabled  := False;
          sbtnAlterar.Enabled  := True;
          pnlFundo.Enabled     := True;
          sbtnApagar.Enabled   := False;
          sbtnProcurar.Enabled := False;
        end;
    end;
end;



procedure TfrmParamIRRFMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;



procedure TfrmParamIRRFMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  cds.data := ParamIRRF.ProcurarParamIRRF(cds.fieldByname('IDPESSOA').asInteger);
end;



procedure TfrmParamIRRFMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  tbsGeral.Enabled := True;
  tbsInforme.enabled := true;
  tbsInss.Enabled  := True; 
  TabSheet1.Enabled := True;
  tbsEmprestimo.enabled := true;
end;



procedure TfrmParamIRRFMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ParamIRRF.free;
  Informe.free;
  Natureza.free;
end;



procedure TfrmParamIRRFMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  if cds.FieldByName('FLGPAGLANC').isNull then
     cds.FieldByName('FLGPAGLANC').AsString := 'P';
end;

function TfrmParamIRRFMT.ControlaTela: Boolean;
begin
  Result := True;
  if ( dblkInformeVlrBase.LookupValue <> ''                             ) and
     ( dblkInformeVlrINSS.LookupValue <> ''                             ) and
     ( dblkInformeVlrBase.LookupValue  = dblkInformeVlrINSS.LookupValue ) then
  begin
    MsgDlg('Na aba "Busca do INSS", não é permitido parametrizar a linha do informe para o valor do '+
           ' imposto igual a linha do informe parametrizada para o valor da base.', 'Informação',
           mtInformation, [mbOk], 0);
    Result := False;
  end;
end;

end.
