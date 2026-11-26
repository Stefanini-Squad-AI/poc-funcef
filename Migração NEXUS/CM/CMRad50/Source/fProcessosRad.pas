{------------------------------------------------------------------------------
  Autor  : Antonio Marcos (amf)
  Data   : 22.05.2007
  Pend.  : 25420 - VALIA (em implementação)
  Descr. : Permite a consulta ao Sistemas de Cotas Patrimoniais.
----------------------------------------------------------------------------------------------------------
  Autor  : Antonio Marcos (amf)
  Data   : 22.05.2007
  Pend.  : 25280 - VALIA
  Descr. : Implementada verificação da situação atual do processo para evitar que o usuário opere um
           processo cuja realidade foi modificada por outro usuário.
----------------------------------------------------------------------------------------------------------}

unit fProcessosRad;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, wwdbedit, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, usistema, fPropAprovaRAD, uMensErro,
  uCtrlPadroes, wwclient, FSairAjuda, dBaseDados, JCLSysUtils,
  uctrlRadTipoProc, uCtrlRADEtapa, uCtrlRadAnexo,  uCtrlRADPlus, TB97Ctls,
  wwdblook, ImgList, ShellAPI;


type
  TfrmProcessosRad = class(TfrmOkCancelar)
    PageControl: TPageControl;
    tabProc: TTabSheet;
    tabConsulta: TTabSheet;
    cdsRad: TCMClientDataSet;
    dtsRAD: TwwDataSource;
    pnlProcessos: TPanel;
    Panel7: TPanel;
    Splitter2: TSplitter;
    Panel8: TPanel;
    pnCheck: TPanel;
    grbCheck: TGroupBox;
    Panel6: TPanel;
    chkAtraso: TCheckBox;
    Panel5: TPanel;
    chkEmDia: TCheckBox;
    Panel4: TPanel;
    chkTerceiros: TCheckBox;
    Panel3: TPanel;
    chkSubstituto: TCheckBox;
    Panel9: TPanel;
    wwdbgProcesso: TwwDBGrid;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBNavigator1: TDBNavigator;
    Panel12: TPanel;
    pnlSub: TPanel;
    tabFluxo: TTabSheet;
    Panel15: TPanel;
    dsEtapa: TwwDataSource;
    Panel13: TPanel;
    Splitter1: TSplitter;
    Panel14: TPanel;
    Panel16: TPanel;
    Splitter3: TSplitter;
    plnBem: TPanel;
    memOBS: TDBMemo;
    Panel17: TPanel;
    GrdEtapa: TwwDBGrid;
    Panel18: TPanel;
    Panel19: TPanel;
    GrdAut: TwwDBGrid;
    Panel20: TPanel;
    DBNavigator: TDBNavigator;
    Panel21: TPanel;
    bbtnVoltar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    cdsEtapa: TCMClientDataSet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    lblFimEtapa: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    dbedtFimEtapa: TDBEdit;
    DBEdit11: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    lblFimRAD: TLabel;
    dbedtFimRAD: TDBEdit;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    dsAut: TwwDataSource;
    CdsAut: TCMClientDataSet;
    grbDetProc: TGroupBox;
    nbDetProc: TNotebook;
    Label10: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label22: TLabel;
    DBEdit15: TDBEdit;
    TB97Consultar: TToolbar97;
    ToolbarSep974: TToolbarSep97;
    bbtnConsultar: TBitBtn;
    pnSel: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    pnlUpDown: TPanel;
    btnUpSemRef: TSpeedButton;
    btnDownSemRef: TSpeedButton;
    nbItensSemRef: TNotebook;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label27: TLabel;
    DBEdit20: TDBEdit;
    tabAnexos: TTabSheet;
    pnlAnexos: TPanel;
    ImlPadrao: TImageList;
    pnlBodyAnexos: TPanel;
    pnlDadosAnexo: TPanel;
    DockOkCancelar: TDock97;
    ToolbarOkCancelar: TToolbar97;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    pnlGridAnexos: TPanel;
    dbgrdAnexos: TwwDBGrid;
    Dock: TDock97;
    Toolbar: TToolbar97;
    btnIncluirAnexo: TToolbarButton97;
    btnAlterarAnexo: TToolbarButton97;
    btnExcluirAnexo: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    sbtnSalvaAnexo: TToolbarButton97;
    sbtnVisualizaAnexo: TToolbarButton97;
    dtsAnexos: TDataSource;
    cdsAnexos: TCMClientDataSet;
    Label28: TLabel;
    dbedtDescAnexo: TDBEdit;
    Label29: TLabel;
    dbedtArqAnexo: TDBEdit;
    Label30: TLabel;
    dbedtDataHoraAnexo: TDBEdit;
    btnArquivo: TSpeedButton;
    Panel2: TPanel;
    pnlTopAnexos: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    nbItensSolicCompra: TNotebook;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit25: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Panel22: TPanel;
    btnUpSolicCompra: TSpeedButton;
    btnDownSolicCompra: TSpeedButton;
    Label36: TLabel;
    DBEdit26: TDBEdit;
    Label41: TLabel;
    DBEdit31: TDBEdit;
    Label42: TLabel;
    DBEdit32: TDBEdit;
    Label43: TLabel;
    DBEdit33: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit34: TDBEdit;
    Label15: TLabel;
    DBEdit35: TDBEdit;
    Label16: TLabel;
    DBEdit36: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit37: TDBEdit;
    Label17: TLabel;
    DBEdit38: TDBEdit;
    Label18: TLabel;
    DBEdit39: TDBEdit;
    Label31: TLabel;
    DBEdit21: TDBEdit;
    Label32: TLabel;
    DBEdit22: TDBEdit;
    Label33: TLabel;
    DBEdit24: TDBEdit;
    Label34: TLabel;
    DBEdit23: TDBEdit;
    DBEdit40: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit41: TDBEdit;
    Label46: TLabel;
    DBEdit42: TDBEdit;
    Label47: TLabel;
    DBEdit43: TDBEdit;
    Label48: TLabel;
    DBEdit44: TDBEdit;
    Label49: TLabel;
    DBEdit45: TDBEdit;
    procedure PageControlChange(Sender: TObject);
    procedure wwdbgProcessoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwdbgProcessoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure cdsRadAfterOpen(DataSet: TDataSet);
    procedure cdsEtapaAfterOpen(DataSet: TDataSet);
    procedure cdsEtapaAfterScroll(DataSet: TDataSet);
    procedure CdsAutAfterOpen(DataSet: TDataSet);
    procedure cdsRadAfterScroll(DataSet: TDataSet);
    procedure chkEmDiaClick(Sender: TObject);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure wwdbgProcessoMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure wwdbgProcessoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwdbgProcessoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnDownSemRefClick(Sender: TObject);
    procedure btnUpSemRefClick(Sender: TObject);
    procedure btnIncluirAnexoClick(Sender: TObject);
    procedure btnAlterarAnexoClick(Sender: TObject);
    procedure btnExcluirAnexoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsAnexosAfterOpen(DataSet: TDataSet);
    procedure cdsAnexosAfterScroll(DataSet: TDataSet);
    procedure btnArquivoClick(Sender: TObject);
    procedure sbtnSalvaAnexoClick(Sender: TObject);
    procedure sbtnVisualizaAnexoClick(Sender: TObject);
    procedure btnUpSolicCompraClick(Sender: TObject);
    procedure btnDownSolicCompraClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FScrolling: boolean;
    procedure SetScrolling(const Value: boolean);
  private
    iHeight : integer;
    iWidth  : integer;

    RadPlus     : TCtrlRadPlus;
    RadEtapa    : TCtrlRadEtapa;
    RadTipoProc : TCtrlRadTipoProc;
    RadAnexo    : TCtrlRadAnexo;

    frmDetail : TfrmSairAjuda;

    strIni : TStringList;
    FValorSpin: integer;
    bAcionaSpinner: boolean;
    bMaximizado : boolean;

    //amf 20.11.2006 21792
    bAscending: boolean;

    sFieldOrdena: string;

    procedure OrdenaGrid( sColunaClicada : string; bOrdemAscendente : boolean );

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    procedure ConsultaRAD;
    procedure ConsultaPendentes;

    procedure MaximizaJanela;
    procedure RestauraJanela;

    procedure ConsultaFormSistema;

    //amf 18.10.2006 21792: Retorna a cor que irá pintar a linha do grid de acordo com a situação encontrada
    function StatusCorSituacao(stEtapa: TSituacaoEtapa): TColor;

    //amf 18.10.2006 21792: Retorna a situação analisada conforme condições apresentadas
    function DefineSituacaoEtapa: TSituacaoEtapa;

    {amf 22.05.2007 25280 -
         Verifica a situação atual do(s) processo(s) selecionado(s). A finalidade é evitar que o usuário
         realize uma ação em um processo que já sofreu alguma alteração (exclusão, aprovação, etc) por outro
         usuário.
    }
    function ProcessoRadModificado: boolean;

    procedure Spinner(sSinal: string);

    procedure MsgErro( sMsg : string );

    procedure PreparaTela;

    procedure GravaIni;
    procedure LeIni;

    procedure ContaRegistrosSelecionados;

    procedure SelecaoProcesso;

    property Scrolling : boolean read FScrolling write SetScrolling;

  public

    { amf 31.10.2006 21792 :
      A class function permite que o método seja acionado sem a necessidade de instanciar um objeto.
      a idéia aqui é setar o boolean de acordo com o modo da tela de processos do RAD+ (Consulta ou Aprovação)
    }
    class function ModoConsulta(bConsulta: boolean): boolean;
  end;


