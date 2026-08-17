// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// *****************************************************************************
// Autor(a)    :  Luis Ferrari
// Data        :  23/03/2023
// Pendência   : SIG 130171
// Descricao   :  Retirado a obrigatoriedade de todos os campos da tela.
//------------------------------------------------------------------------------
unit FWizImportaCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdblook, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  Wwdbspin, uCtrlCotacaoMoeda, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, uctrlPadroes, MontaSelect, uMenserro, usistema, FProgresso,
  wwriched, Menus;

type
  TfrmWizImportaCotacao = class(TfrmWizardMT)
    Label1: TLabel;
    Panel1: TPanel;
    dbgCotacao: TwwDBGrid;
    LblMoedaNome: TLabel;
    LblMoedaSigla: TLabel;
    OpenDialog1: TOpenDialog;
    bitBtnAbrir: TBitBtn;
    edtCaminho: TEdit;
    lblCaminho: TLabel;
    cdsCotacao: TCMClientDataSet;
    sqlCotacao: TCMSqlParams;
    dsCotacao: TwwDataSource;
    Panel2: TPanel;
    dbedColMesRef: TwwDBEdit;
    Label5: TLabel;
    dbedColDataFim: TwwDBEdit;
    Label3: TLabel;
    dbSpinLinIni: TwwDBSpinEdit;
    Label7: TLabel;
    dbedColValor: TwwDBEdit;
    Label4: TLabel;
    dbedColDataIni: TwwDBEdit;
    Label2: TLabel;
    edtMoeda: TEdit;
    Label6: TLabel;
    edtSigla: TEdit;
    BbtnProcura: TBitBtn;
    msMoeda: TMontaSelect;
    edtMoeda2: TEdit;
    edtSigla2: TEdit;
    Panel3: TPanel;
    meErros: TwwDBRichEdit;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    chkboxSobrescreve: TCheckBox;
    Label8: TLabel;
    dbedPrazo: TwwDBEdit;
    cdsCotacaoMOECODIGO: TFloatField;
    cdsCotacaoCOTDATA: TDateTimeField;
    cdsCotacaoIDUSUARIOINCLUSAO: TFloatField;
    cdsCotacaoINDICEBASE: TFloatField;
    cdsCotacaoCOTVALOR: TFloatField;
    cdsCotacaoCOTMESREF: TStringField;
    cdsCotacaoTRGDTINCLUSAO: TDateTimeField;
    cdsCotacaoTRGUSERINCLUSAO: TStringField;
    cdsCotacaoCOTDATAFIM: TDateTimeField;
    cdsCotacaoNUMDIASPRAZO: TFloatField;
    cdsCotacaoIDCOTACAOMOEDA: TFloatField;
    cdsCotacaoOBSERVACAO: TMemoField;
    procedure bitBtnAbrirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure BbtnProcuraClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgCotacaoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgCotacaoTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    iOrdem, iMoecodigo: integer;
  public
    { Public declarations }
    procedure Progresso(vParam: array of Variant);
  end;

var
  frmWizImportaCotacao: TfrmWizImportaCotacao;
  CtrlCotacaoMoeda : TCtrlCotacaoMoeda;

implementation

{$R *.DFM}

procedure TfrmWizImportaCotacao.bitBtnAbrirClick(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    edtCaminho.text := OpenDialog1.FileName;
  end;
  edtCaminho.Repaint;
end;

procedure TfrmWizImportaCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCotacaoMoeda := TCtrlCotacaoMoeda.Create;
  CtrlCotacaoMoeda.InitializeAs(Padroes);
  CtrlCotacaoMoeda.Progresso := Progresso;
  imoecodigo := -1;
  iordem := 0;

  edtCaminho.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmWizImportaCotacao.FormDestroy(Sender: TObject);
begin
  CtrlCotacaoMoeda.Free;
  inherited;
end;

procedure TfrmWizImportaCotacao.btnContinuarClick(Sender: TObject);
begin
  //if (trim(edtCaminho.text) = 'C:\') or (trim(edtCaminho.text) = '') then
  if (trim(edtCaminho.text) = Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)) or (trim(edtCaminho.text) = '') then
  begin
    MsgDlg('O caminho da planilha que contem os dados de cotação deve ser informado.', 'GlobalCM', mtError, [mbOk], 0);
    edtCaminho.setFocus;
    exit;
  end;
