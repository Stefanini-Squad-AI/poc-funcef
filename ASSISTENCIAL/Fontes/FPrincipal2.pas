unit FPrincipal2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, FCMPrincipal, TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, ppForms, ppPrvDlg,
  fcButton, fcImgBtn, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar, ppVar, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, SConnect, MConnect, DBClient,
  FCadCapSegAss, fDesfazEnvios, fAplicaDiferenca, dRelFat, dRelValsRecebPatro, fLancCap,
  uConsPart, {$IFNDEF Versao05} UcmTypes, uResource {$ELSE} uComum {$ENDIF};

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Produto1: TMenuItem;
    Plano1: TMenuItem;
    ParticipanteAssistencial1: TMenuItem;
    mnuBeneficiarios: TMenuItem;
    mnuCadContribuicoes: TMenuItem;
    AlteradoresXContribuicao1: TMenuItem;
    mnuIntegracao: TMenuItem;
    Auxiliares1: TMenuItem;
    IntegraoFinanceiraContbil1: TMenuItem;
    SitPartPlan1: TMenuItem;
    AssistencialPrevidencirio1: TMenuItem;
    N4: TMenuItem;
    RubricasporPatrocinadora1: TMenuItem;
    CriticadeCarga: TMenuItem;
    mnuContrib: TMenuItem;
    GrupoFamiliar1: TMenuItem;
    Cobranca2: TMenuItem;
    Envio1: TMenuItem;
    Recebimento1: TMenuItem;
    mnupreparo: TMenuItem;
    N6: TMenuItem;
    mnuConsEstimativa: TMenuItem;
    mnuConsControleCobranca: TMenuItem;
    N7: TMenuItem;
    CalendContribPag1: TMenuItem;
    N8: TMenuItem;
    GerarDatas1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Divergncias1: TMenuItem;
    TratamentodeDivergncias1: TMenuItem;
    mnuConsHistoricoCobranca: TMenuItem;
    AtualizarPlanoPrevidencirio1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Importao1: TMenuItem;
    mnuCadAssocPlanoCapitais: TMenuItem;
    Layout1: TMenuItem;
    TiposdeLayout1: TMenuItem;
    CamposdeLayout1: TMenuItem;
    AssociarLayout2: TMenuItem;
    ImportaodeDados2: TMenuItem;
    Automtico1: TMenuItem;
    Manual1: TMenuItem;
    ExportaoemArquivo1: TMenuItem;
    ModificaArquivoRemessa1: TMenuItem;
    Capitais1: TMenuItem;
    DesfazerEnvios1: TMenuItem;
    Alicardiferenca: TMenuItem;
    MnuRepasse: TMenuItem;
    N11: TMenuItem;
    N2: TMenuItem;
    mnuSinistros: TMenuItem;
    mnuConsGeralPartAss: TMenuItem;
    mnuIncluirPartAss: TMenuItem;
    mnuCancelarPatAss: TMenuItem;
    N1: TMenuItem;
    mnuBenefAss: TMenuItem;
    N3: TMenuItem;
    Button1: TButton;
    procedure Produto1Click(Sender: TObject);
    procedure Plano1Click(Sender: TObject);
    procedure PrevidencirioXAssistencial1Click(Sender: TObject);
    procedure AssistencialPrevidencirio1Click(Sender: TObject);
    procedure mnuCadContribuicoesClick(Sender: TObject);
    procedure RubricasporPatrocinadora1Click(Sender: TObject);
    procedure AlteradoresXContribuicao1Click(Sender: TObject);
    procedure verifica_situacao_empresa;
    procedure IntegraoFinanceiraContbil1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure GrupoFamiliar1Click(Sender: TObject);
    procedure Envio1Click(Sender: TObject);
    procedure Recebimento1Click(Sender: TObject);
    procedure SitPartPlan1Click(Sender: TObject);
    procedure GerarDatas1Click(Sender: TObject);
    procedure CalendContribPag1Click(Sender: TObject);
    procedure mnuConsEstimativaClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure TratamentodeDivergncias1Click(Sender: TObject);
    procedure mnuConsControleCobrancaClick(Sender: TObject);
    procedure mnuConsHistoricoCobrancaClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure AtualizarPlanoPrevidencirio1Click(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure Beneficirios1Click(Sender: TObject);
    procedure mnuCadAssocPlanoCapitaisClick(Sender: TObject);
    procedure TiposdeLayout1Click(Sender: TObject);
    procedure CamposdeLayout1Click(Sender: TObject);
    procedure AssociarLayout2Click(Sender: TObject);
    procedure ImportaodeDados2Click(Sender: TObject);
    procedure Automtico1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure ExportaoemArquivo1Click(Sender: TObject);
    procedure ModificaArquivoRemessa1Click(Sender: TObject);
    procedure Capitais1Click(Sender: TObject);
    procedure DesfazerEnvios1Click(Sender: TObject);
    procedure AlicardiferencaClick(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure MnuRepasseClick(Sender: TObject);
    procedure mnuBeneficiariosClick(Sender: TObject);
    procedure mnuSinistrosClick(Sender: TObject);
    procedure mnuConsGeralPartAssClick(Sender: TObject);
    procedure mnuIncluirPartAssClick(Sender: TObject);
    procedure mnuCancelarPatAssClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Conspart1   : TConsPart;

implementation

uses
  UMensErro, FTelaAut, fprodass, DBaseDados, fContrcalc, FEstimaContr,
  UAutorizacao, FPlanass, FCadFornservass,
  FCadPartass, FLogin, UAdmAss, FRecebeContribAss,
  FCobraContribAss,
  FCadSitPlano, FAssocProvPatro, FCtrlInterface, FCadDatasPlanass,
  UModulo, USistema, FDivergContribAss, UIntegraBack,
  FCadContribuicaoCS, FIntegraCapCar, FCadCalendPrev, FCalendGeraAno,
  FCalendDatas, fCadDepTitPlanAss, FCadAlteradorContribCS,
   FParamAssist, fConsLote, fCriticaAdmissao,
  FCadGeralPart, fCadBenSeguro, FCadGrupoFamiliarass, uCmRptManager,
  uCmCtrlRptAssistencial, fTpLayout, fCpLayout, fLgLayout, fImportDados, fAssocTabCap,
  FRelPlanos, fConsHistContrAss, FAtPlanoPrev, FCadHstContribuicao,
  FCadPartAssist, FCadProvento, fExportDados, FormataArquivo,
  FCadDepenBenef, RTabCap, RALTCAP, RBenSegCancel, RBenSeg, RTotalCalc,
  RVlReceb, RVlEnvio, RTOTALENVIO, RVlCalc, RQtPart, RBoletos,
  RParticipantes, rpartcancel, FCadSinistros, fInserePart, fCancelar;
  
{$R *.DFM}

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmProdAss, TfrmProdAss, false); 
end;

procedure TfrmPrincipal.Plano1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPlanAss, TfrmPlanAss, false); 
end;

