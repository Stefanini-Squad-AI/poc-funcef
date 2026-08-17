//***************************************************************************************
//N. SIG                : 122397
//Data da Alteração:    : 28/02/2023
//Responsável:          : Cássio Florencio Rovaroto
//Descrição             : Inclusão do Menu "Cadastros -> Natureza de Rendimento REINF
//****************************************************************************************
//Rotina                :
//N. SIG                : 52031
//Data da Alteração:    : 11/01/2018
//Alteração Form:       : mnuSPED 
//Responsável:          : Darivaldo Alencar
//Descrição             : Alteração caption do menu
//****************************************************************************************
//Rotina                : mnuDCTFRubricasdeDebitodasFolhas
//N. SIG                : 36178
//Data da Alteração:    : 18/04/2017
//Alteração Form:       : frmCadDCTFRubricas
//Responsável:          : Paulo Nobre
//Descrição             : Inclusão do Menu "Cadastros -> DCTF - Lançamento de Rubricas de Débito das Folhas
//****************************************************************************************
//Rotina                : mnuPrepararDARFFolhadeBenefcios
//N. SIG                : 34742
//Data da Alteração:    : 06/12/2016
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Paulo Nobre
//Descrição             : Inclusão do Menu "Gerações -> Preparar DARF - Folha de Benefícios
//                      : Inclusão do Menu "Gerações -> Gerar DARF - Folha de Benefícios
//****************************************************************************************
//Rotina                : TMenuItem
//N. SIG                : SIG27632
//Data da Alteração:    : 23/08/2016
//Responsável:          : William Moreira da Silva
//Descrição             : Alterar nome do menu, e desabilitar combo "Folha de Beneficios" (.DFM)
//***************************************************************************************
//Rotina                : ArquivoDigitalClick
//N. SOL                : 269449
//N. PPM                : 1303867
//Data da Alteração:    : 26/02/2015
//Responsável:          : Marcelo Cardoso
//Descrição             : Ao clicar no botão de chamada da tela, nenhuma tela
//                        é aberta.
//***************************************************************************************
//Rotina                : mnuNovaBUSCAClick
//N. SOL                : 227955/17939
//N. PPM                : 1176698 (KTN 2063433)
//Data da Alteração:    : 01/03/2015
//Alteração Form:       : FrmBUSCA_DIRFFolhaBeneficios
//Responsável:          : Paulo Nobre
//Descrição             : Inclusão do Menu "Gerações -> Lançamentos de Outros Sistemas ->
//                                          Fazer Busca -> Folha de Benefícios
{*******************************************************************************
//Rotina                : ArquivoDigitalClick
//N. Sol..........      : 242573 / 16949
//N. PPM..........      : 979572
//Data da Alteração:    : 04/09/2015
//Responsável:          : Robson Andrade
//Descrição.......      : Inclusão do Menu "Gerações -> Arquivo Digital - Resgate e Contribuições"
//***************************************************************************************
//Rotina                : mnuGerenciadorDIRFClick, VerificaSeUsuarioEstaNoGrupo
//N. Sol..........      : 244016
//N. PPM..........      : 595531
//Data da Alteração:    : 28/11/2014
//Alteração Form:       : FGeraDIRF_Novo
//Responsável:          : Paulo Nobre
//Descrição.......      : Verificando a existencia de usuarios nos grupos antes de chamar o form
{*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 1235889
Sol......: 155850
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************
Analista.: Paulo Nobre
Data.....: 30/10/2013
Kintana..: 814886
Sol......: 126092/1347
Descrição: Inclusão da Funcionalidade para Gerenciar a DIRF.
********************************************************************************
Analista.: Paulo Nobre
Data.....: 30/10/2013
Kintana..: 784469
Sol......: 126088_1342
Descrição: Inclusão da Funcionalidade para Gerenciar a DCTF.
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Data.....: 26/12/2011
Kintana..: 1471869
Sol......: 155071
Descrição: Inclusão da Funcionalidade para consulta do movimento individual para
           a DIRF.
********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 12/11/2009
Kintana..: 123357
Sol......: 616264
Descrição: Inclusão da Funcionalidade de Manutenção de Documentos (AP)
********************************************************************************}
Unit FPrincipal;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Db, Wwdatsrc, DBTables, Wwquery, Menus,
  TB97, ComCtrls, ExtCtrls, stdctrls, uAutorizacao, wwdblook, DBCtrls, Mask,
  wwdbedit, uSistema, fTelaAut, TB97Tlwn, TB97Tlbr, TB97Ctls, fParamConfIRRFAna,
  IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, Wwintl, CorreioCM,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar, SConnect, MConnect, DBClient, uctrlParamIntegra, FileCtrl, fParamConfIRRF,
  uResource, fParamCompAnualRetIRPJCSLLPISCOFINS, CMNetUsers,
  fAcertaValorMT, FGeraGPSMT, FGeraDARMMT, FInformeDeParaMT, uCtrlModuloIRRF, dbasedados,
  uCtrlGeraDarf, dLookIRRF, uMensErro, uCtrlUtil, uCtrlParamIRRF, uCtrlGeraGPS,
  FDesfazAcertaValorMT, fPai, FRelRecContrib, Buttons, wwstorep;

Type
  TfrmPrincipal = Class(TfrmCMPrincipal)
    NaturezadoRendimento1: TMenuItem;
    Lanamentos1: TMenuItem;
    Geraes1: TMenuItem;
    IRRFdoCARCAP1: TMenuItem;
    Darf1: TMenuItem;
    Dirf1: TMenuItem;
    LancamentonoIRRF1: TMenuItem;
    ImpostodeRendaPessoaFsica1: TMenuItem;
    LancamentosnoDarf1: TMenuItem;
    LinhasparaoInformedeRendimento1: TMenuItem;
    FolhadePagamentoBenefcio1: TMenuItem;
    ImpostosxAlteradores1: TMenuItem;
    LayOutdoInformeparaPF1: TMenuItem;
    InformedeRendimentoPF1: TMenuItem;
    ExceesparaoInforme1: TMenuItem;
    Fornecedores1: TMenuItem;
    GFIP1: TMenuItem;
    DCTF1: TMenuItem;
    BuscaIOFEmprstimo1: TMenuItem;
    HistoricoParamsIR: TMenuItem;
    DesfazerBuscadoIRRFdeOutrosSistemas1: TMenuItem;
    mnuFolhasdePagamentosBenefcios1: TMenuItem;
    mnuEmprstimosIOF1: TMenuItem;
    FazerBusca1: TMenuItem;
    N2: TMenuItem;
    mnuExclusaoDARFDeposito: TMenuItem;
    N1: TMenuItem;
    LancamentoEspecialDeducao: TMenuItem;
    mnuCompVlrNegativo: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuCadTabelaRegressiva: TMenuItem;
    mnuGPS: TMenuItem;
    mnuDARM: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    mnuExecBuscaCap: TMenuItem;
    N8: TMenuItem;
    N7: TMenuItem;
    mnuCadGPSMT: TMenuItem;
    mnuCadDARMMT: TMenuItem;
    N9: TMenuItem;
    mnuDPrev: TMenuItem;
    mnuAssocLinhaOrigemxDestino: TMenuItem;
    mnuIsencaoRetroativa: TMenuItem;
    mnuDesfazerCompensaValorNegativodaBusca: TMenuItem;
    N10: TMenuItem;
    mnuManutDocumentos: TMenuItem;
    ConsultaBuscaDirf1: TMenuItem;
    N11: TMenuItem;
    mnuAssociaodeContribuioporAno: TMenuItem;
    mnuRelatorioDIRF: TMenuItem;
    N12: TMenuItem;
    mnuDaconDIPJ: TMenuItem;
    mnuDacon: TMenuItem;
    mnuDIPJ: TMenuItem;
    mnuRelDivergeFolhaxComprov: TMenuItem;
    mnuGerenciadorDCTF: TMenuItem;
    mnuGerenciadorDIRF: TMenuItem; // Thiago Melo SOL 159720 Kintana 1789355
    mnuSPED: TMenuItem;
    mnuNovaBUSCA: TMenuItem; // Edilaine - SOL 155850 / KTN 1235889
    ArquivoDigital: TMenuItem;
    N13: TMenuItem;
    SpeedButton1: TSpeedButton;
    mnuPrepararDARFFolhadeBeneficios: TMenuItem;
    mnuGerarDARFFolBenef: TMenuItem;
    mnuDCTFRubricasdeDebitodasFolhas: TMenuItem; // Robson.Andrade - SOL242573 / 16949 PPM 979572
    mnuNatuRendimentoREINF: TMenuItem; 

    Procedure NaturezadoRendimento1Click(Sender: TObject);
    Procedure nmuConfigParametrosClick(Sender: TObject);
    Procedure LancamentonoIRRF1Click(Sender: TObject);
    Procedure Darf1Click(Sender: TObject);
    Procedure ImpostodeRendaPessoaFsica1Click(Sender: TObject);
    Procedure Dirf1Click(Sender: TObject);
    Procedure LancamentosnoDarf1Click(Sender: TObject);
    Procedure LinhasparaoInformedeRendimento1Click(Sender: TObject);
    Procedure FolhadePagamentoBenefcio1Click(Sender: TObject);
    Procedure ImpostosxAlteradores1Click(Sender: TObject);
    Procedure LayOutdoInformeparaPF1Click(Sender: TObject);
    Procedure InformedeRendimentoPF1Click(Sender: TObject);
    Procedure ExceesparaoInforme1Click(Sender: TObject);
    Procedure Fornecedores1Click(Sender: TObject);
    Procedure AppPadraoAfterLogin(Sender: TObject);
    Procedure AppPadraoCreateFormReports(Sender: TObject);
    Procedure GFIP1Click(Sender: TObject);
    Procedure DCTF1Click(Sender: TObject);
    Procedure BuscaIOFEmprstimo1Click(Sender: TObject);
    Procedure AppPadraoPrintReportPadrao(sender: TObject; IDReports: Integer; sFileName: String; Var Printed: Boolean);
    Procedure AppPadraoShowParamReportPadrao(sender: TObject; IDReports: Integer; Var sParams: String; Var PrintReport: Boolean);
    Procedure AppPadraoConfigReportPadrao(liIDReports, liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
    Procedure ApagarGeraoFolha1Click(Sender: TObject);
    Procedure mnuDemoRetClick(Sender: TObject);
    Procedure HistoricoParamsIRClick(Sender: TObject);
    Procedure mnuFolhasdePagamentosBenefcios1Click(Sender: TObject);
    Procedure mnuEmprstimosIOF1Click(Sender: TObject);
    Procedure mnuExclusaoDARFDepositoClick(Sender: TObject);
    Procedure mnuInformeEmprestimoClick(Sender: TObject);
    Procedure mnuCompVlrNegativoClick(Sender: TObject);
    Procedure mnuCadTabelaRegressivaClick(Sender: TObject);
    Procedure mnuGPSClick(Sender: TObject);
    Procedure mnuDARMClick(Sender: TObject);
    Procedure mnuExecBuscaCapClick(Sender: TObject);
    Procedure mnuCadGPSMTClick(Sender: TObject);
    Procedure mnuCadDARMMTClick(Sender: TObject);
    Procedure mnuDPrevClick(Sender: TObject);
    Procedure mnuAssocLinhaOrigemxDestinoClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure mnuIsencaoRetroativaClick(Sender: TObject);
    Procedure mnuDesfazerCompensaValorNegativodaBuscaClick(
      Sender: TObject);
    Procedure mnuManutDocumentosClick(Sender: TObject);
    Procedure ConsultaBuscaDirf1Click(Sender: TObject);
    Procedure btn1Click(Sender: TObject);
    Procedure mnuAssociaodeContribuioporAnoClick(Sender: TObject);
    Procedure mnuRelatorioDIRFClick(Sender: TObject);
    Procedure mnuDaconDIPJClick(Sender: TObject);
    Procedure mnuDaconClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure mnuDIPJClick(Sender: TObject);
    Procedure mnuRelDivergeFolhaxComprovClick(
      Sender: TObject);
    Procedure mnuGerenciadorDCTFClick(Sender: TObject);
    Procedure mnuGerenciadorDIRFClick(Sender: TObject); // Thiago Melo SOL 159720 Kintana 1789355
    Procedure mnuSPEDClick(Sender: TObject);
    Procedure ArquivoDigitalClick(Sender: TObject);
    Procedure mnuNovaBUSCAClick(Sender: TObject);
    Procedure mnuPrepararDARFFolhadeBeneficiosClick(Sender: TObject);
    Procedure mnuGerarDARFFolBenefClick(Sender: TObject);
    Procedure mnuDCTFRubricasdeDebitodasFolhasClick(Sender: TObject); // Edilaine - SOL 155850 / KTN 1235889
    procedure mnuNatuRendimentoREINFClick(Sender: TObject); 

  Private // Private declarations

    Modulo: TCtrlModuloIRRF;
    GeraDarf: TCtrlGeraDarf;
    GeraGPS: TCtrlGeraGPS;
    CtrlUtil: TCtrlUtil;
    ParamIRRF: TCtrlParamIRRF;
    Procedure HabilitaMenu;

  Public // Public declarations

  End;

Var
  frmPrincipal: TfrmPrincipal;

Implementation
{$R *.DFM}
Uses
  FCadNatRendimento, FParamIRRF, FLancIRRF,
  FCadTabIRRFMT, FCadInformeMT, FCadNatRendimentoMT, FTipoAltxImpostosMT,
  FCadExcInformeMT, FParamIRRFMT, fCadastroDarfMT, FLancIRRFxInformeMT,
  FGeraFolhaMT, FBuscaIOFEmprestimoMT, FGeraDarfMT,
  FGeraDIRFMT, FGfipMT, FDCTFMT,
  uCtrlRptIRRF, fParamGPS, fParamCompRendPessJurid, fCadForne, DRelatIRRF,
  uCtrlRptGPS, FConfigRelatInformeMT, FdeletaFolhaMT,
  uApuracaoMensalRet, FCadHstParamIRRFMT, FDeletaIOFMT,
  DRelVerBuscaFolhaBen, FPRelVerBuscaFolhaBen,
  fParamDARM, dRelatInformeFacultativo,
  FExcluiMultDarfs, FLancaDeducaoEspecial, FGeraInformeEmptmoMT,
  RDarfDepositoJud, FCadTabIRRFRegressiva, FCadGPSMT, FExecBuscaCaPMT,
  fGeraDCTFMT, FCadDARMMT, FGeraDPrevMT, FIsencaoValorMT, FLancDocCAPCAR,
  dCds, FConsultaBuscaMT, FCadAssociacaoContribAno, FRelDirfIndividual,
  FCadLinhasDaconMT, FCadDIPJ,
  FCadDACONMT, FCadSPEDMT, // Edilaine - SOL 155850 / KTN 1235889
  FRelDivergeFolhaXComprov, // Thiago Melo SOL 159720 Kintana 1789355
  FGeraDCTF_Novo, FGeraDIRF_Novo, FBUSCA_DIRFFolhaBeneficios,
  FPrepararDARFFolBenef, FGeraDARF_Novo,
  // SIG 36178 - Paulo Nobre - Inicio
  FCadDCTFRubricas, FCadNatRendimentoREINF;
  // SIG 36178 - Paulo Nobre - Fim
 //, FRelRecContrib;

Procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  sFinalMens: String;
  iNumDias, iContDias: Integer;
  iAno, iMes, iDia: Word;

  dDataVencIOF, dDataVencIRRF, dDataVencCSLL, dDtIniIRRF,
    dDtFimIRRF, dDtIniCSLL, dDtFimCSLL, dDtIniIOF,
    dDtFimIOF, dUltDiaUtilMes, dDataUtilIRRF, dDataUtilCSLL,
    dDataUtilIOF: TDateTime;
  bMostra: boolean;
Begin
  Inherited;
  MnuConsPart_Padrao.Visible := False;

  // Se não fez o login
  If Not Sistema.FezLogin Then
    exit;

  // Essa Rotina foi criada para liberar um item de menu, permitindo que consultado a busca de um determinado
  // beneficiário em um ano, caso não queria que ela seja liberada é só retirar a definição da variavel bMostra

 //  bMostra := True;
  bMostra := FileExists('\planus\temp\Impostos.ini');

  ConsultaBuscaDirf1.Visible := bMostra;
  ConsultaBuscaDirf1.Enabled := bMostra;
  N11.Visible := bMostra;
  //  mnuPrepararDARFFolhadeBeneficios.Enabled := True;
  //  mnuGerarDARFFolBenef.Enabled := True;

    // Arnaldo V. Scarin - 15/08/2011
    // retirar essa linha daqui quando os testes terminarem.
  //   mnuDACONDIPJ.Enabled := bMostra;
  //   mnuDacon.Enabled := bMostra;

  stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

  If Sistema.MudouEmpresa Then
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  GeraGPS := TCtrlGeraGPS.Create;
  GeraGPS.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  ParamIRRF := TCtrlParamIRRF.Create;
  ParamIRRF.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  dtmLookIRRF.cdsParamIRRF.data := ParamIRRF.ProcurarParamIRRF(Sistema.IdEmpresa);
  iNumDias := dtmLookIRRF.cdsParamIRRF.FieldByName('NUMDIASAVISODARF').AsInteger;

  If iNumDias > 0 Then
    Begin
      {Busca as datas de vencimento e de início e fim do período de apuração de Imposto de Renda}
      dDataVencIRRF := Modulo.CalcProxDiaSemana(Sistema.idempresa, Date, 3, True, 0);
      dDtIniIRRF := Modulo.CalcDataIni(dDataVencIRRF, 0);
      dDtFimIRRF := Modulo.CalcDataFim(dDataVencIRRF, 0);
      dDataUtilIRRF := dDataVencIRRF;

      {Busca as datas de vencimento e de início e fim do período de apuração de CSLL/PIS/COFINS}
      dDataVencCSLL := Modulo.CalcProxDiaSemana(Sistema.idempresa, Date, 3, True, 1);
      dDtIniCSLL := Modulo.CalcDataIni(dDataVencCSLL, 1);
      dDtFimCSLL := Modulo.CalcDataFim(dDataVencCSLL, 1);
      dDataUtilCSLL := dDataVencCSLL;

      {Busca as datas de vencimento e de início e fim do período de apuração de IOF}
      dDataVencIOF := Modulo.CalcProxDiaSemana(Sistema.idempresa, Date, 3, True, 2);
      dDtIniIOF := Modulo.CalcDataIni(dDataVencIOF, 2);
      dDtFimIOF := Modulo.CalcDataFim(dDataVencIOF, 2);
      dDataUtilIOF := dDataVencIOF;

      For iContDias := 1 To iNumDias Do
        Begin
          While True Do
            Begin
              dDataUtilIRRF := dDataUtilIRRF - 1;
              If DiasUteis.DiaUtil(dDataUtilIRRF, -1, -1, '', True, True, False) Then Break;
            End;

          While True Do
            Begin
              dDataUtilCSLL := dDataUtilCSLL - 1;
              If DiasUteis.DiaUtil(dDataUtilCSLL, -1, -1, '', True, True, False) Then Break;
            End;

          While True Do
            Begin
              dDataUtilIOF := dDataUtilIOF - 1;
              If DiasUteis.DiaUtil(dDataUtilIOF, -1, -1, '', True, True, False) Then Break;
            End;

        End;

      If (iNumDias = 1) Then
        sFinalMens := ' dia útil antes do vencimento.'
      Else
        sFinalMens := ' dias úteis antes do vencimento.';

      If ((dDataVencIRRF >= Date) And
        (dDataUtilIRRF <= Date)) Or

      ((dDataVencCSLL >= Date) And
        (dDataUtilCSLL <= Date)) Or

      ((dDataVencIOF >= Date) And
        (dDataUtilIOF <= Date)) Then
        Begin
          dtmLookIRRF.cdsLancIRRF.Data := GeraDarf.BuscaRegPendenteDarf(dDtIniIRRF, dDtFimIRRF, dDtIniCSLL, dDtFimCSLL, dDtIniIOF, dDtFimIOF);

          If ((dDataVencIRRF >= Date) And
            (dDataUtilIRRF <= Date)) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('VALOR_IRRF').AsFloat > 0) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('QTD_IRRF').AsFloat > 0) Then
            Begin
              MsgDlg('Existem registros de busca que ainda não teve Darf de Imposto de Renda gerado.', 'Informação', mtInformation, [mbOk], 0);
              CtrlUtil.GravaLogTOTALPREV('Aviso de registros para ser gerado Darf de Imposto de Renda ' + IntToStr(iNumDias) + sFinalMens);
            End;

          If ((dDataVencCSLL >= Date) And
            (dDataUtilCSLL <= Date)) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('VALOR_CSLL').AsFloat > 0) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('QTD_CSLL').AsFloat > 0) Then
            Begin
              MsgDlg('Existem registros de busca que ainda não teve Darf de CSLL/PIS/COFINS gerado.', 'Informação', mtInformation, [mbOK], 0);
              CtrlUtil.GravaLogTOTALPREV('Aviso de registros para ser gerado Darf de CSLL/PIS/COFINS  ' + IntToStr(iNumDias) + sFinalMens);
            End;

          If ((dDataVencIOF >= Date) And
            (dDataUtilIOF <= Date)) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('VALOR_IOF').AsFloat > 0) And
            (dtmLookIRRF.cdsLancIRRF.FieldByName('QTD_IOF').AsFloat > 0) Then
            Begin
              MsgDlg('Existem registros de busca que ainda não teve Darf de IOF gerado.', 'Informação', mtInformation, [mbOk], 0);
              CtrlUtil.GravaLogTOTALPREV('Aviso de registros para ser gerado Darf de IOF ' + IntToStr(iNumDias) + sFinalMens);
            End;
        End;
    End;

  DecodeDate(Date, iAno, iMes, iDia);
  //dUltDiaUtilMes := diasuteis.UltDiaUtilMes(Sistema.IdEmpresa, iAno, iMes, False, False, True); //CMPrev - 24355
  dUltDiaUtilMes := DiasUteis.UltDiaUtilMes(Sistema.IdEmpresa, iAno, iMes, False, False, False); //CMPrev - 24355

  If (dUltDiaUtilMes = Date) Then
    Begin
      dtmLookIRRF.cdsLancIRRF.Data := GeraGps.ListLancPendentes(StrToDate('01/' + IntToStr(iMes) + '/' + IntToStr(iAno)),
        diasuteis.UltDiaMes(iAno, iMes),
        0,
        True,
        True);

      If Not dtmLookIRRF.cdsLancIRRF.IsEmpty Then
        Begin
          MsgDlg('Existem registros de INSS que ainda não teve o documento de GPS gerado.', 'Informação', mtInformation, [mbOk], 0);
          CtrlUtil.GravaLogTOTALPREV('Aviso no último dia útil do mês de registros de INSS para ser gerado a GPS.');
        End;
    End;
