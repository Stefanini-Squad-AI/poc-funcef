unit fImportaCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, Spin,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  ComCtrls, Db, DBTables, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdatsrc, wwdblook, fSairAjuda,
  DBClient, uCMClientDataSet, uCtrlFonte, uCtrlImportaCandidato, uValidaDoc;

type
  TfrmImportaCand = class(TfrmSairAjuda)
    pgctrlPaginas: TPageControl;
    tbsImporta: TTabSheet;
    tbsResult: TTabSheet;
    memResult: TMemo;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    ToolbarSep972: TToolbarSep97;
    rbtnImportarArq: TBitBtn;
    pnlHorario: TPanel;
    Bevel2: TBevel;
    spbtProcurArq: TSpeedButton;
    Label4: TLabel;
    lblArquivo: TLabel;
    Bevel1: TBevel;
    rgOpcaoAtualiza: TRadioGroup;
    pgbarProgresso: TProgressBar;
    Label6: TLabel;
    dblcmbLayout: TwwDBLookupCombo;
    CMValidaDoc: TCMValidaDoc;
    CdsFonteRecr: TCMClientDataSet;
    procedure spbtProcurArqClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnImportarArqClick(Sender: TObject);
    procedure pgctrlPaginasChange(Sender: TObject);
    procedure dblcmbLayoutChange(Sender: TObject);
  private
    CtrlFonte: TCtrlFonte;
    CtrlImportaCandidato: TCtrlImportaCandidato;

    procedure HabilitaBtOk;
    procedure Progresso(Args: array of variant);
  end;

var
  frmImportaCand: TfrmImportaCand;

implementation

uses FileCtrl, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmImportaCand.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImportaCandidato := TCtrlImportaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlImportaCandidato.InitializeAs(Padroes);
  CtrlImportaCandidato.Progresso := Progresso;

  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);

  CdsFonteRecr.Data := CtrlFonte.ListGeral;

  memResult.Lines.Clear;
  pnlHorario.Caption := '';
  pgctrlPaginas.ActivePageIndex := 0;
end;

procedure TfrmImportaCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFonte);
  FreeAndNil(CtrlImportaCandidato);
  inherited;
end;

procedure TfrmImportaCand.pgctrlPaginasChange(Sender: TObject);
begin
  rbtnImportarArq.Enabled := (pgctrlPaginas.ActivePageIndex = 0);
end;

procedure TfrmImportaCand.dblcmbLayoutChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmImportaCand.spbtProcurArqClick(Sender: TObject);
begin
  OpenDlg.InitialDir := 'C:\';

  if (OpenDlg.Execute) then
  begin
    lblArquivo.Caption := MinimizeName(OpenDlg.FileName, lblArquivo.Canvas, lblArquivo.Width);
    HabilitaBtOk;
  end;
end;

procedure TfrmImportaCand.bbtnSalvarClick(Sender: TObject);
begin
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmImportaCand.rbtnImportarArqClick(Sender: TObject);
var
  lstArquivo: TStringList;
begin
  if (FileExists(OpenDlg.FileName)) then
  begin
    lstArquivo := TStringList.Create;

    lstArquivo.LoadFromFile(OpenDlg.FileName);
    pgbarProgresso.Visible := true;
    pgbarProgresso.Position := 0;
    pgbarProgresso.Min := 0;
    pgbarProgresso.Max := lstArquivo.Count;
    memResult.Lines.Clear;

    CtrlImportaCandidato.LinhasArq.Text := lstArquivo.Text;
    CtrlImportaCandidato.CreateThreadProgresso;
    if (CtrlImportaCandidato.Processar(rgOpcaoAtualiza.ItemIndex = 0,
        CdsFonteRecr.FieldByName('IDFONTRECR').asFloat, dblcmbLayout.Text)) then
    begin
      CtrlImportaCandidato.FreeThreadProgresso;
      MsgDlg(CtrlImportaCandidato.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
    end
    else
    begin
      CtrlImportaCandidato.FreeThreadProgresso;
      MsgDlg(CtrlImportaCandidato.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
    end;

    pgctrlPaginas.ActivePageIndex := 1;
    rbtnImportarArq.Enabled := false;

    pgbarProgresso.Visible := false;
    pgbarProgresso.Position := 0;

    lstArquivo.Free;
  end
  else
    MsgDlg('Arquivo a ser lido não encontrado ou não pode ser aberto.',
      'Erro', mtError, [mbOk,mbHelp], 0);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmImportaCand.HabilitaBtOk;
begin
  rbtnImportarArq.Enabled := (ExtractFileName(lblArquivo.Caption) <> '') and
                             (dblcmbLayout.Text <> '');
end;

procedure TfrmImportaCand.Progresso(Args: array of variant);
begin
  if (Args[0] <> '') then
    memResult.Lines.Add(Args[0]);

  if (Args[1] <> '') then
    pnlHorario.Caption := Args[1]
  else
    pgbarProgresso.StepIt;

  Self.Repaint;
end;

end.