procedure TfrmPrincipal.PrevidencirioXAssistencial1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPlanAssist, TfrmPlanAssist, false);
end;

procedure TfrmPrincipal.AssistencialPrevidencirio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPlanAssist, TfrmPlanAssist, false);  
end;

procedure TfrmPrincipal.mnuCadContribuicoesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContribuicaoCS, TfrmCadContribuicaoCS, false);
end;

procedure TfrmPrincipal.RubricasporPatrocinadora1Click(Sender: TObject);
begin
  inherited;
  bRubricaPatrocinadora := True;
  AbrirForm(frmAssocProvPatro, TfrmAssocProvPatro, false);   
end;

procedure TfrmPrincipal.AlteradoresXContribuicao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteradorContribCS, TfrmCadAlteradorContribCs, false);   
end;

procedure TfrmPrincipal.IntegraoFinanceiraContbil1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmIntegraCapCar, TfrmIntegraCapCar, false);
end;

procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var qryIntegraBack : TQuery;
begin
  // Verificar se Previdenciário com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';
  qryIntegraBack.SQL.Clear;

  qryIntegraBack.SQL.Add('SELECT FLGINTCONTBASS, FLGINTCPAGAR, FLGINTCRECEBER'+
                          ' FROM PARAMAPREV ');
  qryIntegraBack.open;

  if not (qryIntegraBack.IsEmpty) then
  begin
     if qryIntegraBack.FieldbyName('FLGINTCONTBASS').AsInteger = 1 then
       IntegraBack.Contabilidade := 'S'
     else
       IntegraBack.Contabilidade := 'N';

     if (qryIntegraBack.FieldbyName('FLGINTCPAGAR').AsInteger = 1) or
        (qryIntegraBack.FieldbyName('FLGINTCRECEBER').AsInteger = 1) then
       IntegraBack.Financeiro := 'S'
     else
       IntegraBack.Financeiro := 'N';
  end
  else
  begin
     IntegraBack.Contabilidade := 'N';
     IntegraBack.Financeiro := 'N';
  end;

  if Sistema.IdEmpresa <= 0 then
  begin
     qryIntegraBack.Free;
     Exit;
  end;

  // Preencher parametros da contabilidade
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add('SELECT PL.MASCARA, PC.PLANO'+
                          ' FROM PLANO PL, PARAMCONTAB PC'+
                         ' WHERE (PC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                           ' AND (PL.PLANO = PC.PLANO)');
  qryIntegraBack.Open;
  if not(qryIntegraBack.IsEmpty) then
  begin
      IntegraBack.Plano        := qryIntegraBack.FieldbyName('PLANO').AsInteger;
      IntegraBack.MascaraPlano := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else
  begin
     IntegraBack.Plano := 0;
     IntegraBack.MascaraPlano := '';
  end;

  if (IntegraBack.Contabilidade = 'S') and
      ((IntegraBack.Plano <= 0) or(IntegraBack.MascaraPlano = '')) then
  begin
     MsgDlg(' O Sistema Assistencial está integrado com o Sistema de Contabilidade.'+
            ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados.'+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;
  // Preencher parametros de integracao com CAP/CAR
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add
   ('SELECT PREC.MASCARADESEMB AS MASCARAREC, PPAG.MASCARADESEMB AS MASCARAPAG  '+
     ' FROM PARAMCAP PREC, PARAMCAP PPAG'+
    ' WHERE (PREC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
      ' AND (PPAG.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
      ' AND (PREC.RECPAG = ''R'')'+
      ' AND (PPAG.RECPAG = ''P'')');
  qryIntegraBack.Open;

  if (not qryIntegraBack.IsEmpty) then
  begin
     IntegraBack.MascaraDesemb:= qryIntegraBack.FieldbyName('MASCARAREC').AsString;
     IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else
  begin
     IntegraBack.MascaraDesemb := '';
     IntegraBack.MascaraDesemb := '';
  end;

  if (IntegraBack.Financeiro = 'S') and(Trim(IntegraBack.MascaraDesemb) = '')
  then begin
     MsgDlg(' O Sistema Asistencial está integrado com o Sistema de Contas a Receber.'+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados.'+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;
  //Verifica se a empresa utiliza o sistema ABC(Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add('SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                          ' FROM PARAMGLOBAL '+
                         ' WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty then
  begin
     IntegraBack.ObrigaABC := 'S';
     IntegraBack.ObrigaCRespon := 'S';
     prmUnidNegoc := -1;
     prmCodCentroRespon := '';
  end
  else
  begin
     if qryIntegraBack.FieldByName('USAABC').AsString = 'N' then
       IntegraBack.ObrigaABC := 'N'
     else
       IntegraBack.ObrigaABC := 'S';

     if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N' then
       IntegraBack.ObrigaCRespon := 'N'
     else
       IntegraBack.ObrigaCRespon := 'S';

     if Trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> '' then
       prmUnidNegoc := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
     else
       prmUnidNegoc := -1;

     if Trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> '' then
       prmCodCentroRespon := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
     else
       prmCodCentroRespon := '-1';
  end;
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(
    'SELECT '+
    ' TIPOPERENVIO, TIPOPERCOBRANCA, TIPOPERDIVERG, ' +
    ' TPDOCPENVIOBANCO, TPDOCPENVIOPATRO, TPDOCRRECBANCO, '+
    ' TPDOCRRECPATRO, PLANO, PLARECUPRECEXANT, PLARECUPDESPEXANT, '+
    ' FLGUSACENTCUST, CODPROGRAMA, CODCENTROCUSTO '+
    ' FROM PARAMASSIST');
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty then
     MsgDlg(' Os parâmetros do Sistema Assistencial não estão configurados.','Informação',mtInformation,[mbOK],0)
  else Begin
     prmTpDocPEnvioBanco := InttoStr(qryIntegraBack.FieldByName('TPDOCPENVIOBANCO').AsInteger);
     prmTpDocRRecBanco   := InttoStr(qryIntegraBack.FieldByName('TPDOCRRECBANCO').AsInteger);
     prmTpOperCobranca   := qryIntegraBack.FieldByName('TIPOPERCOBRANCA').AsString;
     prmCodPrograma      := StrToIntDef(qryIntegraBack.FieldByName('CODPROGRAMA').AsString,-1);
     prmCodCentroCusto   := qryIntegraBack.FieldByName('CODCENTROCUSTO').AsString;
     If (qryIntegraBack.FieldByName('FLGUSACENTCUST').AsString = '0')Or
        (qryIntegraBack.FieldByName('FLGUSACENTCUST').IsNull) then
     begin
       prmCodPrograma:=-1;
       prmCodCentroCusto:='';
     end;
  end;
  qryIntegraBack.Free;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var I: Integer;
begin
  inherited;
  For I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
  verifica_situacao_empresa;
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, false);

  mnuIncluirPartAss.Enabled   := True;
  mnuCancelarPatAss.Enabled   := True;
  mnuBenefAss.Enabled         := True;
  mnuConsGeralPartAss.Enabled := True;
end;

procedure TfrmPrincipal.GrupoFamiliar1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadGrupoFamiliarass, TFrmCadGrupoFamiliarass, false);  
end;

procedure TfrmPrincipal.Envio1Click(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmCobraContribuicao, TfrmCobraContribuicao);
end;

procedure TfrmPrincipal.Recebimento1Click(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmRecebeContribuicao, TfrmRecebeContribuicao);   
end;

procedure TfrmPrincipal.SitPartPlan1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSitPlano, TfrmCadSitPlano, false);
end;