var
  frmProcessosRad: TfrmProcessosRad;
  frmPropAprovaRAD: TfrmPropAprovaRAD;

implementation

uses
  FRadConsultaDoc, FConsultaRAD, FRadConsultaLote, FRADConsultaSoliComp,
  FRADConsultaCotacaoComp, FRADConsultaOC, FRADConsultaReqMat,
  FRADConsultaDestacamento;

{$R *.DFM}

var
  //amf 31.10.2006 21792 - variável global apenas para a seção implementation da unidade. Será setada pela class function ModoConsulta
  bModoConsulta: boolean;

procedure TfrmProcessosRad.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = TabConsulta then
     ConsultaFormSistema
  else
  begin
    if frmDetail <> nil then
      FreeAndNil( frmDetail );

    if PageControl.ActivePage = tabFluxo then
    begin
       //Abre as etapas dos processos pendentes
       cdsEtapa.Data := RadEtapa.SelecionaEtapas(cdsRAD.FieldByName('IDPROCESSO').AsFloat);

       //Abre as autorizações para a etapa selecionada
       cdsAut.Data := RadEtapa.SelecionaAutorizacoesDaEtapa(cdsEtapa.FieldByName('IDRADETAPAPROC').AsFloat);
    end;

    if PageControl.ActivePage = tabAnexos then
    begin
       //Abre os anexos do processo
       cdsAnexos.Data := RadAnexo.SelecionaAnexosDoProcesso( cdsRAD.FieldByName('IDPROCESSO').AsInteger );
    end;

  end;

  inherited;
end;

procedure TfrmProcessosRad.wwdbgProcessoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not bModoConsulta then
  begin
    if not wwdbgProcesso.IsSelected then
    begin
      wwdbgProcesso.Canvas.Font.Color := clBlack;
      wwdbgProcesso.Canvas.Brush.Color := StatusCorSituacao( DefineSituacaoEtapa );
      wwdbgProcesso.DefaultDrawDataCell( Rect, Field, State );
    end;
  end;
end;

procedure TfrmProcessosRad.bbtnConfirmarClick(Sender: TObject);
var
  bOk, bApenasAvanca   : boolean;
  iPrimeiroSelecionado : integer;
