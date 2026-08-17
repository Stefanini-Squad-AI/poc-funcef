// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :  DeletaArquivosSelecionados, spbtnProcurarArqClick, ApagarClick,
//                lbListaArquivosDblClick, lbListaArquivosKeyUp
// Autor(a)    :  Marilza Colpani 
// Data        :  27/08/2009
// Pendência   :  SOL 58117 KINTANA 524418
// Descricao   :  Permitir a seleção de mais de um arquivo para importação
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .

//------------------------------------------------------------------------------
unit fImportaTxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, Spin,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  ComCtrls, Db, DBTables, Mask, fSairAjuda, DBClient, wwdblook, uCMClientDataSet,
  uCtrlImportaTxt, uCtrlGlobalRH, uCtrlLayoutDesconto, Menus;

type
  TfrmImportaTxt = class(TfrmSairAjuda)
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
    spbtnProcurarArq: TSpeedButton;
    grpMesRef: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dblckLayout: TwwDBLookupCombo;
    rgTipoImportacao: TRadioGroup;
    rgOcorrencias: TRadioGroup;
    rgPermanente: TRadioGroup;
    rgIgnoraValZero: TRadioGroup;
    gbxParcelas: TGroupBox;
    speParcelas: TSpinEdit;
    pgbarProgresso: TProgressBar;
    cmbSinal: TComboBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    CdsLayout: TCMClientDataSet;
    lbListaArquivos: TListBox;
    ppApagar: TPopupMenu;
    Apagar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlPaginasChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure dblckLayoutChange(Sender: TObject);
    procedure spbtnProcurarArqClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure rgPermanenteClick(Sender: TObject);
    procedure rbtnImportarArqClick(Sender: TObject);
    procedure rgTipoImportacaoClick(Sender: TObject);
    procedure ApagarClick(Sender: TObject);
    procedure lbListaArquivosDblClick(Sender: TObject);
    //procedure lbListaArquivosKeyDown(Sender: TObject; var Key: Word;
      //Shift: TShiftState);
    procedure lbListaArquivosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    //procedure lbListaArquivosKeyPress(Sender: TObject; var Key: Char);
  private
    CtrlImportaTxt: TCtrlImportaTxt;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlLayoutDesconto: TCtrlLayoutDesconto;

    procedure HabilitaBtOk;
    procedure Progresso(Args: array of variant);
    procedure DeletaArquivosSelecionados;
  end;

var
  frmImportaTxt: TfrmImportaTxt;

implementation

uses FileCtrl, uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes;

{$R *.DFM}

procedure TfrmImportaTxt.FormCreate(Sender: TObject);
var
  NormalIni: TDateTime;
begin
  inherited;
  CtrlLayoutDesconto := TCtrlLayoutDesconto.Create;
  CtrlLayoutDesconto.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlImportaTxt := TCtrlImportaTxt.Create;
  CtrlImportaTxt.InitializeAs(Padroes);
  CtrlImportaTxt.Progresso := Progresso;

  CdsLayout.Data := CtrlLayoutDesconto.ListLayoutDescontoXColunas;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  spnedAno.Value := FU.ExtraiAno(NormalIni);

  memResult.Lines.Clear;
  pnlHorario.Caption := '';
  pgctrlPaginas.ActivePageIndex := 0;

  OpenDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  //lblArquivo.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmImportaTxt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlImportaTxt);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlLayoutDesconto);
  inherited;
end;

procedure TfrmImportaTxt.spnedAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmImportaTxt.pgctrlPaginasChange(Sender: TObject);
begin
  rbtnImportarArq.Enabled := (pgctrlPaginas.ActivePageIndex = 0);
end;

procedure TfrmImportaTxt.dblckLayoutChange(Sender: TObject);
begin
  rgPermanente.Visible := (CdsLayout.FieldByName('ColParcelas').asInteger = 0);
  gbxParcelas.Visible := (CdsLayout.FieldByName('ColParcelas').asInteger = 0) and
    (rgPermanente.ItemIndex = 1);
  rgOcorrencias.Visible := (CdsLayout.FieldByName('ColOcorrencias').asInteger > 0);

  HabilitaBtOk;
end;

procedure TfrmImportaTxt.rgTipoImportacaoClick(Sender: TObject);
begin
  cmbSinal.Enabled := (rgTipoImportacao.ItemIndex > 0);
  if (rgTipoImportacao.ItemIndex = 0) then
  begin
    cmbSinal.Text := ' = ';
    cmbSinal.ItemIndex := 0;
  end;
end;

procedure TfrmImportaTxt.spbtnProcurarArqClick(Sender: TObject);
var
  i:Integer;