End;

Procedure TfrmPrincipal.HabilitaMenu;
Var
  i: integer;
Begin
  // habilita todos os menus
  For i := 0 To (ComponentCount - 1) Do
    Begin
      If Components[i] Is TMenuItem Then
        (Components[i] As TMenuItem).Enabled := True;
    End;

End;

Procedure TfrmPrincipal.NaturezadoRendimento1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadNatRendimentoMT, TfrmCadNatRendimentoMT, False);
End;

Procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmParamIRRFMT, TfrmParamIRRFMT, False);
End;

Procedure TfrmPrincipal.LancamentonoIRRF1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmLancIRRFxInformeMT, TfrmLancIRRFxInformeMT, False);
End;

Procedure TfrmPrincipal.Darf1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraDarfMT, TfrmGeraDarfMT, False);
End;

Procedure TfrmPrincipal.ImpostodeRendaPessoaFsica1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadTabIRRFMT, TfrmCadTabIRRFMT, False);
End;

Procedure TfrmPrincipal.Dirf1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraDIRFMT, TfrmGeraDIRFMT, False);
End;

Procedure TfrmPrincipal.LancamentosnoDarf1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadastroDarfMT, TfrmCadastroDarfMT, False);
End;

Procedure TfrmPrincipal.LinhasparaoInformedeRendimento1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadInformeMT, TfrmCadInformeMT, False);
End;

