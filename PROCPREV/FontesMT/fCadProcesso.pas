unit fCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadProcesso,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Wwdbspin, Mask,
  DBCtrls, ExtCtrls, TREdit, CMProcuraSubTipo, wwdbedit, CMProcura, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, wwdblook, wwdbdatetimepicker, CMDateTimePicker, fCmReport,
  TB97Tlwn;

type
  TfrmCadProcesso = class(TfrmCustomCadProcesso)
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
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
    dbedPatrocinadora: TDBEdit;
    dbedCargo: TDBEdit;
    dbedSalAtual: TDBEdit;
    dbedAdm: TDBEdit;
    dbedDem: TDBEdit;
    procedure dbreCustoChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  protected
    procedure OnMudarParametrosTela; override;
    function  CriarTelaParamFichaProc: TForm; override;
    procedure OnParamFichaProc(Frm: TForm); override;
    function  CriarFichaProc: TFrmCmReport; override;
    procedure OnMudarDadosParticipante; override;
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
  end;

var
  frmCadProcesso: TfrmCadProcesso;

implementation

uses uMensErro, uCtrlFuncoesRH, fParamFichaProc_ProcPrev, RFichaProc_ProcPrev;

{$R *.DFM}

procedure TfrmCadProcesso.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('INDMATERIA').asInteger := 2;
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

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadProcesso.OnMudarParametrosTela;
begin
  iTipoIntegraCAPCAR := CAPCAR; // Indica que este módulo osmente faz integração com o CAP e CAR

  //FedNomeContraparte := edNomeContraparte;

  // Mudar Rótulos dos Combos de integração
  dblckTipoDesemb.Options := [loColLines,loTitles];
  dblckTipoDesemb.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');

  dblckTipoDoc.Options := [loColLines,loTitles];
  dblckTipoDoc.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');
  dblckTipoDoc.Selected.Add('DEBCRE'+#9+'35'+#9+'D/C');
end;

procedure TfrmCadProcesso.OnMudarDadosParticipante;
begin
  CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComPlano(
    Cds.FieldByName('IDRECLAMANTE').asFloat);
  inherited;
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcesso;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (2,3)');
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcessoComLitisconsortes;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (2,3)');
end;

function TfrmCadProcesso.CriarTelaParamFichaProc: TForm;
begin
  Result := TfrmParamFichaProc_ProcPrev.Create(Application);
end;

procedure TfrmCadProcesso.OnParamFichaProc(Frm: TForm);
begin
  (Frm as TfrmParamFichaProc_ProcPrev).TipoPessoa := '';
  (Frm as TfrmParamFichaProc_ProcPrev).IdReports := 4042;
end;

function TfrmCadProcesso.CriarFichaProc: TFrmCmReport;
begin
  Result := TRptFichaProc_ProcPrev.Create(Application);
end;

end.
