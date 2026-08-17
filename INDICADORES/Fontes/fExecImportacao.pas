unit fExecImportacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, StdCtrls, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn,
  fcShapeBtn, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls,
  ExtCtrls, uComunsImobiliario, uVerificaPreenchimento, uCtrlImovel, DBTables, Wwquery, Db,
  DBClient, uCMClientDataSet, Provider, dBaseDados, uSistema, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, uCtrlApuracao, uCtrlIndicador, uCtrlContratoLoja,
  uMensErro;

type
  TfrmExecImportacao = class(TfrmWizardMT)
    dlgImporta: TOpenDialog;
    edtArqImporta: TEdit;
    Label8: TLabel;
    edtImovel: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtRegistros: TEdit;
    CdsImovel: TCMClientDataSet;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    CdsImovelIMOVEL_EXTENSO: TStringField;
    CdsApuracao: TCMClientDataSet;
    CdsApuracaoIDAPURACAO: TFloatField;
    CdsApuracaoIDGRPAPURACAO: TFloatField;
    CdsApuracaoIDSUBGRPAPURACAO: TFloatField;
    CdsApuracaoIDCONTRATO: TFloatField;
    CdsApuracaoIDINDICADOR: TFloatField;
    CdsApuracaoIDIMOVEL: TFloatField;
    CdsApuracaoMESCOMPETENCIA: TFloatField;
    CdsApuracaoANOCOMPETENCIA: TFloatField;
    CdsApuracaoDATAAPURACAO: TDateTimeField;
    CdsApuracaoTIPOLANCA: TStringField;
    CdsApuracaoVLRAPURACAONUM: TFloatField;
    CdsApuracaoVLRAPURACAOSTR: TStringField;
    CdsApuracaoVLRAPURACAODAT: TDateTimeField;
    CdsApuracaoDATAINCLUSAO: TDateTimeField;
    CdsApuracaoTIPOINCLUSAO: TStringField;
    CdsApuracaoTIPODADO: TStringField;
    CdsApuracaoFLGGRPAPURACAO: TStringField;
    CdsApuracaoFLGSUBGRPAPURACAO: TStringField;
    CdsApuracaoFLGCONTRATO: TStringField;
    CdsApuracaoPERIODICIDADE: TStringField;
    CdsApuracaoDSC_INDICADOR: TStringField;
    CdsApuracaoDSC_GRPAPURACAO: TStringField;
    CdsApuracaoDSC_SUBGRPAPURACAO: TStringField;
    CdsApuracaoNOME_EXTENSO: TStringField;
    CdsApuracaoDSC_CONTRATO: TStringField;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    TabSheet3: TTabSheet;
    fcLabel3: TfcLabel;
    wwDBGrid1: TwwDBGrid;
    dsApuracao: TwwDataSource;
    lstLogExcecao: TListBox;
    edtLogExcecao: TEdit;
    btnLogArq: TBitBtn;
    btnLimpaLogArq: TBitBtn;
    lstArquivoExcecao: TListBox;
    edtArquivoExcecao: TEdit;
    btnArquivoExcecao: TBitBtn;
    btnLimpaArquivoExcecao: TBitBtn;
    dlgSave: TSaveDialog;
    CdsIndicador: TCMClientDataSet;
    CdsIndicadorIDINDICADOR: TFloatField;
    CdsIndicadorDESCRICAO: TStringField;
    CdsIndicadorTIPODADO: TStringField;
    CdsIndicadorTIPOVALOR: TStringField;
    CdsIndicadorUNIDADE: TStringField;
    CdsIndicadorFLGGRPAPURACAO: TStringField;
    CdsIndicadorFLGSUBGRPAPURACAO: TStringField;
    CdsIndicadorFLGCONTRATO: TStringField;
    CdsIndicadorTIPOINDICADOR: TFloatField;
    CdsIndicadorPERIODICIDADE: TStringField;
    CdsIndicadorNIVELVERIFICA: TFloatField;
    CdsContratoLoja: TCMClientDataSet;
    wwQuery1IDCONTRATO: TFloatField;
    wwQuery1IDIMOVEL: TFloatField;
    wwQuery1NUMCONTRATO: TStringField;
    wwQuery1NOMCONTRATO: TStringField;
    wwQuery1TIPOCONTRATO: TStringField;
    wwQuery1LOJAS: TStringField;
    wwQuery1VLRALUGMIN: TFloatField;
    wwQuery1DATINICIO: TDateTimeField;
    wwQuery1DATTERMINO: TDateTimeField;
    wwQuery1PERALUGVARIAVEL: TFloatField;
    wwQuery1INDICEREAJUSTE: TFloatField;
    wwQuery1DATULTAUDITORIA: TDateTimeField;
    wwQuery1IDATIVIDADE: TFloatField;
    wwQuery1IDMARCA: TFloatField;
    wwQuery1DATREAJUSTE: TDateTimeField;
    wwQuery1DATPROXREAJUSTE: TDateTimeField;
    wwQuery1PERREAJUSTE: TFloatField;
    wwQuery1DESCRICAO: TMemoField;
    wwQuery1QTDEABL: TFloatField;
    wwQuery1FLGSTATUS: TStringField;
    wwQuery1FLGINDETERMINADO: TStringField;
    wwQuery1CONTRATO_EXTENSO: TStringField;
    CdsContratoLojaIDCONTRATO: TFloatField;
    CdsContratoLojaIDIMOVEL: TFloatField;
    CdsContratoLojaNUMCONTRATO: TStringField;
    CdsContratoLojaNOMCONTRATO: TStringField;
    CdsContratoLojaTIPOCONTRATO: TStringField;
    CdsContratoLojaLOJAS: TStringField;
    CdsContratoLojaVLRALUGMIN: TFloatField;
    CdsContratoLojaDATINICIO: TDateTimeField;
    CdsContratoLojaDATTERMINO: TDateTimeField;
    CdsContratoLojaPERALUGVARIAVEL: TFloatField;
    CdsContratoLojaINDICEREAJUSTE: TFloatField;
    CdsContratoLojaDATULTAUDITORIA: TDateTimeField;
    CdsContratoLojaIDATIVIDADE: TFloatField;
    CdsContratoLojaIDMARCA: TFloatField;
    CdsContratoLojaDATREAJUSTE: TDateTimeField;
    CdsContratoLojaDATPROXREAJUSTE: TDateTimeField;
    CdsContratoLojaPERREAJUSTE: TFloatField;
    CdsContratoLojaDESCRICAO: TMemoField;
    CdsContratoLojaQTDEABL: TFloatField;
    CdsContratoLojaFLGSTATUS: TStringField;
    CdsContratoLojaFLGINDETERMINADO: TStringField;
    CdsContratoLojaCONTRATO_EXTENSO: TStringField;
    btnBuscaArq: TBitBtn;
    btnBuscaArqx: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLogArqClick(Sender: TObject);
    procedure btnLimpaLogArqClick(Sender: TObject);
    procedure btnArquivoExcecaoClick(Sender: TObject);
    procedure btnLimpaArquivoExcecaoClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnBuscaArqClick(Sender: TObject);
  private
    { Private declarations }
    CtrlImovel : TCtrlImovel;
    CtrlApuracao : TCtrlApuracao;
    CtrlIndicador: TCtrlIndicador;
    CtrlContratoLoja: TCtrlContratoLoja;
    ArquivoImportacao: TStringList;
    procedure ProcessaArquivo;
    procedure RegistraErro(const sLinha, sVar, sTipoChecagem: string; const iLinha, iColuna:integer);

  public
    { Public declarations }
    iIdImovel: integer;
  end;

