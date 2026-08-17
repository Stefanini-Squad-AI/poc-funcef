// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit FProvPerdasIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TEdNum,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, UCtrlDocumento, UCtrlLancamento;

type
  TFrmProvPerdasIndiv = class(TfrmOkCancelar)
    pmlParticipante: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblParticipante: TLabel;
    lblPatrocinadora: TLabel;
    lblMatricula: TLabel;
    lblPlano: TLabel;
    lblSituacao: TLabel;
    lblInscricao: TLabel;
    stxtProcesso: TStaticText;
    Panel7: TPanel;
    bbtnProcurar: TBitBtn;
    pgctrlCobrancas: TPageControl;
    tbsGrid: TTabSheet;
    dbgrdContribuicao: TwwDBGrid;
    tbsResult: TTabSheet;
    memResult: TMemo;
    Panel5: TPanel;
    bbtnSalvar: TBitBtn;
    MontaSelectPart: TMontaSelect;
    updContribuicao: TUpdateSQL;
    qryContribuicao: TwwQuery;
    qryContribuicaoFLGSELECIONADO: TFloatField;
    qryContribuicaoDEVOLUCAO: TStringField;
    qryContribuicaoMESREFERENCIA: TStringField;
    qryContribuicaoMESCOBRANCA: TStringField;
    qryContribuicaoPARCELA: TFloatField;
    qryContribuicaoDATAPREVISAORECE: TDateTimeField;
    qryContribuicaoDATARECEBIMENTO: TDateTimeField;
    qryContribuicaoVALORESPERADO: TFloatField;
    qryContribuicaoSOMAALTERADORES: TFloatField;
    qryContribuicaoTOTALESPERADO: TFloatField;
    qryContribuicaoVALORRECEBIDO: TFloatField;
    qryContribuicaoALTERADORESRECEB: TFloatField;
    qryContribuicaoTOTALRECEBIDO: TFloatField;
    qryContribuicaoTipoPgmto: TStringField;
    qryContribuicaoNODOCUMENTO: TFloatField;
    qryContribuicaoNOSSONUMERO: TStringField;
    qryContribuicaoNOMERESUM: TStringField;
    qryContribuicaoNOMESITUACAO: TStringField;
    qryContribuicaoDATAEMISSCOB: TDateTimeField;
    qryContribuicaoDATACANCELAMENTO: TDateTimeField;
    qryContribuicaoNOMECONTRIB: TStringField;
    qryContribuicaoVALORBASE1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO: TFloatField;
    qryContribuicaoCODTIPDESEMBDEVOL: TStringField;
    qryContribuicaoPLACONTADEVOL: TStringField;
    qryContribuicaoCODCENTROCUSTOD: TStringField;
    qryContribuicaoCODTIPRECDES: TStringField;
    qryContribuicaoNOME: TStringField;
    qryContribuicaoSITRECEBIMENTO: TStringField;
    qryContribuicaoIDLOTE: TFloatField;
    qryContribuicaoNUMRECEBIMENTO: TFloatField;
    qryContribuicaoIDMOTIVO: TFloatField;
    qryContribuicaoCODPORTFORMA: TFloatField;
    qryContribuicaoVALOROP1: TFloatField;
    qryContribuicaoVALOROP2: TFloatField;
    qryContribuicaoVALOROP3: TFloatField;
    qryContribuicaoCODDOCUMENTOPREV: TFloatField;
    qryContribuicaoVALORCALCULADO: TFloatField;
    qryContribuicaoFLGDESCFOLHA: TFloatField;
    qryContribuicaoIDCONTRIBUICAO: TFloatField;
    qryContribuicaoIDPESSJUR: TFloatField;
    qryContribuicaoIDPLANOPREV: TFloatField;
    qryContribuicaoIDPESSOA: TFloatField;
    qryContribuicaoSEQPROPOSTA: TFloatField;
    qryContribuicaoDATAINICIO: TDateTimeField;
    qryContribuicaoDATAFINAL: TDateTimeField;
    qryContribuicaoFLGSITFUNDACAO: TStringField;
    qryContribuicaoFLGEVENTO: TFloatField;
    qryContribuicaoFLGCALCRESERVA: TFloatField;
    qryContribuicaoMATRICULA: TStringField;
    qryContribuicaoFLGPAGADOR: TStringField;
    qryContribuicaoINSCRICAONUMERO: TFloatField;
    qryContribuicaoFLGDESCFOLHA_1: TFloatField;
    qryContribuicaoDIAVENCIMENTO: TFloatField;
    qryContribuicaoPLANO: TFloatField;
    qryContribuicaoPLACONTAC: TStringField;
    qryContribuicaoPLACONTAD: TStringField;
    qryContribuicaoSALMANTIDO: TFloatField;
    qryContribuicaoDATAINICIO_1: TDateTimeField;
    qryContribuicaoIDEMPRESA: TFloatField;
    r: TFloatField;
    qryContribuicaoTIPCODIGO: TStringField;
    qryContribuicaoCODTIPDOC: TFloatField;
    qryContribuicaoPLANO13: TFloatField;
    qryContribuicaoPLACONTAC13: TStringField;
    qryContribuicaoPLACONTAD13: TStringField;
    qryContribuicaoCODCENTROCUSTOC13: TStringField;
    qryContribuicaoIDEMPRESA13: TFloatField;
    qryContribuicaoCODCENTROCUSTOD13: TStringField;
    qryContribuicaoUNIDNEGOC13: TFloatField;
    qryContribuicaoIDEMPRESAPROP13: TFloatField;
    qryContribuicaoCODCENTRORESPON13: TStringField;
    qryContribuicaoCODSUBCONTA13: TFloatField;
    qryContribuicaoRECPAG13: TStringField;
    qryContribuicaoCODTIPRECDES13: TStringField;
    qryContribuicaoTIPCODIGO13: TStringField;
    qryContribuicaoCODTIPDOC13: TFloatField;
    qryContribuicaoCODPORTFORMA13: TFloatField;
    qryContribuicaoIDPLANPREVCONTAB: TFloatField;
    qryContribuicaoPLACONTADBANCO: TStringField;
    qryContribuicaoPLACONTADBANCO13: TStringField;
    qryContribuicaoSALMANTIDO_1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO_1: TFloatField;
    qryContribuicaoDATAINICIO_2: TDateTimeField;
    qryContribuicaoIDREGRACALCULO: TFloatField;
    qryContribuicaoFLGINTERNO: TStringField;
    qryContribuicaoCODCENTROCUSTOC: TStringField;
    qryContribuicaoCODSUBCONTA: TFloatField;
    qryContribuicaoCODCENTRORESPON: TStringField;
    qryContribuicaoUNIDNEGOC: TFloatField;
    qryContribuicaoCODCCUSTODEVOL: TStringField;
    qryContribuicaoIDPESSJURCEDIDO: TFloatField;
    qryContribuicaoNOMEPLANO: TStringField;
    dsContribuicao: TwwDataSource;
    qryTitular: TwwQuery;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    bbtnDesfaz: TBitBtn;
    BitBtn1: TBitBtn;
    qryContribuicaoPERCINADIPLENTE: TFloatField;
    qryContribuicaoPLNCODIGO: TFloatField;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
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
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryContabilPLACONTADEBITO: TStringField;
    qryContribuicaoRECPAGDOC: TStringField;
    updContabil: TUpdateSQL;
    qryContribuicaoIDTITULAR: TFloatField;
    qryProvPerds: TwwQuery;
    updQryProvPerds: TUpdateSQL;
    qryProvPerdsPERCENTUAL: TFloatField;
    qryProvPerdsVALORPROV: TFloatField;
    qryProvPerdsDIASATRASO: TFloatField;
    qryProvPerdsESTAINADIPLENTE: TFloatField;
    qryContribuicaoPERCENTUAL: TFloatField;
    qryContribuicaoVALORPROV: TFloatField;
    qryContribuicaoDIASATRASO: TFloatField;
    qryContribuicaoESTAINADIPLENTE: TFloatField;
    SaveDlg: TSaveDialog;
    qryContribuicaoDATAPRIMEIRAINADIMPLENCIA: TDateTimeField;
    qryContribuicaoFLGPROVISIONADO: TFloatField;
    qryContribuicaoDESCPROVISIONADO: TStringField;
    qryProvContribEnviadas: TwwQuery;
    qryProvContribEnviadasSITRECEBIMENTO: TStringField;
    qryProvContribEnviadasNUMRECEBIMENTO: TFloatField;
    qryProvContribEnviadasMATRICULA: TStringField;
    qryProvContribEnviadasPERCENTUAL: TFloatField;
    qryProvContribEnviadasVALORPROV: TFloatField;
    qryProvContribEnviadasDIASATRASO: TFloatField;
    qryProvContribEnviadasESTAINADIPLENTE: TFloatField;
    qryProvContribEnviadasTOTALESPERADO: TFloatField;
    qryProvContribEnviadasIDTITULAR: TFloatField;
    qryProvContribEnviadasIDPESSOA: TFloatField;
    qryProvContribEnviadasIDPESSJUR: TFloatField;
    qryProvContribEnviadasIDCONTRIBUICAO: TFloatField;
    qryProvContribEnviadasIDPLANOPREV: TFloatField;
    qryProvContribEnviadasIDPLANPREVCONTAB: TFloatField;
    qryProvContribEnviadasNUMRECEBIMENTO_1: TFloatField;
    qryProvContribEnviadasCODCENTROCUSTOD: TStringField;
    qryProvContribEnviadasRECPAGDOC: TStringField;
    qryProvContribEnviadasINSCRICAONUMERO: TFloatField;
    qryProvContribEnviadasMESREFERENCIA: TStringField;
    qryProvContribEnviadasMESCOBRANCA: TStringField;
    qryProvContribEnviadasDATAPREVISAORECE: TDateTimeField;
    qryProvContribEnviadasDATAPRIMEIRAINADIMPLENCIA: TDateTimeField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgrdContribuicaoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnDesfazClick(Sender: TObject);
    procedure dbgrdContribuicaoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdContribuicaoFieldChanged(Sender: TObject;
      Field: TField);
    procedure bbtnSalvarClick(Sender: TObject);
  private
    CtrlDocumento  : TCtrlDocumento;
    CtrlLancamento : TCtrlLancamento;
    sOrdemFiltro        : string;
    qtdSelecionados : Integer;

    procedure LimpaTela;
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure AbreQryContribuicao( psOrdem : string );
    procedure AddLstMatriculaLog(msg : String; lstMatriculas : TStringList);
    procedure ProcessaTodosSelecionados(reverteProvisao : Boolean);
    procedure AbreQryContabilVazia;
    procedure IncluiCampoProvQryContribuicao;
    procedure AbreQryProvContribEnviadas(pIdPessoa, pIdPessJur: Integer);
    function ProcessaQryIndiceAtual(pQry: TWWQuery;
      reverteProvisao: Boolean; var sMsgErro: String): Boolean;
  public
    { Public declarations }
  end;

