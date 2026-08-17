{*******************************************************************************
  Alterações:
********************************************************************************
--------------------------------------------------------------------------------
 Rotinas   : FormCreate, FormClose, AtomString
 Data      : 15/10/2004
 Autor     : Andre Tavares
 Pendência : 16830
 Descrição : Verifica o parametro gravado no registro do sistema se é permitido
 a execução de mais de uma instância do mesmo sistema. 
--------------------------------------------------------------------------------
 Rotinas   : FormCreate
 Data      : 18/03/2004
 Autor     : Alex Pereira
 Pendência : 16190
 Descrição : Criar um arquivo de resource para número da versão.
             Este número será montado dinamicamente no Ajuda / Sobre
--------------------------------------------------------------------------------
 Rotinas   : FormCreate, MsgCtrl
 Data      : 08/03/2004 (término)
 Autor     : David Ayrolla
 Pendência : 16191
 Descrição : Criada função MsgCtrl para exibir mensagens dos CtrlObjects. Isto
             foi feito para resolver o problema da não exibição da mensagem após
             o login de etapas pendentes do RAD.
--------------------------------------------------------------------------------}

unit FCMPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, Db, Wwdatsrc, DBTables, Wwintl, Menus, wwdblook,
  StdCtrls, DBCtrls, Mask, wwdbedit, ExtCtrls, TB97Tlwn, ComCtrls,
  TB97Tlbr, TB97Ctls, TB97, uAutorizacao, uString, IvDictio, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, ppComm, ppProd, ppClass,
  ppReport, ppTypes, Buttons, ImgList, fcStatusBar, ActnList, StdActns,
  AppEvnts, CMApplicationEvents, SConnect, MConnect, DBClient, uCmCtrlReports,
  fParamReports_Padrao, uCMTypes, uCmSqlParams, ppEndUsr, uResource, uCmRegister,
  wintypes, htmlhlp, JCLStrings, ShellAPI;

const
  WM_LOGAR = WM_USER;