var
  frmExecImportacao: TfrmExecImportacao;

implementation

{$R *.DFM}

procedure TfrmExecImportacao.FormCreate(Sender: TObject);
begin
  inherited;
  ArquivoImportacao := TStringList.Create;
  CtrlImovel := TCtrlImovel.Create;
  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);

  CtrlApuracao := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlApuracao.InitializeAs(CtrlImovel);
  CtrlApuracao.CdsApuracao := CdsApuracao;

  CtrlIndicador := TCtrlIndicador.Create;
  CtrlIndicador.InitializeAs(CtrlImovel);

  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlContratoLoja.InitializeAs(CtrlImovel);
end;

procedure TfrmExecImportacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ArquivoImportacao);
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlApuracao);
  FreeAndNil(CtrlIndicador);
  FreeAndNil(CtrlContratoLoja);
  inherited;
end;

procedure TfrmExecImportacao.btnLogArqClick(Sender: TObject);
begin
  inherited;
  dlgSave.Execute;
  edtLogExcecao.Text := dlgSave.FileName;
end;

procedure TfrmExecImportacao.btnLimpaLogArqClick(Sender: TObject);
begin
  inherited;
  edtLogExcecao.Clear;
end;

procedure TfrmExecImportacao.btnArquivoExcecaoClick(Sender: TObject);
begin
  inherited;
  dlgSave.Execute;
  edtArquivoExcecao.Text := dlgSave.FileName;
