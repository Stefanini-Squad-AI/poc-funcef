unit FPrincipal;

(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 13/09/2000
 - 14/10/2000  Alterações nos menus Cadastros\RUBS;
               Implementação do Relacionamento Termos X Benefícios
 André Tavares - 29/09/2003 - pendência 15116
 André Tavares - 30/11/2003 - pendência 15701

*******************************************************************************)

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Menus, Wwintl, ExtCtrls, Buttons,  ComCtrls, FCMPrincipal, TB97,
   Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
   DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
   IvMulti, IvEMulti, CorreioCM, UDataBase, fcLabel, fcOutlookList,
   fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
   ftelaAut, uMensErro, uRubs, AppEvnts, CMApplicationEvents, StdActns,
   ActnList, ImgList, fcStatusBar, MontaSelect, UConsPart, FcpuAtend,
   SConnect, MConnect, DBClient, Grids, DBGrids, umoduloCap, fPreview, uIntegraEP,
   uCmCtrlRptCentralAP, FPRel2ViaCChequeMT, uCmTypes, fPRelHisFuncionalMT, fAguarde,
   FCadGrupoProtocolo, dRelInscricao, uResource, DRubs, CMNetUsers, FExtratoINSS;

type
   TfrmPrincipal = class(TfrmCMPrincipal)
      Atendimento1: TMenuItem;
      Assunto1: TMenuItem;
      FormadeAtendimento1: TMenuItem;
      EstatsticadeAtendimentos1: TMenuItem;
      Atendimentos1: TMenuItem;
      Previdencirio1: TMenuItem;
      Assistencial1: TMenuItem;
      Emprstimo1: TMenuItem;
      FolhadePagamento1: TMenuItem;
      Inscrio1: TMenuItem;
      Contrato1: TMenuItem;
      N5: TMenuItem;
      SimulaodeParcelas1: TMenuItem;
      Inscrio2: TMenuItem;
      N6: TMenuItem;
      ContribuiesdoParticipante1: TMenuItem;
      ConsultadeEventos1: TMenuItem;
      EstimativadeContribuies1: TMenuItem;
      N7: TMenuItem;
      RelatriodePartcicpantesAssistenciais1: TMenuItem;
      N8: TMenuItem;
      ConsultadeContribuiesdoParticipante1: TMenuItem;
      EstimativadeBenefcios1: TMenuItem;
      ConsultadeBenefciosdoParticipante1: TMenuItem;
      N9: TMenuItem;
      ContraCheque1: TMenuItem;
      EstatsticadeMassa1: TMenuItem;
      N10: TMenuItem;
      RelatriodeParticipantesemDbito1: TMenuItem;
      BeneficirioseContribuies1: TMenuItem;
      N11: TMenuItem;
      ConsultadeBenefcios1: TMenuItem;
      ConsultaderubricassalariaisdeAssistidos1: TMenuItem;
      Coonsultaderubricassalariais1: TMenuItem;
      EstatsticadeMassa2: TMenuItem;
      Inscrio3: TMenuItem;
      qry: TwwQuery;
      ConsultadeHistricodeMovimentaodeReservas1: TMenuItem;
      ExtratodeReservas1: TMenuItem;
      FormatodeDocumentosdaRUB1: TMenuItem;
      DocumentosporBenefcios1: TMenuItem;
      TiposdeRecebimentos1: TMenuItem;
      SituaodoBeneficionaRUB1: TMenuItem;
      BenefcioXSituao1: TMenuItem;
      N4: TMenuItem;
      N12: TMenuItem;
      Ca1: TMenuItem;
      CadastrodeDocumentos1: TMenuItem;
      N13: TMenuItem;
      BtnAtende: TToolbarButton97;
      ToolbarSep971: TToolbarSep97;
      TotalPrev1: TMenuItem;
      LocaisdeAtendimento1: TMenuItem;
      RespostasPadro1: TMenuItem;
      MnuGrupoAssunto: TMenuItem;
      MnuRubs: TMenuItem;
      MnuSep2: TMenuItem;
      MnuOperacoes: TMenuItem;
      MnuOperacoesRubs: TMenuItem;
      Manuteno1: TMenuItem;
      CartadeAviso1: TMenuItem;
      Configurao1: TMenuItem;
      Emisso2: TMenuItem;
      MnuConsRubs: TMenuItem;
      TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1: TMenuItem;
      N14: TMenuItem;
      N15: TMenuItem;
      ParmetrosdeEmisso1: TMenuItem;
      TemoXDocumento1: TMenuItem;
      f1: TMenuItem;
      N1: TMenuItem;
      Assunto2: TMenuItem;
      ComplementodoAssunto1: TMenuItem;
      Firio1: TMenuItem;
      Firio2: TMenuItem;
      DescriodoBenefcio1: TMenuItem;
      Recadastramento1: TMenuItem;
      InformedeRendimentosPF1: TMenuItem;
      Etiquetas1: TMenuItem;
      Configura1: TMenuItem;
      Imprime1: TMenuItem;
      MontaSelectPart: TMontaSelect;
      RecebimentoDocs1: TMenuItem;
      qryParamCentralAp: TwwQuery;
      qryParamCentralApFLGMUDALOCALATEND: TFloatField;
      qryParamCentralApFLGCONFIRMADATA: TFloatField;
      ConfiguraodoModelodeRUBS1: TMenuItem;
      SegundaViadeContraCheque1: TMenuItem;
      CPUdeAtendimento1: TMenuItem;
      AutoAtendimento1: TMenuItem;
      Alteraodesenhas1: TMenuItem;
      ActionList1: TActionList;
      ExtratodeMovimentodeReserva: TMenuItem;
      ExportaodeSenhas1: TMenuItem;
    mnExtratoIndividual: TMenuItem;
      procedure Assunto1Click(Sender: TObject);
      procedure FormadeAtendimento1Click(Sender: TObject);
      procedure EstatsticadeAtendimentos1Click(Sender: TObject);
      procedure Atendimentos1Click(Sender: TObject);
      procedure nmuConfigParametrosClick(Sender: TObject);
      procedure DocumentosporBenefcios1Click(Sender: TObject);
      procedure TiposdeRecebimentos1Click(Sender: TObject);
      procedure SituaodoBeneficionaRUB1Click(Sender: TObject);
      procedure BenefcioXSituao1Click(Sender: TObject);
      procedure Ca1Click(Sender: TObject);
      procedure CadastrodeDocumentos1Click(Sender: TObject);
      procedure Atendimento1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure LocaisdeAtendimento1Click(Sender: TObject);
      procedure RespostasPadro1Click(Sender: TObject);
      procedure FormatodeDocumentosdaRUB1Click(Sender: TObject);
      procedure MnuGrupoAssuntoClick(Sender: TObject);
      procedure Manuteno1Click(Sender: TObject);
      procedure Configurao1Click(Sender: TObject);
      procedure TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click(Sender: TObject);
      procedure MnuConsRubsClick(Sender: TObject);
      procedure ParmetrosdeEmisso1Click(Sender: TObject);
      procedure mnuCadastroClick(Sender: TObject);
      procedure AppPadraoAfterLogin(Sender: TObject);
      procedure AppPadraoCreateFormReports(Sender: TObject);
      procedure Assunto2Click(Sender: TObject);
      procedure ComplementodoAssunto1Click(Sender: TObject);
      procedure Firio1Click(Sender: TObject);
      procedure Firio2Click(Sender: TObject);
      procedure DescriodoBenefcio1Click(Sender: TObject);
      procedure MnuConsPart_PadraoClick(Sender: TObject);
      procedure AppPadraoActionUpdate(Action: TBasicAction; var Handled: Boolean);
      procedure Recadastramento1Click(Sender: TObject);
      procedure InformedeRendimentosPF1Click(Sender: TObject);
      procedure Configura1Click(Sender: TObject);
      procedure Imprime1Click(Sender: TObject);
      procedure RecebimentoDocs1Click(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure fcLabel2Click(Sender: TObject);
      procedure ConfiguraodoModelodeRUBS1Click(Sender: TObject);
      procedure SegundaViadeContraCheque1Click(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure CPUdeAtendimento1Click(Sender: TObject);
      procedure Alteraodesenhas1Click(Sender: TObject);
      procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
      procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer; var sParams: String; var PrintReport: Boolean);
      procedure AppPadraoIdle(Sender: TObject; var Done: Boolean);
      procedure ExtratodeMovimentodeReservaClick(Sender: TObject);
      procedure ExportaodeSenhas1Click(Sender: TObject);
    procedure mnExtratoIndividualClick(Sender: TObject);


   private  // Private declarations

      procedure CarregaParametros;


   public   // Public declarations

      procedure MudaCaptionFundacao(Sender: TObject);


   end;



var
   frmPrincipal   : TfrmPrincipal;
   ConsPart1      : TConsPart;
   IdCpuAtend     : Integer;
   NomeCpuAtend   : String[60];
   cComputerName  : Array [0..255] of Char;
   sComputerName  : String;



implementation
{$R *.DFM}
uses
   DBaseDados, uString, fCadAssunto,
   fformaatend, FGrafAtend, Fconsatend, FAtend,
   FCadRespostaPadrao, FDocxBenef, FCadRecebimento, FCadSitBenef,
   FBenefxSituacao, FCadServicos, FCadDocumentos, uSistema, uModulo,
   FCadModeloRub, fCadGrupoAssunto, fManutRubs, fConfigCartaAviso,
   uAtendimento, FTermosxBenef, ftermoxdoc1, dRelCentralAP,
   FCADCOMPASSUNTO, FMOVFIARIO, fconsultafiario,
   fbenefrubs, FParamCentralAP, FRubsRecad, FEmisEtiq, UEtiquetaCM,
   FRecebDocs, fFiltroRelaProtocolo, fMudaLocalAtend, fDataHora,
   fConfigRUBS, uIntegraBack, DRelEstatDetalhada, dEmptmo,
   uFuncoesEmptmo, fcadCpuAtend, fCadLocalAtend,
   dRelTempoServicoMT, dRel2ViaCChequeMT, FConfigRelatInformeMT,
   FParamRelMovReserva_EspFCRT, fCadWebAcesso, FExportacaoSenhas,
   dRelMovContr, uIntegraModulo;




procedure TfrmPrincipal.Assunto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAssunto, TfrmCadAssunto,false);
end;

