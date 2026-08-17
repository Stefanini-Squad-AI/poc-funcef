//******************************************************************************************
//N. Sol..........: 228736/17139  
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos    
//Descrição.......: Inclusão da funcionalidade Cadastros -> Manutenção -> Destacamento -> Bloqueio de Usuários
//******************************************************************************************
//N. Sol..........: 185481
//N. Kintana......: 1907260
//Data............: 01/04/2014
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Agrupamento de AP - Modelo 2
//Funções.........: abertura do form de normal para mdichild
//******************************************************************************************
//N. Sol..........: 137269_7601
//N. Kintana......: 829602
//Data............: 17/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluido novo ícone para chamar o Destacamento pendente
//                  Alterada imagem do ícone que chama o Destacamento
//                  Colocado em comentário rotinas da versão anterior do Destacamento
//                  Retirado rotinas da VALIA
//******************************************************************************************
Unit FPrincipal;

Interface

Uses
   Windows, Messages, Db, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
   Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, uAutorizacao, uSistema, TB97, Wwdatsrc,
   DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
   TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, fcLabel,
   AppEvnts, CMApplicationEvents, StdActns, ActnList, fcStatusBar, SConnect, MConnect,
   DBClient, CMNetUsers, uResource, uCtrlMsgContexto, uCtrlMensagens, uCmClientDataSet,
   uDiasUteis, wwstorep;

