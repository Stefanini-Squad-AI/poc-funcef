unit fCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCustomCadProcesso, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Wwdbspin, Mask,
  DBCtrls, ExtCtrls, TREdit, CMProcuraSubTipo, wwdbedit, CMProcura, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn;

type
  TfrmCadProcesso = class(TfrmCustomCadProcesso)
    dbrgMateria: TDBRadioGroup;
    LabelDataAjuiz2: TLabel;
    dbedDataAju2: TCMDateTimePicker;
    labellDataNot2: TLabel;
    dbedDataNot2: TCMDateTimePicker;
    rgAtivo: TDBRadioGroup;
    ntbkDadosRequerente: TNotebook;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    dbedCargo: TDBEdit;
    dbedSalAtual_ModCon: TDBEdit;
    dbrgTipoSalar: TDBRadioGroup;
    dbedAdm_ModCon: TDBEdit;
    dbedDem_ModCon: TDBEdit;
    dbedMotivo: TDBEdit;
    dbedEstab: TDBEdit;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    dbedRazao: TDBEdit;
    dbedNumDoc: TDBEdit;
    dbrgTipoPessoa: TDBRadioGroup;
    dbedEmail: TDBEdit;
    dbedLogra: TDBEdit;
    dbedNumLogra: TDBEdit;
    dbedComplem: TDBEdit;
    dbedBairro: TDBEdit;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbedPlano: TDBEdit;
    dbedInscNum: TDBEdit;
    dbedInscData: TDBEdit;
    dbedPatro: TDBEdit;
    dbedCargoI: TDBEdit;
    dbedSalAtual_ProcPrev: TDBEdit;
    dbedAdm_ProcPrev: TDBEdit;
    dbedDem_ProcPrev: TDBEdit;
    MontaSelectPartic: TMontaSelect;
    procedure dbreCustoChange(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
    procedure spbtnProcContraparteClick(Sender: TObject);
    procedure spbtnProcLitisconsorteClick(Sender: TObject);
  private
    procedure AssociarComponentesPart;
  protected
    procedure OnMudarParametrosTela; override;
    procedure OnMudarDadosParticipante; override;
    function  GetDataDemissao: TDate; override;
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
  end;

var
  frmCadProcesso: TfrmCadProcesso;
implementation

{$R *.DFM}

uses uMensErro, uCtrlFuncoesRH, fProcuraPessoaDoc, RFichaProc,
  fParamFichaProc, uSistema, fCustomParamFichaProc, FCmReport;

procedure TfrmCadProcesso.OnMudarParametrosTela;
begin
  iTipoIntegraCAPCAR := CAPCAR; // Indica que este módulo osmente faz integração com o CAP e CAR

  // Mudar Rótulos dos Combos de integração
  dblckTipoDesemb.Options := [loColLines,loTitles];
  dblckTipoDesemb.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');

  dblckTipoDoc.Options := [loColLines,loTitles];
  dblckTipoDoc.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');
  dblckTipoDoc.Selected.Add('DEBCRE'+#9+'35'+#9+'D/C');

  DataAjuizamento := dbedDataAju2;
  DataNotificacao := dbedDataNot2;
end;

procedure TfrmCadProcesso.OnMudarDadosParticipante;
begin
  CdsPartic.Close;
  AssociarComponentesPart;

  if Cds.FieldByName('INDMATERIA').asInteger = 1 then
    CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante(
      Cds.FieldByName('IDRECLAMANTE').asFloat)
  else if Cds.FieldByName('INDMATERIA').asInteger in [2,3] then
    CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComPlano(
      Cds.FieldByName('IDRECLAMANTE').asFloat)
  else
    CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(
      Cds.FieldByName('IDRECLAMANTE').asFloat);

  edNomeContraparte.Text := CdsPartic.FieldByName('NOME').asString;
end;

procedure TfrmCadProcesso.dbreCustoChange(Sender: TObject);
begin
  inherited;
  if (CdsPartic.Active) then
    redValorAtual.Value := CtrlCalcRub.ValorAtualProcesso(
      Cds.FieldByName('CUSTOPROC').asFloat,
      Cds.FieldByName('DATANOTIF').asString,
      Cds.FieldByName('MOEDAPROCTRAB').asString,
      Cds.FieldByName('IDREGRA').asString,
      Cds.FieldByName('NUMPROCTRAB').asString,
      dbrgIndTaxaConv.ItemIndex);
end;

function TfrmCadProcesso.GetDataDemissao: TDate;
begin
  if (Cds.FieldByName('INDMATERIA').asInteger = 1) and // ModCon
     not(CdsPartic.FieldByName('DATADEMISSAO').IsNull) and
     (CdsPartic.FieldByName('DATADEMISSAO').asString <> '') then
    Result := CdsPartic.FieldByName('DATADEMISSAO').asDateTime
  else
    Result := 0;
end;

procedure TfrmCadProcesso.AssociarComponentesPart;
begin
  case (Cds.FieldByName('INDMATERIA').asInteger) of
    1 : // ModCon
    begin
      ntbkDadosRequerente.ActivePage := 'ModCon';
      dbedCargo.DataSource := dsPartic;
      dbedSalAtual_ModCon.DataSource := dsPartic;
      dbrgTipoSalar.DataSource := dsPartic;
      dbedAdm_ModCon.DataSource := dsPartic;
      dbedDem_ModCon.DataSource := dsPartic;
      dbedMotivo.DataSource := dsPartic;
      dbedEstab.DataSource := dsPartic;

      dbedPlano.DataSource := nil;
      dbedInscNum.DataSource := nil;
      dbedInscData.DataSource := nil;
      dbedPatro.DataSource := nil;
      dbedCargoI.DataSource := nil;
      dbedSalAtual_ProcPrev.DataSource := nil;
      dbedAdm_ProcPrev.DataSource := nil;
      dbedDem_ProcPrev.DataSource := nil;

      dbedRazao.DataSource := nil;
      dbedNumDoc.DataSource := nil;
      dbrgTipoPessoa.DataSource := nil;
      dbedEmail.DataSource := nil;
      dbedLogra.DataSource := nil;
      dbedNumLogra.DataSource := nil;
      dbedComplem.DataSource := nil;
      dbedBairro.DataSource := nil;
    end;
    2,3 : // ProcPrev
    begin
      ntbkDadosRequerente.ActivePage := 'Procprev';
      dbedPlano.DataSource := dsPartic;
      dbedInscNum.DataSource := dsPartic;
      dbedInscData.DataSource := dsPartic;
      dbedPatro.DataSource := dsPartic;
      dbedCargoI.DataSource := dsPartic;
      dbedSalAtual_ProcPrev.DataSource := dsPartic;
      dbedAdm_ProcPrev.DataSource := dsPartic;
      dbedDem_ProcPrev.DataSource := dsPartic;

      dbedCargo.DataSource := nil;
      dbedSalAtual_ModCon.DataSource := nil;
      dbrgTipoSalar.DataSource := nil;
      dbedAdm_ModCon.DataSource := nil;
      dbedDem_ModCon.DataSource := nil;
      dbedMotivo.DataSource := nil;
      dbedEstab.DataSource := nil;

      dbedRazao.DataSource := nil;
      dbedNumDoc.DataSource := nil;
      dbrgTipoPessoa.DataSource := nil;
      dbedEmail.DataSource := nil;
      dbedLogra.DataSource := nil;
      dbedNumLogra.DataSource := nil;
      dbedComplem.DataSource := nil;
      dbedBairro.DataSource := nil;
    end;
    else // ProcJud
    begin
      ntbkDadosRequerente.ActivePage := 'ProcJud';
      dbedRazao.DataSource := dsPartic;
      dbedNumDoc.DataSource := dsPartic;
      dbrgTipoPessoa.DataSource := dsPartic;
      dbedEmail.DataSource := dsPartic;
      dbedLogra.DataSource := dsPartic;
      dbedNumLogra.DataSource := dsPartic;
      dbedComplem.DataSource := dsPartic;
      dbedBairro.DataSource := dsPartic;

      dbedCargo.DataSource := nil;
      dbedSalAtual_ModCon.DataSource := nil;
      dbrgTipoSalar.DataSource := nil;
      dbedAdm_ModCon.DataSource := nil;
      dbedDem_ModCon.DataSource := nil;
      dbedMotivo.DataSource := nil;
      dbedEstab.DataSource := nil;

      dbedPlano.DataSource := nil;
      dbedInscNum.DataSource := nil;
      dbedInscData.DataSource := nil;
      dbedPatro.DataSource := nil;
      dbedCargoI.DataSource := nil;
      dbedSalAtual_ProcPrev.DataSource := nil;
      dbedAdm_ProcPrev.DataSource := nil;
      dbedDem_ProcPrev.DataSource := nil;
    end;
  end;
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcesso;
begin
//  if MontaSelect.CamposChave.Count = 1 then
//    MontaSelect.CamposChave.Add('PESSOA.NOME');
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcessoComLitisconsortes;
begin
//  if MontaSelect.CamposChave.Count = 1 then
//    MontaSelect.CamposChave.Add('PESSOA.NOME');
end;

procedure TfrmCadProcesso.sbtnFichaClick(Sender: TObject);
var
  c: integer;
begin
//  inherited;
  with TfrmParamFichaProc.Create(Application) do
  begin
    edNumero.Text := dbedNumProcesso.Text;
    edContraParte.Text := edNomeContraparte.Text;
    sTipoPessoa := 'F';
    HabilitarBtOk;
    if (ShowModal = mrOk) then
    begin
      RptFichaProc := TRptFichaProc.Create(Application);
      RptFichaProc.CrmRptCM.IdReports := 4077;
      RptFichaProc.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      RptFichaProc.CrmRptCM.OrigemCM := 1;
      RptFichaProc.CrmRptCM.IdModulo := Sistema.IdModulo;
      RptFichaProc.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      for c:=0 to Cmp_Padrao.Params.Count-1 do
        RptFichaProc.CmpRptCM.ParamValues[c].Value := Cmp_Padrao.ParamValues[c].Value;
      RptFichaProc.CrmRptCM.Print;
      FreeAndNil(RptFichaProc);
    end;
  end;
end;
{
var
  c: integer;
  Frm: TfrmCustomParamFichaProc;
  Rpt: TFrmCmReport;
begin
  // Criar Form de Parâmetros de acordo com o módulo
  case (dbrgMateria.ItemIndex) of
    0    :
    begin
      Frm := TfrmParamFichaProc_ModCon.Create(Application);
      Frm.TipoPessoa := 'F';
    end;
    1..2 :
    begin
      Frm := TfrmParamFichaProc_ProcPrev.Create(Application);
      Frm.TipoPessoa := '';
    end;
    3..6 :
    begin
      Frm := TfrmParamFichaProc_ProcJud.Create(Application);
      Frm.TipoPessoa := '';
    end;
  end;

  try
    CopiarDadosMontaSelect(MontaSelect, Frm.MontaSelect);
    Frm.MontaSelect.SensivelACaixa[0] := 'S';
    Frm.MontaSelect.ItemsBusca.Add(edNomeContraparte.Text);
    Frm.edNumero.Text := dbedNumProcesso.Text;
    Frm.edNomeContraparte.Text := edNomeContraparte.Text;
    Frm.NomeNossoAdvog := CMProcuraAdv2.Text;
    Frm.OnClose := FormCloseParamFichaProc;
    Frm.IdReports := 4077;
    Frm.HabilitarBtOk;
    if (Frm.ShowModal = mrOk) then
    begin
      // Criar Relatório de acordo com o módulo
      case (dbrgMateria.ItemIndex) of
        0    : Rpt := TRptFichaProc_ModCon.Create(Application);
        1..2 : Rpt := TRptFichaProc_ProcPrev.Create(Application);
        3..6 : Rpt := TRptFichaProc_ProcJud.Create(Application);
      end;
      try
        Rpt.CrmRptCM.IdReports := Frm.IdReports;
        Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
        Rpt.CrmRptCM.OrigemCM := 1;
        Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
        Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
        for c:=0 to Frm.Cmp_Padrao.Params.Count-1 do
          Rpt.CmpRptCM.ParamValues[c].Value := Frm.Cmp_Padrao.ParamValues[c].Value;
        Rpt.CrmRptCM.Print;
      finally
        Rpt.Free;
      end;
    end;
  finally
    Frm.Free;
  end;
end;
}

procedure TfrmCadProcesso.spbtnProcContraparteClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) and (dbrgMateria.ItemIndex in [1,2]) and
     (MsgDlg('Deseja Restringir a Busca a Participantes?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    MontaSelectPartic.Executar;
    if (MontaSelectPartic.RetornouValor) then
    begin
      Cds.FieldByName('IDRECLAMANTE').asString := MontaSelectPartic.ValoresChave[0];
      edNomeContraparte.Text := MontaSelectPartic.ValoresChave[1];
      OnMudarDadosParticipante;
      MudarNomeSubConta(edNomeContraparte.Text);
    end;
    exit;
  end;

  if (Cds.State in [dsInsert,dsEdit]) and (dbrgMateria.ItemIndex = 0) and
     (MsgDlg('Deseja Restringir a Busca a (ex-)Empregados?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    MontaSelectFunc.Executar;
    if (MontaSelectFunc.RetornouValor) then
    begin
      Cds.FieldByName('IDRECLAMANTE').asString := MontaSelectFunc.ValoresChave[0];
      edNomeContraparte.Text := MontaSelectFunc.ValoresChave[1];
      OnMudarDadosParticipante;
      MudarNomeSubConta(edNomeContraparte.Text);
    end;
    exit;
  end;

  inherited;
{  if (Cds.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    Cds.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDoc.sIDPessoa;
    edNomeContraparte.Text := frmProcuraPessoaDoc.sNomePessoa;
    OnMudarDadosParticipante;
    MudarNomeSubConta(edNomeContraparte.Text);
  end; }
end;

procedure TfrmCadProcesso.spbtnProcLitisconsorteClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) and (dbrgMateria.ItemIndex in [1,2]) and
     (MsgDlg('Deseja Restringir a Busca a Participantes?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    MontaSelectPartic.Executar;
    if (MontaSelectPartic.RetornouValor) then
    begin
      CdsLitis.FieldByName('IDPESSOA').asString := MontaSelectPartic.ValoresChave[0];
      edLitisconsorte.Text := MontaSelectPartic.ValoresChave[1];
    end;
    exit;
  end;

  if (Cds.State in [dsInsert,dsEdit]) and (dbrgMateria.ItemIndex = 0) and
     (MsgDlg('Deseja Restringir a Busca a (ex-)Empregados?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    MontaSelectFunc.Executar;
    if (MontaSelectFunc.RetornouValor) then
    begin
      CdsLitis.FieldByName('IDPESSOA').asString := MontaSelectFunc.ValoresChave[0];
      edLitisconsorte.Text := MontaSelectFunc.ValoresChave[1];
    end;
    exit;
  end;
  inherited;
end;

end.