procedure TfrmPrincipal.FormadeAtendimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(  frmformaatend , TfrmformaAtend , false );
end;

procedure TfrmPrincipal.EstatsticadeAtendimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm ( frmGrafAtend, TfrmGrafAtend, false );
end;

procedure TfrmPrincipal.Atendimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConsAtend, TfrmConsAtend, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCentralAP, TfrmParamCentralAP,false);
end;

procedure TfrmPrincipal.DocumentosporBenefcios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmDocxBenef, TFrmDocxBenef, false);
end;

procedure TfrmPrincipal.TiposdeRecebimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTpRecebXCancelamento, TFrmCadTpRecebXCancelamento, false);
end;

procedure TfrmPrincipal.SituaodoBeneficionaRUB1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadSitBenef, TFrmCadSitBenef, false);
end;

procedure TfrmPrincipal.BenefcioXSituao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBenefxSituacao, TFrmBenefxSituacao, false);
end;

procedure TfrmPrincipal.Ca1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadServicos, TFrmCadServicos, false);
end;

procedure TfrmPrincipal.CadastrodeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadDocumentos, TFrmCadDocumentos, false);
end;


procedure TfrmPrincipal.Atendimento1Click(Sender: TObject);
begin
  inherited;
  BtnAtende.refresh;
  If ModuloCap.IdLocaAtendxCpu = 0 Then
     MsgDlg('Este Computador não está autenticado para atendimento','Atenção',mtError,[mbOk],0)
  Else
  begin
