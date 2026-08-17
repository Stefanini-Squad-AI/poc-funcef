unit fElimPesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Db, DBTables, Wwdatsrc, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CheckLst, ComCtrls, DBClient, uCMClientDataSet,
  ColorCheckListBox, uCtrlElimPesquisaSal;

type
  TfrmElimPesq = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    bbtnExecutar: TBitBtn;
    gbxRubrica: TGroupBox;
    chklstPesquisa: TColorCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    CdsPesqSal: TCMClientDataSet;
    lblMsg: TLabel;
    prgbProgresso: TProgressBar;
    Bevel2: TBevel;
    Label2: TLabel;
    edNumPesqEliminadas: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstPesquisaClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
  private
    CtrlElimPesquisaSal: TCtrlElimPesquisaSal;

    lstIdPesquisa: TStringList;    

    procedure MontarListaPesquisas;
    procedure HabilitaBtExecutar;    
  end;

var
  frmElimPesq: TfrmElimPesq;

implementation

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmElimPesq.FormCreate(Sender: TObject);
begin
  inherited;
  lstIdPesquisa := TStringList.Create;

  CtrlElimPesquisaSal := TCtrlElimPesquisaSal.Create;
  CtrlElimPesquisaSal.InitializeAs(Padroes);

  MontarListaPesquisas;
  HabilitaBtExecutar;
  
  lblMsg.Visible := false;
end;

procedure TfrmElimPesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lstIdPesquisa.Free;
  FreeAndNil(CtrlElimPesquisaSal);
  inherited;
end;

procedure TfrmElimPesq.chklstPesquisaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtExecutar;
end;

procedure TfrmElimPesq.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPesquisa.Items.Count-1 do
    chklstPesquisa.Checked[c] := true;
  chklstPesquisa.Repaint;
  HabilitaBtExecutar;
end;

procedure TfrmElimPesq.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPesquisa.Items.Count-1 do
    chklstPesquisa.Checked[c] := not(chklstPesquisa.Checked[c]);
  chklstPesquisa.Repaint;
  HabilitaBtExecutar;
end;

procedure TfrmElimPesq.bbtnExecutarClick(Sender: TObject);
var
  bOk: boolean;
  iNumPesqElim: integer;
  sIdPesqSelAtual, sIdPesqSel: string;
begin
  if (MsgDlg('Confirma a Eliminação da(s) Pesquisa(s) selecionada(s)?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    FU.CriaListaOpcoes(chklstPesquisa, lstIdPesquisa, sIdPesqSel, ',', false);
    edNumPesqEliminadas.Text := '0';
    prgbProgresso.Position := 0;
    prgbProgresso.Max := FU.NumCaracteres(',',sIdPesqSel) + 1;
    lblMsg.Visible := true;
    iNumPesqElim := 0;

    repeat
      FU.ExtraiString(sIdPesqSel, sIdPesqSelAtual, ',');
      lblMsg.Caption := 'Eliminando Pesquisa Salarial Nº '+sIdPesqSelAtual+' ...';
      lblMsg.Update;

      bOk := CtrlElimPesquisaSal.EliminiarPesquisaSalarial(StrToInt(sIdPesqSelAtual));
      prgbProgresso.StepIt;
      if (bOk) then
        Inc(iNumPesqElim)
      else
      if (sIdPesqSel = '') or ((sIdPesqSel <> '') and
         (MsgDlg('O erro abaixo ocorreu ao tentar excluir a Pesquisa Nº '+
                 sIdPesqSelAtual +':'+CR_LF+ 'Deseja prosseguir?' +CR_LF+CR_LF+
                 CtrlElimPesquisaSal.MessageInfo, 'Erro', mtError,
                 [mbYes,mbNo], 0) = mrNo)) then
        break;
    until (sIdPesqSel = '');

    edNumPesqEliminadas.Text := IntToStr(iNumPesqElim);

    if (iNumPesqElim > 0) then
    begin
      if (iNumPesqElim = prgbProgresso.Max) then
        MsgDlg(CtrlElimPesquisaSal.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
      else
        MsgDlg('Processo não foi executado por completo.'+CR_LF+
               'Nem todas as Pesquisas foram emilinadas.', 'Informação',
               mtInformation, [mbOk,mbHelp], 0);
      bbtnExecutar.Enabled := false;
      MontarListaPesquisas;
    end
    else
    if (sIdPesqSel = '') then
      raise Exception.Create(CtrlElimPesquisaSal.MessageInfo);

    prgbProgresso.Position := 0;
    lblMsg.Visible := false;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmElimPesq.HabilitaBtExecutar;
var
  c: integer;
  bSelPesqSal: boolean;
begin
  // Verifica se alguma Pesquisa Salarial foi selecionada
  bSelPesqSal := false;
  for c:=0 to chklstPesquisa.Items.Count-1 do
    if (chklstPesquisa.Checked[c]) then
    begin
      bSelPesqSal := true;
      break;
    end;

  bbtnExecutar.Enabled := bSelPesqSal;
end;

procedure TfrmElimPesq.MontarListaPesquisas;
begin
  chklstPesquisa.Items.BeginUpdate;
  CdsPesqSal.Data := CtrlElimPesquisaSal.ListPesquisaSalarial;
  chklstPesquisa.Items.Clear;
  while not(CdsPesqSal.EOF) do
  begin
    lstIdPesquisa.Add(CdsPesqSal.FieldByName('IDPESQSALAR').asString);
    chklstPesquisa.Items.Add(CdsPesqSal.FieldByName('NOMEPESQSALAR').asString);
    CdsPesqSal.Next;
  end;
  chklstPesquisa.Items.EndUpdate;  
end;

end.