begin
  inherited;

  PageControl.ActivePage := tabProc;

  //amf 22.05.2007 25280 
  if (ProcessoRAdModificado) then
    exit;

  if not wwdbgProcesso.IsSelectedRecord then
  begin
    MsgDlg( 'O processo atual não foi selecionado.', 'Erro', mtError, [mbOK], 0);
    exit;
  end;

  Scrolling := True;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try

    bApenasAvanca := False;
    iPrimeiroSelecionado := 0;
    cdsRad.First;
    while not cdsRad.Eof do
    begin
      if wwdbgProcesso.IsSelectedRecord then
      begin
        if cdsRad.FieldByName('TERCEIROS').AsInteger = 1 then
        begin
          MsgDlg('Há etapas selecionadas que não podem ser aprovadas pelo usuário atual.', 'Erro', mtError, [mbOK], 0);
          exit;
        end;

        if iPrimeiroSelecionado = 0 then
          iPrimeiroSelecionado := cdsRad.RecNo;

        if not bApenasAvanca then
          bApenasAvanca := ( cdsRad.FieldByName('FLGACAOAPROVA').AsInteger <> 3 );
      end;
      cdsRad.Next;
    end;
    cdsRad.First;

    if bApenasAvanca then
      frmPropAprovaRAD.iTipoOperacao := 1
    else
      frmPropAprovaRAD.iTipoOperacao := 2;

    cdsRad.RecNo := iPrimeiroSelecionado;

    if frmPropAprovaRAD.ShowModal = mrOk then
    begin

      cdsRad.First;
      bOk := True;
      while not cdsRad.Eof do
      begin
        if wwdbgProcesso.IsSelected and bOk then
        begin
          RADPlus.InicializaPropriedades;
          bOk := RADPlus.AprovaEtapa( cdsRad.FieldByName('IDPROCESSO').AsInteger,
                                      cdsRad.FieldByName('IDRADETAPAPROC').AsInteger,
                                      Sistema.IdUsuario,
                                      frmPropAprovaRAD.memObs.Text,
                                      frmPropAprovaRAD.cbRessalva.Checked );
        end;
        cdsRad.Next;
      end;

      if bOk then
      begin
        cdsRad.RecNo := iPrimeiroSelecionado;
        MsgDlg( 'Etapa(s) do(s) processo(s) selecionado(s) aprovada(s) com sucesso.', 'Aviso', mtInformation, [mbOK], 0 );
      end
      else
        MsgDlg( 'Não foi possível realizar as aprovações.', 'Erro', mtError, [mbOK], 0 );
    end;

  finally
    Scrolling := False;
    if bOk then ConsultaPendentes;
    FreeAndNil( frmPropAprovaRAD );
  end;

end;


procedure TfrmProcessosRad.bbtnVoltarClick(Sender: TObject);
var
  bOk                  : boolean;
  iPrimeiroSelecionado : integer;
begin
  inherited;

  PageControl.ActivePage := tabProc;

  //amf 22.05.2007 25280 
  if (ProcessoRAdModificado) then
    exit;

  if not wwdbgProcesso.IsSelectedRecord then
  begin
    MsgDlg( 'O processo atual não foi selecionado.', 'Erro', mtError, [mbOK], 0);
    exit;
  end;

  Scrolling := True;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try

    iPrimeiroSelecionado := 0;
    cdsRad.First;
    while not cdsRad.Eof do
    begin
      if wwdbgProcesso.IsSelectedRecord then
      begin

        if cdsRad.FieldByName('TERCEIROS').AsInteger = 1 then
        begin
          MsgDlg('Há processos selecionadas que não podem ser retornados pelo usuário atual.', 'Erro', mtError, [mbOK], 0);
          exit;
        end;

        if ( cdsRad.FieldByName('FLGPODERETORNAR').AsInteger = 0 ) or
           ( cdsRad.FieldByName('SEQETAPA').AsInteger <= 1       ) then
        begin
          MsgDlg( 'Há etapas selecionadas que não permitem retorno.', 'Erro', mtError, [mbOK], 0);
          exit;
        end;

        if iPrimeiroSelecionado = 0 then
          iPrimeiroSelecionado := cdsRad.RecNo;

      end;
      cdsRad.Next;
    end;
    cdsRad.First;

    frmPropAprovaRAD.iTipoOperacao := 3;

    cdsRad.RecNo := iPrimeiroSelecionado;

    if frmPropAprovaRAD.ShowModal = mrOk then
    begin

      cdsRad.First;
      bOk := True;
      while not cdsRad.Eof do
      begin
        if wwdbgProcesso.IsSelected and bOk then
        begin
          RADPlus.InicializaPropriedades;
          bOk := RADPlus.VoltaEtapa( cdsRad.FieldByName('IDPROCESSO').AsInteger,
                                     cdsRad.FieldByName('IDRADETAPAPROC').AsInteger,
                                     Sistema.IdUsuario,
                                     frmPropAprovaRAD.memObs.Text );
        end;
        cdsRad.Next;
      end;

      if bOk then
      begin
        cdsRad.RecNo := iPrimeiroSelecionado;
        MsgDlg( 'Processo(s) retornado(s) com sucesso.', 'Aviso', mtInformation, [mbOK], 0 );
      end
      else
        MsgDlg( 'Não foi possível retornar o(s) processo(s).', 'Erro', mtError, [mbOK], 0 );
    end;

  finally
    Scrolling := False;
    if bOk then ConsultaPendentes;
    FreeAndNil( frmPropAprovaRAD );
  end;

end;


procedure TfrmProcessosRad.bbtnCancelarClick(Sender: TObject);
var
  bOk                  : boolean;
  iPrimeiroSelecionado : integer;