type
    TBackgroundStyle = (bsNone, bsTiled, bsCentered, bsFilled);

    TfrmCMPrincipal = class(TfrmTelaAutorizacao)
    mnu: TMainMenu;
    mnuSistema: TMenuItem;
    mnuUtilitario: TMenuItem;
    mnuSair: TMenuItem;
    mnuJanela: TMenuItem;
    mnuLLH_Padrao: TMenuItem;
    mnuLLV_Padrao: TMenuItem;
    mnuCascata_Padrao: TMenuItem;
    mnuOrgIcons_padrao: TMenuItem;
    mnuMininizar_Padrao: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuAjudaIndice: TMenuItem;
    mnusepAjuda1: TMenuItem;
    mnuAjudaSobre: TMenuItem;
    mnuConfiguracao: TMenuItem;
    mnuCadastro: TMenuItem;
    mnuLogin: TMenuItem;
    MnuSep5_padrao: TMenuItem;
    MenuSep0_Padrao: TMenuItem;
    nmuConfigParametros: TMenuItem;
    mnuConfigBarradeStatus: TMenuItem;
    mnuConsulta: TMenuItem;
    MudarEmpresa1: TMenuItem;
    Usuarios1: TMenuItem;
    Grupos1: TMenuItem;
    Alterarsenha1: TMenuItem;
    MnuSep6_padrao: TMenuItem;
    Dock97Top: TDock97;
    tb97Atalho: TToolbar97;
    sbtnHelp: TToolbarButton97;
    sbtnSair: TToolbarButton97;
    sbtnFluxOper: TToolbarButton97;
    ToolBarsep973: TToolbarSep97;
    mnuFluxOper: TMenuItem;
    MnuSep7_padrao: TMenuItem;
    Montar1: TMenuItem;
    Executar1: TMenuItem;
    BarradeAtalhos1: TMenuItem;
    tb97FluxOper: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    sbtnMudaEmpresa: TToolbarButton97;
    Relatorios1: TMenuItem;
    Grficos2: TMenuItem;
    Panel2: TPanel;
    tb97btnAnterior: TToolbarButton97;
    tb97btnSeguinte: TToolbarButton97;
    tb97btnCancelar: TToolbarButton97;
    dblkFluxOper: TwwDBLookupCombo;
    wwDBEdit3: TwwDBEdit;
    pnldbEditFluxo: TPanel;
    wwDBEdit1: TwwDBEdit;
    Histricodealteraes1: TMenuItem;
    mnuIdiomas: TMenuItem;
    IvDicionario: TIvBinaryDictionary;
    sbtnListaMensagens: TToolbarButton97;
    sepCM2: TToolbarSep97;
    sbtnEnviaMensagens: TToolbarButton97;
    mnuListaMensagens: TMenuItem;
    mnuEnviaMensagem: TMenuItem;
    fcLabel2: TfcLabel;
    mnuRAD: TMenuItem;
    mnuRadPendente: TMenuItem;
    mnuRADConsultar: TMenuItem;
    mnuRADExecutar: TMenuItem;
    mnuAtuObjetos: TMenuItem;
    btnExecEtapa: TToolbarButton97;
    mnuEtapasPendentes: TMenuItem;
    MnuSep2_padrao: TMenuItem;
    MnuSep4_padrao: TMenuItem;
    MnuConfigRelatCM: TMenuItem;
    SbtLogin_Padrao: TToolbarButton97;
    mnuGerarProcesso_Padrao: TMenuItem;
    MnuConsPart_Padrao: TMenuItem;
    MnuConsultasGerais_Padrao: TMenuItem;
    ImlCaixa_Padrao: TImage;
    ImlPadrao: TImageList;
    stbarStatusBar: TfcStatusBar;
    AclPadrao: TActionList;
    EditCopy1: TEditCopy;
    Edit1: TMenuItem;
    MnuCopy_Padrao: TMenuItem;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    MnuCut_Padrao: TMenuItem;
    Mnupaste_Padrao: TMenuItem;
    MnuDel_Padrao: TMenuItem;
    MnuSelAll_Padrao: TMenuItem;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    ActLogin: TAction;
    ActSair: TAction;
    ActExecEtapa: TAction;
    ActFluxOper: TAction;
    ActMudaEmpresa: TAction;
    ActListaMens: TAction;
    ActEnviaMens: TAction;
    MnuSep3_padrao: TMenuItem;
    MnuSep1_padrao: TMenuItem;
    AppPadrao: TCMApplicationEvents;
    Mnu_separa1_Padrao: TMenuItem;
    Mnu_UsoPessoal_Padrao: TMenuItem;
    Mnu_Desfazer_Padrao: TMenuItem;
    MnuLogdeOperaes_Padrao: TMenuItem;
    Skt: TSocketConnection;
    Dcom: TDCOMConnection;
    Web: TWebConnection;
    CorreioCM: TCorreioCM;
    ResourceManager: TCMResourceManager;
    actHelpTopicSearch: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Alterarsenha1Click(Sender: TObject);
    procedure Montar1Click(Sender: TObject);
    procedure mnuConfigBarradeStatusClick(Sender: TObject);
    procedure BarradeAtalhos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tb97FluxOperVisibleChanged(Sender: TObject);
    procedure tb97FluxOperDockChanged(Sender: TObject);
    procedure tb97btnCancelarClick(Sender: TObject);
    procedure tb97btnSeguinteClick(Sender: TObject);
    procedure tb97FluxOperDockChanging(Sender: TObject);
    procedure tb97btnAnteriorClick(Sender: TObject);
    procedure mnuAjudaSobreClick(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure Histricodealteraes1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MnuConfigRelatCMClick(Sender: TObject);
    procedure Grficos2Click(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure MnuConsultasGerais_PadraoClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure ActFluxOperExecute(Sender: TObject);
    procedure ActMudaEmpresaExecute(Sender: TObject);
    procedure ActListaMensExecute(Sender: TObject);
    procedure ActEnviaMensExecute(Sender: TObject);
    procedure AppPadraoActivate(Sender: TObject);
    procedure AppPadraoException(Sender: TObject; E: Exception);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Mnu_UsoPessoal_PadraoClick(Sender: TObject);
    procedure MnuLogdeOperaes_PadraoClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure actHelpTopicSearchExecute(Sender: TObject);

   private

       MostraEmpresa, FPrimeiraVez : boolean;
       bReportsCreate :Boolean;
       // início - andre tavares - pendência 16830 - 14/10/2004
       hMapping : hwnd;
       // fim - andre tavares - pendência 16830 - 14/10/2004


       //DAVID - Pendência 17468
       //Variável para leitura de help no padrão CHM
       FPopupXY : TPoint;


       procedure MostraUsuEmpresa;
       procedure IdiomasClick(Sender: TObject);
       procedure MudaIdioma( Index : integer);
       procedure SetDesenhoRpt;
       procedure CloseAppServer;

       //DAVID - Pendência 16191
       //Função para exibir mensagens dos CtrlObjects.
       procedure MsgCtrl( sTxt : string );


       //DAVID - Pendência 17468
       //Função de leitura do help no formato CHM
       function OnCMHelp( Command: Word; Data: Longint; var CallHelp: Boolean ) : Boolean;

   protected
      bExibeParamReportDefault: Boolean;

      FrmPreviewReports: TfrmParamReports_Padrao;


      function ShowReport(IdReports: Integer; CtrlReports: TCmCtrlReports): Boolean;
      function ConfigReport(liIdReports, liOrigemCm: Integer; CtrlReports: TCmCtrlReports; DesReport: TObject): Boolean;

   public
     Procedure Logar( var msg: TMessage ); Message WM_LOGAR;
   end;


var
  frmCMPrincipal: TfrmCMPrincipal;
  cOpcaoUsrGrp: String;

implementation

{$R *.DFM}

uses USistema, UMensErro, cmFluxOper, DBaseDados, dAutorizacao,
     fMostraRelat, fAguarde, fCMEntrada,  FHistAlt, fMTProcPend, fMTAcompProc,
     fMTExecEtapa, fMTAtuObjRAD, fConfigRelatCM, dReports, fMostraGraf, fMTgeraProc,
     fMostraConsultas, uUsoPessoal, uCtrlRad, FUserManager, fConsLogOpcao, uCtrlParamIntegra,
     uCtrlPadroes, uCmRptManager, uCtrlMensagemCM, fCadFluxOperMT, uCMFileUtils,
     uFuncaoGeral, uDiasUteis;

Procedure TfrmCMPrincipal.Logar( var msg: TMessage );
begin
  ActLoginExecute( Nil );
End;

procedure TfrmCMPrincipal.mnuAjudaSobreClick(Sender: TObject);
begin
  inherited;
  with TfrmCMEntrada.Create(Application) do
  begin
       MostraBotao;
       ShowModal;
       free;
  end;
end;

procedure TfrmCMPrincipal.FormCreate(Sender: TObject);
var
   i : integer;
   NewItem : TMenuItem;
   bCriouFileMapping : Boolean;
   sArqHelp : string;
begin
   inherited;

   Try
   // inicio - andre tavares - pendência 16830 - 14/10/2004
     bCriouFileMapping := false;
     With TCmRegister.Create Do
     Try
       if LerNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_INSTANCIAS,0) = 0 then
       begin
         hMapping := CreateFileMapping(HWND($ffffffff), nil, PAGE_READONLY, 0, 32, LPSTR( '_CM' + intToStr(sistema.idmodulo) ));
         bCriouFileMapping := true;
         if (hMapping <> NULL) and (GetLastError = ERROR_ALREADY_EXISTS) then
         begin
           showMessage('Não é permitida a execução de mais de uma instância desta aplicação');
           CloseHandle(hMapping);
           ExitProcess(1);
         end;
       end;
     finally
       Free;
     End;
   // fim - andre tavares - pendência 16830 - 14/10/2004


     FrmPreviewReports := nil;
     bExibeParamReportDefault := True;

     bReportsCreate := False;

     ImlCaixa_Padrao.Visible := Not Sistema.LogoCM;
     fcLabel2.Visible := Sistema.LogoCM;

     // 18/03/04 Alex 16190 - este código foi escrito no create no FCMEntrada
     //Caption := Sistema.NomeAplicativo + ' v' + Sistema.Versao;
     {ResourceManager.ExeName := Application.EXEName;
     ResourceManager.ObterVersao;
     Sistema.Versao := ResourceManager.Versao; }
     Caption := Sistema.NomeAplicativo + ' v' + Sistema.Versao;
     // 18/03/04 Alex 16190

     If FileExists(Copy(Application.ExeName,1,Pos('.EXE', UpperCase(Application.ExeName)) - 1) +'.mld') then
        IvDicionario.FileName := Copy(Application.ExeName,1,Pos('.EXE', UpperCase(Application.ExeName)) - 1) +'.mld'
     Else
        IvDicionario.FileName := ExtractFilePath(Application.ExeName)+'CMTraduz.mld';

     for i := 1 to IvDicionario.LanguageCount-1 do
     begin
          NewItem := TMenuItem.Create(self);
          NewItem.name := 'mnuIv'+IvDicionario.Languages[i].EnglishName;
          NewItem.Caption := AnsiLowerCase(IvDicionario.Languages[i].NativeName);
          Newitem.Tag := i;
          NewItem.OnClick := IdiomasClick;
          mnuIdiomas.Add(NewItem);
     end;

     MudaIdioma(Sistema.IdiomaAtivo);

     Application.CreateForm(TdtmBaseDados, dtmBaseDados);
     Application.CreateForm(TdtmAutorizacao, dtmAutorizacao);

     {** Incializa a instância da classe de control do padrão de acordo com os
         parâmetros de conexão.
     **}

     {**
       Inicializa os Parâmetros do Global, Contas a Pagar, Contas a Receber,
       Contabilidade e financeiro
     **}
     Padroes := TCtrlPadroes.Create;
     ParamIntegra := TCtrlParamIntegra.Create;
     MensagemCM := TCtrlMensagemCM.Create;
     FuncaoGeral := TFuncaoGeral.Create;
     DiasUteis := TDiasUteis.Create;


     //Sistema.RemoteServer := dtmBaseDados.skt;
     Sistema.AppRemoteServer := Skt;

     If (Sistema.ConnectionSide = CnsClient) Then
     Begin
         {Configuração e Conexão da aplicação servidora do padrão}
         {**
         If Not Sistema.RemoteServer.Connected Then
         Begin
            Case Sistema.MidleWareConnection of
              mwcSocket:
              Begin
                dtmBaseDados.skt.Host := Copy(Sistema.SocketHost,1,Pos(':',Sistema.SocketHost) - 1);

                If Trim(dtmBaseDados.skt.Host) = '' Then dtmBaseDados.skt.Host := Sistema.SocketHost;

                dtmBaseDados.skt.Port := StrToIntDef(Copy(Sistema.SocketHost,Pos(':',Sistema.SocketHost) + 1, Length(Sistema.SocketHost)),211);
                Sistema.RemoteServer := dtmBaseDados.skt;
                TSocketConnection(Sistema.RemoteServer).Connected := True;
              End;
              mwcDCOM:
              Begin
                dtmBaseDados.DCom.ComputerName := Sistema.DcomComputerName;
                Sistema.RemoteServer := dtmBaseDados.DCom;
                TDCOMConnection(Sistema.RemoteServer).Connected := True;
              End;
              mwcWEB:
              Begin
                dtmBaseDados.Web.URL := Sistema.WebUrl;
                Sistema.RemoteServer := dtmBaseDados.Web;
                TWebConnection(Sistema.RemoteServer).Connected := True;
              End;
            End;
         End;
         **}

         {Configuração e Conexão da aplicação servidora do sistema}
         If Not Sistema.AppRemoteServer.Connected Then
         Begin
            Case Sistema.MidleWareConnection of
              mwcSocket:
              Begin
                Skt.Host := Copy(Sistema.SocketHost,1,Pos(':',Sistema.SocketHost) - 1);

                If Trim(skt.Host) = '' Then skt.Host := Sistema.SocketHost;

                skt.Port := StrToIntDef(Copy(Sistema.SocketHost,Pos(':',Sistema.SocketHost) + 1, Length(Sistema.SocketHost)),211);
                Sistema.AppRemoteServer := Skt;
                TSocketConnection(Sistema.AppRemoteServer).Connected := True;
              End;
              mwcDCOM:
              Begin
                DCom.ComputerName := Sistema.DcomComputerName;
                Sistema.AppRemoteServer := DCom;
                TDCOMConnection(Sistema.AppRemoteServer).Connected := True;
              End;
              mwcWEB:
              Begin
                Web.URL := Sistema.WebUrl;
                Sistema.AppRemoteServer := Web;
                TWebConnection(Sistema.AppRemoteServer).Connected := True;
              End;
            End;
         End;
     End;

     Padroes.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
     {**}

     Sistema.SetParametrosSeguranca;

     MostraEmpresa := true;
     FPrimeiraVez := true;
     Top := 0;
     Left := 0;
     WindowState := wsMaximized;

     //DAVID - Pendência 17468
     //Sobrescreve rotina padrão de help para que os sistemas possam ler CHM
     Application.OnHelp   := OnCMHelp;

     //DAVID - Pendência 17468
     //Se o arquivo de help no padrão CHM for encontrado, utiliza-o
     sArqHelp := ExtractFilePath( Application.ExeName ) + '..\HELP\' + Copy( ExtractFileName( Application.ExeName ), 1, Length( ExtractFileName( Application.ExeName ) ) - 3 );
     if FileExists( sArqHelp + 'chm' ) then
       Application.HelpFile := sArqHelp + 'chm'
     else
       Application.HelpFile := sArqHelp + 'hlp';

     Autorizacao.AfterLogin := AppPadrao.AfterLogin;

     Mnu_UsoPessoal_Padrao.Visible := TUsoPessoal.ExisteRh;
     Mnu_separa1_Padrao.Visible := Mnu_UsoPessoal_Padrao.Visible;
     MnuLogdeOperaes_Padrao.Visible := Sistema.UsaLogOperacoes;

     If Mnu_UsoPessoal_Padrao.Visible Then
        UsoPessoal := TUsoPessoal.Create;

   Except
     On E:Exception Do
     Begin
        Application.MessageBox(Pchar(E.Message),'Atenção',Mb_IconStop);
        CloseAppServer;
        // inicio - andre tavares - pendência 16830 - 14/10/2004
        if (bCriouFileMapping) and (hMapping <> NULL) then
          CloseHandle(hMapping);
        // fim - andre tavares - pendência 16830 - 14/10/2004
        Application.Terminate;
     end;
   end;


end;

procedure TfrmCMPrincipal.FormPaint(Sender: TObject);
begin
  inherited;
  MHeight := Self.ClientHeight - Dock97Top.Height - 19;//CStatusBar.Height;
  MWidth  := Self.ClientWidth;
end;

procedure TfrmCMPrincipal.Alterarsenha1Click(Sender: TObject);
begin
  inherited;
  Autorizacao.MudarSenha;
end;

procedure TfrmCMPrincipal.Montar1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadFluxOperMT, TfrmCadFluxOperMT, false);
end;

