unit fElimLanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Db,
  DBTables, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Spin,
  ExtCtrls, checklst, DBClient, uCMClientDataSet, uCtrlElimLancamento, uCtrlGlobalRH,
  uCtrlProvDesc, ColorCheckListBox;

type
  TfrmElimLanca = class(TfrmSairAjuda)
    rgProcessados: TRadioGroup;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    cbxMesAno: TCheckBox;
    rgPermanentes: TRadioGroup;
    gbxRubrica: TGroupBox;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    chklstRubrica: TColorCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    cmbComparador: TComboBox;
    bbtnExecutar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsRubrica: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure cbxMesAnoClick(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    CtrlElimLancamento: TCtrlElimLancamento;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;

    lstCodRubrica: TStringList;
    lstIdRubrica: TStringList;

    sCodRubricasSel: string;
  end;

var
  frmElimLanca: TfrmElimLanca;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TfrmElimLanca.FormCreate(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  lstCodRubrica := TStringList.Create;
  lstIdRubrica := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlElimLancamento := TCtrlElimLancamento.Create;
  CtrlElimLancamento.InitializeAs(Padroes);

  DecodeDate(CtrlGlobalRH.GetNormalIni, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
  cmbComparador.ItemIndex := 0;

  //Preenche ChkList das Rubricas
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  chklstRubrica.Items.Clear;
  while not(CdsRubrica.EOF) do
  begin
    lstCodRubrica.Add(CdsRubrica.FieldByName('CODPROVDESC').asString);
    lstIdRubrica.Add(CdsRubrica.FieldByName('IDRUBRICA').asString);
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    CdsRubrica.Next;
  end;
end;

procedure TfrmElimLanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlElimLancamento);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(lstIdRubrica);
  FreeAndNil(lstCodRubrica);
  inherited;
end;

procedure TfrmElimLanca.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
end;

procedure TfrmElimLanca.cbxMesAnoClick(Sender: TObject);
begin
  cmbMes.Visible := not(cbxMesAno.Checked);
  spnedAno.Visible := not(cbxMesAno.Checked);
  cmbComparador.Visible := not(cbxMesAno.Checked);
end;

procedure TfrmElimLanca.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);

  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, lstCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.bbtnExecutarClick(Sender: TObject);
var
  sIdRubricasSel: string;
begin
  if (MsgDlg('Confirma a Eliminação dos Lançamentos?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    FU.CriaListaOpcoes(chklstRubrica, lstIdRubrica, sIdRubricasSel, ',', false);

    frmAguarde.Mostra('Eliminando Lançamentos...');

    if (CtrlElimLancamento.Processar(
      Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1), sIdRubricasSel,
      cbxMesAno.Checked, cmbComparador.Text, rgPermanentes.ItemIndex, rgProcessados.ItemIndex)) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Eliminação de Lançamentos Executada com Sucesso.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
    end
    else
    begin
      frmAguarde.Apaga;
      MsgDlg('Não Foi Possível Eliminar os Lançamentos.'+CR_LF+'Processo Abortado.',
        'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;  
end;

end.