begin
  inherited;

  PageControl.ActivePage := tabProc;

  //amf 22.05.2007 25280 
  if (ProcessoRAdModificado) then
    exit;

  if not wwdbgProcesso.IsSelectedRecord then
  begin
    MsgDlg( 'O processo atual não foi selecionado.', 'Erro', mtError, [mbOK], 0);
    exit;
  end;

  Scrolling := True;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try

    iPrimeiroSelecionado := 0;
    cdsRad.First;
    while not cdsRad.Eof do
    begin
      if wwdbgProcesso.IsSelectedRecord then
      begin

        if cdsRad.FieldByName('TERCEIROS').AsInteger = 1 then
        begin
          MsgDlg('Há processos selecionadas que não podem ser recusados pelo usuário atual.', 'Erro', mtError, [mbOK], 0);
          exit;
        end;

        if cdsRad.FieldByName('FLGPODERECUSAR').AsInteger = 0 then
        begin
          MsgDlg( 'Há etapas selecionadas que não permitem recusa.', 'Erro', mtError, [mbOK], 0);
          exit;
        end;

        if iPrimeiroSelecionado = 0 then
          iPrimeiroSelecionado := cdsRad.RecNo;

      end;
      cdsRad.Next;
    end;
    cdsRad.First;

    frmPropAprovaRAD.iTipoOperacao := 4;

    cdsRad.RecNo := iPrimeiroSelecionado;

    if frmPropAprovaRAD.ShowModal = mrOk then
    begin

      cdsRad.First;
      bOk := True;
      while not cdsRad.Eof do
      begin
        if wwdbgProcesso.IsSelected and bOk then
        begin
          RADPlus.InicializaPropriedades;
          bOk := RADPlus.RecusaEtapa( cdsRad.FieldByName('IDPROCESSO').AsInteger,
                                      cdsRad.FieldByName('IDRADETAPAPROC').AsInteger,
                                      Sistema.IdUsuario,
                                      frmPropAprovaRAD.memObs.Text );
        end;
        cdsRad.Next;
      end;

      if bOk then
      begin
        cdsRad.RecNo := iPrimeiroSelecionado;
        MsgDlg( 'Processo(s) recusado(s) com sucesso.', 'Aviso', mtInformation, [mbOK], 0 );
      end
      else
        MsgDlg( 'Não foi possível recusar o(s) processo(s).', 'Erro', mtError, [mbOK], 0 );
    end;

  finally
    Scrolling := False;
    if bOk then ConsultaPendentes;
    FreeAndNil( frmPropAprovaRAD );
  end;

end;

procedure TfrmProcessosRad.FormResize(Sender: TObject);
begin
  inherited;
  cdsAut.Filtered := True;
end;

procedure TfrmProcessosRad.FormCreate(Sender: TObject);
begin
  inherited;

  bAcionaSpinner := True;
  FScrolling     := False;

  iHeight := Height;
  iWidth  := Width ;

  RadPlus := TCtrlRadPlus.Create;
  RadPlus.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
  Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  RadEtapa := TCtrlRadEtapa.Create;
  RadEtapa.InitializeAs( RadPlus );

  RadTipoProc := TCtrlRadTipoProc.Create;
  RadTipoProc.InitializeAs( RadPlus );

  RadAnexo := TCtrlRadAnexo.Create;
  RadAnexo.InitializeAs( RadPlus );

  RadAnexo.cdsRadAnexo := cdsAnexos;

  strIni := TStringList.Create;

  TB97Consultar.Visible  := bModoConsulta;
  TB97oKCancelar.Visible := not bModoConsulta;
  pnCheck.Visible        := not bModoConsulta;

  LeIni;

  if bModoConsulta then
  begin
    wwdbgProcesso.Options := wwdbgProcesso.Options - [dgMultiSelect];
    ConsultaRAD;
    frmProcessosRad.HelpContext := 230052;
    bbtnAjuda.HelpContext       := 230052;
  end
  else
  begin
   ConsultaPendentes;
   frmProcessosRad.HelpContext := 230048;
   bbtnAjuda.HelpContext       := 230048;
  end;
  bMaximizado := False;
  MaximizaJanela;

  pnlGridAnexos.BringToFront;

  //tabAnexos.TabVisible := False;
end;

procedure TfrmProcessosRad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action          := caFree;
  inherited;
end;

procedure TfrmProcessosRad.wwdbgProcessoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if wwdbgProcesso.SelectedList.Count > 1 then
  begin
    tabConsulta.Enabled := False;
    tabFluxo.Enabled    := False;
    panel1.Visible := False;
  end
  else
  begin
    tabConsulta.Enabled := True;
    tabFluxo.Enabled    := True;
    panel1.Visible := True;
  end;

end;

procedure TfrmProcessosRad.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := False;

  if not cdsRAD.Active then exit;
  if cdsRAD.IsEmpty then exit;

  AllowChange := True;

  if AllowChange then
    AllowChange := not ( cdsAnexos.State in [dsEdit, dsInsert] );

  if AllowChange and ( dgMultiSelect in wwdbgProcesso.Options ) then
    AllowChange := ( wwdbgProcesso.SelectedList.Count = 1 );
end;

function TfrmProcessosRad.DefineSituacaoEtapa: TSituacaoEtapa;
begin
  Result := stEmDia;
  case cdsRad.FieldByName('CLASSIFICACAO').AsInteger of
    1 : Result := stAtraso;
    2 : Result := stEmDia;
    3 : Result := stTerceiros;
    4 : Result := stSubstituto;
  end;
end;

function TfrmProcessosRad.StatusCorSituacao( stEtapa: TSituacaoEtapa): TColor;
begin

  case stEtapa of
     stAtraso:     Result := $00B7DBFF;
     stEmDia:      Result := clWhite;
     stSubstituto: Result := $00D7FFFF;
     stTerceiros:  Result := $00FFFFDF;
  else
    Result := clWhite;
  end;

end;

procedure TfrmProcessosRad.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;

  wwdbgProcesso.UnSelectAll;
  wwdbgProcesso.SelectRecord;

  cdsEtapa.Data := RadEtapa.SelecionaEtapas(cdsRAD.FieldByName('IDPROCESSO').AsFloat);

  cdsAut.Data := RadEtapa.SelecionaAutorizacoesDaEtapa( cdsEtapa.FieldByName('IDRADETAPAPROC').AsFloat );

  if PageControl.ActivePage = tabConsulta then
     ConsultaFormSistema;

  if PageControl.ActivePage = tabAnexos then
    cdsAnexos.Data := RadAnexo.SelecionaAnexosDoProcesso( cdsRAD.FieldByName('IDPROCESSO').AsInteger );

end;

procedure TfrmProcessosRad.cdsRadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField(DataSet.FieldByName('DATAINIPROCESSO')).DisplayFormat  := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMPROCESSO')).DisplayFormat  := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMPREVPROC')).DisplayFormat  := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAINIETAPA')).DisplayFormat     := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMETAPA')).DisplayFormat     := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMPREVETAPA')).DisplayFormat := 'dd/mm/yyyy hh:nn';
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat               := '#,##0.00';

  ContaRegistrosSelecionados;
end;