Procedure TfrmPrincipal.FolhadePagamentoBenefcio1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraFolhaMT, TfrmGeraFolhaMT, False);
End;

Procedure TfrmPrincipal.ImpostosxAlteradores1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmTipoAltxImpostosMT, TfrmTipoAltxImpostosMT, False);
End;

Procedure TfrmPrincipal.LayOutdoInformeparaPF1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmConfigRelatInformeMT, TfrmConfigRelatInformeMT, False);
  frmConfigRelatInformeMT.HabilitaImpressao(False);

  frmConfigRelatInformeMT.HelpContext := 240027;
  frmConfigRelatInformeMT.bEntrouSeldados := True;
End;

Procedure TfrmPrincipal.InformedeRendimentoPF1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmConfigRelatInformeMT, TfrmConfigRelatInformeMT, False);
  frmConfigRelatInformeMT.HabilitaImpressao(True);
  frmConfigRelatInformeMT.bbtnGeraTxt.Visible := True;
  frmConfigRelatInformeMT.HelpContext := 240031;
End;

Procedure TfrmPrincipal.ExceesparaoInforme1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadExcInformeMT, TfrmCadExcInformeMT, False);
End;

Procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadForne, TfrmCadForne, False);
End;

Procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
Begin
  Inherited;
  Application.CreateForm(TdtmRelatIRRF, dtmRelatIRRF);
  Application.CreateForm(Tdtmrelverbuscafolhaben, dtmrelverbuscafolhaben);
  Application.CreateForm(TdtmInformeFacultativo, dtmInformeFacultativo);
  Application.CreateForm(TfrmRptDarfDepositoJud, frmRptDarfDepositoJud);
