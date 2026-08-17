{-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172601/14640
Nº KINTANA..: 2019131
Data........: 11/10/2013
Responsável.: Felipe A. Santos
Descrição...: Foi criado os campos PathETLProducao e PathETLHOM para cadastrar
              o caminho do ETL.
--------------------------------------------------------------------------------
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
SOL/KINTANA : 163982/7003 - 1489901
Descrição   : Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
-------------------------------------------------------------------------------}

// Ádler Souza  : 68517 / 22/04/09
// Observação   : Alteração nos parametros da função ListaCentRespon, que alimenta o
//                CdsCentroRespons, para linstar apenas ativos.

unit fCadParamMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PARÂMETROS DE ALIENAÇÃO  ( MT )
//
//      Módulo          :  Alienação
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  26/08/2002
//      Data de Término :  26/08/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, DBCtrls, ComCtrls, uCtrlParamAlienacao, uCtrlTipoCustoRecImov,
  Provider, DBTables, uCtrlCentRespon, uCtrlUnidNegocio, uCtrlCentroCusto,
  uCtrlPrograma, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, mRegraDB,
  uCmSqlParams, uModuloImobiliario, uCtrlTipoAlterador;

type
  TfrmCadParamMT = class(TfrmCadastroMtImob)
    pcParam: TPageControl;
    tsGeral: TTabSheet;
    PnlGeral: TPanel;
    dbchkNumProp: TDBCheckBox;
    dbchkIntegraCAF: TDBCheckBox;
    tsOper: TTabSheet;
    pnlOper: TPanel;
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    CdsIDPESSOA: TFloatField;
    CdsUNIDNEGOC: TFloatField;
    CdsCODCENTRORESPON: TStringField;
    CdsFLGNUMPROPOSTA: TStringField;
    CdsFLGDIARIO: TStringField;
    CdsFLGINTEGRAATIVO: TStringField;
    CdsIDRECAVISTA: TFloatField;
    CdsIDRECAMORTIZACAO: TFloatField;
    CdsIDRECCORRECAO: TFloatField;
    CdsIDRECAMORTEXTRA: TFloatField;
    CdsIDRECSINAL: TFloatField;
    CdsIDRECJUROS: TFloatField;
    CdsIDRECPROJECAO: TFloatField;
    CdsIDRECPERDAS: TFloatField;
    tsPadrao: TTabSheet;
    CdsCentroRespons: TCMClientDataSet;
    CdsCentroResponsCODCENTRORESPON: TStringField;
    CdsCentroResponsNOME: TStringField;
    CdsAtividadeProj: TCMClientDataSet;
    CdsAtividadeProjUNIDNEGOC: TFloatField;
    CdsAtividadeProjNOME: TStringField;
    CdsFLGPARIM: TStringField;
    CdsFLGPARCON: TStringField;
    CdsFLGPARTPIM: TStringField;
    CdsFLGPARTPDES: TStringField;
    CdsFLGPARTDIM: TStringField;
    CdsFLGPARTDCON: TStringField;
    CdsFLGPARTDTPIM: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    CdsFLGINTEGRACONTAB: TStringField;
    CdsFLGINTEGRACAPCAR: TStringField;
    pnlDiario: TPanel;
    Label1: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    dbchkDiario: TDBCheckBox;
    CdsMESCOMPETENCIA: TFloatField;
    CdsANOCOMPETENCIA: TFloatField;
    pnlPadrao: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboUnidNegocios: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    dbcboCentroCusto: TwwDBLookupCombo;
    Label13: TLabel;
    dbcboPrograma: TwwDBLookupCombo;
    Label14: TLabel;
    cdsCentroCusto: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    CdsIDPROGRAMA: TFloatField;
    CdsCODCENTROCUSTO: TStringField;
    CdsIDEMPRESA: TFloatField;
    cdsCentroCustoCODCENTROCUSTO: TStringField;
    cdsCentroCustoIDEMPRESA: TFloatField;
    cdsCentroCustoNOME: TStringField;
    cdsCentroCustoCODREDUZIDO: TStringField;
    cdsProgramaIDPROGRAMA: TFloatField;
    cdsProgramaDESCPROGRAMA: TStringField;
    dbCkbLogotipo: TDBCheckBox;
    CdsFLGLOGORELAT: TStringField;
    cdsTipoOper: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    CdsIDOPERATUALCM: TFloatField;
    CdsIDOPERATUALMULTA: TFloatField;
    CdsIDOPERATUALJUROS: TFloatField;
    CdsIDOPERPROVPER: TFloatField;
    TabSheet1: TTabSheet;
    molRegra: TmolRegraDB;
    CdsTRGDTINCLUSAO: TDateTimeField;
    CdsTRGUSERINCLUSAO: TStringField;
    CdsIDREGRAMULTA: TFloatField;
    CdsNOMEREGRA: TStringField;
    cdsAux: TCMClientDataSet;
    sqlTeste: TCMSqlParams;
    CdsFLGCMJURDIARIO: TFloatField;
    CdsIDRECCORRSALDO: TFloatField;
    CdsFLGATUALDATAPROG: TFloatField;
    DBRadioGroup1: TDBRadioGroup;
    CdsIDOPERATUALRES: TFloatField;
    CdsFLGTIPODATAPROG: TStringField;
    PageControl1: TPageControl;
    tbsPagamento: TTabSheet;
    tbsOperacoDiaria: TTabSheet;
    tbsAbono: TTabSheet;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    dblcTipoAVista: TwwDBLookupCombo;
    dblcTipoAmortiz: TwwDBLookupCombo;
    dblcTipoSinal: TwwDBLookupCombo;
    dblcProjecao: TwwDBLookupCombo;
    Label15: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label17: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Label16: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label18: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    Label10: TLabel;
    wwDBLookupCombo7: TwwDBLookupCombo;
    DBCheckBox4: TDBCheckBox;
    Label19: TLabel;
    wwDBLookupCombo8: TwwDBLookupCombo;
    Label20: TLabel;
    wwDBLookupCombo9: TwwDBLookupCombo;
    Label21: TLabel;
    wwDBLookupCombo10: TwwDBLookupCombo;
    CdsIDOPERABONOMULTA: TFloatField;
    CdsIDOPERABONOJUROS: TFloatField;
    CdsIDOPERABONOCM: TFloatField;
    dblcTipoParcela: TwwDBLookupCombo;
    Label6: TLabel;
    DBCheckBox3: TDBCheckBox;
    Label7: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label8: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    wwDBLookupCombo11: TwwDBLookupCombo;
    wwDBLookupCombo12: TwwDBLookupCombo;
    wwDBLookupCombo13: TwwDBLookupCombo;
    wwDBLookupCombo14: TwwDBLookupCombo;
    CdsIDOPERATMULTAC: TFloatField;
    CdsIDOPERATJURAC: TFloatField;
    CdsIDOPERATCMAC: TFloatField;
    CdsIDOPERPROVPERAC: TFloatField;
    CdsIDRECJUROSAC: TFloatField;
    CdsIDRECCORRAC: TFloatField;
    dbrdgrpProcessoCorrecao: TDBRadioGroup;
    CdsFLGINDMESANTERIOR: TFloatField;
    gbAcordo: TGroupBox;
    wwDBLookupCombo15: TwwDBLookupCombo;
    Label26: TLabel;
    wwDBLookupCombo16: TwwDBLookupCombo;
    Label27: TLabel;
    wwDBLookupCombo17: TwwDBLookupCombo;
    Label28: TLabel;
    CdsIDRECAMORTAC: TFloatField;
    wwDBLookupCombo18: TwwDBLookupCombo;
    Label29: TLabel;
    wwDBLookupCombo19: TwwDBLookupCombo;
    Label30: TLabel;
    cdsTipoAlterador: TCMClientDataSet;
    CdsDTULTFECH: TDateTimeField;
    CdsCODALTERADORCPMF: TFloatField;
    CdsCODALTERADORADRES: TFloatField;
    CdsIDOPERABONORESN: TFloatField;
    CdsIDOPERABONORESA: TFloatField;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    wwDBLookupCombo20: TwwDBLookupCombo;
    wwDBLookupCombo21: TwwDBLookupCombo;
    Label32: TLabel;
    Label3: TLabel;
    CdsFLGAUTCOD: TStringField;
    CdsFLGVALCOD: TStringField;
    GroupBox4: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    grbPathETL: TGroupBox;
    lblPathETLProducao: TLabel;
    lblPathETLHomologacao: TLabel;
    dbedtPathETLProducao: TwwDBEdit;
    dbedtPathETLHom: TwwDBEdit;
    CdsPATHETLPRODUCAO: TStringField;
    CdsPATHETLHOM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsCalcFields(DataSet: TDataSet);
    procedure DBCheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    CtrlParamAlienacao   : TCtrlParamAlienacao;
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlCentRespon       : TCtrlCentRespon;
    CtrlUnidNegocio      : TCtrlUnidNegocio;
    CtrlCentroCusto      : TCtrlCentroCusto;
    CtrlPrograma         : TCtrlPrograma;
    CtrlTipoAlterador    : TCtrlTipoAlterador;
  public
    { Public declarations }
  end;

