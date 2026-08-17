{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     IMPORTAÇÃO DE APURAÇÃO DE INDICADORES VIA PLANILHA (EXCEL)

     Módulo          :  Indicadores
     Autor           :  Marcio Motta
     Data de Início  :  24/03/2004
     Data de Término :  31/03/2004

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecImportPlanilha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlImovel,
  uCtrlApuracao, uCtrlIndicador, uCtrlContratoLoja, uCtrlLayOutImp, Excel_OLE,
  MontaSelect, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, fProgresso, uCtrlGrpApuracao,
  uCtrlIndSinonimo, wwdbdatetimepicker, CMDateTimePicker, mImovel, Menus, wwriched,
  DBGrids, ppDB, ppBands, ppCache, ppClass, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppReport, ppPrnabl, ppCtrls, ppModule, raCodMod, ppVar,
  mImovelouMestre;

type
  TfrmExecImportPlanilha = class(TfrmWizardMT)
    CMSql: TCMSqlParams;
    cdsIndApuracao: TCMClientDataSet;
    DlgAbrir: TOpenDialog;
    DlgSalvar: TSaveDialog;
    DsIndApuracao: TwwDataSource;
    Label8: TLabel;
    edtArqImporta: TEdit;
    btnBuscaArq: TBitBtn;
    cdsLayOut: TCMClientDataSet;
    cdsLayOutDESCRICAO: TStringField;
    cdsLayOutPOSINDICADOR: TFloatField;
    cdsLayOutPOSVALOR: TFloatField;
    MontaSelect: TMontaSelect;
    dsLayOut: TDataSource;
    GroupBox3: TGroupBox;
    btnBuscaLayOut: TBitBtn;
    Label1: TLabel;
    cdsIndicadores: TCMClientDataSet;
    cdsIndicadoresIDINDICADOR: TFloatField;
    cdsIndicadoresDESCRICAO: TStringField;
    cdsIndicadoresTIPODADO: TStringField;
    cdsIndicadoresTIPOVALOR: TStringField;
    cdsIndicadoresUNIDADE: TStringField;
    cdsIndicadoresFLGGRPAPURACAO: TStringField;
    cdsIndicadoresFLGSUBGRPAPURACAO: TStringField;
    cdsIndicadoresFLGCONTRATO: TStringField;
    cdsIndicadoresTIPOINDICADOR: TFloatField;
    cdsIndicadoresPERIODICIDADE: TStringField;
    cdsIndicadoresNIVELVERIFICA: TFloatField;
    cdsIndicadoresIDREGRA: TFloatField;
    cdsIndicadoresQRYREGRA: TFloatField;
    cdsIndicadoresIDGRPPADRAO: TFloatField;
    cdsIndicadoresIDSUBGRPPADRAO: TFloatField;
    cdsGrupoApuracao: TCMClientDataSet;
    cdsGrupoApuracaoIDGRPAPURACAO: TFloatField;
    cdsGrupoApuracaoDESCRICAO: TStringField;
    cdsGrupoApuracaoTIPOGRUPO: TStringField;
    dbeDescLayOut: TDBEdit;
    Label12: TLabel;
    cmdtApura: TCMDateTimePicker;
    rdbTipoLanca: TRadioGroup;
    ckbValorZero: TCheckBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel4: TPanel;
    Label10: TLabel;
    lblData: TLabel;
    Label9: TLabel;
    lblEstabelecimento: TLabel;
    Label11: TLabel;
    lblRegistros: TLabel;
    PopupMenu1: TPopupMenu;
    mnuImprimir: TMenuItem;
    mnuSalvar: TMenuItem;
    memLogExcecao: TwwDBRichEdit;
    Label2: TLabel;
    EdtLote: TEdit;
    cdsLayOutIDLAYOUTIMP: TFloatField;
    cdsLayOutFLGPOSICAO: TStringField;
    cdsLayOutFLGTIPOINDICADOR: TStringField;
    cdsLayOutPOSCONTRATO: TFloatField;
    cdsDetLayOut: TCMClientDataSet;
    cdsDetLayOutIDLAYOUTIMP: TFloatField;
    cdsDetLayOutIDINDICADOR: TFloatField;
    cdsDetLayOutPOSINDICADOR: TFloatField;
    cdsContratoLoja: TCMClientDataSet;
    cdsContratoLojaIDCONTRATO: TFloatField;
    cdsContratoLojaIDMARCA: TFloatField;
    cdsContratoLojaIDATIVIDADE: TFloatField;
    cdsContratoLojaINDICEREAJUSTE: TFloatField;
    cdsContratoLojaIDIMOVEL: TFloatField;
    cdsContratoLojaNUMCONTRATO: TStringField;
    cdsContratoLojaNOMCONTRATO: TStringField;
    cdsContratoLojaTIPOCONTRATO: TStringField;
    cdsContratoLojaLOJAS: TStringField;
    cdsContratoLojaVLRALUGMIN: TFloatField;
    cdsContratoLojaDATINICIO: TDateTimeField;
    cdsContratoLojaDATTERMINO: TDateTimeField;
    cdsContratoLojaPERALUGVARIAVEL: TFloatField;
    cdsContratoLojaDATULTAUDITORIA: TDateTimeField;
    cdsContratoLojaDATREAJUSTE: TDateTimeField;
    cdsContratoLojaDATPROXREAJUSTE: TDateTimeField;
    cdsContratoLojaPERREAJUSTE: TFloatField;
    cdsContratoLojaDESCRICAO: TMemoField;
    cdsContratoLojaQTDEABL: TFloatField;
    cdsContratoLojaFLGINDETERMINADO: TStringField;
    cdsContratoLojaFLGSTATUS: TStringField;
    cdsContratoLojaIDSITCONTIMOB: TFloatField;
    cdsContratoLojaIDPRESTADOR: TFloatField;
    cdsIndApuracaoIDAPURACAO: TFloatField;
    cdsIndApuracaoIDGRPAPURACAO: TFloatField;
    cdsIndApuracaoIDSUBGRPAPURACAO: TFloatField;
    cdsIndApuracaoIDCONTRATO: TFloatField;
    cdsIndApuracaoIDINDICADOR: TFloatField;
    cdsIndApuracaoIDIMOVEL: TFloatField;
    cdsIndApuracaoMESCOMPETENCIA: TFloatField;
    cdsIndApuracaoANOCOMPETENCIA: TFloatField;
    cdsIndApuracaoDATAAPURACAO: TDateTimeField;
    cdsIndApuracaoTIPOLANCA: TStringField;
    cdsIndApuracaoVLRAPURACAONUM: TFloatField;
    cdsIndApuracaoVLRAPURACAOSTR: TStringField;
    cdsIndApuracaoVLRAPURACAODAT: TDateTimeField;
    cdsIndApuracaoDATAINCLUSAO: TDateTimeField;
    cdsIndApuracaoTIPOINCLUSAO: TStringField;
    cdsIndApuracaoTIPODADO: TStringField;
    cdsIndApuracaoFLGGRPAPURACAO: TStringField;
    cdsIndApuracaoFLGSUBGRPAPURACAO: TStringField;
    cdsIndApuracaoFLGCONTRATO: TStringField;
    cdsIndApuracaoPERIODICIDADE: TStringField;
    cdsIndApuracaoFLGCONCILIADO: TStringField;
    cdsIndApuracaoIDGRPPADRAO: TFloatField;
    cdsIndApuracaoIDSUBGRPPADRAO: TFloatField;
    cdsIndApuracaoOBSERVACAO: TStringField;
    cdsIndApuracaoDSC_GRPPADRAO: TStringField;
    cdsIndApuracaoDSC_SUBGRPPADRAO: TStringField;
    cdsIndApuracaoDSC_INDICADOR: TStringField;
    cdsIndApuracaoDSC_GRPAPURACAO: TStringField;
    cdsIndApuracaoDSC_SUBGRPAPURACAO: TStringField;
    cdsIndApuracaoNOME_EXTENSO: TStringField;
    cdsIndApuracaoDSC_CONTRATO: TStringField;
    rptImportacao: TppReport;
    pplImportacao: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    N1: TMenuItem;
    ImprimirImportao1: TMenuItem;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText12: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    molImovelouMestre1: TmolImovelouMestre;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnBuscaArqClick(Sender: TObject);
    procedure btnBuscaLayOutClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ImprimirImportao1Click(Sender: TObject);
    procedure rptImportacaoBeforePrint(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);

  private
    vExcel : TExcel;
    iColIndicador, iColValor : integer;
    ArquivoAberto : boolean;

    CtrlImovel       : TCtrlImovel;
    CtrlApuracao     : TCtrlApuracao;
    CtrlIndicador    : TCtrlIndicador;
    CtrlContratoLoja : TCtrlContratoLoja;
    CtrlLayOutImp    : TCtrlLayOutImp;
    CtrlGrpApuracao  : TCtrlGrpApuracao;
    CtrlIndSinonimo  : TCtrlIndSinonimo;

    function VerificaPreenchimento : boolean;
    procedure ProcessaArquivoLinha;
    procedure ProcessaArquivoColuna;

  public
    { Public declarations }
  end;

var
  frmExecImportPlanilha: TfrmExecImportPlanilha;

implementation

uses dBaseDados, uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro;

{$R *.DFM}

procedure TfrmExecImportPlanilha.FormCreate(Sender: TObject);
begin
  inherited;
  ArquivoAberto := False;
  cdsIndApuracaoVLRAPURACAONUM.DisplayFormat := ',0.00';

  // Cria o Objeto EXCEL "Invisível"
  vExcel := TExcel.Create;

  // Cria os CtrlObjects
  CtrlImovel       := TCtrlImovel.Create;
  CtrlApuracao     := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlIndicador    := TCtrlIndicador.Create;
  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlLayOutImp    := TCtrlLayOutImp.Create;
  CtrlGrpApuracao  := TCtrlGrpApuracao.Create;
  CtrlIndSinonimo  := TCtrlIndSinonimo.Create;

  // Inicializa os CtrlObjetcs
  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);
  CtrlApuracao.InitializeAs(CtrlImovel);
  CtrlIndicador.InitializeAs(CtrlImovel);
  CtrlContratoLoja.InitializeAs(CtrlImovel);
  CtrlLayOutImp.InitializeAs(CtrlImovel);
  CtrlGrpApuracao.InitializeAs(CtrlImovel);
  CtrlIndSinonimo.InitializeAs(CtrlImovel);

  // Associa o CDS do CtrlObject com o CDS do Form
  CtrlApuracao.CdsApuracao := cdsIndApuracao;
