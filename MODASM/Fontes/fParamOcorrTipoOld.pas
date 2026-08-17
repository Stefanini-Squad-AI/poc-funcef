// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamOcorrTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, FOkCancelar,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst, MontaSelect;
  
type
  TfrmParamOcorrTipo = class(TfrmOkCancelar)
    gbxFaixaData: TGroupBox;
    Label7: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgTipoRel: TRadioGroup;
    gbxOcorr: TGroupBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    chklstTipoOcorr: TCheckListBox;
    qryTipoOcorr: TwwQuery;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    MontaSelectCID: TMontaSelect;
    gbxOpcaoFiltroCID: TGroupBox;
    rgFiltroCID: TRadioGroup;
    pnlFiltroCID: TPanel;
    rgOpcaoCodCID: TRadioGroup;
    edCODCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chklstTipoOcorrDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstTipoOcorrClickCheck(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure rgFiltroCIDClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
  private
    lstTipoOcorr: TStringList;

    procedure HabilitaBtOk;
  public
    { Public declarations }
  end;

var
  frmParamOcorrTipo: TfrmParamOcorrTipo;

implementation

uses uSistema, uFuncoesUteis, dRelatoriosAsm2, fAguarde, uMensErro;

{$R *.DFM}

procedure TfrmParamOcorrTipo.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  lstTipoOcorr := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatoriosAsm2.rpOcorrTipo.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  // Preenche ChkList das Tipos de Ocorrência
  chklstTipoOcorr.Items.Clear;
  with (qryTipoOcorr) do
  begin
    Open;
    while not(EOF) do
    begin
      lstTipoOcorr.Add(FieldByName('CODTIPOOCMED').asString);
      chklstTipoOcorr.Items.Add(FieldByName('DESCRTIPOOCMED').asString);
      Next;
    end;
  end;

  edData1.Date := (Date-365);
  edData2.Date := (Date);
end;

procedure TfrmParamOcorrTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lstTipoOcorr.Free;

  qryTipoOcorr.Close;
  inherited;  
end;

procedure TfrmParamOcorrTipo.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date);
end;

procedure TfrmParamOcorrTipo.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamOcorrTipo.chklstTipoOcorrDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamOcorrTipo.chklstTipoOcorrClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamOcorrTipo.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;

  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrTipo.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);

  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrTipo.bbtnConfirmarClick(Sender: TObject);
var
  sTipoOcorr: string;
begin
  inherited;
  CriaListaOpcoes (chklstTipoOcorr, lstTipoOcorr, sTipoOcorr, ',', false);

  with (dtmRelatoriosAsm2) do
  begin
    qryOcorrTipo.Close;
    with (qryOcorrTipo.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      Add('  RTRIM(PF.NOME) AS NOME, PF.IDPESSOA,');
      Add('  TM.DESCRTIPOOCMED, HM.DATAREAL, HM.EXAMINADOR, HM.LICENCA,');
      Add('  HM.DATAPLAN, HM.CODCID,');
      Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',HM.AVALIACAO) AS AVALIACAO,');
      Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',DECODE(HM.AVALIACAO,');
      Add('    GREATEST(TM.AVALMIN,HM.AVALIACAO),''Apt'',''Inapt'') ||');
      Add('    DECODE(PEFIS.SEXO,''M'',''o'',''F'',''a'',''o(a)'')) AS RESULTADO');
      Add('FROM');
      Add('  PESSOA PF, PESSOAFISICA PEFIS, HSTASMED HM, TIPOCMED TM');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      // Tipos de Ocorrência selecionados
      if (sTipoOcorr <> '') then
        if (Pos(',',sTipoOcorr) > 0) then
          Add('  (TM.CODTIPOOCMED IN (' +sTipoOcorr+ ')) AND')
        else
          Add('  (TM.CODTIPOOCMED = ' +sTipoOcorr+ ') AND');

      Add('  (HM.DATAREAL BETWEEN TO_DATE(' +QuotedStr(edData1.Text)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(edData2.Text)+ ',''DD/MM/YYYY'')) AND');
      if (rgFiltroCID.ItemIndex = 0) and (edCODCID.Text <> '') then
         if (rgOpcaoCodCID.ItemIndex = 0) then
            Add('  (TRIM(HM.CODCID) = ' + QuotedStr(trim(edCODCID.Text)) + ') AND')
         else
            Add('  (HM.CODCID LIKE ''' + trim(edCODCID.Text) + '%'') AND');
      Add('  (TM.CODTIPOOCMED = HM.CODTIPOOCMED) AND');
      Add('  (HM.IDPESSOA     = PF.IDPESSOA)     AND');
      Add('  (PF.IDPESSOA     = PEFIS.IDPESSOA)');
      Add('ORDER BY UPPER(DESCRTIPOOCMED), UPPER(NOME)');
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    rpOcorrTipoLblDATAINI.Caption   := edData1.Text;
    rpOcorrTipoLblDATAFINAL.Caption := edData2.Text;
    bRelatAnalitico := (rgTipoRel.ItemIndex = 0);

    rpOcorrTipo.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;

  frmAguarde.Mostra('Relatório de Ocorrências Médicas por Tipo');
  frmAguarde.Pos := 0;
  dtmRelatoriosAsm2.qryOcorrTipo.Open;

  if (dtmRelatoriosAsm2.qryOcorrTipo.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmParamOcorrTipo.rgFiltroCIDClick(Sender: TObject);
begin
  inherited;
  pnlFiltroCID.Visible := rgFiltroCID.ItemIndex = 0;
end;

procedure TfrmParamOcorrTipo.bbtnBuscaCIDClick(Sender: TObject);
begin
  inherited;
  MontaSelectCID.Executar;
  if (MontaSelectCID.ValoresChave.Count > 0) and (MontaSelectCID.ValoresChave[0] <> '') then
     edCODCID.Text := MontaSelectCID.ValoresChave[0];
end;

end.
