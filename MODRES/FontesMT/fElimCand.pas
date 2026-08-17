unit fElimCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Mask, MskEdDlg, Db, DBTables, TB97,
  Wwdatsrc, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, TB97Tlbr,
  CheckLst, ComCtrls, ColorCheckListBox, uCtrlCargo, uCtrlElimCandidato;

type
  TfrmElimCand = class(TfrmSairAjuda)
    dtedDataRef: TCMDateTimePicker;
    gbxCargo: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    chklstCargo: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    Bevel3: TBevel;
    Label2: TLabel;
    edNumElim: TEdit;
    lblMsg: TLabel;
    prgbProgresso: TProgressBar;
    bbtnExecutar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  private
    CtrlCargo: TCtrlCargo;
    CtrlElimCandidato: TCtrlElimCandidato;

    ListaIdCargo: TStringList;

    procedure MontarListaCargo;
    procedure HabilitaBtExecutar;
    procedure Progresso(Args: array of variant);
  end;

var
  frmElimCand: TfrmElimCand;

implementation

uses uMensErro, uCtrlFuncoesRH, uCtrlPadroes, dCds;

{$R *.DFM}

procedure TfrmElimCand.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlElimCandidato := TCtrlElimCandidato.Create;
  CtrlElimCandidato.InitializeAs(Padroes);
  CtrlElimCandidato.Progresso := Progresso;
  
  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  ListaIdCargo := TStringList.Create;

  MontarListaCargo;
  HabilitaBtExecutar;

  dtedDataRef.Date := Date - 730;
end;

procedure TfrmElimCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlElimCandidato);
  FreeAndNil(ListaIdCargo);
  inherited;
end;

procedure TfrmElimCand.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := true;
  chklstCargo.Repaint;
end;

procedure TfrmElimCand.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := not(chklstCargo.Checked[c]);
  chklstCargo.Repaint;
end;

procedure TfrmElimCand.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtExecutar;
end;

procedure TfrmElimCand.bbtnExecutarClick(Sender: TObject);
var
  bOk: boolean;
  iNumElim: integer;
  sListaIdCargoSel: string;
begin
  if (MsgDlg('Confirma a Eliminação dos Candidatos?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);
    edNumElim.Text := '0';
    prgbProgresso.Position := 0;
    lblMsg.Caption := '';
    lblMsg.Visible := true;

    CtrlElimCandidato.CreateThreadProgresso;
    bOk := CtrlElimCandidato.EliminarCandidatos(sListaIdCargoSel, dtedDataRef.Date, iNumElim);
    CtrlElimCandidato.FreeThreadProgresso;

    edNumElim.Text := IntToStr(iNumElim);

    if (bOk) then
      MsgDlg(CtrlElimCandidato.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlElimCandidato.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

    prgbProgresso.Position := 0;
    lblMsg.Visible := false;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmElimCand.HabilitaBtExecutar;
begin
  try
    StrToDate(dtedDataRef.Text);
    bbtnExecutar.Enabled := (dtedDataRef.Date > 0);
  except
  end;
end;

procedure TfrmElimCand.MontarListaCargo;
begin
  chklstCargo.Items.BeginUpdate;
  dmCds.Cds.Data := CtrlCargo.ListCargo;
  chklstCargo.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString);
    dmCds.Cds.Next;
  end;
  chklstCargo.Items.EndUpdate;
end;

procedure TfrmElimCand.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
    prgbProgresso.Max := Args[0];

  if (Args[1] > 0) then
    lblMsg.Caption := 'Candidato Nº ' +IntToStr(Args[1])+ ' ...';

  if (Args[2] > 0) then
    prgbProgresso.StepIt;

  Self.Repaint;
end;

end.