end;

procedure TfrmExecImportPlanilha.FormDestroy(Sender: TObject);
begin
  // Destrói os CtrlObjects
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlApuracao);
  FreeAndNil(CtrlIndicador);
  FreeAndNil(CtrlContratoLoja);
  FreeAndNil(CtrlLayOutImp);
  FreeAndNil(CtrlGrpApuracao);

  // Destrói o objeto Excel
  vExcel.Destroy;
  inherited;
end;

procedure TfrmExecImportPlanilha.btnContinuarClick(Sender: TObject);
begin
  if VerificaPreenchimento then begin
    inherited;
    // Abre a planilha Excel - "Invisível"
    if not ArquivoAberto then begin
      vExcel.AbrirArquivo(edtArqImporta.Text);
      ArquivoAberto := True;
    end;
    if cdsLayOutFLGPOSICAO.AsString = 'L' then
      ProcessaArquivoLinha
    else
      ProcessaArquivoColuna;
  end;
end;

function TfrmExecImportPlanilha.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    if edtArqImporta.Text = '' then
      raise EValidacao.CreateVal('Informe o nome da Planilha.',edtArqImporta);

    if dbeDescLayOut.Text = '' then
      raise EValidacao.CreateVal('Informe o Layout para Importação.',dbeDescLayOut);

    if molImovelouMestre1.edtImovel.Text = '' then
      raise EValidacao.CreateVal('Informe o Imóvel para Importação.',molImovelouMestre1.edtImovel);

    if cmdtApura.Text = '' then
      raise EValidacao.CreateVal('Informe a Data da Apuração.',cmdtApura);

    if edtLote.Text = '' then
      raise EValidacao.CreateVal('Informe uma descrição para o Lote.',cmdtApura);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExecImportPlanilha.btnBuscaArqClick(Sender: TObject);