end;

procedure TfrmExecImportacao.btnLimpaArquivoExcecaoClick(Sender: TObject);
begin
  inherited;
  edtArquivoExcecao.Clear;
end;

procedure TfrmExecImportacao.btnContinuarClick(Sender: TObject);
begin
  if PagControle.ActivePageIndex = 0 then begin
    inherited;
    ProcessaArquivo;
  end else
    inherited;
end;

procedure TfrmExecImportacao.ProcessaArquivo;
var
  i, iColuna, iOcorrencias: integer;
  sLinha, sVar : string;
  iMes, iAno, iIdIndicador, iIdContratoLoja: integer;
  dApuracao, dCheckApuracao: TDate;
  bProcessou: boolean;
  fValor, fVlrApura: extended;
begin
  lstLogExcecao.Clear;
  lstArquivoExcecao.Clear;
  CdsApuracao.Data := CtrlApuracao.SelecionaApuracao(-2);

  for i := 1 to StrToInt(edtRegistros.Text)-2 do begin
    bProcessou := true;
    sLinha := ArquivoImportacao.Strings[i];

    // checar tipo registro
    iColuna := 1;
    sVar := Trim(copy(sLinha, iColuna, 15));
    if sVar <> 'B' then begin
      RegistraErro(sLinha, sVar, ' Tipo Registro = ', i, iColuna);
      bProcessou := false;
    end;

    // checar mes
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      iMes := StrToIntDef(sVar, 0);
      if iMes = 0 then begin
        RegistraErro(sLinha, sVar, ' Mês Competência = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    // checar ano
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      iAno := StrToIntDef(sVar, 0);
      if iAno = 0 then begin
        RegistraErro(sLinha, sVar, ' Ano Competência = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    // checar dataapuracao
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      try
        dApuracao := StrToDate(sVar);
      except
        RegistraErro(sLinha, sVar, ' Ano Competência = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    // checar indicador
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      iIdIndicador := StrToIntDef(sVar, 0);
      CdsIndicador.Data := CtrlIndicador.LookupIndicador(iIdIndicador);
      if CdsIndicador.IsEmpty then begin
        RegistraErro(sLinha, sVar, ' Indicador = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    // checar contato Loja - se o indicador obrigar
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      if CdsIndicadorFLGCONTRATO.AsString = 'S' then begin
        CdsContratoLoja.Data := CtrlContratoLoja.LookupContratoLoja(-1, -1, OpCalcular, iIdImovel, sVar);
        if CdsContratoLoja.RecordCount <> 1 then begin
          RegistraErro(sLinha, sVar, ' Contrato = ', i, iColuna);
          bProcessou := false;
        end else
          iIdContratoLoja := CdsContratoLojaIDCONTRATO.AsInteger;
      end else iIdContratoLoja := -1;
    end;

    // checar valor
    if bProcessou then begin
      Inc(iColuna, 15);
      sVar := Trim(copy(sLinha, iColuna, 15));
      try
        fValor := StrToFloat (sVar);
      except
        RegistraErro(sLinha, sVar, ' Valor Lançamento = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    if bProcessou then begin

      if CdsIndicadorPERIODICIDADE.AsString = 'D' then dCheckApuracao := dApuracao
      else dCheckApuracao := -1;
      
      if CtrlApuracao.IndicadorApurado (-1, iIdImovel, iIdIndicador, -1, -1, iIdContratoLoja, iMes, iAno, 'R', dCheckApuracao, iOcorrencias, fVlrApura) then begin
        RegistraErro(sLinha, CdsContratoLojaNUMCONTRATO.AsString, ' Indicador Processamento Anterior = ', i, iColuna);
        bProcessou := false;
      end;
    end;

    // linha processada com sucesso
    if bProcessou then begin
      CdsApuracao.Insert;
      CdsApuracaoIDIMOVEL.AsInteger := iIdImovel;
      CdsApuracaoIDINDICADOR.AsInteger := iIdIndicador;
      CdsApuracaoDATAINCLUSAO.AsDateTime := date;
      CdsApuracaoTIPOINCLUSAO.AsString := 'I';
      CdsApuracaoMESCOMPETENCIA.AsInteger := iMes;
      CdsApuracaoANOCOMPETENCIA.AsInteger := iAno;
      if iIdContratoLoja <> -1 then CdsApuracaoIDCONTRATO.AsInteger := iIdContratoLoja;
      CdsApuracaoTIPOLANCA.AsString := 'R';
      CdsApuracaoDATAAPURACAO.AsDateTime := dApuracao;
      CdsApuracaoVLRAPURACAONUM.AsFloat := fValor;

      // campos tipo lookup
      CdsApuracaoDSC_CONTRATO.AsString := CdsContratoLojaCONTRATO_EXTENSO.AsString;
      CdsApuracaoDSC_INDICADOR.AsString := CdsIndicadorDESCRICAO.AsString;

      CdsApuracao.Post;
    end;
    refresh;

  end;
end;

procedure TfrmExecImportacao.RegistraErro(const sLinha, sVar, sTipoChecagem: string; const iLinha, iColuna:integer);
begin
  lstLogExcecao.Items.Add(sLinha);
  lstLogExcecao.Items.Add('Erro Linha: ' + IntToStr(iLinha + 1) + ' Coluna: '+IntToStr(iColuna) + sTipoChecagem + sVar);
  lstLogExcecao.Items.Add('--------------------------------------------------------------');
  lstArquivoExcecao.Items.Add(sLinha);
end;

procedure TfrmExecImportacao.btnConfirmarClick(Sender: TObject);
var
  TextLog, TextArquivo: TextFile;
begin
  inherited;
  if edtLogExcecao.Text = '' then
    if MsgDlg ('Você tem certeza que não deseja gravar o log de exceção?', 'Atenção', mtWarning, [mbyes, mbno], 0) = mrno then
      exit;

  if edtArquivoExcecao.Text = '' then
    if MsgDlg ('Você tem certeza que não deseja o arquivo de exceção?', 'Atenção', mtWarning, [mbyes, mbno], 0) = mrno then
      exit;

  if edtLogExcecao.Text <> '' then
    lstLogExcecao.Items.SaveToFile(edtLogExcecao.Text);

  if edtArquivoExcecao.Text <> '' then
    lstArquivoExcecao.Items.SaveToFile(edtArquivoExcecao.Text);

  if CtrlApuracao.GravaApuracao then
    MsgDlg ('Importação efetuada com sucesso!', 'Informação', mtInformation, [mbok], 0);

  PagControle.ActivePageIndex := 0;
  PagControle.OnChange(self);

end;

procedure TfrmExecImportacao.btnBuscaArqClick(Sender: TObject);
var
  sLinha: string;
  iRegistros: integer;

begin
  inherited;
   // se for preenchido um arquivo, limpa a seleção de Imóvel e grupo
  dlgImporta.Execute;
  edtArqImporta.Text := dlgImporta.FileName;
  try
    if edtArqImporta.Text <> '' then begin
      ArquivoImportacao.LoadFromFile(edtArqImporta.Text);

      // verifica header
      sLinha := ArquivoImportacao.Strings[0];
      if sLinha[1] <> 'A' then
        raise Exception.Create( 'Arquivo com problema - header!' );
      iIdImovel := StrToIntDef (Trim(copy(sLinha,16,15)),0);
      CdsImovel.Data := CtrlImovel.LookupImovel(iIdImovel);
      if CdsImovel.IsEmpty then
        raise Exception.Create( 'Shopping Inválido - header!' );
      edtImovel.Text := CdsImovelIMOVEL_EXTENSO.Text;

      // verifica final
      sLinha := ArquivoImportacao[ArquivoImportacao.Count - 1];
      if sLinha[1] <> 'C' then Exception.Create( 'Arquivo com problema - final!' );
      iRegistros := StrToIntDef (Trim(copy(sLinha,16,15)),0);
      if (iRegistros <= 0) or (iRegistros <> ArquivoImportacao.Count - 2) then
        raise Exception.Create( 'Total de Lançamentos inválido - final!' );
      edtRegistros.Text := FloatToStr(iRegistros);

    end;

  except
    on E : Exception do begin
      ComunsImobiliario.MensErroMT(E.Message);
      edtArqImporta.Clear;
      edtImovel.Clear;
      edtRegistros.Clear;
    end;
  end;
end;

end.