End;

Procedure TfrmPrincipal.GFIP1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGFIPMT, TfrmGFIPMT, False);
End;

Procedure TfrmPrincipal.DCTF1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraDCTF, TfrmGeraDCTF, False);
End;

Procedure TfrmPrincipal.BuscaIOFEmprstimo1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmBuscaIOFEmprestimoMT, TfrmBuscaIOFEmprestimoMT, False);
End;

Procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IDReports: Integer; sFileName: String; Var Printed: Boolean);
Var
  RptIRRF: TCtrlRptIRRF;
Begin
  Inherited;

  RptIRRF := TCtrlRptIRRF.Create;
  Try
    Printed := ShowReport(IDReports, RptIRRF);
    RptIRRF.Free;
  Except
    RptIRRF.Free;
    Raise;
  End;
End;

Procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject; IDReports: Integer; Var sParams: String; Var PrintReport: Boolean);
Begin
  Case IDReports Of
    3144: frmPreviewReports := TfrmrptParamGPS.Create(Self);
    20116: frmPreviewReports := TfrmrptParamDARM.Create(Self);
    1741: frmPreviewReports := TfrmRCompRendPessJurid.create(Self);
    20183: frmPreviewReports := TfrmParamCompAnualRetIRPJCSLLPI.create(Self);
    3110: frmPreviewReports := TfrmparamConfIRRF.create(self);
    3109: frmPreviewReports := TfrmParamConfIRRFAna.create(self);
  Else
    frmPreviewReports := Nil;
  End;

  Inherited;