begin
  inherited;
  if DlgAbrir.Execute then begin
    edtArqImporta.Text := dlgAbrir.FileName;
  end;
end;

procedure TfrmExecImportPlanilha.btnBuscaLayOutClick(Sender: TObject);
begin
  inherited;
  cdsLayOut.EnableControls;
  MontaSelect.Executar;

  if MontaSelect.RetornouValor then begin
    cdsLayOut.Data := CtrlLayOutImp.LookUpLayOutImp(StrToInt(MontaSelect.ValoresChave[0]));
    cdsLayOut.DisableControls;
    if cdsLayOutFLGPOSICAO.AsString = 'L' then begin
      iColIndicador := StrToInt(MontaSelect.ValoresChave[2]);
      iColValor     := StrToInt(MontaSelect.ValoresChave[3]);
      cdsDetLayOut.Data := CtrlLayOutImp.LookupDetLayOutImp(-2);
    end else begin
      cdsDetLayOut.Data := CtrlLayOutImp.LookupDetLayOutImp(StrToInt(MontaSelect.ValoresChave[0]));
      iColIndicador := cdsDetLayOutPOSINDICADOR.AsInteger;
    end;
  end;
end;

procedure TfrmExecImportPlanilha.ProcessaArquivoLinha;
var
  iMaxCol, iMaxLin, i, y, z, iQtdRegistros, iIdIndicador, iIdGrpApuracao : integer;
  sGrupo, sExcecao, sDescIndicador, sValor, sObservacao : string;
  dDataApuracao, dDataInclusao : TDateTime;
  iDia, iMes, iAno : Word;
  fValor : Double;
  CelPreenchida, OperAbortada : Boolean;
  cdsTemp : TCMClientDataSet;