procedure TfrmCMPrincipal.mnuConfigBarradeStatusClick(Sender: TObject);
begin
  inherited;
  stbarStatusBar.Visible := not stbarStatusBar.Visible;
  mnuConfigBarradeStatus.Checked := stbarStatusBar.Visible;
end;

procedure TfrmCMPrincipal.BarradeAtalhos1Click(Sender: TObject);
begin
  inherited;
  tb97Atalho.Visible := not tb97Atalho.Visible;
  BarradeAtalhos1.Checked := tb97Atalho.Visible;
end;

procedure TfrmCMPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Sistema.UsuarioUnico then Sistema.AtualizaCMUserID(2,-1);

  CloseAppServer;

  inherited;

  If Mnu_UsoPessoal_Padrao.Visible Then UsoPessoal.Free;

  ParamIntegra.Free;
  MensagemCM.Free;
  FuncaoGeral.Free;
  DiasUteis.Free;
  Padroes.Free;

  //DAVID - Pendência 17468
  //Se o help estiver aberto, fecha-o
  if HelpChecked then
    HtmlHelp( Application.Handle, nil, HH_CLOSE_ALL, 0 );

  Application.Terminate;
end;

procedure TfrmCMPrincipal.tb97FluxOperVisibleChanged(Sender: TObject);
begin
  inherited;
  FluxOper.MudaVisivel;