// início - André Tavares - pendência 15116
    if BtnAtende.enabled then
      AbrirForm (frmAtend , TfrmAtend , false);
// fim - André Tavares - pendência 15116
  end;
  application.ProcessMessages;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Screen.OnActiveFormChange := MudaCaptionFundacao;
  Grficos2.visible := true;
  EstatsticadeAtendimentos1.visible := true;
end;

procedure TfrmPrincipal.LocaisdeAtendimento1Click(Sender: TObject);
begin
  inherited;

  AbrirForm (frmCadLocalAtend , TfrmCadLocalAtend , false);
end;

procedure TfrmPrincipal.RespostasPadro1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadRespostaPadrao , TFrmCadRespostaPadrao , false);
end;

procedure TfrmPrincipal.FormatodeDocumentosdaRUB1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadModeloRub , TFrmCadModeloRub , false);
end;

procedure TfrmPrincipal.MnuGrupoAssuntoClick(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadGrupoAssunto , TFrmCadGrupoAssunto , false);
end;

procedure TfrmPrincipal.Manuteno1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmManutRubs , TfrmManutRubs , false);
  frmManutRubs.HelpContext := 190004;  
  frmManutRubs.ConfiguraConsulta(False);
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmConfigCartaAviso , TfrmConfigCartaAviso , false);
  frmConfigCartaAviso.HelpContext := (Sender As TMenuItem).HelpContext;
  frmConfigCartaAviso.HabilitaImpressao((Sender As TMenuItem).Tag = 1);
end;

procedure TfrmPrincipal.TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm (FrmTermosxBenef , TFrmTermosxBenef , false);
end;