var
  frmCadParamMT: TfrmCadParamMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, FPrincipal;

{$R *.DFM}



procedure TfrmCadParamMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlParamAlienacao   := TCtrlParamAlienacao.Create;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlCentRespon       := TCtrlCentRespon.Create;
  CtrlUnidNegocio      := TCtrlUnidNegocio.Create;
  CtrlCentroCusto      := TCtrlCentroCusto.Create;
  CtrlPrograma         := TCtrlPrograma.Create;
  CtrlTipoAlterador    := TCtrlTipoAlterador.Create;

  CtrlParamAlienacao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);
                                
  CtrlTipoCustoRecImov.InitializeAs( CtrlParamAlienacao );
  CtrlCentRespon.InitializeAs( CtrlParamAlienacao );
  CtrlUnidNegocio.InitializeAs( CtrlParamAlienacao );
  CtrlCentroCusto.InitializeAs( CtrlParamAlienacao );
  CtrlPrograma.InitializeAs( CtrlParamAlienacao );
  CtrlTipoAlterador.InitializeAs( CtrlParamAlienacao );

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlParamAlienacao.CdsParamAlienacao := Cds;
  Cds.Data := CtrlParamAlienacao.SelecionaParamAlienacao( Sistema.IdEmpresa );

   // André Pontes - 20/07/2005
   if Cds.FieldByName('FLGCMJURDIARIO').AsInteger = 1 then
   begin
      CdsTipoCustoRecImov.Data   := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'O');
   end
   else
   begin
      CdsTipoCustoRecImov.Data   := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'R');
   end;
   // FIM André Pontes - 20/07/2005

  // Abre Lookups
  CdsTipoOper.Data         := CtrlTipoCustoRecImov.LookupTipoCustoRecImov( Sistema.IdModulo, 'O' );
  CdsCentroRespons.Data    := CtrlCentRespon.ListaCentRespon(Sistema.IdEmpresa, '', 0 , 'A' , 0, True, True); //Ádler Teodoro de Souza - 68504 22/04/09
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
  //CdsAtividadeProj.Data    := CtrlUnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa, 0, '', tapSoAnaliticaAP);
  CdsAtividadeProj.Data    := CtrlUnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa, 0, '', tapSoAnaliticaAP,toapNome, 'S');
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
  CdsCentroCusto.Data      := CtrlCentroCusto.ListaCentroCusto(Sistema.IdEmpresa, '', True);
  CdsPrograma.Data         := CtrlPrograma.ListaPrograma;
  cdsTipoAlterador.Data    := CtrlTipoAlterador.ListTipoalterador(Sistema.IDEmpresa);
    //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
  if((DBcboUnidNegocios.Text = '') and (DBcboUnidNegocios.LookupValue <> '')) then
  DBcboUnidNegocios.Text := CtrlUnidNegocio.recuperaAtividadePerd(DBcboUnidNegocios.LookupValue)
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
end;