Type
   TfrmPrincipal = Class(TfrmCMPrincipal)
      mnuCadAdmissao: TMenuItem;
      mnuCadCandidatos: TMenuItem;
      mnuCadManutencao: TMenuItem;
      mnuCadDestacamento: TMenuItem;
      mnuCadTarifas: TMenuItem;
      UsuarioRH: TPanel;
      mnuTransacoes: TMenuItem;
      mnuTrsAdmissao: TMenuItem;
      mnuTrsDesenvolvimento: TMenuItem;
      mnuTrsManutencao: TMenuItem;
      mnuTrsDesligamento: TMenuItem;
      mnuTrsServicos: TMenuItem;
      mnuSolicitacaodeFerias: TMenuItem;
      mnuSolicitacaodeDestacamento: TMenuItem;
      mnuSolicitacaodeServicodeManutencao: TMenuItem;
      mnuManutencaodeAPseGRs: TMenuItem;
      mnuSolicitacaodeValeTransporte: TMenuItem;
      mnuRequisicaodeMaterial: TMenuItem;
      mnuRegistroIndividualdeTreinamento: TMenuItem;
      mnuRegistroColetivodeTreinamento: TMenuItem;
      mnuSolicPlanodeSaude: TMenuItem;
      mnuRequisicaoodePessoal: TMenuItem;
      mnuSolicitdeAlteracaoFuncional: TMenuItem;
      mnuAnalisedasSolicitacoesdeAlteracao: TMenuItem;
      mnuSolicitaodeTicket: TMenuItem;
      mnuSolicitacaoodePlanodeBenefcio: TMenuItem;
      mnuConsultaContratos: TMenuItem;
      mnuTransReembolsosparaaEmpresa: TMenuItem;
      mnuEstatisticadeCustosdeRH: TMenuItem;
      mnuCadPessoal: TMenuItem;
      mnuConsHistoricosdaPessoa: TMenuItem;
      Servios1: TMenuItem;
      mnuCadTipoServioManut: TMenuItem;
      mnuRelatoriosEspeciais: TMenuItem;
      mnuDemonstrativodePagamentoEspecial: TMenuItem;
      qryAux: TwwQuery;
      N1: TMenuItem;
      mnuIntegraDestacamento: TMenuItem;
      Toolbar971: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      ToolbarSep972: TToolbarSep97;
      sbtnReqPes: TSpeedButton;
      spbtnCadCand: TSpeedButton;
      sbtnRegTreinIndiv: TSpeedButton;
      sbtnSolAltFunc: TSpeedButton;
      spbtnCadFunc: TSpeedButton;
      spbtnConsHist: TToolbarButton97;
      sbtnFerias: TSpeedButton;
      sbtnValeTransp: TSpeedButton;
      spbtnSolicSaude: TSpeedButton;
      sbtnDestac: TSpeedButton;
      spbtnSolicTicket: TSpeedButton;
      spbtnSolicBenef: TSpeedButton;
      tbarbtRescisao: TToolbarButton97;
      spbtnReembolso: TSpeedButton;
      sbtnSolicServ: TSpeedButton;
      sbtnReqMat: TSpeedButton;
      sbtnOrcam: TSpeedButton;
      sbtnContratos: TSpeedButton;
      mnuCadHotel: TMenuItem;
      mnuCadItemDespesa: TMenuItem;
      mnuDiarias: TMenuItem;
      mnuHospedagem: TMenuItem;
      mnuTaxi: TMenuItem;
      mnuLocacaodeVeiculo: TMenuItem;
      mnuAeroportos: TMenuItem;
      N2: TMenuItem;
      N3: TMenuItem;
      mnuDstTarifas: TMenuItem;
      mnuParametrosIntegracao: TMenuItem;
      mnuAssosValoresHospedagemxPassagens: TMenuItem;
      mnuDestacamento: TMenuItem;
      SpeedButton1: TSpeedButton;
      // Felipe A. Santos SOL 228736/17139 PPM 761996 {fim mnuBloqUsuarios}
      mnuBloqUsuarios: TMenuItem;
      Procedure sbtnDestacClick(Sender: TObject);
      Procedure sbtnFeriasClick(Sender: TObject);
      Procedure AppPadraoAfterLogin(Sender: TObject);
      Procedure AppPadraoCreateFormReports(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbtnSolicServClick(Sender: TObject);
      Procedure mnuCadCandidatosClick(Sender: TObject);
      Procedure mnuSolicitacaodeFeriasClick(Sender: TObject);
      Procedure mnuSolicitacaodeDestacamentoClick(Sender: TObject);
      Procedure mnuSolicitacaodeServicodeManutencaoClick(Sender: TObject);
      Procedure sbtnReqMatClick(Sender: TObject);
      Procedure spbtnCadCandClick(Sender: TObject);
      Procedure sbtnReqPesClick(Sender: TObject);
      Procedure sbtnContratosClick(Sender: TObject);
      Procedure sbtnOrcamClick(Sender: TObject);
      Procedure mnuManutencaodeAPseGRsClick(Sender: TObject);
      Procedure sbtnValeTranspClick(Sender: TObject);
      Procedure mnuSolicitacaodeValeTransporteClick(Sender: TObject);
      Procedure mnuTrsDesligamentoClick(Sender: TObject);
      Procedure tbarbtRescisaoClick(Sender: TObject);
      Procedure mnuRequisicaodeMaterialClick(Sender: TObject);
      Procedure sbtnRegTreinIndivClick(Sender: TObject);
      Procedure mnuRegistroIndividualdeTreinamentoClick(Sender: TObject);
      Procedure mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
      Procedure spbtnSolicSaudeClick(Sender: TObject);
      Procedure mnuSolicPlanodeSaudeClick(Sender: TObject);
      Procedure mnuRequisicaoodePessoalClick(Sender: TObject);
      Procedure sbtnSolAltFuncClick(Sender: TObject);
      Procedure mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
      Procedure mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
      Procedure spbtnSolicTicketClick(Sender: TObject);
      Procedure mnuSolicitaodeTicketClick(Sender: TObject);
      Procedure spbtnSolicBenefClick(Sender: TObject);
      Procedure mnuSolicitacaoodePlanodeBenefcioClick(Sender: TObject);
      Procedure mnuConsultaContratosClick(Sender: TObject);
      Procedure spbtnReembolsoClick(Sender: TObject);
      Procedure mnuTransReembolsosparaaEmpresaClick(Sender: TObject);
      Procedure spbtnTesteClick(Sender: TObject);
      Procedure mnuEstatisticadeCustosdeRHClick(Sender: TObject);
      Procedure spbtnCadFuncClick(Sender: TObject);
      Procedure mnuCadPessoalClick(Sender: TObject);
      Procedure spbtnConsHistClick(Sender: TObject);
      Procedure mnuConsHistoricosdaPessoaClick(Sender: TObject);
      Procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
         DesReport: TObject; Var Config: Boolean);
      Procedure AppPadraoPrintReportPadrao(sender: TObject;
         IdReports: Integer; sFileName: String; Var Printed: Boolean);
      Procedure AppPadraoShowParamReportPadrao(sender: TObject;
         IdReports: Integer; Var sParams: String; Var PrintReport: Boolean);
      Procedure mnuCadTipoServioManutClick(Sender: TObject);
      Procedure mnuDemonstrativodePagamentoEspecialClick(Sender: TObject);
      Procedure nmuConfigParametrosClick(Sender: TObject);
      Procedure mnuIntegraDestacamentoClick(Sender: TObject);
      Procedure mnuCadHotelClick(Sender: TObject);
      Procedure mnuCadItemDespesaClick(Sender: TObject);
      Procedure mnuDiariasClick(Sender: TObject);
      Procedure mnuHospedagemClick(Sender: TObject);
      Procedure mnuAeroportosClick(Sender: TObject);
      Procedure mnuTaxiClick(Sender: TObject);
      Procedure mnuLocacaodeVeiculoClick(Sender: TObject);
      Procedure mnuParametrosIntegracaoClick(Sender: TObject);
      // Felipe A. Santos SOL 228736/17139 PPM 761996 {fim mnuBloqUsuariosClick}
      procedure mnuBloqUsuariosClick(Sender: TObject);
   Private
      CtrlMsgContexto: TCtrlMsgContexto;
      CtrlMensagens: TCtrlMensagens;
      _DiasUteis: TDiasUteis;
      Function GetLayoutPadrao: TStringList;
   Public
      iIDContraCheque, prmUnidNegoc: integer;
      prmCodTipDoc, prmCodCentroRespon: String;
      bTemManut: boolean;
   End;

Var
   frmPrincipal: TfrmPrincipal;

Implementation

Uses
   uCtrlPadroes, uMensErro, uIntegraBack, uOrcamento, fTelaAut, fAguarde, dBaseDados, dCds,

   uCtrlFuncoesRH, uCtrlUsoGeralRH, UsoGeralRH, uImprimeRelatorio, uCtrlRegTrein,
   uFuncoesUteisRH, uCmCtrlRptModAuto, uCtrlListTerceirosRH,

   fCadTarifa, fCadDestacamento, fCadFerias, fCadOSMan, FCadReq, FCadRegTrein, fCadRequi,
   fCadCand, fCadRegSolic, fCadContrato, fCadFunc, fCadServicoManut,

   dRelatoriosModAuto, dRelatorioCartaComun, dRelatorioEtiqAltCTPS, dRelatoriosContrato,
   REtiquetaFerias,

   fRParamOrcxRealConta, fParamAlterFuncional, fParamResFolComp, fParamVariavelMensal,
   fParamFichaFunc,

   //fLancDocCAPCAR, //Renan Cristiano Sol Nº 126385 Kintana 6585269
   fRegLinha, FResciContr, fRegTreinColetivo, fSolicSaude, fSelSolic,
   fSolicTicket, fSolicBenef, fLancaRubPorRub, fSelEstCusto, fAgendaTrein, fConsHst,
   fSolicServico, fParamEtiquetas, fParamCadPessoal, fParamFolhaFreq,
   fParamRelTxtCCheque, fCadParam, FDestacamentoPendente,
   fCadHotel, fCadItemDespesa, fCadTarifasDiarias, fCadTarifasHospedagem,
   fCadDstAeroporto, fCadTarifasTaxi, fCadTarifasLocacaoVeiculos, fCadDstParam,
   // Felipe A. Santos SOL 228736/17139 PPM 761996 {fim FCadBloqUsuario}
   FCadBloqUsuario;