begin
  try
    OperAbortada := False;
    CelPreenchida := True;

    btnConfirmar.Enabled := False;

    cdsIndApuracao.Data := CtrlApuracao.SelecionaApuracao(-2);
    memLogExcecao.Clear;

    // Inicia um CDS temporário para procurar Sinônimos do Indicador
    cdsTemp := TCMClientDataSet.Create(Self);

    // Configura e exibe o form de progresso
    iMaxLin := vExcel.UltimaLinha;
    iMaxCol := vExcel.UltimaColuna;
    frmProgresso.MostraFormProgresso('Importando dados da Planilha',True,True,True,1,(iMaxLin));

    // Busca e mostra o nome do estabelecimento na tela
    lblEstabelecimento.Caption := molImovelouMestre1.edtImovel.Text;
    lblEstabelecimento.Visible := True;

    // Busca e decodifica a data da apuração
    dDataApuracao := cmdtApura.DateTime;
    DecodeDate(dDataApuracao,iAno,iMes,iDia);
    lblData.Caption := cmdtApura.Text;
    lblData.Visible := True;

    // Busca a data de inclusão(data do sistema)
    dDataInclusao := Date;

    // Inicializa a variável da quantidade de registros e mostra o label
    iQtdRegistros := 0;
    lblRegistros.Caption := '';
    lblRegistros.Visible := True;

    // Exibe a página da grid com os dados importados
    PagControle.ActivePageIndex := 1;

    // Inicia o Loop de importação dos dados da planilha
    for i := 1 to (iMaxLin+1) do begin
      // Se usuário apertar cancelar, aborta a operação
      if frmProgresso.Cancelou then begin
        sExcecao := 'Operação ABORTADA pelo usuário!';
        OperAbortada := True;
        memLogExcecao.Lines.Add(sExcecao);
        break;
      end;

      // Avança o form de progresso
      frmProgresso.AndaFormProgresso(i,iMaxLin);

      // Inicializa a variável de Observação
      sObservacao := '';

      if cdsLayOutFLGTIPOINDICADOR.AsString = 'D' then
        begin
          // Se existir conteúdo na célula procura a existência no banco de dados
          sDescIndicador := Trim(vExcel.BuscarValor(iColIndicador,i));

          // Elimina os pontos [.] da string
          if Pos('.',sDescIndicador) > 0 then
            sDescIndicador := Trim(ComunsImobiliario.StrTran(sDescIndicador,'.'));

          // Elimina os dois pontos [:] da string
          if Pos(':',sDescIndicador) > 0 then
            sDescIndicador := Trim(ComunsImobiliario.StrTran(sDescIndicador,':'));

          if sDescIndicador <> '' then begin
            cdsIndicadores.Data := CtrlIndicador.LookupIndicador(-1,'',-1,-1,False,sDescIndicador);
          end else begin
            // Se célula vazia, reinicia o loop
            Continue;
          end;

          // Se não retornar dados na consulta
          if cdsIndicadores.IsEmpty then begin
            // Se não existir indicador cadastrado, procura nos sinônimos
            cdsTemp.Data := CtrlIndSinonimo.LookupIndSinonimo(-1,sDescIndicador);

            if cdsTemp.IsEmpty then begin
              // Se não existir sinônimo cadastrado, monta uma linha para incluir no arquivo de LOG
              sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                          'Indicador ' + '[' + sDescIndicador + '] não cadastrado!';
              memLogExcecao.Lines.Add(sExcecao);
              Continue;
            end else begin
              // Se retornou dados na pesquisa ao Banco de Dados guarda o ID do indicador e
              // uma observação indicando o nome do sinônimo correspondente
              iIdIndicador := cdsTemp.FieldByName('IDINDICADOR').AsInteger;
              sObservacao  := cdsTemp.FieldByName('SINONIMO').AsString;
              cdsIndicadores.Data := CtrlIndicador.LookupIndicador(iIdIndicador);
            end
          end else begin
            // Se retornou dados na pesquisa ao Banco de Dados guarda o ID do indicador
            iIdIndicador := cdsIndicadoresIDINDICADOR.AsInteger;
          end;
        end
      else
        begin
          // Se existir conteúdo na célula procura a existência no banco de dados
          sDescIndicador := Trim(vExcel.BuscarValor(iColIndicador,i));

          if sDescIndicador <> '' then begin
            try
              cdsIndicadores.Data := CtrlIndicador.LookupIndicador(StrToInt(sDescIndicador),'',-1,-1,False,'');
            except
              sExcecao := 'ERRO de conversão na linha ' + IntToStr(i) + ' = ' +
                          'Código ' + '[' + sDescIndicador + '] não numérico!';
              memLogExcecao.Lines.Add(sExcecao);
              Continue;
            end;
          end else begin
            // Se célula vazia, reinicia o loop
            Continue;
          end;

          // Se não retornar dados na consulta
          if cdsIndicadores.IsEmpty then begin
            sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                        'Indicador ' + '[' + sDescIndicador + '] não cadastrado!';
            memLogExcecao.Lines.Add(sExcecao);
            Continue;
          end else begin
            // Se retornou dados na pesquisa ao Banco de Dados guarda o ID do indicador
            iIdIndicador := cdsIndicadoresIDINDICADOR.AsInteger;
          end
        end;

      // Se exigir informação de contrato, abortar loop atual e gerar LOG de erro
      if (cdsIndicadoresFLGCONTRATO.AsString = 'S') and (cdsIndApuracaoIDCONTRATO.IsNull) then begin
        // Monta uma linha para incluir no arquivo de LOG
        sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                    'Indicador ' + '[' + sDescIndicador + '] sem informação de contrato!';
        memLogExcecao.Lines.Add(sExcecao);
        Continue;
      end;

        // Loop para verificar a primeira coluna que contenha dados, caso a coluna indicada
        // esteja sem o valor (Ex.: Dados estatísticos ao final da Planilha)

        CelPreenchida := True;
        if (Trim(vExcel.BuscarValor(iColValor,i)) = '') then begin
          CelPreenchida := False;
        end;


        // Se não houver conteúdo na célula, gera um ERRO e aborta o loop
        if not CelPreenchida then begin
          // Monta uma linha para incluir no arquivo de LOG
          sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                      'Indicador ' + '[' + sDescIndicador + '] com VALOR INEXISTENTE!';
          memLogExcecao.Lines.Add(sExcecao);
          Continue;
        end;

        // Se o dado for numérico,  o valor for ZERO e não for permitido
        // a gravação de valor ZERO, gera um ERRO e aborta o loop
        sValor := Trim(vExcel.BuscarValor(iColValor,i));
        if cdsIndicadoresTIPODADO.AsString = 'N' then begin
          if StrToFloat(sValor) = 0 then begin
            if not ckbValorZero.Checked then begin
              // Monta uma linha para incluir no arquivo de LOG
              sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                          'Indicador ' + '[' + sDescIndicador + '] com VALOR ZERO!';
              memLogExcecao.Lines.Add(sExcecao);
              Continue;
            end;
          end;
        end;

      // Inclui o Registro no CDS
      try

        cdsIndApuracao.Insert;

        cdsIndApuracaoNOME_EXTENSO.AsString    := lblEstabelecimento.Caption;
        cdsIndApuracaoDSC_INDICADOR.AsString   := cdsIndicadoresDESCRICAO.AsString;
        cdsIndApuracaoIDIMOVEL.AsFloat         := molImovelouMestre1.iImovel;
        cdsIndApuracaoIDINDICADOR.AsFloat      := iIdIndicador;
        cdsIndApuracaoFLGCONCILIADO.AsString   := 'N';
        cdsIndApuracaoTIPOINCLUSAO.AsString    := 'I'; {M=Manual; C=Calculado; R=Regra; I=Importação}
        cdsIndApuracaoANOCOMPETENCIA.AsInteger := iAno;
        cdsIndApuracaoMESCOMPETENCIA.AsInteger := iMes;
        cdsIndApuracaoDATAAPURACAO.AsDateTime  := dDataApuracao;
        cdsIndApuracaoDATAINCLUSAO.AsDateTime  := dDataInclusao;

        if sObservacao <> '' then
          cdsIndApuracaoOBSERVACAO.AsString    := sObservacao;

        if not (cdsIndicadoresFLGGRPAPURACAO.IsNull) then
          cdsIndApuracaoIDGRPAPURACAO.AsFloat    := cdsIndicadoresIDGRPPADRAO.AsFloat;

        if not (cdsIndicadoresFLGSUBGRPAPURACAO.IsNull) then
          cdsIndApuracaoIDSUBGRPAPURACAO.AsFloat := cdsIndicadoresIDSUBGRPPADRAO.AsFloat;

        if rdbTipoLanca.ItemIndex = 0 then
          cdsIndApuracaoTIPOLANCA.AsString    := 'R'  {R=Realizado}
        else cdsIndApuracaoTIPOLANCA.AsString := 'P'; {P=Previsto}

        if cdsIndicadoresTIPODADO.AsString = 'N' then
          cdsIndApuracaoVLRAPURACAONUM.AsFloat       := StrToFloat(vExcel.BuscarValor(iColValor,i))
        else if cdsIndicadoresTIPODADO.AsString = 'C' then
          cdsIndApuracaoVLRAPURACAOSTR.AsString      := (vExcel.BuscarValor(iColValor,i))
        else cdsIndApuracaoVLRAPURACAODAT.AsDateTime := StrToDate((vExcel.BuscarValor(iColValor,i)));

        inc(iQtdRegistros);
        lblRegistros.Caption := IntToStr(iQtdRegistros);
        Application.ProcessMessages;
      except
        on Exception do begin
          // Monta uma linha para incluir no arquivo de LOG
          sExcecao := 'ERRO de Gravação na linha ' + IntToStr(i);
          memLogExcecao.Lines.Add(sExcecao);
          Continue;
        end;
      end;

    end; {FOR}
  finally
    // Esconde o form de progresso
    frmProgresso.EscondeFormProgresso;
    btnConfirmar.Enabled := not OperAbortada;
  end;