procedure TfrmPrincipal.GerarDatas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCalendGeraAno, TfrmCalendGeraAno, false);  
end;

procedure TfrmPrincipal.CalendContribPag1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCalendDatas, TfrmCalendDatas, false);  
end;

procedure TfrmPrincipal.mnuConsEstimativaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstimaContr, TfrmEstimaContr, false);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 RptAssistencial :TCmCtrlRptAssistencial;
begin
  inherited;
  RptAssistencial := TCmCtrlRptAssistencial.Create;
  Try
     RptAssistencial.IdReport := IdReports;
     Printed := RptAssistencial.ReportExists;

     If Printed Then
     Begin
        RptAssistencial.DbConnectionType := Sistema.ConnectionType;
        RptAssistencial.ConnectionSide := Sistema.ConnectionSide;
        RptAssistencial.DataBase := DtmBaseDados.dbBaseDados;
        //RptAssistencial.Devicetype := rdtArchive;
        RptAssistencial.Devicetype := rdtScreen;
        RptAssistencial.IdEmpresa := Sistema.IdEmpresa;
        RptAssistencial.IdUsuario := Sistema.IdUsuario;
        RptAssistencial.IdModulo := Sistema.IdModulo;
        RptAssistencial.FileName := sFileName;
        RptAssistencial.NomeEmpresa := Sistema.NomeEmpresa;
        RptAssistencial.NomeModulo := Sistema.NomeModulo;
        RptAssistencial.ShowCancelDialog := True;
        // FERNANDO P.15170 - INICIO
        // RptAssistencial.ShowPrintDialog := False;
        RptAssistencial.ShowPrintDialog := True;
        // FERNANDO P.15170 - FIM
        RptAssistencial.GeraHtmlFormParam := False;
        RptAssistencial.ExibeMensagem := True;
        RptAssistencial.ExibeFormParams := True;

        RptAssistencial.ShowReport;
     End;
     RptAssistencial.Free;
  Except
     RptAssistencial.Free;
     Raise;
  End;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelFat, dtmRelFat);
  Application.CreateForm(TdtmRelValsRecebPatro, dtmRelValsRecebPatro);
  // FERNANDO P. 15234 - INICIO
  Application.CreateForm(TRptTabCap, RptTabCap);
  Application.CreateForm(TRptAltCap, RptAltCap);
  Application.CreateForm(TRptBenSegCancel, RptBenSegCancel);
  Application.CreateForm(TRptBenSeg, RptBenSeg);
  Application.CreateForm(TRptTotalCalc, RptTotalCalc);
  Application.CreateForm(TRptVlReceb, RptVlReceb);
  Application.CreateForm(TRptVlEnvio, RptVlEnvio);
  Application.CreateForm(TRptTotalEnvio, RptTotalEnvio);
  Application.CreateForm(TRptVlCalc, RptVlCalc);
  Application.CreateForm(TRptQtPart, RptQtPart);
  Application.CreateForm(TRptBoletos, RptBoletos);
  Application.CreateForm(TRptParticipantes, RptParticipantes);
  Application.CreateForm(TRptPartCancel, RptPartCancel);
  // FERNANDO P. 15234 - FIM