procedure TfrmCadParamMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlParamAlienacao );
  FreeAndNil( CtrlTipoCustoRecImov );
  FreeAndNil( CtrlCentRespon );
  FreeAndNil( CtrlUnidNegocio );
  FreeAndNil( CtrlCentroCusto );
  FreeAndNil( CtrlPrograma );
  FreeAndNil( CtrlTipoAlterador );
  inherited;
end;



procedure TfrmCadParamMT.CmeCadastroEdit(Sender: TObject);
begin
  // o primeiro Edit na query será um Insert
  if cds.IsEmpty then begin
    cds.Insert;
  end else begin
    inherited;
  end;

  // Carrega parametros fixos
  cdsIDPESSOA.AsInteger  := Sistema.idEmpresa;
  CdsIDEMPRESA.AsInteger := Sistema.IdEmpresa;

  pnlGeral.Enabled  := True;
  pnlOper.Enabled   := True;
  pnlPadrao.Enabled := True;
  if pcParam.ActivePage = tsGeral  then dbchkIntegraCAF.SetFocus;
  if pcParam.ActivePage = tsPadrao then DBcboCentroRespon.SetFocus;
  if pcParam.ActivePage = tsOper   then dblcTipoAVista.SetFocus;
end;



procedure TfrmCadParamMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlParamAlienacao.GravaParamAlienacao;
  if Accept then cds.Data := CtrlParamAlienacao.SelecionaParamAlienacao( Sistema.IdEmpresa );