procedure TfrmProcessosRad.cdsEtapaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField(DataSet.FieldByName('DATAINIETAPA')).DisplayFormat := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMETAPA')).DisplayFormat := 'dd/mm/yyyy hh:nn';
  TDateTimeField(DataSet.FieldByName('DATAFIMPREV')).DisplayFormat  := 'dd/mm/yyyy hh:nn';
end;

procedure TfrmProcessosRad.ConsultaFormSistema;
var
   iRadRef: integer;
begin
   pnlSub.Visible                         := False;

   if cdsRad.FieldByName('IDREFERENCIA').IsNull then
       exit;

   if frmDetail <> nil then
       FreeAndNil( frmDetail );

   iRadRef := cdsRAd.FieldByName('IDREFERENCIA').AsInteger;

   //amf - consulta o documento do contas a pagar
   if RADReferencia( iRadRef, rrDoc ) then
   begin
     //amf 03.04.2007 24704
     TfrmRADConsultaDoc.SetDisparadorCapCar( False );
     frmDetail                                       := TfrmRadConsultaDoc.Create( Self );
     frmDetail.Parent                                := pnlSub;
     frmDetail.Dock971.Visible                       := false;
     frmDetail.FormStyle                             := fsNormal;
     frmDetail.WindowState                           := wsMaximized;
     frmDetail.BorderStyle                           := bsNone;
     ( frmDetail as TfrmRADConsultaDoc ).iIdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     ( frmDetail as TfrmRADConsultaDoc ).SelecionarDoc;
   end;


   //amf 28.11.2006 23862 - consulta do lote
   if RADReferencia( iRadRef, rrPagtoLote ) then
   begin
     frmDetail                       := TfrmRadConsultaLote.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaLote).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaLote).SelecionarLote;
   end;

   //amf 08.12.2006 23860 - Consulta Solicitação de Compras
   if RADReferencia(iRADRef, rrSolicCompra) then
   begin
     frmDetail                       := TfrmRadConsultaSolicomp.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaSolicomp).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaSolicomp).SelecionarSolicitacaoCompras;
   end;


   //amf 08.12.2006 23860 - Consulta Cotacão do Processo de Compras
   if RADReferencia(iRADRef, rrCotacao) then
   begin
     frmDetail                       := TfrmRADConsultaCotacaoComp.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaCotacaoComp).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaCotacaoComp).SelecionarCotacaoCompras;
   end;

   //amf 11.12.2006 23860 - Consulta a Ordem de Compras - OC
   if RADReferencia(iRADRef, rrOrdemCompra) then
   begin
     frmDetail                       := TfrmRADConsultaOC.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaOC).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaOC).SelecionarOC;
   end;

   if RADReferencia(iRADRef, rrReqMaterial) then
   begin
     frmDetail                       := TfrmRADConsultaReqMat.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaReqMat).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaReqMat).SelecionarReqMat;
   end;

   // Pendência: 24802 - Andre Mesquita - 30/03/2007
   if RADReferencia(iRADRef, rrDestacaViagem) then
   begin
     frmDetail                       := TfrmRADConsultaDestacamento.Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsultaDestacamento).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsultaDestacamento).SelecionarDestacamento(iRADRef);
   end;

(* Aguardando a tela de consulta do sistema de cotas.
   //amf 22.05.2007 25420 - Cotas Patrimoniais.
   if RADReferencia(iRADRef, rrCotasPatrim) then
   begin
     frmDetail                       := TfrmRADConsulta..Create( Self );
     frmDetail.Parent                := pnlSub;
     frmDetail.Dock971.Visible       := false;
     frmDetail.FormStyle             := fsNormal;
     frmDetail.WindowState           := wsMaximized;
     frmDetail.BorderStyle           := bsNone;
     (frmDetail as TfrmRadConsulta...).IdProcesso := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
     (frmDetail as TfrmRadConsulta...).Selecionar...;
   end;
 *)

   if frmDetail <> nil then
     frmDetail.Show;

   pnlSub.Visible := True;
end;


procedure TfrmProcessosRad.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOK], 0 );
end;

procedure TfrmProcessosRad.cdsEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cdsAut.Data := RadEtapa.SelecionaAutorizacoesDaEtapa( cdsEtapa.FieldByName('IDRADETAPAPROC').AsFloat );
end;

procedure TfrmProcessosRad.PreparaTela;
begin
  PageControl.ActivePage := tabProc;
  if cdsRad.Active then
  begin
    cdsRad.FieldByName('CLASSIFEXIBICAO').Visible := not bModoConsulta;
    OrdenaGrid( sFieldOrdena, bAscending );
    cdsRad.First;
    FValorSpin := 0;
    wwdbgProcesso.UnselectAll;
    wwdbgProcesso.SelectRecord;
  end;
end;

procedure TfrmProcessosRad.CdsAutAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField(DataSet.FieldByName('DATAHORA')).DisplayFormat := 'dd/mm/yyyy hh:nn'
end;

procedure TfrmProcessosRad.cdsRadAfterScroll(DataSet: TDataSet);
begin
  SelecaoProcesso;
end;

procedure TfrmProcessosRad.chkEmDiaClick(Sender: TObject);
begin
  inherited;
  //amf 28.11.2006
  if not bModoConsulta then
     ConsultaPendentes;
end;


procedure TfrmProcessosRad.GravaIni;
var
   sOrdenacao : string;
begin
  try
    strIni.Values['EMATRASO' + IntToStr( Sistema.IdUsuario )]        := iff( chkAtraso.Checked      , '1', '0' );
    strIni.Values['EMDIA' + IntToStr( Sistema.IdUsuario )]           := iff( chkEmDia.Checked       , '1', '0' );
    strIni.Values['ATRASOTERCEIROS' + IntToStr( Sistema.IdUsuario )] := iff( chkTerceiros.Checked   , '1', '0' );
    strIni.Values['SUBSTITUICAO' + IntToStr( Sistema.IdUsuario )]    := iff( chkSubstituto.Checked  , '1', '0' );
    if bAscending then
       sOrdenacao := 'A'
    else
       sOrdenacao := 'D';
    strIni.Values['CLASSIFEXIBICAO' + IntToStr( Sistema.IdUsuario )]   := sFieldOrdena + ';'+ sOrdenacao;
    strIni.SaveToFile( ExtractFilePath(Application.ExeName) + 'RADg.Ini' );
  except
  end;
end;

