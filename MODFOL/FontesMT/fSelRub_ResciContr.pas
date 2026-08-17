// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fSelRub_ResciContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  StdCtrls, CheckLst, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, IniFileEx, uCtrlProvDesc, ColorCheckListBox;

type
  TfrmSelRub_ResciContr = class(TfrmOkCancelar)
    chklstRubrica: TColorCheckListBox;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    ListaIdRubrica, ListaCodRubrica: TStringList;
    ArqConfig: TIniFileEx;

    ListaCodRubricaSel: string;

    procedure CriarListaRubrica;
    procedure LerAlteracoes;
    procedure GravarAlteracoes;
  public
    ListaIdRubricaSel: string;
  end;

var
  frmSelRub_ResciContr: TfrmSelRub_ResciContr;

implementation

uses uSistema, uCtrlPadroes, dCds, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmSelRub_ResciContr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaCodRubrica := TStringList.Create;

  CriarListaRubrica;
end;

procedure TfrmSelRub_ResciContr.FormShow(Sender: TObject);
begin
  inherited;
  LerAlteracoes;
  edCodRubricas.Text := ListaCodRubricaSel;
  FU.VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmSelRub_ResciContr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  inherited;
  Action := caHide;
end;

procedure TfrmSelRub_ResciContr.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodRubrica);
  FreeAndNil(ArqConfig);
  inherited;
end;

procedure TfrmSelRub_ResciContr.chklstRubricaClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chklstRubrica, ListaCodRubrica, ListaCodRubricaSel, ',', false);
  edCodRubricas.Text := ListaCodRubricaSel;
end;

procedure TfrmSelRub_ResciContr.bbtnSelTudoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  FU.CriaListaOpcoes(chklstRubrica, ListaCodRubrica, ListaCodRubricaSel, ',', false);
  edCodRubricas.Text := ListaCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmSelRub_ResciContr.bbtnInverteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  FU.CriaListaOpcoes(chklstRubrica, ListaCodRubrica, ListaCodRubricaSel, ',', false);
  edCodRubricas.Text := ListaCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmSelRub_ResciContr.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmSelRub_ResciContr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (edCodRubricas.Text <> '') then
    FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, ListaIdRubricaSel, ',', false);
end;

procedure TfrmSelRub_ResciContr.CriarListaRubrica; 
begin
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  chklstRubrica.Items.Clear;
  ListaIdRubrica.Clear;
  ListaCodRubrica.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('IDPROVENTO').asString);
    ListaCodRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmSelRub_ResciContr.LerAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFileEx.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFileEx.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  ListaCodRubricaSel := ArqConfig.ReadString('GERACAO_RESCISAO', 'RubricasSel', '');
end;

procedure TfrmSelRub_ResciContr.GravarAlteracoes;
begin
  FU.CriaListaOpcoes(chklstRubrica, ListaCodRubrica, ListaCodRubricaSel, ',', false);
  ArqConfig.WriteString('GERACAO_RESCISAO', 'RubricasSel', ListaCodRubricaSel);
end;

end.