end;



procedure TfrmCadParamMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled  := True;
  pnlGeral.Enabled  := False;
  pnlOper.Enabled   := False;
  pnlPadrao.Enabled := False;
end;



procedure TfrmCadParamMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled  := True;
  pnlGeral.Enabled  := False;
  pnlOper.Enabled   := False;
  pnlPadrao.Enabled := False;
end;



procedure TfrmCadParamMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // só permite alteração
  sbtnInserir.Enabled  := False;
  sbtnApagar.Enabled   := False;
  sbtnProcurar.Enabled := False;
  sbtnAlterar.Enabled  := True;
end;



procedure TfrmCadParamMT.FormShow(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled   := True;
  pnlOper.Enabled    := False;
  pnlGeral.Enabled   := False;
  pnlPadrao.Enabled  := False;
  pcParam.ActivePage := TsGeral;
end;



procedure TfrmCadParamMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // chama a procedure AposLogin para atualizar as variáveis do Modulo
   ModuloImobiliario.Alienacao.GetParam( Sistema.IdEmpresa );
   inherited;
end;



procedure TfrmCadParamMT.CdsCalcFields(DataSet: TDataSet);
begin
   inherited;
   if Cds.Active then
      if not CdsIDREGRAMULTA.IsNull then
      begin
         cdsAux.Data := CtrlParamAlienacao.GetDataPacket('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA = ' + CdsIDREGRAMULTA.AsString);
         CdsNOMEREGRA.AsString    := cdsAux.FieldByName('NOMEREGRA').AsString;
      end;
end;



procedure TfrmCadParamMT.DBCheckBox3Click(Sender: TObject);
begin
   inherited;

   // André Pontes - 20/07/2005
   if Cds.FieldByName('FLGCMJURDIARIO').AsInteger = 1 then
   begin
      CdsTipoCustoRecImov.Data   := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'O');
   end
   else
   begin
      CdsTipoCustoRecImov.Data   := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'R');
   end;
   // FIM André Pontes - 20/07/2005
end;



end.