procedure TfrmProcessosRad.LeIni;
var
   sOrdenacao : string;
begin
  try
    strIni.LoadFromFile( ExtractFilePath(Application.ExeName) + 'RADg.Ini' );
    chkAtraso.Checked     := StrToIntDef( strIni.Values['EMATRASO' + IntToStr( Sistema.IdUsuario )]        , 1 ) = 1;
    chkEmDia.Checked      := StrToIntDef( strIni.Values['EMDIA' + IntToStr( Sistema.IdUsuario )]           , 1 ) = 1;
    chkTerceiros.Checked  := StrToIntDef( strIni.Values['ATRASOTERCEIROS' + IntToStr( Sistema.IdUsuario )] , 0 ) = 1;
    chkSubstituto.Checked := StrToIntDef( strIni.Values['SUBSTITUICAO' + IntToStr( Sistema.IdUsuario )]    , 0 ) = 1;
    sFieldOrdena          := Copy(strIni.Values['CLASSIFEXIBICAO' + IntToStr( Sistema.IdUsuario )], 1, Length(strIni.Values['CLASSIFEXIBICAO' + IntToStr( Sistema.IdUsuario )]) - 2);
    sOrdenacao            := Copy(strIni.Values['CLASSIFEXIBICAO' + IntToStr( Sistema.IdUsuario )], (Pos(';', strIni.Values['CLASSIFEXIBICAO' + IntToStr( Sistema.IdUsuario )]) + 1), 1);
  except
    chkAtraso.Checked     := True;
    chkEmDia.Checked      := True;
    chkTerceiros.Checked  := False;
    chkSubstituto.Checked := False;
    sFieldOrdena          := 'IDPROCESSO';
    sOrdenacao            := 'A';
  end;
  if sFieldOrdena = '' then
  begin
   sFieldOrdena := 'IDPROCESSO';
   sOrdenacao   := 'A';
  end;

  bAscending := ( sOrdenacao = 'A' );
end;

procedure TfrmProcessosRad.bbtnConsultarClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := tabProc;
  ConsultaRAD;
end;

procedure TfrmProcessosRad.ConsultaRAD;
begin
  if frmConsultaRAD = nil then
    frmConsultaRAD := TFrmConsultaRAD.Create(nil);

  if frmConsultaRAD.ShowModal = mrOK then
    cdsRad.Data := frmConsultaRAD.cdsConsulta.Data;

  PreparaTela;
end;

class function TfrmProcessosRad.ModoConsulta(bConsulta: boolean): boolean;
begin
  bModoConsulta := bConsulta;
  Result := bModoConsulta;
end;

procedure TfrmProcessosRad.ContaRegistrosSelecionados;
begin
  pnSel.Caption := IntToStr(cdsRad.RecordCount) + ' registro(s). ';
  if not bModoConsulta then
    pnSel.Caption := pnSel.Caption + IntToStr( FValorSpin ) + ' selecionado(s).';
end;


procedure TfrmProcessosRad.Spinner(sSinal: string);
begin
  if cdsRAD.RecordCount = 0 then
    FValorSpin := 0
  else
  begin
    case sSinal[1] of
     '+': FValorSpin := FValorSpin + 1;
     '-': FValorSpin := FValorSpin - 1;
     '0': FValorSpin := 1;
    end;
  end;

  ContaRegistrosSelecionados;
end;

procedure TfrmProcessosRad.wwdbgProcessoMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  if (not bModoConsulta) then
  begin
    if ((Selecting) and (bAcionaSpinner)) then
          Spinner('+')
    else if bAcionaSpinner then
            Spinner('-');
  end;
end;

procedure TfrmProcessosRad.wwdbgProcessoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //amf 01.11.2006 21792
  if (not bModoConsulta) then
  begin
    bAcionaSpinner := ((ssShift in Shift) or (ssCtrl in Shift));
    if (not (ssShift in Shift)) and (not (ssCtrl in Shift)) then
    begin
       FValorSpin := 1;
       ContaRegistrosSelecionados;
       bAcionaSpinner := True; //amf 01.11.2006 21792 - instrução que evita o erro na contagem. O evento MultiSelectRecord é disparado antes do evento do mouse.
    end;
  end;
end;

procedure TfrmProcessosRad.ConsultaPendentes;
var
  iQtde, iQtdeTerceiros: integer;
begin
  cdsRad.Data := RadPlus.ConsultaProcessos( Sistema.IdUsuario,
                                            iQtde,
                                            iQtdeTerceiros,
                                            chkAtraso.Checked,
                                            chkEmDia.Checked,
                                            chkTerceiros.Checked,
                                            chkSubstituto.Checked,
                                            fpSemFiltro,
                                            '0',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            tfeSemFiltro,
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpIgual,
                                            'PENDENTE',
                                            fpSemFiltro,
                                            '0',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            fpSemFiltro,
                                            '',
                                            tfeSemFiltro,
                                            '0',
                                            tfeSemFiltro
                                            );

  PreparaTela;
end;

procedure TfrmProcessosRad.WMSysCommand(var Msg: TWMSysCommand);
begin
  if ( Msg.CmdType = SC_MAXIMIZE ) or( Msg.CmdType = 61490 ) then
  begin
    if bMaximizado then
      RestauraJanela
    else
      MaximizaJanela;
    exit;
  end;
  inherited;
end;


procedure TfrmProcessosRad.MaximizaJanela;
begin
  Height := Application.MainForm.ClientHeight - 60;
  Width  := Application.MainForm.ClientWidth - 6;
  Top    := 0;
  Left   := 0;
  bMaximizado := True;
end;


procedure TfrmProcessosRad.RestauraJanela;
begin
  Height := iHeight;
  Width  := iWidth;
  Top    := round( ( ( Application.MainForm.ClientHeight - 60 ) - Height ) / 2 );
  Left   := round( ( ( Application.MainForm.ClientWidth  - 6  ) - Width  ) / 2 );
  bMaximizado := False;
end;


procedure TfrmProcessosRad.wwdbgProcessoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  bAscending := not bAscending;
  OrdenaGrid( AFieldName, bAscending );
end;


procedure TfrmProcessosRad.OrdenaGrid(sColunaClicada: string; bOrdemAscendente : boolean);
var
  IndexDef : TIndexDef;
  sCampoReal : string;
