unit fRateioProgMT;
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 24/04/2007
  Pendência    : 25025
  Solução      : Criado um check para desabilitar a segregação
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 22/02/2005
  Pendência    : 17813 / 18439
  Solução      : Tela completamente refeita
------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBClient, Mask, uMensErro,
  uCMClientDataSet, uCtrlPeriodo, uCtrlCentroCusto, uCtrlContab, uCtrlPadroes, uSistema,
  uCtrlPrePlanilhaRP, uVerificaPreenchimento, uDiasUteis, wwriched, Menus, FProgressoDuplo,
  uCtrlParamIntegra;

type
  TfrmRateioProgMT = class(TfrmWizardMT)
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim: TCMDateTimePicker;
    chkAssociaCentroCusto: TCheckBox;
    ChkExcluiPlanilha: TCheckBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CdsCentroCusto: TCMClientDataSet;
    dblkCCusto: TwwDBLookupCombo;
    lblPPPCentroCusto: TLabel;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    ListView: TListView;
    Panel1: TPanel;
    CdsPlanilhas: TCMClientDataSet;
    Panel2: TPanel;
    btnMarcarFiltro: TSpeedButton;
    edtFase: TEdit;
    spdInverter: TSpeedButton;
    spdTodos: TSpeedButton;
    dlgSalvar: TSaveDialog;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    meErros: TwwDBRichEdit;
    chkIgnoraSegrega: TCheckBox;
    StaticText3: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnContinuarClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure btnMarcarFiltroClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure PagControleChange(Sender: TObject);
    procedure chkIgnoraSegregaExit(Sender: TObject);
  private
    { Private declarations }
    CtrlContab        : TCtrlContab;
    CtrlPrePlanilhaRP : TCtrlPrePlanilhaRP;
    CtrlPeriodo       : TCtrlPeriodo;
    CtrlCentroCusto   : TCtrlCentroCusto;
    iPosicao1: integer;

    procedure MontarListaPlanilhas;
    procedure MontaDataIniFim;
    procedure ProcessaPlanilhas;
    procedure Progresso (vParams: array of variant);
    function Mascara( s : string ) : string;
    function VerificaPreenchimentoSelecao: boolean;
  public
    { Public declarations }
  end;

var
  frmRateioProgMT: TfrmRateioProgMT;

implementation

{$R *.DFM}

procedure TfrmRateioProgMT.MontarListaPlanilhas;
var
  ListItem : TListItem;
begin
  CdsPlanilhas.First;
  while not CdsPlanilhas.Eof do begin
    ListItem := ListView.Items.Add;
    ListItem.Caption := CdsPlanilhas.FieldByName('PANDESCRICAO').AsString;
    ListItem.SubItems.Add (CdsPlanilhas.FieldByName('PANCODIGO').AsString);
    ListItem.SubItems.Add (CdsPlanilhas.FieldByName('PANFASE').AsString);
    ListItem.SubItems.Add (Mascara(CdsPlanilhas.FieldByName('PANCONTABASE').AsString));

    CdsPlanilhas.Next;
  end;
end;

procedure TfrmRateioProgMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs (Padroes);
  CtrlContab.SelecionaParametros(Sistema.IdEmpresa);

  CtrlPrePlanilhaRP := TCtrlPrePlanilhaRP.Create;
  CtrlPrePlanilhaRP.InitializeAs (Padroes);
  CdsPlanilhas.Data := CtrlPrePlanilhaRP.ListPrePlanilhaRP (Sistema.IdEmpresa);
  CtrlPrePlanilhaRP.Progresso := Progresso;

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs (Padroes);
  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,True);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  CtrlCentroCusto := TCtrlCentroCusto.Create;
  CtrlCentroCusto.InitializeAs (Padroes);
  CdsCentroCusto.Data := CtrlCentroCusto.ListaCentroCusto (Sistema.IdEmpresa);

  if ParamIntegra.SegregaVirtual then
     chkIgnoraSegrega.Enabled := True;

  MontarListaPlanilhas;
end;

procedure TfrmRateioProgMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlContab);
  FreeAndNil (CtrlPrePlanilhaRP);
  FreeAndNil (CtrlPeriodo);
  FreeAndNil (CtrlCentroCusto);
  inherited;
end;

function TfrmRateioProgMT.Mascara(s: string): string;
begin
  Result := FormatMaskText( CtrlContab.MascaraContaParam + ';0; ', s );
  Result := StringReplace( Result, '. ', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' .', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' ', '', [rfReplaceAll] );
end;

