unit FCadConcederResgCompLote;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//Rotina.....: tbButtonEnviarClick
//Nº SIG.....: WO32251
//Data       : 23/03/2026
//Responsável: LEANDRO
//Descrição..: Incluir idbeneficio ao gravar HSTPRAZOACUMULACAOFOLHA
//--------------------------------------------------------------------------------
//Rotina.....: tbButtonEnviarClick
//Nº SIG.....: WO10872
//Data       : 25/08/2023
//Responsável: Edilaine
//Descrição..: Calculo total de cotas resgatadas Plano REB Regressivo com retençao
//--------------------------------------------------------------------------------
//Rotinas....: (.dfm cb_tipo_recebedor, mk_data_pag, qrydet, qryParticipantes,
//              qryPlanos, qryPmp, qryPrazoAcumulacao) buscarequerimentos,
//Nº SIG.....: 20491
//Data       : 27/02/2018
//Responsável: Darivaldo Alencar
//Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
//             de retenção de percentual das contribuições
//--------------------------------------------------------------------------------
//Alteracao   : (.dfm)  qry_rel
//Pendência   : SIG86660
//Responsável : Edilaine
//Data        : 2352019
//Form        : qry_rel
//Descrição   : alteração no tipo de campo > memo para blob
//--------------------------------------------------------------------------------
//Pendência   : SIG71469
//Responsável : Andre Imakawa
//Data        : 10/07/2018
//Form        : qryDet
//Descrição   : Inclusao do campo DATAINICIO na query inicial.
//--------------------------------------------------------------------------------
//Pendência   : SIG50495
//Responsável : Luiz Carlos
//Data        : 27/02/2018
//Descrição   : Ajuste na query de pesquisa
//--------------------------------------------------------------------------------
//Pendência   : SOL 234143 PPM 420382
//Responsável : William Moreira da Silva
//Data        : 25/06/2014
//Descrição   : O historico de rubricas individuais estava sendo deletado
//              ao se desfazer o processo
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, QExport3, QExport3PDF,
  QuickRpt, Qrctrls, uCmSqlParams, DBClient, uCMClientDataSet, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, CmParamReport, TXComp, TXRB, uCmRptManager,
  ppModule, raCodMod, ppParameter, ppVar, ppArchiv,FileCtrl,Registry,
  uCtrlCalculoIRRF, uCtrlRequerBenef,  //Darivaldo Alencar SIG20491
  QExport3CustomSource, ppStrtch, ppSubRpt, ppMemo, wwdblook,
  CMDBLookupCombo;

const
    MSG15 = 'O valor do IR Regressivo ainda não foi calculado. Deseja prosseguir com a concessão em lote?';                                    //Darivaldo Alencar SIG20491
    MSG16 = 'O valor do IR Regressivo ainda não foi gravado nas estruturas da folha de benefícios. Deseja prosseguir com a concessão em lote?';//Darivaldo Alencar SIG20491