begin
  //OpenDlg.InitialDir := 'C:\';
  OpenDlg.InitialDir := (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  if (OpenDlg.Execute) then
  begin
      //Marilza Colpani SOL 58117/KINTANA 524418
      for i:=0 to OpenDlg.Files.Count-1 do
        begin
          if lbListaArquivos.Items.IndexOf(OpenDlg.Files.Strings[i]) >= 0 then
            ShowMessage('Registro Duplicado !')
          else
            lbListaArquivos.Items.Add(OpenDlg.Files.Strings[i]);


        end;
    HabilitaBtOk;
  end;
end;

procedure TfrmImportaTxt.bbtnSalvarClick(Sender: TObject);
begin
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmImportaTxt.rgPermanenteClick(Sender: TObject);
begin
  gbxParcelas.Visible := (rgPermanente.ItemIndex = 1);
end;

procedure TfrmImportaTxt.rbtnImportarArqClick(Sender: TObject);
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

    CtrlImportaTxt.CreateThreadProgresso;
    if (CtrlImportaTxt.Processar(
        lstArquivo.Text,
        Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
        Sistema.IdEmpresa,
        CdsLayout.FieldByName('IdRubrica').asFloat,
        CdsLayout.FieldByName('ColCodigo').asInteger,
        CdsLayout.FieldByName('TamCodigo').asInteger,
        CdsLayout.FieldByName('ColCodFavorecido').asInteger,
        CdsLayout.FieldByName('TamCodFavorecido').asInteger,
        CdsLayout.FieldByName('ColValor').asInteger,
        CdsLayout.FieldByName('TamValor').asInteger,
        FU.IFF(CdsLayout.FieldByName('NumDecimais').IsNull, 0,
            CdsLayout.FieldByName('NumDecimais').asInteger),
        CdsLayout.FieldByName('ColOcorrencias').asString,
        CdsLayout.FieldByName('TamOcorrencias').asString,
        CdsLayout.FieldByName('ColParcelas').asString,
        CdsLayout.FieldByName('TamParcelas').asString,
        CdsLayout.FieldByName('ColCodigoDep').asInteger,
        CdsLayout.FieldByName('CaracDecimal').asString,
        (rgIgnoraValZero.ItemIndex = 0),
        rgOcorrencias.ItemIndex,
        rgTipoImportacao.ItemIndex,
        speParcelas.Value,
        rgPermanente.ItemIndex,
        rgOcorrencias.Visible)) then
    begin
      CtrlImportaTxt.FreeThreadProgresso;
      MsgDlg(CtrlImportaTxt.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
    end
    else
    begin
      CtrlImportaTxt.FreeThreadProgresso;
      MsgDlg(CtrlImportaTxt.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
    end;

    pgctrlPaginas.ActivePageIndex := 1;
    rbtnImportarArq.Enabled := false;

    frmImportaTxt.Enabled := true;
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

procedure TfrmImportaTxt.HabilitaBtOk;
begin
  rbtnImportarArq.Enabled := (dblckLayout.Text <> '') and (Trim(spnedAno.Text) <> '') and
    (ExtractFileName(OpenDlg.FileName) <> '');
end;

procedure TfrmImportaTxt.Progresso(Args: array of variant);
begin
  if (Args[0] <> '') then
    memResult.Lines.Add(Args[0]);

  if (Args[1] <> '') then
    pnlHorario.Caption := Args[1]
  else
    pgbarProgresso.StepIt;

  Self.Repaint;
end;

//Marilza Colpani SOL 58117/KINTANA 524418
procedure TfrmImportaTxt.ApagarClick(Sender: TObject);
begin
  DeletaArquivosSelecionados;
end;

//Marilza Colpani SOL 58117/KINTANA 524418
procedure TfrmImportaTxt.lbListaArquivosDblClick(Sender: TObject);
begin
  DeletaArquivosSelecionados;
end;

//Marilza Colpani SOL 58117/KINTANA 524418
procedure TfrmImportaTxt.lbListaArquivosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    DeletaArquivosSelecionados;
end;

procedure TfrmImportaTxt.DeletaArquivosSelecionados;
var
  i: Integer;
  Msg: Boolean;
begin
  if (MsgDlg('Confirma a exclusão do arquivo?','Aviso', mtConfirmation,[mbOK,mbCancel],0) = mrOk) then
  begin
    for i:= lbListaArquivos.Items.Count -1 downto 0 do
      if lbListaArquivos.Selected[i] then
        lbListaArquivos.Items.Delete(i);
  end
  else
    exit;
end;

end.