{$R *.DFM}

Procedure TfrmPrincipal.FormCreate(Sender: TObject);
Begin
   Inherited;
   Modulo := TModulo.Create;
   Modulo.InitializeAs(Padroes);

   CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
   CtrlUsoGeralRH.InitializeAs(Padroes);

   CtrlMsgContexto := TCtrlMsgContexto.Create;
   CtrlMsgContexto.InitializeAs(Padroes);

   CtrlMensagens := TCtrlMensagens.Create;
   CtrlMensagens.InitializeAs(Padroes);

   FU := TCtrlFuncoesRH.Create;
   FU.InitializeAs(Padroes);

   dmCds := TdmCds.Create(Application);

   FU.RegistrarCFX(false);

   ThousandSeparator := '.';
   DecimalSeparator := ',';
   ShortDateFormat := 'DD/MM/YYYY';

   ImprimeRelatorio := TImprimeRelatorio.Create;
   IntegraBack := TIntegraBack.Create(true, true, true);
   OrcamentoBack := TOrcamentoBack.Create;

   IntegraBack.RecPag := 'P';
   _DiasUteis := TDiasUteis.Create;
   _DiasUteis.InitializeAs(Padroes);
End;

Procedure TfrmPrincipal.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FU.Free;
   CtrlUsoGeralRH.Free;
   CtrlMsgContexto.Free;
   CtrlMensagens.Free;
   Modulo.Free;
   dmCds.Free;
   _DiasUteis.Free;
   Inherited;
End;

Procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
   CtrlListTerceirosRH: TCtrlListTerceirosRH;
   CtrlRegTrein: TCtrlRegTrein;
   qry: TQuery;
   CdsAux: TCMClientDataset;
   c, DiasSaldoFerias, iDiasAcerto, iFlgEnvio: integer;
   DataProx, RegPessoa, sTextoMsg: String;
   bEnviaMensagens: boolean;