var
  FrmProvPerdasIndiv: TFrmProvPerdasIndiv;

implementation

uses fAguarde, UContribuicaoPrev, DBaseDados, USistema, UMensErro;

{$R *.DFM}

procedure TFrmProvPerdasIndiv.bbtnProcurarClick(Sender: TObject);
var lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta : longint;
begin
  inherited;

  MontaSelectPart.Executar;

  pgctrlCobrancas.ActivePage := tbsGrid;
  tbsResult.TabVisible  := False;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     lIdPessoa    := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdPessJur   := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta := StrToInt(MontaSelectPart.ValoresChave[16]);
     lblParticipante.Caption        := MontaSelectPart.ValoresChave[3];
     lblMatricula.Caption   := MontaSelectPart.ValoresChave[4];
     lblPatrocinadora.Caption       := MontaSelectPart.ValoresChave[5];
     lblPlano.Caption       := MontaSelectPart.ValoresChave[6];
     lblSituacao.Caption := MontaSelectPart.ValoresChave[8];
     lblInscricao.Caption  := MontaSelectPart.ValoresChave[12];
     PreencheDadosTitular(lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta);
  end
  else begin
     lIdPessoa := -1;
     lIdPessJur := -1;
     lIdPlanoPrev := -1;
     liSeqProposta := -2;
     LimpaTela;
  end;
