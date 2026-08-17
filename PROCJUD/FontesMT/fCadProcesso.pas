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
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    dbedRazaoSocial: TDBEdit;
    dbedNumDoc: TDBEdit;
    dbrgTipoPessoa: TDBRadioGroup;
    dbedEmail: TDBEdit;
    dbedLogradouro: TDBEdit;
    dbedNumLogradouro: TDBEdit;
    dbedComplementoLogradouro: TDBEdit;
    dbedBairro: TDBEdit;
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    procedure dbreCustoChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  protected
    procedure OnMudarParametrosTela; override;
    procedure OnMudarDadosParticipante; override;
    function  CriarTelaParamFichaProc: TForm; override;
    procedure OnParamFichaProc(Frm: TForm); override;
    function  CriarFichaProc: TFrmCmReport; override;
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
  end;

var
  frmCadProcesso: TfrmCadProcesso;

implementation

uses uMensErro, uCtrlFuncoesRH, fParamFichaProc_ProcJud, RFichaProc_ProcJud;

{$R *.DFM}

procedure TfrmCadProcesso.OnMudarParametrosTela;
begin
  iTipoIntegraCAPCAR := CAPCAR; // Indica que este módulo osmente faz integração com o CAP e CAR

  // Mudar Rótulos dos Combos de integração
  dblckTipoDesemb.Options := [loColLines,loTitles];
  dblckTipoDesemb.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');

  dblckTipoDoc.Options := [loColLines,loTitles];
  dblckTipoDoc.Selected.Add('RECPAG'+#9+'07'+#9+'Rec / Pag');
  dblckTipoDoc.Selected.Add('DEBCRE'+#9+'35'+#9+'D/C');
end;

procedure TfrmCadProcesso.OnMudarDadosParticipante;
begin
  CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(
    Cds.FieldByName('IDRECLAMANTE').asFloat);
  inherited;
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcesso;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (4,5,6,7)');
end;

procedure TfrmCadProcesso.OnClick_ProcurarProcessoComLitisconsortes;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (4,5,6,7)');
end;

procedure TfrmCadProcesso.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('INDMATERIA').asInteger := 4;
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

function TfrmCadProcesso.CriarTelaParamFichaProc: TForm;
begin
  Result := TfrmParamFichaProc_ProcJud.Create(Application);
end;

procedure TfrmCadProcesso.OnParamFichaProc(Frm: TForm);
begin
  (Frm as TfrmParamFichaProc_ProcJud).TipoPessoa := '';
  (Frm as TfrmParamFichaProc_ProcJud).IdReports := 4052;
end;

function TfrmCadProcesso.CriarFichaProc: TFrmCmReport;
begin
  Result := TRptFichaProc_ProcJud.Create(Application); 
end;

end.