End;

Procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIDReports, liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
Var
  RptMeuModulo: TCtrlRptIRRF;
Begin
  Inherited;
  RptMeuModulo := TCtrlRptIRRF.Create;
  Try
    Config := ConfigReport(liIDReports, liOrigemCm, RptMeuModulo, DesReport);
    RptMeuModulo.free;
  Except
    RptMeuModulo.free;
    Raise;
  End;
End;

Procedure TfrmPrincipal.ApagarGeraoFolha1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmDeletaFolhaMt, TfrmDeletaFolhaMt, False);
End;

Procedure TfrmPrincipal.mnuDemoRetClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmApuracaoMensalRET, TfrmApuracaoMensalRET, False);
End;

Procedure TfrmPrincipal.HistoricoParamsIRClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadHstParamIRRFMT, TfrmCadHstParamIRRFMT, False);
End;

Procedure TfrmPrincipal.mnuFolhasdePagamentosBenefcios1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmDeletaFolhaMt, TfrmDeletaFolhaMt, False);
End;

Procedure TfrmPrincipal.mnuEmprstimosIOF1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmDeletaIOFMt, TfrmDeletaIOFMt, False);
End;

Procedure TfrmPrincipal.mnuExclusaoDARFDepositoClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmExcluiMultDarfs, TfrmExcluiMultDarfs, False);
End;