end;


procedure TfrmPrincipal.TratamentodeDivergncias1Click(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmDivergContribAss, TfrmDivergContribAss);
end;

procedure TfrmPrincipal.mnuConsControleCobrancaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCtrlInterface, TfrmCtrlInterface, false);
end;

procedure TfrmPrincipal.mnuConsHistoricoCobrancaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultContr, TfrmConsultContr, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamAssist, TfrmParamAssist, false);
end;

procedure TfrmPrincipal.AtualizarPlanoPrevidencirio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtPlanoPrev, TfrmAtPlanoPrev, false);
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TConsPart, ConsPart1);
  ConsPart1.sIdPessoa    := '0';
  ConsPart1.sIdPessjur   := '0';
  ConsPart1.sIdPlanoprev := '0';
  ConsPart1.sSeqProposta := '0';
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.MostraConsulta;
end;

procedure TfrmPrincipal.Beneficirios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBenSeguro, TfrmCadBenSeguro, false);
end;

procedure TfrmPrincipal.mnuCadAssocPlanoCapitaisClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocTabCap, TfrmAssocTabCap, false);
end;

procedure TfrmPrincipal.TiposdeLayout1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTpLayout, TfrmTpLayout, false);
end;

procedure TfrmPrincipal.CamposdeLayout1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCpLayout, TfrmCpLayout, false);
end;