type
  TFrmCadConcederResgCompLote = class(TfrmCadMestreDetalheCS)
    ToolbarButton971: TToolbarButton97;
    bbtnDesfazer: TBitBtn;
    lbl_matri: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedNumProcINSS: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dtDataInicio: TCMDateTimePicker;
    dtEvento: TCMDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    bbtnOpcoes: TBitBtn;
    CMDateTimePicker2: TCMDateTimePicker;
    Label11: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label12: TLabel;
    wwDBEdit9: TwwDBEdit;
    Label13: TLabel;
    pnl_impressao: TPanel;
    rg_opcao_impressao: TRadioGroup;
    bt_imprimir: TButton;
    rd_benefreq: TRadioGroup;
    qry2: TwwQuery;
    qryaux: TwwQuery;
    qryaux2: TwwQuery;
    rg_molestia: TDBRadioGroup;
    updDet: TUpdateSQL;
    wwDBEdit10: TwwDBEdit;
    dtDataFinal: TCMDateTimePicker;
    qrySitPart: TwwQuery;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    cb_grava_indiv: TCheckBox;
    IdHTTP1: TIdHTTP;
    cb_validado: TCheckBox;
    param: TwwQuery;
    pnl1: TPanel;
    grid_log: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    db_grid_irrf: TDBRadioGroup;
    lbl_listados: TLabel;
    bbtnInverte: TBitBtn;
    bbtnSelTudo: TBitBtn;
    CrmRptCM: TCmRptManager;
    DevRptCM: TExtraOptions;
    CmpRptCM: TCmParamReport;
    CdsReciboCedidos: TCMClientDataSet;
    sqlReciboCedidos: TCMSqlParams;
    qryDETCONCINSS: TwwQuery;
    qryRubricaxInss: TwwQuery;
    qryAux3: TwwQuery;
    qryAux4: TwwQuery;
    arPreview: TppArchiveReader;
    QExport3PDF1: TQExport3PDF;
    qeCustomSource1: TqeCustomSource;
    ExtraOptions1: TExtraOptions;
    qryDetRel: TwwQuery;
    qryDetRelMATRICULA: TStringField;
    qryDet: TwwQuery;
    qryDetRelSELECIONADO: TStringField;
    qryDetRelNOME: TStringField;
    qryDetRelNUMBENEFICIO: TStringField;
    qryDetRelESPECIE: TStringField;
    qryDetRelBENEFICIO: TStringField;
    qryDetRelRMI: TFloatField;
    qryDetRelDatadoEvento: TDateTimeField;
    qryDetRelDIB: TDateTimeField;
    qryDetRelDIP: TDateTimeField;
    qryDetRelDIBANT: TDateTimeField;
    qryDetRelDATAREQUERIMENTO: TDateTimeField;
    qryDetRelMOLESTIA: TStringField;
    qryDetRelDATAINICIO: TDateTimeField;
    qryDetRelDATAFIM: TDateTimeField;
    qryDetRelBENEFREQ: TStringField;
    qryDetRelIDPESSOA: TFloatField;
    qryDetRelIDTITULAR: TFloatField;
    qryDetRelDATAMORTE: TDateTimeField;
    qryDetRelIDSITPART: TFloatField;
    qryDetRelIDSITFUNC: TFloatField;
    qryDetRelIDPESSJUR: TFloatField;
    qryDetRelIDSITPLANOPREV: TFloatField;
    qryDetRelINSCNUMERO: TFloatField;
    qryDetRelSEQPROPOSTA: TFloatField;
    qryDetRelIDPLANOPREV: TFloatField;
    qryDetRelTIPO: TStringField;
    qryDetRelIDBENEFHABILITA: TFloatField;
    qryDetRelIDBENEFICIO: TFloatField;
    qryDetReleventogerador: TFloatField;
    qryDetRelnumeroprocesso: TFloatField;
    qryDetRelISENTOIRRF: TStringField;
    qryDetRelFLGREQUERIMENTO: TFloatField;
    qryDetRelIdplanprevcontab: TFloatField;
    qrydetconcaux: TwwQuery;
    qryDetalhe: TwwQuery;
    dsDetalhe: TwwDataSource;
    ppDetalhe: TppBDEPipeline;
    UpdDetalhe: TUpdateSQL;
    ppDetalheppField6: TppField;
    qryDetalhe2: TwwQuery;
    dsDetalhe2: TwwDataSource;
    ppDetalhe2: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    qryDetalhe2mesano: TStringField;
    qryDetalhe2mesreferencia: TStringField;
    qryDetalhe2mesreembolso: TStringField;
    qryDetalhe2pagar: TFloatField;
    qryDetalhe2descontar: TFloatField;
    qryDetalhe2planocontabil: TStringField;
    qryDetalhemesano: TStringField;
    qryDetalhemesreferencia: TStringField;
    qryDetalhemesreembolso: TStringField;
    qryDetalhepagar: TFloatField;
    qryDetalhedescontar: TFloatField;
    qryDetalheplanocontabil: TStringField;
    UpdDetalhe2: TUpdateSQL;
    sbtnRequerer: TToolbarButton97;
    Label18: TLabel;
    mk_data_re: TMaskEdit;
    Label19: TLabel;
    qryDetSELECIONADO: TStringField;
    qryDetMATRICULA: TStringField;
    qryDetPLANO: TStringField;
    qryDetDATA_ULTIMO_RESGATE: TDateTimeField;
    qryDetSUBCONTA_EMPREGADO: TFloatField;
    qryDetSUBCONTA_PATROCINADOR: TFloatField;
    qryDetSALDO_CONTA_TOTAL: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    rpReciboCedidos: TppReport;
    ppDetailBand1: TppDetailBand;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    ppReciboCedidos: TppBDEPipeline;
    dsReciboCedidos: TwwDataSource;
    GroupBox2: TGroupBox;
    qryDetTIPO_OPCAO_IR: TStringField;
    cb_tipo_op: TComboBox;
    qryDetDATAFINAL: TDateTimeField;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetVALORATUAL: TFloatField;
    qryDetVALORTOTAL: TFloatField;
    qryDetIDEVENTOSPREV: TFloatField;
    qry_rel: TwwQuery;
    upd_rel: TUpdateSQL;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo1: TppDBMemo;
    qryDetDATAINICIO: TDateTimeField;
    tbButtonAlterar: TBitBtn;
    tbButtonEnviar: TBitBtn;
    QryPrazoAcumulacao: TwwQuery;
    updPrazoAcumulacao: TUpdateSQL;
    QryPMP: TwwQuery;
    UpdPmp: TUpdateSQL;
    QryPlanos: TQuery;
    dsPlanos: TDataSource;
    qryDetIDTITULAR: TFloatField;
    qryDetTIPOOPCAOIR: TFloatField;
    qryDetVLR_IRREGR: TFloatField;
    qryDetSEQRESGATE: TFloatField;
    mk_data_pag: TCMDateTimePicker;
    gbPlano: TGroupBox;
    cb_tipo_recebedor: TwwDBLookupCombo;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure RemoveDuplicates(var stringList : TStringList) ;    
    procedure buscarequerimentos(_selecao,_ordem:string);
    procedure buscarlog();
    procedure configuralog();
    Function  BuscarUltMesreaj():string;
    Function  CalculaData(Data1, Data2: string): INTEGER;
    Function  BuscarValorReajustadoPAB(_rmi:double;_numprocinss,_mesref:string):double;
    procedure tbcDetalheChange(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure gera_impressao_log;
    procedure gera_impressao_requerimento;
    procedure sbtnRequererClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure GravarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure GravarBfciarioTitPlan(_query:TwwQuery);
    procedure GravarHSTBENEFBFCIARIO(_query:TwwQuery;_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_valorcalculado,_datapagamento,_sidmovbenef,_flgincluimesconc,_mesreferencia,_mesreflote,_numproc:string);
    procedure GravarRubricaIndiv(_query:TwwQuery;_idmotivo,_mesreferencia,_seq,_mesreflote:string);


    procedure DeletarBfciarioTitPlan(_query:TwwQuery);
    procedure DeletarRubricaIndiv(_query:TwwQuery);
    procedure DeletarPrevia();
    procedure DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure DeletarProcessoBenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarHSTBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarMovbenef(_query:TwwQuery;_NUMEROPROCESSO:string);    

    procedure GravarProcessoBenef(_query:TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);
    procedure GravarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure AtualizaBenefHabilita(_query:TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
    procedure AtualizaBenefbfciario(_query:TwwQuery;_idsitbeneficio,_numproc:string);
    procedure GravarHISTMOVRESERVA();
    procedure DeletarHISTMOVRESERVA(_mesref:string);

    procedure Criar_temp();
    procedure Gravar_temp_log(_query:TwwQuery;_msgerro,_msgoracle:string);
    procedure Deletar_temp_log(_query:TwwQuery);
    procedure FormShow(Sender: TObject);
    procedure wwDBEdit10Change(Sender: TObject);
    procedure dtDataFinalChange(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);

    Function GetNumeroProcesso():string;
    procedure FormCreate(Sender: TObject);
    procedure tbButtonAlterarClick(Sender: TObject);
    procedure tbButtonEnviarClick(Sender: TObject);
    procedure cb_tipo_opChange(Sender: TObject);




  private
    wHora, wMin, wSeg, wMSeg : word;
    iFlgIncluiMesConc,iIdLoteConcessao,iIdCalculo   : integer;
    sAnoMesLoteConcessao :string;

    //Darivaldo Alencar SIG20491 -inicio
    bProcessou,
    bGravou : Boolean;
    CtrlCalculoIRRF  : TCtrlCalculoIRRF;

    procedure AtualizaValorIR(iIdPessJur, iIdPessoa, iIdPlanoPrev : integer);
    function  MsgConfirmacao(sMsg: String; sTitulo: String = 'Confirmação'): Boolean;
    procedure AjustaGrid;
    //Darivaldo Alencar SIG20491 -fim

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadConcederResgCompLote: TFrmCadConcederResgCompLote;
  FIdbenefh  : TStrings;
  RegProc:integer;
  IDPROVENTO:STRING;
//  Fmatricula_rel:TStringList;
implementation

uses
  FMostraAux,UFuncoesUteis,USistema,uCMTypes,UMensErro,ubeneficio,UDataBase,UAdmPrev,DBaseDados,FSelecionaLote,FPreview,UMovReserva;
{$R *.DFM}


function IsDate(str: string): Boolean; 
var 
  dt: TDateTime; 
begin 
  Result := True; 
  try 
    dt := StrToDate(str); 
  except
    Result := False; 
  end; 
end; 

procedure TFrmCadConcederResgCompLote.buscarequerimentos(_selecao,_ordem:string);
var
  sql:string;
begin
sql:='';
/////RN004


qry.Active:=true;

qryDet.Close;
qryDet.sql.Clear;


 {

QRYDET.SQL.ADD('SELECT '+#39+_selecao+#39+' AS SELECIONADO,');
qryDet.SQL.Add('       BH.IDBENEFHABILITA,');
qryDet.SQL.Add('       BH.NUMEROPROCESSO,');
qryDet.SQL.Add('       BH.EVENTOGERADOR,');
qryDet.SQL.Add('       BH.FLGREQUERIMENTO,');
qryDet.SQL.Add('       D.MATRICULA,');
qryDet.SQL.Add('       P.NOME,');
qryDet.SQL.Add('       PF.DATAMORTE,');
qryDet.SQL.Add('       PLA.IDPLANOPREV,');
qryDet.SQL.Add('       PLA.IDSITPART,');
qryDet.SQL.Add('       EP.IDSITFUNC,');
qryDet.SQL.Add('       PLA.IDPESSJUR, ');
qryDet.SQL.Add('       PLA.IDSITPLANOPREV,');
qryDet.SQL.Add('       PLA.SEQPROPOSTA,');
qryDet.SQL.Add('       PLA.INSCRICAONUMERO AS INSCNUMERO,');
qryDet.SQL.Add('       BH.IDBENEFICIO,');
qryDet.SQL.Add('       BH.NUMBENEFICIO,');
qryDet.SQL.Add('       BH.IDPESSOA,');
qryDet.SQL.Add('       BH.IDTITULAR,');
qryDet.SQL.Add('       DECODE(BH.IDTITULAR, BH.IDPESSOA, ''APOSENTADO'', ''PENSIONISTA'') AS TIPO,');
qryDet.SQL.Add('       B.NOME BENEFICIO,');
qryDet.SQL.Add('       BH.DIB "DATA DO EVENTO",');
qryDet.SQL.Add('       BH.DIB,');
qryDet.SQL.Add('       BH.DIP,');
qryDet.SQL.Add('       (SELECT BF.DIBBENEFANT');
qryDet.SQL.Add('        FROM BENEFBFCIARIO BF');
qryDet.SQL.Add('        WHERE BF.IDTITULAR = BH.IDTITULAR');
qryDet.SQL.Add('          AND BF.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('          AND BF.FONTEPAGADORA = 2');
qryDet.SQL.Add('          AND ROWNUM = 1) AS DIBANT,');


qryDet.SQL.Add('(SELECT MAX(DC.RMREAJ)');
qryDet.SQL.Add('          FROM DETCONCINSS DC');
qryDet.SQL.Add('         WHERE DC.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('           AND DC.NUMPROCINSS = BH.NUMBENEFICIO');
qryDet.SQL.Add('           AND DC.DTINICIOCRED = (SELECT MIN(DC1.DTINICIOCRED)');
qryDet.SQL.Add('                                  FROM DETCONCINSS DC1');
qryDet.SQL.Add('                                  WHERE DC.IDPESSOA = DC1.IDPESSOA AND');
qryDet.SQL.Add('                                        DC.NUMPROCINSS = DC1.NUMPROCINSS)) AS RMI,');


qryDet.SQL.Add('       (DECODE(BH.FLGREQUERIMENTO, 0, ''NAO'', 1, ''SIM'', ''NAO'')) AS BENEFREQ,');
qryDet.SQL.Add('       B.CODBENEFICIO ESPECIE,');
qryDet.SQL.Add('       DECODE(B.CODBENEFICIO,92,''SIM'',''NÃO'') ISENTOIRRF,');
qryDet.SQL.Add('       BH.DATAREQUERIMENTO,');
qryDet.SQL.Add('       DECODE(PF.FLGMOLESTIAGRAVE,1,''SIM'',''NAO'') MOLESTIA,');
qryDet.SQL.Add('       PF.DATAMOLESTIAGRAVE DATAINICIO,');
qryDet.SQL.Add('       PF.DATAFIMMOLESTIA DATAFIM,');
qryDet.SQL.Add('       PLA.Idplanprevcontab IDPLANPREVCONTAB');
qryDet.SQL.Add('FROM BENEFHABILITA BH');

qryDet.SQL.Add('     JOIN BENEFBFCIARIO BB ON BH.NUMEROPROCESSO = BB.NUMEROPROCESSO');
qryDet.SQL.Add('                              AND BH.IDPESSOA = BB.IDPESSOA AND');
qryDet.SQL.Add('                             BH.IDTITULAR = BB.IDTITULAR ');

IF rd_benefreq.ItemIndex = 1 THEN
   qryDet.SQL.Add('                             AND BB.IDSITBENEFICIO = 4     ')
ELSE
   qryDet.SQL.Add('                             AND BB.IDSITBENEFICIO IN(1,2,3,5)');

qryDet.SQL.Add('     JOIN DEPENTIT D ON BH.IDPESSOA = D.IDPESSOA AND');
qryDet.SQL.Add('                        BH.IDTITULAR = D.IDTITULAR  ');
qryDet.SQL.Add('     JOIN PESSOA P ON BH.IDPESSOA = P.IDPESSOA');
qryDet.SQL.Add('     JOIN PESSOAFISICA PF ON BH.IDPESSOA = PF.IDPESSOA');
qryDet.SQL.Add('     JOIN BENEFICIO B ON BH.IDBENEFICIO = B.IDBENEFICIO');
qryDet.SQL.Add('     LEFT JOIN ELEGPATRO EP ON BH.IDPESSOA = EP.IDPESSOA');
qryDet.SQL.Add('     LEFT JOIN (SELECT PP.IDPESSOA,');
qryDet.SQL.Add('       CASE');
qryDet.SQL.Add('         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN');
qryDet.SQL.Add('           PP.IDPLANOPREV');
qryDet.SQL.Add('         ELSE');
qryDet.SQL.Add('           NVL((SELECT bf.idplanoprev');
qryDet.SQL.Add('                FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('                WHERE PP.IDPESSOA = BF.IDTITULAR');
qryDet.SQL.Add('                  AND BF.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                  AND BF.FONTEPAGADORA = 1');
qryDet.SQL.Add('                  AND BF.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                  AND ROWNUM = 1');
qryDet.SQL.Add('                  AND (BF.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                       OR (BF.IDPLANPREVCONTAB <> 28');
qryDet.SQL.Add('                           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                                           FROM BENEFBFCIARIO BF1');
qryDet.SQL.Add('                                           WHERE BF1.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                                             AND BF1.FONTEPAGADORA = 1');
qryDet.SQL.Add('                                             AND BF1.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                                             AND BF1.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                                             AND BF1.IDTITULAR = BF.IDTITULAR');
qryDet.SQL.Add('                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV)');
qryDet.SQL.Add('       END IDPLANOPREV,');
qryDet.SQL.Add('       CASE');
qryDet.SQL.Add('         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN');
qryDet.SQL.Add('           28');
qryDet.SQL.Add('         ELSE');
qryDet.SQL.Add('           NVL((SELECT bf.Idplanprevcontab');
qryDet.SQL.Add('                FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('                WHERE PP.IDPESSOA = BF.IDTITULAR');
qryDet.SQL.Add('                  AND BF.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                  AND BF.FONTEPAGADORA = 1');
qryDet.SQL.Add('                  AND BF.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                  AND ROWNUM = 1');
qryDet.SQL.Add('                  AND (BF.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                       OR (BF.IDPLANPREVCONTAB <> 28');
qryDet.SQL.Add('                           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                                           FROM BENEFBFCIARIO BF1');
qryDet.SQL.Add('                                           WHERE BF1.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                                             AND BF1.FONTEPAGADORA = 1');
qryDet.SQL.Add('                                             AND BF1.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                                             AND BF1.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                                             AND BF1.IDTITULAR = BF.IDTITULAR');
qryDet.SQL.Add('                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV)');
qryDet.SQL.Add('       END Idplanprevcontab,');
qryDet.SQL.Add('       PP.IDSITPART,');
qryDet.SQL.Add('       PP.IDSITPLANOPREV,');
qryDet.SQL.Add('       PP.SEQPROPOSTA,');
qryDet.SQL.Add('       PP.INSCRICAONUMERO,');
qryDet.SQL.Add('       PP.IDPESSJUR');
qryDet.SQL.Add('FROM PARTPREVPLAN PP');
qryDet.SQL.Add('WHERE (PP.IDSITPLANOPREV IN (25,26,27,28,29)');
qryDet.SQL.Add('       OR (PP.IDSITPLANOPREV NOT IN (25,26,27,28,29)');
qryDet.SQL.Add('          AND PP.FLGDESATIVADO = 0');
qryDet.SQL.Add('           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                           FROM PARTPREVPLAN PPP1');
qryDet.SQL.Add('                           WHERE PPP1.IDPESSOA = PP.IDPESSOA');
qryDet.SQL.Add('                             AND PPP1.IDSITPLANOPREV IN (25,26,27,28,29))))) PLA ON PLA.IDPESSOA = BH.IDTITULAR');


qryDet.SQL.Add('WHERE BH.FLGREQUERIMENTO =:flgrequerimento');///filtro

CASE CB_TIPO_RECEBEDOR.ITEMINDEX OF
1: QRYDET.SQL.APPEND(' AND BH.IDTITULAR = BH.IDPESSOA');  ///APOSENTADO
2: QRYDET.SQL.APPEND(' AND BH.IDTITULAR <> BH.IDPESSOA');  ///PENSIONISTA
END;


qryDet.SQL.Add('   AND EXISTS (SELECT 1');
qryDet.SQL.Add('               FROM HISTBENEFHABILITA HB');
qryDet.SQL.Add('               WHERE BH.idbenefhabilita = hb.idbenefhabilita AND');
qryDet.SQL.Add('                     hb.idsithabilitacao = (SELECT valorparam');
qryDet.SQL.Add('                                            FROM paramfolha');
qryDet.SQL.Add('                                            WHERE nomeparam = ''SITUACAOHABILITACAOINSS'') AND');
qryDet.SQL.Add('                     hb.dataregistro = (SELECT MAX(hb1.dataregistro)');
qryDet.SQL.Add('                                        FROM histbenefhabilita hb1');
qryDet.SQL.Add('                                        WHERE hb.idbenefhabilita = hb1.idbenefhabilita))');

QRYDET.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;

if  trim(_ordem)='' then
    qryDet.SQL.Add(' order by Nome ')
else
    qryDet.SQL.Add(' order by '+_ordem); }



qryDet.Close;
qryDet.sql.Clear;
{QRYDET.SQL.ADD('SELECT * FROM (SELECT '+#39+_selecao+#39+' AS SELECIONADO,');
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS1.FLGENTRADA,1,HS1.VLRCOTAS,-HS1.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS1');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS1.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS1.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS1.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS1.IDTIPORESERVA IN (51,52,53,55,79,117,134))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (59,60,61,62,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (51,52,53,55,59,60,61,62,79,117,134,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('EL.IDPESSOA ,');

QRYDET.SQL.Add('RS.IDPLANOPREV,EL.IDPESSJUR ');
QRYDET.SQL.Add('B.DATAFINAL ,');
QRYDET.SQL.Add('B.NUMEROPROCESSO ,');
QRYDET.SQL.Add(', DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') TIPO_OPCAO_IR');

//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('FROM ELEGPATRO EL');
QRYDET.SQL.Add('     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA');
QRYDET.SQL.Add('                        AND EL.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('  JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND');
QRYDET.SQL.Add('                              RS.IDPLANOPREV = PPP.IDPLANOPREV');
QRYDET.SQL.Add('     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev');
QRYDET.SQL.Add('     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA');
QRYDET.SQL.Add('                            AND EL.IDPESSJUR = HS1.IDPESSJUR');
QRYDET.SQL.Add('                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV');
QRYDET.SQL.Add('                            AND RS.IDTIPORESERVA = HS1.IDTIPORESERVA');

QRYDET.SQL.Add('     JOIN BENEFBFCIARIO B ON EL.IDPESSOA = B.IDPESSOA AND');
QRYDET.SQL.Add('                             RS.IDPESSJUR = B.IDPESSJUR AND');
QRYDET.SQL.Add('                             RS.IDPLANOPREV = B.IDPLANOPREV  ');


QRYDET.SQL.Add('WHERE ');
QRYDET.SQL.Add('   RS.IDTIPORESERVA IN (100,101,110,111,--NOVO PLANO');
QRYDET.SQL.Add('                           51,52,53,55,59,60,61,62,79,117,134,167,170)--REB');
//QRYDET.SQL.Add('  AND el.matricula = ''0000023''');
if cb_tipo_op.ItemIndex = 1 then
    QRYDET.SQL.Add(' AND PPP.TIPOOPCAOIR = 2')
else
   if cb_tipo_op.ItemIndex = 0 then
    QRYDET.SQL.Add(' AND PPP.TIPOOPCAOIR <>  2');



if cb_tipo_recebedor.ItemIndex = 1 then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66)')
else if cb_tipo_recebedor.ItemIndex = 2 then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (74)')
  ELSE
    QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66,74)');
    
QRYDET.SQL.Add('  AND EXISTS (SELECT 1');
QRYDET.SQL.Add('              FROM benefbfciario bf');
QRYDET.SQL.Add('              WHERE bf.idbeneficio IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493)');
QRYDET.SQL.Add('                AND el.idpessoa = bf.idpessoa');


if rd_benefreq.ItemIndex = 0 then
   begin

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO=1');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');
   end
else
   begin 

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO=4');    
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');

   end;


//IF mk_data_re.text<>'' then
//   QRYDET.SQL.Add('             AND datarequerimento='+mk_data_re.text);


QRYDET.SQL.Add('                AND bf.idpessoa = bf.idtitular)');
QRYDET.SQL.Add('  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO >= ''01/01/2011'' ');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO <= ''31/12/2011''');

//if strtofloat(ed_min.text)>0 then
//  QRYDET.SQL.Add(' AND SALDO_CONTA_TOTAL>='+ed_min.text);
//
//if strtofloat(ed_max.text)>0 then
//  QRYDET.SQL.Add(' AND SALDO_CONTA_TOTAL<='+ed_max.text);


//IF mk_ini.text<>'' then
//  QRYDET.SQL.Add(' AND DATA_ULTIMO_RESGATE>='+mk_ini.text);
//
//IF mk_fin.text<>'' then
//  QRYDET.SQL.Add(' AND DATA_ULTIMO_RESGATE<='+mk_fin.text);





QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL.IDPESSOA,PPP.TIPOOPCAOIR,B.DATAFINAL,B.NUMEROPROCESSO');
QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp'); }






/// AQUI

QRYDET.SQL.Add('SELECT distinct * FROM (SELECT ''S'' AS SELECIONADO,');           //edilaine - SIG20491
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))'); }

QRYDET.SQL.Add('    (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                          -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                          (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                           FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                           WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                 M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                           FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                           WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                              FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                   JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                        AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                              WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                AND h.idtiporeserva IN (100,110,111)');
QRYDET.SQL.Add('                                AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                and H.IDPESSOA = EL.IDPESSOA)');

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         AND H1.IDPLANOPREV = PP.IDPLANOPREV');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                      NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                      NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                  FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                  WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         PPP.IDPESSJUR = H1.IDPESSJUR AND');
QRYDET.SQL.Add('                                         PPP.IDPLANOPREV = H1.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                                        PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                        PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                      H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                      TP.ANALITICOSINTETI = ''A'' AND');
QRYDET.SQL.Add('                      TP.FLGCONTROLE = 0 AND');
QRYDET.SQL.Add('                      TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                      H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                      CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                    FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                    WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                      H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');}

QRYDET.SQL.Add(' (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                                -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                                (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                                 WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                       M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                                 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                                    FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                         JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                              AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                    WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                      AND h.idtiporeserva IN (101)');
QRYDET.SQL.Add('                                      AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                      AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                      AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                      and H.IDPESSOA = EL.IDPESSOA)            ');

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         AND H1.IDPLANOPREV = PP.IDPLANOPREV');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                      NVL(TP.FLGCONTROLE, 0) = 0 AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                  FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                  WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         PPP.IDPESSJUR = H1.IDPESSJUR AND');
QRYDET.SQL.Add('                                         PPP.IDPLANOPREV = H1.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                                        PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                        PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                      H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                      TP.ANALITICOSINTETI = ''A'' AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      TP.FLGCONTROLE = 0 AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                      H1.IDPLANOPREV = RS.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                      H1.IDTIPORESERVA IN (62,33,59,60,61,170) AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                      CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                    FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                    WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                      H1.IDPESSOA = EL.IDPESSOA AND');
QRYDET.SQL.Add('                      H1.IDPESSJUR = EL.IDPESSJUR ) ');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');}

QRYDET.SQL.Add('    (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                                -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                                (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                                 WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                       M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                                 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                                    FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                         JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                              AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                    WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                      AND h.idtiporeserva IN (100,110,111,101)');
QRYDET.SQL.Add('                                      AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                      AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                      AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                      and H.IDPESSOA = EL.IDPESSOA) ');


QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
//Luiz Carlos - SIG50495 - FIM
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         AND H1.IDPLANOPREV = PP.IDPLANOPREV');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                      NVL(TP.FLGCONTROLE, 0) = 0 AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                  FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                  WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                                         PPP.IDPESSJUR = H1.IDPESSJUR AND');
QRYDET.SQL.Add('                                         PPP.IDPLANOPREV = H1.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                                        PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                        PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                      H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                      TP.ANALITICOSINTETI = ''A'' AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      TP.FLGCONTROLE = 0 AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                      H1.IDPLANOPREV = RS.IDPLANOPREV AND');
//Luiz Carlos - SIG50495 - Inicio
//QRYDET.SQL.Add('                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170) AND');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                      CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                    FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                    WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
//Luiz Carlos - SIG50495 - Inicio
QRYDET.SQL.Add('                      H1.IDPESSOA = EL.IDPESSOA AND');
QRYDET.SQL.Add('                      H1.IDPESSJUR = EL.IDPESSJUR) ');
//Luiz Carlos - SIG50495 - Fim
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('EL.IDPESSOA ,');
QRYDET.SQL.Add('RS.IDPLANOPREV,EL.IDPESSJUR, ');
QRYDET.SQL.Add('BF.DATAFINAL ,');
QRYDET.SQL.Add('BF.DATAINICIO ,'); // Andre Imakawa - SIG 71469
QRYDET.SQL.Add('BF.NUMEROPROCESSO,');
QRYDET.SQL.Add('DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') TIPO_OPCAO_IR,');
QRYDET.SQL.Add('BF.VALORATUAL, BF.VALORTOTAL, BF.IDEVENTOSPREV');
QRYDET.SQL.Add(' , BF.IDTITULAR, 0.00 AS VLR_IRREGR, PPP.TIPOOPCAOIR, PB.SEQRESGATE, PE.NOME '); //Darivaldo - SIG20491
QRYDET.SQL.Add('FROM BENEFBFCIARIO BF');
QRYDET.SQL.Add('     JOIN ELEGPATRO EL ON EL.IDPESSOA = BF.IDPESSOA');
QRYDET.SQL.Add('     JOIN PESSOA PE ON PE.IDPESSOA = EL.IDPESSOA');               //edilaine - SIG20491
QRYDET.SQL.Add('     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA');
QRYDET.SQL.Add('                        AND EL.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('                        AND BF.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('                        AND BF.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('     JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND');
QRYDET.SQL.Add('                              RS.IDPLANOPREV = PPP.IDPLANOPREV');
QRYDET.SQL.Add('     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev');
QRYDET.SQL.Add('     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA');
QRYDET.SQL.Add('                            AND EL.IDPESSJUR = HS1.IDPESSJUR');
QRYDET.SQL.Add('                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV');
QRYDET.SQL.Add('                            AND RS.IDTIPORESERVA = HS1.IDTIPORESERVA');
QRYDET.SQL.Add('     JOIN PROCESSOBENEF PB ON PB.NUMEROPROCESSO = BF.NUMEROPROCESSO ');   //edilaine - SIG20491
QRYDET.SQL.Add('WHERE RS.IDTIPORESERVA IN (100,101,110,111,--NOVO PLANO');
QRYDET.SQL.Add('                           51,52,53,55,59,60,61,62,79,117,134,167,170)--REB');
QRYDET.SQL.Add('  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');


if cb_tipo_op.ItemIndex = 1 then
    QRYDET.SQL.Add(' AND PPP.TIPOOPCAOIR = 2')
else
   if cb_tipo_op.ItemIndex = 0 then
    QRYDET.SQL.Add(' AND (PPP.TIPOOPCAOIR <>  2  OR PPP.TIPOOPCAOIR IS NULL ) ');


//Darivaldo Alencar SIG20491 - inicio
{if cb_tipo_recebedor.ItemIndex = 1  then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66)')
else if cb_tipo_recebedor.ItemIndex = 2 then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (74)')
ELSE }
if (qryPlanos.FieldByName('IDPLANOPREV').AsInteger = 99) then
   QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66,74)')
else
   QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN ('+qryPlanos.FieldByName('IDPLANOPREV').AsString+')');
//Darivaldo Alencar SIG20491 - fim


//QRYDET.SQL.Add('  AND EXISTS (SELECT 1');
//QRYDET.SQL.Add('              FROM benefbfciario bf');
//QRYDET.SQL.Add('              WHERE bf.idbeneficio IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493)');
//QRYDET.SQL.Add('                AND el.idpessoa = bf.idpessoa )');


if rd_benefreq.ItemIndex = 0 then
   begin

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO=3');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');
   end
else
   begin 

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO=4');    
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');

   end;


//QRYDET.SQL.Add('  AND RS.IDPLANOPREV IN (66,74)');
QRYDET.SQL.Add('  AND BF.IDBENEFICIO = 418');
//QRYDET.SQL.Add('  AND BF.IDSITBENEFICIO = 4');
QRYDET.SQL.Add('  AND BF.IDEVENTOSPREV IS NOT NULL');
//QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL.IDPESSOA,PPP.TIPOOPCAOIR,BF.DATAFINAL,BF.NUMEROPROCESSO,');
QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL.IDPESSOA,PPP.TIPOOPCAOIR,BF.DATAFINAL, BF.DATAINICIO ,BF.NUMEROPROCESSO,');  // Andre Imakawa - SIG 71469

QRYDET.SQL.Add('         BF.VALORATUAL, BF.VALORTOTAL, BF.IDEVENTOSPREV');
QRYDET.SQL.Add('         , BF.IDTITULAR, PB.SEQRESGATE, PE.NOME ');  //Darivaldo - SIG20491
QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp');


//AQUI


qryDet.Active:=true;

if qryDet.IsEmpty then
  tbcDetalhe.Enabled:=false
else
  tbcDetalhe.Enabled:=true;

end;

procedure TFrmCadConcederResgCompLote.sbtnProcurarClick(Sender: TObject);
var
   ConfirmaVisible : Boolean;


begin
//  inherited;



if Trim(cb_tipo_recebedor.Text) = '' then   ///msg1 //msg06
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para concessão do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   sbtnProcurar.down := false;
   exit;
   end;



buscarequerimentos('S','');

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnRequerer.Enabled:=false;


       bbtnDesfazer.Enabled:=true;
  //     FrmCadConcederBenefInssLote.Refresh;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;

       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;

   bbtnDesfazer.Enabled:=false;
   end;




   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;

    if qryDet.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;

   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;

               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
//               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (qryDet.Active) and (not qryDet.IsEmpty) then
               begin
//                  sbtnAlterar.Enabled := true;
//                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
//               sbtnAlterar.Down := true;
//               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
//                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
//                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;


sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;

  if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       end;

end;

procedure TFrmCadConcederResgCompLote.tbcDetalheChange(Sender: TObject);
begin
//  inherited;
case tbcDetalhe.tabindex of
0:begin
  pnl_impressao.SendToBack;
  pnl1.SendToBack;


if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
    //   sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
    //   sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
 // sbtnProcurarClick(sender);
  end;
  end;
1:begin
 // buscarlog;
  pnl1.BringToFront;
  pnl_impressao.SendToBack;
  sbtnRequerer.Enabled:=false;
//  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
2:begin
  configuralog;
  sbtnRequerer.Enabled:=false;
//  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
end;
end;

procedure TFrmCadConcederResgCompLote.bt_imprimirClick(Sender: TObject);
begin
//  inherited;

case rg_opcao_impressao.itemindex of
0:gera_impressao_log;
1:gera_impressao_requerimento;
//1:=
end;



end;

procedure TFrmCadConcederResgCompLote.gera_impressao_log;
var
     iInicio, iFim, nProcessados : integer;
begin

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);


     DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

     iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
     buscarlog;



      with frmMostraAux.memResult.Lines do
        begin
        Clear;


        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('LOG DO PROCESSAMENTO DE CONCESSÃO DE BENEFÍCIOS DO INSS EM LOTE',99));
        Add('-----------------------------------------------------------------------------------------------------');
        Add('Início do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time));


        while not qry.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qry.FieldByName('Matrícula').AsString,30)+
             //  PreparaStr('Inscrição : '+qry.FieldByName('inscricao').AsString,20)+
               PreparaStr('Nome  : '+qry.FieldByName('Nome').AsString,49));

            Add('Mensagem de Erro: '+qry.FieldByName('Mensagem de Erro').AsString);
            Add(qry.FieldByName('Mensagem Oracle').AsString);

            qry.next;
            end;


        Add('-----------------------------------------------------------------------------------------------------');
            Add(PreparaStr('Quantidade total de registros : '+inttostr(qryDet.recordcount),50)+
//               PreparaStr('Quantidade de registros processados :  '+inttostr(qry.recordcount),50));////precisa fazer
               PreparaStr('Quantidade de registros processados :  '+inttostr(RegProc),50));


         iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

            Add(PreparaStr('Tempo de Processamento : '+TempoDecorrido(iFim - iInicio),50)+
               PreparaStr('Log gerado em : '+FormatDateTime('dd/mm/yyyy', date)+' às '+FormatDateTime('hh:mm', time)+' horas',50));



        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('Fim do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time),99));
        Add('-----------------------------------------------------------------------------------------------------');



      end;


frmMostraAux.ShowModal;

end;

procedure TFrmCadConcederResgCompLote.buscarlog;
begin
//pnl1.BringToFront;
//pnl_impressao.SendToBack;
qry.Close;
qry.Active:=false;
qry.sql.clear;
qry.sql.Add('SELECT matricula AS Matrícula,nome as Nome,msgerro as "Mensagem de Erro",msgerrooracle as "Mensagem Oracle" FROM CM.LOGRESGLOTE');

qry.Active:=true;

end;

procedure TFrmCadConcederResgCompLote.configuralog;
begin
pnl_impressao.BringToFront;
pnl1.SendToBack;

end;

procedure TFrmCadConcederResgCompLote.gera_impressao_requerimento;
var
  Sender: TObject;
  FmatriculaR  : TStrings;
  local:string;
  query:TwwQuery;
begin

qry_rel.Active:=false;
//qry_rel.sql.Clear;
//qry_rel.sql.Append('SELECT '             'MATRICULA,TO_BLOB(NULL)MEMO FROM DUAL');
//qry_rel.SQL.Add('SELECT ''             ''MATRICULA,TO_BLOB(NULL)MEMO FROM DUAL');
qry_rel.open;

qry_rel.Delete;



query:=TwwQuery.Create(Self);
query.DataBaseName := 'BaseDados';


//buscarequerimentos('S','S');

  If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);
//     frmMostraAux.Caption:='DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE';

      with frmMostraAux.memResult.Lines do
        begin




        qrydet.First;
        while not qrydet.eof do
            begin
            query.close;
            query.sql.clear;
            query.SQL.Add('SELECT NOME, DATANASC');
            query.SQL.Add('  FROM PESSOA P, PESSOAFISICA PF');
            query.SQL.Add(' WHERE P.IDPESSOA ='+qrydet.FieldByName('IDPESSOA').TEXT);
            query.SQL.Add('   AND PF.IDPESSOA = P.IDPESSOA');
            query.open;

             clear;
             Add('------------------------------------------------------------------------------------------------------');
             Add('DEMONSTRATIVO DE CONCESSÃO DE RESGATE COMPLEMENTAR EM LOTE');
             Add('                                                               VERSÃO : ' + Sistema.Versao);
    //         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao)); não fazer
             Add('USUÁRIO : ' + Sistema.NomeUsuario + '            DATA DO REQUERIMENTO : ' + FormatDateTime('dd/mm/yyyy', Date));
             Add('------------------------------------------------------------------------------------------------------');



            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qrydet.FieldByName('matricula').AsString,99));


            Add(PreparaStr('Nome do Participante : '+query.FieldByName('NOME').text,50)+
               PreparaStr('Data de Nascimento : '+query.FieldByName('DATANASC').text,50));


//            Add(PreparaStr('Saldo Residual : '+qrydet.FieldByName('SALDO_CONTA_TOTAL').AsString,50)+
            Add(PreparaStr('Saldo Residual : '+formatfloat('#,##0.00',qrydet.FieldByName('SALDO_CONTA_TOTAL').value),50)+
               PreparaStr('Plano Previdenciário : '+qrydet.FieldByName('plano').AsString,50));


            qryaux.Active:=false;
            qryaux.SQL.Clear;
            qryaux.sql.Add('SELECT msgerro FROM CM.LOGRESGLOTE');
            qryaux.sql.Add(' WHERE matricula='+#39+qrydet.FieldByName('matricula').AsString+#39);
            qryaux.OPEN;




            Add('Mensagem de Impedimento: '+qryaux.FieldByName('msgerro').AsString); ///FEITO

            Add('-----------------------------------------------------------------------------------------------------');
            Add(PreparaStr('APENAS PARA CONFERÊNCIA',99));
            Add('-----------------------------------------------------------------------------------------------------');


            qry_rel.Insert;
            qry_rel.FieldByName('matricula').text:=qrydet.FieldByName('matricula').AsString;
            qry_rel.FieldByName('memo').AsString :=frmMostraAux.memResult.Lines.Text;        //edilaine - SIG86660
            qry_rel.Post;



            qrydet.next;
            end;




        end;


qryaux.CLOSE;

//ppMemo1.Lines.Clear;
//ppMemo1.Lines.Text:=frmMostraAux.memResult.Lines.Text;

TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'DEMONSTRATIVO DE CONCESSÃO DE REQUERIMENTO DE RESGATE COMPLEMENTAR EM LOTE');
query.close;
query.destroy;

{
FmatriculaR:= TStringList.Create;
FmatriculaR.clear;

   lbl_versao.Caption:=Sistema.Versao;
   lbl_lote.caption:=IntToStr(iIdLoteConcessao);
   lbl_usuario.caption:=Sistema.NomeUsuario;
   lbl_dataconce.caption:=FormatDateTime('dd/mm/yyyy', Date);
          if rd_benefreq.ItemIndex = 0 then
           lbl_tipoderecebedor.caption:= uppercase(cb_tipo_recebedor.text)
        else
           lbl_tipoderecebedor.caption:= uppercase(cb_tipo_recebedor.text);




   TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'Demonstrativo de Concessão de Benefícios de INSS em Lote');

   // qryDetRel.SQL.Clear;
//    qryDetRel.SQL.text :=StringREplace(qrydet.sql.GetText,'AND BB.IDSITBENEFICIO = 4 ','AND BB.IDSITBENEFICIO IN (1,2,3,5) ',[rfReplaceall]);
//    qryDetRel.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;
//    qryDetRel.Active:=True;
//    qrydet.First;
//      while not qrydet.eof do
//         begin
//
//         dsReciboCedidos.DataSet:=qryDetRel;
//         qryDetRel.Filtered:=false;
//         qryDetRel.Filter:='matricula ='+#39+qrydet.FieldByName('matricula').Text+#39;
//         qryDetRel.Filtered:=True;
//
//
//         local:= ed_local.text+'\'+QRYDET.FIELDBYNAME('matricula').TEXT ;
//         if not DirectoryExists(local) then
//                ForceDirectories(local);
//
//
//         rpReciboCedidos.DeviceType       := 'PDFFile';
//         rpReciboCedidos.AllowPrintToFile := True;
//         rpReciboCedidos.ShowPrintDialog  := False;
//         rpReciboCedidos.TextFileName     := local+'\INSS_'+QRYDET.FIELDBYNAME('matricula').TEXT+'_'+QRYDET.FIELDBYNAME('nome').TEXT+'.pdf';
//         rpReciboCedidos.Print;
//
//
//
//
//
//
//
//         qrydet.Next;
//         end;
         dsReciboCedidos.DataSet:=qrydet;








  // TFrmPreview.MnuVisualizarClick(sender);

//      rpReciboCedidos.Archivefilename := ed_local.text + IntToStr(GetTickCount) + '.pdf';
//      rpReciboCedidos.AllowPrintToFile := True;
//      rpReciboCedidos.ShowPrintDialog := False;
//      rpReciboCedidos.DeviceType :='PDFFile';
//      rpReciboCedidos.Print;


//buscarequerimentos('S');

{  If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);
     frmMostraAux.Caption:='DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE';

      with frmMostraAux.memResult.Lines do
        begin
        Clear;


         Clear;
         Add('------------------------------------------------------------------------------------------------------');
         Add('          DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE        VERSÃO : ' + Sistema.Versao);
//         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao)); fazer
         Add('USUÁRIO : ' + Sistema.NomeUsuario + '                               DATA DA CONCESSÃO : ' + FormatDateTime('dd/mm/yyyy', Date));
         Add('------------------------------------------------------------------------------------------------------');


         if rd_benefreq.ItemIndex = 0 then
           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'SIM')
        else
           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'NÃO');




        while not qrydet.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qrydet.FieldByName('matricula').AsString,50)+
               PreparaStr('Número do Benefício : '+qrydet.FieldByName('numbeneficio').AsString,50));

            Add(PreparaStr('Nome do Participante : '+qrydet.FieldByName('nome').AsString,99));

            Add(PreparaStr('Espécie  : '+qrydet.FieldByName('especie').AsString,15)+
               PreparaStr('Benefício : '+qrydet.FieldByName('beneficio').AsString,47)+ '  '+
               PreparaStr('RMI : '+qrydet.FieldByName('rmi').AsString,33));


            Add(PreparaStr('Data do Evento  : '+qrydet.FieldByName('dib').AsString,33)+
               PreparaStr('DIP : '+qrydet.FieldByName('dip').AsString,33)+
               PreparaStr('Isento IRRF : '+qrydet.FieldByName('numbeneficio').AsString,33));//fazer


            Add(PreparaStr('DIB : '+qrydet.FieldByName('dib').AsString,50)+
               PreparaStr('DIB Anterior : '+qrydet.FieldByName('DIBANT').AsString,50));

         if rd_benefreq.ItemIndex =0 then


            Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
               PreparaStr('Benefício Requerido : '+'SIM',50))
          else


            Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
               PreparaStr('Benefício Requerido : '+'NÃO',50));




//            Add('Mensagem de Erro: '+qrydet.FieldByName('mensagem').AsString); ///fazer ??

            qrydet.next;
            end;

        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('APENAS PARA CONFERÊNCIA',99));
        Add('-----------------------------------------------------------------------------------------------------');



        end;



frmMostraAux.ShowModal;     }




end;

procedure TFrmCadConcederResgCompLote.sbtnRequererClick(Sender: TObject);
var
  achou:Boolean;
  Fidpessoa,Ferro,Fmatricula,sValorFinal  : TStringList;
  idevento,valorcalculado,datapagamento,dataref,flgincluimesconc,mesrefatual:string;
  iNumeroProcesso,seq,sidmovbenef:integer;
  meses:integer;
  prorata,i:integer;
  valorprorata:double;
  ValorInssRat:double;
  Mesini:string;
  MesReaj,IDTIPO:STring;
  UsarValorReaj,parada:boolean;
  ValorReajustadoF,valorreajantec:double;

  _queryx:TwwQuery;
  qryreserva:TwwQuery;

  iSeqResgate : integer;          //Darivaldo Alencar SIG20491
  Mesgfim, pstrIdMotivo:string;

  bReajustou,bErro    : Boolean;
  sMsgErro,sDtDIBAnterior,sValorFinal2,NumeroProc:string;

  CtrlRequerBenef     : TCtrlRequerBenef;        //edilaine - SIG20491

  rValorReal,rValorTotal,dValorSRBRetorno:Double;
begin
  try  //Darivaldo Alencar SIG20491 --add try finally

     Fidpessoa := TStringList.Create;
     Fidpessoa.Clear;

     Ferro:= TStringList.Create;
     Ferro.Clear;

     Fmatricula:= TStringList.Create;
     Fmatricula.clear;

     FIdbenefh:= TStringList.Create;
     FIdbenefh.clear;
    ///
      inherited;

    _queryx:=TwwQuery.Create(Self);
    _queryx.DataBaseName := 'BaseDados';
    _queryx.Active:=false;
    _queryx.Sql.Clear;

    qryreserva:=TwwQuery.Create(Self);
    qryreserva.DataBaseName := 'BaseDados';
    qryreserva.Active:=false;
    qryreserva.Sql.Clear;

    sbtnRequerer.Down:=false;
    sbtnProcurar.Down:=false;
    RegProc:=0;
    //Deletar_temp_log(qry2);
    Deletar_temp_log(qry2);
    //Criar_temp(qrydet);

    if Trim(cb_tipo_recebedor.Text) = '' then //msg02
       begin
       MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para concessão do benefício.','Erro',mtError,[mbOk],0);
       cb_tipo_recebedor.SetFocus;
       exit;
       end;

    if  not qrydet.IsEmpty then
      begin

         qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
         qrydet.Filtered:=True;
         qrydet.Active:=True;
         qrydet.First;


         if qrydet.IsEmpty then
            begin
            MsgDlg( ' É necessário selecionar pelo menos um participante para concessão do benefício.','Erro',mtError,[mbOk],0);
            qrydet.Filtered:=FALSE;
            Exit;
            end;   //msg3

         /////selecao de lote
         if iIdLoteConcessao <= 0
         then begin
            iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                             iFlgIncluiMesConc );
            if iIdLoteConcessao <= 0
            then begin

               MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk],0);
               Exit;
            end;
         end;
         ///selecao de lote

        ///verificar se matricula existe se não criar.
        //      qrydet.First;
        //      while not qrydet.eof do
        //         begin
        //          if qrydet.FieldByName('matricula').Text='' then
        //             begin
        //             qrydet.edit;
        //             qrydet.FieldByName('matricula').Text:=GeraMatricula( qrydet ,0);
        //             qrydet.post;
        //
        //             end;
        //
        //         qrydet.Next;
        //         end;

        qrydet.First;
        Ferro.Clear;

        achou:=false;

        qrydet.First;
        while not qrydet.eof do
        begin

           Fidpessoa.Add(#39+qrydet.FieldByName('idpessoa').Text+#39);
           Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
   //        FIdbenefh.Add(#39+qrydet.FieldByName('IDBENEFHABILITA').Text+#39);
  //         Fmatricula_rel.Add(#39+qrydet.FieldByName('matricula').Text+#39);


           qrydet.Next;
        end;

        achou:=True;
  //     RemoveDuplicates(Fmatricula_rel);


        if achou= False then
          begin
             MsgDlg( ' É necessário selecionar pelo menos um participante para requerimento do benefício.','Erro',mtError,[mbOk],0);
             Exit;
          end
        else
          begin
            //Darivaldo Alencar SIG20491 -inicio
            {if not bProcessou then
              begin
                MsgConfirmacao(MSG15);
              end;

            if not bGravou then
              begin
                MsgConfirmacao(MSG16);
              end;
            }//Darivaldo Alencar SIG20491 -fim

            qrydet.First;
            Ferro.Clear;
            while not qrydet.Eof do
            begin
              NumeroProc:=GetNumeroProcesso;

              try
                  sidmovbenef:=CriaLogOcorrencia(qryDet.FieldByName('IDPLANOPREV').AsString,
                                    qryDet.FieldByName('IdPessJur').AsString,
                                    qryDet.FieldByName('IdPessoa').AsString,
                                    '418',
                                    NumeroProc,
                                    qryDet.FieldByName('IdPessoa').AsString,
                                    '1',
                                    '3', ///rn004
                                    FormatDateTime('dd/mm/yyyy', date),
                                    '',//qryDet.FieldByName('ValorAtual').AsString
                                    '',//qryDet.FieldByName('ValorTotal').AsString
                                    '',//qryDet.FieldByName('ValorCotas').AsString
                                    '',//qryDet.FieldByName('DataInicio').AsString
                                    '',//sDataFinal
                                    '',//qryDet.FieldByName('ValorAtual').AsString
                                    '',//qryDet.FieldByName('DataInicio').AsString
                                    '',//sDataFinal
                                    '4',
                                    0,//qryDet.FieldByName('FlgDataPrevista').AsInteger
                                    qryAux, '',
                                    iIdLoteConcessao,
                                    iIdCalculo,//iIdCalculo
                                    False,
                                    0,//qryDet.FieldByName('USUARIOALT').AsInteger
                                    0//iFlgEmprestimo
                                    )
              except
              //   frmAguarde.Apaga;

                If not dtmBaseDados.dbBaseDados.InTransaction Then
                   dtmBaseDados.dbBaseDados.StartTransaction;

                buscarlog;

                pnl1.BringToFront;
                pnl_impressao.SendToBack;
                sbtnRequerer.Enabled:=false;
                bbtnDesfazer.Enabled:=false;

                if dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.RollBack;
                MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
                TiraSQL(qryAux);
                Exit;
              end;

              //rn004


              qryaux.close;
              qryaux.SQL.Clear;
              qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
              qryaux.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
              qryaux.open;

              datapagamento:=qryaux.fieldbyname('datapagamento').text;
              flgincluimesconc:=qryaux.fieldbyname('flgincluimesconc').text;
              dataref:=qryaux.fieldbyname('mesreferencia').text;

              ///verificar quais rubricas irão ser usadas

              qryaux.CLOSE;
              qryaux.SQL.CLEAR;
              qryaux.SQL.ADD('select idmotivoabono, idmotivofolhaben from paramaprev');
              qryaux.OPEN;

              pstrIdMotivo := qryaux.FIELDBYNAME('idmotivofolhaben').AsString;


              GravarHSTBENEFBFCIARIO(qryaux2,
                                   'T',
                                   pstrIdMotivo, //Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                   '1',
                                   inttostr(seq),
                                   QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT,
                                   datapagamento,
                                   inttostr(sidmovbenef),
                                   flgincluimesconc,
                                   dataref,
                                   dataref,NumeroProc
                                   ); //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS



       //

              //edilaine - SIG20491 : inicio
              if QRYDET.FIELDBYNAME('TIPOOPCAOIR').AsInteger = 2 then
              begin
                try
                  try
                     CtrlRequerBenef := TCtrlRequerBenef.Create;
                     CtrlRequerBenef.Initialize( dtmBaseDados.dbBaseDados,
                                                 True,
                                                 Sistema.ConnectionType,
                                                 Sistema.ConnectionSide,
                                                 Sistema.AppRemoteServer,
                                                 True
                                               );
                  except
                    on E:EDBEngineError do
                      begin
                          Gravar_temp_log(param,'',string(E.message));
                          Exit;
                      end;
                  end;

                  if not CtrlRequerBenef.MarcaReservasComplementares( QRYDET.FIELDBYNAME('IDPLANOPREV').AsInteger,
                                                                      qryDet.FieldByName('IDPESSJUR').AsInteger,
                                                                      1,
                                                                      qryDet.FieldByName('IDPESSOA').AsInteger
                                                                    ) then
                  begin
                    Gravar_temp_log(param,'',string('Erro ao marcar reservas complementares'));
                    Exit;
                  end;

                 finally
                    CtrlRequerBenef.destroy;
                 end;
              end;
              //edilaine - SIG20491 : fim


              If Not RodaPadraoMovReserva( qryDet.FieldByName('IDPESSJUR').AsInteger,
                                     QRYDET.FIELDBYNAME('IDPLANOPREV').AsInteger,
                                     qryDet.FieldByName('IDPESSOA').AsInteger,
                                     1,
                                     -1,
                                     337,
                                     -1,
                                     QRYDET.FIELDBYNAME('IDPLANOPREV').AsInteger,
                                     'DC',
                                     datapagamento,
                                     sMsgErro,
                                     qryDet.FieldbyName('NUMEROPROCESSO').AsInteger,
                                     'C',
                                     qryDet.FieldbyName('DATAFINAL').TEXT,
                                     //101075
                                     false,
                                     '',
                                     //BRUNO AZEVEDO SOL 145995 Kintana 1023814
                                     //FormatDateTime('dd/mm/yyyy', dtDataFinal.Date))
                                     //FormatDateTime('dd/mm/yyyy', Now))   // Andre Imakawa - SIG 71469
                                     qryDet.FieldbyName('DATAINICIO').TEXT) // Andre Imakawa - SIG 71469
                                     //BRUNO AZEVEDO SOL 145995 Kintana 1023814
                                     // FIM
                                      then begin
                                         //    MsgDlg('Ocorreram erros ao executar padrão de movimentação de reservas. '+#13+
                                        //            'O processo de concessão será cancelado até que o problema seja resolvido. ',
                                        //            'Erro',mtError,[mbOk],0);
                                        //     bbtnCancelarClick(Self);
                                        //     Exit;
                                      end;

              //edilaine - SIG20491 - inicio
              //comentado o update
              {qryreserva.Close;
              qryreserva.SQL.clear;
              qryreserva.SQL.Add('SELECT IDTIPORESERVA');
              qryreserva.SQL.Add('  FROM RESERVAPART');
              qryreserva.SQL.Add(' WHERE IDPESSOA ='+qryDet.FieldByName('IDPESSOA').TEXT);
              qryreserva.SQL.Add('   AND IDPESSJUR ='+qryDet.FieldByName('IDPESSJUR').TEXT);
              qryreserva.SQL.Add('   AND IDPLANOPREV ='+qryDet.FieldByName('IDPLANOPREV').TEXT);
              qryreserva.OPEN;

              IDTIPO:= qryreserva.FieldByName('IDTIPORESERVA').Text;

              qryreserva.Close;
              qryreserva.SQL.clear;
              //qryreserva.SQL.add(' UPDATE RESERVAPART SET VALORRESERVA = '+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+'  ,'+                //edilaine - SIG20491
              qryreserva.SQL.add(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT)+'  ,'+   //edilaine - SIG20491
                             ' DATAREFERENCIASA = SYSDATE '+
                             ' WHERE (IDPLANOPREV = '''+qryDet.FieldByName('IDPLANOPREV').TEXT+''') '+
                             ' AND (IDTIPORESERVA = '''+IDTIPO+''') '+
                             ' AND (IDPESSJUR = '''+qryDet.FieldByName('IDPESSJUR').TEXT+''') '+
                             ' AND (IDPESSOA = '''+qryDet.FieldByName('IDPESSOA').TEXT+''') '+
                             ' AND (SEQPROPOSTA = '''+'1'+''') ');
              try
                 qryreserva.ExecSQL;
              except
               //  Exit;
              end;
              }//edilaine - SIG20491 - fim

              //edilaine - SIG20491 - inicio
              if QRYDET.FIELDBYNAME('TIPOOPCAOIR').AsInteger = 2 then
              begin
                iSeqResgate := GetSeqResgate(qryDet.FieldByName('NUMEROPROCESSO').AsInteger);

                qryDet.edit;
                qryDet.FieldByName('SEQRESGATE').AsInteger := iSeqResgate;
                qryDet.Post;
              end;
              //edilaine - SIG20491 - fim

              iIdCalculo:=0;

              qryaux.close;
              qryaux.SQL.Clear;
              qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
              qryaux.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
              qryaux.open;


              qryaux2.close;
              qryaux2.SQL.Clear;
              qryaux2.SQL.Add('update BENEFBFCIARIO');
              qryaux2.SQL.Add('set');
              qryaux2.SQL.Add('  idsitbeneficio = 3, ');
              qryaux2.SQL.Add('  ultmespreparo ='+#39+AnoMesAnterior(strtoint(copy(qryaux.fieldbyname('mesreferencia').text,6,2)),strtoint(copy(qryaux.fieldbyname('mesreferencia').text,1,4)))+#39);
              qryaux2.SQL.Add('where');
              qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+' and');
              qryaux2.SQL.Add('  IDBENEFICIO = '+#39+'418'+#39+' and');
              qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
              qryaux2.SQL.Add('  and  rownum = 1');
              try
                   qryaux2.ExecSQL;
              except
                   on E:EDBEngineError do
                     begin
                          Gravar_temp_log(param,'',string(E.message));
                          Exit;
                     end;
              end;

              qryaux2.CLOSE;
              qryaux.close;

           //  AtualizaBenefHabilita(qryaux,'1',inttostr(iNumeroProcesso),(idevento));
              AtualizaBenefbfciario(qryaux,'3',NumeroProc);//rn14

              RegProc:=RegProc+1;

              if cb_grava_indiv.Checked then
                begin

                  If not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  dtmBaseDados.dbBaseDados.Commit;
                end;

              qrydet.Next;
            end;
          end;
      end;

    gera_impressao_requerimento;
    //qrydet.Filtered:=false;
    if Ferro.Count>0 then
       begin
         if not cb_grava_indiv.Checked then
             begin
               If not dtmBaseDados.dbBaseDados.InTransaction Then
                   dtmBaseDados.dbBaseDados.StartTransaction;

               if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar a concessão do benefício. Verifique o log da operação! Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                    buscarlog;
                    tbcDetalhe.TabIndex:=1;
                    pnl1.BringToFront;
                    pnl_impressao.SendToBack;
                    sbtnRequerer.Enabled:=false;
                    bbtnDesfazer.Enabled:=false;

                    dtmBaseDados.dbBaseDados.Commit;
                    gera_impressao_requerimento;
                  end
               else
                  begin
                    buscarlog;
                    tbcDetalhe.TabIndex:=1;
                    pnl1.BringToFront;
                    pnl_impressao.SendToBack;
                    sbtnRequerer.Enabled:=false;
                    bbtnDesfazer.Enabled:=false;

                    If dtmBaseDados.dbBaseDados.InTransaction   Then
                      dtmBaseDados.dbBaseDados.Rollback;
                  end;
             end
         else
             begin
               buscarlog;
               tbcDetalhe.TabIndex:=1;
               pnl1.BringToFront;
               pnl_impressao.SendToBack;
               sbtnRequerer.Enabled:=false;
               bbtnDesfazer.Enabled:=false;

               MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar a concessão do benefício. Verifique o log da operação!','Erro',mtError,[mbOk],0);
             end
       end
    else
       begin

         if not cb_grava_indiv.Checked then
            begin

              If not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

              if MsgDlg( ' Concessão efetuada com sucesso para as matrículas selecionadas.Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                 begin
                   dtmBaseDados.dbBaseDados.Commit;
                   buscarlog;
                   tbcDetalhe.TabIndex:=1;
                   pnl1.BringToFront;
                   pnl_impressao.SendToBack;
                   sbtnRequerer.Enabled:=false;
                   bbtnDesfazer.Enabled:=false;

                   gera_impressao_requerimento;
                 end
               else
                 begin
                   buscarlog;
                   tbcDetalhe.TabIndex:=1;
                   pnl1.BringToFront;
                   pnl_impressao.SendToBack;
                   sbtnRequerer.Enabled:=false;
                   bbtnDesfazer.Enabled:=false;

                    If dtmBaseDados.dbBaseDados.InTransaction   Then
                       dtmBaseDados.dbBaseDados.Rollback;
                 end;
            end
         else
            begin
              MsgDlg( '  Concessão efetuada com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);
            end;

       end;

       //Darivaldo Alencar SIG20491 - inicio
       bProcessou := False;
       bGravou    := False;

       tbButtonAlterar.enabled := true;
       //Darivaldo Alencar SIG20491 - fim

  finally                    //Darivaldo Alencar SIG20491
    qryreserva.Close;
    qryreserva.Destroy;
    //qrydet.Filtered:=false;           //Darivaldo Alencar SIG20491
    //sbtnProcurarClick(sender);        //Darivaldo Alencar SIG20491
    sbtnRequerer.Down:=false;
    sbtnProcurar.Down:=false;
  end;                       //Darivaldo Alencar SIG20491
end;

procedure TFrmCadConcederResgCompLote.sbtnApagarClick(Sender: TObject);
begin

//
  inherited;

end;

procedure TFrmCadConcederResgCompLote.sbtnAltDetClick(Sender: TObject);
begin

  inherited;



  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

////
end;

procedure TFrmCadConcederResgCompLote.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.sbtnConcedeUmClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
//
//  If qry.State <> dsEdit Then
//     qry.Edit;

end;

procedure TFrmCadConcederResgCompLote.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
//
end;



procedure TFrmCadConcederResgCompLote.bbtnDesfazerClick(Sender: TObject);
var
Fidpessoa,Ferro,Fmatricula,Fidbeneficio  : TStringList;
  achou:Boolean;
   NumeroProc,dataref:string;
begin
Deletar_temp_log(qry2);


 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

Fidbeneficio:= TStringList.Create;
Fidbeneficio.clear;
///
RegProc:=0;
  inherited;

  if Trim(cb_tipo_recebedor.Text) = '' then//msg07
  begin
    MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para desfazer a concessão do benefício.','Erro',mtError,[mbOk],0);
    cb_tipo_recebedor.SetFocus;
    exit;
  end;


  qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
  qrydet.Filtered:=True;
  qrydet.Active:=True;
  qrydet.First;


  if qrydet.IsEmpty then //msg08
    begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para desfazer a concessão do benefício.','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
    end;



  if not qrydet.IsEmpty then
    begin

      achou:=true;


      qrydet.First;
      while not qrydet.eof do
        begin

          Fidpessoa.Add(#39+qrydet.FieldByName('idpessoa').Text+#39);
          Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
   //     Fidbeneficio.Add(#39+qrydet.FieldByName('idbeneficio').Text+#39);


          qrydet.Next;
        end;

        RemoveDuplicates(Fidpessoa);
        RemoveDuplicates(Fmatricula);
        RemoveDuplicates(Fidbeneficio);

        qryaux.close;
        qryaux.SQL.Clear;
        qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
        qryaux.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
        qryaux.open;

        dataref:=qryaux.fieldbyname('mesreferencia').text;

        //Rn019
        qryaux.close;
        qryaux.SQL.Clear;

        QRYAUX.SQL.APPEND(' SELECT MATRICULA FROM HISTRUBSAL H ');
        QRYAUX.SQL.APPEND('   JOIN DEPENTIT D ON H.IDPESSOA = D.IDPESSOA');
        QRYAUX.SQL.APPEND('   AND H.IDTITULAR = D.IDTITULAR');
        QRYAUX.SQL.APPEND(' WHERE h.IDPESSOA IN('+FIDPESSOA.COMMATEXT+')');
        QRYAUX.SQL.APPEND('                AND h.IDBENEFICIO IN ('+'418'+')');

        qryaux.Open;
        qryaux.First;
        Ferro.Clear;

        if not qryaux.IsEmpty then
          begin
            while not qryaux.Eof do
              begin

                Ferro.Add(qryaux.fieldbyname('matricula').text);

                qryaux.Next;
              end;

            MsgDlg( ' A(S) matrículas '+trocaCaracter(Ferro.CommaText,',','e')+' já teve (tiveram) o benefício processado pela folha de benefícios','Erro',mtError,[mbOk],0);///msg11
            Exit;
          end;

        If not dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.StartTransaction;

        qrydet.First;
        while not qrydet.Eof do
          begin

            NumeroProc:=GetNumeroProcesso;


            DeletarPrevia();//novo

            DeletarHSTBENEFBFCIARIO(qry2,NumeroProc);//0//rn14

            DeletarMovbenef(qry2,NumeroProc); //rn14
            //DeletarRubricaIndiv(qry2);//William Moreira da Silva - SOL 234143 PPM 420382
            DeletarHISTMOVRESERVA(dataref);


      //    AtualizaBenefHabilita(qryaux,'0','','');//rn14
            AtualizaBenefbfciario(qryaux,'4',NumeroProc);//rn14

            RegProc:=RegProc+1;

            if cb_grava_indiv.Checked then
              begin

                if dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.Commit;

              end;

            qrydet.Next;
          end;


        end;

       qrydet.Filtered:=FALSE;

       if Ferro.Count>0 then
         begin

           if not cb_grava_indiv.Checked then
              begin
                 if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer a concessão do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                      dtmBaseDados.dbBaseDados.Commit;
                      buscarlog;
                      tbcDetalhe.TabIndex:=1;
                      pnl1.BringToFront;
                      pnl_impressao.SendToBack;
                      sbtnRequerer.Enabled:=false;
                      bbtnDesfazer.Enabled:=false;

                    end
                  else
                    begin
                      buscarlog;
                      tbcDetalhe.TabIndex:=1;
                      pnl1.BringToFront;
                      pnl_impressao.SendToBack;
                      sbtnRequerer.Enabled:=false;
                      bbtnDesfazer.Enabled:=false;

                      If dtmBaseDados.dbBaseDados.InTransaction   Then
                         dtmBaseDados.dbBaseDados.Rollback;
                    end;
              end
              else
                 MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer a concessão do benefício. Verifique.','Erro',mtError,[mbOk],0);

         end
  else
    begin

      if not cb_grava_indiv.Checked then
        begin
          if MsgDlg( 'Concessão cancelada com sucesso para as matrículas selecionadas. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              buscarlog;
              tbcDetalhe.TabIndex:=1;
              pnl1.BringToFront;
              pnl_impressao.SendToBack;
              sbtnRequerer.Enabled:=false;
              bbtnDesfazer.Enabled:=false;
            end
          else
            begin
              buscarlog;

              tbcDetalhe.TabIndex:=1;
              pnl1.BringToFront;
              pnl_impressao.SendToBack;
              sbtnRequerer.Enabled:=false;
              bbtnDesfazer.Enabled:=false;
              If dtmBaseDados.dbBaseDados.InTransaction   Then
                 dtmBaseDados.dbBaseDados.Rollback;
            end;
        end
      else
         MsgDlg( 'Concessão cancelada com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);

    end;

  sbtnProcurarClick(sender);

  sbtnRequerer.Down:=false;
  sbtnProcurar.Down:=false;
  sbtnAlterar.Down:=false;

end;


procedure TFrmCadConcederResgCompLote.bbtnOkDetClick(Sender: TObject);
begin




     if MsgDlg('Deseja gravar as alterações ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin

        if not cb_validado.Checked then
           begin
           if MsgDlg('Alterações foram efetuadas e o campo "Validado" está desmarcado - Deseja confirmar a alteração sem a validação ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrno then
              exit;
           end;


        if qryDet.fieldbyname('RMI').text='' then
           begin
           MsgDlg( ' A RMI para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;

        if not IsDate(qryDet.fieldbyname('DIBANT').text) then
           begin
           MsgDlg( ' A DIB Anterior para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;







        inherited;
        ///grava as alteraçõs
        end
     else
         begin
         bbtnCancelarDetClick(Sender);
         //cancela as alterações
         end;
end;

procedure TFrmCadConcederResgCompLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederResgCompLote.GravarEventoPrev(_query: TwwQuery;_EventoGerador:string); ///RN015

var
iIdEventoPrev: integer;
sIdEventoGerador: string;
sFlgEfetivado,sDataEfetivado ,sFlgSitFuncImed,sFlgSitPartImed,sFlgSitPlanoImed: string;
sIDSITFUNC,sIDSITPART ,sIDSITPLANOPREV: string;

begin
 iIdEventoPrev := LeUltRegistro(_query,'EVENTOSPREV');
 sIdEventoGerador:= _EventoGerador;  //129 0u 130 regra 015

  sIdEventoGerador:= '131';  //teste


  _query.Close;
  _query.Sql.Clear;
  _query.Sql.Add(' SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  try
     _query.Open;
  except

  end;

  if (_query.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
  then begin
     sFlgEfetivado  := '1';

     sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')';
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;

    sFlgSitFuncImed :=_query.FieldByName('FLGSITFUNCIMEDIA').AsString ;
    sFlgSitPartImed := _query.FieldByName('FLGSITPARTIMEDIA').AsString;
    sFlgSitPlanoImed  := _query.FieldByName('FLGSITPLANOIMEDI').AsString ;


if Trim(qrySitFunc.FieldbyName('IDSITFUNC').AsString)='' then
    sIDSITFUNC:='0'
else
    sIDSITFUNC:=qrySitFunc.FieldbyName('IDSITFUNC').AsString;



if Trim(qrySitPart.FieldbyName('IDSITPART').AsString)='' then
    sIDSITPART:='0'
else
    sIDSITPART:=qrySitPart.FieldbyName('IDSITPART').AsString;



if Trim(qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString)='' then
    sIDSITPLANOPREV:='0'
else
    sIDSITPLANOPREV:=qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString;



          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      qryDet.fieldbyname('idpessoa').text  + ',' + qryDet.fieldbyname('IDPESSJUR').text + ',' + qryDet.fieldbyname('IDPLANOPREV').text + ',' + qryDet.fieldbyname('SEQPROPOSTA').text + ',' +
                                      '''' + qryDet.fieldbyname('IDSITFUNC').text + '''' + ',' + qryDet.fieldbyname('IDSITPART').text + ',' + qryDet.fieldbyname('IDSITPLANOPREV').text + ',' +
                                      '''' + sIDSITFUNC + '''' + ',' + //ok
                                      sIDSITPART + ',' +   //ok
                                      sIDSITPLANOPREV + ',' + //ok
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +  //sIdEventoGerador 129 0u 130 regra 015
                                      sDataEfetivado + ',' + sFlgEfetivado +','+OraNumero(qryDet.fieldbyname('InscNumero').text) + ', ' +
                                      'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) + ''',''DD/MM/YYYY'') )');
          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
 //                   MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederResgCompLote.AtualizaBenefHabilita(
  _query: TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
begin

if trim(_NUMEROPROCESSO)='' then
_NUMEROPROCESSO:='0';

if trim(_EVENTOGERADOR)='' then
_EVENTOGERADOR:='0';


          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' update BENEFHABILITA set FLGCONCESSAO=0  where IDBENEFHABILITA ='+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39);
//          _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederResgCompLote.GravarBfciarioTitPlan(
  _query: TwwQuery);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO BFCIARIOTITPLAN  ' +
                         '(IDPESSJUR, ' +
                         'IDTITULAR,  ' +
                         'IDPLANOORIGEM, ' +
                         'IDPLANOPREV, ' +
                         'IDPESSOA, ' +
                         'IDBENEFICIO, ' +
                         'SEQPROPOSTA, ' +
                         'PRIORIDADE, ' +
                         'PERCENTUAL, ' +
                         'IDRESPONSAVEL) ' +
                      'VALUES  ' +
                        '('+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+', '+
                            #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+',  ' +
                         '0, ' +
                         '100, ' +
                         #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+') ');


          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadConcederResgCompLote.GravarProcessoBenef(_query: TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);


begin



          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('insert into PROCESSOBENEF  ' +
          '(NUMEROPROCESSO,'+
          'IDEVENTOGERADOR,'+
          ' DTEVENTO,      '+
          ' DTDIREITO,     '+
          ' DTREGISTRO,    '+
          ' IDSITPROCESSO) '+
          ' values         '+
         '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+_EventoGerador+#39+',  ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
             ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
          ' 4)');  ////pendente de concessao.

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.GravarBENEFBFCIARIO(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('insert into BENEFBFCIARIO ' +
          '(NUMEROPROCESSO,  ' +
          'IDPESSJUR,        ' +
          ' IDPLANOPREV,     ' +
          ' IDTITULAR,        ' +
          ' IDPESSOA,         ' +
          ' SEQPROPOSTA,      ' +
          ' IDBENEFICIO,      ' +
//          ' CODPORTFORMA,     ' +
          ' IDSITBENEFICIO,   ' +
//          ' IDDEPENDENCIA,    ' +
//          ' IDTPPAGTOBENEFIC, ' +
//          ' VALORATUAL,       ' +
          ' DATAREQUERIMENTO, ' +
//          ' DATAINICIO,       ' +
//          ' DATAFINAL,        ' +
//          ' FLGFORMAPAGTO,    ' +
//          ' VALORCALCULADO,   ' +
//          ' DATAULTREAJUSTE,  ' +
//          ' VLRCALCINSS,      ' +
//          ' VLRINFINSS,       ' +
//          ' DATAINICIOINSS,   ' +
          ' NUMPROCINSS,     ' +
//          ' DATAINICIOFUND,   ' +
//          ' VALORCOTAS,       ' +
//          ' VALORTOTAL,       ' +
//          ' DATACONCESSAO,    ' +
//          ' FLGPROVISORIO,    ' +
//          ' PERCPROVISORIO,   ' +
//          ' PRAZOPROVISORIO,  ' +
//          ' ULTMESREAJUSTE,   ' +
//          ' ULTVALORATUALREAJ,' +
      //    ' DIBBENEFANT)      ' +
//          ' VALORBENEFANT,    ' +
//          ' VALORBINSSANT1,   ' +
//          ' VALORBINSSANT2,   ' +
//          ' VALORBINSSANT3,   ' +
//          ' FLGBENEFMIN,      ' +
//          ' VALORSRB,         ' +
          ' IDPLANOORIGEM)    ' +
//          ' VALORNADIB,        ' +
//          ' IDPLANPREVCONTAB,  ' +
//          ' FONTEPAGADORA,     ' +
//          ' PLACONTAD,         ' +
//          ' PLACONTAC,         ' +
//          ' FLGPAGAINSS,       ' +
///          ' VALORBASE1,        ' +
//          ' VALORBASE2,        ' +
//          ' VALORBASE3)        ' +
        'values                ' +
          '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
  //         ':CODPORTFORMA,     ' +
           '4,   ' + ///IDSITBENEFICIO
 //          ':IDDEPENDENCIA,    ' +
 //           ':IDTPPAGTOBENEFIC, ' +
 //           ':VALORATUAL,       ' +
            ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DATAREQUERIMENTO').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
 //          ':DATAINICIO,       ' +
 //          ':DATAFINAL,        ' +
 //          ':FLGFORMAPAGTO,    ' +
 //          ':VALORCALCULADO,   ' +
 //          ':DATAULTREAJUSTE,  ' +
 //          ':VLRCALCINSS,      ' +
 //          ':VLRINFINSS,       ' +
 //          ':DATAINICIOINSS,   ' +
           #39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39+',  ' +
  //         ':DATAINICIOFUND,   ' +
  //         ':VALORCOTAS,       ' +
  //         ':VALORTOTAL,       ' +
 //          ':DATACONCESSAO,    ' +
 //          ':FLGPROVISORIO,    ' +
 //          ':PERCPROVISORIO,   ' +
 //          ':PRAZOPROVISORIO,  ' +
//           ':ULTMESREAJUSTE,   ' +
//           ':ULTVALORATUALREAJ,' +
  //         ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +')  ' );
  ///         ':VALORBENEFANT,    ' +
 //          ':VALORBINSSANT1,   ' +
//           ':VALORBINSSANT2,   ' +
//           ':VALORBINSSANT3,   ' +
//           ':FLGBENEFMIN,      ' +
//           ':VALORSRB,         ' +
             #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+')  ' );
//           ':VALORNADIB,       ' +
//           ':IDPLANPREVCONTAB, ' +
//           ':FONTEPAGADORA,    ' +
//           ':PLACONTAD,        ' +
//           ':PLACONTAC,        ' +
//           ':FLGPAGAINSS,      ' +
//           ':VALORBASE1,       ' +
//           ':VALORBASE2,       ' +
//           ':VALORBASE3)       ' );

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;


procedure TFrmCadConcederResgCompLote.DeletarBfciarioTitPlan(
  _query: TwwQuery);
begin


          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BFCIARIOTITPLAN WHERE ' +
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+'AND  ' +
                         'PRIORIDADE = 0 AND ' +
                         'PERCENTUAL = 100 AND ' +
                         'IDRESPONSAVEL = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);


          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadConcederResgCompLote.DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39);

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadConcederResgCompLote.DeletarEventoPrev(_query: TwwQuery;
  _EventoGerador: string);
begin

   _query.Close;
   _query.SQL.Clear;
   _QUERY.SQL.ADD('DELETE FROM EVENTOSPREV WHERE IDEVENTOSPREV='+_EventoGerador);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.DeletarProcessoBenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;
   _QUERY.SQL.ADD('DELETE FROM PROCESSOBENEF WHERE NUMEROPROCESSO='+_NUMEROPROCESSO);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.Criar_temp();
var
  _query: TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';



TRY
_query.Close;
_query.RequestLive:=true;
_query.sql.Clear;
_query.sql.Add(' create global temporary table TEMPREL ');
_query.sql.Add('  (mesreferencia varchar2(50), ');
_query.sql.Add('  mesreembolso varchar2(50), ');
_query.sql.Add('  pagar NUMBER(1), ');
_query.sql.Add('  descontar NUMBER(1), ');
_query.sql.Add('  planocontabil varchar2(3) ) on commit preserve rows');
//_query.sql.Add('  msgerrooracle varchar2(150))on commit preserve rows ');
_query.ExecSQL;
EXCEPT
_query.Close;
_query.sql.Clear;
_query.sql.Add(' delete global temporary table TEMPREL ');
_query.ExecSQL;
Criar_temp();
end;

end;

procedure TFrmCadConcederResgCompLote.Gravar_temp_log(_query: TwwQuery;_msgerro,_msgoracle:string);
begin

_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into CM.LOGRESGLOTE ');
_query.sql.Add('  (  ');
//_query.sql.Add('  IDBENEFHABILITA, ');
_query.sql.Add('  matricula, ');
_query.sql.Add('  nome, ');
_query.sql.Add('  msgerro , ');
_query.sql.Add('  msgerrooracle ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
//_query.sql.Add(' '+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('matricula').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('nome').text+#39+',');
_query.sql.Add(' '+#39+_msgerro+#39+',');
_query.sql.Add(' '+#39+_msgoracle+#39);

_query.sql.Add('  )  ');
try
_query.ExecSQL;
except
end;

end;

procedure TFrmCadConcederResgCompLote.FormShow(Sender: TObject);
begin
  inherited;
  pnl_impressao.SendToBack;
  pnl1.SendToBack;
  //Darivaldo Alencar SIG20491 - inicio
  //CtrlCalculoIRRF.sSQLParticipante := QryParticipantes.SQL.Text;
  AjustaGrid();
  //Darivaldo Alencar SIG20491 - fim
end;

procedure TFrmCadConcederResgCompLote.DeletarHSTBENEFBFCIARIO(
  _query: TwwQuery; _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;


          _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+'418'+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+'1'+#39);


    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.DeletarMovbenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin


   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   _QUERY.SQL.ADD('DELETE FROM  MOVBENEF WHERE IDMOVBENEF IN (SELECT IDMOVBENEF FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+_NUMEROPROCESSO+')');
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadConcederResgCompLote.wwDBEdit10Change(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadConcederResgCompLote.dtDataFinalChange(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadConcederResgCompLote.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
//  qryDetDIBANT.AsString := qryDetDIBANT.AsString;

end;

procedure TFrmCadConcederResgCompLote.bbtnConfirmarClick(Sender: TObject);
begin


If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

qryaux2.close;

qryaux2.SQL.Clear;
qryaux2.SQL.Add('update BENEFBFCIARIO');
qryaux2.SQL.Add('set');
qryaux2.SQL.Add('  DIBBENEFANT = '+#39+dtDataFinal.Text+#39);
qryaux2.SQL.Add('where');
qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+' and');
qryaux2.SQL.Add('  IDBENEFICIO = '+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39+' and');
qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
qryaux2.SQL.Add('  and  rownum = 1');
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;



qryaux.close;
qryaux.SQL.Clear;
qryaux.SQL.Add('SELECT *');
qryaux.SQL.Add('          FROM (SELECT NUMPROCINSS, IDRUBRICA, MESREFERENCIA, SEQUENCIAL, MESCOBRANCA, RUBRICAINSS,');
qryaux.SQL.Add('                       IDPESSOA, IDBENEFICIO, RMREAJ AS RMI');
qryaux.SQL.Add('                  FROM DETCONCINSS');
qryaux.SQL.Add('                 WHERE DTINICIOCRED = ''01'' || SUBSTR(DTINICIOCRED, 4, 7)');
qryaux.SQL.Add('                   AND DTFIMCRED =');
qryaux.SQL.Add('                       TO_DATE(''01/'' ||');
qryaux.SQL.Add('                               DECODE(SUBSTR(DTINICIOCRED, 4, 2),');
qryaux.SQL.Add('                                      12,');
qryaux.SQL.Add('                                      ''01'',');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 4, 2) + 1) || ''/'' ||');
qryaux.SQL.Add('                               DECODE(SUBSTR(DTINICIOCRED, 4, 2),');
qryaux.SQL.Add('                                      12,');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 7, 4) + 1,');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 7, 4))) - 1');
qryaux.SQL.Add('                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP');
qryaux.SQL.Add('         WHERE IDPESSOA ='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
qryaux.SQL.Add('           AND IDBENEFICIO ='+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39);
qryaux.SQL.Add('           AND ROWNUM = 1');
   try
             qryaux.open;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;




qryaux2.close;
qryaux2.SQL.Clear;
qryaux2.SQL.Add('UPDATE DETCONCINSS SET RMREAJ ='+#39+wwDBEdit10.text+#39);
qryaux2.SQL.Add('  WHERE');
qryaux2.SQL.Add('  NUMPROCINSS ='+#39+qryaux.FieldByName('NUMPROCINSS').text+#39);
qryaux2.SQL.Add('AND IDRUBRICA='+#39+qryaux.FieldByName('IDRUBRICA').text+#39);
qryaux2.SQL.Add('AND MESREFERENCIA='+#39+qryaux.FieldByName('MESREFERENCIA').text+#39);
qryaux2.SQL.Add('AND SEQUENCIAL='+#39+qryaux.FieldByName('SEQUENCIAL').text+#39);
qryaux2.SQL.Add('AND MESCOBRANCA='+#39+qryaux.FieldByName('MESCOBRANCA').text+#39);
qryaux2.SQL.Add('AND RMREAJ ='+#39+qryaux.FieldByName('RMI').text+#39);
qryaux2.SQL.Add('AND RUBRICAINSS='+#39+qryaux.FieldByName('RUBRICAINSS').text+#39);
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;
 qryaux.CLOSE;



qryaux2.close;
qryaux2.SQL.Clear;
qryaux2.SQL.Add('update pessoafisica');
qryaux2.SQL.Add('set');
if db_grid_irrf.ItemIndex = 0 then
   qryaux2.SQL.Add('  flgisentoirrf = 1')///ISENTO
else
   qryaux2.SQL.Add('  flgisentoirrf = 0');
qryaux2.SQL.Add('where');
qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);

   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;


     if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

  qry.Close;
  qry.Open;
  inherited;
end;

procedure TFrmCadConcederResgCompLote.Button2Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('N','');
end;

procedure TFrmCadConcederResgCompLote.qryDetAfterOpen(DataSet: TDataSet);
begin
  //  inherited;
  lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';
end;

procedure TFrmCadConcederResgCompLote.AtualizaBenefbfciario(
  _query: TwwQuery; _idsitbeneficio,_numproc: string);
begin



          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' update benefbfciario set idsitbeneficio='+#39+_idsitbeneficio+#39+'  where '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+'418'+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+'1'+#39);
//         _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


    _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' update processobenef set idsitprocesso='+#39+_idsitbeneficio+#39+'  where '+
                         'NUMEROPROCESSO = '+#39+ _numproc+#39);
//          _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederResgCompLote.bbtnSelTudoClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('S');
if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='S';
     qryDet.post;
     qryDet.Next;
     end;
    end;

end;

procedure TFrmCadConcederResgCompLote.bbtnInverteClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('N');

if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='N';
     qryDet.post;
     qryDet.Next;
     end;
    end;


end;

procedure TFrmCadConcederResgCompLote.ppDetailBand1BeforePrint(
  Sender: TObject);
var
  totalhst, totalrem , totalinss:double;
  sAreaderFile: String;
  RegPdf: TRegistry;
  local:string;
 _query:TwwQuery;
begin
  inherited;


//
//
//   QRYAUX.CLOSE;
//   QRYAUX.SQL.CLEAR;
//   QRYAUX.SQL.APPEND('SELECT CONTACORRENTE FROM CONTABANCARIA ');
//   QRYAUX.SQL.APPEND('WHERE');
//   QRYAUX.SQL.APPEND('TIPOCONTA=2 AND ');
//   QRYAUX.SQL.APPEND(' IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+')');
//   QRYAUX.OPEN;
//
//
//   lbl_conta.caption:=QRYAUX.fieldbyname('contacorrente').text;
//
//    QRYAUX.CLOSE;
//    QRYAUX.SQL.CLEAR;
//    QRYAUX.SQL.Add('SELECT C.IDCBANCARIA,');
//    QRYAUX.SQL.Add('       C.IDPESSOA,');
//    QRYAUX.SQL.Add('       C.IDAGENCIA,');
//    QRYAUX.SQL.Add('       C.CONTACORRENTE,');
//    QRYAUX.SQL.Add('       C.FLGCONTAPREF,');
//    QRYAUX.SQL.Add('       C.FLGCONTAINATIVA,');
//    QRYAUX.SQL.Add('       C.TIPOCONTA,');
//    QRYAUX.SQL.Add('       A.NUMAGENCIA,');
//    QRYAUX.SQL.Add('       A.IDBANCO,');
//    QRYAUX.SQL.Add('       PB.NOME           AS NOMEBANCO,');
//    QRYAUX.SQL.Add('       B.NUMBANCO,');
//    QRYAUX.SQL.Add('       PA.NOME           AS NOMEAGENCIA');
//    QRYAUX.SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA');
//    QRYAUX.SQL.Add(' WHERE (C.IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+'))');
//    QRYAUX.SQL.Add('   AND (C.CONTACORRENTE =  ('+lbl_conta.caption+'))');
//    QRYAUX.SQL.Add('   AND (C.IDAGENCIA = A.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (PA.IDPESSOA = A.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)');
//    QRYAUX.OPEN;
//
//   lbl_banco.caption:= QRYAUX.fieldbyname('NOMEBANCO').text;
//   lbl_agencia.caption:=QRYAUX.fieldbyname('NUMAGENCIA').text;
//
//
//
//
//   QRYAUX.CLOSE;
//   QRYAUX.SQL.CLEAR;
//   QRYAUX.SQL.APPEND('SELECT CONTACORRENTE FROM CONTABANCARIA ');
//   QRYAUX.SQL.APPEND('WHERE');
//   QRYAUX.SQL.APPEND('FLGCONTAPREF=1 AND ');
//   QRYAUX.SQL.APPEND(' IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+')');
//   QRYAUX.OPEN;
//
//   lbl_conta2.caption:=QRYAUX.fieldbyname('contacorrente').text;
//
//
//    QRYAUX.CLOSE;
//    QRYAUX.SQL.CLEAR;
//    QRYAUX.SQL.Add('SELECT C.IDCBANCARIA,');
//    QRYAUX.SQL.Add('       C.IDPESSOA,');
//    QRYAUX.SQL.Add('       C.IDAGENCIA,');
//    QRYAUX.SQL.Add('       C.CONTACORRENTE,');
//    QRYAUX.SQL.Add('       C.FLGCONTAPREF,');
//    QRYAUX.SQL.Add('       C.FLGCONTAINATIVA,');
//    QRYAUX.SQL.Add('       C.TIPOCONTA,');
//    QRYAUX.SQL.Add('       A.NUMAGENCIA,');
//    QRYAUX.SQL.Add('       A.IDBANCO,');
//    QRYAUX.SQL.Add('       PB.NOME           AS NOMEBANCO,');
//    QRYAUX.SQL.Add('       B.NUMBANCO,');
//    QRYAUX.SQL.Add('       PA.NOME           AS NOMEAGENCIA');
//    QRYAUX.SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA');
//    QRYAUX.SQL.Add(' WHERE (C.IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+'))');
//    QRYAUX.SQL.Add('   AND (C.CONTACORRENTE =  ('+lbl_conta2.caption+'))');
//    QRYAUX.SQL.Add('   AND (C.IDAGENCIA = A.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (PA.IDPESSOA = A.IDPESSOA)');
//    QRYAUX.SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)');
//    QRYAUX.OPEN;
//
//   lbl_banco2.caption:= QRYAUX.fieldbyname('NOMEBANCO').text;
//   lbl_agencia2.caption:=QRYAUX.fieldbyname('NUMAGENCIA').text;
//
//
//
//   lbl_valoratualbeneficio.caption:= QRYDET.FIELDBYNAME('rmi').TEXT;
//   lbl_valorbeneficio.caption:=      QRYDET.FIELDBYNAME('rmi').TEXT;
//
//
//   QRYAUX.CLOSE;
//   QRYAUX.SQL.CLEAR;
//   QRYAUX.SQL.APPEND('SELECT TEMPOSERVTOTAL,TEMPOSERVTOTMES,TEMPOSERVTOTDIA FROM ELEGPATRO ');
//   QRYAUX.SQL.APPEND('WHERE');
//   QRYAUX.SQL.APPEND(' MATRICULA = '+#39+QRYDET.FIELDBYNAME('MATRICULA').TEXT+#39);
//   QRYAUX.OPEN;
//
//   lbl_anos.Caption:= QRYAUX.fieldbyname('TEMPOSERVTOTAL').text +' Anos';
//   lbl_meses.Caption:= QRYAUX.fieldbyname('TEMPOSERVTOTMES').text +' Meses';
//   lbl_dias.Caption:= QRYAUX.fieldbyname('TEMPOSERVTOTdia').text +' Dias';
//
//
//   qryaux.Active:=false;
//   qryaux.SQL.Clear;
//   qryaux.sql.Add('SELECT msgerro FROM CM.LOGRESGLOTE');
//   qryaux.sql.Add(' WHERE matricula='+#39+qrydet.FieldByName('matricula').AsString+#39);
//   qryaux.OPEN;
//
//
//   lbl_msgimpeditiva.CAPTION:=qryaux.FieldByName('msgerro').AsString;
//   qryaux.Active:=false;
//
/////2
//
//totalhst:=0;
//totalrem:=0;
//totalinss:=0;
//_query:=TwwQuery.Create(Self);
//_query.DataBaseName := 'BaseDados';
//_query.Active:=false;
//_query.Sql.Clear;
//
//qryDetalhe.Active:=True;
//while not qryDetalhe.eof do
//   qryDetalhe.delete;
//
//while not qryDetalhe2.eof do
//   qryDetalhe2.delete;
//
//
//
//////////----
//
//
//qryaux2.Active:=false;
//qryaux2.SQL.clear;
//qryaux2.SQL.add('SELECT * FROM HSTBENEFBFCIARIO WHERE ' +
//               'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
//                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
//                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
//                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
//                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
//                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
//                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+
//                         'ORDER BY  MESREFERENCIA ');
//qryaux2.open;
//qryaux2.First;
//while not qryaux2.eof do
//    begin
//
//
//   qryDetalhe.Insert;
//   qryDetalhemesano.text:=qryaux2.fieldbyname('MESREFERENCIA').text;
//   if copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2)='13'then
//      qryDetalhemesreferencia.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESREFERENCIA').text,1,4)
//   else
//      if qryaux2.fieldbyname('MESREFERENCIA').text<>'' then
//      qryDetalhemesreferencia.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESREFERENCIA').text,1,4);
//
//   if copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)='13'then
//      qryDetalhemesreembolso.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4)
//   else
//      if qryaux2.fieldbyname('MESCOMPREEM').text<>'' then
//         qryDetalhemesreembolso.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4);
//
//   if qryaux2.fieldbyname('FLGDEVOLUCAO').value=1 then
//      qryDetalhedescontar.Value:=qryaux2.fieldbyname('valorprev').Value
//   else
//      qryDetalhepagar.value:=qryaux2.fieldbyname('valorprev').Value;
//
////   qryDetalhedescontar.Value:=
//
//   _query.active:=False;
//   _query.SQL.Clear;
//   _query.SQL.Add('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+#39+QRYDET.fieldbyname('IDPLANPREVCONTAB').text+#39);
//   _query.active:=True;
//
//   qryDetalheplanocontabil.Text:=_query.fieldbyname('nome').text;
//   qryDetalhe.Post;
//
//
//
//   qryaux.close;
//   qryaux.SQL.Clear;
//   qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
//   qryaux.SQL.Add('where idlote = '+#39+qryaux2.fieldbyname('idlote').text+#39);
//   qryaux.open;
////   if  (qryaux2.fieldbyname('MESREFERENCIA').text<>qryaux.fieldbyname('mesreferencia').text) and (strtoint(copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2))<>13) then
//       totalhst:=totalhst+qryaux2.fieldbyname('valorprev').value;
//       totalrem:=totalrem+qryaux2.fieldbyname('valorprev').value;
//
//
//
//
//   qryaux2.next;
//   end;
//qryaux2.First;
//
//
//
//
//qryDetalhe2.Active:=True;
//
//
//qryaux2.Active:=false;
//qryaux2.SQL.clear;
//qryaux2.SQL.Append('SELECT * FROM RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
//qryaux2.open;
//qryaux2.First;
//while not qryaux2.eof do
//   begin
//
//   _query.active:=False;
//   _query.SQL.Clear;
//   _query.SQL.Add('SELECT FLGDESCONTO FROM PROVDESC WHERE IDPROVENTO = '+#39+qryaux2.fieldbyname('IDRUBRICA').text+#39);
//   _query.active:=True;
//
//
//
//   qryDetalhe2.Insert;
//   if copy(qryaux2.fieldbyname('ANOMESREF').text,6,2)='13'then
//     qryDetalhe2mesreferencia.text:='Abono Anual/'+copy(qryaux2.fieldbyname('ANOMESREF').text,1,4)
//   else
//     if qryaux2.fieldbyname('ANOMESREF').text<>'' then
//     qryDetalhe2mesreferencia.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('ANOMESREF').text,6,2)))+'/'+copy(qryaux2.fieldbyname('ANOMESREF').text,1,4);
//
//   if copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)='13'then
//      qryDetalhe2mesreembolso.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4)
//   else
//        if qryaux2.fieldbyname('MESCOMPREEM').text<>'' then
//     qryDetalhe2mesreembolso.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4);
//     
//  if _query.fieldbyname('FLGDESCONTO').value=1 then
//     qryDetalhe2descontar.Value:=qryaux2.fieldbyname('VALORRUBRICA').Value
//   else
//     qryDetalhe2pagar.value:=qryaux2.fieldbyname('VALORRUBRICA').Value;
//
//
//   _query.active:=False;
//   _query.SQL.Clear;
//   _query.SQL.Add('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+#39+qryaux2.fieldbyname('IDPLANOCONTABIL').Text+#39);
//   _query.active:=True;
//
//   qryDetalhe2planocontabil.Text:=_query.fieldbyname('NOME').Text;
//   qryDetalhe2.Post;
//
//
//
//   totalrem:=totalrem+qryaux2.fieldbyname('VALORRUBRICA').value;
//   totalinss:=totalinss+qryaux2.fieldbyname('VALORRUBRICA').value;
//
//
//   qryaux2.Next;
//   end;
//
//lbl_valortotalhis.caption:= (floattostr(totalhst));
//lbl_valorreembolso.caption:= (floattostr(totalrem));
//lbl_valortotalinss.caption:= (floattostr(totalinss));
//lbl_valortotalgeral.caption:= (floattostr(totalhst+totalinss));
//
//qryDetalhe2.First;
//_query.active:=False;
//_query.Destroy;
//
//qryaux.close;
/////aqui detalhe 2
//
//
/////2



end;

procedure TFrmCadConcederResgCompLote.GravarHSTBENEFBFCIARIO(
  _query: TwwQuery;_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_valorcalculado,_datapagamento,_sidmovbenef,_flgincluimesconc,_mesreferencia,_mesreflote,_numproc:string);
var
 sMsgErro,sDtDIBAnterior,sValorFinal2:string;

 rValorReal,rValorTotal,dValorSRBRetorno:Double;
  bReajustou,bErro    : Boolean;
begin


_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into HSTBENEFBFCIARIO ');
_query.sql.Add('  (  ');
_query.sql.Add('  IDTITULAR, ');
_query.sql.Add('  IDPESSJUR, ');
_query.sql.Add('  IDPLANOPREV, ');
_query.sql.Add('  IDBENEFICIO , ');
_query.sql.Add('  IDMOTIVO, ');//ver como fazer
_query.sql.Add('  IDPESSOA, ');
_query.sql.Add('  NUMEROPROCESSO, ');
_query.sql.Add('  MES, ');
_query.sql.Add('  SEQBENEFICIO, ');///ver como fazer
//_query.sql.Add('  SEQPROPOSTA, ');
_query.sql.Add('  IDLOTE, ');
_query.sql.Add('  VALORPREV, ');///ver como fazer
_query.sql.Add('  DATAPAGAMENTO, ');///VER COMO FAZER
_query.sql.Add('  CODPORTFORMA, ');
_query.sql.Add('  VALORCALCULADO, ');
_query.sql.Add('  FLGENVIADO, ');
_query.sql.Add('  MESREFERENCIA, ');
_query.sql.Add('  FLGCONCESSAO, ');
_query.sql.Add('  FLGDEVOLUCAO, ');
_query.sql.Add('  VALORTOTAL, ');
_query.sql.Add('  FONTEPAGADORA, ');
_query.sql.Add('  VALORINTEGRAL, ');
_query.sql.Add('  IDPLANOORIGEM, ');
_query.sql.Add('  IDTITBENEF, ');
//_query.sql.Add('  IDSEQINTERNOFB, '); //ver como fazer
_query.sql.Add('  IDMOVBENEF, ');
_query.sql.Add('  PERCENTUAL, ');
_query.sql.Add('  FLGTIPOREGISTRO, '); ///ver como fazer
_query.sql.Add('  MESCOMPREEM ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');

_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSJUR').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPLANOPREV').text+#39+',');
_query.sql.Add(' '+#39+'418'+#39+',');
_query.sql.Add(' '+#39+_idmotivo+#39+',');///feito RN09
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');
_query.sql.Add(' '+#39+_numproc+#39+',');
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT+#39+',');///feito_mesreflote
_query.sql.Add(' '+#39+_mesreflote+#39+',');///feito
_query.sql.Add(' '+#39+_SEQbeneficio+#39+',');///feito
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+',');
//if _flgincluimesconc = '1' then
_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///feito
//_query.sql.Add(' '+#39+qryDet.fieldbyname('rmi').text+#39+',')///feito
//else
//_query.sql.Add(' '+#39+'0'+#39+',');///feito

_query.sql.Add(' '+#39+_datapagamento+#39+',');///feito

qryAux3.active:=false;
qryAux3.sql.clear;
qryAux3.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+qryDet.fieldbyname('idplanoprev').text+#39);
qryAux3.sql.append(' and  idbeneficio='+#39+'418'+#39);
qryAux3.open;
_query.sql.Add(' '+#39+qryAux3.fieldbyname('CODPORTFORMA').text+#39+',');///feito
qryAux3.close;




_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///rn002
_query.sql.Add(' '+#39+'0'+#39+',');//FLGENVIADO
_query.sql.Add(' '+#39+_mesreferencia+#39+',');///feito
_query.sql.Add(' '+#39+'1'+#39+',');//FLGCONCESSAO



_query.sql.Add(' '+#39+'0'+#39+',');///ok

//_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('RMREAJ').text+#39+',');///feito
_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///feito
_query.sql.Add(' '+#39+'2'+#39+',');///fonte pagadora 2
//_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('RMREAJ').text+#39+',');///feito
_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///feito
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPLANOPREV').text+#39+','); //IDPLANOORIGEM
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');//IDTITBENEF
//_query.sql.Add(' '+#39+qryDet.fieldbyname('IDSEQINTERNOFB').text+#39+',');//VER COMO FAZER
_query.sql.Add(' '+#39+_sidmovbenef+#39+',');//feito
_query.sql.Add(' '+#39+'100'+#39+',');//regra requerer
_query.sql.Add(' '+#39+_flgtiporegistro+#39+',');//feito RN08
_query.sql.Add(' '+#39+_mesreferencia+#39);//feito

_query.sql.Add('  )  ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


IF rValorTotal<>0 THEN
//strtofloat(OraNumero((_valorcalculado)))
   BEGIN


   qryaux2.close;
    qryaux2.SQL.Clear;
    qryaux2.SQL.Add('update BENEFBFCIARIO');
    qryaux2.SQL.Add('set');
//    qryaux2.SQL.Add('  idsitbeneficio = 1, ');
    //qryaux2.SQL.Add('  idsitprocesso = 1, ');
   qryaux2.SQL.Add('  DATAULTREAJUSTE ='+'To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')');

    qryaux2.SQL.Add('where');
    qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+' and');
    qryaux2.SQL.Add('  IDBENEFICIO = '+#39+'418'+#39+' and');
    qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    qryaux2.SQL.Add('  and  rownum = 1');
       try
                 qryaux2.ExecSQL;
              except
                 on E:EDBEngineError do
                   begin
    //                    MostrarErro(E);
                        Gravar_temp_log(param,'',string(E.message));
                        Exit;
                   end;
              end;

     qryaux2.CLOSE;

   end;


end;

procedure TFrmCadConcederResgCompLote.GravarRubricaIndiv(
  _query: TwwQuery;_idmotivo,_mesreferencia,_seq,_mesreflote:string);
var
  ultdia:double;
begin

ultdia:=0;
_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into RUBRICAINDIV ');
_query.sql.Add('  (  ');
_query.sql.Add('  IDPESSOA, ');
_query.sql.Add('  IDEMPRESA, ');
_query.sql.Add('  IDRUBRICA, ');
_query.sql.Add('  SEQRUBRICAINDIV, ');
_query.sql.Add('  VALORRUBRICA, ');
_query.sql.Add('  PARCELAS, ');
_query.sql.Add('  FLGTPRUBMANUT, ');
_query.sql.Add('  DATAFINAL, ');
_query.sql.Add('  ANOMESREF, ');
_query.sql.Add('  CODPORTFORMA, ');
_query.sql.Add('  IDTITULAR, ');
_query.sql.Add('  DATAINICIO, ');
_query.sql.Add('  FLGUSAABONO, ');
_query.sql.Add('  IDLOTE, ');
_query.sql.Add('  FLGDESATIVADO, ');
_query.sql.Add('  FLGUSADO, ');
_query.sql.Add('  IDMOTIVO, ');
_query.sql.Add('  NUMPROCINSS, ');
_query.sql.Add('  IDPLANOCONTABIL, ');
_query.sql.Add('  FLGRETROACAO, ');
_query.sql.Add('  MESCOMPREEM ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');
_query.sql.Add(' '+#39+'1'+#39+',');
_query.sql.Add(' '+#39+IDPROVENTO+#39+',');//feito
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('IDRUBRICA').TEXT+#39+',');

//_query.sql.Add(' '+#39+QRYRUBRICAXINSS.FIELDBYNAME('RUBRICAINSS').TEXT+#39+',');
_query.sql.Add(' '+#39+_seq+#39+',');//---seqrubinttostr(seq)
//_query.sql.Add(' '+#39+'1'+#39+',');//---seqrubinttostr(seq)
_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('valorinss').TEXT+#39+',');///feito
_query.sql.Add(' '+#39+'1'+#39+',');
_query.sql.Add(' '+#39+'1'+#39+',');


try
ultdia:=TrazUltDiaMes(strtoint(copy(_mesreflote,6,2)),strtoint(copy(_mesreflote,1,4)));
//ultdia:=TrazUltDiaMes(strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT,6,2)),strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT,1,4)));

except
end;




_query.sql.Add(' '+#39+formatfloat('00',ultdia)+'/'+copy(_mesreflote,6,2)+'/'+copy(_mesreflote,1,4)+#39+',');
_query.sql.Add(' '+#39+_mesreferencia+#39+',');
qryAux3.active:=false;
qryAux3.sql.clear;
qryAux3.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+qryDet.fieldbyname('idplanoprev').text+#39);
qryAux3.sql.append(' and  idbeneficio='+#39+qryDet.fieldbyname('idbeneficio').text+#39);
qryAux3.open;
_query.sql.Add(' '+#39+qryAux3.fieldbyname('CODPORTFORMA').text+#39+',');///feito
qryAux3.close;

_query.sql.Add(' '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+',');
//_query.sql.Add(' '+#39+_mesreferencia+#39+',');
_query.sql.Add(' '+#39+'01'+'/'+copy(_mesreflote,6,2)+'/'+copy(_mesreflote,1,4)+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+_idmotivo+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('NUMBENEFICIO').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('Idplanprevcontab').text+#39+','); //ver hebio
_query.sql.Add(' '+#39+'0'+#39+','); //ver
//_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('MESCOBRANCA').text+#39);
_query.sql.Add('  )  ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederResgCompLote.DeletarRubricaIndiv(
  _query: TwwQuery);
begin

   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   _QUERY.SQL.ADD('DELETE RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
  // _//QUERY.SQL.ADD(' AND IDEMPRESA = 1 AND IDRUBRICA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.Deletar_temp_log(_query: TwwQuery);
begin
_query.Close;
_query.sql.Clear;
_query.sql.Add('Delete from CM.LOGRESGLOTE ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederResgCompLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndnil(CtrlCalculoIRRF);         //Darivaldo Alencar SIG20491

  inherited;
  Deletar_temp_log(qry2);
end;

procedure TFrmCadConcederResgCompLote.FormActivate(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SIG20491 - inicio
  QryPlanos.close;
  QryPlanos.open;

  //cb_tipo_recebedor.ItemIndex:=0;
  cb_tipo_recebedor.text := '';
  //Darivaldo Alencar SIG20491 - fim

end;

function TFrmCadConcederResgCompLote.BuscarUltMesreaj(): string;
var
_query:TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;
_query.Sql.Clear;
_query.Sql.Append('SELECT MAX(MESREAJ)MESREAJ FROM REAJINSS');
_query.Active:=true;
result:=_query.FieldByName('mesreaj').text;
_query.Close;
_query.Destroy;
end;

function TFrmCadConcederResgCompLote.BuscarValorReajustadoPAB(
  _rmi: double; _numprocinss, _mesref: string): double;
var
_query:TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;
_query.Sql.Clear;

_mesref:=copy(_mesref,6,2)+'/'+copy(_mesref,1,4);

_query.SQL.Add('SELECT (TRUNC(('+OraNumero(floattostr(_rmi))+' / ((cm.cotvalor / 100) + 1)), 2) + 0.01)ValorRejustado');
_query.SQL.Add('  FROM cotacaomoeda cm');
_query.SQL.Add(' WHERE cm.moecodigo = 20');
_query.SQL.Add('   AND cm.cotdata =');
_query.SQL.Add('       (SELECT GREATEST(''01/'' || to_char(bf.datainiciofund, ''MM/YYYY''),');
_query.SQL.Add('                        '+#39+'01/'+_mesref+#39+')');
_query.SQL.Add('          FROM benefbfciario bf');
_query.SQL.Add('         WHERE bf.numprocinss = '+#39+_numprocinss+#39+')');


_query.Active:=true;

result:=_query.fieldbyname('ValorRejustado').Value;

_query.Active:=false;
_query.Destroy;

end;

procedure TFrmCadConcederResgCompLote.dbgrdDetTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
    campo:string;
begin
  inherited;



campo:=AFieldName;
//application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

//buscarequerimentos('S',campo);



end;

procedure TFrmCadConcederResgCompLote.DeletarPrevia;
var
  _query,_query2:TwwQuery;
begin


_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;

_query2:=TwwQuery.Create(Self);
_query2.DataBaseName := 'BaseDados';
_query2.Active:=false;


_query2.CLOSE;
_query2.SQL.CLEAR;
_query2.SQL.Add('SELECT HB.MES MESCOBRANCA');
_query2.SQL.Add('FROM HSTBENEFBFCIARIO HB');
_query2.SQL.Add('WHERE HB.IDPESSOA = '+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+' AND ');
_query2.SQL.Add('  HB.IDTITULAR = '+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+' AND ');
_query2.SQL.Add('      EXISTS (SELECT 1');
_query2.SQL.Add('              FROM BENEFBFCIARIO BF');
_query2.SQL.Add('              WHERE BF.NUMPROCINSS =  '+#39+'418'+#39+' AND');
_query2.SQL.Add('                    hb.IDPLANOPREV = bf.idplanoprev AND');
_query2.SQL.Add('                    hb.IDBENEFICIO = bf.idbeneficio AND');
_query2.SQL.Add('                    hb.NUMEROPROCESSO = bf.numeroprocesso AND');
_query2.SQL.Add('                    hb.IDPESSJUR = bf.idpessjur AND');
_query2.SQL.Add('                    hb.IDTITULAR = bf.idtitular AND');
_query2.SQL.Add('                    hb.IDPLANOORIGEM = bf.idplanoorigem AND');
_query2.SQL.Add('                    hb.IDPESSOA = bf.idpessoa AND');
_query2.SQL.Add('                    hb.SEQPROPOSTA = bf.seqproposta)');
_query2.SQL.Add('ORDER BY HB.MES DESC');
_query2.Active:=TRUE;


//_query2.First;
while not _query2.eof do
begin
_query.Sql.Clear;
_QUERY.SQL.APPEND('DELETE FROM PREVIA WHERE');
_QUERY.SQL.APPEND('IDPESSOA  ='+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
_QUERY.SQL.APPEND(' AND IDTITULAR  ='+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
_QUERY.SQL.APPEND(' AND MESCOBRANCA  ='+#39+_query2.FIELDBYNAME('MESCOBRANCA').TEXT+#39);
_query.ExecSQL;
_query2.Next;
end;

_query.Destroy;
_query2.CLOSE;
_query2.Destroy;






end;

function TFrmCadConcederResgCompLote.CalculaData(Data1,
  Data2: string): INTEGER;
var
  D1,M1,A1,                {1234567890}
  D2,M2,A2,NumMeses:Integer;        {dd/mm/aaaa}

begin


  D1 := StrTOInt(copy(Data1,1,2));
  M1 := StrTOInt(copy(Data1,4,2));
  A1 := StrTOInt(copy(Data1,7,4));
  D2 := StrTOInt(copy(Data2,1,2));
  M2 := StrTOInt(copy(Data2,4,2));
  A2 := StrTOInt(copy(Data2,7,4));

  NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
  if D1 < D2 then
    NumMeses := NumMeses - 1;
RESULT:=NumMeses+1;
end;

procedure TFrmCadConcederResgCompLote.RemoveDuplicates(
  var stringList: TStringList);
var  
  buffer: TStringList;  
  cnt: Integer;  
begin
  stringList.Sort;  
  buffer := TStringList.Create;  
  try  
    buffer.Sorted := True;  
    buffer.Duplicates := dupIgnore;  
    buffer.BeginUpdate;  
    for cnt := 0 to stringList.Count - 1 do  
      buffer.Add(stringList[cnt]) ;  
    buffer.EndUpdate;  
    stringList.Assign(buffer) ;  
  finally  
    FreeandNil(buffer) ;  
  end;
end;

function TFrmCadConcederResgCompLote.GetNumeroProcesso: string;
var
  query: TwwQuery;
begin
query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.close;
query.sql.clear;
query.SQL.Add('SELECT NUMEROPROCESSO');
query.SQL.Add('  FROM BENEFBFCIARIO');
query.SQL.Add(' WHERE IDPESSJUR ='+qrydet.fieldbyname('IDPESSJUR').text);
query.SQL.Add('   AND IDTITULAR ='+qrydet.fieldbyname('IDPESSOA').text);
query.SQL.Add('   AND IDPLANOORIGEM ='+qrydet.fieldbyname('IDPLANOPREV').text);
query.SQL.Add('   AND IDPLANOPREV ='+qrydet.fieldbyname('IDPLANOPREV').text);
query.SQL.Add('   AND IDPESSOA = '+qrydet.fieldbyname('IDPESSOA').text);
query.SQL.Add('   AND IDBENEFICIO = ''418''');
query.SQL.Add('   AND SEQPROPOSTA = 1');
query.open;
if not query.IsEmpty then 
  result:=query.fieldbyname('NUMEROPROCESSO').text
else
  Result:='0';
query.open;
query.Destroy;  

end;

procedure TFrmCadConcederResgCompLote.GravarHISTMOVRESERVA;
var
  query: TwwQuery;
begin
query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.close;
query.sql.clear;


query.close;
query.Destroy;

end;

procedure TFrmCadConcederResgCompLote.DeletarHISTMOVRESERVA(_mesref:string);
var
  query: TwwQuery;
  iSeqResgate : integer;          //edilaine - SIG20491
begin
  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';

  //edilaine - SIG20491 - inicio
  try
    query.close;
    query.sql.clear;

    query.SQL.Add('   DELETE HISTMOVRESERVA H');
    query.SQL.Add('    WHERE H.IDPESSOA ='+qrydet.FieldByName('IDPESSOA').Text);
    query.SQL.Add('      AND H.IDPESSJUR ='+qrydet.FieldByName('IDPESSJUR').Text);
    query.SQL.Add('      AND H.IDPLANOPREV ='+qrydet.FieldByName('IDPLANOPREV').Text);
    query.SQL.Add('      AND H.IDBENEFICIO = ''418''');
    query.SQL.Add('      AND H.MESREFERENCIA ='#39+_mesref+#39);
    query.ExecSQL;


    {desmarca reservas resgatadas}
    iSeqResgate := GetSeqResgate(qrydet.FieldByName('NUMEROPROCESSO').AsInteger);

    if not DesmarcaReservas(qrydet.FieldByName('IDPLANOPREV').AsInteger,
                            qrydet.FieldByName('IDPESSJUR').AsInteger,
                            qrydet.FieldByName('IDPESSOA').AsInteger,
                            qrydet.FieldByName('SEQPROPOSTA').AsInteger,
                            iSeqResgate) then
    begin
       MsgDlg('Erro ao desfazer DESMARCAR RESERVAS RESGATADAS.','Erro',mtError, [mbOk],0);
       Exit
    end;

  finally
    query.close;
    query.Destroy;
  end;
  //edilaine - SIG20491 - fim

end;

procedure TFrmCadConcederResgCompLote.FormCreate(Sender: TObject);
begin
  inherited;

// Fmatricula_rel:= TStringList.Create;
// Fmatricula_rel.clear;

  //Darivaldo Alencar SIG20491 -inicio
  //cb_tipo_op.ItemIndex:=0;
  bProcessou:= False;
  bGravou   := False;

  CtrlCalculoIRRF := TCtrlCalculoIRRF.Create;
  CtrlCalculoIRRF.Initialize( dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True
                            );
  //Darivaldo Alencar SIG20491 fim

end;


//Darivaldo Alencar SIG20491 - inicio
function TFrmCadConcederResgCompLote.MsgConfirmacao(sMsg, sTitulo: String): Boolean;
begin
  result:= MsgDlg(sMsg, sTitulo, mtConfirmation,[mbYes,mbNo],0) = mrYes;
end;


procedure TFrmCadConcederResgCompLote.AjustaGrid;
begin
  dbgrdDet.Selected.Clear;
  
  if cb_tipo_op.ItemIndex = 0 then
  begin
    dbgrdDet.Selected.Add('SELECIONADO'#9'1'#9'S');
    dbgrdDet.Selected.Add('MATRICULA'#9'15'#9'Matrícula');
    dbgrdDet.Selected.Add('DATA_ULTIMO_RESGATE'#9'18'#9'Data Último Resgate');
    dbgrdDet.Selected.Add('SALDO_CONTA_TOTAL'#9'18'#9'Saldo'#9'F');
    dbgrdDet.Selected.Add('TIPO_OPCAO_IR'#9'11'#9'Tipo Opção IR');
    dbgrdDet.Selected.Add('NUMEROPROCESSO'#9'10'#9'Número ~Processo');
    dbgrdDet.Selected.Add('VALORATUAL'#9'10'#9'Valor Atual'#9'F');
    dbgrdDet.Selected.Add('VALORTOTAL'#9'10'#9'Valor Total'#9'F');
  end
  else
  begin
    dbgrdDet.Selected.Add('SELECIONADO'#9'1'#9'S');
    dbgrdDet.Selected.Add('MATRICULA'#9'15'#9'Matrícula');
    dbgrdDet.Selected.Add('DATA_ULTIMO_RESGATE'#9'18'#9'Data Último Resgate');
    dbgrdDet.Selected.Add('SALDO_CONTA_TOTAL'#9'18'#9'Saldo'#9'F');
    dbgrdDet.Selected.Add('VLR_IRREGR'#9'11'#9'Ir Regressivo'#9'F');
    dbgrdDet.Selected.Add('TIPO_OPCAO_IR'#9'11'#9'Tipo Opção IR');
    dbgrdDet.Selected.Add('NUMEROPROCESSO'#9'10'#9'Número ~Processo');
    dbgrdDet.Selected.Add('VALORATUAL'#9'10'#9'Valor Atual'#9'F');
    dbgrdDet.Selected.Add('VALORTOTAL'#9'10'#9'Valor Total'#9'F');
  end;
  dbgrdDet.ApplySelected;

  dbgrdDet.refresh;
end;


procedure TFrmCadConcederResgCompLote.cb_tipo_opChange(Sender: TObject);
begin
  inherited;
  AjustaGrid();
end;


procedure TFrmCadConcederResgCompLote.tbButtonAlterarClick(Sender: TObject);
var iREB       : Integer;
    iNovoPlano : Integer;
    sMsgErro   : string;
begin
  inherited;

  iReb       := 0;
  iNovoPLano := 0;

  try
    try
      qryDet.DisableControls;
      qryDet.Filter   := 'SELECIONADO = ''S'' ';
      qryDet.Filtered := true;
      qryDet.first;
      while not qryDet.eof do
      begin
        if qryDet.FieldByname('IDPLANOPREV').asInteger = 66 then begin
          iReb        :=1;
          iNovoPLano  :=0;
        end else if qryDet.FieldByname('IDPLANOPREV').asInteger = 74 then begin
          iReb        :=0;
          iNovoPLano  :=1;
        end;

        if not ctrlCalculoIRRF.ProcessaPrazoAcumulacao(qryDet.FieldByname('IDPESSJUR').asInteger,
                                                       qryDet.FieldByname('IDPESSOA').asInteger,
                                                       iREB, iNovoPlano, DateToStr( Date ) ,
                                                       qryDet.FieldByname('TIPOOPCAOIR').asInteger, 0,
                                                       qryDet.FieldByname('MATRICULA').AsString,
                                                       qryDet.FieldByName('IDTITULAR').AsInteger,
                                                       qryDet.FieldByName('SEQRESGATE').AsInteger
                                                       ) then
        begin
          MsgDlg('Erro ao calcular IRRF', 'Aviso', mtInformation, [mbOk], 0);
          Exit;
        end;

        if not ctrlCalculoIRRF.ProcessaCalcMedioPonderado(qryDet.FieldByname('IDPESSJUR').asInteger,
                                                          qryDet.FieldByname('IDPESSOA').asInteger,
                                                          qryDet.FieldByname('IDPLANOPREV').asInteger,
                                                          0, 2,
                                                          qryDet.FieldByname('MATRICULA').AsString,
                                                          DateToStr( date),
                                                          qryDet.FieldByName('IDTITULAR').AsInteger) then
        begin
          Gravar_temp_log(param,'Erro no Calculo Médio Ponderado','');
        end;

        AtualizaValorIR(qryDet.FieldByname('IDPESSJUR').asInteger,
                        qryDet.FieldByname('IDPESSOA').asInteger,
                        qryDet.FieldByname('IDPLANOPREV').asInteger);

        qryDet.next;
      end;

      bProcessou:= True;
      
      tbButtonEnviar.enabled := true;
    except
      on E:EDBEngineError do
       begin
            Gravar_temp_log(param,'',string(E.message));
            Exit;
       end;
     end;
    
  finally
    qryDet.Filtered := false;
    qryDet.Filter   := '';
    qryDet.first;
    qryDet.EnableControls;
  end;

//  tbButtonEnviar.Enabled   := CtrlCalculoIRRF.tbButtonEnviar;
end;

procedure TFrmCadConcederResgCompLote.tbButtonEnviarClick(Sender: TObject);
begin
  inherited;

  try
    Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;


      qryDet.DisableControls;
      qryDet.Filter   := 'SELECIONADO = ''S'' ';
      qryDet.Filtered := true;
      qryDet.first;

      While not qryDet.Eof do
      begin

        if CtrlCalculoIRRF.verificaInformacoesSendoUtilizadasPrevia(qryDet.FieldByName('IDPESSOA').AsInteger
                                                                    ,qryDet.FieldByName('IDPESSOA').AsInteger
                                                                    ,qryDet.FieldByName('IDPESSJUR').AsInteger
                                                                    ,qryDet.FieldByName('IDPLANOPREV').AsInteger
                                                                    ,qryDet.FieldByName('SEQRESGATE').AsInteger   //edilaine WO10872
                                                                    ) then
        begin
          Application.MessageBox(pchar('A funcionalidade de Prévia está sendo executada!' + #13 + 'Entre em contato com a área de Pagamento de Benefícios!'),'Verifique',MB_ICONINFORMATION );
          Exit;
        end;

        //edilaine - SIG20491 - inicio
        CtrlCalculoIRRF.gravarHistoricoPrazoAcumulacao( qryDet.FieldByName('IDPESSOA').AsInteger
                                                       ,qryDet.FieldByName('IDPESSOA').AsInteger
                                                       ,qryDet.FieldByName('IDPESSJUR').AsInteger
                                                       ,qryDet.FieldByName('IDPLANOPREV').AsInteger
                                                       ,qryDet.FieldByName('IDBENEFICIO').AsInteger); //WO32251 LEANDRO

        CtrlCalculoIRRF.gravarHistoricoCalculoPMP(qryDet.FieldByName('IDPESSOA').AsInteger
                                                  ,qryDet.FieldByName('IDPESSOA').AsInteger
                                                  ,qryDet.FieldByName('IDPESSJUR').AsInteger
                                                  ,qryDet.FieldByName('IDPLANOPREV').AsInteger);
        //edilaine - SIG20491 - fim

        qryDet.Next;
      end;

      bGravou := True;

      tbButtonEnviar.Enabled := False;

    Except
      on e: Exception do
       begin
          bGravou := false;
          Gravar_temp_log(param,'',string(E.message));
       end;
    end;

  finally
    qryDet.Filtered := false;
    qryDet.Filter   := '';
    qryDet.first;
    qryDet.EnableControls;
  end;

end;


procedure TFrmCadConcederResgCompLote.AtualizaValorIR(iIdPessJur, iIdPessoa, iIdPlanoPrev : integer);
begin
  //busca valor todal do IR
  QryAux.close;
  QryAux.sql.clear;
  QryAux.SQL.Add(' SELECT SUM(T.IRRF) AS IRRF FROM ( ');
  QryAux.SQL.Add(' SELECT (VLRVALOR*PERCENTUALIR)/100 AS IRRF ');
  QryAux.SQL.Add('   FROM PRAZOACUMULACAO P ');
  QryAux.SQL.Add('  WHERE P.IDPESSJUR   =' +intTostr(iIdPessJur));
  QryAux.SQL.Add('    AND P.IDPESSOA    =' +intTostr(iIdPessoa));
  QryAux.SQL.Add('    AND P.IDPLANOPREV =' +intTostr(iIdPlanoPrev));
  QryAux.SQL.Add('    AND P.TIPOOPCAOIR = ''REGRESSIVO''');
  QryAux.SQL.Add('     OR (IDPESSOA IN (SELECT IDPESSOA FROM PORTABILIDADEPREV PPR');
  QryAux.SQL.Add('                             WHERE PPR.IDPESSJUR = ' +intTostr(iIdPessJur));
  QryAux.SQL.Add('                             AND PPR.IDPESSOA    = ' +intTostr(iIdPessoa));
  QryAux.SQL.Add('                             AND PPR.IDPLANOPREV = ' +intTostr(iIdPlanoPrev));
  QryAux.SQL.Add('                             AND PPR.OPCAOIR = ''R''))  ');
  QryAux.SQL.Add(' ) T   ');
  QryAux.Open;

  //atualiza grid
  qryDet.edit;
  qryDet.FieldByName('VLR_IRREGR').AsFloat := Arredonda(qryAux.Fields[0].AsFloat, 2);
  qryDet.post;
end;
//Darivaldo Alencar SIG20491 -fim


end.