Procedure TfrmPrincipal.mnuInformeEmprestimoClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraInformeEmptmoMT, TfrmGeraInformeEmptmoMT, False);
End;

Procedure TfrmPrincipal.mnuCompVlrNegativoClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmAcertaValorMT, TfrmAcertaValorMT, False);
End;

Procedure TfrmPrincipal.mnuCadTabelaRegressivaClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadTabIRRFRegressiva, TfrmCadTabIRRFRegressiva, False);
End;

Procedure TfrmPrincipal.mnuGPSClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraGPSMT, TfrmGeraGPSMT, False);
End;

Procedure TfrmPrincipal.mnuDARMClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraDARMMT, TfrmGeraDARMMT, False);
End;

Procedure TfrmPrincipal.mnuExecBuscaCapClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmExecBuscaCaPMT, TfrmExecBuscaCaPMT, False);
End;

Procedure TfrmPrincipal.mnuCadGPSMTClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadGPSMT, TfrmCadGPSMT, False);
End;

Procedure TfrmPrincipal.mnuCadDARMMTClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadDARMMT, TfrmCadDARMMT, False);
End;

Procedure TfrmPrincipal.mnuDPrevClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmGeraDprevMT, TfrmGeraDprevMT, False);
End;

Procedure TfrmPrincipal.mnuAssocLinhaOrigemxDestinoClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(FrmInformeDeParaMT, TFrmInformeDeParaMT, False);
End;