end;

procedure TfrmCMPrincipal.tb97FluxOperDockChanged(Sender: TObject);
begin
  inherited;
  FluxOper.MudouDock;
end;

procedure TfrmCMPrincipal.tb97btnCancelarClick(Sender: TObject);
begin
  inherited;
  FluxOper.Cancelar;
end;

procedure TfrmCMPrincipal.tb97btnSeguinteClick(Sender: TObject);
begin
  inherited;
  tb97btnSeguinte.down := true;
  FluxOper.Proximo := false;
  Autorizacao.FecharForms;
  FluxOper.Proximo := true;
  FluxOper.Seguinte;
end;

procedure TfrmCMPrincipal.tb97FluxOperDockChanging(Sender: TObject);
begin
  inherited;
  FluxOper.Salva;
end;

procedure TfrmCMPrincipal.tb97btnAnteriorClick(Sender: TObject);
begin
  inherited;
  FluxOper.Anterior;
end;

procedure TfrmCMPrincipal.MostraUsuEmpresa;
begin
  with stbarStatusBar do
  begin
       SimplePanel := false;
       panels[0].Text := Sistema.NomeEmpresa;
       panels[1].Text := Sistema.NomeUsuario;
  end;
end;

procedure TfrmCMPrincipal.Relatorios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMostraRelat,TfrmMostraRelat, false);
end;