Begin
   Inherited;
   ImlCaixa_Padrao.Visible := false;
   fcLabel2.Visible := false;

   bFezLogin := Sistema.FezLogin;

   If (Sistema.FezLogin) Then
      Begin
         IdEmpresa := Sistema.IdEmpresa;
         bUsuarioRH := UsuarioRH.Enabled;
         UsuXfilialXcc(IntToStr(Sistema.IdUsuario));

         If (Sistema.MudouUsuario) Then
            CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);

         // Recupera o IdContracheque
         CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
            CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
         CtrlListTerceirosRH.Initialize(dtmBaseDados.dbBaseDados, true);
         Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
         iIDContraCheque := Modulo.IdContraCheque;
         FreeAndNil(CtrlListTerceirosRH);

         // Agenda de Cursos Iniciando nos Prox. 7 Dias
         CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, 0, 0, '',
            CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
         CtrlRegTrein.Initialize(dtmBaseDados.dbBaseDados, true);
         dtmBaseDados.Cds.Data := CtrlRegTrein.ListAgendaTrein;
         CtrlRegTrein.Free;

         If Not (dtmBaseDados.Cds.IsEmpty) Then
            With TfrmAgendaTrein.Create(Application) Do
               Begin
                  dsHstTrn.DataSet := dtmBaseDados.Cds;
                  ShowModal;
                  Free;
               End;

         // ----------------------------------------------------------------------------------
         // Rotinas de Integração com o Back
         // ----------------------------------------------------------------------------------
         qry := TQuery.Create(Application);
         qry.DataBaseName := 'BaseDados';
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON ' +
            'FROM   PARAMGLOBAL ' +
            'WHERE  (IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ')');
         qry.Open;

         If (qry.IsEmpty) Then
            Begin
               IntegraBack.ObrigaABC := 'S';
               IntegraBack.ObrigaCRespon := 'S';
               prmUnidNegoc := -1;
               prmCodCentroRespon := '';
            End
         Else
            Begin
               If (qry.FieldByName('USAABC').asString = 'N') Then
                  IntegraBack.ObrigaABC := 'N'
               Else
                  IntegraBack.ObrigaABC := 'S';

               If (qry.FieldByName('USACRESPON').asString = 'N') Then
                  IntegraBack.ObrigaCRespon := 'N'
               Else
                  IntegraBack.ObrigaCRespon := 'S';

               If (Trim(qry.FieldByName('UnidNegoc').asString) <> '') Then
                  Begin
                     prmUnidNegoc := qry.FieldByName('UnidNegoc').asInteger;
                     Modulo.iUnidadeNegocPadrao := qry.FieldByName('UnidNegoc').asInteger;
                  End
               Else
                  prmUnidNegoc := -1;

               If (Trim(qry.FieldByName('CODCENTRORESPON').asString) <> '') Then
                  prmCodCentroRespon := qry.FieldByName('CODCENTRORESPON').asString
               Else
                  prmCodCentroRespon := '-1';
            End;

         // SOL 137269_7601  KTN 829602 - Paulo Nobre

         // Email cobrando acerto de contas
{         bEnviaMensagens := false;
         CdsAux := TCMClientDataset.Create(Nil);
         CdsAux.Data := CtrlMsgContexto.SelecionaMsgContexto(7);
         iFlgEnvio := CdsAux.FieldByName('FLGTIPOENVIO').AsInteger;
         If iFlgEnvio > 0 Then
            Begin
               qry.Close;
               qry.SQL.Clear;
               qry.Sql.Text := 'SELECT DIASACERTOCONTA FROM PARAMRH';
               qry.Open;
               iDiasAcerto := qry.FieldByName('DIASACERTOCONTA').AsInteger;
               qry.Close;

               qry.SQL.Clear;
               qry.Sql.Text := 'SELECT TEXTO FROM MSGPREDEF WHERE IDMSGCONTEXTO = 7';
               qry.Open;
               sTextoMsg := qry.FieldByName('TEXTO').AsString;
               qry.Close;

               qry.SQL.Clear;
               qry.Sql.Text :=
                  'SELECT D.IDDESTACAMENTO, D.IDPESSOA, D.DATAINI, D.DATAFIM, P.NOME, P.EMAIL' + CR_LF +
                  'FROM DESTACAMENTO D, PESSOA P' + CR_LF +
                  'WHERE D.DATAEMAILACERTO IS NULL' + CR_LF +
                  'AND   NVL(D.VLRACERTO, 0) = 0' + CR_LF +
                  'AND   D.IDPESSOA  = P.IDPESSOA' + CR_LF +
                  'AND   D.DATAFIM < SYSDATE';
               qry.Open;

               If Not qry.Eof Then
                  Begin
                     CtrlMensagens.ConfiguraServidorPeloRegistro(CdsAux.FieldByName('IDEMAILCONEXAO').AsInteger);
                     CtrlMensagens.LimpaMensagens;
                  End;

               While Not qry.Eof Do
                  Begin
                     If _DiasUteis.SomaDiasUteis(Sistema.IdEmpresa, qry.FieldByName('DATAFIM').AsDateTime,
                        iDiasAcerto, false, true, false) < Date Then
                        Begin
                           // Enviar mensagem com tags
                           bEnviaMensagens := true;
                           CtrlMensagens.IncluiMensagem(
                              FU.IFF(iFlgEnvio = 1, 0, qry.FieldByName('IDPESSOA').AsInteger),
                              FU.IFF(iFlgEnvio = 2, '', qry.FieldByName('EMAIL').AsString),
                              CdsAux.FieldByName('ASSUNTOMSG').AsString,
                              CtrlMensagens.SubstituiTags(sTextoMsg,
                              ['NOMEDESTINATARIO', 'NOMEREMETENTE', 'PERIODO'],
                              [qry.FieldByName('NOME').AsString, Sistema.NomeUsuario,
                              qry.FieldByName('DATAINI').AsString + ' a ' + qry.FieldByName('DATAFIM').AsString]));

                           // Marcar o envio
                           qryAux.Close;
                           qryAux.SQL.Clear;

                           qryAux.SQL.Add('UPDATE DESTACAMENTO SET DATAEMAILACERTO = SYSDATE WHERE IDDESTACAMENTO = ' +
                              qry.FieldByName('IDDESTACAMENTO').asString);

                           qryAux.ExecSql;
                           qryAux.Close;
                        End;
                     qry.Next;
                  End;

               If bEnviaMensagens Then
                  CtrlMensagens.EnviaMensagens(Sistema.IdUsuario);
               qry.Close;
            End;
         CdsAux.Free;}

         // Orçamento
         qry.Close;
         qry.SQL.Clear;
         qry.Sql.Text := 'SELECT MASCCENTRORESPON FROM PARAMGLOBAL WHERE IDPESSOA = ' +
            IntToStr(Sistema.idEmpresa);
         qry.Open;

         Modulo.sMascaraCentRespon := qry.FieldByName('MASCCENTRORESPON').asString;

         qry.Close;
         qry.SQL.Clear;
         qry.Sql.Text :=
            'SELECT ' +
            '  IDPLANOORCAMEN, FLGTIPOSALDO, MASCGRUPOORC, FLGPERMITETRANSF, FLGVERIFICASALDO ' +
            'FROM ' +
            '  PARAMORCAMENTO ' +
            'WHERE ' +
            '  IDPESSOA = ' + IntToStr(Sistema.idEmpresa);
         qry.Open;

         If (qry.isEmpty) Or (qry.FieldByName('IDPLANOORCAMEN').asInteger = 0) Or
            (qry.FieldByName('MASCGRUPOORC').asString = '') Then
            MsgDlg('Para usar o sistema de Orçamento é necessário cadastrar os parâmetros.',
               'Aviso', mtWarning, [mbOk, mbHelp], 0)
         Else
            Begin
               Modulo.iPlanoOrc := qry.FieldByName('IDPLANOORCAMEN').AsInteger;
               Modulo.sMascaraGrupo := qry.FieldByName('MASCGRUPOORC').asString;
               Modulo.sTipoSaldo := qry.FieldByName('FLGTIPOSALDO').asString;
               Modulo.sPermiteSaldoNeg := qry.FieldByName('FLGVERIFICASALDO').asString;

               If (qry.FieldByName('FLGVERIFICASALDO').IsNull) Then
                  Modulo.sPermiteSaldoNeg := 'N';

               If (qry.FieldByName('FLGPERMITETRANSF').IsNull) Then
                  Modulo.sPermiteTransf := 'S'
               Else
                  Modulo.sPermiteTransf := qry.FieldByName('FLGPERMITETRANSF').asString;
            End;

         //         IntegraBack.BuscaParamIntegra('PARAMFINANC', 'INTEGRACONTAB', ' ');
         qry.Close;

         // Sist. Manutenção
         qry.Close;
         qry.SQL.Clear;
         qry.Sql.Text := 'SELECT * FROM PARAMMANUT WHERE IDPESSOA = ' +
            IntToStr(Sistema.idEmpresa);
         qry.Open;

         bTemManut := Not qry.IsEmpty;

         qry.Close;

         // Verifica Prox. Férias
         RegPessoa := IntToStr(Sistema.IdUsuario);

         qry.SQL.Clear;
         qry.SQL.Add(
            'SELECT ' +
            '  IDPESSOA ' +
            'FROM ' +
            '  FUNCIONARIO ' +
            'WHERE ' +
            '  (FUNCIONARIO.IDPESSOA = ' + RegPessoa + ')');
         qry.Open;

         If Not qry.IsEmpty Then // Usuário é Empregado
            Begin
               qry.Close;
               qry.SQL.Clear;
               qry.SQL.Add(
                  'SELECT ' +
                  '  MAX(FERIAS.INIPERIODOFERIAS) AS PROXAQUISFER ' +
                  'FROM ' +
                  '  FERIAS ' +
                  'WHERE ' +
                  '  (FERIAS.IDPESSOA    = ' + RegPessoa + ')');
               qry.Open;

               If Not (qry.FieldByName('PROXAQUISFER').isNull) Then
                  Begin
                     DataProx := qry.FieldByName('PROXAQUISFER').asString;
                     DataProx := IncData(DataProx, 0, 0, 1);
                     qry.Close;
                  End
               Else
                  Begin
                     qry.Close;
                     qry.SQL.Clear;
                     qry.SQL.Add(
                        'SELECT ' +
                        '  DATAADMISSAO AS PROXAQUISFER ' +
                        'FROM ' +
                        '  FUNCIONARIO ' +
                        'WHERE ' +
                        '  (FUNCIONARIO.IDPESSOA = ' + RegPessoa + ')');
                     qry.Open;
                     DataProx := qry.FieldByName('PROXAQUISFER').asString;
                     qry.Close;
                  End;

               qry.Close;
               qry.SQL.Clear;
               qry.SQL.Add(
                  'SELECT ' +
                  '  MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 + ' +
                  '  DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,trunc((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30) ' +
                  '  AS DIASACUMFERIAS ' +
                  '  FROM  FERIAS      ' +
                  'WHERE ' +
                  '  (FERIAS.IDPESSOA    = ' + RegPessoa + ')');
               qry.Open;

               DiasSaldoFerias := qry.FieldByName('DIASACUMFERIAS').asInteger;
               If (DiasSaldoFerias > 0) Then
                  Begin
                     DiasSaldoFerias := 30 - DiasSaldoFerias;
                     DataProx := IncData(DataProx, 0, 0, -1);
                  End;

               DataProx := IncData(DataProx, -1, 0, 2);
               If (StrToDate(DataProx) - Date) <= 40 Then
                  Begin
                     MsgDlg('Você deve solicitar suas férias.', 'Aviso', mtWarning, [mbOk], 0);
                     sCadFerRegPessoa := RegPessoa;
                     frmCadFerias := TfrmCadFerias.Create(Self);
                     frmCadFerias.ToolBar971.Visible := False;
                     frmCadFerias.Dock973.Visible := False;
                  End;

               qry.Close;
               qry.SQL.Clear;
               qry.SQL.Add(
                  'SELECT ' +
                  '  INIGOZOFERIAS ' +
                  'FROM ' +
                  '  FERIAS F, RADINSTPROCESSO R ' +
                  'WHERE (F.IDPESSOA    = ' + RegPessoa + ')' +
                  'AND   (F.FLGOCORRIDA = 0) ' +
                  'AND   (F.IDPROCESSO  = R.IDPROCESSO) ' +
                  'AND   (R.FLGOK       <> ''S'') ' +
                  'AND   (F.INIGOZOFERIAS - SYSDATE <= 30)');
               qry.Open;
               If (Not qry.IsEmpty) Then
                  MsgDlg('Você deve verificar suas férias. Não estão aprovadas ainda !', 'Aviso', mtWarning, [mbOk], 0);
            End;

         // Almoxarifado
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(
            'SELECT ' +
            '     UXA.CODALMOXARIFADO,' +
            '     ALM.DESCALMOX, ALM.CODCENTROCUSTO ' +
            'FROM ' +
            '     ALMOX ALM, ' +
            '     USUXALMOX UXA ' +
            'WHERE ' +
            '       (UXA.IDUSUARIO = ' + RegPessoa + ') ' +
            '   AND (UXA.IDPESSOA  = ' + IntToStr(Sistema.idEmpresa) + ') ' +
            '   AND (UXA.CODALMOXARIFADO = ALM.CODALMOXARIFADO) ' +
            'ORDER BY ALM.DESCALMOX');
         qry.Open;

         Modulo.iCodAlmoxa := qry.FieldByName('CODALMOXARIFADO').asInteger;
         Modulo.sAlmoxaUsuario := qry.FieldByName('DESCALMOX').asString;
         Modulo.sCCustoAlmoxa := qry.FieldByName('CODCENTROCUSTO').asString;
         Modulo.iQtdAlmoxa := qry.RecordCount;

         // Centro de Custo p/ Almoxarifado
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(
            'SELECT ' +
            '  UXC.CODCENTROCUSTO, CC.NOME ' +
            'FROM ' +
            '  CENTCUST CC, USCCUSTO UXC ' +
            'WHERE ' +
            '  (UXC.IDUSUARIO      = ' + RegPessoa + ') AND ' +
            '  (UXC.IDPESSOA       = ' + IntToStr(Sistema.idEmpresa) + ') AND ' +
            '  (CC.IDEMPRESA       = ' + IntToStr(Sistema.idEmpresa) + ') AND ' +
            '  (UXC.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' +
            'ORDER BY ' +
            '  CC.NOME');
         qry.Open;

         Modulo.sCodCCusto := qry.FieldByName('CODCENTROCUSTO').asString;
         Modulo.sDescCCusto := qry.FieldByName('NOME').asString;
         Modulo.iQtdCCusto := qry.RecordCount;

         qry.Close;
         qry.Free;
      End;

   // SOL 137269_7601  KTN 829602 - Paulo Nobre
{   If mnuIntegraDestacamento.Enabled Then
Begin
Application.CreateForm(TfrmDestacamentoPendente, frmDestacamentoPendente);
If frmDestacamentoPendente.ExistePendencia Then
Begin
   frmDestacamentoPendente.Show;
End Else
Begin
   frmDestacamentoPendente.Destroy;
End;
End;}

   // SOL 137269_7601  KTN 829602 - Paulo Nobre
   // Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco)