end;


procedure TFrmProvPerdasIndiv.FormCreate(Sender: TObject);
begin
  inherited;
   try
      CtrlDocumento  := TCtrlDocumento.Create;
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );

   except
      MsgDlg('Erro ao criar Controle de Lancamentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;
end;

procedure TFrmProvPerdasIndiv.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  LimpaTela;
  Toolbar971.DockPos := width
                        - tb97OkCancelar.width
                        - tb97Fundo.width
                        -10;
  sOrdemFiltro := 'DESC';
end;

procedure TFrmProvPerdasIndiv.LimpaTela;
begin
   qryContribuicao.Close; 
   pgctrlCobrancas.ActivePage := tbsGrid;
   tbsResult.TabVisible       := False;
   lblParticipante.Caption    := '';
   lblMatricula.Caption       := '';
   lblPatrocinadora.Caption   := '';
   lblPlano.Caption           := '';
   lblSituacao.Caption        := '';
   lblInscricao.Caption       := '';
   bbtnDesfaz.Enabled         := False;
   bbtnConfirmar.Enabled      := False;
   tbsResult.Visible := False;
   memResult.Clear;
end;

procedure TFrmProvPerdasIndiv.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var sValorReserva,
    sMsgErro      : string;
    bOk           : boolean;
    bAlgumAviso   : boolean;
    dValorPago    : Double;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value   := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value   := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;


  frmAguarde.Mostra('Buscando Histórico de Contribuições ...');
  AbreQryContribuicao('');
  AbreQryProvContribEnviadas(piIdTitular, piIdPessJur);
  qryContribuicao.DisableControls;

  
  qryContribuicao.First;
  qryContribuicao.EnableControls;
  frmAguarde.Apaga;


  qryContribuicao.Open;
  qryContribuicao.First;
  qryContribuicao.EnableControls;

end; //PreencheDadosTitular

procedure TFrmProvPerdasIndiv.AbreQryContribuicao( psOrdem : string );
var
    sqlConsultIdFaixaProvPerd,
    sqlConsultSitRecebPai,
    sqlPrimeiraDataInad,
    sqlCalcTOTALESPERADO : String;

begin

  sqlPrimeiraDataInad := '' + #13#10 +
                         '--Inicio PRIMEIRA DATA DE INADIPLENCIA' + #13#10 +
                         '(SELECT MIN(DATAPREVISAORECE) FROM HSTCONTRIBPREV HSTCEMP' + #13#10 +
                         '         WHERE HSTCEMP.NUMRECEBIMENTO        =   HST.NUMRECEBIMENTOPAI' + #13#10 +
                         '               AND HSTCEMP.IDPESSJUR         = HST.IDPESSJUR' + #13#10 +
                         '               AND HSTCEMP.IDPESSOA          = HST.IDPESSOA' + #13#10 +
                         //'               AND HSTCEMP.IDTITULAR         = HST.IDTITULAR' + #13#10 +
                         '               AND HSTCEMP.IDPLANOPREV       = HST.IDPLANOPREV' + #13#10 +
                         '               AND HSTCEMP.IDPLANPREVCONTAB  = HST.IDPLANPREVCONTAB)' + #13#10 +
                         '--FIM PRIMEIRA DATA DE INADIPLENCIA' + #13#10 +
                         '';

  sqlConsultSitRecebPai := '' + #13#10 +
                           '--Inicio SITRECEBIMENTO' + #13#10 +
                           '(SELECT SITRECEBIMENTO FROM HSTCONTRIBPREV HSTCEMP2' + #13#10 +
                           '         WHERE HSTCEMP2.NUMRECEBIMENTO        =   HST.NUMRECEBIMENTOPAI' + #13#10 +
                           '               AND HSTCEMP2.IDPESSJUR         = HST.IDPESSJUR' + #13#10 +
                           '               AND HSTCEMP2.IDPESSOA          = HST.IDPESSOA' + #13#10 +
                           //'               AND HSTCEMP2.IDTITULAR         = HST.IDTITULAR' + #13#10 +
                           '               AND HSTCEMP2.IDPLANOPREV       = HST.IDPLANOPREV' + #13#10 +
                           '               AND HSTCEMP2.IDPLANPREVCONTAB  = HST.IDPLANPREVCONTAB' + #13#10 +
                           '               AND HSTCEMP2.DATAPREVISAORECE = ' + sqlPrimeiraDataInad + ')' + #13#10 +
                           '--FIM SITRECEBIMENTO' + #13#10 +
                           '';

  sqlCalcTOTALESPERADO := '(ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0))))';

  // CPREV_001
  if not(qryTitular.Active) then Exit;

   qryContribuicao.DisableControls;
   with qryContribuicao do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT 0.00 AS FLGSELECIONADO,                                                         ');
      SQL.Add('        D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                      ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', '''') AS DEVOLUCAO, '         );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTRORESPON,               ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV) AS IDPLANPREVCONTAB, ');
      SQL.Add('        CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para cobrança'', ');
      SQL.Add('                                                                ''1'', ''Enviada e não recebida'',    ');
      SQL.Add('                                                                ''2'', ''Recebida corretamente'',     ');
      SQL.Add('                                                                ''3'', ''Recebida com divergência(NT)'', ');
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''5'', ''Divergência paga'',             ');
      SQL.Add('                                                                ''6'', ''Divergência enviada e não recebida'', ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Cobrada na Folha de Benefício''),     ');
      SQL.Add('                                    DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para devolução'',         ');
      SQL.Add('                                                                ''1'', ''Enviada e não efetivamente paga'',    ');
      SQL.Add('                                                                ''2'', ''Paga corretamente'',                  ');
      SQL.Add('                                                                ''3'', ''Paga com divergência(NT)'',           ');
      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Paga na Folha de Benefício'')) AS NOMESITUACAO, ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO,                                                  ');


      // Daniel Begnami SOL:104817

//    SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,                                                                                    ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0)),                       ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',HA.VALOR,''D'',-HA.VALOR,0))) AS SOMAALTERADORES,   ');

      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add(' SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)) AS SOMAALTERADORES,');


      SQL.Add('      DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)),               ');
      SQL.Add('                          SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR,0),''D'',NVL(-HA.VALOR,0),0)))AS SOMAALTERADORES,  ');


//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), -NVL(HST.VALORESPERADO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0))) AS TOTALESPERADO,                         ');

      //SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+                         ');
      //SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)))AS TOTALESPERADO,            ');
      SQL.Add('              ' + sqlCalcTOTALESPERADO + ' AS TOTALESPERADO,            ');


//    SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0)) AS ALTERADORESRECEB,             ');

      SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0)), ');
      SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO,0),''D'',NVL(-HA.VALORRECEBIDO,0),0))  ');
      SQL.Add('        )AS ALTERADORESRECEB,                                                                                                 ');



//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0), -NVL(HST.VALORRECEBIDO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0))) AS  TOTALRECEBIDO,        ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO, 0,NVL(HST.VALORRECEBIDO,0), NVL(-HST.VALORRECEBIDO,0) )+                         ');
      SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0))) AS  TOTALRECEBIDO,    ');

      // FIM SOL:104817

      SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, ');

      SQL.Add('        D.RECPAG RECPAGDOC,     ');
      SQL.Add('        (SELECT DECODE(HST.IDPLANPREVCONTAB,2,''REG/REPLAN'',74,''NOVO PLANO'',PN.NOME) AS NOME from PLANPREVCONTABIL PN WHERE ( HST.IDPLANPREVCONTAB = PN.IDPLANOPREV)) as NOMEPLANO, HST.valorbase1,  ');  //higor Nayde SOL162126*RE01
      SQL.Add('        L.PLNCODIGO, 0 AS PERCINADIPLENTE, HST.IDTITULAR,                                                                  ');

      SQL.Add('        FAIXPROV.PERCENTUAL, ');
      SQL.Add('        CASE ');
      SQL.Add('        WHEN FAIXPROV.PERCENTUAL <> 0 THEN ');
      //SQL.Add('           (HST.VALORESPERADO / 100) * FAIXPROV.PERCENTUAL ');
      SQL.Add('           (' + sqlCalcTOTALESPERADO + ' / 100) * FAIXPROV.PERCENTUAL ');
      SQL.Add('        ELSE ');
      SQL.Add('           0 ');
      SQL.Add('        END AS VALORPROV, ');
      SQL.Add('        (TRUNC(SYSDATE) - ' + sqlPrimeiraDataInad + ') AS DIASATRASO, ');
      SQL.Add('        1 ESTAINADIPLENTE, ');
      SQL.Add('        ' + sqlPrimeiraDataInad + ' AS DATAPRIMEIRAINADIMPLENCIA, ');
      SQL.Add('        0 AS FLGPROVISIONADO,');
      SQL.Add('        ''                '' AS DESCPROVISIONADO ');
      SQL.Add(' FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP,                             ');
      SQL.Add('        ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP CPP,                         ');
      SQL.Add('        HSTCONTRIBPREV HST,   DOCUMENTO D, HSTATRASOCONTRIB HA, TIPOALTERADOR TA,             ');
      SQL.Add('        LANCTODOCUM L, FAIXASPROVISAOPERDACONTRIB FAIXPROV                                                                        ');



      SQL.Add(' WHERE  (HST.IDPESSOA    = '+qryTitular.FieldByName('IdPessoa').AsString+' )                  ');
      SQL.Add(' AND    (HST.IDPESSJUR   = '+qryTitular.FieldByName('IdPessJur').AsString+' )                 ');
      SQL.Add(' AND    (HST.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' )               ');
      SQL.Add(' AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )                                           ');
      SQL.Add(' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                                               ');
      SQL.Add(' AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (CPP.IDPESSOA       = HST.IDPESSOA)                                                   ');
      SQL.Add(' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (PP.IDPESSOA        = CPP.IDPESSOA)                                                   ');
      SQL.Add(' AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (PT.IDPESSOA        = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (EL.IDPESSOA        = PP.IDPESSOA)                                                    ');
      SQL.Add(' AND    (EL.IDPESSJUR       = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                              ');
      SQL.Add(' AND    (PP.IDSITPART       = SP.IDSITPART)                                                   ');
      SQL.Add(' AND    (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)                                           ');
      SQL.Add(' AND    (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA)                                              ');
      SQL.Add(' AND    (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (HA.IDMOTIVO(+)       = HST.IDMOTIVO)                                                 ');
      SQL.Add(' AND    (HA.CODALTERADOR      = TA.CODALTERADOR(+))                                           ');

      SQL.Add(' AND    (HST.MESCOBRANCA    <>  HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (L.CODDOCUMENTO(+) = D.NODOCUMENTO)                                                   ');
      SQL.Add(' AND    (L.OPERACAO IS NULL OR L.OPERACAO = 2)                                                ');

      //comentado para dar o replace no AbreQryPrimeiraDataInad
      //SQL.Add(' --AND (FAIXPROV.IDFAIXASPROVISAOPERDACONTRIB = () ');
      sqlConsultIdFaixaProvPerd := ConstroiSQLProvPerdas(sqlCalcTOTALESPERADO,//'HST.VALORESPERADO',
                                                         '(TRUNC(SYSDATE) - ' + sqlPrimeiraDataInad + ')',
                                                         'HST.IDPLANOPREV',
                                                         'HST.IDCONTRIBUICAO',
                                                         'HST.MESREFERENCIA',
                                                         'HST.MESCOBRANCA',
                                                         true);
      SQL.Add(' AND (FAIXPROV.IDFAIXASPROVISAOPERDACONTRIB = (' + sqlConsultIdFaixaProvPerd + ')) ');
      SQL.Add(' AND (HST.SITRECEBIMENTO IN (0, 1)) ');
      SQL.Add(' AND (4 = (' + sqlConsultSitRecebPai + ')) '); //SITRECEBIMENTO DO PAI COMO ATRASADO E JÁ TRATADO

      SQl.Add('GROUP BY D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                     ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', ''''), '                      );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        CP.CODSUBCONTA ,        CP.CODCENTRORESPON,                                     ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        HST.CODPORTFORMA,     CPP.CODPORTFORMA,                                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        HST.FLGDEVOLUCAO,     HST.SITRECEBIMENTO,                                       ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR),    ');
      SQL.Add('        D.RECPAG,HST.valorbase1 ,HST.IDPLANPREVCONTAB, L.PLNCODIGO, HST.IDTITULAR,      '); //Higor Nayde 162126*RE01 KINTANA 792563
      SQL.Add('        FAIXPROV.PERCENTUAL, HST.NUMRECEBIMENTOPAI');

      if Trim(psOrdem) = ''
      then SQL.Add(' ORDER BY  HST.MESREFERENCIA DESC                                                         ')
      else SQL.Add(psOrdem);

      Open;
   end;
   qryContribuicao.EnableControls;

   if qryContribuicao.RecordCount > 0 then
         dbgrdContribuicao.DataSource := dsContribuicao
   else
         dbgrdContribuicao.DataSource := Nil;


   qtdSelecionados := 0;

   IncluiCampoProvQryContribuicao;

   bbtnConfirmar.Enabled := false;
