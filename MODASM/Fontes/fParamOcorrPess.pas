// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamOcorrPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect, CheckLst;

type
  TfrmParamOcorrPess = class(TfrmSelPessoal)
    tbshRelatorio: TTabSheet;
    gbxFaixaData: TGroupBox;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgTipoRel: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    Label9: TLabel;
    gbxOpcaoFiltroCID: TGroupBox;
    rgFiltroCID: TRadioGroup;
    MontaSelectCID: TMontaSelect;
    pnlFiltroCID: TPanel;
    rgOpcaoCodCID: TRadioGroup;
    edCODCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    qryTipoOcorr: TwwQuery;
    gbxOcorr: TGroupBox;
    chklstTipoOcorr: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure rgFiltroCIDClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure chklstTipoOcorrDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstTipoOcorrClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    lstTipoOcorr: TStringList;
    procedure HabilitaBtOk;
  public
    { Public declarations }
  end;

var
  frmParamOcorrPess: TfrmParamOcorrPess;

implementation

uses uSistema, uFuncoesUteis, dRelatoriosAsm2, fAguarde, uMensErro;

{$R *.DFM}

procedure TfrmParamOcorrPess.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  lstTipoOcorr := TStringList.Create;  
  cmbTipoPapel.Items.Assign (dtmRelatoriosAsm2.rpOcorrPess.PrinterSetup.PaperNames);

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
  PageControl1.ActivePage := tbshRelatorio;
end;

procedure TfrmParamOcorrPess.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date);
end;

procedure TfrmParamOcorrPess.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamOcorrPess.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc, sTipoOcorr: string;
begin
  inherited;
  CriaListaOpcoes (chklstTipoOcorr, lstTipoOcorr, sTipoOcorr, ',', false);
  c:=0;
  while not(tblPessoal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  with (dtmRelatoriosAsm2) do
  begin
    qryOcorrPess.Close;
    with (qryOcorrPess.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      Add('  F.IDPESSOA, F.MATRICULA, RTRIM(PF.NOME) AS NOME,');
      Add('  C.TITULO AS CARGO, TM.DESCRTIPOOCMED, HM.DATAREAL, HM.EXAMINADOR, HM.LICENCA,');
      Add('  HM.DATAPLAN, HM.CODCID,');
      Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',HM.AVALIACAO) AS AVALIACAO,');
      Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',DECODE(HM.AVALIACAO,');
      Add('    GREATEST(TM.AVALMIN,HM.AVALIACAO),''Apt'',''Inapt'') ||');
      Add('    DECODE(PEFIS.SEXO,''M'',''o'',''F'',''a'',''o(a)'')) AS RESULTADO');
      Add('FROM');
      Add('  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, HSTASMED HM, TIPOCMED TM, CARGO C');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      // Tipos de Ocorrência selecionados
      if (sTipoOcorr <> '') then
        if (Pos(',',sTipoOcorr) > 0) then
          Add('  (TM.CODTIPOOCMED IN (' +sTipoOcorr+ ')) AND')
        else
          Add('  (TM.CODTIPOOCMED = ' +sTipoOcorr+ ') AND');

      // Funcionários/Candidatos selecionados
      if (sListaFunc <> '') then
      begin
        if (Pos(',',sListaFunc) > 0) then
          Add('  (PF.IDPESSOA    IN (' +sListaFunc+ ')) AND')
        else
          Add('  (PF.IDPESSOA     = ' +sListaFunc+ ') AND');
      end
      else
        Add('  (PF.IDPESSOA     = -1) AND');

      Add('  (HM.DATAREAL BETWEEN TO_DATE(' +QuotedStr(edData1.Text)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(edData2.Text)+ ',''DD/MM/YYYY'')) AND');
      Add('  (PF.IDPESSOA     = F.IDPESSOA)      AND');
      Add('  (PF.IDPESSOA     = PEFIS.IDPESSOA)  AND');
      Add('  (PF.IDPESSOA     = HM.IDPESSOA)     AND');
      if (rgFiltroCID.ItemIndex = 0) and (edCODCID.Text <> '') then
         if (rgOpcaoCodCID.ItemIndex = 0) then
            Add('  (TRIM(HM.CODCID) = ' + QuotedStr(trim(edCODCID.Text)) + ') AND')
         else
            Add('  (HM.CODCID LIKE ''' + trim(edCODCID.Text) + '%'') AND');
      Add('  (HM.CODTIPOOCMED = TM.CODTIPOOCMED) AND');
      Add('  (F.IDCARGO       = C.IDCARGO(+))');
      Add('ORDER BY UPPER(NOME), UPPER(DESCRTIPOOCMED)');
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    rpOcorrPessLblDATAINI.Caption   := edData1.Text;
    rpOcorrPessLblDATAFINAL.Caption := edData2.Text;
    bRelatAnalitico := (rgTipoRel.ItemIndex = 0);

    rpOcorrPess.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;

  frmAguarde.Mostra('Relatório de Ocorrências Médicas por Pessoa');
  frmAguarde.Pos := 0;
  dtmRelatoriosAsm2.qryOcorrPess.Open;

  if (dtmRelatoriosAsm2.qryOcorrPess.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmParamOcorrPess.rgFiltroCIDClick(Sender: TObject);
begin
  inherited;
  pnlFiltroCID.Visible := rgFiltroCID.ItemIndex = 0;
end;

procedure TfrmParamOcorrPess.bbtnBuscaCIDClick(Sender: TObject);
begin
  inherited;
  MontaSelectCID.Executar;
  if (MontaSelectCID.ValoresChave.Count > 0) and (MontaSelectCID.ValoresChave[0] <> '') then
     edCODCID.Text := MontaSelectCID.ValoresChave[0];
end;

procedure TfrmParamOcorrPess.chklstTipoOcorrDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
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

procedure TfrmParamOcorrPess.chklstTipoOcorrClickCheck(Sender: TObject);
begin
  inherited;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamOcorrPess.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;

  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrPess.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);

  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrPess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lstTipoOcorr.Free;
  qryTipoOcorr.Close;
  inherited;

end;

end.
