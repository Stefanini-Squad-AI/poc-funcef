unit FCadRequerBenefInssLote;
//----------------------------------------------------------------------------------------------------------------------------------
// *********************************************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ****************************************************************************
// *********************************************************************************************************************************
// *********************************************************************************************************************************
//----------------------------------------------------------------------------------------------------------------------------------

{-------------------------------------------------------------------------------
Nº SIG.....: 92983
Data.......: 23/04/2020
Responsável: Ewerton Beltramini
Descrição..: Bloqueio de requerimento e concessão para casos em que o tipo de
             requerimento não é valido para o tipo de beneficio.
-------------------------------------------------------------------------------
Alteração  : buscarequerimentos
Nº SIG.....: 82823
Data.......: 27/02/2019
Responsável: Fábio Sampaio
Descrição..: Adequação da busca devido incompatibilidade com o TIBERO
-------------------------------------------------------------------------------
Alteração  : sbtnRequererClick
Nº SIG.....: 73169
Data.......: 09/08/2018
Responsável: Fábio Sampaio
Descrição..: Correção para passar o IdPlanoPrevContab na
             Busca do Perfil de Investimento (BuscaPerfilInvestimento).
-------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 28/02/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Alteração  : GravarBENEFBFCIARIO, GravaBenefPlanoPart
Nº SIG.....: 63479
Data.......: 21/02/2018
Responsável: Luiz Carlos
Descrição..: Gravacao erronea de valorbase1 e valorbase2
-------------------------------------------------------------------------------
Alteração  : GravarBENEFBFCIARIO, buscarequerimentos
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
-------------------------------------------------------------------------------}
//Nº SIG............: 26527
//Data da Alteração.: 29/05/2017
//Responsável.......: Darivaldo Alencar
//Descrição.........: Em continuidade ao SOL Nº 269970 o SIG será aberto para analisar as melhorias da funcionalidade de
//                    Requerimento/concessão de benefícios do INSS.
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: bbtnDesfazerClick
//Nº SIG............: 22026
//Data da Alteração.: 20/06/2016
//Responsável.......: Edilaine
//Descrição.........: verificar todos os pontos do benefícioprev que apaga registros
//                    da Prévia e bloquear para que não seja deletado
//----------------------------------------------------------------------------------------------------------------------------------
//Nº SOL............: 271037
//Nº PPM............: 1350100
//Data da Alteração.: 30/03/2016
//Responsável.......: Peterson Victor
//Descrição.........: Alterações na concessão para alterar somente o
//                    processo selecionado,
//                    no processo de desfazer validar somente o processo selecionado
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: buscarequerimentos
//Nº SOL............: 251599.17194
//Nº PPM............: 783173
//Data da Alteração.: 20/05/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Alteração para requer / conceder benefício para mais de um
//                    pensionista de um nucleo familiar
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: gera_impressao_log, gera_impressao_requerimento, buscarequerimentos
//Nº SOL............: 249376.17130
//Nº PPM............: 757902
//Data da Alteração.: 06/05/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Alteração no Demonstrativo de Requerimento e Concessão de Benefícios do INSS
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: buscarequerimentos, habilitaBotaoConceder, GravarBENEFBFCIARIO.
//Nº SOL............: 218687.17129
//Nº PPM............: 757901
//Data da Alteração.: 06/04/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Ajustar funcionalidades de requerimento e concessão de benefícios
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Wylliam Leite da Silva
//Data       : 03/06/2015
//Pendência  : SOL 255596 PPM 822251
//Descricao  : Prezados, Solicito a correção da rotina de Requerimento de
//             Beneficios do INSS em Lote. A rotina foi ajustada a pouco tempo
//             atraves do SOL 252548, que estava Inserindo registros indevidamente
//             para PENSIONISTAS. Acontece que o ajuste afetou diretamente os
//             aposentados não inserindo assim o registros necessários para o pós
//             requerimento.
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Wylliam Leite da Silva
//Data       : 29/04/2015
//Pendência  : SOL 252548 PPM 769593
//Descricao  : Não inserir/Deletar/Alterar registros na tabela BFCIARIOTITPLAN
//             no momento de requerer ou desfazer      
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Otacilio Aquino
//Data       : 28/05/2013
//Pendência  : SOL 207975 Kintana 2010873
//Descricao  : Ajuste na matricula ao requerer beneficio do INSS em Lote.
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081
//Data       : 28/03/2013
//Pendência  : SOL 203788 Kintana 1969081
//Descricao  : Ajuste para atualizar o maior valor do campo RMREAJ
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Douglas.Siqueira
//Data       : 08/03/2013
//Pendência  : SOL 149652/3564 Kintana 1107607
//Descricao  : Requerimento e concessão dos benefícios INSS em lote
//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, QExport3, QExport3PDF,
  QuickRpt, Qrctrls, ppPrnabl, ppClass, ppStrtch, ppRichTx, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, ppModule, raCodMod, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, CmParamReport, uCmRptManager, TXComp, TXRB,
  ppCtrls, ppMemo, ppVar, wwdblook;

