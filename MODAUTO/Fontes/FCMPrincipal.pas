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
  fParamReports_Padrao, uCMTypes, uCmSqlParams, ppEndUsr;

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
    mnuAjudaComoUsar: TMenuItem;
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
    HelpOnHelp1: THelpOnHelp;
    HelpTopicSearch1: THelpTopicSearch;
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
    procedure mnuRadPendenteClick(Sender: TObject);
    procedure mnuRADConsultarClick(Sender: TObject);
    procedure mnuAtuObjetosClick(Sender: TObject);
    procedure mnuEtapasPendentesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MnuConfigRelatCMClick(Sender: TObject);
    procedure Grficos2Click(Sender: TObject);
    procedure mnuGerarProcesso_PadraoClick(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure MnuConsultasGerais_PadraoClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure ActExecEtapaExecute(Sender: TObject);
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

   private
       bReportsCreate :Boolean;
       MostraEmpresa, FPrimeiraVez : boolean;
       procedure MostraUsuEmpresa;
       procedure IdiomasClick(Sender: TObject);
       procedure MudaIdioma( Index : integer);
       procedure SetDesenhoRpt;
       procedure CloseAppServer;
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
begin
   inherited;

   Try
     FrmPreviewReports := nil;
     bExibeParamReportDefault := True;

     bReportsCreate := False;

     ImlCaixa_Padrao.Visible := Not Sistema.LogoCM;
     fcLabel2.Visible := Sistema.LogoCM;

     Caption := Sistema.NomeAplicativo + ' v' + Sistema.Versao;

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
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
     {**}

     Sistema.SetParametrosSeguranca;

     MostraEmpresa := true;
     FPrimeiraVez := true;
     Top := 0;
     Left := 0;
     WindowState := wsMaximized;
     Application.HelpFile := ExtractFilePath(Application.ExeName)+'..\HELP\'+Copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName))-3)+'hlp';
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

procedure TfrmCMPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseAppServer;

  inherited;

  If Mnu_UsoPessoal_Padrao.Visible Then UsoPessoal.Free;

  ParamIntegra.Free;
  MensagemCM.Free;
  FuncaoGeral.Free;
  DiasUteis.Free;
  Padroes.Free;

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

procedure TfrmCMPrincipal.mnuRadPendenteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTProcPend, TfrmMTProcPend, false);
end;

procedure TfrmCMPrincipal.mnuRADConsultarClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmMTAcompProc, TfrmMTAcompProc);
end;

procedure TfrmCMPrincipal.mnuAtuObjetosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTAtuObjRad,TfrmMTAtuObjRad, false);
end;

procedure TfrmCMPrincipal.mnuEtapasPendentesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTExecEtapa,TfrmMTExecEtapa, false);
  frmMTExecEtapa.MostraEtapasPend(true);
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

procedure TfrmCMPrincipal.mnuGerarProcesso_PadraoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTgeraProc,TfrmMTgeraProc,False);
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

procedure TfrmCMPrincipal.ActExecEtapaExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTExecEtapa,TfrmMTExecEtapa, false);
  frmMTExecEtapa.MostraEtapasPend(false);
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
               InitializeAs(Padroes);
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

initialization
   Sistema := TSistema.Create;
   Autorizacao := TAutorizacao.Create;
finalization
   Autorizacao.free;
   Sistema.free;
end.