procedure TfrmPrincipal.AssociarLayout2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmLgLayout, TfrmLgLayout, false);
end;

procedure TfrmPrincipal.ImportaodeDados2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportDados, TfrmImportDados, false);
end;

procedure TfrmPrincipal.Automtico1Click(Sender: TObject);
begin
  inherited;
  bNormal := true;
  AbrirFormModal(frmContrCalc, TfrmContrCalc);
end;

procedure TfrmPrincipal.Manual1Click(Sender: TObject);
begin
  inherited;
  AbrirFormModal(FrmCadHstContribuicao, TFrmCadHstContribuicao);
end;

procedure TfrmPrincipal.ExportaoemArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportDados, TfrmExportDados, false);
end;

procedure TfrmPrincipal.ModificaArquivoRemessa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFormataArq, TFrmFormataArq, false);
end;

procedure TfrmPrincipal.Capitais1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadCapSegAss, TFrmCadCapSegAss, false);
end;

procedure TfrmPrincipal.DesfazerEnvios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmDesfazEnvios, TfrmDesfazEnvios, false);
end;

procedure TfrmPrincipal.AlicardiferencaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAplicaDiferenca, TfrmAplicaDiferenca, false);
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
begin
  inherited;
  Alicardiferenca.Enabled := true;
end;


procedure TfrmPrincipal.MnuRepasseClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmLancCap, TFrmLancCap, false);
end;

procedure TfrmPrincipal.mnuBeneficiariosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDepenBenef, TfrmCadDepenBenef, false);

end;

procedure TfrmPrincipal.mnuSinistrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadSinistros, TFrmCadSinistros, false);
end;

procedure TfrmPrincipal.mnuConsGeralPartAssClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGeralPart, TfrmCadGeralPart, false);       
end;

procedure TfrmPrincipal.mnuIncluirPartAssClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmInserePart, TfrmInserePart, false);
end;

procedure TfrmPrincipal.mnuCancelarPatAssClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCancelar, TfrmCancelar, false);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadPartAss, TFrmCadPartAss, false);
end;

initialization
   Sistema.NomeModulo     := 'Administração Assistencial';   // Nome do Módulo
   Sistema.IdModulo       := 17;                             // IdModulo cadastrado no SAD
   Sistema.Versao         := '3.00.18';
   Sistema.NomeAplicativo := 'Assistencial';

   IntegraBack            := TIntegraBack.Create(true, true, true);

   Modulo                 := TModulo.Create;

finalization
   Modulo.free;
   IntegraBack.Free;
end.