//   For c := 0 To Self.ComponentCount - 1 Do
 //     If (Self.Components[c] Is TMenuItem) Then
 //        (Self.Components[c] As TMenuItem).Enabled := true;

{  mnuParametrosIntegracao.Enabled := True;
   mnuCadItemDespesa.Enabled := True;
   mnuAeroportos.Enabled := true;
   mnuDiarias.Enabled := true;
   mnuTaxi.Enabled := true;
   mnuHospedagem.Enabled := True;
   mnuLocacaodeVeiculo.Enabled := True;
   mnuDestacamento.Enabled := True;}

   mnuAssosValoresHospedagemxPassagens.Visible := False;
   mnuCadTarifas.Visible := False;
   mnuCadHotel.Visible := False;
   //
End;

Procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
Begin
   Inherited;
   Application.CreateForm(TdtmRelatoriosModAuto, dtmRelatoriosModAuto);
   Application.CreateForm(TdtmRelatorioCartaComun, dtmRelatorioCartaComun);
   Application.CreateForm(TrptEtiquetaFerias, rptEtiquetaFerias);
   Application.CreateForm(TdtmRelatorioEtiqAltCTPS, dtmRelatorioEtiqAltCTPS);
   Application.CreateForm(TdtmRelatoriosContrato, dtmRelatoriosContrato);