Procedure TfrmPrincipal.FormCreate(Sender: TObject);
Begin
  Inherited;
  GeraDarf := TCtrlGeraDarf.Create;
  Modulo := TCtrlModuloIRRF.Create;
  Modulo.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  GeraDarf.InitializeAs(Modulo);
  dmCds := TdmCds.Create(Application);
End;

Procedure TfrmPrincipal.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  Modulo.Free;
  GeraDarf.Free;
  ParamIRRF.Free;
  dmCds.Free;
End;

Procedure TfrmPrincipal.mnuIsencaoRetroativaClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmIsencaoValorMT, TfrmIsencaoValorMT, False);
End;

Procedure TfrmPrincipal.mnuDesfazerCompensaValorNegativodaBuscaClick(
  Sender: TObject);
Begin
  Inherited;
  AbrirForm(FrmDesfazAcertaValorMT, TFrmDesfazAcertaValorMT, False);
End;

Procedure TfrmPrincipal.mnuManutDocumentosClick(Sender: TObject);
Begin
  Inherited;
  TfrmLancDocCAPCAR.AbrirForm;
End;

Procedure TfrmPrincipal.ConsultaBuscaDirf1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmConsultaBusca, TfrmConsultaBusca, False);
End;

Procedure TfrmPrincipal.btn1Click(Sender: TObject);
Begin
  Inherited;
  Try
    frmCadAssociacaoContribAno := TfrmCadAssociacaoContribAno.Create(Application);
    frmCadAssociacaoContribAno.ShowModal();
  Finally
    FreeAndNil(frmCadAssociacaoContribAno);
  End;
End;

Procedure TfrmPrincipal.mnuAssociaodeContribuioporAnoClick(Sender: TObject);
Begin
  Inherited;
  //AbrirForm(frmCadAssociacaoContribAno, TfrmCadAssociacaoContribAno, False);
  Try
    frmCadAssociacaoContribAno := TfrmCadAssociacaoContribAno.Create(Application);
    frmCadAssociacaoContribAno.ShowModal();
  Finally
    FreeAndNil(frmCadAssociacaoContribAno);
  End;
End;

//Vinicius Maciel - SOL155071 - KTN1471869

Procedure TfrmPrincipal.mnuRelatorioDIRFClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(FrmRelDirfIndividual, TFrmRelDirfIndividual, False);
End;
//Vinicius Maciel - SOL155071 - KTN1471869 - FIM

Procedure TfrmPrincipal.mnuDaconDIPJClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(FrmCadLinhasDaconmt, TFrmCadLinhasDaconmt, False);
End;

Procedure TfrmPrincipal.mnuDaconClick(Sender: TObject);
Begin
  Inherited;
  // pnobre
  Try
    Screen.Cursor := crAppStart;
    frmCadDacon := TfrmCadDacon.Create(Self);
    Screen.cursor := crDefault;
    frmCadDacon.ShowModal;
  Finally
    FreeAndNil(frmCadDacon);
  End;
End;

Procedure TfrmPrincipal.FormShow(Sender: TObject);
Begin
  Inherited;
  HabilitaMenu;
  {
  //Lembrar de retirar BARUC !!!
  mnuDacon.Enabled := tRUE;
  mnuDaconDIPJ.Enabled := tRUE;

  mnuDipj.Enabled := tRUE;

    }

