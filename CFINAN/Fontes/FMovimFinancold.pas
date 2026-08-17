unit FMovimFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, StdCtrls, CMProcuraMask,
  DBCtrls, TREdit, ExtCtrls, Mask, wwdbedit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe , DBCtrls2,
  CMTree,FPrincipal,FTelaAut, uCMTypes;

type
  TfrmMovimFinanc = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    tbsContabil: TTabSheet;
    dbgrdContabil: TwwDBGrid;
    pnlContabil: TPanel;
    lblMoeda: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dblcHistPad: TwwDBLookupCombo;
    qryHistorico: TwwQuery;
    qryPortador: TwwQuery;
    dblcPortador: TwwDBLookupCombo;
    dbeDocumento: TwwDBEdit;
    dbeHistorico: TwwDBEdit;
    dbrEntradaSaida: TDBRadioGroup;
    lblHistPad: TLabel;
    lblCaixaBanco: TLabel;
    lblData: TLabel;
    lblDocumento: TLabel;
    lblValorMoeda: TLabel;
    lblValor: TLabel;
    lblHistorico: TLabel;
    dbrConcilia: TDBRadioGroup;
    dsContabil: TwwDataSource;
    qryUnidNegoc: TwwQuery;
    qryTipoRD: TwwQuery;
    qryCentroRespon: TwwQuery;
    qryCotacaoMoeda: TwwQuery;
    qryMoeda: TwwQuery;
    edMoeda: TEdit;
    dbeValorCorrente: TRealEdit;
    dbeValorMoeda: TRealEdit;
    updContabil: TUpdateSQL;
    qryCCusto: TwwQuery;
    qrySubConta: TwwQuery;
    qryAuxTipoRD: TwwQuery;
    sbtnEstornar: TToolbarButton97;
    qryParamContab: TwwQuery;
    lblModulo: TLabel;
    qryModulo: TwwQuery;
    dsModulo: TwwDataSource;
    lblNomeModulo: TLabel;
    cbNaoContabiliza: TCheckBox;
    qryParamFinanc: TwwQuery;
    sbtnMudaStatus: TToolbarButton97;
    qryParamGlobal: TwwQuery;
    qryContabil: TwwQuery;
    qryAux: TwwQuery;
    qryDetIDPESSOA: TFloatField;
    qryDetCODLANCFINANC: TFloatField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetCODTIPRECDES: TStringField;
    qryDetRECPAG: TStringField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetMOECODIGO: TFloatField;
    qryDetVALOR: TFloatField;
    qryDetVALOROUTRAMOEDA: TFloatField;
    qryDetTRGDTINCLUSAO: TDateTimeField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetLOTETRANSMISSAO: TFloatField;
    qryDetIDRATEIOFINANC: TFloatField;
    qryDetNOME: TStringField;
    qryDetNOME_1: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetMOESIGLA: TStringField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetIDEMPRESA: TFloatField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLACONTA: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLOTETRANSMISSAO: TFloatField;
    qryContabilNOME: TStringField;
    qryContabilNOME_1: TStringField;
    qryContabilPLANOME: TStringField;
    updDet1: TUpdateSQL;
    dsDet1: TwwDataSource;
    qryDet1: TwwQuery;
    qryNil: TwwQuery;
    qryAux1: TwwQuery;
    qryPatro: TwwQuery;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevNOME: TStringField;
    qryContabilIDPLANOPREV: TFloatField;
    qryContabilIDPATRO: TFloatField;
    qryDetIDPROGRAMA: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPATRO: TFloatField;
    qryPrograma: TwwQuery;
    qryProgramaIDPROGRAMA: TFloatField;
    qryProgramaDESCPROGRAMA: TStringField;
    qryPatroIDPESSOA: TFloatField;
    qryPatroRAZAOSOCIAL: TStringField;
    dbeUsuario: TDBEdit;
    dbeData: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    qryTipoDocumento: TwwQuery;
    qryDetCODTIPDOC: TFloatField;
    pgcContabil: TPageControl;
    tbsBasicoContab: TTabSheet;
    tbsPrevidenciarioContab: TTabSheet;
    reValorMoedaCon: TRealEdit;
    lblValorMoedaCon: TLabel;
    reValorCorrenteCon: TRealEdit;
    lblValorCorrenteCon: TLabel;
    gbHistorico: TGroupBox;
    dbeHist1: TwwDBEdit;
    dbeHist2: TwwDBEdit;
    dbeHist3: TwwDBEdit;
    dbgDebitoCredito: TDBRadioGroup;
    dbccConta: TCMProcuraMaskContabil;
    dblcSubConta: TwwDBLookupCombo;
    lblSubConta: TLabel;
    lblCCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    lblAtividade: TLabel;
    dblcAtividade: TwwDBLookupCombo;
    Label2: TLabel;
    dblcPatrocinadorContabil: TwwDBLookupCombo;
    Label3: TLabel;
    dblcPlanoPrevContabil: TwwDBLookupCombo;
    pgcRateio: TPageControl;
    tbsRateioBasico: TTabSheet;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    lblTipoRD: TLabel;
    Label9: TLabel;
    lblMoedaDet: TLabel;
    lblValorOutDet: TLabel;
    lblValorDet: TLabel;
    Label1: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcTipoDocumento: TwwDBLookupCombo;
    edMoedaDet: TEdit;
    dbeValorMoedaDet: TRealEdit;
    dbeValorDet: TRealEdit;
    dblcCentroCusto: TwwDBLookupCombo;
    tbsPrevidenciario: TTabSheet;
    Label20: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    dblcPatrocinadorRateio: TwwDBLookupCombo;
    dblcPlanoPrevRateio: TwwDBLookupCombo;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dblcPortadorExit(Sender: TObject);
    procedure dbeValorMoedaExit(Sender: TObject);
    procedure dbeValorMoedaDetExit(Sender: TObject);
    procedure dbeValorMoedaEnter(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblcCCustoEnter(Sender: TObject);
    procedure reValorMoedaConExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbrConciliaExit(Sender: TObject);
    procedure dbeDataLancExit(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    procedure sbtnMudaStatusClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure dbrEntradaSaidaChange(Sender: TObject);
    procedure dblcHistPadExit(Sender: TObject);
    procedure dbccContaExit(Sender: TObject);
    procedure dblcSubContaEnter(Sender: TObject);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblcTipoRDChange(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure FazerInsertContab;
    procedure SelecionaFilhos;
    procedure IncluiContabilidade;
    procedure FazerQryPrincipal;
    procedure FazQryCC(iPlano:LongInt;sConta:String);
    procedure FazQrySubC;
    procedure TestaUnNegCentroRespon;
    procedure DesfazImposto;
  public
    { Public declarations }
    iCodLancFinanc:LongInt;
  end;

var
  frmMovimFinanc: TfrmMovimFinanc;
  sContaContabil,sCentroCusto,sNomeUnidNegoc,sDebCre,sTipoDC:String;
  iTipoDoc,iSubConta: LongInt;
  rValorCorrente,rValorMoeda,rIDPatro,rIDPlanoPrev : Real;
  sNomeUnNegoc,sEstorna,sHist1,sHist2,sHist3,sHist4,sHist5:String;
  sNomeCentroRespon,sCodCentroRespon:String;
  iUnidNegoc,iModulo,iPortador,iCodLancContab,iSubContaBanco:LongInt;
  sCCustBanco,sContaBanco,sEntradaSaida,sDataLancamento:String;
  rSvValorOut,rSvValor,rAcumulado,rAcumOM,rValorCotacao:Real;
  sSubConta,sObrigaCC,sDescConta:String;

implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,FEstornoFinanc,UIntegraBack,
     FMudaStatus, UFuncaoGeral, uImpostoRetido,uLancFinanc,uLancContab, UDocumento;

{$R *.DFM}

procedure TfrmMovimFinanc.FormCreate(Sender: TObject);
var sSql : String;
begin
  sEstorna:='N';
  iModulo:=0;
  inherited;
  sDataLancamento := DateToStr(Date);
  sEntradaSaida   := 'E';
  pnlMestre.Enabled:=False;
  sbtnEstornar.Enabled:=False;
  sbtnMudaStatus.Enabled:=False;
  iCodLancFinanc:=0;
  iCodLancContab:=0;
  //
  MontaSelect.Filtro.Add('MOVIMFINANC.IDPESSOA = '+IntToStr(Sistema.idempresa));
  if Modulo.sNaoIdent = 'S' then
  begin
     dbrConcilia.Enabled:=False;
     MontaSelect.Filtro.Add('MOVIMFINANC.STATUSCONCILIA = ''I''');
  end;
  //
  iTipoDoc := 0;
  sSql := 'SELECT CODTIPDOC FROM PARALMOX WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa);
  if FazQuery(qryAux,sSql) then iTipoDoc := qryAux.FieldByName('CODTIPDOC').AsInteger;
  FazerQryPrincipal;
  SelecionaFilhos;
  ImpostoRetido    := TImpostoRetido.Create;
  //
  tbsPrevidenciario.Enabled:=(Sistema.UsaPlanoPatro);
  tbsPrevidenciarioContab.Enabled:=(Sistema.UsaPlanoPatro);

  qryPrograma.Open;
  qryPatro.Open;
  qryPlanoPrev.Open;
end;

procedure TfrmMovimFinanc.FormShow(Sender: TObject);
begin
   inherited;
   qryHistorico.Close;
   qryHistorico.SQL.Clear;
   qryHistorico.SQL.text := 'SELECT * FROM HISTORICOFINAN ORDER BY DESCRICAO';
   qryHistorico.Open;
   //
   qryPortador.Close;
   qryPortador.SQL.Clear;
   qryPortador.SQL.text := 'SELECT * FROM PORTADORCONTA WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' ORDER BY DESCRICAO';
   qryPortador.Open;
   //
   qryTipoRD.Close;
   qryTipoRD.SQL.Clear;

   qryTipoRD.SQL.text:='SELECT '+
                       '   TRD.CODTIPRECDES, '+
                       '   TRD.RECPAG, '+
                       '   TRD.DESCRICAO '+
                       'FROM '+
                       '   TIPORECEBDESEMB TRD '+
                       'WHERE '+
                       '   (TRD.ANASINT = ''A'') AND '+
                       '   (TRD.IDPESSOA = '+IntToStr(Sistema.idempresa)+') AND '+
                       '   ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
                       '                          FROM TRDXCRESPON '+
                       '                          WHERE (CODCENTRORESPON = '+
                                                   #39+Trim(dblcCentroRespon.LookupValue)+#39+') AND '+
                       '                                (IDPESSOA='+InttoStr(Sistema.idempresa)+') AND '+
                       '                                (RECPAG=TRD.RECPAG))) OR '+
                       '    NOT EXISTS(SELECT * '+
                       '               FROM TRDXCRESPON '+
                       '               WHERE (CODCENTRORESPON = '+
                                        #39+Trim(dblcCentroRespon.LookupValue)+#39+') AND '+
                       '                     (IDPESSOA='+InttoStr(Sistema.idempresa)+'))) '+
                       'ORDER BY TRD.RECPAG DESC, DESCRICAO';

   qryTipoRD.Open;
   //
   qryTipoDocumento.Close;
   qryTipoDocumento.ParamByName('RECPAG').AsString:='';
   qryTipoDocumento.Open;
   qryTipoDocumento.First;
   //
   qryParamGlobal.Close;
   qryParamGlobal.SQL.Clear;
   qryParamGlobal.SQL.text := 'SELECT USACRESPON,USAABC,UNIDNEGOC FROM PARAMGLOBAL WHERE IDPESSOA = '+
                              InttoStr(Sistema.idempresa);
   qryParamGlobal.Open;
   //
   qryParamFinanc.Close;
   qryParamFinanc.SQL.Clear;
   qryParamFinanc.SQL.text := 'SELECT FLGCALCIMPOSTO, CONTALANCNAOIDENT,CCUSTOLANCNAOID,SUBCONTANAOIDENT '+
                              'FROM PARAMFINANC WHERE IDPESSOA = '+INTTOSTR(Sistema.Idempresa);
   qryParamFinanc.Open;
   //
   if (qryParamGlobal.FieldByName('USACRESPON').AsString = 'N') then
    begin
      qryCentroRespon.Close;
      qryCentroRespon.SQL.Clear;
      qryCentroRespon.SQL.text := 'SELECT CODCENTRORESPON,NOME FROM CENTRESPON WHERE IDPESSOA = '+
                                  InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON = ''9999999999''';
      qryCentroRespon.Open;
      sNomeCentroRespon:=qryCentroRespon.FieldByName('NOME').AsString;
      sCodCentroRespon :=qryCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    end
   else
    begin
       qryCentroRespon.Close;
       qryCentroRespon.SQL.Clear;

       //Esta Query Retorna todos os centros de Responsabilidade permitidos ao usuário corrente.
       //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
       //todos os centros de responsabilidade serão retornados
       qryCentroRespon.SQL.text:='SELECT DISTINCT '+
                                 '   CR.CODCENTRORESPON, '+
                                 '   CR.NOME '+
                                 'FROM '+
                                 '   CENTRESPON CR, '+
                                 '   PESSOAXCRESP PCR '+
                                 'WHERE '+
                                 '   ((PCR.IDPESSOA=CR.IDPESSOA) AND '+
                                 '    (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
                                 '    (CR.IDPESSOA='+IntToStr(Sistema.idEmpresa)+') AND '+
                                 '    (CR.CODCENTRORESPON <> ''9999999999'') AND '+
                                 '    (CR.ANALITICOSINTET = ''A'') AND '+
                                 '    (PCR.IDPESSOAACESSO = '+IntToStr(Sistema.IdUsuario)+' )) OR '+
                                 '   (NOT EXISTS(SELECT 1 FROM PESSOAXCRESP PCR2 '+
                                 '               WHERE (PCR2.IDPESSOAACESSO = '+IntToStr(Sistema.IdUsuario)+') AND '+
                                 '                 (PCR2.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+'))) '+
                                 'ORDER BY CR.NOME';
       qryCentroRespon.Open;
       sNomeCentroRespon:=qryCentroRespon.FieldByName('NOME').AsString;
       sCodCentroRespon :=qryCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    end;
   //
   if (qryParamGlobal.FieldByName('USAABC').AsString = 'N') then
   begin
      qryUnidNegoc.Close;
      qryUnidNegoc.SQL.Clear;
      qryUnidNegoc.SQL.text := 'SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO WHERE IDPESSOA = '+
                               InttoStr(Sistema.idempresa)+' AND UNIDNEGOC = '+
                               qryParamGlobal.FieldByName('UNIDNEGOC').AsString;
      qryUnidNegoc.Open;
   end
   else
   begin
      qryUnidNegoc.Close;
      qryUnidNegoc.SQL.Clear;
      qryUnidNegoc.SQL.text := 'SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND UNETIPO = ''A'' ORDER BY NOME';
      qryUnidNegoc.Open;
   end;
   //
   if (IntegraBack.Contabilidade = 'S') then
    begin
       tbsContabil.Enabled := True;
       //
       dbccConta.Plano   := IntegraBack.Plano;
       dbccConta.Mascara := IntegraBack.MascaraPlano;
       //
       qryParamContab.Close;
       qryParamContab.SQL.Clear;
       qryParamContab.SQL.text := 'SELECT PACESTORNA FROM PARAMCONTAB WHERE IDPESSOA = '+INTTOSTR(Sistema.Idempresa);
       qryParamContab.Open;
       sEstorna:=qryParamContab.FieldByName('PACESTORNA').AsString;
       //
    end
   else
      tbsContabil.Enabled := False;

   //
   if (Modulo.sNaoIdent = 'S') and (IntegraBack.Contabilidade = 'S') then
   begin
      sContaBanco   :=qryParamFinanc.FieldByName('CONTALANCNAOIDENT').AsString;
      sCCustBanco   :=qryParamFinanc.FieldByName('CCUSTOLANCNAOID').AsString;
      iSubContaBanco:=qryParamFinanc.FieldByName('SUBCONTANAOIDENT').AsInteger;
   end
   else
   begin
      sContaBanco   :='';
      sCCustBanco   :='';
      iSubContaBanco:=0;
   end;
   //
   qryCCusto.Open;
end;

procedure TfrmMovimFinanc.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if Modulo.sNaoIdent <> 'S' then dbrConcilia.Enabled:=True;
   pnlMestre.Enabled:=True;
   dblcPortador.SetFocus;
   qry.FieldByName('CODPORTADOR').AsInteger:=iPortador;
   iCodLancFinanc:=0;
   iCodLancContab:=0;
   SelecionaFilhos;
   qry.FieldByName('STATUSCONCILIA').AsString:='N';
   qry.FieldByName('ENTRADASAIDA').AsString  :=sEntradaSaida;
   qry.FieldByName('DATALANCFINAN').AsString :=sDataLancamento;
   dbeValorMoeda.Value:=0;
   dbeValorCorrente.Value:=0;
   qry.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
   qry.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
{já estava comentado   tbcDetalhe.TabIndex:=0;
   sbtnInsDetClick(Self);
   sbtnInsDet.Down:=True;}
end;

procedure TfrmMovimFinanc.CmeCadastroEdit(Sender: TObject);
var liPeriodo,liExercicio,liRetFuncao,liEmpresa : LongInt;
    sMens : String;
begin
  inherited;
  pnlMestre.Enabled:=True;
  dbrConcilia.Enabled := False;
  if Modulo.sNaoIdent = 'S' then
  begin
     qry.FieldByName('STATUSCONCILIA').AsString:='X';
     qry.FieldByName('DATALANCFINAN').AsString:=DateToStr(Date);
     qryContabil.First;
     while not qryContabil.EOF do
     begin
        qryContabil.Delete;
     end;
     dblcPortador.ReadOnly    :=True;
     dbrEntradaSaida.ReadOnly :=True;
     dbeValorMoeda.ReadOnly   :=True;
     dbeValorCorrente.ReadOnly:=True;
  end
  else
  begin
     if  qry.FieldByName('CODLANCTRANSF').AsInteger <>0 Then
     begin
        MsgDlg('Proibido Alterar Transferência entre Contas. Exclua e Inclua novamente.','Erro',mtError,[mbOk],0);
        bbtnCancelarClick(Self);
        exit;
     end;
     if (IntegraBack.Contabilidade = 'S') and
        (qry.FieldByName('IDMODULO').AsInteger = 9) and
        (not qry.FieldByName('PLNCODIGO').isNull) then
     begin
         //Testa se o período contábil está aberto ou fechado.
        liEmpresa:=Sistema.IdEmpresa;
        liRetFuncao:=TestaPeriodo(True,'BASEDADOS',qry.FieldByName('DATALANCFINAN').AsString,IntToStr(Sistema.IdModulo),liExercicio,
                                  liPeriodo,liEmpresa,sMens);
        if liRetFuncao <> 0 then
           begin
             bbtnCancelarClick(Self);
             exit;
           end;
     end;
  end;
  dblcPortador.SetFocus;
end;

procedure TfrmMovimFinanc.CmeCadastroDelete(Sender: TObject);
var liPeriodo,liExercicio,liRetFuncao,liEmpresa : LongInt;
    sSql,sMens : String;
begin
  if (IntegraBack.Contabilidade = 'S') and
     (qry.FieldByName('IDMODULO').AsInteger = 9) and
     (not qry.FieldByName('PLNCODIGO').isNull) then
  begin
     liEmpresa:=Sistema.IdEmpresa;
     //Testa se o período contábil está aberto ou fechado.
     liRetFuncao:=TestaPeriodo(True,'BASEDADOS',qry.FieldByName('DATALANCFINAN').AsString,IntToStr(Sistema.IdModulo),liExercicio,
                               liPeriodo,liEmpresa,sMens);
     if liRetFuncao <> 0 then
     begin
        sbtnEstornar.Enabled:=True;
        MsgDlg('Este lançamento não pode ser excluido, somente pode ser estornado','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
        exit;
     end;
  end;
  try
    StartTransacao;
    iCodLancFinanc:=qry.FieldByName('CODLANCFINANC').AsInteger;
    sSql:='SELECT CODLANCFINANC FROM IMPOSTORETIDO WHERE CODLANCFINANC = '+IntToStr(iCodLancFinanc);
    if FazQuery(qryAux,sSql) then begin
       sSql:='DELETE IMPOSTORETIDO WHERE CODLANCFINANC = '+IntToStr(iCodLancFinanc);
       if not ExecutarQuery(qryAux,sSql) then Abort;
    end;
    LancFinanc.ExcluiFinanceiro(iCodLancFinanc);
    if iCodLancFinanc = -1 then
    begin
       iCodLancFinanc:=qry.FieldByName('CODLANCFINANC').AsInteger;
       abort
    end;
    CommitTransacao;
    FazerQryPrincipal;
    SelecionaFilhos;
  except
    MsgDlg('Exclusão Não Efetuada','Erro',mtError,[mbOk],0);
    FuncaoGeral.TiraIcone;
    RollBackTransacao;
    raise;
  end;
end;

procedure TfrmMovimFinanc.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    begin
       iCodLancFinanc:=StrToInt(MontaSelect.ValoresChave[0]);
       FazerQryPrincipal;
       SelecionaFilhos;
    end;
end;

procedure TfrmMovimFinanc.CmeCadastroConfirma(Sender: TObject);
var
   iPlnCodigo, iPlnCodigoAnt : LongInt;
   rTotImp, rValorReg, rValorOutReg : Double;
   sSql, sEntradaSaidaReg : String;
begin
  CmeDetalhe.Confirma(Self);
  bbtnVoltarDetClick(Self);
  qryContabil.First;
  if (sbtnInserir.Down = True) or (Modulo.sNaoIdent = 'S')then
  begin
     try
        StartTransacao;
        if Modulo.sNaoIdent = 'S' then
         begin

            LancFinanc.MudaStatusConcilia('J',
                                          qry.FieldByName('DATACONCILIACAO').AsString,
                                          iCodLancFinanc);

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.text :='SELECT * FROM MOVIMFINANC WHERE CODLANCFINANC = '+InttoStr(iCodLancFinanc);
            qryAux.Open;
            //
            iPlnCodigoAnt := 0;
            {// este já estava comentado --> iPlnCodigoAnt := qryAux.FieldByName('PLNCODIGO').AsInteger;
            //
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.text :='UPDATE MOVIMFINANC SET PLNCODIGO = NULL,DATALANCFINAN = TO_DATE('''+qry.FieldByName('DATALANCFINAN').AsString+''',''DD/MM/YYYY'') '+
                               'WHERE CODLANCFINANC = '+InttoStr(iCodLancFinanc);
            qryAux1.ExecSQL;}
            //
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.text :='SELECT * FROM RATEIOFINANC WHERE CODLANCFINANC = '+InttoStr(iCodLancFinanc);
            qryAux1.Open;
            //
            iCodLancFinanc:=0;
            iPlnCodigo    :=0;
            if qryAux.FieldByName('ENTRADASAIDA').AsString = 'S' then
               sEntradaSaidaReg := 'E'
            else
               sEntradaSaidaReg := 'S';

            rValorReg    := dbeValorCorrente.Value;
            rValorOutReg := dbeValorMoeda.Value;
            LancFinanc.LancaFinanceiro(qryContabil,
                                      Sistema.IdModulo,
                                      qryAux.FieldByName('HISTPADFINAN').Value,
                                      qryAux.FieldByName('MOECODIGO').AsInteger,
                                      Sistema.IdUsuario,
                                      qryAux.FieldByName('CODPORTADOR').Value,
                                      Sistema.IdEmpresa,
                                      rValorReg,
                                      rValorOutReg,
                                      qryAux.FieldByName('NUMCHQBORDERO').AsString,
                                      qry.FieldByName('DATALANCFINAN').AsString,
                                      qryAux.FieldByName('DATACONCILIACAO').AsString,
                                      sEntradaSaidaReg,
                                      qryAux.FieldByName('HISTORICO').AsString,
                                      'J',
                                      iCodLancFinanc,
                                      iPlnCodigo,
                                      0);

            if iCodLancFinanc = -1 then abort;
            //
            qryAux1.First;
            while (not qryAux1.EOF) do
            begin
               LancFinanc.LancaRateioFinanc(qryAux1.FieldByName('UNIDNEGOC').AsInteger,
                                            qryAux1.FieldByName('MOECODIGO').AsInteger,
                                            Sistema.IdEmpresa,
                                            qryAux.FieldByName('CODPORTADOR').AsInteger,
                                            -qryAux1.FieldByName('VALOR').AsFloat,
                                            -qryAux1.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                            qryAux1.FieldByName('CODTIPRECDES').AsString,
                                            qryAux1.FieldByName('RECPAG').AsString,
                                            qryAux1.FieldByName('CODCENTRORESPON').AsString,
                                            qry.FieldByName('DATALANCFINAN').AsString,
                                            iCodLancFinanc,
                                            qryAux1.FieldByName('CODCENTROCUSTO').AsString,
                                            qryAux1.FieldByName('IDPROGRAMA').AsFloat,
                                            qryAux1.FieldByName('IDPATRO').AsFloat,
                                            qryAux1.FieldByName('IDPLANOPREV').AsFloat,
                                            qryAux1.FieldByName('CODTIPDOC').AsFloat);

               if iCodLancFinanc = -1 then abort;
               qryAux1.Next;
            end;
            iCodLancFinanc:=0;

            LancFinanc.LancaFinanceiro(qryNil,
                                       Sistema.IdModulo,
                                       qry.FieldByName('HISTPADFINAN').Value,
                                       qry.FieldByName('MOECODIGO').AsInteger,
                                       Sistema.IdUsuario,
                                       qry.FieldByName('CODPORTADOR').Value,
                                       Sistema.IdEmpresa,
                                       dbeValorCorrente.Value,
                                       dbeValorMoeda.Value,
                                       qry.FieldByName('NUMCHQBORDERO').AsString,
                                       qry.FieldByName('DATALANCFINAN').AsString,
                                       qry.FieldByName('DATACONCILIACAO').AsString,
                                       qry.FieldByName('ENTRADASAIDA').AsString,
                                       qry.FieldByName('HISTORICO').AsString,
                                       'X',
                                       iCodLancFinanc,
                                       iPlnCodigoAnt,0);

            if iCodLancFinanc = -1 then abort;
         end
        else
         begin
            iPlnCodigo:=0;
            iCodLancFinanc:=0;

            LancFinanc.LancaFinanceiro(qryContabil,
                                       Sistema.IdModulo,
                                       qry.FieldByName('HISTPADFINAN').Value,
                                       qry.FieldByName('MOECODIGO').AsInteger,
                                       Sistema.IdUsuario,
                                       qry.FieldByName('CODPORTADOR').Value,
                                       Sistema.IdEmpresa,
                                       dbeValorCorrente.Value,
                                       dbeValorMoeda.Value,
                                       qry.FieldByName('NUMCHQBORDERO').AsString,
                                       qry.FieldByName('DATALANCFINAN').AsString,
                                       qry.FieldByName('DATACONCILIACAO').AsString,
                                       qry.FieldByName('ENTRADASAIDA').AsString,
                                       qry.FieldByName('HISTORICO').AsString,
                                       qry.FieldByName('STATUSCONCILIA').AsString,
                                       iCodLancFinanc,
                                       iPlnCodigo,
                                       0);

            if iCodLancFinanc = -1 then abort;
         end;

        qryDet.First;
        while (not qryDet.EOF) do
        begin
           if qryParamFinanc.FieldByName('FLGCALCIMPOSTO').AsString = 'S' then begin
              //Gravar impostos vinculados ao tipo de desembolso e Classificacao Fiscal
              rTotImp   := 0;
              ImpostoRetido.DataProgramada    := qry.FieldByName('DATALANCFINAN').AsDateTime;
              ImpostoRetido.OperacaoDocumento := '2 ';
              ImpostoRetido.IdForCli          := 0;
              ImpostoRetido.CodDocumento      := 0;
              ImpostoRetido.NumLancto         := 0;
              ImpostoRetido.ValorLancto       := qryDet.FieldByName('VALOR').AsFloat;
              ImpostoRetido.ValorLiquido      := qryDet.FieldByName('VALOR').AsFloat;
              ImpostoRetido.DataLancto        := qry.FieldByName('DATALANCFINAN').AsDateTime;
              ImpostoRetido.DataEmissao       := qry.FieldByName('DATALANCFINAN').AsDateTime;
              if (IntegraBack.RecPag = 'R') then begin
                 if (IntegraBack.RecPag = qryDet.FieldByName('RECPAG').AsString) then
                    ImpostoRetido.DebCre := 'D'
                 Else
                    ImpostoRetido.DebCre := 'C';
              end else begin
                 if (IntegraBack.RecPag = qryDet.FieldByName('RECPAG').AsString) then
                    ImpostoRetido.DebCre := 'C'
                 Else
                    ImpostoRetido.DebCre := 'D';
              end;
              ImpostoRetido.CodTipRecDes      := qryDet.FieldByName('CODTIPRECDES').AsString;
              ImpostoRetido.MomentoLancamento := mlLancamento;
              ImpostoRetido.CodTipoDoc        := iTipoDoc;
              ImpostoRetido.Incluir;
              //
              if Not ImpostoRetido.QrySimulacao.IsEmpty Then begin
                 ImpostoRetido.QrySimulacao.First;
                 while not ImpostoRetido.QrySimulacao.EOF do begin
                    sSql := 'SELECT CODTIPRECDES, RECPAG FROM TIPOAGRE WHERE (CODTIPRECDES IS NOT NULL) AND (CODTIPOCUSTAGREG = '+IntToStr(ImpostoRetido.QrySimulacao.FieldByName('IDIMPOSTO').AsInteger)+')';
                    if FazQuery(qryAux,sSql) then begin
                       rTotImp := rTotImp + ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                       sSql := 'INSERT INTO IMPOSTORETIDO(IDIMPOSTORETIDO,DATARETENCAO,CODTIPOCUSTAGREG,'+
                               'VLRBASE, VLRRETIDO, IDPESSOA, RECPAG, CODLANCFINANC) VALUES (';
                       sSql := sSql + IntToStr(LeUltRegistro(nil,'IMPOSTORETIDO'))+',';
                       sSql := sSql + 'TO_DATE('''+ qry.FieldByName('DATALANCFINAN').AsString+''',''DD/MM/YYYY''),';
                       sSql := sSql + IntToStr(ImpostoRetido.QrySimulacao.FieldByName('IDIMPOSTO').AsInteger)+',';
                       sSql := sSql + FuncaoGeral.OraNumero(ImpostoRetido.QrySimulacao.FieldByName('VALORBASE').AsFloat)+',';
                       sSql := sSql + FuncaoGeral.OraNumero(ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat)+',';
                       sSql := sSql + IntToStr(Sistema.IdEmpresa)+',';
                       sSql := sSql + ''''+IntegraBack.RecPag+''',';
                       sSql := sSql + IntToStr(iCodLancFinanc)+')';
                       if not ExecutarQuery(qryAux,sSql) then Abort;
                    end;
                    ImpostoRetido.QrySimulacao.Next;
                 end;
              end;
           end;

           LancFinanc.LancaRateioFinanc(qryDet.FieldByName('UNIDNEGOC').AsInteger,
                                        qryDet.FieldByName('MOECODIGO').AsInteger,
                                        Sistema.IdEmpresa,
                                        qry.FieldByName('CODPORTADOR').Value,
                                        qryDet.FieldByName('VALOR').AsFloat,
                                        qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                        qryDet.FieldByName('CODTIPRECDES').AsString,
                                        qryDet.FieldByName('RECPAG').AsString,
                                        qryDet.FieldByName('CODCENTRORESPON').AsString,
                                        qry.FieldByName('DATALANCFINAN').AsString,
                                        iCodLancFinanc,
                                        qryDet.FieldByName('CODCENTROCUSTO').AsString,
                                        qryDet.FieldByName('IDPROGRAMA').AsFloat,
                                        qryDet.FieldByName('IDPATRO').AsFloat,
                                        qryDet.FieldByName('IDPLANOPREV').AsFloat,
                                        qryDet.FieldByName('CODTIPDOC').AsFloat);

           if iCodLancFinanc = -1 then
              abort;
           qryDet.Next;
        end;
        CommitTransacao;
     except
        RollBackTransacao;
        DesfazImposto;
        MsgDlg('Inclusão Não Efetuada','Erro',mtError,[mbOk],0);
        raise;
     end;
  end;
  if (sbtnAlterar.Down = True) and (Modulo.sNaoIdent <> 'S') then
  begin
     try
        StartTransacao;
        iPlnCodigo:=qry.FieldByName('PLNCODIGO').AsInteger;
        LancFinanc.AlteraFinanceiro(qryContabil,
                                    qry.FieldByName('HISTPADFINAN').Value,
                                    qry.FieldByName('MOECODIGO').AsInteger,
                                    Sistema.IdUsuario,
                                    qry.FieldByName('CODPORTADOR').Value,
                                    Sistema.IdEmpresa,
                                    dbeValorCorrente.Value,
                                    dbeValorMoeda.Value,
                                    qry.FieldByName('NUMCHQBORDERO').AsString,
                                    qry.FieldByName('DATALANCFINAN').AsString,
                                    qry.FieldByName('DATACONCILIACAO').AsString,
                                    qry.FieldByName('ENTRADASAIDA').AsString,
                                    qry.FieldByName('HISTORICO').AsString,
                                    qry.FieldByName('STATUSCONCILIA').AsString,
                                    iPlnCodigo,
                                    iCodLancFinanc);
        if iCodLancFinanc = -1 then
        begin
           iCodLancFinanc:=qryDet.FieldByName('CODLANCFINANC').AsInteger;
           abort;
        end;
        LancFinanc.ExcluiRateioFinanc(iCodLancFinanc);
        if iCodLancFinanc = -1 then
        begin
           iCodLancFinanc:=qryDet.FieldByName('CODLANCFINANC').AsInteger;
           abort;
        end;
        qryDet.First;
        while (not qryDet.EOF) do
        begin
           LancFinanc.LancaRateioFinanc(qryDet.FieldByName('UNIDNEGOC').AsInteger,
                                        qryDet.FieldByName('MOECODIGO').AsInteger,
                                        Sistema.IdEmpresa,
                                        qry.FieldByName('CODPORTADOR').Value,
                                        qryDet.FieldByName('VALOR').AsFloat,
                                        qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                        qryDet.FieldByName('CODTIPRECDES').AsString,
                                        qryDet.FieldByName('RECPAG').AsString,
                                        qryDet.FieldByName('CODCENTRORESPON').AsString,
                                        qry.FieldByName('DATALANCFINAN').AsString,
                                        iCodLancFinanc,
                                        qryDet.FieldByName('CODCENTROCUSTO').AsString,
                                        qryDet.FieldByName('IDPROGRAMA').AsFloat,
                                        qryDet.FieldByName('IDPATRO').AsFloat,
                                        qryDet.FieldByName('IDPLANOPREV').AsFloat,
                                        qryDet.FieldByName('CODTIPDOC').AsFloat);
           if iCodLancFinanc = -1 then
           begin
              iCodLancFinanc:=qryDet.FieldByName('CODLANCFINANC').AsInteger;
              abort;
           end;
           qryDet.Next;
        end;
        iCodLancContab:=iPlnCodigo;
        CommitTransacao;
     except
        MsgDlg('Alteração Não Efetuada','Erro',mtError,[mbOk],0);
        DesfazImposto;
        RollBackTransacao;
        raise;
     end;
  end;
  if (sbtnAlterar.Down = True) then
  begin
     qry.CancelUpdates;
     qryDet.CancelUpdates;
     qryContabil.CancelUpdates;
     FazerQryPrincipal;
     SelecionaFilhos;
     dblcPortador.ReadOnly    :=False;
     dbrEntradaSaida.ReadOnly :=False;
     dbeValorMoeda.ReadOnly   :=False;
     dbeValorCorrente.ReadOnly:=False;
  end;
  pnlMestre.Enabled:=False;
  qry.CancelUpdates;
  qryDet.CancelUpDates;
  qryContabil.CancelUpdates;
  inherited;
end;

procedure TfrmMovimFinanc.SelecionaFilhos;
begin
   qryDet.Close;
   qryDet.SQL.Clear;
   qryDet.SQL.text := 'SELECT R.*, U.NOME, C.NOME, T.DESCRICAO, I.MOESIGLA FROM RATEIOFINANC R, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEMB T, MOEDA I '+
                      'WHERE R.CODLANCFINANC = '+IntToStr(iCodLancFinanc)+' AND T.CODTIPRECDES = R.CODTIPRECDES AND T.RECPAG = R.RECPAG AND '+
                      'T.IDPESSOA = R.IDPESSOA AND U.UNIDNEGOC = R.UNIDNEGOC AND U.IDPESSOA = R.IDPESSOA AND I.MOECODIGO(+) = R.MOECODIGO AND '+
                      'C.CODCENTRORESPON = R.CODCENTRORESPON AND C.IDPESSOA = R.IDPESSOA';
   qryDet.Open;
   //
   qryContabil.Close;
   qryContabil.SQL.Clear;
   qryContabil.SQL.text := 'SELECT '+
                           '   LC.*, '+
                           '   U.NOME, '+
                           '   CC.NOME, '+
                           '   P.PLANOME '+
                           'FROM '+
                           '   LANCAMENTO LC, '+
                           '   UNIDNEGOCIO U, '+
                           '   CENTCUST CC, '+
                           '   PLANOCONTA P '+
                           'WHERE '+
                           '   LC.PLANO = P.PLANO AND '+
                           '   LC.PLACONTA = P.PLACONTA AND '+
                           '   LC.PLNCODIGO = '+IntToStr(iCodLancContab)+'  AND '+
                           '   LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) AND '+
                           '   LC.IDEMPRESA = CC.IDEMPRESA(+) AND '+
                           '   LC.IDPESSOA = U.IDPESSOA(+) AND '+
                           '   LC.UNIDNEGOC = U.UNIDNEGOC(+) ';
   qryContabil.Open;
   //
   if (qryContabil.IsEmpty) and (not qryDet.IsEmpty) then
      cbNaoContabiliza.Checked:=True
   else
      cbNaoContabiliza.Checked:=False;

   rAcumulado:=0;
   rAcumOM   :=0;

   qryDet.First;
   while not qryDet.EOF do
   begin
      if ((qryDet.FieldByName('RECPAG').AsString = 'R') and
          (qry.FieldByName('ENTRADASAIDA').AsString = 'E')) or
          ((qryDet.FieldByName('RECPAG').AsString = 'P') and
          (qry.FieldByName('ENTRADASAIDA').AsString = 'S')) then
      begin
         rAcumulado:=rAcumulado+qryDet.FieldByName('VALOR').AsFloat;
         rAcumOM   :=rAcumOM   +qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end
      else
      begin
         rAcumulado:=rAcumulado-qryDet.FieldByName('VALOR').AsFloat;
         rAcumOM   :=rAcumOM   -qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
      end;
      qryDet.Next;
   end;
end;

procedure TfrmMovimFinanc.bbtnConfirmarClick(Sender: TObject);
var rTotImp,TotalRateioOM,TotalRateio,rTotalContab,rValorCheckContab,rValorBanco,rValorCheckBanco:Real;
    liPeriodo,liExercicio,liRetFuncao,liEmpresa : LongInt;
    sSql, sMens : String;
begin
  if trim(dblcPortador.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Banco/Caixa','Erro',mtError,[mbOk],0);
       dblcPortador.SetFocus;
       exit;
     end;
  if trim(dbeDataLanc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
       dbeDataLanc.SetFocus;
       exit;
     end;
  if (IntegraBack.Contabilidade = 'S') and (qry.FieldByName('IDMODULO').AsInteger = 9) and (not cbNaoContabiliza.Checked) then
  begin
     liEmpresa:=Sistema.IdEmpresa;
      //Testa se o período contábil está aberto ou fechado.
     liRetFuncao:=TestaPeriodo(True,'BASEDADOS',dbeDataLanc.text,IntToStr(Sistema.IdModulo),liExercicio,
                               liPeriodo,liEmpresa,sMens);
     if liRetFuncao <> 0 then
        begin
          FuncaoGeral.TiraIcone;
          dbeDataLanc.SetFocus;
          exit;
        end;
  end;
  if (dbeValorMoeda.Value = 0) and (qry.FieldByName('MOECODIGO').AsInteger <> 0) then
     begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
       dbeValorMoeda.SetFocus;
       exit;
     end;
  if dbeValorCorrente.Value = 0 then
     begin
       if MsgDlg('Confirma que o Valor em Moeda Corrente = 0,00','Confirmação',mtConfirmation,[mbYes,mbNo],0)  = MrNo then begin
          dbeValorCorrente.SetFocus;
          exit;
       end;
     end;
  if trim(dblcHistPad.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
       dblcHistPad.SetFocus;
       exit;
     end;
  if trim(dbeHistorico.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Histórico do Lançamento','Erro',mtError,[mbOk],0);
       dbeHistorico.SetFocus;
       exit;
     end;
  if trim(dbeDocumento.Text)='' then
     begin
       MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
       dbeDocumento.SetFocus;
       exit;
     end;

  TotalRateioOM:=0;
  TotalRateio  := 0;
  qryDet.First;
  while (not qryDet.EOF) do
  begin
     if ((qryDet.FieldByName('RECPAG').AsString = 'R') and
         (qry.FieldByName('ENTRADASAIDA').AsString = 'E')) or
         ((qryDet.FieldByName('RECPAG').AsString = 'P') and
         (qry.FieldByName('ENTRADASAIDA').AsString = 'S')) then
     begin
        TotalRateio   := TotalRateio   + qryDet.FieldByName('VALOR').AsFloat;
        TotalRateioOM := TotalRateioOM + qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
     end
     else
     begin
        TotalRateio   := TotalRateio   - qryDet.FieldByName('VALOR').AsFloat;
        TotalRateioOM := TotalRateioOM - qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
     end;
     qryDet.Next;
  end;

  if Format('%17.2f',[dbeValorCorrente.Value]) <> Format('%17.2f',[TotalRateio]) then
     begin
       MsgDlg('Total do Rateio não bate com o Valor do Lançamento','Erro',mtError,[mbOk],0);
       FuncaoGeral.TiraIcone;
       dblcPortador.SetFocus;
       exit;
     end;
  if (Format('%17.2f',[dbeValorMoeda.Value]) <> Format('%17.2f',[TotalRateioOM])) and (dbeValorMoeda.Value <> 0) then
     begin
       MsgDlg('Total do Rateio em outra moeda não bate com o Valor do Lançamento em outra moeda','Erro',mtError,[mbOk],0);
       FuncaoGeral.TiraIcone;
       dblcPortador.SetFocus;
       exit;
     end;

  rTotImp := 0;
  qryDet1.Close;
  qryDet1.Open;
  if (qryParamFinanc.FieldByName('FLGCALCIMPOSTO').AsString = 'S') and (qry.state in [dsInsert]) then
   begin
      //Para gravar os impostos com o sinal correto
      if qry.FieldByName('ENTRADASAIDA').AsString = 'E' then
         IntegraBack.RecPag := 'R'
      else
         IntegraBack.RecPag := 'P';
      //Copiando a QryDet para QryDet1
      qryDet1.First;
      while not qryDet1.EOF do qryDet1.Delete;
      //
      qryDet.First;
      while not qryDet.EOF do
      begin
         qryDet1.Insert;
         qryDet1.FieldByName('IDPESSOA').AsInteger       := qryDet.FieldByName('IDPESSOA').AsInteger;
         qryDet1.FieldByName('UNIDNEGOC').AsInteger      := qryDet.FieldByName('UNIDNEGOC').AsInteger;
         qryDet1.FieldByName('CODTIPRECDES').AsString    := qryDet.FieldByName('CODTIPRECDES').AsString;
         qryDet1.FieldByName('RECPAG').AsString          := qryDet.FieldByName('RECPAG').AsString;
         qryDet1.FieldByName('CODCENTRORESPON').AsString := qryDet.FieldByName('CODCENTRORESPON').AsString;
         qryDet1.FieldByName('VALOR').AsFloat            := qryDet.FieldByName('VALOR').AsFloat;
         qryDet1.FieldByName('CODCENTROCUSTO').AsString  := qryDet.FieldByName('CODCENTROCUSTO').AsString;
         qryDet1.FieldByName('IDEMPRESA').AsInteger      := qryDet.FieldByName('IDEMPRESA').AsInteger;
         qryDet1.FieldByName('IDPATRO').AsFloat          := qryDet.FieldByName('IDPATRO').AsFloat;
         qryDet1.FieldByName('IDPROGRAMA').AsFloat       := qryDet.FieldByName('IDPROGRAMA').AsFloat;
         qryDet1.FieldByName('IDPLANOPREV').AsFloat      := qryDet.FieldByName('IDPLANOPREV').AsFloat;
         qryDet1.FieldByName('CODTIPDOC').AsFloat        := qryDet.FieldByName('CODTIPDOC').AsFloat;
         qryDet.Next;
      end;
      //
      qryDet1.First;
      while not qryDet1.EOF do
      begin
         //
         //Calular o imposto e lança mais um registro de tipo de desembolso.
         //
         ImpostoRetido.DataProgramada    := qry.FieldByName('DATALANCFINAN').AsDateTime;
         ImpostoRetido.OperacaoDocumento := '2 ';
         ImpostoRetido.IdForCli          := 0;
         ImpostoRetido.CodDocumento      := 0;
         ImpostoRetido.NumLancto         := 0;
         ImpostoRetido.ValorLancto       := qryDet1.FieldByName('VALOR').AsFloat;
         ImpostoRetido.ValorLiquido      := qryDet1.FieldByName('VALOR').AsFloat;
         ImpostoRetido.DataLancto        := qry.FieldByName('DATALANCFINAN').AsDateTime;
         ImpostoRetido.DataEmissao       := qry.FieldByName('DATALANCFINAN').AsDateTime;
         if (IntegraBack.RecPag = 'R') then
          begin
             if (IntegraBack.RecPag = qryDet1.FieldByName('RECPAG').AsString) then
                ImpostoRetido.DebCre := 'D'
             Else
                ImpostoRetido.DebCre := 'C';
          end
         else
          begin
             if (IntegraBack.RecPag = qryDet1.FieldByName('RECPAG').AsString) then
                ImpostoRetido.DebCre := 'C'
             Else
                ImpostoRetido.DebCre := 'D';
          end;
         ImpostoRetido.CodTipRecDes      := qryDet1.FieldByName('CODTIPRECDES').AsString;
         ImpostoRetido.MomentoLancamento := mlLancamento;
         ImpostoRetido.CodTipoDoc        := iTipoDoc;
         ImpostoRetido.Incluir;
         //
         if Not ImpostoRetido.QrySimulacao.IsEmpty Then
          begin
             ImpostoRetido.QrySimulacao.First;
             while not ImpostoRetido.QrySimulacao.EOF do
             begin
                sSql := 'SELECT CODTIPRECDES, RECPAG FROM TIPOAGRE '+
                        'WHERE (CODTIPRECDES IS NOT NULL) AND '+
                        '      (CODTIPOCUSTAGREG = '+
                         IntToStr(ImpostoRetido.QrySimulacao.FieldByName('IDIMPOSTO').AsInteger)+')';

                if FazQuery(qryAux,sSql) then
                 begin
                    //Limpa qryContabil
                    qryContabil.First;
                    while not qryContabil.EOF do qryContabil.Delete;

                    rTotImp := rTotImp + ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat;

                    qryDet.Insert;
                    qryDet.FieldByName('IDPESSOA').AsInteger       := qryDet1.FieldByName('IDPESSOA').AsInteger;
                    qryDet.FieldByName('UNIDNEGOC').AsInteger      := qryDet1.FieldByName('UNIDNEGOC').AsInteger;
                    qryDet.FieldByName('CODTIPRECDES').AsString    := qryAux.FieldByName('CODTIPRECDES').AsString;
                    qryDet.FieldByName('RECPAG').AsString          := qryAux.FieldByName('RECPAG').AsString;
                    qryDet.FieldByName('CODCENTRORESPON').AsString := qryDet1.FieldByName('CODCENTRORESPON').AsString;
                    qryDet.FieldByName('VALOR').AsFloat            := ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                    qryDet.FieldByName('CODCENTROCUSTO').AsString  := qryDet1.FieldByName('CODCENTROCUSTO').AsString;
                    qryDet.FieldByName('IDEMPRESA').AsInteger      := qryDet1.FieldByName('IDEMPRESA').AsInteger;
                    qryDet.FieldByName('IDPATRO').AsFloat          := qryDet1.FieldByName('IDPATRO').AsFloat;
                    qryDet.FieldByName('IDPROGRAMA').AsFloat       := qryDet1.FieldByName('IDPROGRAMA').AsFloat;
                    qryDet.FieldByName('IDPLANOPREV').AsFloat      := qryDet1.FieldByName('IDPLANOPREV').AsFloat;
                    qryDet.FieldByName('CODTIPDOC').AsFloat        := qryDet1.FieldByName('CODTIPDOC').AsFloat;
                    qryDet.Post;
                 end;
                ImpostoRetido.QrySimulacao.Next;
             end;
          end;
         qryDet1.Next;
      end;
   end; 
  dbeValorCorrente.Value := dbeValorCorrente.Value + rTotImp; //Fim do Cálculo de Imposto

  if ((qry.FieldByName('STATUSCONCILIA').AsString = 'X') or
     (qry.FieldByName('STATUSCONCILIA').AsString = 'I')) and
     (trim(qry.FieldByName('DATACONCILIACAO').AsString)='') then
         qry.FieldByName('DATACONCILIACAO').AsString:=qry.FieldByName('DATALANCFINAN').AsString;

  if (qry.FieldByName('STATUSCONCILIA').AsString = 'N') or
     (qry.FieldByName('STATUSCONCILIA').AsString = 'C') then
         qry.FieldByName('DATACONCILIACAO').AsString:='';

  if cbNaoContabiliza.Checked then
   begin
      qryContabil.First;
      while not qryContabil.EOF do qryContabil.Delete;
   end
  else
   IncluiContabilidade;

  iPortador := qry.FieldByName('CODPORTADOR').AsInteger;
  sEntradaSaida := qry.FieldByName('ENTRADASAIDA').AsString;
  sDataLancamento := qry.FieldByName('DATALANCFINAN').AsString;
  qry.FieldByName('VALORLANCFINAN').AsFloat  := dbeValorCorrente.Value;
  qry.FieldByName('VALOROUTRAMOEDA').AsFloat := dbeValorMoeda.Value;
  qry.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
  rTotalContab:=0;
  rValorCheckContab:=0;
  rValorBanco:=0;

  if qry.FieldByName('ENTRADASAIDA').AsString = 'S' then
     rValorCheckBanco:=(dbeValorCorrente.Value * (-1))
  else
     rValorCheckBanco:=dbeValorCorrente.Value;

  if not(cbNaoContabiliza.Checked) and (IntegraBack.Contabilidade = 'S') and
     (qry.FieldByName('IDMODULO').AsInteger = 9) then
   begin
      if qryContabil.IsEmpty then
       begin
          MsgDlg('Obrigatório ter Lançamento Contábil','Erro',mtError,[mbOk],0);
          DesfazImposto;
          dbeDocumento.SetFocus;
          exit;
       end;

      qryContabil.First;
      while not(qryContabil.Eof) do
      begin
         if (trim(qryContabil.FieldByName('LACDEBCRE').AsString) = '') or
            (trim(qryContabil.FieldByName('PLACONTA').AsString) = '') or
            (trim(qryContabil.FieldByName('UNIDNEGOC').AsString) = '') or
            (qryContabil.FieldByName('LACVALOR').AsFloat = 0) then
          begin
             MsgDlg('Faltam alguns dados para completar a Contabilização. Verifique','Erro',mtError,[mbOk],0);
             DesfazImposto;
             exit;
          end;
         FuncaoGeral.TestaContaCC(False,qryContabil.FieldByName('PLANO').AsInteger,qryContabil.FieldByName('PLACONTA').AsString,sObrigaCC,sDescConta,sSubConta);
         if sDescConta = '' then exit;
         if (sObrigaCC = 'S') and (qryContabil.FieldByName('CODCENTROCUSTO').isNull) Then
          begin
             FazQryCC(IntegraBack.Plano,dbccConta.Conta.Numero);
             FazQrySubC;
             if (not qryCCusto.IsEmpty) and (qryCCusto.RecordCount = 1) then
              begin
                 qryContabil.Edit;
                 qryContabil.FieldByName('CODCENTROCUSTO').AsString:=qryCCusto.FieldByName('CODCENTROCUSTO').AsString;
                 qryContabil.Post;
              end
             else
              begin
                 MsgDlg('Obrigatório preencher o Centro de Custo da Conta '+qryContabil.FieldByName('PLACONTA').AsString,'Erro',mtError,[mbOk],0);
                 DesfazImposto;
                 exit;
              end;
          end;

         if qryContabil.FieldByName('LACDEBCRE').AsString = 'D' then
            rTotalContab   := rTotalContab   + qryContabil.FieldByName('LACVALOR').AsFloat
         else
            rTotalContab   := rTotalContab   - qryContabil.FieldByName('LACVALOR').AsFloat;

         if (qryContabil.FieldByName('PLACONTA').AsString = sContaBanco) and
            (qryContabil.FieldByName('CODSUBCONTA').AsInteger = iSubContaBanco) then
          begin
             if qryContabil.FieldByName('LACDEBCRE').AsString = 'D' then
                rValorBanco  := rValorBanco + qryContabil.FieldByName('LACVALOR').AsFloat
             else
                rValorBanco  := rValorBanco - qryContabil.FieldByName('LACVALOR').AsFloat;
          end;
         qryContabil.Next;
      end;

     if Format('%17.2f',[rTotalContab]) <> Format('%17.2f',[rValorCheckContab]) then
      begin
         MsgDlg('Total do Débito não bate com o Total do Crédito na Contabilização. Verifique','Erro',mtError,[mbOk],0);
         DesfazImposto;
         exit;
      end;

     if Format('%17.2f',[rValorBanco]) <> Format('%17.2f',[rValorCheckBanco]) then
      begin
         MsgDlg('O valor contabilizado na conta do banco deve ser igual ao valor do lançamento. Verifique','Erro',mtError,[mbOk],0);
         DesfazImposto;
         exit;
       end;
   end;
  inherited;
end;

procedure TfrmMovimFinanc.CmeDetalheInsert(Sender: TObject);
var
   primvez : boolean;
begin
  pgcRateio.ActivePageIndex:=0;
  pgcContabil.ActivePageIndex:=0;

  primvez :=qryDet.IsEmpty;
  inherited;
  if pgctrlDetalhe.ActivePage.PageIndex = 0 then
   begin
      if qryPortador.FieldByName('MOECODIGO').AsInteger <> 0 then
       begin
          qryDet.FieldByName('MOECODIGO').AsInteger:=qryPortador.FieldByName('MOECODIGO').AsInteger;
          dbeValorMoedaDet.Enabled := True;
          dbeValorDet.Enabled := False;
       end
      else
       begin
          dbeValorMoedaDet.Enabled := False;
          dbeValorDet.Enabled := True;
       end;

      rSvValor   :=0;
      rSvValorOut:=0;
      TestaUnNegCentroRespon;

      if dblcUnidNegoc.Enabled then
       dblcUnidNegoc.SetFocus
      else
       begin
          if dblcCentroRespon.Enabled then
             dblcCentroRespon.SetFocus
          else
             dblcTipoRD.SetFocus;
       end;
{  Ver o porque ???????}

      if not (qrydet.state in [dsedit,dsinsert]) then
         qrydet.edit;

      qryDet.FieldByName('MOECODIGO').Value := NULL;
      dbeValorMoedaDet.Value:=dbeValorMoeda.Value - rAcumOM;
      dbeValorDet.Value:=dbeValorCorrente.Value - rAcumulado;
      edMoedaDet.Text:='';

       if qry.FieldByName('MOECODIGO').AsInteger <>0 then
        begin
           qryDet.FieldByName('MOECODIGO').AsInteger := qry.FieldByName('MOECODIGO').AsInteger;
           edMoedaDet.Text:=qryMoeda.FieldByName('MOESIGLA').AsString;
        end
       else
        dbeValorMoedaDet.Value:=0;

        if (dbeValorMoedaDet.Value = 0) and (dbeValorDet.Value = 0) and (not primvez) then
           bbtnVoltarDetClick(Self);
   end;

  if pgctrlDetalhe.ActivePage.PageIndex = 1 then
   begin
      dblcSubConta.Enabled := False;
      dblcCCusto.Enabled   := False;
      if qry.FieldByName('ENTRADASAIDA').AsString = 'S' then
       begin
          qryContabil.FieldByName('LACDEBCRE').AsString := 'D';
          qryContabil.FieldByName('LACTIPO').AsString:='0';
       end
      else
       begin
          qryContabil.FieldByName('LACDEBCRE').AsString := 'C';
          qryContabil.FieldByName('LACTIPO').AsString:='1';
       end;
      reValorMoedaCon.Value:=0;
      reValorCorrenteCon.Value:=0;
      qryContabil.FieldByName('PLANO').AsInteger:=IntegraBack.Plano;
      qryContabil.FieldByName('LACHIST1').AsString:=sHist1;
      qryContabil.FieldByName('LACHIST2').AsString:=sHist2;
      qryContabil.FieldByName('LACHIST3').AsString:=sHist3;
      qryContabil.FieldByName('LACHIST4').AsString:=sHist4;
      qryContabil.FieldByName('LACHIST5').AsString:=sHist5;
      qryContabil.FieldByName('LACNUMDOC').AsString:=dbeDocumento.Text;
      dbccConta.SetFocus;
      if qry.FieldByName('MOECODIGO').AsInteger <>0 then
       begin
          reValorMoedaCon.Enabled:=True;
          reValorCorrenteCon.Enabled:=False;
       end
      else
       begin
          reValorMoedaCon.Enabled:=False;
          reValorCorrenteCon.Enabled:=True;
       end;
      dbccConta.SetFocus;
   end; 
end;

procedure TfrmMovimFinanc.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (qry.State in ([dsInsert,dsEdit])) then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State in ([dsInsert,dsEdit])) then
     begin
        if qryPortador.FieldByName('MOECODIGO').AsInteger <> 0 then
        begin
           qryDet.FieldByName('MOECODIGO').AsInteger:=qryPortador.FieldByName('MOECODIGO').AsInteger;
           dbeValorMoedaDet.Enabled := True;
           dbeValorDet.Enabled := False;
        end
        else
        begin
           dbeValorMoedaDet.Enabled := False;
           dbeValorDet.Enabled := True;
        end;
        if ((qryDet.FieldByName('RECPAG').AsString = 'R') and (qry.FieldByName('ENTRADASAIDA').AsString = 'E')) or ((qryDet.FieldByName('RECPAG').AsString = 'P') and (qry.FieldByName('ENTRADASAIDA').AsString = 'S')) then
        begin
           rSvValor   :=qryDet.FieldByName('VALOR').AsFloat;
           rSvValorOut:=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end
        else
        begin
           rSvValor   :=qryDet.FieldByName('VALOR').AsFloat*(-1);
           rSvValorOut:=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat*(-1);
        end;
        dblcTipoRD.Text:=qryDetDESCRICAO.Text;
        dblcCentroRespon.Text:=qryDetNOME_1.Text;
        dblcUnidNegoc.Text:=qryDetNOME.Text;
        qryDet.FieldByName('MOECODIGO').Value := NULL;
        dbeValorMoedaDet.Value:=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        dbeValorDet.Value:=qryDet.FieldByName('VALOR').AsFloat;
        edMoedaDet.Text:='';
        TestaUnNegCentroRespon;
        if dblcUnidNegoc.Enabled then
           dblcUnidNegoc.SetFocus
        else
        begin
           if dblcCentroRespon.Enabled then
              dblcCentroRespon.SetFocus
           else
              dblcTipoRD.SetFocus;
        end;
        IF qry.FieldByName('MOECODIGO').AsInteger <>0 Then
        begin
           qryDet.FieldByName('MOECODIGO').AsInteger := qry.FieldByName('MOECODIGO').AsInteger;
           edMoedaDet.Text:=qryMoeda.FieldByName('MOESIGLA').AsString;
        end
        else
           dbeValorMoedaDet.Value:=0;
     end;

     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  and (qryContabil.State in ([dsInsert,dsEdit])) then
     begin
        if qryContabil.FieldByName('CODCENTROCUSTO').IsNull Then
         begin
            dblcCCusto.Enabled   := False;
         end
        else
         begin
            dblcCCusto.Enabled   := True;
         end;

        if qryContabil.FieldByName('CODSUBCONTA').IsNull Then
         begin
            dblcSubConta.Enabled := False;
         end
        else
         begin
            dblcSubConta.Enabled := True;
         end;

        reValorCorrenteCon.Value := qryContabil.FieldByName('LACVALOR').AsFloat;
        reValorMoedaCon.Value    := qryContabil.FieldByName('LACVALHIST').AsFloat;

        IF qry.FieldByName('MOECODIGO').AsInteger <>0 Then
         begin
            reValorMoedaCon.Enabled:=True;
            reValorCorrenteCon.Enabled:=False;
            if reValorMoedaCon.Value = 0 then
               reValorMoedaCon.Value:=reValorCorrenteCon.Value/rValorCotacao;
         end
        else
         begin
            reValorMoedaCon.Value:=0;
            reValorMoedaCon.Enabled:=False;
            reValorCorrenteCon.Enabled:=True;
         end;
        dbccConta.SetFocus;
     end;
  end;
end;

procedure TfrmMovimFinanc.CmeDetalheDelete(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage.PageIndex = 0 then
  begin
     if ((qryDet.FieldByName('RECPAG').AsString = 'R') and (qry.FieldByName('ENTRADASAIDA').AsString = 'E')) or ((qryDet.FieldByName('RECPAG').AsString = 'P') and (qry.FieldByName('ENTRADASAIDA').AsString = 'S')) then
     begin
        rAcumulado:=rAcumulado-qryDet.FieldByName('VALOR').AsFloat;
        rAcumOM   :=rAcumOM   -qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
     end
     else
     begin
        rAcumulado:=rAcumulado+qryDet.FieldByName('VALOR').AsFloat;
        rAcumOM   :=rAcumOM   +qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
     end;
  end;
  inherited;
end;

procedure TfrmMovimFinanc.CmeDetalheConfirma(Sender: TObject);
begin
  if (qry.State in ([dsInsert,dsEdit])) then
   begin
      pgcRateio.ActivePageIndex:=0;
      pgcContabil.ActivePageIndex:=0;

      if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State in ([dsInsert,dsEdit])) then
       begin
          if trim(dblcUnidNegoc.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
              dblcUnidNegoc.SetFocus;
              exit;
           end;

          qryCentroRespon.First;

          if qryCentroRespon.IsEmpty then
             qryDetNOME_1.Text:=sNomeCentroRespon
          else
           begin
              qryDetNOME_1.Text:=dblcCentroRespon.Text;
              if trim(dblcCentroRespon.Text) = '' then
               begin
                  MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
                  dblcCentroRespon.SetFocus;
                  exit;
               end;
           end;

          if trim(dblcTipoRD.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
              dblcTipoRD.SetFocus;
              exit;
           end;

          if trim(dblcTipoDocumento.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
              dblcTipoDocumento.SetFocus;
              exit;
           end;

          if (dbeValorMoedaDet.Value = 0) and (qry.FieldByName('MOECODIGO').AsInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
              dbeValorMoedaDet.SetFocus;
              exit;
           end;

          if dbeValorDet.Value = 0 then
           begin
              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
              dbeValorDet.SetFocus;
              exit;
           end;

          if (Sistema.UsaPlanoPatro) then
           begin
              if (dblcPrograma.Value = '') and (dbrConcilia.ItemIndex<>2) then
               begin
                  MsgDlg('Obrigatório preencher o Programa','Erro',mtError,[mbOk],0);
                  pgcRateio.ActivePageIndex:=1;
                  dblcPrograma.SetFocus;
                  exit;
               end;

              if dblcPatrocinadorRateio.Value = '' then
               begin
                  MsgDlg('Obrigatório preencher o Patrocinador','Erro',mtError,[mbOk],0);
                  pgcRateio.ActivePageIndex:=1;
                  dblcPatrocinadorRateio.SetFocus;
                  exit;
               end;

              if dblcPlanoPrevRateio.Value = '' then
               begin
                  MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
                  pgcRateio.ActivePageIndex:=1;
                  dblcPlanoPrevRateio.SetFocus;
                  exit;
               end;
           end;

          if ((qryTipoRD.FieldByName('RECPAG').AsString = 'R') and (qry.FieldByName('ENTRADASAIDA').AsString = 'E')) or ((qryTipoRD.FieldByName('RECPAG').AsString = 'P') and (qry.FieldByName('ENTRADASAIDA').AsString = 'S')) then
           begin
              rAcumulado:=rAcumulado+dbeValorDet.Value-rSvValor;
              rAcumOM   :=rAcumOM   +dbeValorMoedaDet.Value-rSvValorOut;
           end
          else
           begin
              rAcumulado:=rAcumulado-dbeValorDet.Value-rSvValor;
              rAcumOM   :=rAcumOM   -dbeValorMoedaDet.Value-rSvValorOut;
           end;

          qryDetDESCRICAO.Text       :=dblcTipoRD.Text;
          qryDetNOME.Text            :=dblcUnidNegoc.Text;
          qryDetMOESIGLA.Text        :=edMoedaDet.Text;
          qryDetVALOR.Value          :=dbeValorDet.Value;
          qryDetVALOROUTRAMOEDA.Value:=dbeValorMoedaDet.Value;
          qryDet.FieldByName('RECPAG').AsString:=qryTipoRD.FieldByName('RECPAG').AsString;
          qryDet.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

          if qryDet.FieldByName('CODCENTROCUSTO').IsNull then
             qryDet.FieldByName('IDEMPRESA').Clear
          else
             qryDet.FieldByName('IDEMPRESA').AsInteger:= Sistema.IdEmpresa;
       end;

     //

     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (qryContabil.State in ([dsInsert,dsEdit])) then
      begin
         if trim(dbccConta.Conta.Numero) = '' then
          begin
             MsgDlg('Obrigatório preencher a Conta Contábil','Erro',mtError,[mbOk],0);
             dbccConta.SetFocus;
             exit;
          end;

         if (dbccConta.Conta.ObrigaSubConta) and (trim(dblcSubConta.Text)= '') then
          begin
             MsgDlg('Obrigatório preencher a Sub-Conta','Erro',mtError,[mbOk],0);
             dblcSubConta.SetFocus;
             exit;
          end;

         if (dbccConta.Conta.ObrigaCentrodeCusto) and (trim(dblcCCusto.Text)= '') then
          begin
             MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
             dblcCCusto.SetFocus;
             exit;
          end;

         if trim(dblcAtividade.Text) = '' then
          begin
             MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
             dblcAtividade.SetFocus;
             exit;
          end;

         if trim(dbeHist1.Text) = '' then
          begin
             MsgDlg('Obrigatório preencher pelo menos a primeira linha do histórico','Erro',mtError,[mbOk],0);
             dbeHist1.SetFocus;
             exit;
          end;

         if (reValorMoedaCon.Value = 0) and (qry.FieldByName('MOECODIGO').AsInteger <> 0) then
          begin
             MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
             reValorMoedaCon.SetFocus;
             exit;
          end;

         if reValorCorrenteCon.Value = 0 then
          begin
             MsgDlg('Obrigatório preencher o Valor','Erro',mtError,[mbOk],0);
             reValorCorrenteCon.SetFocus;
             exit;
          end;

         if Sistema.UsaPlanoPatro then
          begin
             if dblcPatrocinadorContabil.Value = '' then
              begin
                 MsgDlg('Obrigatório preencher o Patrocinador','Erro',mtError,[mbOk],0);
                 pgcContabil.ActivePageIndex:=1;
                 dblcPatrocinadorContabil.SetFocus;
                 exit;
              end;

             if dblcPlanoPrevContabil.Value = '' then
              begin
                 MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
                 pgcContabil.ActivePageIndex:=1;
                 dblcPlanoPrevContabil.SetFocus;
                 exit;
              end;
          end;

         qryContabilNOME.Text       :=dblcAtividade.Text;
         qryContabilNOME_1.Text     :=dblcCCusto.Text;
         qryContabilLACVALOR.Value  :=reValorCorrenteCon.Value;
         qryContabilLACVALHIST.Value:=reValorMoedaCon.Value;
      end;
   end;
  inherited;
end;

procedure TfrmMovimFinanc.tbcDetalheChange(Sender: TObject);
begin
  if (IntegraBack.Contabilidade<>'S') or (cbNaoContabiliza.Checked) then
     tbcDetalhe.TabIndex:=0;

  inherited;
  if (pgctrlDetalhe.ActivePage.PageIndex=1) then
     IncluiContabilidade;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmMovimFinanc.dblcPortadorExit(Sender: TObject);
begin
  inherited;
  if (qry.State in ([dsInsert,dsEdit])) then
  begin
     if trim(dblcPortador.Text)<>'' then
     begin
        if (IntegraBack.Contabilidade = 'S') and (qry.FieldByName('IDMODULO').AsInteger = 9) then
        begin
           if trim(qryPortador.FieldByName('PLACONTA').AsString) = '' then
           begin
             MsgDlg('Como a contabilidade está integrada, é obrigatório preencher a conta contabil desta Conta Bancária/Caixa','Erro',mtError,[mbOk],0);
             bbtnCancelarClick(Self);
             exit;
           end;
           if Modulo.sNaoIdent = 'S' then
           begin
              sContaBanco   :=qryParamFinanc.FieldByName('CONTALANCNAOIDENT').AsString;
              sCCustBanco   :=qryParamFinanc.FieldByName('CCUSTOLANCNAOID').AsString;
              iSubContaBanco:=qryParamFinanc.FieldByName('SUBCONTANAOIDENT').AsInteger;
           end
           else
           begin
              sContaBanco   :=qryPortador.FieldByName('PLACONTA').AsString;
              sCCustBanco   :=qryPortador.FieldByName('CODCENTROCUSTO').AsString;
              iSubContaBanco:=qryPortador.FieldByName('CODSUBCONTA').AsInteger;
           end;
        end;
        qry.FieldByName('MOECODIGO').Value := NULL;
        edMoeda.Text:='';
        if (qryPortador.FieldByName('MOECODIGO').AsInteger <> 0) then
        begin
           qry.FieldByName('MOECODIGO').AsInteger:=qryPortador.FieldByName('MOECODIGO').AsInteger;
           //
           qryMoeda.Close;
           qryMoeda.SQL.Clear;
           qryMoeda.SQL.text := 'SELECT MOEDESC,MOESIGLA FROM MOEDA WHERE MOECODIGO = '+qryPortador.FieldByName('MOECODIGO').AsString;
           qryMoeda.Open;
           //
           edMoeda.Text:=qryMoeda.FieldByName('MOESIGLA').AsString;
           dbeValorMoeda.Enabled := True;
           dbeValorCorrente.Enabled := False;
        end
        else
        begin
           dbeValorMoeda.Enabled := False;
           dbeValorMoeda.Value:=0;
           dbeValorCorrente.Enabled := True;
        end;
     end;
  end; 
end;

procedure TfrmMovimFinanc.dbeValorMoedaExit(Sender: TObject);
begin
  inherited;
  dbeValorCorrente.Value:=dbeValorMoeda.Value*rValorCotacao;
end;

procedure TfrmMovimFinanc.dbeValorMoedaDetExit(Sender: TObject);
begin
  inherited;
  dbeValorDet.Value:=dbeValorMoedaDet.Value*rValorCotacao;
end;

procedure TfrmMovimFinanc.dbeValorMoedaEnter(Sender: TObject);
begin
  inherited;
  rValorCotacao:=FuncaoGeral.TestaCotacaoMoeda(qryPortador.FieldByName('MOECODIGO').AsInteger,dbeDataLanc.Text,'S');
  if  (rValorCotacao = 0) then
  begin
     dbeDataLanc.SetFocus;
     exit;
  end;
end;

procedure TfrmMovimFinanc.dblcCCustoEnter(Sender: TObject);
begin
  inherited;
  FazQryCC(IntegraBack.Plano,dbccConta.Conta.Numero);
end;

procedure TfrmMovimFinanc.reValorMoedaConExit(Sender: TObject);
begin
  inherited;
  reValorCorrenteCon.Value:=reValorMoedaCon.Value*rValorCotacao;
end;

procedure TfrmMovimFinanc.bbtnCancelarClick(Sender: TObject);
begin
  pnlMestre.Enabled:=False;
  inherited;
end;

procedure TfrmMovimFinanc.sbtnEstornarClick(Sender: TObject);
begin
  inherited;
  frmEstornoFinan:=TfrmEstornoFinan.Create(Self);
  frmEstornoFinan.ShowModal;
  sbtnEstornar.Down:=False;
end;

procedure TfrmMovimFinanc.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnEstornar.Enabled:=False;
   sbtnMudaStatus.Enabled:=False;
   sbtnAlterar.Enabled :=False;
   sbtnApagar.Enabled  :=False;
   if iCodLancFinanc <> 0 then
   begin
      sbtnMudaStatus.Enabled:= not(sbtnInserir.Down);
      sbtnAlterar.Enabled   :=True;
      sbtnApagar.Enabled    :=True;
      if iModulo <> 9 then
      begin
         sbtnAlterar.Enabled :=False;
         sbtnApagar.Enabled  :=False;
      end
      else
      begin
         sbtnEstornar.Enabled:=False;
         if (IntegraBack.Contabilidade = 'S') and not(sbtnInserir.Down)  and
            not(sbtnAlterar.Down) and not(sbtnApagar.Down) then
         begin
            if sEstorna = 'S' then
            begin
               sbtnEstornar.Enabled:=True;
               sbtnApagar.Enabled  :=False;
            end;
         end;
      end;
   end;
   
   if Modulo.sNaoIdent = 'S' then
   begin
      sbtnMudaStatus.Enabled:=False;
      sbtnInserir.Enabled   :=False;
      sbtnApagar.Enabled    :=False;
      sbtnEstornar.Enabled  :=False;
      //
      sbtnMudaStatus.Visible:=False;
      sbtnInserir.Visible   :=False;
      sbtnApagar.Visible    :=False;
      sbtnEstornar.Visible  :=False;
      //
      sbtnAlterar.Left:=0;
      sbtnProcurar.Left:=60;
      sbtnAlterar.Width:=68;
      sbtnAlterar.Caption:='&Regularizar';
   end;
end;

procedure TfrmMovimFinanc.IncluiContabilidade;
begin
  if not(cbNaoContabiliza.Checked) and (IntegraBack.Contabilidade = 'S') and
        (qry.FieldByName('IDMODULO').AsInteger = 9) and (qry.State in ([dsInsert,dsEdit])) then
  begin
     qryContabil.First;
     if (qryContabil.IsEmpty) and (trim(dblcPortador.Text) <> '') then
        //and (dbeValorCorrente.Value <> 0) then
     begin
        qryDet.First;
        while (not qryDet.Eof) do
        begin
           sContaContabil:=sContaBanco;
           sCentroCusto  :=sCCustBanco;
           sNomeUnidNegoc:=qryDet.FieldByName('NOME').AsString;
           iUnidNegoc    :=qryDet.FieldByName('UNIDNEGOC').AsInteger;
           iSubConta     :=iSubContaBanco;
           rValorCorrente:=qryDet.FieldByName('VALOR').AsFloat;
           rValorMoeda   :=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;

           rIDPatro:=qryDet.FieldByName('IDPATRO').AsFloat;
           rIDPlanoPrev:=qryDet.FieldByName('IDPLANOPREV').AsFloat;

           if qry.FieldByName('ENTRADASAIDA').AsString = 'S' then
            begin
               sDebCre:='C';
               sTipoDC:='1';
               if qryDet.FieldByName('RECPAG').AsString = 'R' then begin
                  rValorCorrente:=rValorCorrente * (-1);
                  rValorMoeda   :=rValorMoeda    * (-1);
               end;
            end
           else
            begin
               sDebCre:='D';
               sTipoDC:='0';
               if qryDet.FieldByName('RECPAG').AsString = 'P' then begin
                  rValorCorrente:=rValorCorrente * (-1);
                  rValorMoeda   :=rValorMoeda    * (-1);
               end;
            end;

           FazerInsertContab;

           if (dbrConcilia.ItemIndex = 2) AND (Modulo.sNaoIdent <> 'S') Then
            begin
               sContaContabil:=qryParamFinanc.FieldByName('CONTALANCNAOIDENT').AsString;
               sCentroCusto  :=qryParamFinanc.FieldByName('CCUSTOLANCNAOID').AsString;
               iSubConta     :=qryParamFinanc.FieldByName('SUBCONTANAOIDENT').AsInteger;
               sNomeUnidNegoc:=qryDet.FieldByName('NOME').AsString;
               iUnidNegoc    :=qryDet.FieldByName('UNIDNEGOC').AsInteger;
               rValorCorrente:=qryDet.FieldByName('VALOR').AsFloat;
               rValorMoeda   :=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
               if qry.FieldByName('ENTRADASAIDA').AsString = 'S' then
                begin
                   sDebCre:='D';
                   sTipoDC:='0';
                end
               else
                begin
                   sDebCre:='C';
                   sTipoDC:='1';
                end;
               FazerInsertContab;
            end
           else
            begin
               sCentroCusto       :=qryDet.FieldByName('CODCENTROCUSTO').AsString;
               IntegraBack.RecPag :=qryDet.FieldByName('RECPAG').AsString;
               sContaContabil     :=Documento.BuscaContaContabil(qryDet.FieldByName('IDPROGRAMA').AsInteger,qryDet.FieldByName('CODTIPRECDES').AsString,qryDet.FieldByName('CODCENTROCUSTO').AsString);
               { já estava comentado qryAuxTipoRD.Close;
               qryAuxTipoRD.SQL.Clear;
               qryAuxTipoRD.SQL.text := 'SELECT T.PLACONTA,P.PLACCUST FROM TIPORECEBDESEMB T, PLANOCONTA P WHERE '+
                                        'T.CODTIPRECDES = '''+qryDet.FieldByName('CODTIPRECDES').AsString+''''+
                                        ' AND T.RECPAG = '''+qryDet.FieldByName('RECPAG').AsString+''''+
                                        ' AND T.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND P.PLACONTA = T.PLACONTA'+
                                        ' AND P.PLANO = T.PLANO';
               qryAuxTipoRD.Open;
               qryAuxTipoRD.First;

               if not qryAuxTipoRD.IsEmpty then
               begin
                  sContaContabil:=qryAuxTipoRD.FieldByName('PLACONTA').AsString;
                  if qryAuxTipoRD.FieldByName('PLACCUST').AsString = 'S' then
                     sCentroCusto:=qryDet.FieldByName('CODCENTROCUSTO').AsString;
               end;}
               sNomeUnidNegoc:=qryDet.FieldByName('NOME').AsString;
               iUnidNegoc    :=qryDet.FieldByName('UNIDNEGOC').AsInteger;
               iSubConta     :=0;
               rValorCorrente:=qryDet.FieldByName('VALOR').AsFloat;
               rValorMoeda   :=qryDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
               if qryDet.FieldByName('RECPAG').AsString = 'R' then
                begin
                   sDebCre:='C';
                   sTipoDC:='1';
                end
               else
                begin
                   sDebCre:='D';
                   sTipoDC:='0';
                end;
               FazerInsertContab;
            end;
           qryDet.Next;
        end;
     end;
  end;
end;

procedure TfrmMovimFinanc.FazerInsertContab;
var sHistorico,sNomeCC,sNomeConta,sObrigaCC,sSubConta:String;
begin
   if (sContaContabil = '') then Exit;
   
   qryContabil.First;
   while (not qryContabil.Eof) do
   begin
      if (qryContabil.FieldByName('PLACONTA').AsString=sContaContabil) AND
         (qryContabil.FieldByName('CODCENTROCUSTO').AsString=sCentroCusto) AND
         (qryContabil.FieldByName('UNIDNEGOC').AsInteger=iUnidNegoc) AND
         (qryContabil.FieldByName('CODSUBCONTA').AsInteger=iSubConta) AND
         (qryContabil.FieldByName('LACDEBCRE').AsString=sDebCre) AND
         (qryContabil.FieldByName('LACTIPO').AsString=sTipoDC) THEN
      begin
         dsContabil.DataSet.Edit;
         qryContabil.FieldByName('LACVALOR').AsFloat:=qryContabil.FieldByName('LACVALOR').AsFloat+rValorCorrente;
         qryContabil.FieldByName('LACVALHIST').AsFloat:=qryContabil.FieldByName('LACVALHIST').AsFloat+rValorMoeda;
         dsContabil.DataSet.Post;
         if qryContabil.FieldByName('LACVALOR').AsFloat=0 then qryContabil.Delete;
         exit;
      end;
      qryContabil.Next
   end;
   
   sHist1:='';
   sHist2:='';
   sHist3:='';
   sHist4:='';
   sHist5:='';
   sNomeCC:='';
   FuncaoGeral.TestaContaCC(False,IntegraBack.Plano,sContaContabil,sObrigaCC,sNomeConta,sSubConta);
   if sCentroCusto <> '' Then
      sNomeCC:=Funcaogeral.TestaCentroCusto(Sistema.idEmpresa,sCentroCusto);
   sHistorico:=trim(dbeHistorico.Text)+' - '+trim(dblcPortador.Text);
   FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);

   dsContabil.DataSet.Insert;
   qryContabil.FieldByName('PLACONTA').AsString:=sContaContabil;
   qryContabil.FieldByName('PLANO').AsInteger:=IntegraBack.Plano;
   qryContabil.FieldByName('CODCENTROCUSTO').AsString:=sCentroCusto;
   qryContabil.FieldByName('NOME_1').AsString:=sNomeCC;
   qryContabil.FieldByName('PLANOME').AsString:=sNomeConta;
   qryContabil.FieldByName('UNIDNEGOC').AsInteger:=iUnidNegoc;
   qryContabil.FieldByName('NOME').AsString:=sNomeUnidNegoc;
   qryContabil.FieldByName('LACVALOR').AsFloat:=rValorCorrente;
   qryContabil.FieldByName('LACVALHIST').AsFloat:=rValorMoeda;
   qryContabil.FieldByName('LACHIST1').AsString:=sHist1;
   qryContabil.FieldByName('LACHIST2').AsString:=sHist2;
   qryContabil.FieldByName('LACHIST3').AsString:=sHist3;
   qryContabil.FieldByName('LACHIST4').AsString:=sHist4;
   qryContabil.FieldByName('LACHIST5').AsString:=sHist5;
   qryContabil.FieldByName('LACNUMDOC').AsString:=dbeDocumento.Text;
   qryContabil.FieldByName('LACDEBCRE').AsString:=sDebCre;
   qryContabil.FieldByName('LACTIPO').AsString:=sTipoDC;
   //
   qryContabil.FieldByName('IDPATRO').AsFloat:=rIDPatro;
   qryContabil.FieldByName('IDPLANOPREV').AsFloat:=rIDPlanoPrev;


   if iSubConta <> 0 then
      qryContabil.FieldByName('CODSUBCONTA').AsInteger:=iSubConta;
   dsContabil.DataSet.Post;
end;

procedure TfrmMovimFinanc.dbrConciliaExit(Sender: TObject);
begin
  inherited;
  if (IntegraBack.Contabilidade = 'S') and (qry.FieldByName('STATUSCONCILIA').AsString = 'I') and (qryParamFinanc.FieldByName('CONTALANCNAOIDENT').AsString = '')Then
     cbNaoContabiliza.Checked:=True;
end;

procedure TfrmMovimFinanc.dbeDataLancExit(Sender: TObject);
begin
  inherited;
  if dbeDataLanc.Date > Date then
  begin
     MsgDlg('Proibido Data de Lançamento maior que a Data de Hoje','Erro',mtError,[mbOk],0);
     dbeDataLanc.SetFocus;
     exit;
  end;
end;

procedure TfrmMovimFinanc.FazerQryPrincipal;
begin
   //
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.text := 'SELECT * FROM MOVIMFINANC WHERE CODLANCFINANC = '+IntToStr(iCodLancFinanc);
   qry.Open;
   //
   iCodLancFinanc:=qry.FieldByName('CODLANCFINANC').AsInteger;
   iCodLancContab:=qry.FieldByName('PLNCODIGO').AsInteger;
   iModulo       :=qry.FieldByName('IDMODULO').AsInteger;
   dbeValorMoeda.Value:=qry.FieldByName('VALOROUTRAMOEDA').AsFloat;
   dbeValorCorrente.Value:=qry.FieldByName('VALORLANCFINAN').AsFloat;
   //
   qryModulo.Close;
   qryModulo.SQL.Clear;
   qryModulo.SQL.text := 'SELECT NOMEMODULO FROM MODULO WHERE IDMODULO = '+IntToStr(iModulo);
   qryModulo.Open;
   //
   lblNomeModulo.Caption:=qryModulo.FieldByName('NOMEMODULO').AsString;
   //
end;

procedure TfrmMovimFinanc.sbtnMudaStatusClick(Sender: TObject);
begin
  inherited;
  if qry.FieldByName('STATUSCONCILIA').AsString = 'I' then
  begin
     MsgDlg('Para Alterar o Status de um lançamento não Identificado deve-se ir a Opção "Regulariza Lançamentos Não Identificados"','Erro',mtError,[mbOk],0);
     sbtnMudaStatus.Down:=False;
     exit;
  end
  else
  begin
     frmMudaStatus:=TfrmMudaStatus.Create(Self);
     frmMudaStatus.ShowModal;
     sbtnMudaStatus.Down:=False;
     FazerQryPrincipal;
     SelecionaFilhos;
  end;
end;

procedure TfrmMovimFinanc.FormPaint(Sender: TObject);
begin
  inherited;
  if Modulo.sNaoIdent = 'N' then
     frmMovimFinanc.Caption:='Movimento Financeiro'
  else
     frmMovimFinanc.Caption:='Regularização de Lançamentos Não Identificados';
end;

procedure TfrmMovimFinanc.TestaUnNegCentroRespon;
begin
   dblcUnidNegoc.Enabled:=True;
   dblcCentroRespon.Enabled:=True;
   //Testa se somente existe uma atividade e Centro de Responsabilidade
   qryUnidNegoc.First;
   if qryUnidNegoc.RecordCount = 1 then
    begin
       dblcUnidNegoc.Enabled:=False;
       qryDet.FieldByName('UNIDNEGOC').AsInteger:=qryUnidNegoc.FieldByName('UNIDNEGOC').AsInteger;
       qryDet.FieldByName('NOME').AsString:=qryUnidNegoc.FieldByName('NOME').AsString;
    end;
   qryCentroRespon.First;
   if qryCentroRespon.RecordCount = 1 then
    begin
       dblcCentroRespon.Enabled:=False;
       qryDet.FieldByName('CODCENTRORESPON').AsString:=sCodCentroRespon;
       qryDet.FieldByName('NOME_1').AsString:=sNomeCentroRespon;
    end;
end;

procedure TfrmMovimFinanc.dbrEntradaSaidaChange(Sender: TObject);
begin
   inherited;
   qryTipoRD.Close;
   qryTipoRD.SQL.Clear;

   qryTipoRD.SQL.text:='SELECT '+
                       '   TRD.CODTIPRECDES, '+
                       '   TRD.RECPAG, '+
                       '   TRD.DESCRICAO '+
                       'FROM '+
                       '   TIPORECEBDESEMB TRD '+
                       'WHERE '+
                       '   (TRD.ANASINT = ''A'') AND '+
                       '   (TRD.IDPESSOA = '+IntToStr(Sistema.idempresa)+') AND '+
                       '   ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
                       '                          FROM TRDXCRESPON '+
                       '                          WHERE (CODCENTRORESPON = '+
                                                   #39+Trim(dblcCentroRespon.LookupValue)+#39+') AND '+
                       '                                (IDPESSOA='+InttoStr(Sistema.idempresa)+') AND '+
                       '                                (RECPAG=TRD.RECPAG))) OR '+
                       '    NOT EXISTS(SELECT * '+
                       '               FROM TRDXCRESPON '+
                       '               WHERE (CODCENTRORESPON = '+
                                        #39+Trim(dblcCentroRespon.LookupValue)+#39+') AND '+
                       '                     (IDPESSOA='+InttoStr(Sistema.idempresa)+'))) '+
                       'ORDER BY TRD.RECPAG ';

   if dbrEntradaSaida.ItemIndex = 0 then
      qryTipoRD.SQL.text:=qryTipoRD.SQL.text+' DESC, TRD.DESCRICAO'
   else
      qryTipoRD.SQL.text:=qryTipoRD.SQL.text+' ,TRD.DESCRICAO';

  qryTipoRD.Open;
end;

procedure TfrmMovimFinanc.dblcHistPadExit(Sender: TObject);
begin
  inherited;
  if trim(dbeHistorico.text) = '' then
  begin
     dbeHistorico.Text:=dblcHistPad.Text;
     qry.FieldByName('HISTORICO').AsString:=dblcHistPad.Text;
  end;
end;

procedure TfrmMovimFinanc.FazQryCC(iPlano:LongInt;sConta:String);
begin
  qryCCusto.Close;
  qryCCusto.SQL.Clear;
  qryCCusto.SQL.Add(' SELECT ');
  qryCCusto.SQL.Add('    C.CODCENTROCUSTO,');
  qryCCusto.SQL.Add('    C.NOME,');
  qryCCusto.SQL.Add('    C.STATUSGRUPOCDC');
  qryCCusto.SQL.Add(' FROM');
  qryCCusto.SQL.Add('    CENTCUST C ');
  qryCCusto.SQL.Add(' WHERE ');
  qryCCusto.SQL.Add('    (C.IDEMPRESA ='+IntToStr(Sistema.idEmpresa)+') AND ');
  qryCCusto.SQL.Add('    (C.STATUSGRUPOCDC=''A'') AND ');
  qryCCusto.SQL.Add('    (C.ATIVO=''S'') AND ');
  qryCCusto.SQL.Add('    (NOT EXISTS (SELECT 1 ');
  qryCCusto.SQL.Add('                 FROM CONTASxCC U ');
  qryCCusto.SQL.Add('                 WHERE (U.PLACONTA = '''+Trim(sConta)+ ''') AND ');
  qryCCusto.SQL.Add('                       (U.PLANO = '+ IntToStr(iPlano)+') AND ');
  qryCCusto.SQL.Add('                       (U.IDEMPRESA = '+IntToStr(Sistema.idEmpresa)+'))) ');
  qryCCusto.SQL.Add('UNION ');
  qryCCusto.SQL.Add(' SELECT ');
  qryCCusto.SQL.Add('    C.CODCENTROCUSTO, ');
  qryCCusto.SQL.Add('    C.NOME, ');
  qryCCusto.SQL.Add('    C.STATUSGRUPOCDC ');
  qryCCusto.SQL.Add(' FROM ');
  qryCCusto.SQL.Add('    CENTCUST C, ');
  qryCCusto.SQL.Add('    CONTASxCC CC ');
  qryCCusto.SQL.Add(' WHERE ');
  qryCCusto.SQL.Add('    (CC.PLANO = '+IntToStr(iPlano)+') AND ');
  qryCCusto.SQL.Add('    (CC.PLACONTA = '''+Trim(sConta)+ ''') AND ');
  qryCCusto.SQL.Add('    (C.IDEMPRESA ='+IntToStr(Sistema.idEmpresa)+') AND ');
  qryCCusto.SQL.Add('    (C.STATUSGRUPOCDC=''A'') AND ');
  qryCCusto.SQL.Add('    (C.ATIVO=''S'') AND ');
  qryCCusto.SQL.Add('    (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND ');
  qryCCusto.SQL.Add('    (C.IDEMPRESA = CC.IDEMPRESA) ');
  qryCCusto.SQL.Add('ORDER BY CODCENTROCUSTO');

  qryCCusto.Open;

  if qryCCusto.RecordCount=1 then
     dblcCentroCusto.LookupValue:=Trim(qryCCusto.FieldByName('CODCENTROCUSTO').AsString);
end;

procedure TfrmMovimFinanc.FazQrySubC;
begin
  qrySubConta.Close;
  qrySubConta.ParamByName('pPLACONTA').AsString  :=trim(dbccConta.Conta.Numero);
  qrySubConta.ParamByName('pPLANO').AsInteger    :=IntegraBack.Plano;
  qrySubConta.ParamByName('pIDPESSOA').AsInteger :=Sistema.IdEmpresa;
  qrySubConta.Open;
end;

procedure TfrmMovimFinanc.dbccContaExit(Sender: TObject);
begin
  inherited;
  if dbccConta.Valida <> VcOk then
   begin
      dbccConta.SetFocus;
      exit;
   end
  else
   begin
      if dbccConta.Conta.ObrigaCentrodeCusto then
       begin
          dblcCCusto.Enabled := True;
          if qryCCusto.RecordCount=1 then
             dblcCCusto.LookupValue:=Trim(qryCCusto.FieldByName('CODCENTROCUSTO').AsString);
          dblcCCusto.SetFocus;
       end
      else
       begin
          dblcCCusto.Enabled := False;
          qryContabil.FieldByName('CODCENTROCUSTO').Clear;
          qryContabil.FieldByName('IDEMPRESA').Clear;
       end;

     if dbccConta.Conta.ObrigaSubConta then
      begin
         dblcSubConta.Enabled := True;
         dblcSubConta.SetFocus;
      end
     else
      begin
         dblcSubConta.Enabled := False;
         qryContabil.FieldByName('CODSUBCONTA').Clear;
      end;
   end;
end;

procedure TfrmMovimFinanc.dblcSubContaEnter(Sender: TObject);
begin
  inherited;
  FazQrySubC;
end;

procedure TfrmMovimFinanc.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Modified then begin
     qryAuxTipoRD.Close;
     qryAuxTipoRD.SQL.Clear;
     qryAuxTipoRD.SQL.text := 'SELECT T.PLANO,T.PLACONTA,P.PLACCUST FROM TIPORECEBDESEMB T, PLANOCONTA P WHERE '+
                              'T.CODTIPRECDES  = '''+qryTipoRD.FieldByName('CODTIPRECDES').AsString+''''+
                              ' AND T.RECPAG   = '''+qryTipoRD.FieldByName('RECPAG').AsString+''''+
                              ' AND T.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND P.PLACONTA = T.PLACONTA'+
                              ' AND P.PLANO    = T.PLANO';
     qryAuxTipoRD.Open;
     //
     FazQryCC(qryAuxTipoRD.FieldByName('PLANO').AsInteger,qryAuxTipoRD.FieldByName('PLACONTA').AsString);
  end;
end;

procedure TfrmMovimFinanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ImpostoRetido.Free;
   inherited;
   Action:=caFree;
end;

procedure TfrmMovimFinanc.DesfazImposto;
begin
   if not qryDet1.isEmpty then
    begin
       qryDet.First;
       while not qryDet.EOF do qryDet.Delete;
       //
       qryDet1.First;
       while not qryDet1.EOF do
       begin
          qryDet.Insert;
          qryDet.FieldByName('IDPESSOA').AsInteger       := qryDet1.FieldByName('IDPESSOA').AsInteger;
          qryDet.FieldByName('UNIDNEGOC').AsInteger      := qryDet1.FieldByName('UNIDNEGOC').AsInteger;
          qryDet.FieldByName('CODTIPRECDES').AsString    := qryDet1.FieldByName('CODTIPRECDES').AsString;
          qryDet.FieldByName('RECPAG').AsString          := qryDet1.FieldByName('RECPAG').AsString;
          qryDet.FieldByName('CODCENTRORESPON').AsString := qryDet1.FieldByName('CODCENTRORESPON').AsString;
          qryDet.FieldByName('VALOR').AsFloat            := qryDet1.FieldByName('VALOR').AsFloat;
          qryDet.FieldByName('CODCENTROCUSTO').AsString  := qryDet1.FieldByName('CODCENTROCUSTO').AsString;
          qryDet.FieldByName('IDEMPRESA').AsInteger      := qryDet1.FieldByName('IDEMPRESA').AsInteger;
          qryDet.FieldByName('IDPATRO').AsFloat          := qryDet1.FieldByName('IDPATRO').AsFloat;
          qryDet.FieldByName('IDPROGRAMA').AsFloat       := qryDet1.FieldByName('IDPROGRAMA').AsFloat;
          qryDet.FieldByName('IDPLANOPREV').AsFloat      := qryDet1.FieldByName('IDPLANOPREV').AsFloat;
          qryDet.FieldByName('CODTIPDOC').AsFloat        := qryDet1.FieldByName('CODTIPDOC').AsFloat;
          qryDet1.Next;
       end;
    end;
end;

procedure TfrmMovimFinanc.dblcTipoRDChange(Sender: TObject);
begin
  inherited;
  qryTipoDocumento.Close;
  qryTipoDocumento.ParamByName('RECPAG').AsString:=qryTipoRD.FieldByName('RECPAG').AsString;
  qryTipoDocumento.Open;
end;

procedure TfrmMovimFinanc.qryDetAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not(qryTipoRD.Active) then Exit;

   if qryTipoRD.Locate('CODTIPRECDES;RECPAG',VarArrayOf([qryDet.FieldByName('CodTipRecDes').AsString,
                       qryDet.FieldByName('RecPag').AsString]),[loCaseInsensitive]) then
      dblcTipoRD.Text:=qryTipoRD.FieldByName('Descricao').AsString
   else
      dblcTipoRD.Text:='';
end;

pnd.