procedure TfrmCMPrincipal.Histricodealteraes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmHistAltera,TfrmHistAltera, false);
end;

procedure TfrmCMPrincipal.IdiomasClick(Sender: TObject);
begin
  inherited;
  MudaIdioma(TMenuItem(Sender).tag);
end;

procedure TfrmCMPrincipal.MudaIdioma( Index : integer);
var i : integer;
begin
  if Index < IvDicionario.LanguageCount then
  begin
       IvDicionario.Language := Index;
       Sistema.IdiomaAtivo := Index;
       for i := 0 to mnuIdiomas.Count-1 do
           mnuIdiomas.Items[i].Checked := false;
       mnuIdiomas.Items[Index-1].Checked := true;

       ivTradutor.Translate;
  end;
end;

procedure TfrmCMPrincipal.FormResize(Sender: TObject);
begin
  inherited;
  If Sistema.LogoCM Then
     fcLabel2.Left := Dock97Top.Width-fcLabel2.Width-10
  Else
     ImlCaixa_Padrao.Left := Dock97Top.Width-ImlCaixa_Padrao.Width-10;
end;

procedure TfrmCMPrincipal.MnuConfigRelatCMClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigRelatCM,TFrmConfigRelatCM,False);
end;

procedure TfrmCMPrincipal.SetDesenhoRpt;
Var
  dtm :TdtmReports;
  rpt :TppReport;
  aRptStream :TMemoryStream;