// Inicio SIG 130171 Ferrari
{
  if trim(edtMoeda.text) = '' then
  begin
    MsgDlg('A moeda para qual será imortada as cotações deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    BbtnProcura.setFocus;
    exit;
  end;

  if trim(dbedColDataIni.text) = '' then
  begin
    MsgDlg('A coluna da planilha onde se localiza o campo "Data Inicial" deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColDataIni.setFocus;
    exit;
  end;

  if trim(dbedColDataFim.text) = '' then
  begin
    MsgDlg('A coluna da planilha onde se localiza o campo "Data Fim" deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColDataFim.setFocus;
    exit;
  end;

  if trim(dbedColValor.text) = '' then
  begin
    MsgDlg('A coluna da planilha onde se localiza o campo "Valor" deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColValor.setFocus;
    exit;
  end;

  if trim(dbedColMesRef.text) = '' then
  begin
    MsgDlg('A coluna da planilha onde se localiza o campo "Mês de Referência" deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColMesRef.setFocus;
    exit;
  end;

  if (trim(dbSpinLinIni.text) = '') or (dbSpinLinIni.Value < 1) then
  begin
    MsgDlg('A linha da planilha onde começam os dados deve ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColMesRef.setFocus;
    exit;
  end;

  if (trim(dbedPrazo.text) = '') then
  begin
    MsgDlg('A coluna da planilha onde se localiza o campo "Prazo ser informada.', 'GlobalCM', mtError, [mbOk], 0);
    dbedColMesRef.setFocus;
    exit;
  end;
}
// Fim SIG 130171
  cdsCotacao.Close;
  inherited;

  btnConfirmar.enabled := false;
  edtSigla2.text := edtSigla.Text;
  edtMoeda2.text := edtMoeda.Text;

  cdsCotacao.data := CtrlCotacaoMoeda.ImportaPlanilha(edtCaminho.text, trunc(dbSpinLinIni.value), dbedColDataIni.text,
                                                      dbedColDataFim.Text, dbedColValor.text,
                                                      dbedColMesRef.Text, dbedPrazo.Text,
                                                      iMoecodigo, sistema.idusuario);
  if not cdsCotacao.isEmpty then
    btnConfirmar.enabled := true;

end;

procedure TfrmWizImportaCotacao.BbtnProcuraClick(Sender: TObject);
begin
  inherited;
  imoecodigo := -1;
  msMoeda.Executar;
  if msMoeda.RetornouValor then
  begin
    iMoecodigo    := strToIntDef(msMoeda.ValoresChave[0], -1);
    edtSigla.Text := msMoeda.ValoresChave[1];
    edtMoeda.Text := msMoeda.ValoresChave[2];
  end;
end;


procedure TfrmWizImportaCotacao.Progresso(vParam: array of Variant);
begin
//  Legenda do FormProgresso
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado

  // Desabilita todos os formulários com exceção de FrmProgress

   if CtrlCotacaoMoeda.bCancelaImport then
   begin
     meErros.Text := 'Processo cancelado pelo usuário.';
     cdsCotacao.Close;
     btnConfirmar.Enabled := false;
   end;

   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         meErros.Text := '';
         frmprogresso.lblProgress.Caption := vParam[0];
         frmprogresso.MostraFormprogresso(vParam[0], true, true true, vParam[2], vParam[3]);
         frmprogresso.lblProgress.Repaint;
         application.ProcessMessages;
      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmprogresso.Max  := vParam[3];
         frmprogresso.lblProgress.Caption := vParam[0];
         frmprogresso.AndaFormprogresso(vParam[4], vParam[3]);
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmprogresso.EscondeFormprogresso;
      end;
   end;

   CtrlCotacaoMoeda.bCancelaImport := frmprogresso.Cancelou;
   if Trim(vParam[6]) <> '' then
      meErros.Text := meErros.Text + vParam[6];
end;


procedure TfrmWizImportaCotacao.Salvar1Click(Sender: TObject);
begin
  inherited;
  meErros.PlainText := true;
  saveDialog1.Execute;
  if trim(saveDialog1.FileName) <> '' then
    meErros.Lines.saveToFile(saveDialog1.FileName);
end;

procedure TfrmWizImportaCotacao.Imprimir1Click(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;

procedure TfrmWizImportaCotacao.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if CtrlCotacaoMoeda.GravaImportacao(chkboxSobrescreve.Checked, cdsCotacao.data) then
  begin
    btnConfirmar.enabled := false;
    MsgDlg('A Importação foi gravada com sucesso.', 'GlobalCM', mtInformation, [mbOk], 0);
    meErros.Lines.Add('A Importação foi gravada com sucesso.');
  end;
  meErros.Lines.Add(CtrlCotacaoMoeda.MessageInfo);
end;

procedure TfrmWizImportaCotacao.dbgCotacaoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (cdsCotacao.Active) then
  begin
    dbgCotacao.Canvas.Font.Color := clBlack;
    if ( cdsCotacao.RecNo mod 2 ) = 0 then
      dbgCotacao.Canvas.Brush.Color := $EEEEEE
    else
      dbgCotacao.Canvas.Brush.Color := clWhite;

    dbgCotacao.DefaultDrawDataCell( Rect, Field, State );
  end;
end;



procedure TfrmWizImportaCotacao.dbgCotacaoTitleButtonClick(Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin
  inherited;
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsCotacao.IndexName := '';
  cdsCotacao.IndexDefs.Clear;
  IndexDef := cdsCotacao.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsCotacao.IndexName := IndexDef.Name;
  cdsCotacao.First;

end;

end.