procedure TfrmPrincipal.MnuConsRubsClick(Sender: TObject);
begin
  inherited;
  AbrirForm (frmManutRubs , TfrmManutRubs , false);
  frmManutRubs.HelpContext := 190039;
  frmManutRubs.ConfiguraConsulta(True);
end;

procedure TfrmPrincipal.ParmetrosdeEmisso1Click(Sender: TObject);
begin
  inherited;
  Rubs.GetComplementosRUBS;
end;

procedure TfrmPrincipal.mnuCadastroClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  nsize :Cardinal;
  i : integer;
begin
  inherited;

//início - André Tavares - 19/09/2003 - pendência 15065
  ExtratodeMovimentodeReserva.Visible := (UpperCase(sistema.NomeEmpresa) = 'FCRT') or
                                         (UpperCase(sistema.NomeEmpresa) = 'BRTPREV');
//fim - André Tavares - 19/09/2003 - pendência 15065

  MudaCaptionFundacao(Sender);
  // Tavares 29/05/2002
 // Fecha todas os forms MdiChild abertos no momento
  for i := MDIChildCount-1 downto 0 do
      MDIChildren[i].Close;

  If Sistema.FezLogin Then
  Begin
    // André Pontes - 23/05/2006

    CarregaParametros;
    // FIM André Pontes - 23/05/2006

    ModuloCap.IdLocaAtendxCpu := 0;
    nsize := MAX_COMPUTERNAME_LENGTH + 1;
    GetComputerName(cComputerName,nsize);
    sComputerName := (cComputerName);
    If FazQuery(DtmBaseDados.Qry,' SELECT X.IDLOCALATENDXCPU, LA.IDTIPOATEND, LA.IDLOCALATEND, C.IDCPUATEND ' +
                                 ' FROM LOCALATENDXCPU X, CPUATEND C, LOCALATEND LA ' +
                                 ' WHERE ' +
                                 '  (UPPER(C.DESCCPUATEND) = UPPER('''+ sComputerName +
                                 ''')) AND (LA.IDLOCALATEND = X.IDLOCALATEND) AND ' +
                                 '  (X.IDCPUATEND = C.IDCPUATEND)') Then
    Begin
       ModuloCap.IdLocaAtendxCpu := DtmBaseDados.Qry.Fields[0].AsInteger;
       ModuloCap.IdTipoAtend := DtmBaseDados.Qry.Fields[1].AsInteger;
       // tavares 07-06-2002 muda o id do local de atendimento para atender a estrutura da CBS
       qryParamCentralAp.Close;
       qryParamCentralAp.Open;
       if qryParamCentralApFLGMUDALOCALATEND.asInteger = 1 then
       begin
         AbrirForm(frmMudaLocalAtend, TfrmMudaLocalAtend, false);
         repeat application.ProcessMessages until frmMudaLocalAtend.Active = False;
       end
       else
       begin
         IdCpuAtend := ModuloCap.IdLocaAtendxCpu;
         NomeCpuAtend := sComputerName;
         BtnAtende.Enabled := Atendimento1.Enabled;
       end;
    End;

    Rubs.SetParamEmissao;
  End;

  if qryParamCentralApFLGCONFIRMADATA.asInteger = 1  then
  begin
    // confirma data e hora
    AbrirForm(frmDataHora, TfrmDataHora, false);
    repeat application.ProcessMessages until frmDataHora.Active = False;
  end;

  MnuConsPart_Padrao.Visible := True;
  qryParamCentralAp.Close;
  BtnAtende.Click;
end;


procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelCentralAP,dtmRelCentralAP);
  Application.CreateForm(TDtmRelEstatDetalhada, DtmRelEstatDetalhada);
//  ****** se os datamodules dos relatórios em 3 camadas não forem previamente criados,
//não será possível que o usuário edite o relatório**********
  Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
  Application.CreateForm(TDtmRel2ViaCChequeMT, DtmRel2ViaCChequeMT);

//início - André Tavares - pendência 15701
  Application.CreateForm(TdtmRelInscricao, dtmRelInscricao);
//fim - André Tavares - pendência 15701

   // André Pontes - 11/05/2005 - pendência 18885
     Application.CreateForm(TdtmRelMovContr, dtmRelMovContr);
   // FIM André Pontes - 11/05/2005 - pendência 18885
end;

procedure TfrmPrincipal.Assunto2Click(Sender: TObject);
begin
  inherited;

  AbrirForm (frmCadGrupoProtocolo, TfrmCadGrupoProtocolo, false);
end;

procedure TfrmPrincipal.ComplementodoAssunto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FRMCADCOMPLASSUNTO  , TFRMCADCOMPLASSUNTO  , false);
end;

procedure TfrmPrincipal.Firio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FRMMOVFIARIO  , TFRMMOVFIARIO , false);
end;

procedure TfrmPrincipal.Firio2Click(Sender: TObject);
begin
 inherited;
 AbrirForm (Frmconsultafiario  , TFrmconsultafiario , false)
end;

procedure TfrmPrincipal.DescriodoBenefcio1Click(Sender: TObject);
begin
 inherited;
 AbrirForm (Frmbenefrub  , TFrmbenefrub , false)
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  ConsPart1 := TConsPart.Create(frmPrincipal);

   if not Sistema.GravaLogOperacoes('Operação Consulta Elegível/Participante') then
   begin
     Raise Exception.Create('Não foi possível Gravar o Log');
     exit;
   end;

  try
    ConsPart1.sIdPessoa    := '0';
    ConsPart1.sIdPessjur   := '0';
    ConsPart1.sIdPlanoprev := '0';
    ConsPart1.sSeqProposta := '0';
    ConsPart1.fDataBaseName := 'BaseDados';
    ConsPart1.MostraConsulta;
  finally
    // ELS SOL 175120 Kintana 1594021
    //FreeAndNil(ConsPart1);
  end;
end;

procedure TfrmPrincipal.AppPadraoActionUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  application.ProcessMessages;
  frmPrincipal.refresh;
  inherited;
end;

procedure TfrmPrincipal.Recadastramento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmRubsRecad  , TFrmRubsRecad , false)
end;

procedure TfrmPrincipal.InformedeRendimentosPF1Click(Sender: TObject);
begin
  inherited;
// tavares 29/01/2003 atualização do informe de rendimentos

  AbrirForm(frmConfigRelatInformeMT, TfrmConfigRelatInformeMT, False);
  frmConfigRelatInformeMT.HabilitaImpressao(true);
end;


procedure TfrmPrincipal.Configura1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;

end;

procedure TfrmPrincipal.Imprime1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmEmisEtiq,TFrmEmisEtiq,False);

end;

procedure TfrmPrincipal.RecebimentoDocs1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRecebDocs,TFrmRecebDocs,False);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i : integer;
begin
   // Fecha todas os forms MdiChild abertos no momento
   try
     for i := MDIChildCount-1 downto 0 do
      MDIChildren[i].Close;
   except end;

  Action := caFree;
  inherited;
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
var i : integer;
begin
  inherited;

end;

procedure TfrmPrincipal.ConfiguraodoModelodeRUBS1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmConfigRUBS , TfrmConfigRUBS , false);
end;

procedure TfrmPrincipal.SegundaViadeContraCheque1Click(Sender: TObject);
var sparam : string;
    PrintReport : Boolean;
begin
  inherited;
{ 3 Camadas }

 sparam := '';
 PrintReport := False;
 AppPadraoPrintReportPadrao(sender, 3348, '', PrintReport);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
   if MHeight <= 0 then
   begin
      MHeight := Self.ClientHeight + 112;
      MWidth  := Self.ClientWidth - 32;
   end;
// Inicializa o Empréstimo
  InicializaEP;
end;

procedure TfrmPrincipal.CarregaParametros;
begin
   (* Carrega os Parametros de Integracao e Parametros Globais *)

   //-----------------------------------------------------------------------------------------
   //    Parâmetros Globais
   //-----------------------------------------------------------------------------------------

   with dtmEmptmo.qryParamGlobal do begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then begin
         Modulo.bUsaCentRespon   := dtmEmptmo.qryParamGlobalUSACRESPON.asString = 'S';
         Modulo.bUsaUnidNegoc    := dtmEmptmo.qryParamGlobalUSAABC.asString = 'S';
         Modulo.iMoedaCorrente   := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
         Modulo.sMoedaCorrente   := dtmEmptmo.qryParamGlobalMOESIGLA.AsString;
      end;

      if not(Modulo.bUsaCentRespon) then Modulo.sCentroRespon  := dtmEmptmo.qryParamGlobalCODCENTRORESPON.asString;
      if not(Modulo.bUsaUnidNegoc) then Modulo.iUnidNegoc      := dtmEmptmo.qryParamGlobalUNIDNEGOC.asInteger;
   end;



   //-----------------------------------------------------------------------------------------
   //    CaP / CaR
   //-----------------------------------------------------------------------------------------

   // máscara do Tipo de Recebimento
   with dtmEmptmo.qryParamCAP do begin
      LimpaParametros(dtmEmptmo.qryParamCAP);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('RECPAG').asString         := 'R';
      Open;

      Modulo.sMascaraReceb := trim(dtmEmptmo.qryParamCAPMASCARADESEMB.asString);
   end;

   // máscara do Tipo de Desembolso
   with dtmEmptmo.qryParamCAP do begin
      LimpaParametros(dtmEmptmo.qryParamCAP);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('RECPAG').asString         := 'P';
      Open;

      Modulo.sMascaraDesemb := trim(dtmEmptmo.qryParamCAPMASCARADESEMB.asString);
   end;




   //-----------------------------------------------------------------------------------------
   //    Contabilidade
   //-----------------------------------------------------------------------------------------

   // verifica o plano de contas vigente hoje
   with dtmEmptmo.qryPlanoData do begin
      LimpaParametros(dtmEmptmo.qryPlanoData);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PDATAHOJE').AsDateTime := SysDate;
      Open;
   end;

   if not(dtmEmptmo.qryPlanoData.isEmpty) then begin
      Modulo.iPlano := dtmEmptmo.qryPlanoDataPLANO.AsInteger;
   end else begin

       with dtmEmptmo.qryParamContab do begin
          LimpaParametros(dtmEmptmo.qryParamContab);
          ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
          Open;
       end;

      if not(dtmEmptmo.qryParamContab.isEmpty) then begin
         Modulo.iPlano := dtmEmptmo.qryParamContabPLANO.AsInteger;
      end else begin
         Modulo.iPlano := 2;
      end;

   end;

   // abre a query que traz os dados de integração
   with dtmEmptmo.qryIntegraContab do begin
      LimpaParametros(dtmEmptmo.qryIntegraContab);
      ParamByName('PPLANO').asInteger := Modulo.iPlano;
      Open;
   end;

   // se não existirem os dados necessários para a integração...
   if not(dtmEmptmo.qryIntegraContab.isEmpty) then begin

      IntegraBack.Plano          := Modulo.iPlano;
      IntegraBack.MascaraPlano   := trim(dtmEmptmo.qryIntegraContabMASCARA.asString);

      // seta a variável sIntegraContab, necessária p/ UFuncaoGeral
      IntegraBack.Contabilidade  := 'S';

   end else begin
      IntegraBack.Contabilidade  := 'N';
   end;



   //-----------------------------------------------------------------------------------------
   //    Parâmetros do Sistema
   //-----------------------------------------------------------------------------------------

   Modulo.iPrograma           := -1;
   Modulo.iGrupoRegra         := -1;
   Modulo.iTipoDocPag         := -1;
   Modulo.iTipoDocRec         := -1;
   Modulo.iTipoDocRecDevol    := -1;
   Modulo.iPais               := -1;
   Modulo.sEstado             := '';
   Modulo.iCidade             := -1;

   // caso os parâmetros não estejam definidos ainda...
   if ParametrosSistema then begin

      if not(dtmEmptmo.qryParamEmptmoIDPROGRAMA.isNULL)     then Modulo.iPrograma      := dtmEmptmo.qryParamEmptmoIDPROGRAMA.asInteger;
      if not(dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.isNULL) then Modulo.sCentroCusto   := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;
      if not(dtmEmptmo.qryParamEmptmoIDGRUPOREGRA.isNULL)	then Modulo.iGrupoRegra    := dtmEmptmo.qryParamEmptmoIDGRUPOREGRA.asInteger;

      if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then begin
         case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
            0: Modulo.sDiaSldDev := 'C';
            1: Modulo.sDiaSldDev := 'A';
         end;
      end;

      if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.isNULL)     then Modulo.iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.asInteger;
      if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.isNULL)     then Modulo.iTipoDocRec	:= dtmEmptmo.qryParamEmptmoTIPODOCREC.asInteger;

      if not(dtmEmptmo.qryParamEmptmoIDPAIS.isNULL)         then Modulo.iPais		:= dtmEmptmo.qryParamEmptmoIDPAIS.asInteger;
      if not(dtmEmptmo.qryParamEmptmoCODESTADO.isNULL)      then Modulo.sEstado	:= dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
      if not(dtmEmptmo.qryParamEmptmoIDCIDADES.isNULL)      then Modulo.iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.asInteger;
   end;
   dtmEmptmo.VerificaItemAcerto;
end;


procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  // Finaliza o Empréstimo
  FinalizaEP;
end;

procedure TfrmPrincipal.CPUdeAtendimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadCpuAtend, TfrmCadCpuAtend, false);
end;

procedure TfrmPrincipal.Alteraodesenhas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadWebAcesso, TfrmCadWebAcesso, false);
  frmCadWebAcesso.UsuarioSelecionado := False;
end;


{ Migração de Relatórios para 3 camadas }
procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 CmCtrlRptCentralAP :TCmCtrlRptCentralAP;
begin
  inherited;
  CmCtrlRptCentralAP := TCmCtrlRptCentralAP.Create;
  try
    Printed := ShowReport(IdReports, CmCtrlRptCentralAP);
  finally
    CmCtrlRptCentralAP.Free;
  end;
end;


{ Migração de Relatórios para 3 camadas }
procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    3348:
      FrmPreviewReports := TfrmPRel2ViaCChequeMT.Create(Self);
    3346:
      FrmPreviewReports := TfrmPRelHisFuncionalMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;


procedure TfrmPrincipal.AppPadraoIdle(Sender: TObject; var Done: Boolean);
begin
  inherited;
  TemoXDocumento1.Enabled := false;
end;


procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var i, iPos, iTam, iTamFrase : word;
    Temp    : TComponent;
begin
   if Screen.ActiveForm = nil then Exit;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC FROM FUNDACAO WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   qry.Open;
   if not qry.IsEmpty and (qry.FieldByName('FLGTIPOPREVIDENC').AsString = 'I')
   then begin

      iPos      := Pos   ('FUNDA', UPPERCASE(TRIM(Screen.ActiveForm.Caption)));
      iTam      := Length('FUNDAÇÃO');
      iTamFrase := Length(Screen.ActiveForm.Caption);
      if iPos > 0 then Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Instituto'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      iPos      := Pos   ('PATROCINADORA', UPPERCASE(TRIM(Screen.ActiveForm.Caption)));
      iTam      := Length('PATROCINADORA');
      iTamFrase := Length(Screen.ActiveForm.Caption);
      if iPos > 0 then Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidade'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TRIM(Screen.ActiveForm.Caption)));
      iTam      := Length('PATROCINADORAS');
      iTamFrase := Length(Screen.ActiveForm.Caption);
      if iPos > 0 then Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidades'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      iPos      := Pos   ('PLANO', UPPERCASE(TRIM(Screen.ActiveForm.Caption)));
      iTam      := Length('PLANO');
      iTamFrase := Length(Screen.ActiveForm.Caption);
      if iPos > 0 then Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regime'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      iPos      := Pos   ('PLANOS', UPPERCASE(TRIM(Screen.ActiveForm.Caption)));
      iTam      := Length('PLANOS');
      iTamFrase := Length(Screen.ActiveForm.Caption);
      if iPos > 0 then Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regimes'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      for i := 0 to Screen.ActiveForm.ComponentCount - 1 do
      begin
         Temp := Screen.ActiveForm.Components[i];
         if (Temp is TLabel) then
         begin
            iPos      := Pos   ('FUNDA', UPPERCASE(TRIM(TLabel(Temp).Caption)));
            iTam      := Length('FUNDAÇÃO');
            iTamFrase := Length(TLabel(Temp).Caption);
            if iPos > 0 then TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORA', UPPERCASE(TRIM(TLabel(Temp).Caption)));
            iTam      := Length('PATROCINADORA');
            iTamFrase := Length(TLabel(Temp).Caption);
            if iPos > 0 then TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TRIM(TLabel(Temp).Caption)));
            iTam      := Length('PATROCINADORAS');
            iTamFrase := Length(TLabel(Temp).Caption);
            if iPos > 0 then TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANO', UPPERCASE(TRIM(TLabel(Temp).Caption)));
            iTam      := Length('PLANO');
            iTamFrase := Length(TLabel(Temp).Caption);
            if iPos > 0 then TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANOS', UPPERCASE(TRIM(TLabel(Temp).Caption)));
            iTam      := Length('PLANOS');
            iTamFrase := Length(TLabel(Temp).Caption);
            if iPos > 0 then TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
         end;

         if (Temp is TMenuItem) then
         begin
            iPos      := Pos   ('FUNDA', UPPERCASE(TRIM(TMenuItem(Temp).Caption)));
            iTam      := Length('FUNDAÇÃO');
            iTamFrase := Length(TMenuItem(Temp).Caption);
            if iPos > 0 then TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORA', UPPERCASE(TRIM(TMenuItem(Temp).Caption)));
            iTam      := Length('PATROCINADORA');
            iTamFrase := Length(TMenuItem(Temp).Caption);
            if iPos > 0 then TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TRIM(TMenuItem(Temp).Caption)));
            iTam      := Length('PATROCINADORAS');
            iTamFrase := Length(TMenuItem(Temp).Caption);
            if iPos > 0 then TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANO', UPPERCASE(TRIM(TMenuItem(Temp).Caption)));
            iTam      := Length('PLANO');
            iTamFrase := Length(TMenuItem(Temp).Caption);
            if iPos > 0 then TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANOS', UPPERCASE(TRIM(TMenuItem(Temp).Caption)));
            iTam      := Length('PLANOS');
            iTamFrase := Length(TMenuItem(Temp).Caption);
            if iPos > 0 then TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
         end;

         if (Temp is TGroupBox) then
         begin
            iPos      := Pos   ('FUNDA', UPPERCASE(TRIM(TGroupBox(Temp).Caption)));
            iTam      := Length('FUNDAÇÃO');
            iTamFrase := Length(TGroupBox(Temp).Caption);
            if iPos > 0 then TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORA', UPPERCASE(TRIM(TGroupBox(Temp).Caption)));
            iTam      := Length('PATROCINADORA');
            iTamFrase := Length(TGroupBox(Temp).Caption);
            if iPos > 0 then TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TRIM(TGroupBox(Temp).Caption)));
            iTam      := Length('PATROCINADORAS');
            iTamFrase := Length(TGroupBox(Temp).Caption);
            if iPos > 0 then TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANO', UPPERCASE(TRIM(TGroupBox(Temp).Caption)));
            iTam      := Length('PLANO');
            iTamFrase := Length(TGroupBox(Temp).Caption);
            if iPos > 0 then TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANOS', UPPERCASE(TRIM(TGroupBox(Temp).Caption)));
            iTam      := Length('PLANOS');
            iTamFrase := Length(TGroupBox(Temp).Caption);
            if iPos > 0 then TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
         end;

         if (Temp is TCheckBox) then
         begin
            iPos      := Pos   ('FUNDA', UPPERCASE(TRIM(TCheckBox(Temp).Caption)));
            iTam      := Length('FUNDAÇÃO');
            iTamFrase := Length(TCheckBox(Temp).Caption);
            if iPos > 0 then TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORA', UPPERCASE(TRIM(TCheckBox(Temp).Caption)));
            iTam      := Length('PATROCINADORA');
            iTamFrase := Length(TCheckBox(Temp).Caption);
            if iPos > 0 then TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TRIM(TCheckBox(Temp).Caption)));
            iTam      := Length('PATROCINADORAS');
            iTamFrase := Length(TCheckBox(Temp).Caption);
            if iPos > 0 then TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANO', UPPERCASE(TRIM(TCheckBox(Temp).Caption)));
            iTam      := Length('PLANO');
            iTamFrase := Length(TCheckBox(Temp).Caption);
            if iPos > 0 then TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

            iPos      := Pos   ('PLANOS', UPPERCASE(TRIM(TCheckBox(Temp).Caption)));
            iTam      := Length('PLANOS');
            iTamFrase := Length(TCheckBox(Temp).Caption);
            if iPos > 0 then TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
         end;
      end;
   end;
end;


//início - André Tavares - 19/09/2003 - pendência 15065
procedure TfrmPrincipal.ExtratodeMovimentodeReservaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamRelMovReserva_EspFCRT, TfrmParamRelMovReserva_EspFCRT, false);
end;
//fim - André Tavares - 19/09/2003 - pendência 15065

procedure TfrmPrincipal.ExportaodeSenhas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExportacaoSenhas, TFrmExportacaoSenhas, false);
end;

procedure TfrmPrincipal.mnExtratoIndividualClick(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmExtratoINSS, TFrmExtratoINSS, false);
end;

initialization

   Sistema.NomeModulo := 'Central de Atendimentos';
   Sistema.IdModulo := 19 ;
   Sistema.Versao := '3.02.18f';
   Sistema.NomeAplicativo := 'Central de Atendimento ao Público';
   IntegraBack            := TIntegraBack.Create(True, True, True) ;

   Modulo := TModulo.Create  ;
   ModuloCap := TModuloCap.Create  ;
   Rubs := TRubs.Create;
   IntegraModulo := TIntegraModulo.Create;

finalization
  try
    Modulo.free;
  except;
  end;
  try
    ModuloCap.Free;
  except;
  end;
  try
    Rubs.Free;
  except;
  end;
  try
    ConsPart1.Free;
  except;
  end;

  IntegraModulo.Free;
end.