begin
  inherited;
  If Sistema.LoadOldReport Then
  Begin
    aRptStream := TMemoryStream.Create;
    Try

       If DtmAutorizacao.CdsLoadReports.Active Then DtmAutorizacao.CdsLoadReports.Close;

       DtmAutorizacao.SQLLoadReports.Prepare;
       DtmAutorizacao.SQLLoadReports.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
       DtmAutorizacao.SQLLoadReports.ParamByName('IDPESSOA').AsInteger :=  Sistema.IdEmpresa;
       DtmAutorizacao.SQLLoadReports.Open;

       FrmAguarde.Min     := 0;
       FrmAguarde.Pos     := 0;
       FrmAguarde.Max     := DtmAutorizacao.CdsLoadReports.RecordCount;
       FrmAguarde.Caption := 'Atualizando Relatórios... Aguarde...';

       DtmAutorizacao.CdsLoadReports.First;

       If FrmAguarde.Max > 0 Then
          FrmAguarde.Mostra(DtmAutorizacao.CdsLoadReports.FieldByName('DESCRICAO').AsString);

       while Not DtmAutorizacao.CdsLoadReports.Eof Do
       Begin
         If DtmAutorizacao.CdsModeloReports.Active Then DtmAutorizacao.CdsModeloReports.Close;

         DtmAutorizacao.SQLModeloReports.Prepare;
         DtmAutorizacao.SQLModeloReports.ParamByname('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
         DtmAutorizacao.SQLModeloReports.ParamByname('ORIGEMCM').AsInteger  := DtmAutorizacao.CdsLoadReports.FieldByName('ORIGEMCM').AsInteger;
         DtmAutorizacao.SQLModeloReports.ParamByname('IDREPORTS').AsInteger := DtmAutorizacao.CdsLoadReports.FieldByName('IDREPORTS').AsInteger;
         DtmAutorizacao.SQLModeloReports.Open;

         If Not DtmAutorizacao.CdsModeloReports.FieldByName('TEMPLATE').IsNull Then
         Begin
            dtm := TdtmReports(Application.FindComponent(DtmAutorizacao.CdsLoadReports.FieldByName('FORMEVENTOS').AsString));
            If dtm <> nil Then
            Begin
               rpt := TppReport(dtm.FindComponent(DtmAutorizacao.CdsLoadReports.FieldByName('PPREPORT').AsString));
               If rpt <> nil Then
               Begin
                 rpt.Template.SaveTo   := stFile;
                 rpt.Template.Format   := ftASCII;

                 aRptStream.Clear;
                 TBlobField(DtmAutorizacao.CdsModeloReports.FieldByName('TEMPLATE')).SaveToStream(aRptStream);

                 aRptStream.Position := 0;
                 rpt.Template.LoadFromStream(aRptStream);
               End;
            End;
         End;
         DtmAutorizacao.CdsLoadReports.Next;
         FrmAguarde.Mostra(DtmAutorizacao.CdsLoadReports.FieldByName('DESCRICAO').AsString);
         FrmAguarde.Pos := FrmAguarde.Pos + 1;
       End;
    finally
      FrmAguarde.Caption := 'Aguarde...';
      FrmAguarde.Apaga;
      DtmAutorizacao.CdsModeloReports.Close;
      DtmAutorizacao.CdsLoadReports.Close;
      aRptStream.Clear;
      aRptStream.Free;
    End;
  End;
end;

procedure TfrmCMPrincipal.Grficos2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMostraGraf,TfrmMostraGraf,False);
end;

procedure TfrmCMPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  inherited;
  {if (MontaSelectPart_Padrao.Executar = MrOk) then
  begin
    // Consulta Participante
    ConsPart_Padrao.sIdPessoa    := MontaSelectPart_Padrao.ValoresChave[0];
    ConsPart_Padrao.sIdPessjur   := MontaSelectPart_Padrao.ValoresChave[1];
    ConsPart_Padrao.sIdPlanoprev := MontaSelectPart_Padrao.ValoresChave[2];
    ConsPart_Padrao.sSeqProposta := MontaSelectPart_Padrao.ValoresChave[6];

    ConsPart_Padrao.MostraConsulta;
  end;}
end;

procedure TfrmCMPrincipal.MnuConsultasGerais_PadraoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMostraConsultas,TfrmMostraConsultas,False);
end;

procedure TfrmCMPrincipal.ActLoginExecute(Sender: TObject);
begin
  inherited;
  if not Autorizacao.Login then Close;
end;

procedure TfrmCMPrincipal.ActSairExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCMPrincipal.ActFluxOperExecute(Sender: TObject);
begin
  inherited;
  FluxOper.Setup;
  tb97FluxOper.Visible := true;
end;

procedure TfrmCMPrincipal.ActMudaEmpresaExecute(Sender: TObject);
begin
  inherited;
  Autorizacao.PedirEmpresa;

  Autorizacao.AutorizarForm(Self, afNormal);

  AppPadrao.AfterLogin(Self);
end;

procedure TfrmCMPrincipal.ActListaMensExecute(Sender: TObject);
begin
  inherited;
  CorreioCm.ListaMensagens;