procedure TfrmRateioProgMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkExercicio.Text <> '' then begin
    cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);
    dblkPeriodo.Enabled := true;
  end else
    dblkPeriodo.Enabled := false;

  MontaDataIniFim;
end;

function TfrmRateioProgMT.VerificaPreenchimentoSelecao: boolean;
var
  iDiaIni, iMesIni, iAnoIni, iDiaFim, iMesFim, iAnoFim: Word;
begin
  try
    Result := False;

    if dblkExercicio.Text = '' then
      raise EValidacao.CreateVal('Escolha o exercício!', dblkExercicio);

    if dblkPeriodo.Text = '' then
      raise EValidacao.CreateVal('Escolha o período!', dblkPeriodo);

    if edDataIni.Text = '' then
      raise EValidacao.CreateVal('Escolha a data início!', edDataIni);

    if edDataFim.Text = '' then
      raise EValidacao.CreateVal('Escolha a data fim!', edDataFim);

    if edDataFim.Date < edDataIni.Date then
      raise EValidacao.CreateVal('A data de início deve ser maior que a data fim!', edDataFim);

    DecodeDate (edDataIni.Date, iAnoIni, iMesIni, iDiaIni);
    DecodeDate (edDataFim.Date, iAnoFim, iMesFim, iDiaFim);

    if (iMesIni <> CtrlPeriodo.Periodo) or (iAnoIni <> CtrlPeriodo.Exercicio) then
      raise EValidacao.CreateVal('A data de início deve estar dentro do período selecionado!', edDataIni);

    if (iMesFim <> CtrlPeriodo.Periodo) or (iAnoFim <> CtrlPeriodo.Exercicio) then
      raise EValidacao.CreateVal('A data de fim deve estar dentro do período selecionado!', edDataFim);

    if (chkAssociaCentroCusto.Checked) and (dblkCCusto.Text <> '') then
      raise EValidacao.CreateVal('Escolha "Associa centro de custos...", ou, "Ou, utilizar um único centro de custos...!', chkAssociaCentroCusto);

    if not CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbIntegrado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio, false) then
      if MsgDlg ('Para continuar é aconselhável que o período esteja integrado, deseja continuar assim mesmo?',
                 'Período não Integrado!', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

    Result := true;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
    end;
  end;
end;

procedure TfrmRateioProgMT.MontaDataIniFim;
begin
  if (dblkExercicio.Text <> '') and (dblkPeriodo.Text <> '') then begin
     CtrlPeriodo.Exercicio := cdsExercicio.FieldByName('PEREXERCICIO').AsInteger;
     CtrlPeriodo.Periodo   := cdsPeriodo.FieldByName('PERNUMERO').AsInteger;

     edDataIni.Date := strtodate ('1/'+IntToStr(CtrlPeriodo.Periodo)+'/'+IntToStr(CtrlPeriodo.Exercicio));
     edDataFim.Date := DiasUteis.UltDiaMes(CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo);
  end;
end;

procedure TfrmRateioProgMT.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaDataIniFim;
end;

procedure TfrmRateioProgMT.btnContinuarClick(Sender: TObject);
begin
  if PagControle.ActivePageIndex = 0 then
    if not VerificaPreenchimentoSelecao then exit;

  inherited;

end;

procedure TfrmRateioProgMT.dblkExercicioExit(Sender: TObject);
begin
  inherited;
  dblkPeriodo.Enabled := not (dblkExercicio.Text = '');
end;

procedure TfrmRateioProgMT.spdTodosClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    ListView.Items[i].Checked := True;

end;

procedure TfrmRateioProgMT.spdInverterClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    ListView.Items[i].Checked := not ListView.Items[i].Checked;
end;

procedure TfrmRateioProgMT.btnMarcarFiltroClick(Sender: TObject);
var
  i, iFase : integer;

begin
  inherited;
  iFase := StrToIntDef (edtFase.Text, 0);
  if iFase <= 0 then begin
    MsgDlg ('Escolha uma fase válida!', 'Marcar Fase', mtInformation, [mbOk], 0);
  end else begin
    for i := 0 to ( ListView.Items.Count - 1 ) do begin
      if StrToIntDef( ListView.Items[i].SubItems[1], -1) = iFase then
        ListView.Items[i].Checked := true;
    end;
  end;
end;

procedure TfrmRateioProgMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  DlgSalvar.Execute;
  if DlgSalvar.FileName <> '' then
    meErros.Lines.SaveToFile(DlgSalvar.FileName);

end;

procedure TfrmRateioProgMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  meErros.Print('');

end;

procedure TfrmRateioProgMT.btnConfirmarClick(Sender: TObject);
var
  i, iNumRegistros : integer;
begin
  inherited;
  iNumRegistros := 0;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    if  ListView.Items[i].Checked then
      inc (iNumRegistros);

  if iNumRegistros = 0 then
    MsgDlg ('É necessário selecionar ao menos uma planilha para execução!', 'Selecione Planilha', mtInformation, [mbok], 0)
  else begin
    btnContinuar.OnClick(self);
    ProcessaPlanilhas;
  end;


end;

procedure TfrmRateioProgMT.PagControleChange(Sender: TObject);
begin
  inherited;
  case PagControle.ActivePageIndex of
    1: begin
      btnContinuar.Enabled := false;
      btnConfirmar.Enabled := true;
    end;
    2: begin
      btnConfirmar.Enabled := false;
      btnContinuar.Enabled := false;
    end;
  end;
end;

procedure TfrmRateioProgMT.ProcessaPlanilhas;
var
  i : integer;
  bErro: Boolean;
begin
  inherited;
  meErros.Clear;
  bErro := False;
  iPosicao1 := 1;
  frmProgressoDuplo.MostraFormProgressoDuplo ('Processando Planilha: ' + ListView.Items[0].Caption,
                                              'Data: ', iPosicao1, 0, ListView.Items.Count, 0, false, false);
  for i := 0 to ( ListView.Items.Count - 1 ) do
    if ListView.Items[i].Checked then begin


       meErros.Lines.Add ('*************************************************************************');
       meErros.Lines.Add ('Início Processando planilha: ' + ListView.Items[i].Caption);
       meErros.Lines.Add ('Fase: ' + ListView.Items[i].SubItems[1] + ' - Conta Base: ' + ListView.Items[i].SubItems[2]);
       meErros.Lines.Add ('*************************************************************************');

       if  CtrlPrePlanilhaRP.GeraRateioPorPrograma (CtrlPrePlanilhaRP.ProgressFileName, Sistema.IdEmpresa,
                                                Sistema.IdModulo, Sistema.IdUsuario, ParamIntegra.Plano,
                                                CtrlPeriodo.Exercicio, CtrlPeriodo.Periodo,
                                                edDataIni.Date, edDataFim.Date, Sistema.UsaPlanoPatro,
                                                chkAssociaCentroCusto.Checked,
                                                ChkExcluiPlanilha.Checked,
                                                StrToInt(ListView.Items[i].SubItems[0]),
                                                dblkCCusto.LookupValue) then begin
          meErros.Lines.Add ('-------------------------------------------------------------------------');
          meErros.Lines.Add ('Planilha: ' + ListView.Items[i].Caption);
          meErros.Lines.Add ('Processada com sucesso!');
          meErros.Lines.Add ('========================================================');
       end else begin
          bErro := True;
          meErros.Lines.Add ( CtrlPrePlanilhaRP.MessageInfo );
          meErros.Lines.Add ('-------------------------------------------------------------------------');
          meErros.Lines.Add ('Planilha: ' + ListView.Items[i].Caption);
          meErros.Lines.Add ('Processada com erros!');
          meErros.Lines.Add ('========================================================');
       end;

       Inc(iPosicao1);
       frmProgressoDuplo.Legenda  := 'Processando Planilha: ' + ListView.Items[0].Caption;
       frmProgressoDuplo.Legenda2 := 'Data: ';
       frmProgressoDuplo.AndaFormProgressoDuplo(iPosicao1, 0);

    end;
    frmProgressoDuplo.EscondeFormProgressoDuplo;
    if bErro then
      MsgDlg ('Planilha processada com erros, verifique log na tela!', 'Erro no Processamento', mtError, [mbok], 0);

end;

procedure TfrmRateioProgMT.Progresso(vParams: array of variant);
begin
  frmProgressoDuplo.Max2 := vParams[2];
  frmProgressoDuplo.AndaFormProgressoDuplo(iPosicao1, vParams[1]);

  if (High (vParams) = 3) then
    if vParams[3] <> '' then frmProgressoDuplo.Legenda2 := vParams[3];

  if (High (vParams) = 4) then
    if vParams[4] <> '' then meErros.Lines.Add ( vParams[4] );
end;

procedure TfrmRateioProgMT.chkIgnoraSegregaExit(Sender: TObject);
begin
  inherited;
    CtrlPrePlanilhaRP.bIgnoraSegregacao := chkIgnoraSegrega.Checked; 
end;

end.
