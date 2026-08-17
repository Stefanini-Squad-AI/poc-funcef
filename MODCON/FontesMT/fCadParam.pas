unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  ExtCtrls, Mask, DBTables, TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdblook,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect, DBClient, uCMClientDataSet, uCtrlParamRH;

type
  TfrmCadParam = class(TFrmCadastroMT)
    Label12: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    dbrgIntegraCAP: TDBRadioGroup;
    dbrgIntegraCont: TDBRadioGroup;
    dbrgSubConta: TDBRadioGroup;
    CdsMoeda: TCMClientDataSet;
    dbrgPercProb: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure dbrgIntegraContChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    CtrlParamRH: TCtrlParamRH;

    procedure Sel;
    function  GravarRegistro: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCMTypes, uModulo, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  if (Modulo.IdContraCheque = REFER) or (Modulo.IdContraCheque = FUNCEF) then
    dbrgPercProb.Items[0] := 'No Valor da Causa'
  else
    dbrgPercProb.Items[0] := 'No Valor Reclamado';

  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CtrlParamRH.CdsParamRH := Cds;

  Sel;
  if (Cds.IsEmpty) then
  begin
    CtrlParamRH.ExecInsert;
    CtrlParamRH.GravarParamRH;
    Sel;
  end;

  CdsMoeda.Data := CtrlParamRH.ListMoeda;

  if (Sistema.IdModulo = MODCON) then // Processos Trabalhistas
    dbrgIntegraCAP.Caption := 'Faz Integração com Contas a Pagar?'
  else
    dbrgIntegraCAP.Caption := 'Faz Integração com Contas a Pagar/Receber?';

  if (Sistema.IdModulo = 111) then      // Processos Judiciais
    bbtnAjuda.HelpContext := 230005
  else if (Sistema.IdModulo = 110) then // Contencioso Previdenciário
    bbtnAjuda.HelpContext := 230005
  else                                  // Contencioso Trabalhista
    bbtnAjuda.HelpContext := 0;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  dbrgSubConta.Visible := (dbrgIntegraCont.ItemIndex = 0);
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  inherited;
end;

procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  Sel;
end;

procedure TfrmCadParam.dbrgIntegraContChange(Sender: TObject);
begin
  dbrgSubConta.Visible := (dbrgIntegraCont.ItemIndex = 0);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadParam.Sel;
begin
  Cds.Data := CtrlParamRH.ListParamRH;
end;

function TfrmCadParam.GravarRegistro: boolean;
begin
  Result := CtrlParamRH.GravarParamRH;
  if not(Result) then
    raise Exception.Create(CtrlParamRH.MessageInfo);
end;

end.