end;

procedure TfrmCMPrincipal.ActEnviaMensExecute(Sender: TObject);
begin
  inherited;
  CorreioCM.EnviaMensagens;
end;

procedure TfrmCMPrincipal.AppPadraoActivate(Sender: TObject);
begin
  inherited;
  if FPrimeiraVez then
  begin
       FPrimeiraVez := false;

       SendToBack;

       if (Sistema.PedeLogin) then
          if not Autorizacao.Login then close;

       if not Sistema.VersaoOk then close;
  end;
end;

procedure TfrmCMPrincipal.AppPadraoException(Sender: TObject;
  E: Exception);
begin
  inherited;
  MostrarErro(E);
end;

procedure TfrmCMPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  if Sistema.FezLogin then
  begin
      {** Parâmetros da Aplicação Servidora - Início **}
      If Sistema.MudouUsuario Or
         Sistema.MudouEmpresa Then
      Begin
         Padroes.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
         ParamIntegra.InitializeAs(Padroes);
         MensagemCM.InitializeAs(Padroes);
         FuncaoGeral.InitializeAs(Padroes);
         DiasUteis.InitializeAs(Padroes);         
      End;

      {** Parâmetros da Aplicação Servidora - Fim **}

      If Mnu_UsoPessoal_Padrao.Visible Then Mnu_UsoPessoal_Padrao.Enabled := True;

      If Not bReportsCreate Then AppPadrao.CreateFormReports;

      mnuRAD.Visible := Sistema.UsaRad;
      btnExecEtapa.Visible := Sistema.UsaRad;

      Try
        If Sistema.UsaRad Then
        Begin
           With TCtrlRad.Create Do
             Try
               //DAVID - Pendência 16191
               //Inicializado em separado para prover exibição de mensagens do RAD.
               //InitializeAs(Padroes);
               Initialize( dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgCtrl );

               InfoNumProcPend(Sistema.IdUsuario);
             finally
               Free;
             End;
        End;
      finally

      End;

      MostraUsuEmpresa;

      CorreioCm.IdDestinatario := Sistema.IdUsuario;
      if CorreioCm.TemMensagemNova then CorreioCm.ListaMensagens;

      SetDesenhoRpt;

      MnuConsPart_Padrao.Visible := (Sistema.TipoEmpresa = 'P');

      If Sistema.NomeUsuario = 'SUPER' Then Begin
         If Not Sistema.SenhaAlteraSuper Then
            Alterarsenha1.Enabled := False
      End Else
         If Not Autorizacao.PodeMudarSenha Then
            Alterarsenha1.Enabled := False;

  End;
end;

procedure TfrmCMPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  bReportsCreate := True;
end;

procedure TfrmCMPrincipal.Usuarios1Click(Sender: TObject);
begin
  inherited;
  cOpcaoUsrGrp := 'U';
  AbrirForm(FrmUserManager, TFrmUserManager, False);
end;

procedure TfrmCMPrincipal.Grupos1Click(Sender: TObject);
begin
  inherited;
  cOpcaoUsrGrp := 'G';
  AbrirForm(FrmUserManager, TFrmUserManager, false);
end;

procedure TfrmCMPrincipal.Mnu_UsoPessoal_PadraoClick(Sender: TObject);
begin
  inherited;
  UsoPessoal.ChavePessoa := 0;
  UsoPessoal.Execute;
end;

procedure TfrmCMPrincipal.MnuLogdeOperaes_PadraoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsLogOpcao, TfrmConsLogOpcao, False);
end;

procedure TfrmCMPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  inherited;

  If FrmPreviewReports = nil Then
     PrintReport := True
  Else
  Begin
    Try
       bExibeParamReportDefault := False;

       PrintReport := (FrmPreviewReports.ShowModal = MrOk);

       If PrintReport Then
          sParams := FrmPreviewReports.Cmp_Padrao.GetParams;

       FrmPreviewReports.Free;
    except
       FrmPreviewReports.Free;
       Raise;
    end;
  End;
end;

function TfrmCMPrincipal.ShowReport(IdReports: Integer;
  CtrlReports: TCmCtrlReports): Boolean;

  function ShowParamReportPadrao: Boolean;
  Var
    sParams: String;
    bPrintReport: Boolean;
  Begin
    bExibeParamReportDefault := True;

    sParams := '';
    bPrintReport := True;

    If Assigned(AppPadrao.OnShowParamReportPadrao) Then
    Begin
       AppPadrao.OnShowParamReportPadrao(AppPadrao, IdReports, sParams, bPrintReport);

       If bPrintReport Then CtrlReports.Params := sParams;
    End;

    Result := bPrintReport;
  End;