begin
  inherited;

  CdsRad.IndexName := '';
  CdsRad.IndexDefs.Clear;
  IndexDef := CdsRad.IndexDefs.AddIndexDef;
  IndexDef.Name := IntToStr( GetTickCount );

  sCampoReal := sColunaClicada;

  if sCampoReal = 'CLASSIFEXIBICAO' then
     sCampoReal := 'CLASSIFICACAO';

  if bOrdemAscendente then
  begin
    IndexDef.Fields := sCampoReal;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := sCampoReal;
    IndexDef.DescFields := sCampoReal;
    IndexDef.Options := [ixDescending];
  end;

  CdsRad.IndexName := IndexDef.Name;
  CdsRad.First;

  sFieldOrdena := sCampoReal;
end;

procedure TfrmProcessosRad.btnDownSemRefClick(Sender: TObject);
begin
  inherited;
  if nbItensSemRef.PageIndex < ( nbItensSemRef.Pages.Count - 1 ) then
    nbItensSemRef.PageIndex := nbItensSemRef.PageIndex + 1;
end;

procedure TfrmProcessosRad.btnUpSemRefClick(Sender: TObject);
begin
  inherited;
  if nbItensSemRef.PageIndex > 0 then
    nbItensSemRef.PageIndex := nbItensSemRef.PageIndex - 1;
end;

procedure TfrmProcessosRad.btnIncluirAnexoClick(Sender: TObject);
begin
  inherited;
  cdsAnexos.Append;

  dbedtArqAnexo.ReadOnly := False;
  dbedtArqAnexo.Color    := clWhite;
  btnArquivo.Enabled     := True;

  pnlDadosAnexo.BringToFront;
  Dock971.Enabled := False;
  DBNavigator.Enabled := False;
  dbedtDescAnexo.SetFocus;
end;

procedure TfrmProcessosRad.btnAlterarAnexoClick(Sender: TObject);
begin
  inherited;
  if cdsAnexos.RecordCount <= 0 then exit;
  cdsAnexos.Edit;

  dbedtArqAnexo.ReadOnly := True;
  dbedtArqAnexo.Color    := clBtnFace;
  btnArquivo.Enabled     := False;

  pnlDadosAnexo.BringToFront;
  Dock971.Enabled := False;
  DBNavigator.Enabled := False;
  dbedtDescAnexo.SetFocus;
end;