End;

Procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadParam, TfrmCadParam, false);
End;

Procedure TfrmPrincipal.mnuCadHotelClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadHotel, TfrmCadHotel, false);
End;

Procedure TfrmPrincipal.mnuCadItemDespesaClick(Sender: TObject);
Begin
   Inherited;
   frmCadItemDespesa := TfrmCadItemDespesa.create(self);
   frmCadItemDespesa.ShowModal;
End;

Procedure TfrmPrincipal.sbtnDestacClick(Sender: TObject);
Begin
   frmCadDestacamento := TfrmCadDestacamento.create(self);                          
   frmCadDestacamento.ShowModal;
End;

Procedure TfrmPrincipal.sbtnFeriasClick(Sender: TObject);
Begin
   AbrirForm(frmCadFerias, TfrmCadFerias, false);
End;

Procedure TfrmPrincipal.sbtnSolicServClick(Sender: TObject);
Begin
   If (bTemManut) Then
      AbrirForm(frmCadOSMan, TfrmCadOSMan, false)
   Else
      AbrirForm(frmSolicServico, TfrmSolicServico, false);
End;

Procedure TfrmPrincipal.mnuCadCandidatosClick(Sender: TObject);
Begin
   AbrirForm(frmCadCand, TfrmCadCand, false);
End;

Procedure TfrmPrincipal.mnuSolicitacaodeFeriasClick(Sender: TObject);
Begin
   AbrirForm(frmCadFerias, TfrmCadFerias, false);
End;

Procedure TfrmPrincipal.mnuSolicitacaodeDestacamentoClick(Sender: TObject);
Begin
   frmCadDestacamento := TfrmCadDestacamento.create(self);
   frmCadDestacamento.ShowModal;
End;

Procedure TfrmPrincipal.mnuSolicitacaodeServicodeManutencaoClick(Sender: TObject);
Begin
   If bTemManut Then
      AbrirForm(frmCadOSMan, TfrmCadOSMan, false)
   Else
      AbrirForm(frmSolicServico, TfrmSolicServico, false);
End;

Procedure TfrmPrincipal.sbtnReqMatClick(Sender: TObject);
Begin
   AbrirForm(FrmCadReq, TFrmCadReq, false);
End;

Procedure TfrmPrincipal.spbtnCadCandClick(Sender: TObject);
Begin
   AbrirForm(frmCadCand, TfrmCadCand, false);
End;

Procedure TfrmPrincipal.sbtnReqPesClick(Sender: TObject);
Begin
   AbrirForm(frmCadRequi, TfrmCadRequi, false);