end;

procedure TFrmProvPerdasIndiv.AbreQryProvContribEnviadas(pIdPessoa, pIdPessJur : Integer);
begin
       qryProvContribEnviadas.Close;
       qryProvContribEnviadas.ParamByName('IDPESSOA').AsInteger := pIdPessoa;
       qryProvContribEnviadas.ParamByName('IDPESSJUR').AsInteger := pIdPessJur;
       qryProvContribEnviadas.Open;

       if qryProvContribEnviadas.RecordCount > 0 then
            bbtnDesfaz.Enabled := True
       else
            bbtnDesfaz.Enabled := False;
end;

procedure TFrmProvPerdasIndiv.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmProvPerdasIndiv.dbgrdContribuicaoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (not qryContribuicao.Active) or (qryContribuicao.IsEmpty)
  then Exit;

  if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 1 then
    AFont.Color := clNavy        // azul = enviado e nao recebido
  else if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 2 then
    AFont.Color := clTeal        // verde = recebido corretamente
  else if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 3 then
    AFont.Color := clRed         // vermelho = recebido com divergencia
  else
    AFont.Color := clWindowText  // preto = outras situacoes
end;



procedure TFrmProvPerdasIndiv.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If qtdSelecionados < 1 then
  begin
       MsgDlg('É necessário selecionar uma contribuição para registrar/desfazer a provisão para perdas.', Sistema.NomeModulo, mtWarning, [mbOk], 0);
       Exit;
  end;

  if MsgDlg('Deseja registrar a provisão para perdas?',
            'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
       ProcessaTodosSelecionados(false);
  end;

  AbreQryContribuicao('');
end;

procedure TFrmProvPerdasIndiv.AddLstMatriculaLog(msg : String; lstMatriculas : TStringList);
var
    i : Integer;
begin
       if lstMatriculas.Count > 0 then
       begin
               memResult.Lines.Add(msg);

               for i := 0 to lstMatriculas.Count - 1 do
                     memResult.Lines.Add(lstMatriculas[i]);
       end;
end;

procedure TFrmProvPerdasIndiv.ProcessaTodosSelecionados(reverteProvisao : Boolean);
var
    operacaoOk : Boolean;
    lstMatriculasOk : TStringList;
    lstMatriculasErr : TStringList;
    sMsgErro : String;
begin

       memResult.Clear;

       lstMatriculasOk := TStringList.Create;
       lstMatriculasErr := TStringList.Create;

       qryContribuicao.DisableControls;
       qryContribuicao.Filtered := False;

       qryContribuicao.Filter := 'FLGSELECIONADO = 1';

       qryContribuicao.Filtered := true;

       operacaoOk := True;
       qryContribuicao.First;
       while Not qryContribuicao.Eof do
       begin
              operacaoOk := True;
              
              if Not ProcessaQryIndiceAtual(qryContribuicao, reverteProvisao, sMsgErro) then
                  operacaoOk := False;


              if operacaoOk then
              begin
                  lstMatriculasOk.Clear;
                  lstMatriculasOk.Add(qryContribuicaoMATRICULA.AsString);
              end else
                  lstMatriculasErr.Add(qryContribuicaoMATRICULA.AsString + ' - ' + sMsgErro);

              qryContribuicao.Next;
       end;

       If reverteProvisao then
       while Not qryProvContribEnviadas.Eof do
       begin
              operacaoOk := True;
              
              if Not ProcessaQryIndiceAtual(qryProvContribEnviadas, reverteProvisao, sMsgErro) then
                  operacaoOk := False;


              if operacaoOk then
              begin
                  lstMatriculasOk.Clear;
                  lstMatriculasOk.Add(qryProvContribEnviadasMATRICULA.AsString);
              end else
                  lstMatriculasErr.Add(qryProvContribEnviadasMATRICULA.AsString + ' - ' + sMsgErro);

              qryProvContribEnviadas.Next;
       end;

       qryContribuicao.Filtered := False;
       qryContribuicao.EnableControls;

       AddLstMatriculaLog('Matriculas com processamento efetuado com sucesso:', lstMatriculasOk);
       if lstMatriculasOk.Count > 0 then memResult.Lines.Add('');
       AddLstMatriculaLog('Matriculas que não tiveram o processamento efetuado com sucesso:', lstMatriculasErr);

       tbsResult.TabVisible       := True;
       pgctrlCobrancas.ActivePage := tbsResult;

       if operacaoOk then
           MsgDlg('Processo finalizado com sucesso. ','Confirmação',mtInformation,[mbOK],0)
       else
           MsgDlg('Processo finalizado com erros. Verifique a aba Resultados. ','Confirmação',mtInformation,[mbOK],0);

      lstMatriculasOk.Free;
      lstMatriculasErr.Free;

end;

function TFrmProvPerdasIndiv.ProcessaQryIndiceAtual(pQry : TWWQuery;
                                                    reverteProvisao : Boolean;
                                                    var sMsgErro : String) : Boolean;
var
    vPlnCodigo : Integer;
begin

     Result := True;
     try
           AbreQryContabilVazia;

           vPlnCodigo := -1;

           if Not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

           qryProvPerds.Close;
           qryProvPerds.Open;     
           qryProvPerds.Edit;
           qryProvPerdsPERCENTUAL.AsFloat        := pQry.FieldByName('PERCENTUAL').AsFloat;
           qryProvPerdsVALORPROV.AsFloat         := pQry.FieldByName('VALORPROV').AsFloat;
           qryProvPerdsDIASATRASO.AsInteger      := pQry.FieldByName('DIASATRASO').AsInteger;
           qryProvPerdsESTAINADIPLENTE.AsInteger := pQry.FieldByName('ESTAINADIPLENTE').AsInteger;
           qryProvPerds.Post;


           if Not IncluiContabilidadeProvPerdas(qryContabil,
                                                qryProvPerds,
                                                CtrlLancamento,
                                                reverteProvisao,
                                                pQry.FieldByName('TOTALESPERADO').AsFloat,//pQry.FieldByName('ValorEsperado').AsFloat,
                                                pQry.FieldByName('IDTITULAR').AsInteger,
                                                pQry.FieldByName('IDPESSOA').AsInteger,
                                                pQry.FieldByName('IDPESSJUR').AsInteger,
                                                pQry.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                pQry.FieldByName('IDPLANOPREV').AsInteger,
                                                pQry.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                                pQry.FieldByName('NUMRECEBIMENTO').AsInteger,
                                                pQry.FieldByName('CODCENTROCUSTOD').AsString,
                                                pQry.FieldByName('RECPAGDOC').AsString,
                                                pQry.FieldByName('INSCRICAONUMERO').AsString,
                                                pQry.FieldByName('MESREFERENCIA').AsString,
                                                pQry.FieldByName('MESCOBRANCA').AsString,
                                                pQry.FieldByName('DATAPREVISAORECE').AsString,
                                                pQry.FieldByName('DataPrevisaoRece').AsString,
                                                pQry.FieldByName('DATAPRIMEIRAINADIMPLENCIA').AsString,
                                                vPlnCodigo,
                                                sMsgErro) then
                    Raise Exception.Create(sMsgErro);


           if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;

           qryContabil.Close;
      except
           on E : Exception do
           begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.RollBack;

              qryContabil.Close;
              //memResult.Lines.Add(E.Message);
              sMsgErro := E.Message;
              Result := False;
           end;
      end;
end;


procedure TFrmProvPerdasIndiv.AbreQryContabilVazia;
begin
       qryContabil.Close;
       qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
       qryContabil.Prepare;
       qryContabil.Open;
end;

procedure TFrmProvPerdasIndiv.bbtnDesfazClick(Sender: TObject);
begin
  inherited;

//  If qtdSelecionados < 1 then
//  begin
//       MsgDlg('É necessário selecionar uma contribuição para registrar/desfazer a provisão para perdas.', Sistema.NomeModulo, mtWarning, [mbOk], 0);
//       Exit;
//  end;

  if MsgDlg('Deseja desfazer a provisão para perdas?',
            'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then begin
       ProcessaTodosSelecionados(true);
  end;

  AbreQryContribuicao('');     
end;

procedure TFrmProvPerdasIndiv.dbgrdContribuicaoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
    iFlgSelecionado : word;
begin
  inherited;
  if AFieldName = 'FLGSELECIONADO'
  then begin
     qryContribuicao.DisableControls;
     qryContribuicao.First;
     iFlgSelecionado := 0;
     while not qryContribuicao.Eof do
     begin
        if qryContribuicao.FieldByName('FLGSELECIONADO').AsInteger = 0
        then iFlgSelecionado := 1;
        qryContribuicao.Edit;
        qryContribuicao.FieldByName('FLGSELECIONADO').AsInteger := iFlgSelecionado;
        qryContribuicao.Post;
        qryContribuicao.Next;
     end;
     qryContribuicao.First;
     qryContribuicao.EnableControls;
     dbgrdContribuicaoFieldChanged(Nil, Nil);
  end
  else begin
     if sOrdemFiltro = ''
     then sOrdemFiltro := 'DESC'
     else sOrdemFiltro := '';
     AbreQryContribuicao(' ORDER BY '+AFieldName+' '+sOrdemFiltro);
  end;
end;

procedure TFrmProvPerdasIndiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryContribuicao.Close;
  qryContribuicao.Close;
  qryProvPerds.Close;
  qryContribuicao.Close;
end;

procedure TFrmProvPerdasIndiv.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
end;

procedure TFrmProvPerdasIndiv.dbgrdContribuicaoFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if qryContribuicaoFLGSELECIONADO.AsInteger = 1 then
        Inc(qtdSelecionados)
  else
        qtdSelecionados := qtdSelecionados - 1;

  if qtdSelecionados > 0 then
  begin
        bbtnDesfaz.Enabled := True;
        bbtnConfirmar.Enabled := True;
  end else
  begin
        bbtnConfirmar.Enabled := False;

        if qryProvContribEnviadas.RecordCount <= 0 then
            bbtnDesfaz.Enabled := False;
  end;
end;

procedure TFrmProvPerdasIndiv.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TFrmProvPerdasIndiv.IncluiCampoProvQryContribuicao;
begin
       qryContribuicao.DisableControls;
       qryContribuicao.First;

       while not qryContribuicao.Eof do
       begin
             qryContribuicao.Edit;
             if VerificaContribFoiProvisionada(qryContribuicao.FieldByName('IDPESSJUR').AsInteger,
                                               qryContribuicao.FieldByName('IDPLANOPREV').AsInteger,
                                               qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                               qryContribuicao.FieldByName('IDCONTRIBUICAO').AsInteger,
                                               qryContribuicao.FieldByName('IDTITULAR').AsInteger,
                                               qryContribuicao.FieldByName('IDPESSOA').AsInteger,
                                               qryContribuicao.FieldByName('MESCOBRANCA').AsString,
                                               qryContribuicao.FieldByName('MESREFERENCIA').AsString)
             then begin
                        qryContribuicaoFLGPROVISIONADO.AsInteger := 1;
                        qryContribuicaoDESCPROVISIONADO.AsString := 'Provisionado';
             end else
             begin
                        qryContribuicaoFLGPROVISIONADO.AsInteger := 0;
                        qryContribuicaoDESCPROVISIONADO.AsString := 'Não Provisionado';
             end;
             qryContribuicao.Post;

             qryContribuicao.Next;
       end;

       qryContribuicao.EnableControls;
end;

end.