procedure TfrmProcessosRad.btnExcluirAnexoClick(Sender: TObject);
begin
  inherited;
  if cdsAnexos.RecordCount <= 0 then exit;

  if MessageDlg( 'Confirma exclusão do anexo selecionado?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
  begin
    cdsAnexos.Delete;
    RadAnexo.Grava;
    cdsAnexos.Data := RadAnexo.SelecionaAnexosDoProcesso( cdsRAD.FieldByName('IDPROCESSO').AsInteger );
  end;
end;

procedure TfrmProcessosRad.btnOkClick(Sender: TObject);
var
  iIdAnexo : integer;
  sNomeArquivo : string;
  bNovo : boolean;
begin
  inherited;
  if trim( dbedtDescAnexo.Text ) = '' then
  begin
    MsgErro( 'Preencha a descrição do anexo.' );
    dbedtDescAnexo.SetFocus;
    exit;
  end;

  if trim( dbedtArqAnexo.Text ) = '' then
  begin
    MsgErro( 'Preencha o nome do arquivo.' );
    dbedtArqAnexo.SetFocus;
    exit;
  end;

  bNovo := ( cdsAnexos.State = dsInsert );

  if bNovo then
  begin
    cdsAnexos.FieldByName('IDPROCESSO').AsInteger := cdsRAD.FieldByName('IDPROCESSO').AsInteger;
    cdsAnexos.FieldByName('IDRADANEXO').AsInteger := RadAnexo.NextId;
    cdsAnexos.FieldByName('IDUSUARIO').AsInteger  := Sistema.IdUsuario;
    cdsAnexos.FieldByName('DATAHORA').AsDateTime  := Now;

    sNomeArquivo := cdsAnexos.FieldByName('NOMEARQUIVO').AsString;

    if not FileExists( cdsAnexos.FieldByName('NOMEARQUIVO').AsString ) then
    begin
      MsgErro( 'Não foi possível encontrar o arquivo ' + cdsAnexos.FieldByName('NOMEARQUIVO').AsString );
      dbedtArqAnexo.SetFocus;
      exit;
    end;

    cdsAnexos.FieldByName('NOMEARQUIVO').AsString := ExtractFileName( cdsAnexos.FieldByName('NOMEARQUIVO').AsString );

  end;

  iIdAnexo := cdsAnexos.FieldByName('IDRADANEXO').AsInteger;

  cdsAnexos.Post;

  RadAnexo.Grava;
  
  if bNovo then
  begin
    if not RadAnexo.GravaAnexo( iIdAnexo, sNomeArquivo ) then
      RadAnexo.ExcluiAnexo( iIdAnexo );
  end;

  cdsAnexos.Data := RadAnexo.SelecionaAnexosDoProcesso( cdsRAD.FieldByName('IDPROCESSO').AsInteger );

  if not cdsAnexos.Locate( 'IDRADANEXO', iIdAnexo, [] ) then
    cdsAnexos.Last; 

  pnlGridAnexos.BringToFront;
  Dock971.Enabled := True;
  DBNavigator.Enabled := True;
end;

procedure TfrmProcessosRad.btnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsAnexos.Cancel;
  pnlGridAnexos.BringToFront;
  Dock971.Enabled := True;
  DBNavigator.Enabled := True;
end;

procedure TfrmProcessosRad.cdsAnexosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField( DataSet.FieldByName('DATAHORA') ).DisplayFormat  := 'dd/mm/yyyy hh:nn';
end;

procedure TfrmProcessosRad.cdsAnexosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btnAlterarAnexo.Enabled := ( cdsAnexos.FieldByName('IDUSUARIO').AsInteger = Sistema.IdUsuario );
  btnExcluirAnexo.Enabled := ( cdsAnexos.FieldByName('IDUSUARIO').AsInteger = Sistema.IdUsuario ); 
end;

procedure TfrmProcessosRad.btnArquivoClick(Sender: TObject);
begin
  inherited;
  OpenDialog.FileName := cdsAnexos.FieldByName('NOMEARQUIVO').AsString;
  if OpenDialog.Execute then
    cdsAnexos.FieldByName('NOMEARQUIVO').AsString := OpenDialog.FileName;
end;

procedure TfrmProcessosRad.sbtnSalvaAnexoClick(Sender: TObject);
var
  cdsAux : TCMClientDataset;
begin
  inherited;
  if cdsAnexos.RecordCount <= 0 then exit;

  SaveDialog.FileName := cdsAnexos.FieldByName('NOMEARQUIVO').AsString;
  if SaveDialog.Execute then
  begin
    cdsAux := TCMClientDataset.Create( nil );
    try
      cdsAux.Data := RadAnexo.RecuperaAnexo( cdsAnexos.FieldByName('IDRADANEXO').AsInteger );
      ( cdsAux.FieldByName('CONTEUDO') as TBlobField ).SaveToFile( SaveDialog.FileName );
    finally
      cdsAux.Free;
    end;
  end;
end;

procedure TfrmProcessosRad.sbtnVisualizaAnexoClick(Sender: TObject);
var
  cdsAux : TCMClientDataset;
  sTmp : string;
begin
  inherited;
  if cdsAnexos.RecordCount <= 0 then exit;

  sTmp := Sistema.TempDir;

  if Copy( sTmp, length( sTmp ), 1 ) <> '\' then sTmp := sTmp + '\';
  sTmp := sTmp + cdsAnexos.FieldByName('NOMEARQUIVO').AsString;

  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := RadAnexo.RecuperaAnexo( cdsAnexos.FieldByName('IDRADANEXO').AsInteger );
    ( cdsAux.FieldByName('CONTEUDO') as TBlobField ).SaveToFile( sTmp );

    ShellExecute( Handle, 'open', PAnsiChar( sTmp ), '', nil, sw_show );
  finally
    cdsAux.Free;
  end;
end;

procedure TfrmProcessosRad.btnUpSolicCompraClick(Sender: TObject);
begin
  inherited;
  if nbItensSolicCompra.PageIndex > 0 then
    nbItensSolicCompra.PageIndex := nbItensSolicCompra.PageIndex - 1;
end;

procedure TfrmProcessosRad.btnDownSolicCompraClick(Sender: TObject);
begin
  inherited;
  if nbItensSolicCompra.PageIndex < ( nbItensSolicCompra.Pages.Count - 1 ) then
    nbItensSolicCompra.PageIndex := nbItensSolicCompra.PageIndex + 1;
end;

procedure TfrmProcessosRad.FormDestroy(Sender: TObject);
begin
  GravaIni;

  FreeAndNil(RadPlus);
  FreeAndNil(RadEtapa);
  FreeAndNil(RadTipoProc);
  FreeAndNil(RadAnexo);

  FreeAndNil( strIni );

  if frmConsultaRAD <> nil then
    FreeAndNil( frmConsultaRAD );

  frmProcessosRad := nil;

  inherited;
end;

procedure TfrmProcessosRad.SetScrolling(const Value: boolean);
begin
  FScrolling := Value;
  SelecaoProcesso;
end;

procedure TfrmProcessosRad.SelecaoProcesso;
var
  iRadRef: integer;
begin
  inherited;

  if FScrolling then exit;

  if cdsRad.FieldByName('DATAFIMPROCESSO').IsNull then
  begin
    lblFimRAD.Caption := 'Fim previsto';
    dbedtFimRAD.DataField := 'DATAFIMPREVPROC';
  end
  else
  begin
    lblFimRAD.Caption := 'Fim efetivo';
    dbedtFimRAD.DataField := 'DATAFIMPROCESSO';
  end;

  if cdsRad.FieldByName('DATAFIMETAPA').IsNull then
  begin
    lblFimEtapa.Caption := 'Fim previsto';
    dbedtFimEtapa.DataField := 'DATAFIMPREVETAPA';
  end
  else
  begin
    lblFimEtapa.Caption := 'Fim efetivo';
    dbedtFimEtapa.DataField := 'DATAFIMETAPA';
  end;

  grbDetProc.Visible := False;

  iRadRef := cdsRad.FieldByName('IDREFERENCIA').AsInteger;

  if RADReferencia( iRadRef, rrDoc ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgDoc';
  end;

  if RADReferencia( iRadRef, rrPagtoLote ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgValor';
  end;

  if RADReferencia( iRadRef, rrSolicCompra ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgSolicCompra';
  end;

  if RADReferencia( iRadRef, rrReqMaterial ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgReqMaterial';
  end;

  if RADReferencia( iRadRef, rrOrdemCompra ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgOrdemCompra';
  end;

  if RADReferencia( iRadRef, rrCotacao ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgCotacao';
  end;

  // Pendência: 24802 - Andre Mesquita - 30/03/2007
  if RADReferencia ( iRadRef, rrDestacaViagem ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgDestacamento';
  end;

  //amf 23.05.2007 25420 - Valia (Cotas Patrimoniais)
  if RADReferencia( iRadRef, rrCotasPatrim ) then
  begin
    grbDetProc.Visible := True;
    nbDetProc.ActivePage := 'nbpgValor';
  end;

  if (cdsRad.FieldByName('IDREFERENCIA').IsNull) or
     (cdsRad.FieldByName('IDREFERENCIA').AsString = '') then
  begin
    grbDetProc.Visible      := True;
    nbDetProc.ActivePage    := 'nbpgSemRef';
  end;
end;

function TfrmProcessosRad.ProcessoRadModificado: boolean;
var
  sMessage: string;
begin
  Result := False;

  //amf 21.05.2007 25280 - verifica se a realidade do processo RAD apresentado na tela, não foi modificada.
  if ( RadPlus.ProcessoRADModificado(cdsRad.Data)) then
  begin
    sMessage := 'Deseja atualizar a lista de processos ?';
    if ( Application.MessageBox(PChar(sMessage), 'Aviso', mb_IconQuestion + mb_YesNo + mb_DefButton2) ) = idYes then
       ConsultaPendentes;  //amf 22.05.2007 25280

    Result := True;
  end;
end;

end.