begin
  CtrlReports.IdReport := IdReports;

  If CtrlReports.ReportExists Then
  Begin
     Result := True;

     If ShowParamReportPadrao Then
        With CtrlReports Do
        Begin
          initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil, nil, False);

          Devicetype := rdtScreen;
          IdEmpresa := Sistema.IdEmpresa;
          IdUsuario := Sistema.IdUsuario;
          IdModulo := Sistema.IdModulo;
          NomeEmpresa := Sistema.NomeEmpresa;
          NomeModulo := Sistema.NomeModulo;
          ShowCancelDialog := True;
          ShowPrintDialog := True;
          GeraHtmlFormParam := False;
          ExibeMensagem := True;

          ExibeFormParams := bExibeParamReportDefault;

          If (Not CtrlReports.ShowReport) Then
             If ExceptionRaised Then Raise Exception.Create(MessageInfo);
        End;
  End
  Else
    Result := False;
end;

procedure TfrmCMPrincipal.CloseAppServer;
Begin

  Try
    If (Sistema.ConnectionSide = CnsClient) Then
    Begin
       {**
       If Assigned(Sistema.RemoteServer) Then
          Case Sistema.MidleWareConnection of
            mwcSocket:
              If TSocketConnection(Sistema.RemoteServer).Connected Then
                 TSocketConnection(Sistema.RemoteServer).Close;
            mwcDCOM:
              If TDCOMConnection(Sistema.RemoteServer).Connected Then
                 TDCOMConnection(Sistema.RemoteServer).Close;
            mwcWEB:
              If TWebConnection(Sistema.RemoteServer).Connected Then
                 TWebConnection(Sistema.RemoteServer).Close;
          End;
       **}

       If Assigned(Sistema.AppRemoteServer) Then
          Case Sistema.MidleWareConnection of
            mwcSocket:
              If TSocketConnection(Sistema.AppRemoteServer).Connected Then
                 TSocketConnection(Sistema.AppRemoteServer).Close;
            mwcDCOM:
              If TDCOMConnection(Sistema.AppRemoteServer).Connected Then
                 TDCOMConnection(Sistema.AppRemoteServer).Close;
            mwcWEB:
              If TWebConnection(Sistema.AppRemoteServer).Connected Then
                 TWebConnection(Sistema.AppRemoteServer).Close;
          End;
    End;
  Except

  End;
End;

function TfrmCMPrincipal.ConfigReport(liIdReports, liOrigemCm: Integer;
  CtrlReports: TCmCtrlReports; DesReport: TObject): Boolean;
begin
  CtrlReports.IdReport := liIdReports;

  Result := CtrlReports.ReportExists;

  If Result And
     (Not CtrlReports.ConfigReport(liIdReports, liOrigemCm, DesReport)) Then
        Raise Exception.Create(CtrlReports.MessageInfo);
end;


//DAVID - Pendência 16191
//Função para exibir mensagens dos CtrlObjects.
procedure TfrmCMPrincipal.MsgCtrl(sTxt: string);
begin
  ShowMessage( sTxt );
end;


function TfrmCMPrincipal.OnCMHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;

  if not FileExists( Application.HelpFile ) then
    raise Exception.Create( 'Não foi possível encontrar o arquivo de help "' + Application.HelpFile + '".' );

  case Command of
                  0 : begin
                        if Data = 0 then
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_TOPIC, 0)
                        else
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_HELP_CONTEXT , Data);
                      end;

                  4 : HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_TOPIC, 0);

                 11 : HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_INDEX, 0);



  HELP_KEY          : begin
                        if Data = 0 then
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_TOPIC, 0)
                        else
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_HELP_CONTEXT, Data);
                      end;

  HELP_CONTEXT      : HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_HELP_CONTEXT , Data);

  HELP_SETPOPUP_POS : FPopupXY := SmallPointToPoint(TSmallPoint(Data));

  HELP_CONTEXTPOPUP : begin
                        if Data = 0 then
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_TOPIC, 0)
                        else
                          HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_HELP_CONTEXT , Data);
                      end;

  HELP_CONTENTS     : if LowerCase( StrRight( Application.HelpFile, 3 ) ) = 'chm' then
                        HtmlHelp(Application.Handle, Pchar( Application.HelpFile ), HH_DISPLAY_TOPIC, 0)
                      else
                        ShellExecute( Handle, 'Open', PChar( Application.HelpFile ), nil, nil, sw_shownormal );
                        
  else
    CallHelp := True;
  end;

  Result := True;
end;


procedure TfrmCMPrincipal.actHelpTopicSearchExecute(Sender: TObject);
var
  bAux : boolean;
begin
  inherited;
  OnCMHelp( HELP_CONTENTS, 0, bAux );
end;

initialization
  Sistema := TSistema.Create;
  Autorizacao := TAutorizacao.Create;


finalization
  Autorizacao.free;
  Sistema.free;
  

end.

