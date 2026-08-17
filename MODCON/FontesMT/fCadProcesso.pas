unit fCadProcesso;

interface                    

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadProcesso,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Wwdbspin, Mask,
  DBCtrls, ExtCtrls, TREdit, CMProcuraSubTipo, wwdbedit, CMProcura, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, fCmReport,
  TB97Tlwn;

type
  TfrmCadProcesso = class(TfrmCustomCadProcesso)
    Label13: TLabel;
    dbedJCJ: TDBEdit;
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
  protected
    procedure OnMudarParametrosTela; override;
    procedure OnMudarDadosParticipante; override;
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
    function  CriarTelaParamFichaProc: TForm; override;
    procedure OnParamFichaProc(Frm: TForm); override;
    function  CriarFichaProc: TFrmCmReport; override;
    function  GetDataDemissao: TDate; override;
  end;

var
  frmCadProcesso: TfrmCadProcesso;

implementation

uses uMensErro, uCtrlFuncoesRH, fParamFichaProc_ModCon, RFichaProc_ModCon;

{$R *.DFM}

procedure TfrmCadProcesso.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('INDMATERIA').asInteger := 1;
end;

procedure TfrmCadProcesso.dbreCustoChange(Sender: TObject);
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

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadProcesso.OnMudarParametrosTela;
begin
  iTipoIntegraCAPCAR := CAP; // Indica que este módulo osmente faz integração com o CAP

  // Mudar Rótulos do Grid de Objetos
  dbgrdDet.Selected.Add('PERCORIG'+#9+'10'+#9+'Probab. Original (%)');
  dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Contraparte (%)');

  // Mudar Rótulos dos Combos de integração
  dblckTipoDesemb.Options := [];
  dblckTipoDoc.Options := [];
end;

procedure TfrmCadProcesso.OnMudarDadosParticipante;
begin
  CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante(
    Cds.FieldByName('IDRECLAMANTE').asFloat);
  inherited;
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcesso;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA = 1');
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcessoComLitisconsortes;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA = 1');
end;

function TfrmCadProcesso.GetDataDemissao: TDate;
begin
  if not(CdsPartic.FieldByName('DATADEMISSAO').IsNull) and
    (CdsPartic.FieldByName('DATADEMISSAO').asString <> '') then
    Result := CdsPartic.FieldByName('DATADEMISSAO').asDateTime
  else
    Result := 0;
end;

function TfrmCadProcesso.CriarTelaParamFichaProc: TForm;
begin
  Result := TfrmParamFichaProc_ModCon.Create(Application);
end;

procedure TfrmCadProcesso.OnParamFichaProc(Frm: TForm);
begin
  (Frm as TfrmParamFichaProc_ModCon).TipoPessoa := 'F';
  (Frm as TfrmParamFichaProc_ModCon).IdReports := 4041;
end;

function TfrmCadProcesso.CriarFichaProc: TFrmCmReport;
begin
  Result := TRptFichaProc_ModCon.Create(Application);
end;

end.