end;

procedure TfrmExecImportPlanilha.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  memLogExcecao.Print('');
end;

procedure TfrmExecImportPlanilha.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  if DlgSalvar.Execute then
    memLogExcecao.Lines.SaveToFile(DlgSalvar.FileName);
end;

procedure TfrmExecImportPlanilha.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if CtrlApuracao.GravaApuracao(cdsLayOutIDLAYOUTIMP.AsFloat, edtLote.Text, ExtractFileName(DlgAbrir.FileName)) then
    IrParaPagina(0,'Importação efetuada com sucesso.')
  else MsgDlg('Não foi possível concluir a importação' +#13+
              'com sucesso.', 'Erro',mtError,[mbOK],0);
end;

procedure TfrmExecImportPlanilha.ProcessaArquivoColuna;
var
  iMaxLin, iQtdRegistros, i, y, iColValor : Integer;
  OperAbortada : Boolean;
  iAno, iMes, iDia : Word;
  dDataApuracao, dDataInclusao : TDateTime;
  sExcecao, sObservacao, sNumContrato : String;
  iIdImovel, iIdContrato, iIdIndicador : Int64;

begin

  try

    // Inicializa e Limpa CDS e Memo
    cdsIndApuracao.Data := CtrlApuracao.SelecionaApuracao(-2);
    memLogExcecao.Clear;

    // Busca a Linha e a Culuna Final utilizada na planilha
    iMaxLin := vExcel.UltimaLinha;

    OperAbortada := False;

    // Configura e exibe o form de progresso
    frmProgresso.MostraFormProgresso('Importando dados da Planilha',True,True,True,1,(iMaxLin));

    // Busca e mostra o nome do estabelecimento na tela
    lblEstabelecimento.Caption := molImovelouMestre1.edtImovel.Text;
    lblEstabelecimento.Visible := True;

    // Busca e decodifica a data da apuração
    dDataApuracao := cmdtApura.DateTime;
    DecodeDate(dDataApuracao,iAno,iMes,iDia);
    lblData.Caption := cmdtApura.Text;
    lblData.Visible := True;

    // Busca a data de inclusão(data do sistema)
    dDataInclusao := Date;

    // Inicializa a variável da quantidade de registros e mostra o label
    iQtdRegistros := 0;
    lblRegistros.Caption := '';
    lblRegistros.Visible := True;

    // Exibe a página da grid com os dados importados
    PagControle.ActivePageIndex := 1;

    // Busca o ID do imóvel no MOL
    iIdImovel := molImovelouMestre1.iImovel;

    // Inicia o Loop de importação dos dados da planilha
    for i := 1 to iMaxLin do begin
      // Avança o form de progresso
      frmProgresso.AndaFormProgresso(i,iMaxLin);

      // Inicializa a variável de Observação
      sObservacao := '';

      // Busca o número do contrato na Planilha, de acordo com o cadastro de Layout
      sNumContrato := vExcel.BuscarValor(cdsLayOutPOSCONTRATO.AsInteger,i);

      // Carrega o CDS de contratos
      cdsContratoLoja.Data := CtrlContratoLoja.LookupContratoLoja(-1,-1,OpCalcular,iIdImovel,sNumContrato,'',1);
      if cdsContratoLoja.IsEmpty then begin
        // Monta uma linha para incluir no arquivo de LOG
        sExcecao := 'ERRO na linha ' + IntToStr(i) + ' = ' +
                    'Contrato ' + '[' + sNumContrato + '] não cadastrado!';
        memLogExcecao.Lines.Add(sExcecao);
        Continue;
      end;

      // Busca o ID do contrato no CDS de contratos
      iIdContrato := cdsContratoLojaIDCONTRATO.AsInteger;

      // Inicia o Loop detalhe dos indicadores cadastrados para importação
      cdsDetLayOut.First;
      while not cdsDetLayOut.Eof do begin
        // Se usuário apertar cancelar, aborta a operação
        if frmProgresso.Cancelou then begin
          sExcecao := 'Operação ABORTADA pelo usuário!';
          OperAbortada := True;
          memLogExcecao.Lines.Add(sExcecao);
          BREAK;
        end;

        // Busca o ID indicador no CDS detalhe do Layout
        iIdIndicador := cdsDetLayOutIDINDICADOR.AsInteger;

        // Busca a coluna onde estará o valor do Indicador
        iColValor := cdsDetLayOutPOSINDICADOR.AsInteger;

        // Busca dados para o CDS Indicador
        cdsIndicadores.Data := CtrlIndicador.LookupIndicador(iIdIndicador,'',-1,-1,False,'');

        // Inclui o Registro no CDS
        try

          cdsIndApuracao.Insert;
          cdsIndApuracaoNOME_EXTENSO.AsString    := lblEstabelecimento.Caption;
          cdsIndApuracaoDSC_INDICADOR.AsString   := cdsIndicadoresDESCRICAO.AsString;
          cdsIndApuracaoDSC_CONTRATO.AsString    := sNumContrato; 
          cdsIndApuracaoIDCONTRATO.AsFloat       := iIdContrato;
          cdsIndApuracaoIDIMOVEL.AsFloat         := iIdImovel;
          cdsIndApuracaoIDINDICADOR.AsFloat      := iIdIndicador;
          cdsIndApuracaoFLGCONCILIADO.AsString   := 'N';
          cdsIndApuracaoTIPOINCLUSAO.AsString    := 'I'; {M=Manual; C=Calculado; R=Regra; I=Importação}
          cdsIndApuracaoANOCOMPETENCIA.AsInteger := iAno;
          cdsIndApuracaoMESCOMPETENCIA.AsInteger := iMes;
          cdsIndApuracaoDATAAPURACAO.AsDateTime  := dDataApuracao;
          cdsIndApuracaoDATAINCLUSAO.AsDateTime  := dDataInclusao;

          if sObservacao <> '' then
            cdsIndApuracaoOBSERVACAO.AsString    := sObservacao;

          if not (cdsIndicadoresFLGGRPAPURACAO.IsNull) then
            cdsIndApuracaoIDGRPAPURACAO.AsFloat    := cdsIndicadoresIDGRPPADRAO.AsFloat;

          if not (cdsIndicadoresFLGSUBGRPAPURACAO.IsNull) then
            cdsIndApuracaoIDSUBGRPAPURACAO.AsFloat := cdsIndicadoresIDSUBGRPPADRAO.AsFloat;

          if rdbTipoLanca.ItemIndex = 0 then
            cdsIndApuracaoTIPOLANCA.AsString    := 'R'  {R=Realizado}
          else cdsIndApuracaoTIPOLANCA.AsString := 'P'; {P=Previsto}

          if cdsIndicadoresTIPODADO.AsString = 'N' then
            cdsIndApuracaoVLRAPURACAONUM.AsFloat       := StrToFloat(vExcel.BuscarValor(iColValor,i))
          else if cdsIndicadoresTIPODADO.AsString = 'C' then
            cdsIndApuracaoVLRAPURACAOSTR.AsString      := (vExcel.BuscarValor(iColValor,i))
          else cdsIndApuracaoVLRAPURACAODAT.AsDateTime := StrToDate((vExcel.BuscarValor(iColValor,i)));

          inc(iQtdRegistros);
          lblRegistros.Caption := IntToStr(iQtdRegistros);
          Application.ProcessMessages;
        except
          on Exception do begin
            // Monta uma linha para incluir no arquivo de LOG
            sExcecao := 'ERRO de Gravação na linha ' + IntToStr(i);
            memLogExcecao.Lines.Add(sExcecao);
            Continue;
          end;
        end;
        cdsDetLayOut.Next;
      end;

    end; {FOR}
  finally
    // Esconde o form de progresso
    frmProgresso.EscondeFormProgresso;
    // Habilita o botão confirmar
    btnConfirmar.Enabled := not OperAbortada;
  end;

end;

procedure TfrmExecImportPlanilha.ImprimirImportao1Click(Sender: TObject);
begin
  inherited;
  rptImportacao.Print;
end;

procedure TfrmExecImportPlanilha.rptImportacaoBeforePrint(Sender: TObject);
begin
  inherited;
  lblEmpresa.Text := Sistema.NomeEmpresa;
  lblSistema.Text := Sistema.NomeModulo;  
end;

procedure TfrmExecImportPlanilha.btnVoltarClick(Sender: TObject);
begin
  inherited;
  ArquivoAberto := False;
end;

end.
