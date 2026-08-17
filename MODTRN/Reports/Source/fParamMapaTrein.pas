unit fParamMapaTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlCurso, uCtrlPacote,
  ColorCheckListBox;

type
  TfrmParamMapaTrein = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxCursos: TGroupBox;
    chklstCurso: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsCurso: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxSelCursos: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    cbxNaoRealNaoProgr: TCheckBox;
    rgIncluiExternos: TRadioGroup;
    gbxPacote: TGroupBox;
    chklstPacote: TColorCheckListBox;
    bbtnSelPacote: TBitBtn;
    bbtnInvertePacote: TBitBtn;
    CdsPacote: TCMClientDataSet;
    Memo1: TMemo;
    cbxNada: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelPacoteClick(Sender: TObject);
    procedure bbtnInvertePacoteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCurso: TCtrlCurso;
    CtrlPacote: TCtrlPacote;

    ListaIdCurso, ListaIdPacote: TStringList;
  end;

var
  frmParamMapaTrein: TfrmParamMapaTrein;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, uMensErro;

{$R *.DFM}

procedure TfrmParamMapaTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlPacote := TCtrlPacote.Create;
  CtrlPacote.InitializeAs(Padroes);

  ListaIdCurso := TStringList.Create;
  ListaIdPacote := TStringList.Create;

  // Preenche ChkList dos Cursos
  CdsCurso.Data := CtrlCurso.ListGeral;
  chklstCurso.Items.Clear;
  while not(CdsCurso.EOF) do
  begin
    ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
    chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    CdsCurso.Next;
  end;

  // Preenche ChkList dos Pacotes
  CdsPacote.Data := CtrlPacote.ListGeral(0);
  chklstPacote.Items.Clear;
  while not(CdsPacote.EOF) do
  begin
    ListaIdPacote.Add(CdsPacote.FieldByName('IDPACOTE').asString);
    chklstPacote.Items.Add(CdsPacote.FieldByName('DESCRICAO').asString);
    CdsPacote.Next;
  end;

  edData1.Date := Date - 365;
  edData2.Date := Date;
  cmbSeqRel.ItemIndex := 0;
end;

procedure TfrmParamMapaTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlPacote);
  FreeAndNil(ListaIdCurso);
  FreeAndNil(ListaIdPacote);
  inherited;
end;

procedure TfrmParamMapaTrein.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := true;
  chklstCurso.Repaint;
end;

procedure TfrmParamMapaTrein.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := not(chklstCurso.Checked[c]);
  chklstCurso.Repaint;
end;

procedure TfrmParamMapaTrein.bbtnSelPacoteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPacote.Items.Count-1 do
    chklstPacote.Checked[c] := true;
  chklstPacote.Repaint;
end;

procedure TfrmParamMapaTrein.bbtnInvertePacoteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPacote.Items.Count-1 do
    chklstPacote.Checked[c] := not(chklstPacote.Checked[c]);
  chklstPacote.Repaint;
end;

procedure TfrmParamMapaTrein.bbtnConfirmarClick(Sender: TObject);
var
  c, c1, c2, c3: integer;
  sListaFunc, sCurso, sPacote: string;
begin
  IrPaginaResult := False;
  inherited;
  ModalResult := mrOK;
  FU.CriaListaOpcoes(chklstCurso, ListaIdCurso, sCurso, ',', false);
  FU.CriaListaOpcoes(chklstPacote, ListaIdPacote, sPacote, ',', false);

  if (sPacote <> '') then
  begin
    for c:=0 to chklstPacote.Items.Count-1 do
    begin
      if (chklstPacote.Checked[c]) then
      begin
        CdsCurso.IndexName := 'CdsCursoIndex';

        if (CdsCurso.Locate('IDPACOTE', ListaIdPacote[c], [])) then
        begin
          repeat
            if (sCurso = '') then
              sCurso := CdsCurso.FieldByName('IDCURSO').asString
            else
              sCurso := sCurso +','+ CdsCurso.FieldByName('IDCURSO').asString;

            CdsCurso.Next;
          until (CdsCurso.EOF) or
                (CdsCurso.FieldByName('IDPACOTE').asString <> ListaIdPacote[c]);
        end;
      end;
    end;
    CdsCurso.IndexName := '';
  end;

  if (sCurso = '') then
  begin
    MsgDlg('Você deve selecionar ao menos um pacote ou um curso',
           'Informação', mtInformation, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end
  else
  begin
    c1 := FU.ContaCaracter(sCurso, ',') + 1;
    if (c1 > 10) then
    begin
      if (MsgDlg('Foram selecionados ' + IntToStr(c1) + ' cursos.' +CR_LF+
                 'Apenas os 10 primeiros serão exibidos.' +CR_LF+
                 'Confirma a execução?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
      begin
         ModalResult := mrNone;
         exit;
      end;

      c1 := 10;
      c3 := 0;
      for c:=1 to 10 do
      begin
        c2 := pos(',', Copy(sCurso, c3 + 1, length(sCurso) - c3 + 1));
        c3 := c3 + c2;
      end;

      sCurso := copy(sCurso, 1, c3 - 1);
    end;
  end;

  ExecutarIrPaginaResult;
  c:=0;
  while not(CdsPrincipal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := CdsPrincipal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaCurso').asString := sCurso;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaFunc;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := EdData2.Date;
  Cmp_Padrao.ParamByName('IncPorConta').asInteger := rgIncluiExternos.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
  Cmp_Padrao.ParamByName('SelCurso1').asBoolean := cbxRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso2').asBoolean := cbxRealNaoProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso3').asBoolean := cbxNaoRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso4').asBoolean := cbxNaoRealNaoProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso5').asBoolean := cbxNada.Checked;
  Cmp_Padrao.ParamByName('ContaCurso').asInteger := c1;
end;

end.