End;

Procedure TfrmPrincipal.sbtnContratosClick(Sender: TObject);
Begin
   AbrirForm(frmCadContrato, TfrmCadContrato, false);
End;

Procedure TfrmPrincipal.sbtnOrcamClick(Sender: TObject);
Begin
   With (dtmRelatoriosModAuto) Do
      Begin
         ImprimeRelatorio.Iniciar(dsgnRelatorios, rpOrcxRealConta, pplOrcxRealConta,
            qryOrcxRealConta, GetLayoutPadrao, 'Orçado x Realizado',
            'rpOrcxRealConta', 'OrcadoxRealizado.tmp', 417);
      End;

   If (AbrirFormModal(FrmRParamOrcxRealConta, TFrmRParamOrcxRealConta) = mrOk) Then
      Begin
         ImprimeRelatorio.TipoImpressao := tpQueryComDados;
         ImprimeRelatorio.QueryDados.Assign(dtmRelatoriosModAuto.qryOrcxRealConta.SQL);
         ImprimeRelatorio.Imprimir([null]);
         frmAguarde.Apaga;
      End;
End;

Procedure TfrmPrincipal.mnuManutencaodeAPseGRsClick(Sender: TObject);
Begin
   //  TfrmLancDocCAPCAR.AbrirForm; //Renan Cristiano Sol Nº 126385 Kintana 6585269
End;

Procedure TfrmPrincipal.sbtnValeTranspClick(Sender: TObject);
Begin
   AbrirForm(frmRegLinha, TfrmRegLinha, false);
End;

Procedure TfrmPrincipal.mnuSolicitacaodeValeTransporteClick(Sender: TObject);
Begin
   AbrirForm(frmRegLinha, TfrmRegLinha, false);
End;

Procedure TfrmPrincipal.mnuTrsDesligamentoClick(Sender: TObject);
Begin
   AbrirForm(frmResciContr, TfrmResciContr, false);
End;

Procedure TfrmPrincipal.tbarbtRescisaoClick(Sender: TObject);
Begin
   AbrirForm(frmResciContr, TfrmResciContr, false);
End;

Procedure TfrmPrincipal.mnuRequisicaodeMaterialClick(Sender: TObject);
Begin
   AbrirForm(frmCadReq, TfrmCadReq, false);
End;

Procedure TfrmPrincipal.sbtnRegTreinIndivClick(Sender: TObject);
Begin
   AbrirForm(frmCadRegTrein, TfrmCadRegTrein, false);
End;

Procedure TfrmPrincipal.mnuRegistroIndividualdeTreinamentoClick(Sender: TObject);
Begin
   AbrirForm(frmCadRegTrein, TfrmCadRegTrein, false);
End;

Procedure TfrmPrincipal.mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
Begin
   AbrirForm(frmRegTreinColetivo, TfrmRegTreinColetivo, false);
End;

Procedure TfrmPrincipal.spbtnSolicSaudeClick(Sender: TObject);
Begin
   AbrirForm(frmSolicSaude, TfrmSolicSaude, false);
End;

Procedure TfrmPrincipal.mnuSolicPlanodeSaudeClick(Sender: TObject);
Begin
   AbrirForm(frmSolicSaude, TfrmSolicSaude, false);
End;

Procedure TfrmPrincipal.mnuRequisicaoodePessoalClick(Sender: TObject);
Begin
   AbrirForm(frmCadRequi, TfrmCadRequi, false);
End;

Procedure TfrmPrincipal.sbtnSolAltFuncClick(Sender: TObject);
Begin
   AbrirForm(frmCadRegSolic, TfrmCadRegSolic, false);
End;

Procedure TfrmPrincipal.mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
Begin
   AbrirForm(frmCadRegSolic, TfrmCadRegSolic, false);
End;

Procedure TfrmPrincipal.mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
Begin
   AbrirForm(frmSelSolic, TfrmSelSolic, false);
End;

Procedure TfrmPrincipal.spbtnSolicTicketClick(Sender: TObject);
Begin
   AbrirForm(frmSolicTicket, TfrmSolicTicket, false);
End;

Procedure TfrmPrincipal.mnuSolicitaodeTicketClick(Sender: TObject);
Begin
   AbrirForm(frmSolicTicket, TfrmSolicTicket, false);
End;

Procedure TfrmPrincipal.spbtnSolicBenefClick(Sender: TObject);
Begin
   AbrirForm(frmSolicBenef, TfrmSolicBenef, false);
End;

Procedure TfrmPrincipal.mnuSolicitacaoodePlanodeBenefcioClick(Sender: TObject);
Begin
   AbrirForm(frmSolicBenef, TfrmSolicBenef, false);
End;

Procedure TfrmPrincipal.mnuConsultaContratosClick(Sender: TObject);
Begin
   AbrirForm(frmCadContrato, TfrmCadContrato, false);
End;

Procedure TfrmPrincipal.spbtnReembolsoClick(Sender: TObject);
Begin
   AbrirForm(frmLancaRubPorRub, TfrmLancaRubPorRub, false);
End;

Procedure TfrmPrincipal.mnuTransReembolsosparaaEmpresaClick(Sender: TObject);
Begin
   AbrirForm(frmLancaRubPorRub, TfrmLancaRubPorRub, false);
End;

Procedure TfrmPrincipal.spbtnTesteClick(Sender: TObject);
Begin
   AbrirForm(frmConsHst, TfrmConsHst, false);
End;

Procedure TfrmPrincipal.mnuEstatisticadeCustosdeRHClick(Sender: TObject);
Begin
   AbrirForm(frmSelEstCusto, TFrmSelEstCusto, false);
