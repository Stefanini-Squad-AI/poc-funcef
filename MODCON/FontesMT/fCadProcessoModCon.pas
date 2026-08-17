unit fCadProcessoModCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadProcesso,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Wwdbspin, Mask,
  DBCtrls, ExtCtrls, TREdit, CMProcuraSubTipo, wwdbedit, CMProcura, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadProcessoModCon = class(TfrmCustomCadProcesso)
    Label13: TLabel;
    dbedJCJ: TDBEdit;
    CMProcuraContraparte: TCMProcuraSubTipo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    dbedCargo: TDBEdit;
    dbedSalAtual: TDBEdit;
    dbrgTipoSalar: TDBRadioGroup;
    dbedAdm: TDBEdit;
    dbedDem: TDBEdit;
    dbedMotivo: TDBEdit;
    dbedEstab: TDBEdit;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbreCustoChange(Sender: TObject);
    procedure CMProcuraContraparteExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  protected
    procedure OnMudarParametrosTela; override;
    procedure OnMudarDadosParticipante; override;
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
  end;

var
  frmCadProcessoModCon: TfrmCadProcessoModCon;

implementation

{$R *.DFM}

uses uMensErro, uCtrlFuncoesRH;

{ TfrmCadProcessoModCon }

procedure TfrmCadProcessoModCon.OnMudarParametrosTela;
begin
  iTipoIntegraCAPCAR := CAP; // Indica que este módulo osmente faz integração com o CAP

  // Mudar Rótulos do Grid de Objetos
  dbgrdDet.Selected.Add('PERCORIG'+#9+'10'+#9+'Probab. Original (%)');
  dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Contraparte (%)');

  // Mudar Rótulos dos Combos de integração
  dblckTipoDesemb.Options := [];
  dblckTipoDoc.Options := [];
end;

procedure TfrmCadProcessoModCon.OnMudarDadosParticipante;
begin
  inherited;
  CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante(
    Cds.FieldByName('IDRECLAMANTE').asFloat);
end;

procedure TfrmCadProcessoModCon.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('INDMATERIA').asInteger := 1;
end;

procedure TfrmCadProcessoModCon.OnClick_ProcurarProcesso;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA   = 1');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA');
  MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT    = TRT.CODIGOTRT(+)');
  MontaSelect.Tabelas.Add('TRT');
end;

procedure TfrmCadProcessoModCon.OnClick_ProcurarProcessoComLitisconsortes;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    = 1');
  MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT     = TRT.CODIGOTRT(+)');
  MontaSelect.Tabelas.Add('TRT');
end;

procedure TfrmCadProcessoModCon.dbreCustoChange(Sender: TObject);
begin
  if (CdsPartic.Active) then
    redValorAtual.Value := CtrlCalcRub.ValorAtualProcesso(
      Cds.FieldByName('CUSTOPROC').asFloat,
      FU.IFF(dbedDem.Text<>'', dbedDem.Text, Cds.FieldByName('DATANOTIF').asString),
      Cds.FieldByName('MOEDAPROCTRAB').asString,
      Cds.FieldByName('IDREGRA').asString,
      Cds.FieldByName('NUMPROCTRAB').asString,
      dbrgIndTaxaConv.ItemIndex);
end;

procedure TfrmCadProcessoModCon.CMProcuraContraparteExit(Sender: TObject);
begin
  inherited;
  OnMudarDadosParticipante;
  MudarNomeSubConta(CMProcuraContraparte.Text);
end;

procedure TfrmCadProcessoModCon.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(CMProcuraContraparte.Text) = '') then
  begin
    MsgDlg('Contraparte Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    CMProcuraContraparte.SetFocus;
  end
  else
    inherited;
end;

end.