type
  TFrmCadRequerBenefInssLote = class(TfrmCadMestreDetalheCS)
    ToolbarButton971: TToolbarButton97;
    sbtnRequerer: TToolbarButton97;
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
    GroupBox1: TGroupBox;
    cb_tipo_recebedor: TComboBox;
    pnl_impressao: TPanel;
    rg_opcao_impressao: TRadioGroup;
    bt_imprimir: TButton;
    rd_benefreq: TRadioGroup;
    sbtnConcedeUm: TToolbarButton97;
    qry2: TwwQuery;
    qryaux: TwwQuery;
    qryaux2: TwwQuery;
    qryDet: TwwQuery;
    rg_molestia: TDBRadioGroup;
    updDet: TUpdateSQL;
    wwDBEdit10: TwwDBEdit;
    dtDataFinal: TCMDateTimePicker;
    qryDetSELECIONADO: TStringField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetBENEFICIO: TStringField;
    qryDetDatadoEvento: TDateTimeField;
    qryDetDIB: TDateTimeField;
    qryDetDIP: TDateTimeField;
    qryDetNUMBENEFICIO: TStringField;
    qryDetDIBANT: TDateTimeField;
    qryDetRMI: TFloatField;
    qryDetBENEFREQ: TStringField;
    qryDetESPECIE: TStringField;
    qryDetDATAREQUERIMENTO: TDateTimeField;
    qryDetMATRICULA: TStringField;
    qryDetNOME: TStringField;
    qryDetMOLESTIA: TStringField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFIM: TDateTimeField;
    qrySitPart: TwwQuery;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    cb_grava_indiv: TCheckBox;
    qryDetDATAMORTE: TDateTimeField;
    qryDetIDSITPART: TFloatField;
    qryDetIDSITFUNC: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDSITPLANOPREV: TFloatField;
    qryDetINSCNUMERO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetTIPO: TStringField;
    IdHTTP1: TIdHTTP;
    qryDetIDBENEFHABILITA: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDeteventogerador: TFloatField;
    qryDetnumeroprocesso: TFloatField;
    cb_validado: TCheckBox;
    param: TwwQuery;
    pnl1: TPanel;
    grid_log: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    db_grid_irrf: TDBRadioGroup;
    qryDetISENTOIRRF: TStringField;
    lbl_listados: TLabel;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
    CmpRptCM: TCmParamReport;
    rpReciboCedidos: TppReport;
    ppDetailBand1: TppDetailBand;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    ppReciboCedidos: TppBDEPipeline;
    dsReciboCedidos: TwwDataSource;
    ppMemo1: TppMemo;
    qryDetFLGREQUERIMENTO: TFloatField;
    qryDetIdplanprevcontab: TFloatField;
    ppTitleBand1: TppTitleBand;
    qryDETCONCINSS: TwwQuery;
    qryDetVALIDADO: TStringField;
    sbtnConceder: TToolbarButton97;
    qryConceder: TwwQuery;
    qryDetFLGPAGAINSS: TFloatField;
    qryDetBENEFLEI142: TFloatField;
    qryDetTEMPOSERVICOANOS: TFloatField;
    qryDetTEMPOSERVICOMES: TFloatField;
    qryDetTEMPOSERVICODIAS: TFloatField;
    qryDetINDICEREAJUSTETETO: TFloatField;
    qryDetPERCENTUALINSS: TFloatField;
    qryDetDEC: TDateTimeField;
    qryDetDATAMORTETIT: TDateTimeField;
    rpRequerBeneficios: TppReport;
    prmtrlst1: TppParameterList;
    qryDetFLGPAGAINSS_1: TStringField;
    qryDetBENEFLEI142_1: TStringField;
    qryDetCPF: TStringField;
    qryDetNOMEPLANOPREV: TStringField;
    qryDetSITPLANO: TStringField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetFLGSENTENCAJUDICIAL: TFloatField;
    dbedNumBrdp: TwwDBEdit;
    lblNumBrdp: TLabel;
    dbedPctInss: TwwDBEdit;
    lblPctInss: TLabel;
    dbedIndReajTeto: TwwDBEdit;
    lblIndReajTeto: TLabel;
    dblkEstado: TwwDBLookupCombo;
    lblEstado: TLabel;
    dbedNup: TwwDBEdit;
    lblNup: TLabel;
    lblDEC: TLabel;
    dtDec: TCMDateTimePicker;
    rgSetencaJudicial: TDBRadioGroup;
    rgBeneficioLei142: TDBRadioGroup;
    rgBenefForaConvenio: TDBRadioGroup;
    lblTempoSevico: TLabel;
    dbedAnos: TwwDBEdit;
    dbedMeses: TwwDBEdit;
    dbedDias: TwwDBEdit;
    lblAnos: TLabel;
    lblMeses: TLabel;
    lblDias: TLabel;
    gbxBeneficio: TGroupBox;
    lblMatricula: TLabel;
    lblNumBenef: TLabel;
    lblDer: TLabel;
    lblNome: TLabel;
    lblNmBenef: TLabel;
    dbedMatricula: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbedNumBenef: TwwDBEdit;
    dbedNmBenef: TwwDBEdit;
    dtpDer: TCMDateTimePicker;
    bbtnFiltrar: TBitBtn;
    qryDetNUMBRDP: TStringField;
    qryDetESTADO: TStringField;
    qryDetNUP: TStringField;
    qryDetNOMEUSUARIO: TStringField;
    PnlAltDet: TPanel;
    qryDetVALORTOTAL: TFloatField;
    qryDetSITBENEFICIO: TStringField;
    qryEstado: TwwQuery;
    qryDetNOMEPERFIL: TStringField;
    phdrbnd1: TppHeaderBand;
    plbl1: TppLabel;
    plbl_dataconce: TppLabel;
    ppLine3: TppLine;
    pmg1: TppImage;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    psystmvrbl1: TppSystemVariable;
    pdtlbnd1: TppDetailBand;
    pdbtxt6: TppDBText;
    plbl13: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    pdbtxt9: TppDBText;
    pdbtxt10: TppDBText;
    plbl17: TppLabel;
    plbl19: TppLabel;
    pdbtxt12: TppDBText;
    plbl20: TppLabel;
    pdbtxt13: TppDBText;
    plblCapIsentoIRRF: TppLabel;
    pdbtxtIsentoIRRF: TppDBText;
    pdbtxt14: TppDBText;
    plbl21: TppLabel;
    plbl22: TppLabel;
    pdbtxt15: TppDBText;
    plbl23: TppLabel;
    pdbtxt16: TppDBText;
    plbl24: TppLabel;
    plbl_anos: TppLabel;
    plbl34: TppLabel;
    plbl37: TppLabel;
    plbl38: TppLabel;
    pdbtxt17: TppDBText;
    plblCapSituacaoPlano: TppLabel;
    plbl_msgimpeditiva: TppLabel;
    plbl7: TppLabel;
    pdbtxtNUMBENEFICIO: TppDBText;
    ppLabel1: TppLabel;
    pdbtxt1: TppDBText;
    plbl8: TppLabel;
    pdbtxt2: TppDBText;
    plbl9: TppLabel;
    pdbtxtBenefFora: TppDBText;
    plblDEC: TppLabel;
    pdbtxtDEC: TppDBText;
    plbl11: TppLabel;
    pdbtxtPercINSS: TppDBText;
    plbl12: TppLabel;
    pdbtxtIRT: TppDBText;
    pdbtxtSITPLANO: TppDBText;
    plbl_CPF: TppLabel;
    plbl10: TppLabel;
    Lbl_BenefReq: TppLabel;
    Lbl_numProcesso: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    pftrbnd1: TppFooterBand;
    ppLine4: TppLine;
    ppLine1: TppLine;
    plbl6: TppLabel;
    pgrp1: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    pgrpftrbnd1: TppGroupFooterBand;
    rcdmdl1: TraCodeModule;
    qryDetideventogerador: TFloatField;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure buscarequerimentos(_selecao,_ordem:string);
    procedure buscarlog();
    procedure configuralog();
    procedure tbcDetalheChange(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure gera_impressao_log;
    procedure gera_impressao_requerimento;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnRequererClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure GravarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure GravarBfciarioTitPlan(_query:TwwQuery;_NUMEROPROCESSO,_EventoGerador:string);
    procedure DeletarBfciarioTitPlan(_query:TwwQuery);
    procedure DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure DeletarProcessoBenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarHSTBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarMovbenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarRubricaIndiv(_query:TwwQuery);     

    procedure GravarProcessoBenef(_query:TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);
    procedure GravarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO : string;
                                                   iIdPerfilInvest : integer);   //edilaine - SIG55933
    procedure AtualizaBenefHabilita(_query:TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);


    procedure Criar_temp(_query:TwwQuery);
    procedure Gravar_temp_log(_query:TwwQuery;_msgerro,_msgoracle:string);
    procedure Deletar_temp_log(_query:TwwQuery);
    procedure FormShow(Sender: TObject);
    procedure wwDBEdit10Change(Sender: TObject);
    procedure dtDataFinalChange(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure RemoveDuplicates(var stringList : TStringList) ;
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure cb_validadoClick(Sender: TObject);
    procedure sbtnConcederClick(Sender: TObject);

    //Início - William Santana - SOL 218687.17129 PPM 757901
    procedure habilitaBotaoConceder();
    procedure plbl_msgimpeditivaPrint(Sender: TObject);
    procedure pdtlbnd1BeforePrint(Sender: TObject);
    //Término - William Santana - SOL 218687.17129 PPM 757901

    //Início - William Santana - SOL 251599.17194 PPM 783173
    procedure GravaBenefPlanoPart(_query:TwwQuery);
    procedure DeletarBenefPlanoPart(_query:TwwQuery);
    function  ValidaSentencaJudicial: string;
    procedure CombosDropDown(Sender: TObject);
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure IntegerKeyPress(Sender: TObject; var Key: Char);
    procedure NumericKeyPress(Sender: TObject; var Key: Char);
    procedure DecimalKeyPress(Sender: TObject; var Key: Char);
    //Término - William Santana - SOL 251599.17194 PPM 783173


  private
    wHora, wMin, wSeg, wMSeg : word;
    //Darivaldo Alencar SIG26527 -inicio
    Function BeneficioConcedido: Boolean;
    Function BeneficioRequerido: Boolean;
    //Darivaldo Alencar SIG26527 -fim
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadRequerBenefInssLote: TFrmCadRequerBenefInssLote;
  FIdbenefh  : TStringList;
  RegProc:integer;
  iIdEventoPrevG:integer;
  pIsValidado : string;
  FDependente: TStringList; //William Santana - SOL 251599.17194 PPM 783173
implementation

uses
  FMostraAux,UFuncoesUteis,USistema,uCMTypes,UMensErro,ubeneficio,UDataBase,UAdmPrev,DBaseDados,FPreview,
  FTelaAut, FCadConcederBenefInssLote;
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

procedure TFrmCadRequerBenefInssLote.buscarequerimentos(_selecao,_ordem:string);
var
  sql:string;
begin
sql:='';
/////RN004


qry.Active:=true;

qryDet.Close;
qryDet.sql.Clear;        

///

QRYDET.SQL.ADD('SELECT '+#39+_selecao+#39+' AS SELECIONADO,');
//qryDet.SQL.Add('SELECT ''S'' AS SELECIONADO,');
qryDet.SQL.Add('       BH.IDBENEFHABILITA,');
qryDet.SQL.Add('       BH.NUMEROPROCESSO,');
qryDet.SQL.Add('       BH.EVENTOGERADOR,');
qryDet.SQL.Add('       BH.FLGREQUERIMENTO,');
//Darivaldo Alencar SIG26527 -inicio
qryDet.SQL.Add('       BH.NUMBRDP, BH.ESTADO, BH.NUP, BH.DEC, ');
qryDet.SQL.Add('       (SELECT U.NOMEUSUARIO FROM MOVBENEF MV, USUARIOSISTEMA U    ');
qryDet.SQL.Add('	  WHERE MV.IDPESSOA = BH.IDPESSOA                          ');
qryDet.SQL.Add('	    AND MV.IDBENEFICIO = BH.IDBENEFICIO                    ');
qryDet.SQL.Add('	    AND MV.IDPLANOPREV = PLA.IDPLANOPREV                   ');
qryDet.SQL.Add('	    AND U.IDUSUARIO(+) = regexp_substr(MV.TRGUSERINCLUSAO, ''[[:digit:]]+'') ');
qryDet.SQL.Add('            AND MV.NUMEROPROCESSO = BH.NUMEROPROCESSO              ');
qryDet.SQL.Add('            AND MV.IDSITANTERIOR = 4                               ');
qryDet.SQL.Add('            AND ROWNUM = 1                                         ');
qryDet.SQL.Add('        ) NOMEUSUARIO,                                             ');   
qryDet.SQL.Add(  'NVL((SELECT SUM(BF.VALORTOTAL)                     ');
qryDet.SQL.Add('        FROM BENEFBFCIARIO BF                        ');
qryDet.SQL.Add('        WHERE BF.IDTITULAR = BH.IDTITULAR            ');
qryDet.SQL.Add('          AND BF.IDBENEFICIO = BH.IDBENEFICIO        ');
qryDet.SQL.Add('          AND BF.IDPESSOA = BH.IDPESSOA              ');
qryDet.SQL.Add('          AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('      AND BF.IDPLANPREVCONTAB = PLA.IDPLANPREVCONTAB ');
qryDet.SQL.Add('      ),DECODE(BH.FLGPAGAINSS,0,BH.RMI,1,            ');
qryDet.SQL.Add('         (SELECT MAX(DC.RMREAJ) FROM DETCONCINSS DC  ');
qryDet.SQL.Add('          WHERE DC.IDPESSOA = BH.IDPESSOA            ');
qryDet.SQL.Add('            AND DC.NUMPROCINSS = BH.NUMBENEFICIO      ');
qryDet.SQL.Add('            AND DC.DTINICIOCRED = (SELECT MIN(DC1.DTINICIOCRED)              ');
qryDet.SQL.Add('                                   FROM DETCONCINSS DC1                      ');
qryDet.SQL.Add('                                   WHERE DC.IDPESSOA = DC1.IDPESSOA AND      ');
qryDet.SQL.Add('                                         DC.NUMPROCINSS = DC1.NUMPROCINSS))) ');
qryDet.SQL.Add('         ) AS VALORTOTAL,                            ');
qryDet.SQL.Add('  NVL(( SELECT S.DESCRICAO                               ');
qryDet.SQL.Add('  FROM SITBENEFICIO S, BENEFBFCIARIO BF              ');
qryDet.SQL.Add(' WHERE S.IDSITBENEFICIO = BF.IDSITBENEFICIO          ');
qryDet.SQL.Add('   AND BF.IDTITULAR = BH.IDTITULAR                   ');
qryDet.SQL.Add('   AND BF.IDBENEFICIO = BH.IDBENEFICIO               ');
qryDet.SQL.Add('   AND BF.IDPESSOA = BH.IDPESSOA                     ');
qryDet.SQL.Add('   AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO         ');
qryDet.SQL.Add('   AND BF.IDPLANPREVCONTAB = PLA.IDPLANPREVCONTAB    ');
qryDet.SQL.Add('   AND BF.IDPLANOPREV =  PLA.IDPLANOPREV             ');
qryDet.SQL.Add('  ),''Pendente de Requerimento'') SITBENEFICIO,                     ');
//Darivaldo Alencar SIG26527 -fim
//Início - William Santana - 218687.17129 PPM 757901
// qryDet.SQL.Add('       D.MATRICULA,');
qryDet.SQL.Add('       DECODE(EP.MATRICULA,NULL,D.MATRICULA,EP.MATRICULA) AS MATRICULA, ');
qryDet.SQL.Add('       BH.FLGPAGAINSS, ');
qryDet.SQL.Add('       BH.BENEFLEI142, ');
qryDet.SQL.Add('       BH.TEMPOSERVICOANOS, ');
qryDet.SQL.Add('       BH.TEMPOSERVICOMES,  ');
qryDet.SQL.Add('       BH.TEMPOSERVICODIAS, ');
qryDet.SQL.Add('       BH.INDICEREAJUSTETETO, ');
qryDet.SQL.Add('       BH.PERCENTUALINSS,  ');
qryDet.SQL.Add('       BH.DEC,  ');
qryDet.SQL.Add('       PFTIT.DATAMORTE DATAMORTETIT, ');
//Término - William Santana - 218687.17129 PPM 757901
//Início - William Santana - SOL 249376.17130 PPM 757902
qryDet.SQL.Add(' (DECODE(BH.FLGPAGAINSS, 1, ''Não'', 0, ''Sim'', ''Sim'')) AS FLGPAGAINSS_SN,');
qryDet.SQL.Add(' (DECODE(BH.BENEFLEI142, 0, ''Não'', 1, ''Sim'', ''Não'')) AS BENEFLEI142_SN,');
qryDet.SQL.Add('       P.NUMDOCUMENTO AS CPF, ');
qryDet.SQL.Add('       PLA.NOMEPLANOPREV, ');
qryDet.SQL.Add('       PLA.SITPLANO, ');
//Término - William Santana - SOL 249376.17130 PPM 757902
//Início - William Santana - SOL 251599.17194 PPM 783173
qryDet.SQL.Add('       BH.FLGSENTENCAJUDICIAL,  ');
qryDet.SQL.Add('       BH.DATAFINAL,    ');
//Término - William Santana - SOL 251599.17194 PPM 783173
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
//Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - INICIO
qryDet.SQL.Add('      DECODE(BH.FLGPAGAINSS,0,BH.RMI,1, ');  //William Santana - 218687.17129 PPM 757901
qryDet.SQL.Add(' CASE WHEN ' +
               ' NVL(BH.RMI,0) <> 0 THEN BH.RMI '+
               ' ELSE ');
qryDet.SQL.Add('(SELECT MAX(DC.RMREAJ)');
qryDet.SQL.Add('          FROM DETCONCINSS DC');
qryDet.SQL.Add('         WHERE DC.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('           AND DC.NUMPROCINSS = BH.NUMBENEFICIO');
qryDet.SQL.Add('           AND DC.DTINICIOCRED = (SELECT MIN(DC1.DTINICIOCRED)');
qryDet.SQL.Add('                                  FROM DETCONCINSS DC1');
qryDet.SQL.Add('                                  WHERE DC.IDPESSOA = DC1.IDPESSOA AND');
qryDet.SQL.Add('                                        DC.NUMPROCINSS = DC1.NUMPROCINSS)) ' );
//Início - William Santana - 218687.17129 PPM 757901
//qryDet.SQL.Add('END AS RMI,');
qryDet.SQL.Add('END ) AS RMI,');
//Término - William Santana - 218687.17129 PPM 757901
//Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - FIM
QRYDET.SQL.ADD('       BH.VALIDADO, ');
qryDet.SQL.Add('       (DECODE(BH.FLGREQUERIMENTO, 0, ''NAO'', 1, ''SIM'', ''NAO'')) AS BENEFREQ,');
qryDet.SQL.Add('       B.CODBENEFICIO ESPECIE,');
qryDet.SQL.Add('       DECODE(B.CODBENEFICIO,92,''SIM'',''NÃO'') ISENTOIRRF,');
qryDet.SQL.Add('       BH.DATAREQUERIMENTO,');
qryDet.SQL.Add('       DECODE(PF.FLGMOLESTIAGRAVE,1,''SIM'',''NAO'') MOLESTIA,');
qryDet.SQL.Add('       PF.DATAMOLESTIAGRAVE DATAINICIO,');
qryDet.SQL.Add('       PF.DATAFIMMOLESTIA DATAFIM,');
qryDet.SQL.Add('       PLA.Idplanprevcontab IDPLANPREVCONTAB');

//edilaine - SIG55933 - inicio
qryDet.SQL.Add('       , NVL((SELECT P.NOME  ');
qryDet.SQL.Add('              FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('              LEFT JOIN PERFILINVEST P ON P.IDPERFILINVEST = BF.IDPERFILINVEST ');
qryDet.SQL.Add('             WHERE BF.IDTITULAR = BH.IDTITULAR      ');
qryDet.SQL.Add('               AND BF.IDBENEFICIO = BH.IDBENEFICIO  ');
qryDet.SQL.Add('               AND BF.IDPESSOA = BH.IDPESSOA        ');
qryDet.SQL.Add('               AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('               AND BF.IDPLANPREVCONTAB = PLA.IDPLANPREVCONTAB  ');
qryDet.SQL.Add('               AND BF.IDPLANOPREV = PLA.IDPLANOPREV), '''') AS NOMEPERFIL ');
//edilaine - SIG55933 - fim

//Ewerton Beltramini - 23/04/2020 - SIG92983
qryDet.SQL.Add('       ,b.ideventogerador');   

qryDet.SQL.Add('FROM BENEFHABILITA BH');

if rd_benefreq.ItemIndex = 0 then
   begin
   qryDet.SQL.Add('     JOIN BENEFBFCIARIO BB ON BH.NUMEROPROCESSO = BB.NUMEROPROCESSO');
   qryDet.SQL.Add('                              AND BH.IDPESSOA = BB.IDPESSOA AND');
   qryDet.SQL.Add('                             BH.IDTITULAR = BB.IDTITULAR ');
   qryDet.SQL.Add('                             AND BB.IDSITBENEFICIO = 4     ');
   end;

qryDet.SQL.Add('     JOIN DEPENTIT D ON BH.IDPESSOA = D.IDPESSOA AND');
qryDet.SQL.Add('                        BH.IDTITULAR = D.IDTITULAR  ');
qryDet.SQL.Add('     JOIN PESSOA P ON BH.IDPESSOA = P.IDPESSOA');
qryDet.SQL.Add('     JOIN PESSOAFISICA PF ON BH.IDPESSOA = PF.IDPESSOA');
qryDet.SQL.Add('     JOIN BENEFICIO B ON BH.IDBENEFICIO = B.IDBENEFICIO');
//Início - William Santana - 218687.17129 PPM 757901
qryDet.SQL.Add('     LEFT JOIN PESSOAFISICA PFTIT ON BH.IDTITULAR = PFTIT.IDPESSOA  ');
//qryDet.SQL.Add('     LEFT JOIN ELEGPATRO EP ON BH.IDPESSOA = EP.IDPESSOA');
qryDet.SQL.Add('  LEFT JOIN (SELECT E1.IDPESSOA, E1.IDPESSJUR, E1.IDSITFUNC, E1.MATRICULA  ');
qryDet.SQL.Add('  FROM ELEGPATRO E1                                                        ');
qryDet.SQL.Add('  WHERE ((((SELECT COUNT(1) FROM ELEGPATRO E2 WHERE E1.IDPESSOA = E2.IDPESSOA) > 1) AND (E1.IDPESSJUR = 1)) ');
qryDet.SQL.Add('    OR ((SELECT COUNT(1) FROM ELEGPATRO E2 WHERE E1.IDPESSOA = E2.IDPESSOA) = 1)) ');
qryDet.SQL.Add('      AND E1.IDPESSOA IN (SELECT BN.IDPESSOA FROM BENEFHABILITA BN WHERE BN.FLGREQUERIMENTO = :flgrequerimento )');
qryDet.SQL.Add('    ) EP ON BH.IDPESSOA = EP.IDPESSOA  ');
//Término - William Santana - 218687.17129 PPM 757901
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
//Início - William Santana - SOL 249376.17130 PPM 757902
//qryDet.SQL.Add('       PP.IDPESSJUR'); 2
qryDet.SQL.Add('       PP.IDPESSJUR,');
qryDet.SQL.Add('       PPREV.NOME AS NOMEPLANOPREV, ');
qryDet.SQL.Add('       SITP.DESCRICAO AS SITPLANO ');

qryDet.SQL.Add('FROM PARTPREVPLAN PP, PLANPREV PPREV, SITPLANOPREV SITP ');
qryDet.SQL.Add('WHERE PP.IDPLANOPREV = PPREV.IDPLANOPREV(+) ');
qryDet.SQL.Add('      AND SITP.IDSITPLANOPREV(+) = PP.IDSITPLANOPREV ');
qryDet.SQL.Add('      AND (PP.IDSITPLANOPREV IN (25,26,27,28,29) ');
//qryDet.SQL.Add('FROM PARTPREVPLAN PP');
//qryDet.SQL.Add('WHERE (PP.IDSITPLANOPREV IN (25,26,27,28,29)');
//Término - William Santana - SOL 249376.17130 PPM 757902
qryDet.SQL.Add('       OR (PP.IDSITPLANOPREV NOT IN (25,26,27,28,29)');
qryDet.SQL.Add('          AND PP.FLGDESATIVADO = 0');
qryDet.SQL.Add('           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                           FROM PARTPREVPLAN PPP1');
qryDet.SQL.Add('                           WHERE PPP1.IDPESSOA = PP.IDPESSOA');
qryDet.SQL.Add('                             AND PPP1.IDSITPLANOPREV IN (25,26,27,28,29))))) PLA ON PLA.IDPESSOA = BH.IDTITULAR');
//qryDet.SQL.Add('WHERE --BH.FLGREQUERIMENTO = 1');
//qryDet.SQL.Add('--AND BH.IDPESSOA = BH.IDTITULAR');
//qryDet.SQL.Add('  --AND BH.IDPESSOA <> BH.IDTITULAR');


qryDet.SQL.Add('WHERE BH.FLGREQUERIMENTO =:flgrequerimento');///filtro

//Início - William Santana - SOL 251599.17194 PPM 783173
//CASE CB_TIPO_RECEBEDOR.ITEMINDEX OF
//1: QRYDET.SQL.APPEND(' AND BH.IDTITULAR = BH.IDPESSOA');  ///APOSENTADO
//2: QRYDET.SQL.APPEND(' AND BH.IDTITULAR <> BH.IDPESSOA');  ///PENSIONISTA
//end;

CASE cb_tipo_recebedor.ItemIndex OF
1: qryDet.Sql.Append(' AND BH.IDTITULAR = BH.IDPESSOA AND BH.FLGPAGAINSS = 1');  //Aposentado
2: qryDet.Sql.Append(' AND BH.IDTITULAR <> BH.IDPESSOA AND BH.FLGPAGAINSS = 1');  //Pensionista
3: qryDet.Sql.Append(' AND BH.FLGPAGAINSS = 0');  //Benefício fora de convênio
end;
//Término - William Santana - SOL 251599.17194 PPM 783173

// Alterado por FHBS - 27/02/2019 - SIG82823
//qryDet.SQL.Add('   AND EXISTS (SELECT 1');
qryDet.SQL.Add('   AND (SELECT COUNT(1)');
// Fim Alterado por FHBS - 27/02/2019 - SIG82823
qryDet.SQL.Add('               FROM HISTBENEFHABILITA HB');
qryDet.SQL.Add('               WHERE BH.idbenefhabilita = hb.idbenefhabilita AND');
qryDet.SQL.Add('                     hb.idsithabilitacao = (SELECT valorparam');
qryDet.SQL.Add('                                            FROM paramfolha');
qryDet.SQL.Add('                                            WHERE nomeparam = ''SITUACAOHABILITACAOINSS'') AND');
qryDet.SQL.Add('                     hb.dataregistro = (SELECT MAX(hb1.dataregistro)');
qryDet.SQL.Add('                                        FROM histbenefhabilita hb1');
// Alterado por FHBS - 27/02/2019 - SIG82823
//qryDet.SQL.Add('                                        WHERE hb.idbenefhabilita = hb1.idbenefhabilita))');
qryDet.SQL.Add('                                        WHERE hb.idbenefhabilita = hb1.idbenefhabilita)) > 0');
// Fim - Alterado por FHBS - 27/02/2019 - SIG82823

///

if FIdbenefh.Count>0 then
   begin
   QRYDET.SQL.APPEND(' AND BH.idbenefhabilita in('+FIdbenefh.COMMATEXT+')');
   QRYDET.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;
   end
else
   begin


   IF RD_BENEFREQ.ITEMINDEX = 0 THEN
      QRYDET.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER := 1
   ELSE
      QRYDET.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER := 0;//não foi requerido

   end;

if  trim(_ordem)='' then
    qryDet.SQL.Add(' order by Nome ')
else
    qryDet.SQL.Add(' order by '+_ordem);


qryDet.Active:=true;
//lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';
///nova2
if qryDet.IsEmpty then
  tbcDetalhe.Enabled:=false
else
  tbcDetalhe.Enabled:=true;


//qry.edit;
end;

procedure TFrmCadRequerBenefInssLote.sbtnProcurarClick(Sender: TObject);
var
   ConfirmaVisible : Boolean;


begin
//  inherited;



if Trim(cb_tipo_recebedor.Text) = '' then
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para requerimento do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;//msg01


sbtnAlterar.Enabled   := True;

  //Início - William Santana - SIG 26527
   qrydet.Filter := '';
   qrydet.Filtered:=false;
   //buscarequerimentos('S','');
   buscarequerimentos('N','');
  //Término - William Santana - SIG 26527

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
       sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;
   sbtnConcedeUm.Enabled:=false;
   bbtnDesfazer.Enabled:=false;
   end;




   sbtnInserir.Enabled := false;
   //sbtnAlterar.Enabled := false;
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
               sbtnProcurar.Down := false;
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
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (qryDet.Active) and (not qryDet.IsEmpty) then
               begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
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
               sbtnAlterar.Enabled := true;
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
                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;   

end;

procedure TFrmCadRequerBenefInssLote.tbcDetalheChange(Sender: TObject);
begin
//  inherited;
case tbcDetalhe.tabindex of
0:begin
  bbtnSelTudo.Visible:=True;
  bbtnInverte.Visible:=True;
  pnl_impressao.SendToBack;
  pnl1.SendToBack;

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
       sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;
   sbtnConcedeUm.Enabled:=false;
   bbtnDesfazer.Enabled:=false;
   end;

//  sbtnProcurarClick(sender);
  end;
1:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;

  pnl1.BringToFront;
  pnl_impressao.SendToBack;

//  buscarlog;
  sbtnRequerer.Enabled:=false;
  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
2:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;
  configuralog;
  sbtnRequerer.Enabled:=false;
  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
end;
end;

procedure TFrmCadRequerBenefInssLote.bt_imprimirClick(Sender: TObject);
begin
//  inherited;

case rg_opcao_impressao.itemindex of
0:gera_impressao_log;
1:begin
  FIdbenefh.clear;
  gera_impressao_requerimento;
  end;
//1:=
end;
end;

procedure TFrmCadRequerBenefInssLote.gera_impressao_log;
var
     iInicio, iFim, nProcessados : integer;
begin

//   If frmMostraAux = Nil Then
//     Application.CreateForm(TfrmMostraAux, frmMostraAux);


     DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

     iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
     buscarlog;



      with ppMemo1.Lines do
        begin
        Clear;

        Add('-----------------------------------------------------------------------------------------------------');
        //Início - William Santana - SOL 249376.17130 PPM 757902
        //Add(PreparaStr('LOG DO PROCESSAMENTO DE REQUERIMENTO DE BENEFÍCIOS DO INSS EM LOTE',99));
        Add(PreparaStr('LOG DO PROCESSAMENTO DE REQUERIMENTO DE BENEFÍCIOS DO INSS',99));
        //Término - William Santana - SOL 249376.17130 PPM 757902
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
               PreparaStr('Quantidade de registros processados :  '+inttostr(RegProc),50));


         iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

            Add(PreparaStr('Tempo de Processamento : '+TempoDecorrido(iFim - iInicio),50)+
               PreparaStr('Log gerado em : '+FormatDateTime('dd/mm/yyyy', date)+' às '+FormatDateTime('hh:mm', time)+' horas',50));



        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('Fim do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time),99));
        Add('-----------------------------------------------------------------------------------------------------');

//      frmMostraAux.memResult.Lines

      end;

//frmMostraAux.ShowModal;
//ppMemo1.Lines.Clear;
//ppMemo1.Lines.Text:=frmMostraAux.memResult.Lines.Text;
//Início - William Santana - SOL 249376.17130 PPM 757902
//TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'LOG DO PROCESSAMENTO DE REQUERIMENTO DE BENEFÍCIOS DO INSS EM LOTE');
TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'LOG DO PROCESSAMENTO DE REQUERIMENTO DE BENEFÍCIOS DO INSS');
//Término - William Santana - SOL 249376.17130 PPM 757902
end;

procedure TFrmCadRequerBenefInssLote.buscarlog;
begin
//pnl1.BringToFront;
//pnl_impressao.SendToBack;
qry.Close;
qry.Active:=false;
qry.sql.clear;
qry.sql.Add('SELECT matricula AS Matrícula,nome as Nome,msgerro as "Mensagem de Erro",msgerrooracle as "Mensagem Oracle" FROM LOGREQUERLOTE');
//qry.sql.Add(' WHERE IDBENEFHABILITA IN ('+FIdbenefh.COMMATEXT+')');
qry.Active:=true; 

end;

procedure TFrmCadRequerBenefInssLote.configuralog;
begin
pnl_impressao.BringToFront;
pnl1.SendToBack;

end;

procedure TFrmCadRequerBenefInssLote.gera_impressao_requerimento;

begin

buscarequerimentos('S','');

//Início - William Santana - SOL 249376.17130 PPM 757902

//  If frmMostraAux = Nil Then
//     Application.CreateForm(TfrmMostraAux, frmMostraAux);
////     frmMostraAux.Caption:='DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE';
//
//      with frmMostraAux.memResult.Lines do
//        begin
//         clear;
//         Add('------------------------------------------------------------------------------------------------------');
//         Add('DEMONSTRATIVO DE REQUERIMENTO DE BENEFÍCIOS DO INSS');
//         Add('                                                               VERSÃO : ' + Sistema.Versao);
////         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao)); não fazer
//         Add('USUÁRIO : ' + Sistema.NomeUsuario + '            DATA DO REQUERIMENTO : ' + FormatDateTime('dd/mm/yyyy', Date));
//         Add('------------------------------------------------------------------------------------------------------');
//
////        if qrydet.FieldByName('FLGREQUERIMENTO').AsString = '1' then
//         if rd_benefreq.ItemIndex =0 then
//           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'SIM')
//        else
//           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'NÃO');
//
////         if rd_benefreq.ItemIndex = 0 then
////           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'SIM')
////        else
////           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'NÃO');
//
//
//
//        qrydet.First;
//        while not qrydet.eof do
//            begin
//
/////            if qryDetSELECIONADO.text <> 'S' then
////               begin
////               qrydet.Next;
////               continue;
////               end;
//            Add('-----------------------------------------------------------------------------------------------------');
//
//            Add(PreparaStr('Matrícula  : '+qrydet.FieldByName('matricula').AsString,50)+
//               PreparaStr('Número do Benefício : '+qrydet.FieldByName('numbeneficio').AsString,50));
//
//            Add(PreparaStr('Nome do Participante : '+qrydet.FieldByName('nome').AsString,99));
//
//            Add(PreparaStr('Espécie  : '+qrydet.FieldByName('especie').AsString,15)+
//               PreparaStr('Benefício : '+qrydet.FieldByName('beneficio').AsString,47)+ '  '+
//               PreparaStr('RMI : '+qrydet.FieldByName('rmi').AsString,33));
//
//
//            Add(PreparaStr('Data do Evento  : '+qrydet.FieldByName('dib').AsString,33)+
//               PreparaStr('DIP : '+qrydet.FieldByName('dip').AsString,33)+
//               PreparaStr('Isento IRRF : '+qrydet.FieldByName('ISENTOIRRF').AsString,33));//FEITO
//
//
//            Add(PreparaStr('DIB : '+qrydet.FieldByName('dib').AsString,50)+
//               PreparaStr('DIB Anterior : '+qrydet.FieldByName('DIBANT').AsString,50));
//            if FIdbenefh.count>0 then
//               begin
//               Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
//                   PreparaStr('Benefício Requerido : '+'SIM',50))
//               end
//               else
//         begin
//
//         if rd_benefreq.ItemIndex =0 then
//
////             if qrydet.FieldByName('FLGREQUERIMENTO').AsString = '1' then
//                Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
//                   PreparaStr('Benefício Requerido : '+'SIM',50))
//             else
//
//                Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
//                    PreparaStr('Benefício Requerido : '+'NÃO',50));
//          end;
//
//          qryaux.Active:=false;
//          qryaux.SQL.Clear;
//          qryaux.sql.Add('SELECT msgerro FROM LOGREQUERLOTE');
//          qryaux.sql.Add(' WHERE IDBENEFHABILITA='+#39+qrydet.FieldByName('IDBENEFHABILITA').AsString+#39);
//          qryaux.OPEN;
//
//
//
//
//            Add('Mensagem de Erro: '+qryaux.FieldByName('msgerro').AsString); ///FEITO
//
//            qrydet.next;
//            end;
//
//        Add('-----------------------------------------------------------------------------------------------------');
//        Add(PreparaStr('APENAS PARA CONFERÊNCIA',99));
//        Add('-----------------------------------------------------------------------------------------------------');
//
//
//
//        end;
//
//
//qryaux.CLOSE;
////frmMostraAux.ShowModal;
////ppMemo1.Lines.Clear;
//ppMemo1.Lines.Clear;
//ppMemo1.Lines.Text:=frmMostraAux.memResult.Lines.Text;

//TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE');
TFrmPreview.CreateModalPreview(Application, rpRequerBeneficios,'DEMONSTRATIVO DE REQUERIMENTO DE BENEFÍCIOS DO INSS');
//Término - William Santana - SOL 249376.17130 PPM 757902

end;

procedure TFrmCadRequerBenefInssLote.sbtnAlterarClick(Sender: TObject);
begin
////showmessage
qryDet.edit;
qryDet.post;
  inherited;

end;

procedure TFrmCadRequerBenefInssLote.sbtnInserirClick(Sender: TObject);
begin

////
  inherited;

end;

procedure TFrmCadRequerBenefInssLote.sbtnRequererClick(Sender: TObject);
var
achou:Boolean;
Fidpessoa,Ferro,Fmatricula : TStringList;
idevento:string;
iNumeroProcesso:integer;
IDPESSOA: String; // Wylliam Leite da Silva - SOL 255596 PPM 822251
IDTITULAR: String; // Wylliam Leite da Silva - SOL 255596 PPM 822251
iIdPerfilInvest : integer;   //edilaine - SIG55933
bPerfilAtivo    : Boolean;   //edilaine - SIG55933
sMsgErro, sIdEventoAux : String; // Ewerton Beltramini SIG92983
begin
 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

 //Início - William Santana - SOL 251599.17194 PPM 783173
 FDependente:= TStringList.Create;
 FDependente.clear;
 FDependente.Add('COM');     
 FDependente.Add('EXP');
 FDependente.Add('EXC');
 //Término - William Santana - SOL 251599.17194 PPM 783173

 FIdbenefh.clear;
///
  inherited;

RegProc:=0;  

//Criar_temp(qrydet);
Deletar_temp_log(qry2);

if Trim(cb_tipo_recebedor.Text) = '' then
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para requerimento do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;//msg02

if  not qrydet.IsEmpty then
   begin


   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then
      begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para requerimento do benefício.','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;          
      Exit;
      end;
               
//Início - William Santana - SOL 251599.17194 PPM 783173
     ///verificar se matricula existe se não criar.
//   qrydet.First;
//   while not qrydet.eof do
//   begin
//         if qrydet.FieldByName('matricula').Text='' then
//         begin
//         qrydet.edit;
//         qrydet.FieldByName('matricula').Text:=GeraMatricula( qryaux ,0);
//         qrydet.post;
//         end;
//
//      qrydet.Next;
//      end;
      sMsgErro := ''; //Ewerton Beltramini - 23/04/2020 - SIG92983
      while not qrydet.eof do
      begin
            if qrydet.FieldByName('matricula').Text='' then
            begin
                  qrydet.Filtered := False;
                  MsgDlg( 'Pensionista sem matricula cadastrada.','Erro',mtError,[mbOk],0);

                  sbtnRequerer.Down:=false;
                  sbtnProcurar.Down:=false;
                  sbtnAlterar.Down:=false;

                  Exit;
            end;

            case cb_tipo_recebedor.ItemIndex of
                 0, 3:
                 begin
                      if QryDet.FieldByName('IDTITULAR').AsInteger = QryDet.FieldByName('IDPESSOA').AsInteger then  //APOSENTADO
                         sIdEventoAux:='129'
                      else
                         sIdEventoAux:='130';  //PENSIONISTA
                 end;
                 1: sIdEventoAux:='129';
                 2: sIdEventoAux:='130';
            end;

            //Ewerton Beltramini - 23/04/2020 - SIG92983 Inicio...................................................................................
            if (sIdEventoAux <> qrydet.FieldByName('ideventogerador').AsString) then
                sMsgErro := sMsgErro + qrydet.FieldByName('Nome').AsString + ' - ' + qrydet.FieldByName('Matricula').AsString + ';' + #13;
            //Ewerton Beltramini - 23/04/2020 - SIG92983 Fim.......................................................................................

        qrydet.Next;
      end;
      //Ewerton Beltramini - 23/04/2020 - SIG92983 Inicio...................................................................................
      if sMsgErro <> '' then
      begin
           MsgDlg('O(s) Participante(s) abaixo possui(em) divergência no "Benefício" informado. Favor verificar! ' + #13 + sMsgErro , 'Erro', mtError, [mbOk], 0);
           Exit;
      end;
      //Ewerton Beltramini - 23/04/2020 - SIG92983 Fim...................................................................................
//Término - William Santana - SOL 251599.17194 PPM 783173

   qrydet.First;
   Ferro.Clear;



///RN014


     achou:=false;



      qrydet.First;
      while not qrydet.eof do
         begin

         Fidpessoa.Add(qrydet.FieldByName('IDPESSOA').Text);
         Fmatricula.Add(#39+qrydet.FieldByName('MATRICULA').Text+#39);
         FIdbenefh.Add(#39+qrydet.FieldByName('IDBENEFHABILITA').Text+#39);
         
         qrydet.Next;
         end;

      achou:=True;
     RemoveDuplicates(Fidpessoa);
     RemoveDuplicates(Fmatricula);
     RemoveDuplicates(FIdbenefh);








      begin



      qrydet.First;
      Ferro.Clear;
      while not qrydet.Eof do
       begin
       //// trava feita item a item



       if qrydet.fieldbyname('RMI').text='' then
            begin
            Ferro.Add(qrydet.fieldbyname('matricula').text);
            Gravar_temp_log(param,'A(S) matrículas'+ qrydet.fieldbyname('matricula').text+' não possui(em) RMI.Verifique','');//msg20
            qrydet.next;
            continue;
            end;



       if trim(qrydet.fieldbyname('DIBANT').text)='' then
          begin
          qryaux.close;
          qryaux.SQL.Clear;
//          QRYAUX.SQL.APPEND(' SELECT DATAMORTE,NUMSEQUENCIA,DEPENTIT.IDPESSOA,DEPENTIT.MATRICULA  FROM  DEPENTIT,PESSOAFISICA');                       //Everson TIBERO
          QRYAUX.SQL.APPEND(' SELECT PESSOAFISICA.DATAMORTE, DEPENTIT.NUMSEQUENCIA, DEPENTIT.IDPESSOA, DEPENTIT.MATRICULA FROM DEPENTIT, PESSOAFISICA'); //Everson TIBERO
          QRYAUX.SQL.APPEND(' WHERE');
          QRYAUX.SQL.APPEND(' DEPENTIT.IDPESSOA = '+qrydet.FIELDBYNAME('IDPESSOA').TEXT);
//          QRYAUX.SQL.APPEND(' DEPENTIT.IDPESSOA IN ('+FIDPESSOA.COMMATEXT+')');

          QRYAUX.SQL.APPEND(' AND DEPENTIT.IDPESSOA = DEPENTIT.IDTITULAR');
          QRYAUX.SQL.APPEND(' AND PESSOAFISICA.IDPESSOA = DEPENTIT.IDPESSOA');
          qryaux.Open;
          qryaux.First;
          Ferro.Clear;
    ////---- se retornar data morte ele herdou se não DIB_anterior não é obrigatório.


         if not qryaux.IsEmpty then
            begin
            while not qryaux.Eof do
               begin
               if qryaux.fieldbyname('datamorte').text=''  then
                  begin
                  /// se tiver data morte estiver em branco ..verificar se ele já está aposentado por invalidez e tem uma nova aposentadoria com o mesmo tipo
                  qryaux2.close;
                  qryaux2.SQL.Clear;
                  QRYAUX2.SQL.APPEND(' SELECT BF.IDPESSOA,BF.IDTITULAR,BF.IDBENEFICIO ');
                  QRYAUX2.SQL.APPEND('FROM CM.BENEFBFCIARIO BF,BENEFICIO B');
                  QRYAUX2.SQL.APPEND(' WHERE BF.IDBENEFICIO = BF.IDBENEFICIO');
//                  QRYAUX2.SQL.APPEND(' AND IDPESSOA = '+QRYAUX.FIELDBYNAME('IDPESSOA').TEXT);  //Everson TIBERO
                  QRYAUX2.SQL.APPEND(' AND BF.IDPESSOA = '+QRYAUX.FIELDBYNAME('IDPESSOA').TEXT); //Everson TIBERO
                  QRYAUX2.SQL.APPEND(' AND B.IDBENEFICIO = BF.IDBENEFICIO');
                  QRYAUX2.SQL.APPEND(' AND B.TIPOBENEFICIO = 1');
                  QRYAUX2.SQL.APPEND(' GROUP BY BF.IDPESSOA,BF.IDTITULAR,BF.IDBENEFICIO');
                  QRYAUX2.SQL.APPEND(' HAVING COUNT(BF.IDBENEFICIO) > 1');
                  qryaux2.Open;
                  if not qryaux2.isempty then
                     begin
                     Ferro.Add(qrydet.fieldbyname('matricula').text);
                     Gravar_temp_log(param,'A(S) matrículas'+ qrydet.fieldbyname('matricula').text+' não possui(em) DIB Anterior informada','');//msg18
                     qrydet.next;
                     continue;
                     end;
                  end;
               qryaux.Next;
               end;

            end;


          end;


       qryaux.close;
       qryaux.SQL.Clear;
       QRYAUX.SQL.APPEND('SELECT DISTINCT CB.IDPESSOA , DEP.MATRICULA FROM CONTABANCARIA CB, DEPENTIT DEP ');
       QRYAUX.SQL.APPEND('WHERE');
       QRYAUX.SQL.APPEND('NOT EXISTS (SELECT 1 FROM CONTABANCARIA WHERE TIPOCONTA=2 AND ');
       QRYAUX.SQL.APPEND(' IDPESSOA = ('+#39+QRYDET.FIELDBYNAME('idpessoa').TEXT+#39+'))');
       QRYAUX.SQL.APPEND(' AND CB.IDPESSOA = ('+#39+QRYDET.FIELDBYNAME('idpessoa').TEXT+#39+')');
       QRYAUX.SQL.APPEND('  AND DEP.IDPESSOA = CB.IDPESSOA');
       qryaux.Open;
       qryaux.First;


       if not qryaux.IsEmpty then
         begin
         Ferro.Add(qrydet.fieldbyname('matricula').text);         
         Gravar_temp_log(param,'A(S) matrículas'+ qryaux.fieldbyname('matricula').text+' não possui(em) conta salário cadastrada','');
         qrydet.next;
         continue;
         end;   //msg13

           /// verificacao para CPF

       qryaux.close;
       qryaux.SQL.Clear;
       QRYAUX.SQL.APPEND(' SELECT P.IDPESSOA,P.NUMDOCUMENTO,MATRICULA FROM PESSOA P, DEPENTIT DEP');
       QRYAUX.SQL.APPEND(' WHERE');
       QRYAUX.SQL.APPEND(' P.NUMDOCUMENTO = '+#39+''+#39+' OR P.NUMDOCUMENTO IS NULL AND ');
       QRYAUX.SQL.APPEND(' P.IDPESSOA = ('+#39+QRYDET.FIELDBYNAME('idpessoa').TEXT+#39+')');
       QRYAUX.SQL.APPEND(' AND DEP.IDPESSOA = P.IDPESSOA');
       qryaux.Open;
       qryaux.First;
       Ferro.Clear;

       if not qryaux.IsEmpty then
         begin
         Ferro.Add(qrydet.fieldbyname('matricula').text);         
         Gravar_temp_log(param,'A(S) matrículas'+ qryaux.fieldbyname('matricula').text+' não possui(em) CPF cadastrado','');
         qrydet.next;
         continue;
         end;     //msg14 


       qryaux.close;
       qryaux.SQL.Clear;
       qryaux.SQL.Append(' select flgrequerimento from benefhabilita');
       qryaux.SQL.Append(' where');
       qryaux.SQL.Append(' flgrequerimento = 0'); ///correto é zero
       qryaux.SQL.Append(' and idpessoa = ('+#39+QRYDET.FIELDBYNAME('idpessoa').TEXT+#39+')');
       qryaux.Open;
       qryaux.First;

       if qryaux.IsEmpty then
         begin
         Ferro.Add(qrydet.fieldbyname('matricula').text);         
         Gravar_temp_log(param,'A(S) matrículas selecionada(s) não possui(em) benefício a requerer','');

         qrydet.next;
         continue;
         end;     //msg15






       //// trava feita item a item

       ////chamar gravacao de dados
//Início - William Santana - 218687.17129 PPM 757901
//       if cb_tipo_recebedor.ItemIndex= 0 then
//         idevento:='129'
//       else
//          begin
//
//          IF   qrydet.FieldByName('DATAMORTE').Text<>'' THEN
//             idevento:='130'
//          ELSE
//             idevento:='129';
//
//          end;
         case cb_tipo_recebedor.ItemIndex of

          0,
          3: begin
               if QryDet.FieldByName('IDTITULAR').AsInteger = QryDet.FieldByName('IDPESSOA').AsInteger then  //APOSENTADO
                idevento:='129'
               else
                idevento:='130';  //PENSIONISTA
             end;
          1: idevento:='129';
          2: idevento:='130';

         end;

         if (idevento = '130') and (qrydet.FieldByName('DATAMORTETIT').Text ='')  then
         begin
           Ferro.Add(qrydet.fieldbyname('matricula').text);
           Gravar_temp_log(param,'Data de Falecimento do Titular não está cadastrada.','');
           qrydet.next;
           continue;
         end;
         //Término - William Santana - 218687.17129 PPM 757901
     //  idevento:='131';///teste
       //EventoGerador  129 ou 130  RN015
       qrySitFunc.Close;
       qrysitFunc.parambyname('IDEVENTO').AsString := idevento;
       qrySitFunc.Open;
       qrySitPlanoPrev.Close;
       qrysitPlanoPrev.parambyname('IDEVENTO').AsString := idevento;
       qrySitPlanoPrev.Open;
       qrySitPart.Close;
       qrysitPart.parambyname('IDEVENTO').AsString := idevento;
       qrySitPart.Open;

       ///1 processo para cada registro
       iNumeroProcesso := LeUltRegistro(qry2,'PROCESSOBENEF');

       GravarEventoPrev(qryaux,idevento);   ////Chamar gravacao de dados Evento

       //Início - /William Santana - SOL 251599.17194 PPM 783173
{
//             if cb_tipo_recebedor.ItemIndex= 0 then
//                  begin
//                  // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Inicio
//                  // Wylliam Leite da Silva - SOL 252548 PPM 769593 - Inicio
//                  IDPESSOA := Trim(qrydet.FieldByName('IDPESSOA').AsString);
//                  IDTITULAR := Trim(qrydet.FieldByName('IDTITULAR').AsString);
//                  if (IDPESSOA <> IDTITULAR) then // Não gravar se IDPESSOA <> IDTITULAR
//                     //GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso))
//                  else
//                     GravarBfciarioTitPlan(qry2,IntToStr(iNumeroProcesso),idevento);
//                     // Wylliam Leite da Silva - SOL 252548 PPM 769593 - Fim
//
//                     GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
//                     GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso));
//
//                  // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Fim
//                  end
//               else
//                 begin
//
//                  IF (qrydet.FieldByName('DATAMORTE').Text<>'') and ((qrydet.FieldByName('IDTITULAR').Text<>qrydet.FieldByName('IDPESSOA').Text)) THEN
//                    begin
//
//                    qry2.Close;
//                    qry2.SQL.Clear;
//                    qry2.SQL.ADD('select * from BFCIARIOTITPLAN where ' +
//                        'IDPESSJUR ='+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' and '+
//                        'IDTITULAR ='+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+'and  ' +
//                        'IDPLANOORIGEM ='+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
//                        'IDPLANOPREV ='+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND ' +
//                        'IDPESSOA ='+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
//                        'IDBENEFICIO ='+#39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39);
//                    Qry2.Open;
//
//                    IF Qry2.IsEmpty then
//                       begin
//                    //   MsgDlg( 'É necessário associar os benefícios aos pensionistas para requerimento','Erro',mtError,[mbOk, mbHelp],0);
////                       Exit;
//                       Ferro.Add(qrydet.fieldbyname('matricula').text);
//                       Gravar_temp_log(param,'É necessário associar os benefícios aos pensionistas para requerimento','');
//
//
//                       If dtmBaseDados.dbBaseDados.InTransaction
//                         Then dtmBaseDados.dbBaseDados.Rollback;
//
//
//
//
////                       qrydet.next;
////                       continue;
//                       MsgDlg( ' É necessário associar os benefícios aos pensionistas para requerimento.','Erro',mtError,[mbOk],0);//msg17
//                       exit;
//                       end;
//
//                    GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
//                    GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso));
//
//                    end
//                  ELSE
//                    begin
//                    // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Inicio
//                    // Wylliam Leite da Silva - SOL 252548 PPM 769593 - Inicio
//                    IDPESSOA := Trim(qrydet.FieldByName('IDPESSOA').AsString);
//                    IDTITULAR := Trim(qrydet.FieldByName('IDTITULAR').AsString);
//                    if (IDPESSOA <> IDTITULAR) then // Não gravar se IDPESSOA <> IDTITULAR
//                       //GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso))
//                    else
//                        GravarBfciarioTitPlan(qry2,IntToStr(iNumeroProcesso),idevento);
//                    // Wylliam Leite da Silva - SOL 252548 PPM 769593 - Fim
//                    GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
//                    GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso));
//                    // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Fim
//                    end;
//
//                  end;
}

          IDPESSOA := Trim(qrydet.FieldByName('IDPESSOA').AsString);
          IDTITULAR := Trim(qrydet.FieldByName('IDTITULAR').AsString);


          //edilaine - SIG55933 - inicio
          {verifica se existe perfil parametrizado}
          iIdPerfilInvest := BuscaPerfilInvestINSS(QryDet.FieldByName('IDPESSJUR').AsInteger,
                                                   QryDet.FieldByName('IDTITULAR').AsInteger,
                                                   QryDet.FieldByName('IDPLANOPREV').AsInteger,
                                                   QryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                                   -1,         //StrToInt(IdEvento),
                                                   -1,         //QryDet.FieldByName('IDSITPART').AsInteger,
                                                   QryDet.FieldByName('DIB').AsString,
                                                   bPerfilAtivo,
                                                   QryDet.FieldByName('IDPLANPREVCONTAB').AsInteger, // Alterado por FHBS - 09/08/2018 - SIG73169
                                                   );

          if (iIdPerfilInvest = -1) or ((iIdPerfilInvest > 0) and (not bPerfilAtivo)) then
          begin
            Ferro.Add(qrydet.fieldbyname('matricula').text);
            Gravar_temp_log(param,'O perfil de investimento do participante está inativo.','');


            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;

            MsgDlg('O perfil de investimento do participante está inativo.','Erro',mtError,[mbOk],0);
            exit;
          end;
          //edilaine - SIG55933 - fim


          // pensionista
          If (IDTITULAR <> IDPESSOA ) Then
            begin

              qry2.Close;
              qry2.SQL.Clear;
              qry2.SQL.ADD('select * from BFCIARIOTITPLAN where ' +
                  'IDPESSJUR ='+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' and '+
                  'IDTITULAR ='+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+'and  ' +
                  'IDPLANOORIGEM ='+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                  'IDPLANOPREV ='+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND ' +
                  'IDPESSOA ='+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                  'IDBENEFICIO ='+#39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39);
              Qry2.Open;

             If Qry2.IsEmpty then
               begin


                Ferro.Add(qrydet.fieldbyname('matricula').text);
                Gravar_temp_log(param,'É necessário associar os benefícios aos pensionistas para requerimento','');


                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

                MsgDlg( ' É necessário associar os benefícios aos pensionistas para requerimento.','Erro',mtError,[mbOk],0);


                exit;
               end;

             GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
             GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso), iIdPerfilInvest);
             GravaBenefPlanoPart(qry2);  //William Santana - SOL 251599.17194 PPM 783173
            end
          Else
            begin    //Aposentado

              GravarBfciarioTitPlan(qry2,IntToStr(iNumeroProcesso),idevento);
              GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
              GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso), iIdPerfilInvest);
              GravaBenefPlanoPart(qry2); //William Santana - SOL 251599.17194 PPM 783173

            end;
        //Término - William Santana - SOL 251599.17194 PPM 783173

       AtualizaBenefHabilita(qryaux,'1',inttostr(iNumeroProcesso),(inttostr(iIdEventoPrevG)));
//       AtualizaBenefHabilita(qryaux,'1',inttostr(iNumeroProcesso),(idevento));

       
       qrydet.edit;
       qryDetFLGREQUERIMENTO.text:='1';
//       qrydet.post;
//       qryDet.refresh;

       if cb_grava_indiv.Checked then
          begin
           If not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;
          dtmBaseDados.dbBaseDados.Commit;
          end;

       RegProc:=RegProc+1;

       qrydet.Next;
       end;


      end;
   end;


// Wylliam Leite da Silva - SOL 255596 PPM 822251 - Inicio
while not (qrydet.eof) do
begin
  if (IDPESSOA <> IDTITULAR) then // Não gravar se IDPESSOA <> IDTITULAR
  begin
     Fidpessoa.clear;
     Fmatricula.clear;
     FIdbenefh.clear;


     sbtnProcurarClick(sender);
     sbtnRequerer.Down:=false;
     sbtnProcurar.Down:=false;
     sbtnAlterar.Down:=false;
     Exit;
  end;

  qrydet.Next;
end;
// Wylliam Leite da Silva - SOL 255596 PPM 822251 - Fim


gera_impressao_requerimento;
qrydet.Filtered:=false;

//If not dtmBaseDados.dbBaseDados.InTransaction Then
//   dtmBaseDados.dbBaseDados.StartTransaction;

///verificar erro para mostrar uma das mensagens
if Ferro.Count>0 then
   begin

     if not cb_grava_indiv.Checked then
         begin


         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;
                     
         if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar o requerimento do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;


            buscarlog;
            end
          else
             begin
//             tbcDetalhe.tabindex:=1;
             buscarlog;



             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         buscarlog;
         MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar o requerimento do benefício. Verifique.','Erro',mtError,[mbOk],0);
         end
   end
else
   begin

      if not cb_grava_indiv.Checked then
         begin
         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;


         if MsgDlg( ' Requerimento efetuado com sucesso para as matrículas selecionadas.Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;



            buscarlog;
            end
          else
             begin

           //  tbcDetalhe.tabindex:=1;
             buscarlog;



             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         buscarlog;
         MsgDlg( '  Requerimento efetuado com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);
         end;
   end;

Fidpessoa.clear;
Fmatricula.clear;
FIdbenefh.clear;

//Início - William Santana - SOL 251599.17194 PPM 783173
  try
  finally
   FreeAndNil(FDependente); 
  end;
//Término William Santana - SOL 251599.17194 PPM 783173

sbtnProcurarClick(sender);
sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
sbtnAlterar.Down:=false;

//habilitaBotaoConceder; //William Santana - 218687.17129 PPM 757901 - removido SOL 251599.17194 PPM 783173

end;

procedure TFrmCadRequerBenefInssLote.sbtnApagarClick(Sender: TObject);
begin

//
  inherited;

end;

procedure TFrmCadRequerBenefInssLote.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

  PnlAltDet.Enabled := not(BeneficioRequerido); //Darivaldo Alencar SIG26527

IF qryDetISENTOIRRF.text = 'NÃO' THEN
   db_grid_irrf.ItemIndex:=1;

IF (qryDet.FieldByName('VALIDADO').AsString = 'S') then
    cb_validado.Checked := true
else
    cb_validado.Checked := false;

  qryEstado.open; //William Santana - SIG 26527

end;

procedure TFrmCadRequerBenefInssLote.bbtnDesfazerClick(Sender: TObject);
var
Fidpessoa,Ferro,Fmatricula,Fidbeneficio  : TStringList;
  achou,parada:Boolean;
  IDPESSOA: String; // Wylliam Leite da Silva - SOL 255596 PPM 822251
IDTITULAR: String; // Wylliam Leite da Silva - SOL 255596 PPM 822251
begin
Deletar_temp_log(qry2);
RegProc:=0;


 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

Fidbeneficio:= TStringList.Create;
Fidbeneficio.clear;
///

  inherited;

if Trim(cb_tipo_recebedor.Text) = '' then
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para desfazer o requerimento do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;//msg07


   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then
      begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para desfazer o requerimento do benefício.','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
      end; //msg08



if  not qrydet.IsEmpty then
   begin


   achou:=true;


      qrydet.First;
      while not qrydet.eof do
         begin

         Fidpessoa.Add(qrydet.FieldByName('idpessoa').Text);
         Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
         Fidbeneficio.Add(#39+qrydet.FieldByName('idbeneficio').Text+#39);


         qrydet.Next;
         end;


         RemoveDuplicates(Fidpessoa);
         RemoveDuplicates(Fmatricula);
         RemoveDuplicates(Fidbeneficio);




   qryaux.close;
   qryaux.SQL.Clear;
   QRYAUX.SQL.APPEND(' SELECT FLGREQUERIMENTO FROM BENEFHABILITA');
   QRYAUX.SQL.APPEND(' WHERE');
   QRYAUX.SQL.APPEND(' FLGREQUERIMENTO = 1');
   QRYAUX.SQL.APPEND(' AND IDPESSOA IN ('+Fidpessoa.COMMATEXT+')');
   qryaux.Open;
   qryaux.First;         


   if qryaux.IsEmpty then
     begin
     MsgDlg( ' A(S) matrículas selecionada(s) não possui(em) benefício requererido','Erro',mtError,[mbOk],0);
     qrydet.Filtered:=FALSE;
     Exit;
     end; //msg16




 //Rn019
{   qryaux.close;
   qryaux.SQL.Clear;


   QRYAUX.SQL.APPEND(' SELECT D.MATRICULA  ');
   QRYAUX.SQL.APPEND('   FROM DEPENTIT D');
   QRYAUX.SQL.APPEND(' WHERE D.IDPESSOA IN ('+FIDPESSOA.COMMATEXT+')');
   QRYAUX.SQL.APPEND('    AND EXISTS (SELECT MATRICULA');
   QRYAUX.SQL.APPEND('              FROM PREVIA P');
   QRYAUX.SQL.APPEND('             WHERE D.IDPESSOA = P.IDPESSOA');
   QRYAUX.SQL.APPEND('                AND IDBENEFICIO IN ('+FIDBENEFICIO.COMMATEXT+'))');

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

      MsgDlg( ' A(S) matrículas '+trocaCaracter(Ferro.CommaText,',','e')+' já teve (tiveram) o benefício processado pela folha de benefícios','Erro',mtError,[mbOk],0);
//      Gravar_temp_log(param,'A(S) matrículas'+ qrydet.fieldbyname('matricula').text+' não possui(em) RMI.Verifique','');//msg20
      Exit;
     end; //msg19
     }

//      If not dtmBaseDados.dbBaseDados.InTransaction Then
//         dtmBaseDados.dbBaseDados.StartTransaction;


{    if cb_grava_indiv.Checked = false then
        begin
        If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;
        end;
                }


   qrydet.First;
   while not qrydet.Eof do
      begin


   parada:=False;
   QRYDETCONCINSS.CLOSE;
   QRYDETCONCINSS.SQL.CLEAR;
   QRYDETCONCINSS.SQL.ADD('SELECT MESCOBRANCA FROM DETCONCINSS');
   QRYDETCONCINSS.SQL.ADD('WHERE IDPESSOA = '+#39 +QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39 );
   QRYDETCONCINSS.SQL.ADD(' AND  IDBENEFICIO = ' + QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT );
   QRYDETCONCINSS.SQL.ADD(' AND  IDPLANOPREV = ' + QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT );
   QRYDETCONCINSS.SQL.ADD(' AND  NUMPROCINSS = '+#39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39);
   QRYDETCONCINSS.SQL.ADD(' ORDER BY  MESREFERENCIA DESC');
   QRYDETCONCINSS.OPEN;
   while not QRYDETCONCINSS.eof do
       begin
       qryaux.close;
       QRYAUX.SQL.clear;
       QRYAUX.SQL.APPEND(' SELECT D.MATRICULA  ');
       QRYAUX.SQL.APPEND('   FROM DEPENTIT D');
       QRYAUX.SQL.APPEND(' WHERE D.IDPESSOA = ('+qrydet.fieldbyname('IDPESSOA').text+')');
       QRYAUX.SQL.APPEND('    AND EXISTS (SELECT MATRICULA');
       QRYAUX.SQL.APPEND('              FROM PREVIA P');
       QRYAUX.SQL.APPEND('             WHERE D.IDPESSOA = P.IDPESSOA');
       QRYAUX.SQL.APPEND('          AND MESCOBRANCA  ='+#39+QRYDETCONCINSS.fieldbyname('MESCOBRANCA').text+#39);
       QRYAUX.SQL.APPEND('                AND IDBENEFICIO = ('+qrydet.fieldbyname('IDBENEFICIO').text+'))');
       qryaux.Open;


      qryaux.First;
      Ferro.Clear;

      if not qryaux.IsEmpty then
         begin
         Ferro.Add(qrydet.fieldbyname('matricula').text);
         MsgDlg( ' A(S) matrículas '+trocaCaracter(Ferro.CommaText,',','e')+' já teve (tiveram) o benefício processado pela folha de benefícios','Erro',mtError,[mbOk],0);

//      Gravar_temp_log(param,'A(S) matrículas'+ qrydet.fieldbyname('matricula').text+' não possui(em) RMI.Verifique','');//msg20
 //     Exit;
//         qrydet.next;
//         continue;
         parada:=True;
         break;
         end; //




       QRYDETCONCINSS.next;
       end;


      if parada then
         begin
         qrydet.Next;
         Continue;
         end;

//

         qryaux.close;
         qryaux.SQL.Clear;
         QRYAUX.SQL.APPEND(' SELECT 1 ');
         QRYAUX.SQL.APPEND('   FROM benefbfciario');
         QRYAUX.SQL.APPEND(' WHERE IDSITBENEFICIO IN(1,2,3,5)');
         QRYAUX.SQL.APPEND('    AND IDPESSOA = '+#39+qrydet.fieldbyname('IDPESSOA').text+#39);
         QRYAUX.SQL.APPEND('    AND IDTITULAR = '+#39+qrydet.fieldbyname('IDTITULAR').text+#39);
         QRYAUX.SQL.APPEND('    AND NUMEROPROCESSO = '+#39+qrydet.fieldbyname('numeroprocesso').text+#39);
         QRYAUX.SQL.APPEND('    AND IDPLANOPREV = '+#39+qrydet.fieldbyname('IDPLANOPREV').text+#39);
         QRYAUX.SQL.APPEND('    AND IDBENEFICIO = '+#39+qrydet.fieldbyname('IDBENEFICIO').text+#39);
         QRYAUX.SQL.APPEND('    AND SEQPROPOSTA = '+#39+qrydet.fieldbyname('SEQPROPOSTA').text+#39);
         QRYAUX.SQL.APPEND('    AND ROWNUM = 1');
         qryaux.Open;

         IF not qryaux.IsEmpty then //cancedido
            begin
              //deletar movbenef,hstbenefbfciario,rubricaindiv
//            DeletarHSTBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);
            DeletarRubricaIndiv(qry2);       
            DeletarMovbenef(qry2,qrydet.fieldbyname('numeroprocesso').text);
            end;
         qryaux.close;



      if cb_tipo_recebedor.ItemIndex= 0 then
         begin
         DeletarEventoPrev(qryaux,qrydet.fieldbyname('eventogerador').text);
         DeletarHSTBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);//0
         DeletarBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);//1 TESTE
         // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Inicio
         // Wylliam Leite da Silva - SOL 252548 PPM 769593 -Inicio
         IDPESSOA := Trim(qrydet.FieldByName('IDPESSOA').AsString);
         IDTITULAR := Trim(qrydet.FieldByName('IDTITULAR').AsString);
         if (IDPESSOA <> IDTITULAR) then // Não gravar se IDPESSOA <> IDTITULAR
            //DeletarProcessoBenef(qry2,qrydet.fieldbyname('numeroprocesso').text)
         else
             DeletarBfciarioTitPlan(qry2);//2

         DeletarProcessoBenef(qry2,qrydet.fieldbyname('numeroprocesso').text) ;
         // Wylliam Leite da Silva - SOL 252548 PPM 769593 - Fim
         // Wylliam Leite da Silva - SOL 255596 PPM 822251 - Fim
            DeletarBenefPlanoPart(qry2);                                        //William Santana - SOL 251599.17194 PPM 783173
         end
      else
         begin
         DeletarEventoPrev(qryaux,qrydet.fieldbyname('eventogerador').text);
         DeletarHSTBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);//0
         DeletarBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);//1 TESTE
         DeletarProcessoBenef(qry2,qrydet.fieldbyname('numeroprocesso').text);
            DeletarBenefPlanoPart(qry2);                                        //William Santana - SOL 251599.17194 PPM 783173
         end ;



      AtualizaBenefHabilita(qryaux,'0','','');

      RegProc:=RegProc+1;

      if cb_grava_indiv.Checked then
         begin

         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;         

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         end;

      qrydet.Next;
      end;


   end;




     qrydet.Filtered:=FALSE;


///verificar erro para mostrar uma das mensagens
if Ferro.Count>0 then
   begin

   if not cb_grava_indiv.Checked then
         begin


         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;
            
         if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer o requerimento do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;
            buscarlog;            
            end
          else
             begin


             buscarlog;



             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         buscarlog;         
         MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer o requerimento do benefício. Verifique.','Erro',mtError,[mbOk],0);
         end;

   end
else
   begin

   if not cb_grava_indiv.Checked then
         begin

         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if MsgDlg( 'Requerimento cancelados com sucesso para as matrículas selecionadas. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;
            buscarlog;
            end
          else
             begin

//             tbcDetalhe.tabindex:=1;
             buscarlog;
             sbtnRequerer.Enabled:=false;
             bbtnDesfazer.Enabled:=false;


             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         buscarlog;
         MsgDlg( 'Requerimento cancelados com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0)
         end;

   end;
sbtnProcurarClick(sender);

sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
sbtnAlterar.Down:=false;

// habilitaBotaoConceder();  //William Santana - 218687.17129 PPM 757901 - removido SOL 251599.17194 PPM 783173

end;

procedure TFrmCadRequerBenefInssLote.bbtnOkDetClick(Sender: TObject);
begin
     //Darivaldo Alencar
     if (BeneficioConcedido)then
       begin
         MsgDlg('É necessário desfazer a concessão/requerimento do benefício para realizar a alteração.','Erro',mtError,[mbOk],0);
         exit;
       end;
      //Darivaldo Alencar

     if MsgDlg('Deseja gravar as alterações ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then //ms12
        begin

        if not cb_validado.Checked then
           begin
           if MsgDlg('Alterações foram efetuadas e o campo "Validado" está desmarcado - Deseja confirmar a alteração sem a validação ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrno then//msg25
              exit;
           end;


        if qryDet.fieldbyname('RMI').text='' then
           begin
           MsgDlg( ' A RMI para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;//msg21

        if (not IsDate(qryDet.fieldbyname('DIBANT').text)) and (trim(qryDet.fieldbyname('DIBANT').text)<>'')then
           begin
           MsgDlg( ' A DIB Anterior para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;//msg22


        inherited;
        ///grava as alteraçõs
        end
     else
         begin
         bbtnCancelarDetClick(Sender);
         //cancela as alterações
         end;
end;

procedure TFrmCadRequerBenefInssLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//
end;
                       
procedure TFrmCadRequerBenefInssLote.GravarEventoPrev(_query: TwwQuery;_EventoGerador:string); ///RN015

var
iIdEventoPrev: integer;
sIdEventoGerador: string;
sFlgEfetivado,sDataEfetivado ,sFlgSitFuncImed,sFlgSitPartImed,sFlgSitPlanoImed: string;
sIDSITFUNC,sIDSITPART ,sIDSITPLANOPREV: string;

begin
 iIdEventoPrev := LeUltRegistro(_query,'EVENTOSPREV');
 iIdEventoPrevG:=iIdEventoPrev;
 sIdEventoGerador:= _EventoGerador;  //129 0u 130 regra 015

//  sIdEventoGerador:= '131';  //teste


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
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO,MATRICULA,FLGCOBROUPATRO,FLGTPDEMISSAO,IDBENEFICIO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
//                                      qryDet.fieldbyname('idpessoa').text  + // Peterson victor SOL 271037 PPM 1350100
                                      QryDet.FieldByName('IDTITULAR').text + ',' + // Peterson victor SOL 271037 PPM 1350100
                                      qryDet.fieldbyname('IDPESSJUR').text + ',' +
                                      qryDet.fieldbyname('IDPLANOPREV').text + ',' + '1' + ',' +
                                      '''' + qryDet.fieldbyname('IDSITFUNC').text + '''' + ',' + qryDet.fieldbyname('IDSITPART').text + ',' + qryDet.fieldbyname('IDSITPLANOPREV').text + ',' +
                                      '''' + qryDet.fieldbyname('IDSITFUNC').text + '''' + ',' + //ok
                                      qryDet.fieldbyname('IDSITPART').text + ',' +   //ok
                                      qryDet.fieldbyname('IDSITPLANOPREV').text  + ',' + //ok
                                      sIdEventoGerador + ',' + '0' + ',' + '0' + ',' + '0' + ',' +  //sIdEventoGerador 129 0u 130 regra 015
                                      sDataEfetivado + ',' + '0' +','+OraNumero(qryDet.fieldbyname('InscNumero').text) + ', ' +
                                      'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) + ''',''DD/MM/YYYY''),'+
                                      // SOL 207975 KTN 2010873 Otacilio ** Inicio **
                                      { Ao passar o parametro da matricula não estava entre
                                        aspas o Oracle considerava como numero inteiro}
                                      QuotedStr(qryDet.fieldbyname('MATRICULA').text) +', '+
                                      // SOL 207975 KTN 2010873 Otacilio ** Fim **
                                       '1'+', '+
                                       '0'+', '+
                                       qryDet.fieldbyname('IDBENEFICIO').text+')');
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

procedure TFrmCadRequerBenefInssLote.AtualizaBenefHabilita(
  _query: TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
begin

if trim(_NUMEROPROCESSO)='' then
_NUMEROPROCESSO:='0';

if trim(_EVENTOGERADOR)='' then
_EVENTOGERADOR:='0';        


          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' UPDATE BENEFHABILITA set FLGCONCESSAO=0 , FLGREQUERIMENTO ='+#39+_flgrequerimento+#39+' , NUMEROPROCESSO ='+_NUMEROPROCESSO+', eventogerador='+_EVENTOGERADOR+' where IDBENEFHABILITA ='+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39);
          _query.ExecSQL;

end;

procedure TFrmCadRequerBenefInssLote.GravarBfciarioTitPlan(
  _query: TwwQuery;_NUMEROPROCESSO,_EventoGerador:STRING);
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
                    //     'NUMEROPROCESSO, ' +
                    //     'IDEVENTOGERADOR, ' +

                   //      'FLGACIDENTAL, ' +
                    //     'DTEVENTO, ' +
                    //     'DTDIREITO, ' +
                    //     'DTREGISTRO, ' +
                     //    'IDSITPROCESSO, ' +


                         'IDRESPONSAVEL) ' +
                      'VALUES  ' +
                        '('+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+', '+
                            #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
                            #39+'1'+#39+',  ' +
                         '0, ' +
                         '100, ' +
                     //    #39+_NUMEROPROCESSO+#39+',  ' +
                     //    #39+_EventoGerador+#39+',  ' +
                     //    #39+'0'+#39+',  ' +
                     //    'TO_DATE(''' + QRYDET.FIELDBYNAME('DIB').TEXT + ''',''DD/MM/YYYY''),'+
                     //    'TO_DATE(''' + QRYDET.FIELDBYNAME('DIB').TEXT + ''',''DD/MM/YYYY''),'+
                       //  'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY''),'+
                       ///  #39+'1'+#39+',  ' +

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

procedure TFrmCadRequerBenefInssLote.GravarProcessoBenef(_query: TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);


begin



          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO PROCESSOBENEF  ' +
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
          ''+'4'+')');  ////pendente de concessao.

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

procedure TFrmCadRequerBenefInssLote.GravarBENEFBFCIARIO(_query: TwwQuery;
  _NUMEROPROCESSO : string;
  iIdPerfilInvest : integer);   //edilaine - SIG55933
var dataant:string;
    valor, dataFinal:string; //William Santana - SOL 251599.17194 PPM 783173
begin
 if QRYDET.FIELDBYNAME('DIBANT').TEXT<>'' then
   dataant:=' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +',  '
 else
   dataant:='null'+',  ' ;

   //Início - William Santana - SOL 251599.17194 PPM 783173         
   If (qrydet.FieldByName('IDTITULAR').Text <> qrydet.FieldByName('IDPESSOA').Text) Then
    begin
      qryaux.close;
      qryaux.Sql.Clear;
      qryaux.Sql.Add(' SELECT PERCENTUAL FROM BFCIARIOTITPLAN WHERE  ');
      qryaux.Sql.Add(' IDTITULAR =     '+QuotedStr(QryDet.FieldByName('IDTITULAR').Text)   +' AND ');
      qryaux.Sql.Add(' IDPESSJUR =     '+QuotedStr(QryDet.FieldByName('IDPESSJUR').Text)   +' AND ');
      qryaux.Sql.Add(' IDPLANOPREV =   '+QuotedStr(QryDet.FieldByName('IDPLANOPREV').Text) +' AND ');
      qryaux.Sql.Add(' IDPLANOORIGEM = '+QuotedStr(QryDet.FieldByName('IDPLANOPREV').Text) +' AND ');
      qryaux.Sql.Add(' IDPESSOA =      '+QuotedStr(QryDet.FieldByName('IDPESSOA').Text)    +' AND ');
      qryaux.Sql.Add(' IDBENEFICIO =   '+QuotedStr(QryDet.FieldByName('IDBENEFICIO').Text));
      qryaux.Open;

      valor := FloatToStr( QryDet.FieldByName('RMI').AsFloat * (qryaux.FieldByName('PERCENTUAL').AsFloat/100) )
    end
   else
      valor := QryDet.FieldByName('RMI').Text;

    dataFinal := ValidaSentencaJudicial;
//Término - William Santana - SOL 251599.17194 PPM 783173

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO BENEFBFCIARIO ' +
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
          ' IDTPPAGTOBENEFIC, ' +
          ' VALORATUAL,       ' +
          ' DATAREQUERIMENTO, ' +
          ' DATAINICIO,       ' +
//          ' DATAFINAL,        ' +
          ' DATAFINAL,        ' +  //William Santana - SOL 251599.17194 PPM 783173
          ' FLGFORMAPAGTO,    ' +
          ' VALORCALCULADO,   ' +
//          ' DATAULTREAJUSTE,  ' +
          ' ULTMESPREPARO,      ' +
          ' VLRCALCINSS,      ' +
          ' VLRINFINSS,       ' +
          ' DATAINICIOINSS,   ' +
          ' NUMPROCINSS,     ' +
          ' DATAINICIOFUND,   ' +
//          ' VALORCOTAS,       ' +
          ' VALORTOTAL,       ' +
          ' FLGDATAPREVISTA,       ' +
          ' DFLOATPAGTO,       ' +
          ' PERCENTUAL,       ' +
          ' VALORNADIB,       ' +
          //' DATACONCESSAO,    ' +
//          ' FLGPROVISORIO,    ' +
//          ' PERCPROVISORIO,   ' +
//          ' PRAZOPROVISORIO,  ' +
//          ' ULTMESREAJUSTE,   ' +
//          ' ULTVALORATUALREAJ,' +
          ' DIBBENEFANT,      ' +
//          ' VALORBENEFANT,    ' +
//          ' VALORBINSSANT1,   ' +
//          ' VALORBINSSANT2,   ' +
//          ' VALORBINSSANT3,   ' +
//          ' FLGBENEFMIN,      ' +
//          ' VALORSRB,         ' +
          ' IDPLANOORIGEM,    ' +
          ' IDTITBENEF,    ' +
//          ' VALORNADIB,        ' +
          ' IDPLANPREVCONTAB,  ' +
          ' FONTEPAGADORA,     ' +
          ' QTDEPARCELAS,     ' +
          ' RESGATEPARCELADO,     ' +
//          ' PLACONTAD,         ' +
//          ' PLACONTAC,         ' +
//Início - William Santana - 218687.17129 PPM 757901
//         ' FLGPAGAINSS)       ' +
           ' FLGPAGAINSS,       ' +
           ' VALORBASE1,        ' +
           ' VALORBASE2,        ' +
           ' BENEFLEI142,       ' +
           ' TEMPOSERVICOANOS,  ' +
           ' TEMPOSERVICOMES,   ' +
           ' TEMPOSERVICODIAS,  ' +
           ' IDPERFILINVEST,    ' +    //edilaine - SIG55933
           ' DEC)   ' +
//Término - William Santana - 218687.17129 PPM 757901
///          ' VALORBASE1,        ' +
//          ' VALORBASE2,        ' +
//          ' VALORBASE3)        ' +   
        'values                ' +
          '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
           #39+'1'+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
  //         ':CODPORTFORMA,     ' +
           '4,   ' + ///IDSITBENEFICIO
//           '1,   ' + //          ':IDDEPENDENCIA,    ' +
           '1,   ' +//           ':IDTPPAGTOBENEFIC, ' +
//          #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' +    //William Santana - SOL 251599.17194 PPM 783173
           #39+ valor  +#39+',  ' +                  //William Santana - SOL 251599.17194 PPM 783173     //:VALORATUAL
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DATAREQUERIMENTO').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +  //          ':DATAINICIO,       ' +
 //          ':DATAFINAL,        ' +
          #39+ dataFinal  +#39+',  ' + //:DATAFINAL          //William Santana - SOL 251599.17194 PPM 783173
          #39+'F'+#39+',  ' + //          ':FLGFORMAPAGTO,    ' +
//          #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' + //          ':VALORCALCULADO,   ' +   //William Santana - SOL 251599.17194 PPM 783173
          #39+ valor  +#39+',  ' +                  //William Santana - SOL 251599.17194 PPM 783173     //:VALORATUAL
          #39+'0000/00'+#39+',  ' + //ULTTMESPREPARO
 //          ':DATAULTREAJUSTE,  ' +
           #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' +//          ':VLRCALCINSS,      ' +
           #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' + //          ':VLRINFINSS,       ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' + //          ':DATAINICIOINSS,   ' +
           #39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39+',  ' +
          ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +   //         ':DATAINICIOFUND,   ' +
  //         ':VALORCOTAS,       ' +
           #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' + //         ':VALORTOTAL,       ' +
           #39+'0'+#39+',  ' +//FLG/DATA PREVISTA
           #39+'0'+#39+',  ' +//DFLOATPAGTO
          #39+'100'+#39+',  ' +//PERCENTUAL VER
  //         ':VALORCOTAS,       ' +
           #39+QRYDET.FIELDBYNAME('RMI').TEXT+#39+',  ' + //         ':VALORNADIB,       ' +
 //          ':DATACONCESSAO,    ' +
 //          ':FLGPROVISORIO,    ' +
 //          ':PERCPROVISORIO,   ' +
 //          ':PRAZOPROVISORIO,  ' +
//           ':ULTMESREAJUSTE,   ' +
//           ':ULTVALORATUALREAJ,' +

            dataant+
//          ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
  ///         ':VALORBENEFANT,    ' +
 //          ':VALORBINSSANT1,   ' +
//           ':VALORBINSSANT2,   ' +
//           ':VALORBINSSANT3,   ' +
//           ':FLGBENEFMIN,      ' +
//           ':VALORSRB,         ' +
             #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +//IDTITBENEF
//           ':VALORNADIB,       ' +
             #39+QRYDET.FIELDBYNAME('Idplanprevcontab').TEXT+#39+',  '+//           ':IDPLANPREVCONTAB, ' +
             #39+'2'+#39+', '+
             #39+'0'+#39+', '+ //QTDEPARCELAS
             #39+'0'+#39+', '+ //RESGATEPARCELADO
//           ':PLACONTAD,        ' +
//           ':PLACONTAC,        ' +
//Início - William Santana - 218687.17129 PPM 757901
//             #39+'1'+#39+') ');//           ':FLGPAGAINSS') ');
             #39+QRYDET.FIELDBYNAME('FLGPAGAINSS').TEXT+#39+',  '+//           ':FLGPAGAINSS') ');
//Início - Luiz Carlos - SIG63479
             #39+QRYDET.FIELDBYNAME('PERCENTUALINSS').TEXT+#39+',  '+     //:VALORBASE1
             #39+QRYDET.FIELDBYNAME('INDICEREAJUSTETETO').TEXT+#39+',  '+         //:VALORBASE2
//Fim - Luiz Carlos - SIG63479
             #39+QRYDET.FIELDBYNAME('BENEFLEI142').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICOANOS').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICOMES').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICODIAS').TEXT+#39+',  '+

             #39+iif(iIdPerfilInvest = -1, '', IntToStr(iIdPerfilInvest))+#39+', ' +    //edilaine - SIG55933

             #39+QRYDET.FIELDBYNAME('DEC').TEXT   +#39+') ');
//Término - William Santana - 218687.17129 PPM 757901
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


procedure TFrmCadRequerBenefInssLote.DeletarBfciarioTitPlan(
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

procedure TFrmCadRequerBenefInssLote.DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BENEFBFCIARIO WHERE ' +
                         //Wylliam Leite da Silva - SOL 252548 PPM 769593 - Inicio
                         'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         //Wylliam Leite da Silva - SOL 252548 PPM 769593 - Fim
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

procedure TFrmCadRequerBenefInssLote.DeletarEventoPrev(_query: TwwQuery;
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

procedure TFrmCadRequerBenefInssLote.DeletarProcessoBenef(_query: TwwQuery;
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

procedure TFrmCadRequerBenefInssLote.Criar_temp(_query: TwwQuery);
begin

      If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;


TRY
_query.Close;
_query.RequestLive:=true;
_query.sql.Clear;
_query.sql.Add(' create global temporary table TEMPLOG ');
_query.sql.Add('  (matricula varchar2(15), ');
_query.sql.Add('  nome varchar2(60), ');
_query.sql.Add('  msgerro varchar2(150), ');
_query.sql.Add('  msgerrooracle varchar2(150))on commit preserve rows ');
_query.ExecSQL;
EXCEPT
_query.Close;
_query.sql.Clear;
_query.sql.Add(' delete global temporary table TEMP_LOG ');
_query.ExecSQL;  
Criar_temp(qryaux2);
end;

end;

procedure TFrmCadRequerBenefInssLote.Gravar_temp_log(_query: TwwQuery;_msgerro,_msgoracle:string);
begin      

_query.Close;
_query.sql.Clear;
_QUERY.SQL.ADD('INSERT INTO LOGREQUERLOTE ');
_QUERY.SQL.ADD('  (  ');
_QUERY.SQL.ADD('  IDBENEFHABILITA, ');
_QUERY.SQL.ADD('  MATRICULA, ');
_QUERY.SQL.ADD('  NOME, ');
_QUERY.SQL.ADD('  MSGERRO , ');
_QUERY.SQL.ADD('  MSGERROORACLE ');
_QUERY.SQL.ADD('  )  ');
_QUERY.SQL.ADD(' VALUES');
_QUERY.SQL.ADD('  (  ');
_QUERY.SQL.ADD(' '+#39+QRYDET.FIELDBYNAME('IDBENEFHABILITA').TEXT+#39+',');
_QUERY.SQL.ADD(' '+#39+QRYDET.FIELDBYNAME('MATRICULA').TEXT+#39+',');
_QUERY.SQL.ADD(' '+#39+QRYDET.FIELDBYNAME('NOME').TEXT+#39+',');
_QUERY.SQL.ADD(' '+#39+_MSGERRO+#39+',');
_QUERY.SQL.ADD(' '+#39+_MSGORACLE+#39);

_query.sql.Add('  )  ');
try
_query.ExecSQL;
except
end;

end;

procedure TFrmCadRequerBenefInssLote.FormShow(Sender: TObject);
begin
  inherited;
pnl_impressao.SendToBack;
pnl1.SendToBack;
// habilitaBotaoConceder; //William Santana - 218687.17129 PPM 757901 - removido SOL 251599.17194 PPM 783173
end;

procedure TFrmCadRequerBenefInssLote.DeletarHSTBENEFBFCIARIO(
  _query: TwwQuery; _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;
//   _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+_NUMEROPROCESSO);

          _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE ' +
                         //Wylliam Leite da Silva - SOL 252548 PPM 769593 - Inicio
                         'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         //Wylliam Leite da Silva - SOL 252548 PPM 769593 - Fim
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

procedure TFrmCadRequerBenefInssLote.DeletarMovbenef(_query: TwwQuery;
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

procedure TFrmCadRequerBenefInssLote.wwDBEdit10Change(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadRequerBenefInssLote.dtDataFinalChange(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadRequerBenefInssLote.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDetDIBANT.AsString := qryDetDIBANT.AsString;

end;

procedure TFrmCadRequerBenefInssLote.bbtnConfirmarClick(Sender: TObject);
//Darivaldo Alencar SIG26527 -Inicio
Function TrataNulo(sValor: String): String;
begin
  if (sValor = EmptyStr)then
     result:= Trim(QuotedStr(''))
  else
     result:= Trim(QuotedStr(sValor));
end;
//Darivaldo Alencar SIG26527 -Fim

begin
If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

QRYAUX2.CLOSE;
QRYAUX2.SQL.CLEAR;
QRYAUX2.SQL.ADD('UPDATE BENEFBFCIARIO');
QRYAUX2.SQL.ADD('SET');
QRYAUX2.SQL.ADD('  DIBBENEFANT = '+#39+DTDATAFINAL.TEXT+#39);
QRYAUX2.SQL.ADD('WHERE');
QRYAUX2.SQL.ADD('  IDTITULAR = '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND');
QRYAUX2.SQL.ADD('  IDBENEFICIO = '+#39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+' AND');
QRYAUX2.SQL.ADD('  IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
QRYAUX2.SQL.ADD('  AND  ROWNUM = 1');
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

 //Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - INICIO
//qryaux.close;
//qryaux.SQL.Clear;
//qryaux.SQL.Add('SELECT MAX(DC.RMREAJ) RMREAJ,'); //Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081
//qryaux.SQL.Add('       NUMPROCINSS,');
//qryaux.SQL.Add('       IDRUBRICA,');
//qryaux.SQL.Add('       MESREFERENCIA,');
//qryaux.SQL.Add('       SEQUENCIAL,');
//qryaux.SQL.Add('       MESCOBRANCA,');
//qryaux.SQL.Add('       RUBRICAINSS,');
//qryaux.SQL.Add('       IDPESSOA,');
//qryaux.SQL.Add('       IDBENEFICIO');
//qryaux.SQL.Add('  FROM DETCONCINSS DC');
//qryaux.SQL.Add(' WHERE DC.IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
//qryaux.SQL.Add('   AND DC.NUMPROCINSS = '+#39+qryDet.fieldbyname('NUMBENEFICIO').text+#39);
//qryaux.SQL.Add('   AND DC.DTINICIOCRED =');
//qryaux.SQL.Add('       (SELECT MIN(DC1.DTINICIOCRED)');
//qryaux.SQL.Add('          FROM DETCONCINSS DC1');
//qryaux.SQL.Add('         WHERE DC.IDPESSOA = DC1.IDPESSOA');
//qryaux.SQL.Add('           AND DC.NUMPROCINSS = DC1.NUMPROCINSS)');
////Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - Inicio
//qryaux.sql.add(' group by  NUMPROCINSS, ' +
//               ' IDRUBRICA, MESREFERENCIA, SEQUENCIAL, MESCOBRANCA, RUBRICAINSS, '+
//               ' IDPESSOA, IDBENEFICIO ORDER BY RMREAJ    DESC ');
////Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - Fim
//   try
//             qryaux.open;
//          except
//             on E:EDBEngineError do
//               begin
////                    MostrarErro(E);
//                    Gravar_temp_log(param,'',string(E.message));
//                    Exit;
//               end;
//          end;
//
//
//
//
//qryaux2.close;
//qryaux2.SQL.Clear;
//qryaux2.SQL.Add('UPDATE DETCONCINSS SET RMREAJ ='+#39+wwDBEdit10.text+#39);
//qryaux2.SQL.Add('  WHERE');
//qryaux2.SQL.Add('  NUMPROCINSS ='+#39+qryaux.FieldByName('NUMPROCINSS').text+#39);
//qryaux2.SQL.Add('AND IDRUBRICA='+#39+qryaux.FieldByName('IDRUBRICA').text+#39);
//qryaux2.SQL.Add('AND MESREFERENCIA='+#39+qryaux.FieldByName('MESREFERENCIA').text+#39);
//qryaux2.SQL.Add('AND SEQUENCIAL='+#39+qryaux.FieldByName('SEQUENCIAL').text+#39);
//qryaux2.SQL.Add('AND MESCOBRANCA='+#39+qryaux.FieldByName('MESCOBRANCA').text+#39);
//qryaux2.SQL.Add('AND RMREAJ ='+#39+qryaux.FieldByName('RMREAJ').text+#39);
//qryaux2.SQL.Add('AND RUBRICAINSS='+#39+qryaux.FieldByName('RUBRICAINSS').text+#39);
//   try
//             qryaux2.ExecSQL;
//          except
//             on E:EDBEngineError do
//               begin
////                    MostrarErro(E);
//                    Gravar_temp_log(param,'',string(E.message));
//                    Exit;
//               end;
//          end;
//
// qryaux2.CLOSE;
// qryaux.CLOSE;
//Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - FIM

qryaux.close;
qryaux.sql.clear;
// Darivaldo Alencar SIG26527 -inicio
//qryaux.sql.add('update benefhabilita set rmi = '  + wwDBEdit10.text + ', ' +
qryaux.sql.add('UPDATE BENEFHABILITA SET '+
               ' RMI                =' + TrataNulo(qryDet.fieldbyname('RMI').AsString) + ', '+
               ' NUMBENEFICIO       =' + TrataNulo(qryDet.fieldbyname('NUMBENEFICIO').AsString) + ', '+
               ' NUMBRDP            =' + TrataNulo(qryDet.fieldbyname('NUMBRDP').AsString) + ', '+
               ' DATAREQUERIMENTO   =' + TrataNulo(qryDet.fieldbyname('DATAREQUERIMENTO').AsString) + ', '+
               ' DEC                =' + TrataNulo(qryDet.fieldbyname('DEC').AsString) + ', '+
               ' DIB                =' + TrataNulo(qryDet.fieldbyname('DIB').AsString) + ', '+
               ' DIP                =' + TrataNulo(qryDet.fieldbyname('DIP').AsString) + ', '+
               ' ESTADO             =' + TrataNulo(qryDet.fieldbyname('ESTADO').AsString) + ', '+
               ' NUP                =' + TrataNulo(qryDet.fieldbyname('NUP').AsString)  + ', '+
               ' FLGPAGAINSS        =' + TrataNulo(qryDet.fieldbyname('FLGPAGAINSS').AsString) + ', '+
               ' BENEFLEI142        =' + TrataNulo(qryDet.fieldbyname('BENEFLEI142').AsString) + ', '+
               ' TEMPOSERVICOANOS   =' + TrataNulo(qryDet.fieldbyname('TEMPOSERVICOANOS').AsString) + ', '+
               ' TEMPOSERVICOMES    =' + TrataNulo(qryDet.fieldbyname('TEMPOSERVICOMES').AsString) + ', '+
               ' TEMPOSERVICODIAS   =' + TrataNulo(qryDet.fieldbyname('TEMPOSERVICODIAS').AsString) + ', '+
               ' PERCENTUALINSS     =' + TrataNulo(qryDet.fieldbyname('PERCENTUALINSS').AsString)  + ', '+
               ' INDICEREAJUSTETETO =' + TrataNulo(qryDet.fieldbyname('INDICEREAJUSTETETO').AsString) + ', '+
               ' FLGSENTENCAJUDICIAL=' + TrataNulo(qryDet.fieldbyname('FLGSENTENCAJUDICIAL').AsString) + ', '+
               // Darivaldo Alencar SIG26527 -fim

               ' validado = ' + QuotedStr(pIsValidado) +
               ' where idbenefhabilita = ' + qryDet.fieldbyname('IDBENEFHABILITA').AsString);
qryaux.execsql;


QRYAUX2.CLOSE;
QRYAUX2.SQL.CLEAR;
QRYAUX2.SQL.ADD('UPDATE PESSOAFISICA');
QRYAUX2.SQL.ADD('SET');
IF DB_GRID_IRRF.ITEMINDEX = 0 THEN
   QRYAUX2.SQL.ADD('  FLGISENTOIRRF = 1')///ISENTO
ELSE
   QRYAUX2.SQL.ADD('  FLGISENTOIRRF = 0');
QRYAUX2.SQL.ADD('WHERE');
QRYAUX2.SQL.ADD('  IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);

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

procedure TFrmCadRequerBenefInssLote.Button1Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('S','');
end;

procedure TFrmCadRequerBenefInssLote.Button2Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('N','');
end;

procedure TFrmCadRequerBenefInssLote.qryDetAfterOpen(DataSet: TDataSet);
begin
//  inherited;
lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';
end;

procedure TFrmCadRequerBenefInssLote.bbtnSelTudoClick(Sender: TObject);
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

procedure TFrmCadRequerBenefInssLote.bbtnInverteClick(Sender: TObject);
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

procedure TFrmCadRequerBenefInssLote.DeletarRubricaIndiv(_query: TwwQuery);
begin


   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   // edilaine - SIG22026 - inicio
   //_QUERY.SQL.ADD('DELETE RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
   _QUERY.SQL.ADD('DELETE FROM  RUBRICAINDIV WHERE IDMOVBENEF IN (SELECT IDMOVBENEF FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+qrydet.fieldbyname('numeroprocesso').text+')');
   // edilaine - SIG22026 - fim

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

procedure TFrmCadRequerBenefInssLote.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 // inherited;
end;

procedure TFrmCadRequerBenefInssLote.Deletar_temp_log(_query: TwwQuery);
begin

_query.Close;
_query.sql.Clear;
_QUERY.SQL.ADD('DELETE FROM LOGREQUERLOTE ');
_query.ExecSQL;

end;

procedure TFrmCadRequerBenefInssLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Deletar_temp_log(qry2);
end;

procedure TFrmCadRequerBenefInssLote.FormActivate(Sender: TObject);
begin
  inherited;
//Deletar_temp_log(qry2);
cb_tipo_recebedor.ItemIndex:=0;
end;

procedure TFrmCadRequerBenefInssLote.RemoveDuplicates(
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

procedure TFrmCadRequerBenefInssLote.FormCreate(Sender: TObject);
begin
  inherited;
 FIdbenefh:= TStringList.Create;
 pIsValidado := 'N';

 //Início - William Santana - SIG 26527
 rg_molestia.visible:= false;//Darivaldo Alencar SIG 26527
 qryDet.Active := true;
 Self.Left := 10;
 Self.top := 10;
 //Término - William Santana SIG 26527
end;

procedure TFrmCadRequerBenefInssLote.dbgrdDetTitleButtonClick(
  Sender: TObject; AFieldName: String);
var  
    campo:string;
begin
  inherited;

campo:=AFieldName;
//application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

buscarequerimentos('S',campo);
end;

procedure TFrmCadRequerBenefInssLote.cb_validadoClick(Sender: TObject);
begin
  inherited;
  if (cb_validado.checked) then
    pIsValidado := 'S'
  else
    pIsValidado := 'N';
end;

//Início - William Santana - 218687.17129 PPM 757901
procedure TFrmCadRequerBenefInssLote.sbtnConcederClick(Sender: TObject);
begin
  inherited;
  close;
  AbrirForm(FrmCadConcederBenefInssLote,TFrmCadConcederBenefInssLote, False);
  FrmCadConcederBenefInssLote.sbtnProcurar.Click;
end;

procedure TFrmCadRequerBenefInssLote.habilitaBotaoConceder();
begin
//Início - William Santana SOL 251599.17194 PPM 783173
//  qryConceder.close;
//  qryConceder.Open;
//
//  sbtnConceder.Enabled := not(qryConceder.IsEmpty);
//Término - William Santana SOL 251599.17194 PPM 783173
end;
//Término - William Santana - 218687.17129 PPM 757901

//Início - William Santana - SOL 249376.17130 PPM 757902

procedure TFrmCadRequerBenefInssLote.pdtlbnd1BeforePrint(Sender: TObject);
begin
  inherited;
  if (pdbtxtBenefFora.text = 'Sim') and (qryDet.FieldByName('FLGPAGAINSS_SN').AsString = 'Sim') then
  begin
    plblDEC.Visible := false;
    pdbtxtDEC.Visible := false;
  end
  else
  begin
    plblDEC.Visible := true;
    pdbtxtDEC.Visible := true;
  end;

  plbl_CPF.Caption := FormatMaskText('999.999.999-99;0', qryDet.FieldByName('CPF').AsString);

  plbl_anos.Caption := qryDet.FieldByName('TEMPOSERVICOANOS').AsString + ' Anos '  +
                       qryDet.FieldByName('TEMPOSERVICOMES').AsString + ' Meses ' +
                       qryDet.FieldByName('TEMPOSERVICODIAS').AsString + ' Dias ' ;

  qryaux2.close;
  qryaux2.SQL.Clear;
  qryaux2.sql.Add('SELECT BB.NUMEROPROCESSO FROM BENEFBFCIARIO BB ');
  qryaux2.sql.Add(' WHERE BB.IDSITBENEFICIO = 4 ');
  qryaux2.sql.Add(' AND BB.IDPESSOA ='+#39+qrydet.FieldByName('IDPESSOA').AsString+#39);
  qryaux2.sql.Add(' AND BB.IDTITULAR ='+#39+qrydet.FieldByName('IDTITULAR').AsString+#39);

  qryaux2.Open;

  Lbl_numProcesso.Caption := qryaux2.FieldByName('NUMEROPROCESSO').Text;
  Lbl_BenefReq.Caption  := iff(qryaux2.IsEmpty, 'NÃO', 'SIM') ;

end;

procedure TFrmCadRequerBenefInssLote.plbl_msgimpeditivaPrint(
  Sender: TObject);
begin
  inherited;

  qryaux.Active:=false;
  qryaux.SQL.Clear;
  qryaux.sql.Add('SELECT msgerro FROM LOGREQUERLOTE');
  qryaux.sql.Add(' WHERE IDBENEFHABILITA='+#39+qrydet.FieldByName('IDBENEFHABILITA').AsString+#39);
  qryaux.OPEN;


  plbl_msgimpeditiva.Caption := qryaux.FieldByName('msgerro').AsString;
  qryaux.Active:=false;
  
end;
//Término - William Santana - SOL 249376.17130 PPM 757902

//Início - William Santana - SOL 251599.17194 PPM 783173
procedure TFrmCadRequerBenefInssLote.GravaBenefPlanoPart(_query: TwwQuery);

begin

    _query.Close;
    _query.Sql.Clear;
    _query.Sql.Add('INSERT INTO BENEFPLANOPART ' +
    '( IDPESSJUR,   '+
      'SEQPROPOSTA, '+
      'IDPLANOPREV, '+
      'IDPESSOA,    '+
      'IDBENEFICIO, '+
      'VALORBASE1,  '+
      'VALORBASE2)  '+
    'values                ' +
      '(' + IntToStr(QryDet.FieldByName('IDPESSJUR').AsInteger) +',  ' +
        '1' +',  ' +
       IntToStr(QryDet.FieldByName('IDPLANOPREV').AsInteger) +',  ' +
       IntToStr(QryDet.FieldByName('IDTITULAR').AsInteger) +',  ' +           //IDPESSOA
       IntToStr(QryDet.FieldByName('IDBENEFICIO').AsInteger) +',  ' +
//Início - Luiz Carlos - SIG63479
       IntToStr(QryDet.FieldByName('PERCENTUALINSS').AsInteger) +',  ' +      //VALORBASE1
       IntToStr(QryDet.FieldByName('INDICEREAJUSTETETO').AsInteger) +') ');   //VALORBASE2
//Fim - Luiz Carlos - SIG63479

        try
           _query.ExecSQL;
        except
           on E:EDBEngineError do
             begin
                  Gravar_temp_log(param,'',string(E.message));
                  Exit;
             end;
        end;

end;

procedure TFrmCadRequerBenefInssLote.DeletarBenefPlanoPart(_query:TwwQuery);
begin

          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add('DELETE FROM BENEFPLANOPART WHERE ' +
                         'IDPESSJUR =     '+ IntToStr(QryDet.FieldByName('IDPESSJUR').AsInteger)   +' AND '+
                         'IDPLANOPREV =   '+ IntToStr(QryDet.FieldByName('IDPLANOPREV').AsInteger) +' AND ' +
                         'IDPESSOA =      '+ IntToStr(QryDet.FieldByName('IDTITULAR').AsInteger)   +' AND ' +
                         'IDBENEFICIO =   '+ IntToStr(QryDet.FieldByName('IDBENEFICIO').AsInteger) +' AND ' +
                         'SEQPROPOSTA =  1 ');

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

function TFrmCadRequerBenefInssLote.ValidaSentencaJudicial(): string;
var
 dataFinal: string;
begin
  dataFinal := EmptyStr;

  if (qrydet.FieldByName('IDTITULAR').Text = qrydet.FieldByName('IDPESSOA').Text) then   //Aposentadoria
  begin
    if (qrydet.FieldByName('FLGSENTENCAJUDICIAL').AsInteger = 1) then
      dataFinal := qrydet.FieldByName('DATAFINAL').Text;
  end
  else  //pensionista
  begin
    if (qrydet.FieldByName('FLGSENTENCAJUDICIAL').AsInteger = 0) then
    begin
      QryAux2.Close;
      QryAux2.Sql.Clear;
      QryAux2.Sql.Add(' SELECT DEP.IDSITDEPENDENTE, DT.IDDEPENDENCIA , ADD_MONTHS(PF.DATANASC, 12*21) ANOS  ');
      QryAux2.Sql.Add(' FROM  PESSOAFISICA PF, DEPENTIT DT, DEPENDENTE DEP     ');
      QryAux2.Sql.Add(' WHERE PF.IDPESSOA = DT.IDPESSOA                        ');
      QryAux2.Sql.Add(' AND PF.IDPESSOA = DEP.IDPESSOA                         ');
      QryAux2.Sql.Add(' AND DT.IDPESSOA = '+ QuotedStr(qrydet.FieldByName('IDPESSOA').Text) );
      QryAux2.Open;

      if (QryAux2.FieldByName('IDSITDEPENDENTE').AsInteger = 1 ) and
        ( FDependente.IndexOf(QryAux2.FieldByName('IDDEPENDENCIA').AsString ) < 0 ) then
         dataFinal :=  QryAux2.FieldByName('ANOS').Text;

      if (QryAux2.FieldByName('IDSITDEPENDENTE').AsInteger = 2 ) and
         (qrydet.FieldByName('FLGSENTENCAJUDICIAL').AsInteger = 1)  then
           dataFinal := qrydet.FieldByName('DATAFINAL').Text;
    end
    else
     dataFinal := qrydet.FieldByName('DATAFINAL').Text;
  end ;

 result := dataFinal;
end;

procedure TFrmCadRequerBenefInssLote.CombosDropDown(Sender: TObject);
 var
   iWIDTH, i : integer ;
begin
  inherited;

  iWIDTH := 145;

  for i := 0 to Tcombobox(Sender).items.Count do
  begin
    if iWIDTH < Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]) then
    iWIDTH := Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]);
  end;

  Tcombobox(Sender).Perform(CB_SETDROPPEDWIDTH, iWIDTH + 10, 0);

end;
//Término - William Santana - SOL 251599.17194 PPM 783173

//Darivaldo Alencar SIG26527 -inicio
procedure TFrmCadRequerBenefInssLote.bbtnFiltrarClick(Sender: TObject);
var
  sFiltro: String;

Function TrataFiltro(sCampo: String):String;
begin
    if (sFiltro <> EmptyStr) then
         result := sFiltro + ' AND ' + sCampo
    else result := sCampo;
end;

begin
  inherited;
  sFiltro:= EmptyStr;
  try
    Screen.Cursor:= crSQLWait;
    if (dbedMatricula.Text <> EmptyStr) then
          sFiltro := TrataFiltro('MATRICULA = ' + QuotedStr(Trim(dbedMatricula.Text)));

    if (dbedNumBenef.Text <> EmptyStr) then
          sFiltro := TrataFiltro('NUMBENEFICIO = ' + QuotedStr(Trim(dbedNumBenef.Text)));

    if (dtpDer.Text <> EmptyStr) then
          sFiltro := TrataFiltro('DATAREQUERIMENTO = ' + QuotedStr(Trim(dtpDer.Text)));

    if (dbedNome.Text <> EmptyStr) then
          sFiltro := TrataFiltro('NOME = ' + QuotedStr(Trim(dbedNome.Text)));

    if (dbedNmBenef.Text <> EmptyStr) then
          sFiltro := TrataFiltro('BENEFICIO = ' + QuotedStr(Trim(dbedNmBenef.Text)));

    qryDet.Filtered := False;
    qryDet.Filter   := sFiltro;
  if (sFiltro<> EmptyStr) then
     qryDet.Filtered := True;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

function TFrmCadRequerBenefInssLote.BeneficioConcedido: Boolean;
var  QryC: TwwQuery;
begin
  try
    QryC:= TwwQuery.Create(nil);
    QryC.DatabaseName := 'BaseDados';
    if (qryDet.FieldByName('NUMEROPROCESSO').AsString <> EmptyStr) then
      begin
        FazQuery(QryC,'SELECT DATACONCESSAO FROM BENEFBFCIARIO WHERE NUMEROPROCESSO ='+ qryDet.FieldByName('NUMEROPROCESSO').AsString);
        result:= not(QryC.FieldByName('DATACONCESSAO').IsNull);
      end
    else result:= false;
  finally
    FreeAndNil(QryC);
  end;
end;

function TFrmCadRequerBenefInssLote.BeneficioRequerido: Boolean;
var  QryR: TwwQuery;
begin
  try
    QryR:= TwwQuery.Create(nil);
    QryR.DatabaseName := 'BaseDados';
    if (qryDet.FieldByName('NUMEROPROCESSO').AsString <> EmptyStr) then
      begin
        FazQuery(QryR,'SELECT IDSITBENEFICIO,DATAREQUERIMENTO FROM BENEFBFCIARIO WHERE NUMEROPROCESSO='+ qryDet.FieldByName('NUMEROPROCESSO').AsString);
        result:= (QryR.FieldByName('IDSITBENEFICIO').asInteger in[1,2,4]);
      end
    else result:= False;
  finally
    FreeAndNil(QryR);
  end;
end;

procedure TFrmCadRequerBenefInssLote.IntegerKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(key in ['0'..'9',#8,#13]) then
    key := #0;

end;
          
procedure TFrmCadRequerBenefInssLote.NumericKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if not(key in ['0'..'9',',',#8,#13, DecimalSeparator]) then
    key := #0;

end;

procedure TFrmCadRequerBenefInssLote.DecimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key in ['0'..'9', ',', #8, #13, DecimalSeparator]) then
  begin
   if (Key = DecimalSeparator) and
      (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
         Key := #0
   else
   if (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) and (key <> #8) and
    (Length(Copy(TEdit(Sender).Text, Pos(DecimalSeparator, TEdit(Sender).Text ) + 1, 3 )) >= 2)
   then Key := #0;
  end
  else Key := #0;

end;

//Darivaldo Alencar SIG26527 -fim


end.