End;

Procedure TfrmPrincipal.spbtnCadFuncClick(Sender: TObject);
Begin
   AbrirForm(frmCadFunc, TfrmCadFunc, false);
End;

Procedure TfrmPrincipal.mnuCadPessoalClick(Sender: TObject);
Begin
   AbrirForm(frmCadFunc, TfrmCadFunc, false);
End;

Procedure TfrmPrincipal.spbtnConsHistClick(Sender: TObject);
Begin
   AbrirForm(frmConsHst, TfrmConsHst, false);
End;

Procedure TfrmPrincipal.mnuConsHistoricosdaPessoaClick(Sender: TObject);
Begin
   AbrirForm(frmConsHst, TfrmConsHst, false);
End;

Procedure TfrmPrincipal.mnuDemonstrativodePagamentoEspecialClick(Sender: TObject);
Begin
   Inherited;
   AbrirFormModal(frmParamRelTxtCCheque, TfrmParamRelTxtCCheque);
End;

Procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
Var
   CmCtrlRptModAuto: TCmCtrlRptModAuto;
Begin
   Inherited;
   CmCtrlRptModAuto := TCmCtrlRptModAuto.Create;
   Try
      Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModAuto, DesReport);
      CmCtrlRptModAuto.Free;
   Except
      CmCtrlRptModAuto.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; Var Printed: Boolean);
Var
   RptModAuto: TCmCtrlRptModAuto;
Begin
   Inherited;
   RptModAuto := TCmCtrlRptModAuto.Create;
   Try
      Printed := ShowReport(IdReports, RptModAuto);
      RptModAuto.Free;
   Except
      RptModAuto.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer;
   Var sParams: String; Var PrintReport: Boolean);
Begin
   Case (IdReports) Of
      3254: FrmPreviewReports := TfrmParamResFolComp.Create(Self);
      3257: FrmPreviewReports := TfrmParamVariavelMensal.Create(Self);
      3418: FrmPreviewReports := TfrmParamEtiquetas.Create(Self);
      3420: FrmPreviewReports := TfrmParamFichaFunc.Create(Self);
      3422: FrmPreviewReports := TfrmParamCadPessoal.Create(Self);
      3428: FrmPreviewReports := TfrmParamAlterFuncional.Create(Self);
      4292: FrmPreviewReports := TfrmParamFolhaFreq.Create(Self);
   Else FrmPreviewReports := Nil;
   End;
   Inherited;
End;

Function TfrmPrincipal.GetLayoutPadrao: TStringList;
Var
   Aux: TStringList;
Begin
   Aux := TStringList.Create;
   Aux.Add('');
   Result := Aux;
End;

Procedure TfrmPrincipal.mnuCadTipoServioManutClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadServicoManut, TfrmCadServicoManut, false);
End;

Procedure TfrmPrincipal.mnuIntegraDestacamentoClick(Sender: TObject);
Begin
   Inherited;
   // edilaine - SOL 185481 / KTN 1907260 - inicio
   // frmDestacamentoPendente := TfrmDestacamentoPendente.create(self);
   // frmDestacamentoPendente.ShowModal;
   AbrirForm(frmDestacamentoPendente, TfrmDestacamentoPendente, false);
   // edilaine - SOL 185481 / KTN 1907260 - fim
End;

Procedure TfrmPrincipal.mnuDiariasClick(Sender: TObject);
Begin
   Inherited;
   frmCadTarifasDiarias := TfrmCadTarifasDiarias.create(self);
   frmCadTarifasDiarias.ShowModal;
End;

Procedure TfrmPrincipal.mnuHospedagemClick(Sender: TObject);
Begin
   Inherited;
   frmCadTarifasHospedagem := TfrmCadTarifasHospedagem.create(self);
   frmCadTarifasHospedagem.ShowModal;
End;

Procedure TfrmPrincipal.mnuAeroportosClick(Sender: TObject);
Begin
   Inherited;
   frmDstCadAeroporto := TfrmDstCadAeroporto.create(self);
   frmDstCadAeroporto.ShowModal;
End;

Procedure TfrmPrincipal.mnuTaxiClick(Sender: TObject);
Begin
   Inherited;
   frmCadTarifasTaxi := TfrmCadTarifasTaxi.create(self);
   frmCadTarifasTaxi.ShowModal;
End;

Procedure TfrmPrincipal.mnuLocacaodeVeiculoClick(Sender: TObject);
Begin
   Inherited;
   frmCadTarifasLocacaoVeiculos := TfrmCadTarifasLocacaoVeiculos.create(self);
   frmCadTarifasLocacaoVeiculos.ShowModal;
End;

Procedure TfrmPrincipal.mnuParametrosIntegracaoClick(Sender: TObject);
Begin
   frmCadDstParam := TfrmCadDstParam.create(self);
   frmCadDstParam.ShowModal;
End;

procedure TfrmPrincipal.mnuBloqUsuariosClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 228736/17139 PPM 761996 - início
  frmCadBloqUsuario := TfrmCadBloqUsuario.Create(Self);
  frmCadBloqUsuario.ShowModal;
  // Felipe A. Santos SOL 228736/17139 PPM 761996 - fim
end;

Initialization
   Sistema.NomeModulo := 'RH - Auto Atendimento';
   Sistema.IdModulo := MODAUTO;
   Sistema.Versao := '3.09.09';
   Sistema.NomeAplicativo := 'Auto Atendimento (RH e Serviços)';
Finalization
End.