End;

Procedure TfrmPrincipal.mnuDIPJClick(Sender: TObject);
Begin
  Inherited;
  // Baruc
  Try
    Screen.Cursor := crAppStart;
    frmCadDIPJ := TfrmCadDIPJ.Create(Self);
    Screen.cursor := crDefault;
    frmCadDIPJ.ShowModal;
  Finally
    FreeAndNil(frmCadDIPJ);

  End;

End;

// Thiago Melo SOL 159720 Kintana 1789355 Ini

Procedure TfrmPrincipal.mnuRelDivergeFolhaxComprovClick(
  Sender: TObject);
Begin
  Inherited;
  Try
    frmRelDivergeFolhaXComprov := TfrmRelDivergeFolhaXComprov.Create(Application);
    frmRelDivergeFolhaXComprov.ShowModal();
  Finally
    FreeAndNil(frmRelDivergeFolhaXComprov);
  End;
End;
// Thiago Melo SOL 159720 Kintana 1789355 Fim

Procedure TfrmPrincipal.mnuGerenciadorDCTFClick(Sender: TObject);
Begin
  Inherited;
  // pnobre
  Try
    Screen.Cursor := crAppStart;
    frmGeraDCTF_Novo := TfrmGeraDCTF_Novo.Create(Self);
    Screen.cursor := crDefault;
    frmGeraDCTF_Novo.ShowModal;
  Finally
    FreeAndNil(frmGeraDCTF_Novo);
  End;
End;

Procedure TfrmPrincipal.mnuGerenciadorDIRFClick(Sender: TObject);
Begin
  Inherited;
  Try
    // SOL 244016 PPM 595531 - Paulo Nobre
    Screen.Cursor := crAppStart;
    frmGeraDIRF_Novo := TfrmGeraDIRF_Novo.Create(Self);
    Screen.cursor := crDefault;
    If frmGeraDIRF_Novo.VerificaSeUsuarioEstaNoGrupo(Sistema.IdUsuario) Then
      frmGeraDIRF_Novo.ShowForm(frmGeraDIRF_Novo.sTipoMov); // CP / FF / FB
  Finally
    FreeAndNil(frmGeraDIRF_Novo);
  End;
End;

// Edilaine - SOL 155850 / KTN 1235889

Procedure TfrmPrincipal.mnuSPEDClick(Sender: TObject);
Begin
  Inherited;
  AbrirForm(frmCadSpedMT, TfrmCadSpedMT, False);
End;
// Edilaine - SOL 155850 / KTN 1235889

Procedure TfrmPrincipal.ArquivoDigitalClick(Sender: TObject);
Begin
  Inherited;
  //  AbrirForm(frmRelRecContrib, TfrmRelRecContrib,False ); //Marcelo Cardoso - SOL269449 - PPM1303867
  AbrirForm(frmRelRecContrib, TfrmRelRecContrib, False); //Marcelo Cardoso - SOL269449 - PPM1303867
End;

Procedure TfrmPrincipal.mnuNovaBUSCAClick(Sender: TObject);
Begin
  Inherited;
  // SOL 227955/17939 PPM 1176698 - Paulo Nobre
  AbrirForm(frmBUSCA_DIRFFolhaBeneficios, TfrmBUSCA_DIRFFolhaBeneficios, False);
End;

Procedure TfrmPrincipal.mnuPrepararDARFFolhadeBeneficiosClick(
  Sender: TObject);
Begin
  Inherited;
  // SIG 34742 - Paulo Nobre
  AbrirForm(frmPrepararDARFFolBenef, TfrmPrepararDARFFolBenef, False);
End;

Procedure TfrmPrincipal.mnuGerarDARFFolBenefClick(Sender: TObject);
Begin
  Inherited;
  // SIG 34742 - Paulo Nobre
  AbrirForm(frmGeraDARF_Novo, TfrmGeraDARF_Novo, False);
End;

Procedure TfrmPrincipal.mnuDCTFRubricasdeDebitodasFolhasClick(
  Sender: TObject);
Begin
  Inherited;
  // SIG 36178 - Paulo Nobre - Inicio
  AbrirForm(frmCadDCTFRubricas, TfrmCadDCTFRubricas, False);
  // SIG 36178 - Paulo Nobre - Fim
End;

procedure TfrmPrincipal.mnuNatuRendimentoREINFClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadNatRendimentoREINF, TfrmCadNatRendimentoREINF, False);
end;

Initialization
  Sistema.IdModulo := 24;
  Sistema.NomeModulo := 'Impostos e Tributos';
  Sistema.Versao := '3.12.08h';
  Sistema.NomeAplicativo := 'Impostos e Tributos';
  Sistema.LoadOldReport := False;
Finalization

End.

