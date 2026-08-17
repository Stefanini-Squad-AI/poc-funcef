{
***************************** REGISTRO DE ALTERAÇÕES **********************************
***************************************************************************************
---------------------------------------------------------------------------------------
//Pendência   : SIG 78406
//Responsável : Darivaldo Alencar
//Data        : 11/12/2018
//Descrição   : Ordenação na grid por matricula
---------------------------------------------------------------------------------------
//Pendência   : SIG 71864
//Responsável : Edilaine
//Data        : 17/07/2018
//Descrição   : Ajuste no filtro de mescobrança para considerar lançamentos só do mês selecionado
---------------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
//Pendência   : SIG 32962
//Responsável : Andre Imakawa
//Data        : 11/11/2016
//Descrição   : Falta Exclução da EventoXDocum
---------------------------------------------------------------------------------------
//Pendência   : SIG 27216
//Responsável : William Santana
//Data        : 16/09/2016
//Descrição   : Correção na forma de atualização da dívida
---------------------------------------------------------------------------------------
//Pendência   : SOL 254904 PPM 808325
//Responsável : Helio Lima Custódio
//Data        : 28/05/2015
//Descrição   : ERRO O VALORULTIMAPARCELA deve ser atualizado independente do CODPOTFORMA
// ------------------------------------------------------------------------------------
//Pendência   : SOL 237951 PPM 493275
//Responsável : Fernando Xavier
//Data        : 05/09/2014
//Descrição   : ERRO CONTABILIZAÇÃO DIVIDA BENEFICIO: adequar o módulo Folha de
//              Benefícios a documentação atualizada e homologada da
//              funcionalidade de Controle de dívida de Benefícios
// ------------------------------------------------------------------------------------
Pendência   : SOL 232999/16147 PPM 409169
Responsável : Fernando Xavier
Data        : 09/06/2014
Descrição   : ao efetuar o envio das parcelas o sistema não esta efetivanto a operação.
---------------------------------------------------------------------------------------
Pendência   : SOL 231343 PPM 373759
Responsável : William Moreira da Silva
Data        : 06/05/2014
Descrição   : Ajuste na consulta responsavel por filtrar as dividas na condição de Operação de Envio e Cobrança Enviada.
---------------------------------------------------------------------------------------
Pendência   : SOL 231370 PPM 373133
Responsável : William Moreira da Silva
Data        : 06/05/2014
Descrição   : Processo esta inserindo a quantidade de parcelas incorreta.
---------------------------------------------------------------------------------------
Pendência   : SOL 230290 KINTANA 350993
Responsável : Fernando Xavier
Data        : 02/05/2014
Descrição   : Ajustar a rotina de envio para que grave o plano contabil corretamente.
---------------------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
---------------------------------------------------------------------------------------
Pendência   : SOL 228648 KINTANA 2062629
Responsável : Fernando Xavier
Data        : 25/03/2014
Descrição   : Ajustar a rotina de envio para que grave o plano contabil corretamente.
---------------------------------------------------------------------------------------

}
unit FCtrlDiviBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, StdCtrls, Spin, TB97Ctls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  MontaSelect,uCtrlPadroes,uCtrlDocumento,UMensErro,UDataBase,UAdmPrev,USistema,DBaseDados,
  ppVar, ppModule, raCodMod, ppBands, jpeg, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppParameter,FPreview,FSelecionaLote, uIntegraBack, UDiasUteis;

type
  TFrmCtrlDiviBenef = class(TfrmSairAjuda)
    sbtnProcurar2: TToolbarButton97;
    rgATUALIZARS: TRadioGroup;
    rgTipoOp: TRadioGroup;
    rgTIPOCOB: TRadioGroup;
    TabControlDetalhe1: TTabControlDetalhe;
    dbgrdDet: TwwDBGrid;
    Dock973: TDock97;
    Button1: TButton;
    Toolbar971: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    btnProcessar: TBitBtn;
    bbtnDesfazer: TmaHelpBitBtn;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDet: TwwDataSource;
    MontaSelect: TMontaSelect;
    qryDetSelecionar: TStringField;
    qryDetMatrcula: TStringField;
    qryDetNome: TStringField;
    qryDetPlanoContab: TFloatField;
    qryDetBenefcio: TStringField;
    qryDetDtLancDvida: TDateTimeField;
    qryDetVlrBenef: TFloatField;
    qryDetSaldoDevIni: TFloatField;
    qryDetSaldoDevAtual: TFloatField;
    qryDetUltParcela: TFloatField;
    qryDetVlrParcela: TFloatField;
    qryDetIniCobr: TDateTimeField;
    qryDetFimCobr: TDateTimeField;
    qryDetPercentual: TFloatField;
    qryDetQtdePagas: TFloatField;
    qryDetQtdeParcelas: TFloatField;
    qryDetAtualizarSaldo: TStringField;
    qryDetFLGSITUACAO: TFloatField;
    qryDetIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryDetIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryRelatorio: TwwQuery;
    dsControleDivida: TwwDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    UpdateSQL1: TUpdateSQL;
    ppParameterList1: TppParameterList;
    qryRelatorioSelecionar: TStringField;
    qryRelatorioMatrcula: TStringField;
    qryRelatorioNome: TStringField;
    qryRelatorioPlanoContab: TFloatField;
    qryRelatorioBenefcio: TStringField;
    qryRelatorioDtLancDvida: TDateTimeField;
    qryRelatorioVlrBenef: TFloatField;
    qryRelatorioSaldoDevIni: TFloatField;
    qryRelatorioSaldoDevAtual: TFloatField;
    qryRelatorioUltParcela: TFloatField;
    qryRelatorioVlrParcela: TFloatField;
    qryRelatorioIniCobr: TDateTimeField;
    qryRelatorioFimCobr: TDateTimeField;
    qryRelatorioPercentual: TFloatField;
    qryRelatorioQtdePagas: TFloatField;
    qryRelatorioQtdeParcelas: TFloatField;
    qryRelatorioAtualizarSaldo: TStringField;
    qryRelatorioFLGSITUACAO: TFloatField;
    qryRelatorioIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryRelatorioIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryRelatorioIDPESSOA: TFloatField;
    qryRelatorioIDTITULAR: TFloatField;
    qryRelatorioIDPESSJUR: TFloatField;
    qryRelatorioIDBENEFICIO: TFloatField;
    qryRelatorioIDPLANOPREV: TFloatField;
    qryRelatorioIDMOTIVO: TFloatField;
    qryRelatorioCODDOCUMENTO: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel41: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLabel68: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppHeaderBand3: TppHeaderBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppShape5: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape6: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppShape7: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppShape8: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppShape9: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape10: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape11: TppShape;
    ppLabel21: TppLabel;
    ppShape12: TppShape;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape13: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape14: TppShape;
    ppLabel26: TppLabel;
    ppShape15: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape16: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape17: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel31: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    Toolbar972: TToolbar97;
    ToolbarSep9711: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    qryDetCODDOCUMENTO: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetCODPORTFORMA: TFloatField;
    btnProcurar: TBitBtn;
    grpMESCOB: TGroupBox;
    cbbMes: TComboBox;
    seAno: TSpinEdit;
    qryDetNUMEROPARCELA: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    ppDBText16: TppDBText;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    qryDetSITUACAODIVIDA: TStringField;
    qryDetDATAPREVISTA: TDateTimeField;
    qryDetVALORPREVISTO: TFloatField;
    qryDetFLGDESCFOLHA: TStringField;
    qryDetPRIMEIROMESCOBR: TStringField; // SOL 230290 KINTANA 350993
    procedure setPadraoInicial(_flag:Boolean);
    procedure seAnoChange(Sender: TObject);
    function Mensagens(_idmsg:Integer):string;
    procedure Consulta();
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure ExecutarPreparo;
    procedure ExecutarEnvio;
    procedure ExecutarRecebimento;
    procedure InserirHSTDIVIDABENEFICIO(_IDCONTROLE,_IDPESSOA,_IDTITULAR,_IDPESSJUR,_IDBENEFICIO,_IDPLANOPREV,_MESREFERENCIA,_MESCOBRANCA,_VLQUITACAO,_dataprevista,_FLGDESCFOLHA,_FLGSITUACAO,_flgParcial, _codportforma:string);
    procedure bbtnSairClick(Sender: TObject);
    procedure UpdateHSTDIVIDABENEFICIO(_flgsituacao:string; _flgdescfolha:string = ''); // SOL 230290 KINTANA 350993
    procedure ExecutarDesfazerPreparo;
    procedure ExecutarDesfazerRecebimento;
    function  VerificarRecebimentoTMPDESC : Boolean;  // edilaine - 22/01/2014 - SOL 174933
    procedure gerar_impressao;
    procedure ExecSaveRel(var Rpt: TppReport);

    function LancaDoc(iCodLancCAPCAR, PlnCodigo, iidPessoa,
      idblkNovoPortForma, iUnidNegoc, iCodTipDoc : integer; sdtenvio, sdtvencto,
      sNoDocumento, smmMotivo, sTipRecDes, sCentroRespon, sContaCliFor,
      RecPag: string; valor: real; aicodforma: integer): Boolean;
    function RetornaSaldoAtualizado(_datainicio:string;_saldodevedoratual:Double):Double;
    function RetornaSaldoAtualizadoRegReplan(_saldodevedoratual:Double):Double;

    function RetornaIndiceAcumulado(pData: string): Double;  //William Santana - SIG 27216

    procedure bbtnDesfazerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbgrdDetDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure btnProcurarClick(Sender: TObject);
    procedure rgTipoOpClick(Sender: TObject);
  private
    { Private declarations }
  ctrlDocumento: tctrlDocumento;
  public
    { Public declarations }
   lCodLancCAPCAR:longint;
   iIdLoteConcessao,iFlgIncluiMesConc:Integer;
   sAnoMesLoteConcessao :string;
   pdesPrc:Boolean;    
  end;

var
  FrmCtrlDiviBenef: TFrmCtrlDiviBenef;

implementation

{$R *.DFM}

{ TFrmCtrlDiviBenef }


// edilaine - 22/01/2014 - SOL 174933
function iif(condicao : boolean; sVlrTrue, sVlrFalse : string) : string;
begin
  if condicao then result := sVlrTrue
              else result := sVlrFalse;
end;

procedure ExecDeleteDocumento(sCodDocumento : string);
var ctrlDocumento: tctrlDocumento; // Andre Imakawa - SIG 32962

begin
  // Andre Imakawa - SIG 32962 - Inicio
  Try
    try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
    except
      FreeAndNil(CtrlDocumento);
      Exit;
    end;

    CtrlDocumento.Prepare(opDocumento, odlEfetivo);

    CtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso;
    CtrlDocumento.IdUsuario    := Sistema.IdUsuario;
    CtrlDocumento.IdModulo     := Sistema.IdModulo;
    CtrlDocumento.CodDocumento := StrToFloat(sCodDocumento);
    CtrlDocumento.Delete;
  Finally
    FreeAndNil(CtrlDocumento);
  end;
  // Andre Imakawa - SIG 32962 - Fim
  {
  with TwwQuery.create(nil) do
    try
      DataBaseName :='BaseDados';

      // limpando rateiodocum
      SQL.Clear;
      SQL.Add('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;
      Active:=false;

      // limpando lanctodocum
      SQL.Clear;
        SQL.Add('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;
      Active:=false;

      // limpando documento
      SQL.Clear;
      SQL.Add('DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;

      //GravaLogTOTALPREV ('DOCUMENTO -DELETE- (REFERENCIA)CODDOCUMENTO = '+sCodDocumento);

    finally
      free;
    end;
    }
end;


function DocumentoJaBaixado(_CODDOCUMENTO : string):Boolean;
begin
  Result := false;
  
  if trim(_CODDOCUMENTO) > '0' then
  begin
    with TwwQuery.Create(nil) do
      try
        DatabaseName:='BaseDados';
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT CODDOCUMENTO FROM DOCUMENTO  ');
        SQL.Add(' WHERE CODDOCUMENTO ='+_CODDOCUMENTO);
        SQL.Add('   AND (STATUS = 2 or EMISBLOQ=''S'')');
        Active:=True;

        result := not IsEmpty;
      finally
       close;
       Destroy;
      end;
  end;
end;

function TFrmCtrlDiviBenef.VerificarRecebimentoTMPDESC : Boolean;
begin
  with TwwQuery.Create(nil) do
    try
      DataBaseName :='BaseDados';
      Active:=false;
      SQL.Clear;
      SQL.Add('Select DATARECEBIMENTO FROM TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
      SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
      SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
      SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
      Open;
      result := FieldByName('DATARECEBIMENTO').Text <> '';
    finally
      Close;
      Destroy;
    end;
end;
// edilaine - 22/01/2014 - SOL 174933


procedure TFrmCtrlDiviBenef.Consulta;
begin
  qryDet.Active:=False;
  qryDet.SQL.Clear;

  qryDet.SQL.Add('select * from (' );   //Darivaldo Alencar SIG78406
  
  qryDet.SQL.Add('select distinct ''N'' "Selecionar",');
  qryDet.SQL.Add('       (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular) as "Matrícula",');
  qryDet.SQL.Add('       (select nome from pessoa p where p.idpessoa = c.idpessoa) as"Nome",');
  qryDet.SQL.Add('       (select idplanprevcontab');
  qryDet.SQL.Add('          from benefbfciario b');
  qryDet.SQL.Add('         where b.idplanoprev = c.idplanoprev');
  qryDet.SQL.Add('           and b.idpessoa = c.idpessoa');
  qryDet.SQL.Add('           and b.idtitular = c.idtitular');
  qryDet.SQL.Add('           and b.idbeneficio = c.idbeneficio'); // SOL 228648 KINTANA 2062629
  qryDet.SQL.Add('           and b.idpessjur = c.idpessjur and rownum = 1) "Plano Contab",');
  qryDet.SQL.Add('       (select nome from beneficio where idbeneficio = c.idbeneficio) "Benefício ",');
  qryDet.SQL.Add('       Data"Dt Lanc Dívida",');
  qryDet.SQL.Add('       Valorbeneficio"Vlr Benef",');
  qryDet.SQL.Add('       Saldodevedorinicial"Saldo Dev Ini",');
  qryDet.SQL.Add('       Saldodevedoratual"Saldo Dev Atual",');
  qryDet.SQL.Add('       Valorultimaparcela"Ult Parcela",');
  qryDet.SQL.Add('       Valorparcela"Vlr Parcela",');
  qryDet.SQL.Add('       ''''"Situação",');
  qryDet.SQL.Add('       Mesinicio"Ini Cobr",');
  qryDet.SQL.Add('       Mesfim"Fim Cobr",');
  qryDet.SQL.Add('       Percentual"Percentual",');
  qryDet.SQL.Add('       Quantidadeparcelaspagas"Qtde Pagas",');
  qryDet.SQL.Add('       Qtdeparcelas"Qtde Parcelas",');
  qryDet.SQL.Add('       decode(nvl(Flgatualizarsaldo, 0), 0, ''Não'', ''Sim'') "Atualizar Saldo",FLGSITUACAO,C.IDCONTROLEDIVIDABENEFICIO,H.IDHSTORICODIVIDABENEFICIO,C.IDPESSOA,C.IDTITULAR,C.IDPESSJUR,C.IDBENEFICIO,C.IDPLANOPREV,C.IDMOTIVO, ');
  qryDet.SQL.Add('       NVL(H.CODDOCUMENTO,0) AS CODDOCUMENTO ,H.MESCOBRANCA,'); // SOL 232999/16147 PPM 409169 NVL no CODDOCUMENTO
  qryDet.SQL.Add('  (SELECT MIN(H.MESCOBRANCA) FROM HSTDIVIDABENEFICIO H WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO) primeiroMesCobr, '); //William Santana - SIG 27216
  qryDet.SQL.Add('   c.flgportforma as CODPORTFORMA, c.flgdescfolha AS FLGDESCFOLHA , h.dataprevista, h.VALORPREVISTO, ');      // edilaine - 22/01/2014 - SOL 174933
  qryDet.SQL.Add('   H.NUMEROPARCELA, C.FONTEPAGADORA, ');
  qryDet.SQL.Add('   decode(FLGSITUACAO, 0, ''Preparada'', 1, ''Enviada'', 2, ''Enviada e Não Recebida'', 3, ''Recebida'', 4, ''Recebida com Divergência'', 5, ''Suspensa'', '''') as SituacaoDivida ');
  qryDet.SQL.Add('  from Controledividabeneficio c , /*HSTDIVIDABENEFICIO H,*/');

  // edilaine - 22/01/2014 - SOL 174933
  qryDet.SQL.Add('       (SELECT H1.IDCONTROLEDIVIDABENEFICIO,  ');
  qryDet.SQL.Add('               H1.IDHSTORICODIVIDABENEFICIO,  ');
  qryDet.SQL.Add('               H1.CODDOCUMENTO, H1.MESCOBRANCA, H1.DATAPREVISTA, H1.NUMEROPARCELA, H1.FLGSITUACAO, H1.VALORPREVISTO ');
  qryDet.SQL.Add('          FROM HSTDIVIDABENEFICIO H1 ');
  qryDet.SQL.Add('         WHERE ');

  //William Moreira da Silva - SOL 231343 PPM 373759
  //qryDet.SQL.Add('               NVL(H1.CODDOCUMENTO,0) = 0 AND ');
  qryDet.SQL.Add('               (NVL(H1.CODDOCUMENTO,0) = 0 OR H1.CODDOCUMENTO IS NOT NULL)  AND ');
  //William Moreira da Silva - SOL 231343 PPM 373759

  //if ((rgTipoOp.ITEMINDEX = 1) and (rgTIPOCOB.ITEMINDEX <> 0)) or (rgTipoOp.ITEMINDEX = 2)   then
//     qryDet.SQL.Add('               NVL(H1.CODDOCUMENTO,0) > 0 AND ')
//  else
//     qryDet.SQL.Add('               NVL(H1.CODDOCUMENTO,0) = 0 AND ');

  if (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
     qryDet.SQL.Add('               H1.FLGSITUACAO in (3,4) AND ')
  else if rgTIPOCOB.ITEMINDEX <> 6 then
     qryDet.SQL.Add('               H1.FLGSITUACAO in ( '+inttostr(rgTIPOCOB.ITEMINDEX) + ') AND ');

  qryDet.SQL.Add('               EXISTS (SELECT 1 FROM ( SELECT MAX(MESCOBRANCA) MAXCOBRANCA, IDHSTORICODIVIDABENEFICIO, IDCONTROLEDIVIDABENEFICIO   ');
  qryDet.SQL.Add('                                         FROM HSTDIVIDABENEFICIO H2                                                                ');
  qryDet.SQL.Add('                                        GROUP BY H2.IDHSTORICODIVIDABENEFICIO, H2.IDCONTROLEDIVIDABENEFICIO) M                     ');
  qryDet.SQL.Add('                               WHERE M.IDHSTORICODIVIDABENEFICIO = H1.IDHSTORICODIVIDABENEFICIO                                    ');
  //edilaine - SIG71864 - inicio
  if rgTIPOCOB.ITEMINDEX = 5 then
     qryDet.SQL.Add('                                 AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' )
  else if rgTIPOCOB.ITEMINDEX = 6 then
  begin
     qryDet.SQL.Add('                                 AND ((FLGSITUACAO = 5  AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+') OR ' );
     qryDet.SQL.Add('                                      (FLGSITUACAO <> 5 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) )' );
  end
  else
     qryDet.SQL.Add('                                 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' );
  //edilaine - SIG71864 - fim

  if  (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
  begin
    qryDet.SQL.Add('               and h1.mescobranca = (SELECT max(H3.MESCOBRANCA) ');
    qryDet.SQL.Add('                                     FROM HSTDIVIDABENEFICIO H3 ');
    qryDet.SQL.Add('                                     WHERE                      ');
    qryDet.SQL.Add('                                          NVL(H3.CODDOCUMENTO,0) = 0 AND  ');
    qryDet.SQL.Add('                                          H3.FLGSITUACAO in (3,4) AND  ');
    qryDet.SQL.Add('                                          h3.idpessoa = h1.idpessoa and   ');
    qryDet.SQL.Add('                                          h3.idtitular = h1.idtitular and ');
    qryDet.SQL.Add('                                          h3.idpessjur = h1.idpessjur and ');
    qryDet.SQL.Add('                                          EXISTS (SELECT 1 FROM ( SELECT MAX(MESCOBRANCA) MAXCOBRANCA, IDHSTORICODIVIDABENEFICIO, IDCONTROLEDIVIDABENEFICIO ');
    qryDet.SQL.Add('                                                                    FROM HSTDIVIDABENEFICIO H4 ');
    qryDet.SQL.Add('                                                                   GROUP BY H4.IDHSTORICODIVIDABENEFICIO, H4.IDCONTROLEDIVIDABENEFICIO) M1 ');
    qryDet.SQL.Add('                                                          WHERE M1.IDHSTORICODIVIDABENEFICIO = H3.IDHSTORICODIVIDABENEFICIO ');
    //qryDet.SQL.Add('                                                          AND M1.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ');     //edilaine - SIG71864
    qryDet.SQL.Add('                                                            AND M1.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ');      //edilaine - SIG71864
  end;

  qryDet.SQL.Add('         ) H ');

  {
  qryDet.SQL.Add('(SELECT MAX(MESCOBRANCA)MAXCOBRANCA, IDHSTORICODIVIDABENEFICIO');
  qryDet.SQL.Add('          FROM HSTDIVIDABENEFICIO H2');
  qryDet.SQL.Add('         GROUP BY IDHSTORICODIVIDABENEFICIO) MAXTEMP');  }

  //qryDet.SQL.Add('  LEFT JOIN HSTDIVIDABENEFICIO H');
  //qryDet.SQL.Add('    ON H.IDCONTROLEDIVIDABENEFICIO = IDCONTROLEDIVIDABENEFICIO');
  //qryDet.SQL.Add('    ON H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');
  qryDet.SQL.Add('  WHERE Saldodevedoratual > 0 ');
  qryDet.SQL.Add('    AND H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');

  {if rgTipoOp.ITEMINDEX = 0 then
     begin

      qryDet.SQL.Add(' AND MAXTEMP.IDHSTORICODIVIDABENEFICIO = H.IDHSTORICODIVIDABENEFICIO');
      qryDet.SQL.Add(' AND MAXTEMP.MAXCOBRANCA<='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39);
     end;
  if rgTIPOCOB.ITEMINDEX <> 6 then
     qryDet.SQL.Add('  AND H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO AND H.FLGSITUACAO ='+inttostr(rgTIPOCOB.ITEMINDEX));
  }
  // edilaine - 22/01/2014 - SOL 174933

  {
  qryDet.SQL.Add('  from Controledividabeneficio c ');



  qryDet.SQL.Add('  LEFT JOIN HSTDIVIDABENEFICIO H');
  qryDet.SQL.Add('    ON H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');
  //qryDet.SQL.Add('    ON H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');
  qryDet.SQL.Add('  WHERE Saldodevedoratual > 0 ');

  if rgTIPOCOB.ITEMINDEX <> 6 then
     qryDet.SQL.Add('  AND H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO AND H.FLGSITUACAO ='+inttostr(rgTIPOCOB.ITEMINDEX));
                  }

  qryDet.SQL.Add(') order by "Matrícula" asc' ); //Darivaldo Alencar SIG78406

  qryDet.Active:=True;
end;

function TFrmCtrlDiviBenef.Mensagens(_idmsg: Integer): string;
begin
  case _idmsg of
    1:Result:='Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.';
    2:Result:='É necessário selecionar o Mês/Ano de Cobrança.';
    3:Result:='É necessário selecionar um Tipo de Operação.';
    4:Result:='É necessário selecionar um Tipo de Cobrança.';
    5:Result:='É necessário selecionar pelo menos um aposentado ou pensionista para processamento.';
    6:Result:='Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.';
    7:Result:='Envio de cobrança de parcela do mês para aposentado ou pensionista já efetuado.';
    8:Result:='Aposentado ou pensionista selecionado não possui cobrança a receber.';
    9:Result:='Aposentado ou pensionista selecionado não possui parcelas para desfazer o preparo.';
    10:Result:='Aposentado ou pensionista selecionado não possui parcelas para desfazer o envio.';
    11:Result:='Aposentado ou pensionista selecionado não possui parcelas recebidas para desfazer recebimento.';
    12:Result:='Preparo efetuado com sucesso.';
    13:Result:='Envio de cobranças efetuado com sucesso.';
    14:Result:='Recebimento efetuado com sucesso.';
    15:Result:='Preparo de parcelas de cobranças mensal desfeito com sucesso.';
    16:Result:='Envio de parcelas de cobranças mensal desfeito com sucesso.';
    17:Result:='Recebimento de parcelas de cobranças mensal desfeito com sucesso.';
    18:Result:='É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.';
    20:Result:='É obrigatório efetuar a marcação da atualização ou não do saldo devedor.';
  end;
end;

procedure TFrmCtrlDiviBenef.setPadraoInicial(_flag: Boolean);
begin
  btnProcessar.Enabled:=_flag;
  bbtnDesfazer.Enabled:=_flag;

  btnProcurar.Enabled:=not _flag;
  bbtnSair.Enabled:=not _flag;
  bbtnAjuda.Enabled:=not _flag;
end;

procedure TFrmCtrlDiviBenef.seAnoChange(Sender: TObject);
begin
//  inherited;
//RU005
 if (seAno.Value<1900) or (seAno.Value>2999)  then
    Exit;
end;

procedure TFrmCtrlDiviBenef.btnSelTudoClick(Sender: TObject);
begin
//  inherited;
  if not qryDet.isempty then
     begin
     qryDet.First;
     while not qryDet.eof do
       begin
       qryDet.edit;
       qryDetSELECIONAr.text:='S';
       qryDet.post;
       qryDet.Next;
       end;
      end;
end;

procedure TFrmCtrlDiviBenef.btnInverteClick(Sender: TObject);
begin
//  inherited;
  if not qryDet.isempty then
     begin
     qryDet.First;
     while not qryDet.eof do
       begin
       qryDet.edit;
       qryDetSELECIONAr.text:='N';
       qryDet.post;
       qryDet.Next;
       end;
      end;
end;

procedure TFrmCtrlDiviBenef.ExecutarPreparo;
var
  query:TwwQuery;
  novosaldodev:Double;
  qtparcelas:Integer;
  valorparcela:Double;
  passou:boolean;
  flgportforma : integer;  // edilaine - 22/01/2014 - SOL 174933
  flgdescfolha : string;   // edilaine - 22/01/2014 - SOL 174933
  saldoacumulado : Double; //William Santana - SIG 27216

begin
/////

  passou:=false;
  query:=TwwQuery.Create(Self);
  query.DataBaseName :='BaseDados';
  query.Active:=false;
  query.SQL.Clear;

  qrydet.Filter:='Selecionar ='+#39+'S'+#39;
  qrydet.Filtered:=True;
  qrydet.Active:=True;

  if qrydet.IsEmpty then
     begin
     MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
     qrydet.Filtered:=FALSE;
     Exit;
     end;

  qrydet.First;
  while not qrydet.eof do
     begin
     query.close;
     query.SQL.Clear;
     query.SQL.Add('  SELECT *');
     query.SQL.Add('    FROM HSTDIVIDABENEFICIO');
     query.SQL.Add('   WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
     query.SQL.Add('     AND FLGSITUACAO = 0');
     query.SQL.Add('     AND MESCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1))+#39);
     query.Active:=True;
     if not query.IsEmpty then
        begin
        MsgDlg( 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;
        end;
     query.Active:=False;

     if rgATUALIZARS.ItemIndex = 0 then
        begin       
         //Início - William Santana - SIG 27216
         saldoacumulado := RetornaIndiceAcumulado(qrydet.FieldByName('primeiroMesCobr').AsString);
         novosaldodev := qrydet.FieldByName('Saldo Dev Atual').AsFloat * saldoacumulado;
         valorparcela := qrydet.FieldByName('Vlr Parcela').AsFloat * saldoacumulado;
         //if (qrydet.FieldByName('idplanoprev').text='74') or (qrydet.FieldByName('idplanoprev').text='66') or (qrydet.FieldByName('idplanoprev').text='28') then
         //     novosaldodev:=RetornaSaldoAtualizado(qrydet.FieldByName('Dt Lanc Dívida').text,qrydet.FieldByName('Saldo Dev Atual').Value)
         //  else
         //     novosaldodev:=RetornaSaldoAtualizadoRegReplan(qrydet.FieldByName('Saldo Dev Atual').Value);

        // qtparcelas:= qrydet.FieldByName('Qtde Parcelas').value-qrydet.FieldByName('Qtde Pagas').value;
        // valorparcela:= novosaldodev/qtparcelas;

         //Término - William Santana - SIG 27216
         query.close;
         query.SQL.Clear;
         query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
         query.SQL.Add('   SET SALDODEVEDORATUAL =' +OraNumero(formatfloat('0.00',novosaldodev)));
         query.SQL.Add('  , VALORPARCELA ='+OraNumero(formatfloat('0.00',valorparcela)));
         query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
         query.ExecSQL;

        end
     else
        begin

         if qrydet.FieldByName('Saldo Dev Atual').Value - qrydet.FieldByName('Vlr Parcela').Value<0 then
            begin
            MsgDlg( 'Não é possível realizar o preparo.','Informação',mtInformation,[mbOk],0);
            qrydet.next;
            Continue;
            end;

         valorparcela:= qrydet.FieldByName('Vlr Parcela').Value;
        end;

     if qrydet.FieldByName('FLGSITUACAO').Text = '0' then
        begin
        MsgDlg( 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;
        end;

     if qrydet.FieldByName('FLGSITUACAO').Text = '5' then///SUSPENSA
        begin
  //      MsgDlg( 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Erro',mtError,[mbOk],0);
        qrydet.next;
        Continue;
        end;

     try
       // edilaine - 22/01/2014 - SOL 174933
       flgDescFolha := iif(qrydet.FieldByName('CODPORTFORMA').AsInteger = -1, 'B', '');


       InserirHSTDIVIDABENEFICIO(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                            qrydet.FieldByName('IDPESSOA').text,
                            qrydet.FieldByName('IDTITULAR').text,
                            qrydet.FieldByName('IDPESSJUR').text,
                            qrydet.FieldByName('IDBENEFICIO').text,
                            qrydet.FieldByName('IDPLANOPREV').text,
                            qrydet.FieldByName('Ini Cobr').text,
                            inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1)),
                             FloatToStr(valorparcela),
                            inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1)),
  //                          inttostr(cmbMes.Itemindex)+'/'+inttostr(speAno.Value),
                             flgdescfolha, {'B',}     // edilaine - 22/01/2014 - SOL 174933
                            '0','0',
                            qrydet.FieldByName('CODPORTFORMA').AsString);  // edilaine - 22/01/2014 - SOL 174933

       passou:=true;
     except
       qrydet.Filtered:=False;
       Exit;
     end;

     qrydet.Next;
     end;

  qrydet.Filtered:=False;
  if passou then
     MsgDlg( 'Preparo efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
  //else
  //   MsgDlg( 'Não é possível realizar o preparo.','Informação',mtInformation,[mbOk],0);

end;

procedure TFrmCtrlDiviBenef.InserirHSTDIVIDABENEFICIO(_IDCONTROLE, _IDPESSOA,
  _IDTITULAR, _IDPESSJUR, _IDBENEFICIO, _IDPLANOPREV, _MESREFERENCIA,
  _MESCOBRANCA, _VLQUITACAO, _dataprevista, _FLGDESCFOLHA, _FLGSITUACAO,
  _flgParcial,_codportforma: string);
var
  idhstcontrole,qtparcela:Integer;
  _query,_queryx:TwwQuery;
  dataprevistacalc:string;
  i:Integer;
begin
   dataprevistacalc:='20/'+formatfloat('00',(cbbMes.Itemindex+1))+'/'+inttostr(seAno.Value);
  _queryx:=TwwQuery.Create(Self);
  _queryx.DataBaseName :='BaseDados';
  _queryx.Active:=false;
  //_queryx.sql.clear;
  //_queryx.SQL.Add('SELECT * FROM FERIADOS');
  //_queryx.SQL.Add('WHERE DATAFERIADO = '+#39+dataprevistacalc+#39);
  //_queryx.open;
  //        inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1))


  repeat
    _queryx.Active:=false;
    _queryx.sql.clear;
    _queryx.SQL.Add('SELECT * FROM FERIADOS');
    _queryx.SQL.Add('WHERE DATAFERIADO = '+#39+dataprevistacalc+#39);
    _queryx.open;
    if  not _queryx.IsEmpty then
        dataprevistacalc:=FormatFloat('00',strtoint(Copy(dataprevistacalc,1,2))+1)+copy(dataprevistacalc,3,8);
  until (_queryx.IsEmpty);

  //William Moreira da Silva - SOL 231370 PPM 373133
  //_queryx.sql.clear;
  //_queryx.SQL.Add('SELECT (COUNT(*)+1)NEXTQT FROM HSTDIVIDABENEFICIO');
  //_queryx.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO ='+_IDCONTROLE);
  //_queryx.Active:=True;

  _queryx.sql.clear;
  _queryx.SQL.Add('SELECT (QUANTIDADEPARCELASPAGAS + 1) as NEXTQT FROM CONTROLEDIVIDABENEFICIO');
  _queryx.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO ='+_IDCONTROLE);
  _queryx.Active:=True;
  //William Moreira da Silva - SOL 231370 PPM 373133

  qtparcela:= _queryx.fieldbyname('NEXTQT').Value;

  _MESREFERENCIA:=COPY(_MESREFERENCIA,7,4)+'/'+COPY(_MESREFERENCIA,4,2);

  _query:=TwwQuery.Create(Self);
  _query.DataBaseName :='BaseDados';
  _query.Active:=false;

  idhstcontrole:= (LeUltRegistro(Nil,'HSTDIVIDABENEFICIO'));
//    IDHSTORICODIVIDABENEFICIO :=floattostr(idhstcontrole);
  _query.close;
  _query.sql.Clear;
  _query.SQL.Add('insert into HSTDIVIDABENEFICIO');
  _query.SQL.Add('  (IDHSTORICODIVIDABENEFICIO,');
  _query.SQL.Add('   IDHISTORICODIVIDABENEFICIOREF,');
  _query.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
  _query.SQL.Add('   IDPESSOA,');
  _query.SQL.Add('   IDTITULAR,');
  _query.SQL.Add('   IDPESSJUR,');
  _query.SQL.Add('   IDBENEFICIO,');
  _query.SQL.Add('   IDPLANOPREV,');
  _query.SQL.Add('   MESREFERENCIA,');
  _query.SQL.Add('   MESCOBRANCA,');
  _query.SQL.Add('   NUMEROPARCELA,');
  _query.SQL.Add('   VALORPREVISTO,');
  _query.SQL.Add('   VALORRECEBIDO,');
  _query.SQL.Add('   DATAPREVISTA,');
  _query.SQL.Add('   DATAEFETIVA,');
  _query.SQL.Add('   IDHSTFOLHABENEF,');
  _query.SQL.Add('   CODPORTFORMA,');
  _query.SQL.Add('   FLGDESCFOLHA,');
  _query.SQL.Add('   FLGSITUACAO,');
  _query.SQL.Add('   OBSERVACAO,IDCONTROLEDIVIDABENEFUNIF)');
  _query.SQL.Add('values');
  _query.SQL.Add('  ('+FLOATTOSTR(idhstcontrole)+',');
  _query.SQL.Add(' '+'0'+',');
  _query.SQL.Add(' '+_IDCONTROLE+',');
  _query.SQL.Add(' '+_IDPESSOA+',');
  _query.SQL.Add(' '+_IDTITULAR+',');
  _query.SQL.Add(' '+_IDPESSJUR+',');
  _query.SQL.Add(' '+_IDBENEFICIO+',');
  _query.SQL.Add(' '+_IDPLANOPREV+',');
  _query.SQL.Add(' '+#39+_MESREFERENCIA+#39+',');
  _query.SQL.Add(' '+#39+_MESCOBRANCA+#39+',');
  _query.SQL.Add(' '+inttostr(qtparcela)+',');
  _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',');
  if _flgParcial = '1' then
   _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',')
  else
  _query.SQL.Add(' '+'null'+',');
//    _query.SQL.Add(' '+#39+strtodate(now)+#39+',');///dataprevista = mescorbranca
  _query.SQL.Add(' '+#39+dataprevistacalc+#39+',');
  _query.SQL.Add(' '+'null'+',');
  _query.SQL.Add(' '+'null'+',');
  //_query.SQL.Add(' '+'null'+',');         // edilaine - 22/01/2014 - SOL 174933
  _query.SQL.Add(' '+_CODPORTFORMA+',');    // edilaine - 22/01/2014 - SOL 174933
  _query.SQL.Add(' '+#39+_FLGDESCFOLHA+#39+',');
  _query.SQL.Add(' '+#39+_FLGSITUACAO+#39+',');
  _query.SQL.Add(' '+'null'+',');
  _query.SQL.Add('null )');
  _query.ExecSQL;

  try
     GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO'+FLOATTOSTR(idhstcontrole));
  except
  end;

  _query.Destroy;

end;

procedure TFrmCtrlDiviBenef.bbtnSairClick(Sender: TObject);
begin
  inherited;
//case rgTipoOp.ItemIndex of
//   0:begin
//      ExecutarPreparo;
//      end;
//   1:begin
//      ExecutarEnvio;
//      end;
//   2:begin
//      ExecutarRecebimento;
//      end;
//end;
end;

procedure TFrmCtrlDiviBenef.ExecutarEnvio;
var
  query_temp:TwwQuery;
  sContaLiquido,sCODPORTFORMA,sUNIDNEGOC,sCODTIPDOC,sCODTIPRECDES,sCODCENTRORESPON,sCODFORMA,sPLANO,sCODCENTROCUSTOC,SCODPROVDESC,sPLACONTAD,STIPCODIGO,SIDPLANPREVCONTAB:string;
  passou:boolean;


  function InsereTmpDesc:Boolean;
     var lidseq: integer;
     query,query2:TwwQuery;
     idrubrica,flgdesconto,SFLGATRASODEVOL,sINSCRICAONUMERO:string;
  begin

      lidseq:= (LeUltRegistro(Nil,'TMPDESC'));

      query2 := TwwQuery.Create(Application);
      query2.DataBaseName := 'BaseDados';
      query2.SQL.Clear;
      query2.SQL.Add('SELECT * FROM BENEFPLANPREV');
      query2.SQL.Add('WHERE IDPLANOPREV= '+qrydet.FieldByName('IDPLANOPREV').text);
      query2.SQL.Add('AND IDBENEFICIO = '+qrydet.FieldByName('IDBENEFICIO').text);
      query2.open;
      if  query2.FieldByName('IDRUBRICADIVIDABENEFNORMAL').Text<>'' then
          idrubrica:=query2.FieldByName('IDRUBRICADIVIDABENEFNORMAL').Text
      else
         if  query2.FieldByName('IDRUBRICADIVIDABENEFICIODEVOL').Text<>'' then
             idrubrica:=query2.FieldByName('IDRUBRICADIVIDABENEFICIODEVOL').Text
         else
            if  query2.FieldByName('IDRUBRICADIVIDABENEFTRASO').Text<>'' then
            idrubrica:=query2.FieldByName('IDRUBRICADIVIDABENEFTRASO').Text
            else
                idrubrica:='null';


     if idrubrica='null' then
        begin
        result:=False;
        exit;
        end
     else
       result:=true;

     if idrubrica <> 'null' then
        begin
        query2.active:=False;
        query2.SQL.Clear;
        query2.SQL.Add('SELECT FLGDESCONTO,CODPROVDESC FROM PROVDESC WHERE IDPROVENTO = '+#39+idrubrica+#39);
        query2.active:=True;
        flgdesconto:=query2.FieldByName('FLGDESCONTO').Text;
        SCODPROVDESC:=query2.FieldByName('CODPROVDESC').Text;

        end
     else
     flgdesconto:='0';
     flgdesconto:='1';

      if flgdesconto = '0' then
         SFLGATRASODEVOL:='A'
      else
         SFLGATRASODEVOL:='N';

      query2.active:=False;
      query2.SQL.Clear;
      query2.SQL.Add('SELECT INSCRICAONUMERO FROM PARTPREVPLAN');
      query2.SQL.Add('WHERE IDPESSOA =' +qrydet.FieldByName('IDPESSOA').Text);
      query2.SQL.Add('      AND IDPLANOPREV ='+qrydet.FieldByName('IDPLANOPREV').Text);
      query2.active:=True;
      sINSCRICAONUMERO:=query2.FieldByName('INSCRICAONUMERO').Text;
      query2.active:=false;


      query:=TwwQuery.Create(Self);
      query.DataBaseName :='BaseDados';
      query.Active:=false;
      query.SQL.Clear;
      query.SQL.Add('INSERT INTO TMPDESC');
      query.SQL.Add('  (IDTMPDESC,');//
      query.SQL.Add('   IDPESSJUR,');//
      query.SQL.Add('   IDPLANOPREV,'); //
      query.SQL.Add('   IDTITULAR,');//
      query.SQL.Add('   IDPESSOA,');//
//      query.SQL.Add('   IDFAVORECIDO,');//
      query.SQL.Add('   IDPROVENTO,');
      query.SQL.Add('   IDMOTIVO,');
      query.SQL.Add('   MESCOBRANCA,');
      query.SQL.Add('   MESREFERENCIA,');
      query.SQL.Add('   FLGTIPODESC,');
      query.SQL.Add('   VALOR,');
//      query.SQL.Add('   VALORINFO,'); // SOL 228648 KINTANA 2062629
      query.SQL.Add('   FLGDESCFOLHA,');
      query.SQL.Add('   SISTORIGEM,');
      query.SQL.Add('   IDMODULO,');
//      query.SQL.Add('   IDLOTE,');
      query.SQL.Add('   SITENVIO,');
      query.SQL.Add('   SEQPROPOSTA,');
      query.SQL.Add('   REFERENCIA,');
      query.SQL.Add('   NUMPARCELAS,');
      query.SQL.Add('   PARCELA,');
      query.SQL.Add('   DATAINICIO,');

      query.SQL.Add('CODTIPRECDES,');
      query.SQL.Add('PLANO,');
      query.SQL.Add('PLACONTAC,');
      query.SQL.Add('IDDESCONTO,');
      query.SQL.Add('UNIDNEGOC,');
//      query.SQL.Add('DATARECEBIMENTO,');
      query.SQL.Add('CODCENTRORESPON,');
      query.SQL.Add('CODCENTROCUSTOC,');
      query.SQL.Add('IDEMPRESA,');
      query.SQL.Add('ORDEM,');
      query.SQL.Add('FLGDESCONTO,');
      query.SQL.Add('DATAREFERENCIA,');
      query.SQL.Add('IDFUNDACAO,');
      query.SQL.Add('FLGATRASODEVOL,');

      query.SQL.Add('FLGEXISTEHST,');
      query.SQL.Add('RECPAG,');
      query.SQL.Add('CODPROVDESC,');
      query.SQL.Add('IDEMPRESAPROP,');
      query.SQL.Add('PLACONTAD,');
//      query.SQL.Add('TIPCODIGO,');
      query.SQL.Add('IDPLANPREVCONTAB,');
      query.SQL.Add('MATRICULA,');
      query.SQL.Add('INSCRICAONUMERO,');
      query.SQL.Add('PERIODO,');
      query.SQL.Add('EXERCICIO,');
      query.SQL.Add('IDLOTE,');
      query.SQL.Add('DATACOBRANCA )');

      query.SQL.Add('VALUES');
      query.SQL.Add('  ('+FLOATTOSTR(lidseq)+',');
      query.SQL.Add(' '+qrydet.FieldByName('IDPESSJUR').text+',');
      query.SQL.Add(' '+qrydet.FieldByName('IDPLANOPREV').text+',');
      query.SQL.Add(' '+qrydet.FieldByName('IDTITULAR').text+',');
      query.SQL.Add(' '+qrydet.FieldByName('IDPESSOA').text+',');
//      query.SQL.Add(' '+qrydet.FieldByName('IDTITULAR').text+',');
      query.SQL.Add(' '+idrubrica+',');
      query.SQL.Add(' '+qrydet.FieldByName('IDMOTIVO').text+',');
      query.SQL.Add(' '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39+',');
//      query.SQL.Add(' '+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+',');
//      query.SQL.Add(' '+inttostr(cmbMes.Itemindex)+'/'+inttostr(speAno.Value)+',');
      query.SQL.Add(' '+#39+copy(qrydet.FieldByName('Ini Cobr').text,7,4)+'/'+copy(qrydet.FieldByName('Ini Cobr').text,4,2)+#39+',');
      //query.SQL.Add(' '+#39+'P'+#39+','); // SOL 237951 PPM 493275 comentado o flag 'P'
      query.SQL.Add(' '+#39+'D'+#39+','); // SOL 237951 PPM 493275 adicionado o novo flag 'D'
      query.SQL.Add(' '+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').Value))+','); // SOL 228648 KINTANA 2062629
      //query.SQL.Add(' '+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').Value))+',');
      query.SQL.Add(' '+#39+'B'+#39+',');
      query.SQL.Add(' '+inttostr(Sistema.IdModulo)+',');
      query.SQL.Add(' '+inttostr(Sistema.IdModulo)+',');
      query.SQL.Add(' '+#39+'0'+#39+',');
      query.SQL.Add(' '+#39+'1'+#39+',');
      query.SQL.Add(' '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39+',');///referencia
      query.SQL.Add(' '+#39+qrydet.FieldByName('Qtde Parcelas').text+#39+',');///parcelas
      query.SQL.Add(' '+#39+formatfloat('0',(qrydet.FieldByName('Qtde Pagas').value)+1)+#39+',');///parcelas
      query.SQL.Add(' '+#39+qrydet.FieldByName('Ini Cobr').text+#39+',');///parcelas

      query.SQL.Add(' '+#39+sCODTIPRECDES+#39+',');
      query.SQL.Add(' '+#39+sPLANO+#39+',');///plano ver
      query.SQL.Add(' '+#39+sContaLiquido+#39+',');
      query.SQL.Add(' '+#39+qrydet.FieldByName('IDBENEFICIO').text+#39+',');//IDDESCONTO
      query.SQL.Add(' '+#39+sUNIDNEGOC+#39+',');
//      query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39+',');
      query.SQL.Add(' '+#39+sCODCENTRORESPON+#39+',');
      if sCODCENTROCUSTOC = '-1' then  // SOL 228648 KINTANA 2062629
         query.SQL.Add(' NULL ,')
      else
         query.SQL.Add(' '+#39+sCODCENTROCUSTOC+#39+',');  // SOL 228648 KINTANA 2062629

      query.SQL.Add(' '+#39+inttostr(Sistema.IdEmpresa)+#39+',');
      query.SQL.Add(' '+#39+'1'+#39+',');///// Ordem ver
      query.SQL.Add(' '+#39+flgdesconto+#39+',');
      query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39+',');
      query.SQL.Add(' '+#39+'1'+#39+',');
      query.SQL.Add(' '+#39+SFLGATRASODEVOL+#39+',');

     query.SQL.Add(' '+#39+'0'+#39+',');
     query.SQL.Add(' '+#39+'P'+#39+',');
     query.SQL.Add(' '+#39+SCODPROVDESC+#39+',');
     query.SQL.Add(' '+#39+'1'+#39+',');
     query.SQL.Add(' '+#39+sPLACONTAD+#39+',');
//     query.SQL.Add(' '+#39+sTIPCODIGO+#39+',');
     query.SQL.Add(' '+#39+SIDPLANPREVCONTAB+#39+',');
     query.SQL.Add(' '+#39+qrydet.FieldByName('Matrícula').text+#39+',');
     query.SQL.Add(' '+#39+sINSCRICAONUMERO+#39+',');

     query.SQL.Add(' '+#39+ COPY(qrydet.FieldByName('MESCOBRANCA').text,6,2)+#39+',');
     query.SQL.Add(' '+#39+ COPY(qrydet.FieldByName('MESCOBRANCA').text,1,4)+#39+',');

     query.SQL.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+',');
     query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39);
     query.SQL.Add(' )');
     query.ExecSQL;

     GravaLogTOTALPREV ('TMPDESC -Insert- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);

     query.close;
     query.destroy;
     query2.close;
     query2.destroy;
  end ;

begin

   iIdLoteConcessao:=0;

   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin

         MsgDlg('Nenhum lote selecinado para efetuar o Controle de Dívidas. Verifique. ','Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;




passou:=false;
query_temp:=TwwQuery.Create(Self);
query_temp.DataBaseName :='BaseDados';
query_temp.Active:=false;
query_temp.SQL.Clear;


qrydet.Filter:='Selecionar ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

if qrydet.IsEmpty then
   begin
   MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;

qrydet.First;
while not qrydet.eof do
   begin

     if qrydet.FieldByName('FLGSITUACAO').Text <> '0' then
        begin
        MsgDlg( 'Envio de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;
        end;


   try


/////////

    query_temp.sql.clear;
    query_temp.SQL.Add('SELECT PLACONTAC,CODCENTROCUSTOC');
    query_temp.SQL.Add('  FROM BENEFPLANPATRO');
    query_temp.SQL.Add(' WHERE IDPESSJUR = '+qrydet.FieldByName('IDPESSJUR').Text);
    query_temp.SQL.Add('   AND IDBENEFICIO = '+qrydet.FieldByName('IDBENEFICIO').text);
    query_temp.SQL.Add('   AND IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').text);
    query_temp.open;
    sContaLiquido:=query_temp.FieldByName('PLACONTAC').text;
    sCODCENTROCUSTOC:=query_temp.FieldByName('CODCENTROCUSTOC').text;
    query_temp.Close;

    if trim(sContaLiquido) = '' then
       sContaLiquido:='-1';

    if trim(sCODCENTROCUSTOC) = '' then
       sCODCENTROCUSTOC:='-1';


    query_temp.sql.clear;
    query_temp.SQL.Add('SELECT CODPORTFORMA, CODFORMA, DESCRICAO');
    query_temp.SQL.Add('FROM PORTADORFORMA');
    query_temp.SQL.Add('WHERE RECPAG = ''R''');
    //query_temp.SQL.Add('AND IDPESSOA ='+qrydet.FieldByName('IDPESSOA').Text);       // edilaine - 22/01/2014 - SOL 174933
    query_temp.SQL.Add('AND CODPORTFORMA =nvl('+qrydet.FieldByName('CODPORTFORMA').Text+',0)'); // edilaine - 22/01/2014 - SOL 174933
    query_temp.SQL.Add('ORDER BY DESCRICAO');
    query_temp.open;
    sCODPORTFORMA:=query_temp.FieldByName('CODPORTFORMA').text;
    sCODFORMA:=query_temp.FieldByName('CODFORMA').text;
    query_temp.Close;


    if trim(sCODPORTFORMA) = '' then
       sCODPORTFORMA:='-1';


    if trim(sCODFORMA) = '' then
       sCODFORMA:='-1';


   query_temp.sql.clear;
//   query_temp.SQL.Add('SELECT UNIDNEGOC, NOME,UNECODIGO FROM UNIDNEGOCIO');
//   query_temp.SQL.Add('WHERE IDPESSOA ='+qrydet.FieldByName('IDPESSOA').Text);
//   query_temp.SQL.Add('ORDER BY UNECODIGO');


   query_temp.SQL.Add('SELECT');
   query_temp.SQL.Add(' BPL.UNIDNEGOC,');
   query_temp.SQL.Add(' BPL.CODCENTRORESPON,');
   query_temp.SQL.Add(' BPL.CODTIPRECDES, ');
   query_temp.SQL.Add(' BPL.CODCENTROCUSTOD, BPL.plano,BPL.PLACONTAD,BPL.TIPCODIGO,BPL.IDPLANPREVCONTAB');
   query_temp.SQL.Add('  FROM BENEFPLANPATRO BPL, BENEFPLANPREV BP, BENEFICIO B');
   query_temp.SQL.Add(' WHERE BPL.IDPESSJUR = '+qrydet.FieldByName('IDPESSJUR').Text);
   query_temp.SQL.Add('   AND BPL.IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').text);
   query_temp.SQL.Add('   AND BP.IDPLANOPREV = BPL.IDPLANOPREV');
   query_temp.SQL.Add('   AND BP.IDBENEFICIO = BPL.IDBENEFICIO');
   query_temp.SQL.Add('   AND B.IDBENEFICIO = BP.IDBENEFICIO');
   query_temp.SQL.Add('   AND B.IDBENEFICIO = '+qrydet.FieldByName('IDBENEFICIO').text);
   query_temp.SQL.Add(' ORDER BY B.NOME');
   query_temp.open;
   sUNIDNEGOC:=query_temp.FieldByName('UNIDNEGOC').text;
   sCODTIPRECDES:=query_temp.FieldByName('CODTIPRECDES').text;
   sCODCENTRORESPON:=query_temp.FieldByName('CODCENTRORESPON').text;
   sCODCENTROCUSTOC:=query_temp.FieldByName('CODCENTROCUSTOD').text;
   sPLACONTAD:= query_temp.FieldByName('PLACONTAD').text;
   STIPCODIGO:= query_temp.FieldByName('TIPCODIGO').text;
//   SIDPLANPREVCONTAB:= query_temp.FieldByName('IDPLANPREVCONTAB').text;  // SOL 228648 KINTANA 2062629
   sPLANO:=query_temp.FieldByName('plano').text;


    if trim(sCODCENTROCUSTOC) = '' then
       sCODCENTROCUSTOC:='-1';

    if trim(STIPCODIGO)='' then
       STIPCODIGO:='-1';


   query_temp.Close;


    if trim(sUNIDNEGOC) = '' then
       sUNIDNEGOC:='-1';

    if trim(sCODTIPRECDES) = '' then
       sCODTIPRECDES:='-1';

    if trim(sCODCENTRORESPON) = '' then
       sCODCENTRORESPON:='-1';

    IF Trim(sPLANO) = '' then
       sPLANO  :='-1';
    // SOL 228648 KINTANA 2062629
    query_temp.sql.clear;
    query_temp.SQL.Add(' SELECT IDPLANPREVCONTAB FROM BENEFBFCIARIO B ');
    query_temp.SQL.Add(' WHERE B.IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').text);
    query_temp.SQL.Add(' AND B.IDPESSOA    = '+qrydet.FieldByName('IDPESSOA').Text);
    query_temp.SQL.Add(' AND B.IDTITULAR   = '+qrydet.FieldByName('IDTITULAR').Text);
    query_temp.SQL.Add(' AND B.IDPESSJUR   = '+qrydet.FieldByName('IDPESSJUR').Text);
    query_temp.SQL.Add(' AND B.IDBENEFICIO = '+qrydet.FieldByName('IDBENEFICIO').text);

    query_temp.open;
    SIDPLANPREVCONTAB:= query_temp.FieldByName('IDPLANPREVCONTAB').text;
    query_temp.Close;
    // SOL 228648 KINTANA 2062629

   query_temp.sql.clear;
{   query_temp.SQL.Add('SELECT CODTIPDOC, DESCRICAO');
   query_temp.SQL.Add('FROM TIPODOCRECPAG');
   query_temp.SQL.Add('WHERE RECPAG = ''R'''); }
//   query_temp.SQL.Add('SELECT TPDOCRRECBANCO, TPDOCRRECPATRO');           //Everson TIBERO
   query_temp.SQL.Add('SELECT PARAM.TPDOCRRECBANCO, PARAM.TPDOCRRECPATRO'); //Everson TIBERO
   query_temp.SQL.Add('  FROM PESSOA P, FUNDACAO F, PARAMAPREV PARAM');
   query_temp.SQL.Add(' WHERE P.IDPESSOA = F.IDPESSOA');
   query_temp.SQL.Add('   AND F.IDPESSOA = 1');
   query_temp.SQL.Add('   AND PARAM.IDFUNDACAO = F.IDPESSOA');
   query_temp.SQL.Add(' ORDER BY P.NOME');
   query_temp.open;
   //sCODTIPDOC:=query_temp.FieldByName('TPDOCRRECPATRO').text;    // edilaine - 22/01/2014 - SOL 174933
   sCODTIPDOC:=query_temp.FieldByName('TPDOCRRECBANCO').text;      // edilaine - 22/01/2014 - SOL 174933
   query_temp.Close;

    if trim(sCODTIPDOC) = '' then
       sCODTIPDOC:='-1';

   // SOL 228648 KINTANA 2062629
   //if sCODCENTROCUSTOC ='-1' then
   //begin

   //   MsgDlg('É necessário efetuar a parametrização da integração com o financeiro pelo módulo ParamPrev do Item Centro de Custo.','Informação',mtInformation,[mbOk],0);
   //   qrydet.next;
   //   Continue;

   // end;
   // SOL 228648 KINTANA 2062629
   lCodLancCAPCAR := 0; // Andre Imakawa - SIG 32962
   if (qrydet.FieldByName('CODPORTFORMA').Text = '')or (qrydet.FieldByName('CODPORTFORMA').Text = '0') then    // edilaine - 22/01/2014 - SOL 174933
      begin
      if InsereTmpDesc = False then
        begin

        MsgDlg('É necessário efetuar a parametrização das Rubricas','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;

        end
      end
   else if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
      begin

      ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
      ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
      ctrlDocumento.IdUsuario:=Sistema.IdUsuario;



      lCodLancCAPCAR:=Ctrldocumento.GetSequenceDocumento;

      if not LancaDoc(lCodLancCAPCAR,
               //qrydet.FieldByName('IDTITULAR').Value      // edilaine - 22/01/2014 - SOL 174933
               -1, //NÃO VINCULAR PLANILHA ORIGINAL AO NOVO DOCUMENTO A PAGAR
               qrydet.FieldByName('IDPESSOA').Value,
               StrtoInt(sCODPORTFORMA),
               StrtoInt(sUNIDNEGOC),
               StrToInt(sCODTIPDOC),
               DateToStr(StrToDate(DateToStr(Now))),
               qrydet.FieldByName('DATAPREVISTA').AsString, // DateToStr(StrToDate(DateToStr(Now))),///vencimento ver
               IntToStr(lCodLancCAPCAR),
               {dblkFolha.Text}'', ////ver
               sCODTIPRECDES,
               sCODCENTRORESPON,
               sContaLiquido,
               'R',
               qrydet.FieldByName('Vlr Parcela').Value,
               strtoint(sCODFORMA)
               ) then
      begin
     //   frameProgresso.ExibeMensagem('Erro na criação do Novo Contas a Pagar.');
        exit;
      end;


/////////
    end;



   UpdateHSTDIVIDABENEFICIO('1');///flgsituacao = 1
   passou:=true;
   except

   qrydet.Filtered:=False;
   Exit;
   end;







   qrydet.Next;
   end;


qrydet.Filtered:=False;
if passou then
   MsgDlg('Envio de cobranças efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
//else
//   MsgDlg( 'Não é possível realizar o envio.','Informação',mtInformation,[mbOk],0);


end;

procedure TFrmCtrlDiviBenef.ExecutarRecebimento;
var
   query_temp:TwwQuery;
   sContaLiquido,sCODPORTFORMA,sUNIDNEGOC,sCODTIPDOC,sCODTIPRECDES,sCODCENTRORESPON,sCODFORMA:string;
   lCodLancCAPCAR:longint;
   achou:Boolean;

{  // edilaine - 22/01/2014 - SOL 174933
function VerificarRecebimentoTMPDESC:Boolean;
var
 query:TwwQuery;
   begin

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;
   query.SQL.Add('Select DATARECEBIMENTO FROM TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
   query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
   query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
   query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
   query.Open;
   if query.FieldByName('DATARECEBIMENTO').Text<>'' then
      result:=True
   else
      result:=False;

   query.Close;
   query.Destroy;

   end;
} // edilaine - 22/01/2014 - SOL 174933 - fim

function VerificaRecebimento(_CODDOCUMENTO:string):Boolean;
   var
   query:TwwQuery;
   begin
   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;

   query.SQL.Add('SELECT 1 ');
   query.SQL.Add('  FROM LANCTODOCUM');
   query.SQL.Add(' WHERE CODDOCUMENTO ='+_CODDOCUMENTO);
   query.SQL.Add('   AND OPERACAO = 5');////5 é recebido
   query.Active:=True;
   if query.IsEmpty then
      result:=False
   else
      result:=True;


   query.Active:=false;
   query.Destroy;
   end;
begin


achou:=false;
qrydet.Filter:='Selecionar ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

if qrydet.IsEmpty then
   begin
   MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;

qrydet.First;
while not qrydet.eof do
   begin

     if (qrydet.FieldByName('FLGSITUACAO').Text <> '1') and (qrydet.FieldByName('FLGSITUACAO').Text <> '2') then
        begin
        MsgDlg( 'Recebimento de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;
        end;

     ///if

     if qrydet.FieldByName('FLGDESCFOLHA').Text<>'B' then
     //if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
        begin

         //// se foi contas a receber
         if VerificaRecebimento(qrydet.FieldByName('CODDOCUMENTO').Text) = False then
            begin
            MsgDlg( 'Não é possível realizar o recebimento.','Informação',mtInformation,[mbOk],0);
            qrydet.next;
            Continue;
            end;
       end
     else
         begin

         if VerificarRecebimentoTMPDESC=False then
            begin
            MsgDlg( 'Não é possível realizar o recebimento.','Informação',mtInformation,[mbOk],0);
            qrydet.next;
            Continue;
            end;

         end;

   try
//   InsereTmpDesc;
   UpdateHSTDIVIDABENEFICIO('3', qrydet.FieldByName('FLGDESCFOLHA').Text );///flgsituacao = 3-recebida // SOL 230290 KINTANA 350993
   achou:=true;
   except

   qrydet.Filtered:=False;
   Exit;
   end;







   qrydet.Next;
   end;


qrydet.Filtered:=False;

if achou then
   MsgDlg('Recebimento efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
//else
//   MsgDlg( 'Não é possível realizar o recebimento.','Informação',mtInformation,[mbOk],0);

end;



procedure TFrmCtrlDiviBenef.UpdateHSTDIVIDABENEFICIO(_flgsituacao:string; _flgdescfolha:string = ''); // SOL 230290 KINTANA 350993
    var
     query,query2,queryx:TwwQuery;
     sIDHSTFOLHABENEF,sDATARECEBIMENTO,sCODPROVDESC:string;
     dVALORRECEBIDO:Double;

    function VerificaValorRecebimento(_CODDOCUMENTO:string; pflgdescfolha:string = ''):Double;
       var
       query:TwwQuery;
       begin

       try
         query:=TwwQuery.Create(Self);
         query.DataBaseName :='BaseDados';
         query.Active:=false;

         if pflgdescfolha <> 'B' then
         begin
           query.SQL.Clear;
           query.SQL.Add('SELECT VALOR ');
           query.SQL.Add('  FROM LANCTODOCUM');
           query.SQL.Add(' WHERE CODDOCUMENTO ='+_CODDOCUMENTO);
           query.SQL.Add('   AND OPERACAO = 5');////5 é recebido
           query.Active:=True;

           result:=query.fieldbyname('VALOR').AsFloat;
         end
         else
         begin

           query.SQL.Clear;
           query.SQL.Add('Select valorrecebido FROM TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
           query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
           query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
           query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
           query.Active:=True;
           result := query.FieldByName('valorrecebido').AsFloat;
         end;
       finally
           query.Close;
           query.Destroy;
       end;
       end;
    begin
    query:=TwwQuery.Create(Self);
    query.DataBaseName :='BaseDados';
    query.Active:=false;
    query.SQL.Clear;

    queryX:=TwwQuery.Create(Self);
    queryX.DataBaseName :='BaseDados';
    queryX.Active:=false;
    queryX.SQL.Clear;

    if _flgsituacao = '3' then
        begin
          if ((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then
             begin
             queryx.SQL.Add(' SELECT DATARECEBIMENTO, NVL(VALORRECEBIDO,0)VALORRECEBIDO, CODPROVDESC');
             queryx.SQL.Add('   FROM TMPDESC');
             queryx.SQL.Add('  WHERE REFERENCIA ='+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
             queryx.SQL.Add('    AND IDPESSOA ='+qrydet.FieldByName('IDPESSOA').text);
             queryx.SQL.Add('    AND IDTITULAR ='+qrydet.FieldByName('IDTITULAR').text);
             queryx.SQL.Add('    AND MESCOBRANCA ='+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
             queryX.Active:=True;

             sDATARECEBIMENTO:= queryX.fieldbyname('DATARECEBIMENTO').text;
             dVALORRECEBIDO:= queryX.fieldbyname('VALORRECEBIDO').AsFloat;
             sCODPROVDESC:=queryX.fieldbyname('CODPROVDESC').text;

             queryX.Active:=false;
             queryX.SQL.Clear;
             queryX.SQL.Add(' SELECT IDHSTFOLHABENEF FROM HISTRUBSAL');
             queryx.SQL.Add(' WHERE IDPESSOA= '+qrydet.FieldByName('IDPESSOA').text);
             queryx.SQL.Add(' AND MESCOBRANCA = '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
          //   queryx.SQL.Add(' AND CODDOCUMENTO =  '+qrydet.FieldByName('CODDOCUMENTO').text);
             queryx.SQL.Add(' AND CODPROVDESC = '+#39+sCODPROVDESC+#39);    // SOL 232999/16147 PPM 409169
             queryX.Active:=True;
             sIDHSTFOLHABENEF:=queryX.fieldbyname('IDHSTFOLHABENEF').text;

             end
          else      // edilaine - 22/01/2014 - SOL 174933
             begin
             queryx.SQL.Add(' SELECT datalancto, NVL(VALOR,0)VALORRECEBIDO');
             queryx.SQL.Add('   FROM lanctodocum');
             queryx.SQL.Add('  WHERE CODDOCUMENTO ='+qrydet.FieldByName('CODDOCUMENTO').text);
             queryX.Active:=True;

             sDATARECEBIMENTO:= queryX.fieldbyname('datalancto').text;
             dVALORRECEBIDO:= queryX.fieldbyname('VALORRECEBIDO').AsFloat;
             end
        end;

    query.SQL.Add('UPDATE HSTDIVIDABENEFICIO');


    if _flgsituacao = '3' then
        begin
    //    if VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value) = qrydet.FieldByName('Vlr Parcela').Value then
//           query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao)
//        else
             if ((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then
                begin
                  if qrydet.FieldByName('VALORPREVISTO').AsFloat = dVALORRECEBIDO then      // edilaine - 22/01/2014 - SOL 174933
                     query.SQL.Add('   SET FLGSITUACAO ='+'3')
                  else
                     query.SQL.Add('   SET FLGSITUACAO ='+'4');
                end
             else
                query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);

        if ((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then
           begin
           query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value,_flgdescfolha))));
           //query.SQL.Add('   , DATAEFETIVA  ='+#39+FormatDateTime('DD/MM/YYYY',date)+#39);      // edilaine - 22/01/2014 - SOL 174933
           query.SQL.Add('   , DATAEFETIVA  ='+#39+sDATARECEBIMENTO+#39);                         // edilaine - 22/01/2014 - SOL 174933
           end
        else
           begin
           query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(dVALORRECEBIDO)));
           query.SQL.Add('   , DATAEFETIVA  ='+#39+sDATARECEBIMENTO+#39);
           query.SQL.Add('   , IDHSTFOLHABENEF  ='+#39+sIDHSTFOLHABENEF+#39);
           end;
//        query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').Value)));
        end
    else
        begin
        query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);
        if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
           query.SQL.Add('   , CODDOCUMENTO  ='+#39+inttostr(lCodLancCAPCAR)+#39);
        end;

    query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
    query.ExecSQL;
    GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);



    if _flgsituacao = '3' then
       begin

        query2:=TwwQuery.Create(Self);
        query2.DataBaseName :='BaseDados';
        query2.Active:=false;
        query2.SQL.Clear;

        query2.SQL.Add('SELECT SALDODEVEDORATUAL,QUANTIDADEPARCELASPAGAS');
        query2.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO');
        query2.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query2.open;

        query.SQL.Clear;
        query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
        if ((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then
           begin

            if query2.FieldByName('SALDODEVEDORATUAL').AsFloat-VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value,_flgdescfolha)>0 then
    //        if query2.FieldByName('SALDODEVEDORATUAL').Value-qrydet.FieldByName('Vlr Parcela').Value>0 then
               query.SQL.Add('   SET FLGQUITADO =0')
            else
               query.SQL.Add('   SET FLGQUITADO =1');

           query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value-VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value,_flgdescfolha))));
//           query.SQL.Add('   , SALDODEVEDORATUAL  =SALDODEVEDORATUAL-'+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value-VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value))));
           end
       else
           begin

           if (query2.FieldByName('SALDODEVEDORATUAL').AsFloat-dVALORRECEBIDO)>0 then
      //        if query2.FieldByName('SALDODEVEDORATUAL').Value-qrydet.FieldByName('Vlr Parcela').Value>0 then
                 query.SQL.Add('   SET FLGQUITADO =0')
              else
                 query.SQL.Add('   SET FLGQUITADO =1');

           //Helio - SOL Nº 254904 PPM Nº 808325 deve ser executado sempre quando for FLGSITUACAO = 3 'Recebida'
           //query.SQL.Add('   , VALORULTIMAPARCELA ='+OraNumero(FloatToStr(dVALORRECEBIDO)));

           query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').AsFloat-dVALORRECEBIDO)));


           end;

        //Helio- SOL Nº 254904 PPM Nº 808325 executado sempre quando for FLGSITUACAO = 3 'Recebida'
        query.SQL.Add('   , VALORULTIMAPARCELA ='+OraNumero(FloatToStr(dVALORRECEBIDO)));

        query.SQL.Add('   , QUANTIDADEPARCELASPAGAS ='+OraNumero(FloatToStr(query2.FieldByName('QUANTIDADEPARCELASPAGAS').Value+1)));
        query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO  = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;

        GravaLogTOTALPREV ('CONTROLEDIVIDABENEFICIO -UPDATE- IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query2.close;
        query2.Destroy;
       end;




    query.close;
    query.Destroy;

    end;

procedure TFrmCtrlDiviBenef.ExecutarDesfazerPreparo;
var
 query:TwwQuery;
 flgsituacaoaodeletar:string;
 passou:Boolean;
 sTabela,sCampo : string; // edilaine - 22/01/2014 - SOL 174933
//procedure ExecDeleteHSTDIVIDABENEFICIO;
procedure ExecDelete(sTabela : string);     // edilaine - 22/01/2014 - SOL 174933
var
 query:TwwQuery;
   begin

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;
   query.SQL.Add('DELETE '+sTabela+' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
   query.ExecSQL;
   GravaLogTOTALPREV (sTabela+' -DELETE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
   query.Close;
   query.Destroy;

   end;
//function ProcurarTMPDESC:Boolean;
function ProcurarLancamento(sTabela, sCampo : string) : boolean;     // edilaine - 22/01/2014 - SOL 174933
var
 query:TwwQuery;
   begin

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;
   query.SQL.Add('Select 1 FROM '+sTabela+' WHERE '+sCampo+' = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);    // edilaine - 22/01/2014 - SOL 174933
   query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
   query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
   query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
   query.Open;
   if query.IsEmpty then
      result:=False
   else
      result:=True;
      
   query.Close;
   query.Destroy;

   end;

procedure ExecDeleteTMPDESC;
var
 query:TwwQuery;
   begin

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;
   query.SQL.Add('DELETE TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
   query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
   query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
   query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
   query.ExecSQL;
   GravaLogTOTALPREV ('TMPDESC -DELETE- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
   query.Close;
   query.Destroy;

   end;
begin

query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.SQL.Clear;

 passou:=False;

qrydet.Filter:='Selecionar ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

if qrydet.IsEmpty then
   begin
   MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;
flgsituacaoaodeletar:='';   
qrydet.First;
while not qrydet.eof do
   begin

//     if (qrydet.FieldByName('FLGSITUACAO').Text <> '0')  then
//        begin
//     //   MsgDlg( 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Erro',mtError,[mbOk],0);
//        qrydet.next;
//        Continue;
//        end;

   // verifica se houve baixa do documento
   if ((qrydet.FieldByName('CODPORTFORMA').Text <> '') and (DocumentoJaBaixado( qrydet.FieldByName('CODDOCUMENTO').Text))) or
      ((qrydet.FieldByName('CODPORTFORMA').Text = '')  and (VerificarRecebimentoTMPDESC)) then
      begin
      qrydet.next;
      Continue;
      end;


   try
     sTabela := iif(qrydet.FieldByName('CODPORTFORMA').Text='', 'TMPDESC',   'HSTDIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933
     sCampo  := iif(qrydet.FieldByName('CODPORTFORMA').Text='', 'REFERENCIA','IDHSTORICODIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933

     if (qrydet.FieldByName('FLGSITUACAO').Text = '0')then
        begin
        if (qrydet.FieldByName('NUMEROPARCELA').Text = '1')then
           begin
           qrydet.next;
           Continue;
           end;
        passou:=True;
//      ExecDeleteHSTDIVIDABENEFICIO;
        ExecDelete(sTabela);
        flgsituacaoaodeletar:='0';
        end
     else
         if (qrydet.FieldByName('FLGSITUACAO').Text = '1') or (qrydet.FieldByName('FLGSITUACAO').Text = '2') then
             begin

             if ProcurarLancamento(sTabela, sCampo) = true then   // edilaine - 22/01/2014 - SOL 174933
                begin
//                ExecDeleteHSTDIVIDABENEFICIO;
                if (qrydet.FieldByName('CODDOCUMENTO').Text > '0') then
                begin
                  ExecDeleteDocumento(qrydet.FieldByName('CODDOCUMENTO').Text);
                  lCodLancCAPCAR := 0;
                end;
                UpdateHSTDIVIDABENEFICIO('0');///flgsituacao = 3-recebida
                ExecDeleteTMPDESC;
                //ExecDeleteTMPDESC              // edilaine - 22/01/2014 - SOL 174933
                end
              else
              begin

              end;

             flgsituacaoaodeletar:='1';
             passou:=True;
             end
         else
             passou:=False;

   except

   qrydet.Filtered:=False;
   Exit;
   end;







   qrydet.Next;
   end;


qrydet.Filtered:=False;


if passou then
   begin

    if flgsituacaoaodeletar = '0' then
      MsgDlg('Preparo de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0)
    else
      MsgDlg('Envio de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0);
   end
else
    if flgsituacaoaodeletar = '0' then
      MsgDlg( 'Não foi possível desfazer .','Informação',mtInformation,[mbOk],0)
    else
      MsgDlg( 'Não foi possível desfazer .','Informação',mtInformation,[mbOk],0);




end;


procedure TFrmCtrlDiviBenef.bbtnDesfazerClick(Sender: TObject);
begin
//  inherited;
bbtnDesfazer.Enabled:=false;
btnProcessar.Enabled:=false;
try
case rgTipoOp.ItemIndex of
   0,1:begin
      ExecutarDesfazerPreparo;
      end;
   2:begin
      ExecutarDesfazerRecebimento;
      end;
end;




If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;      

dtmBaseDados.dbBaseDados.Commit;


except
bbtnDesfazer.Enabled:=True;
btnProcessar.Enabled:=True;


If dtmBaseDados.dbBaseDados.InTransaction   Then
   dtmBaseDados.dbBaseDados.Rollback;

end;
qrydet.Filtered:=false;
pdesPrc:=true;
btnProcurarClick(Sender);
pdesPrc:=false;
end;

procedure TFrmCtrlDiviBenef.ExecutarDesfazerRecebimento;
var
 query:TwwQuery;
 passou:Boolean;

function VerificaBaixado(_CODDOCUMENTO:string):Boolean;
   var
     query:TwwQuery;
   begin
     query:=TwwQuery.Create(self);
     query.DatabaseName:='BaseDados';
     query.Active:=False;
     query.SQL.Clear;

     query.SQL.Add('SELECT CODDOCUMENTO FROM DOCUMENTO  ');
     //query.SQL.Add('WHERE OPERACAO= 2');       // edilaine - 22/01/2014 - SOL 174933
     query.SQL.Add('WHERE STATUS= 2');       // edilaine - 22/01/2014 - SOL 174933
     query.SQL.Add('AND CODDOCUMENTO ='+_CODDOCUMENTO);

     query.Active:=True;

     if query.IsEmpty then
        result:=false
     else
        result:=True;

   query.close;
   query.Destroy;    


   end;

function VerificaEmisBloq(_CODDOCUMENTO:string):Boolean;
   var
     query:TwwQuery;
   begin
     query:=TwwQuery.Create(self);
     query.DatabaseName:='BaseDados';
     query.Active:=False;
     query.SQL.Clear;

     query.SQL.Add('SELECT CODDOCUMENTO FROM DOCUMENTO  ');
     query.SQL.Add('WHERE EMISBLOQ=''S''');
     query.SQL.Add('AND CODDOCUMENTO ='+_CODDOCUMENTO);

     query.Active:=True;

     if query.IsEmpty then
        result:=false
     else
        result:=True;

   query.close;
   query.Destroy;    


   end;

procedure UpdateHSTDIVIDABENEFICIOXEnviado;
    var
     query:TwwQuery;
    begin
    query:=TwwQuery.Create(Self);
    query.DataBaseName :='BaseDados';
    query.Active:=false;
    query.SQL.Clear;

    query.SQL.Add('UPDATE HSTDIVIDABENEFICIO');
    query.SQL.Add('   SET FLGSITUACAO =1');


    query.SQL.Add('   , DATAEFETIVA  =null');
    query.SQL.Add('   , IDHSTFOLHABENEF =null');
    query.SQL.Add('   , VALORRECEBIDO =null');


    query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
    query.ExecSQL;
    GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);



    query.SQL.Clear;
    query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
    query.SQL.Add('   SET FLGQUITADO =0');
    query.SQL.Add('   , SALDODEVEDORATUAL  =SALDODEVEDORATUAL+'+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').AsFloat)));
    query.SQL.Add('   , QUANTIDADEPARCELASPAGAS =QUANTIDADEPARCELASPAGAS-1');
    query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO  = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
    query.ExecSQL;
    GravaLogTOTALPREV ('CONTROLEDIVIDABENEFICIO -UPDATE- IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);


    query.close;
    query.Destroy;

    end;

begin

query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.SQL.Clear;




qrydet.Filter:='Selecionar ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

if qrydet.IsEmpty then
   begin
   MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;

passou:=false;
qrydet.First;
while not qrydet.eof do
   begin

   {  // edilaine - 22/01/2014 - SOL 174933
  if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
     begin

     if VerificaEmisBloq(qrydet.FieldByName('CODDOCUMENTO').Text) then
        begin
        qrydet.Next;
        Continue;
        end;

     if VerificaBaixado(qrydet.FieldByName('CODDOCUMENTO').Text) then
        begin
        qrydet.Next;
        Continue;
        end;

     end;
    }   // edilaine - 22/01/2014 - SOL 174933

   try
     if (qrydet.FieldByName('FLGSITUACAO').Text = '3') OR (qrydet.FieldByName('FLGSITUACAO').Text = '4')   then
         UpdateHSTDIVIDABENEFICIOXEnviado;

   passou:=true;
   except

   qrydet.Filtered:=False;
   Exit;
   end;







   qrydet.Next;
   end;


qrydet.Filtered:=False;


query.close;
query.Destroy;
if passou then
   MsgDlg('Recebimento de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0)
else
   MsgDlg( 'Não foi possível desfazer o recebimento.','Informação',mtInformation,[mbOk],0);
end;

function TFrmCtrlDiviBenef.LancaDoc(iCodLancCAPCAR, PlnCodigo, iidPessoa,
  idblkNovoPortForma, iUnidNegoc, iCodTipDoc: integer; sdtenvio, sdtvencto,
  sNoDocumento, smmMotivo, sTipRecDes, sCentroRespon, sContaCliFor,
  RecPag: string; valor: real; aicodforma: integer): Boolean;
var lNumLancto: longint;
    ssql, sDebCre: String;
    lidcbancaria: integer;

    query:TwwQuery; //SIG20880
begin
  Result:=true;
//  if IntegraBack.ObrigaCRespon = 'N' then
//    if sCentroRespon = '' then
//      sCentroRespon := prmCodCentroRespon;
//  if IntegraBack.ObrigaABC = 'N' then
//    if iUnidNegoc = 0 then
//      iUnidNegoc := prmUnidNegoc;
 // if Sistemafolha.FLGINTEGRAFINANC = 1 then



    // SIG20880 inicio
   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.close;
   query.SQL.Clear;
   query.SQL.add('DECLARE' + #13#10 +
                 '  IEXISTEPESSOA NUMBER;' + #13#10 +
                 'BEGIN' + #13#10 +
                 '' + #13#10 +
                 '  BEGIN' + #13#10 +
                 '    SELECT 1' + #13#10 +
                 '      INTO IEXISTEPESSOA' + #13#10 +
                 '      FROM CM.CLIENTEPESS C' + #13#10 +
                 '     WHERE C.IDPESSOA = '+IntToStr(iidPessoa)+';' + #13#10 +
                 '  EXCEPTION' + #13#10 +
                 '    WHEN NO_DATA_FOUND THEN' + #13#10 +
                 '      INSERT INTO CM.CLIENTEPESS' + #13#10 +
                 '        (IDPESSOA)' + #13#10 +
                 '      VALUES' + #13#10 +
                 '        ('+IntToStr(iidPessoa)+');' + #13#10 +
                 '' + #13#10 +
                 '      BEGIN' + #13#10 +
                 '        SELECT 1' + #13#10 +
                 '          INTO IEXISTEPESSOA' + #13#10 +
                 '          FROM CM.EMPRESACLIENTE E' + #13#10 +
                 '         WHERE E.IDFORCLI = '+IntToStr(iidPessoa)+';' + #13#10 +
                 '      EXCEPTION' + #13#10 +
                 '        WHEN NO_DATA_FOUND THEN' + #13#10 +
                 '' + #13#10 +
                 '          INSERT INTO CM.EMPRESACLIENTE' + #13#10 +
                 '            (IDFORCLI, IDPESSOA, PLANO, CONTACCLIENTE)' + #13#10 +
                 '          VALUES' + #13#10 +
                 '            ('+IntToStr(iidPessoa)+', '+IntToStr(Sistema.IdEmpresa)+', '+IntToStr(IntegraBack.Plano)+', '+QuotedStr('21110401')+');' + #13#10 +
                 '      END;' + #13#10 +
                 '  END;' + #13#10 +
                 '' + #13#10 +
                 'END; ');

   query.ExecSQL;
    // SIG20880 final

  begin

    try
      lidcbancaria:=0;

      CtrlDocumento.SetValues(
        icodlanccapcar, //licoddocumento
        strtofloat(snodocumento), //nodocumento
        '',  //scompldocumento
        '0', // sStatus
        recpag, // recpag
        '2', // sOperacao
        '',  //sNumslip,
        '',  //sNumleitcodbarras,
        sContaCliFor, //sPlaconta,
        '',  //sCodcentrocusto,
        '',  //sNossonumero,
        '',  //sNumdigcodbarras,
        '',  //sGrupodoc,
        '',  //sFlgemitelancbaix,
        '',  //sFlgconfirmarecpag,
        '',  //sEmisbloq,
        '',  //sReferencia,
        '',  //sObs
        strtodate(sdtvencto), //dDatavencto,
        strtodate(sdtenvio), //dDataemissao,
        strtodate(sdtvencto), //dDataprogramada,
        0,  //dDataremessa,
        0,  //dDatalimite,
        0,  //dDatacorrecao,
        0,  //rVlrmulta,
        0,  //rValorjuros,
        0,  //rValordesconto,
        0,  //rPercjurossimples,
        0,  //rPercjurosatuarial
        111, //liCodtipdoc,
        Sistema.IdEmpresa, //liIdpessoa,
        Sistema.idmodulo, //liIdmodulo,
        iidPessoa, //liIdforcli,
        0, //liNumfatura,
        lidcbancaria, //liIdcbancaria,
        prmUnidNegoc, //-1, //liUnidnegoc, 
        IntegraBack.Plano, //liPlano,//ver
        0, //liNumcpbaixa,
        0, //liNumapgr,
        0, //liMoecodigo,
        0, //liLotetransmissao,
        0, //liIndicecorrecao,
        Sistema.Idusuario, //liIdusuarioinclusao,
        Sistema.IdEmpresa, //liIdempresa,
        0, //liFlgnaoconciliado,
        0, //liControleremessa,
        0, //liCodsubconta,
        idblkNovoPortForma, //liCodportforma,
        0, //liCodgrupocnab,
        0, //liCodgeradorinss,
        aicodforma //liCodforma
         );

      if RecPag = 'P' then
        sDebCre:='C'
      else
        sDebCre:='D';

      CtrlDocumento.Lanctodocum.SetValues(
        strtodate(sdtenvio), //dDatalancto
        icodlanccapcar, //licoddocumento
        0, //liNumlancto
        valor, //rVlrliquido,
        0, //rValorOM
        valor, //rValor
        prmUnidNegoc, //-1, //liUnidnegoc, 
        PlnCodigo, //liPlncodigo
        0, //liNumlotemanual,
        Sistema.Idusuario, //liIdusuarioinclusao,
        Sistema.IdEmpresa, //liIdempresa,
        0, //liIdnflivro,
        0, //liEstorno,
        111, //liCodtipdoc,
        0, //liCoddocinss,
        0, //liCodalterador
        '2', //sOperacao,
        '', //sNumrecibo,
        '', //sNumnf,
        '', //sNumfatura,
        copy(smmMotivo,1,60), //sHistoricocompl,
        '', //sFlgtipofatura,
        '', //sFlgrecebeunf,
        '', //sFlgfatemitida,
        sdebcre, //sDebcre
        Sistema.idmodulo, //liIdModulo
        IntegraBack.Plano, //liPlanoConta///ver
        Sistema.UsaPlanoPatro, //bUsaPlanoPatro
        false, //bContabiliza
        idblkNovoPortForma, //iCodPortForma,
        0, //iDiasFloat
        '', //sContaBaixa
        0 //liSubContaBaixa
        );

      CtrlDocumento.Rateiodocum.SetValues(
        valor, //rValor,
        0, //rValorOM,
        0, //rVlrresorcamen: Double;
        0, //liIdrateiodocum,
        Sistema.Idempresa, //liIdpessoa,
        icodlanccapcar, //licoddocumento
        iUnidNegoc, //liUnidnegoc,
        0, //liMoecodigo,
        Sistema.Idusuario, //liIdusuarioinclusao,
        0, //liIdreservaorcamen,
        IntegraBack.Plano, //liPlano,///ver
        qrydet.FieldByName('IDPLANOPREV').value, //liIdplanoprev,
        qrydet.FieldByName('IDPESSJUR').value, //liIdpatro,
               1, //liIdprograma,
        0, //liIdprocesso,
        Sistema.idempresa, //liIdempresa
        sTipRecDes, //sCodtiprecdes,
        recpag, //sRecpag,
        sCentroRespon, //sCodcentrorespon,
        ''{SistemaFolha.CODCCUSTOFINAN}, //sCodcentrocusto,///ver
        '' //sNumimovel
        );

      if not CtrlDocumento.Insert then
      begin
//        frameProgresso.ExibeMensagem('Erro ao criar documento.');
//        frameProgresso.ExibeMensagem('Favorecido:'+inttostr(iidPessoa));
//        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+inttostr(idblkNovoPortForma));
//        frameProgresso.ExibeMensagem(CtrlDocumento.MessageInfo);
//        Result:=false;
      end;
    except
      on E:Exception do
      begin
//        frameProgresso.ExibeMensagem('Erro ao criar documento.');
//        frameProgresso.ExibeMensagem('Favorecido:'+inttostr(iidPessoa));
//        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+inttostr(idblkNovoPortForma));
//        frameProgresso.ExibeMensagem('Mensagem de erro : '+E.Message);
//        Result:=false;
      end;
    end;
  end;

end;

procedure TFrmCtrlDiviBenef.FormCreate(Sender: TObject);
begin
//  inherited;
  ctrlDocumento:=tctrlDocumento.create;
  ctrlDocumento.InitializeAs(Padroes);

  seAno.Value:=strtoint(FormatDateTime('YYYY',now));
  cbbMes.ItemIndex:=0;
  pdesPrc:=false;

  rgTipoOpClick(rgTipoOp); // FHBS - 16/01/2014 - SOL 174933
end;

procedure TFrmCtrlDiviBenef.btnProcessarClick(Sender: TObject);
begin
  inherited;
bbtnDesfazer.Enabled:=False;
btnProcessar.Enabled:=False;
try

if trim(cbbMes.Text) = '' then
   begin
   MsgDlg( 'É necessário selecionar o Mês/Ano de Cobrança.','Informação',mtInformation,[mbOk],0);
   cbbMes.SetFocus;
   end;  


case rgTipoOp.ItemIndex of
   0:begin
      ExecutarPreparo;
      end;
   1:begin
      ExecutarEnvio;
      end;
   2:begin
      ExecutarRecebimento;
      end;



end;


If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;      

dtmBaseDados.dbBaseDados.Commit;
except
btnProcessar.Enabled:=True;
bbtnDesfazer.Enabled:=True;


If dtmBaseDados.dbBaseDados.InTransaction   Then
   dtmBaseDados.dbBaseDados.Rollback;

qrydet.Filtered:=false;
//Consulta;

end;
pdesPrc:=true;
btnProcurarClick(Sender);
pdesPrc:=False;
end;

procedure TFrmCtrlDiviBenef.gerar_impressao;

begin



qryDet.Filter:='Selecionar ='+#39+'S'+#39;
qryDet.Filtered:=True;
qryDet.Active:=True;

TFrmPreview.CreateModalPreview(Application, ppReport1,'CONTROLE DE DÍVIDAS DE BENEFÍCIOS');
ExecSaveRel(ppReport1);


qryRelatorio.Active:=False;

end;

procedure TFrmCtrlDiviBenef.Button1Click(Sender: TObject);
begin
  inherited;

qryDet.Filter:='Selecionar ='+#39+'S'+#39;
qryDet.Filtered:=True;
qryDet.Active:=True;

if not qryDet.IsEmpty then
   gerar_impressao
else
    begin
    MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.','Informação',mtInformation,[mbOk],0);
    exit;
    end;
end;

procedure TFrmCtrlDiviBenef.ExecSaveRel(var Rpt: TppReport);
begin
Rpt.DeviceType       := 'ExcelFile';
Rpt.AllowPrintToFile := True;
Rpt.ShowPrintDialog  := True;
Rpt.TextFileName:='C:\PLANUS\TEMP\CONTROLEDIVIDABENEFICIO'+FormatDateTime('DD_MM_YYYY', date);
//rpReversaoCotas.TextFileName     := local+'\DEMONSTRATIVO DE REVERSÃO DE COTA-'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT+'-'+FormatDateTime('DDMMYYYY', date)+'-'+FormatDateTime('HHMMSS', time)+'.XLS';
Rpt.Print;
end;

procedure TFrmCtrlDiviBenef.btnFiltroClick(Sender: TObject);
begin
  inherited;
{
qrydet.Filter:='';
if not qryDet.IsEmpty then
   begin
    if trim(cbbMes.Text) = '' then
       begin
       MsgDlg( 'É necessário selecionar o Mês/Ano de Cobrança.','Informação',mtInformation,[mbOk],0);
       cbbMes.SetFocus;
       end;

    qrydet.Filter:='MESCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex)+1)+#39;
    qrydet.Filtered:=True;
    qrydet.Active:=True;
   end;}
end;

procedure TFrmCtrlDiviBenef.dbgrdDetDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if qryDet.FieldByName('FLGSITUACAO').Text = '0' then
   dbgrdDet.Canvas.Font.Color:= clblue
else
if (qryDet.FieldByName('FLGSITUACAO').Text = '1') or (qryDet.FieldByName('FLGSITUACAO').Text = '2') then
   dbgrdDet.Canvas.Font.Color:= clGreen
else
if (qryDet.FieldByName('FLGSITUACAO').Text = '3') or (qryDet.FieldByName('FLGSITUACAO').Text = '4') then
   begin
   dbgrdDet.Canvas.Font.Color:= clBlack;
   end;

  dbgrdDet.DefaultDrawDataCell(Rect, Field, State);




end;

function TFrmCtrlDiviBenef.RetornaSaldoAtualizado(_datainicio: string;
  _saldodevedoratual: Double): Double; ///Reb/Novo plano, Reg replan Saldado (74,66,28)
    var
     query:TwwQuery;
     _datainicio2,_datainicio3:string;

begin

//Início - William Santana - SIG 27216
//query:=TwwQuery.Create(Self);
//query.DataBaseName :='BaseDados';
//query.Active:=false;
//query.SQL.Clear;

//_datainicio3:=inttostr(strtoint(Copy(_datainicio,7,4))-1) +'/'+Copy(_datainicio,4,2);//data - 1 ano
//
//if Copy(_datainicio,4,2) = '01' then
//   begin
//   _datainicio3:=inttostr(strtoint(Copy(_datainicio,7,4))-1) +'/'+'12';//data - 1 ano
//   end
//else
//   begin
//  _datainicio2:=Copy(_datainicio,7,4)+'/'+ formatfloat('00',strtoint(Copy(_datainicio,4,2))-1);//data - 1 ano
//   end;

//query.SQL.Add('SELECT ((EXP(SUM(LN(COTVALOR))) + 1) * '+OraNumero(floattostr(_saldodevedoratual))+' ');
//query.SQL.Add('       ) NOVOSALDO');
//query.SQL.Add('  FROM COTACAOMOEDA');
//query.SQL.Add(' WHERE MOECODIGO IN');
//query.SQL.Add('       (SELECT MOECODIGO FROM CM.MOEDA WHERE MOESIGLA = ''INPC'')');
//query.SQL.Add('      ');
//query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
//query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
//query.SQL.Add('       (SELECT '+#39+_datainicio2+#39+' ');
//query.SQL.Add('          FROM DUAL)');
//query.SQL.Add('      ');
//query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
//query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) >=');
//query.SQL.Add('       (SELECT '+#39+_datainicio3+#39'');
//query.SQL.Add('          FROM DUAL)');
//query.SQL.Add('      ');
//query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
//query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
//query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJINSS)');
//query.SQL.Add('      ');
//query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
//query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
//query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJBENEFICIO)');

//query.Active:=True;
//result:=query.fieldbyname('NOVOSALDO').AsFloat;
//query.close;
//query.Destroy;

//Término - William Santana - SIG 27216
end;

function TFrmCtrlDiviBenef.RetornaSaldoAtualizadoRegReplan(
  _saldodevedoratual: Double): Double;
    var
     query:TwwQuery;

begin
//Início - William Santana - SIG 27216
//query:=TwwQuery.Create(Self);
//query.DataBaseName :='BaseDados';
//query.Active:=false;
//query.SQL.Clear;

//query.SQL.Add('SELECT (((COTVALOR)* + 1) * '+OraNumero(floattostr(_saldodevedoratual))+' ');
//query.SQL.Add('       ) NOVOSALDO');
//query.SQL.Add('  FROM COTACAOMOEDA');
//query.SQL.Add(' WHERE MOECODIGO IN');
//query.SQL.Add('       (SELECT MOECODIGO FROM CM.MOEDA WHERE MOESIGLA = ''REAJCAIXA'')');
//query.SQL.Add('   AND COTDATA =');
//query.SQL.Add('       (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE MOECODIGO = 336)');

//query.Active:=True;
//
//result:=query.fieldbyname('NOVOSALDO').Value;
//query.close;
//query.Destroy;

//Término - William Santana - SIG 27216

end;


//Início - William Santana - SIG 27216
function TFrmCtrlDiviBenef.RetornaIndiceAcumulado(pData: string): Double;
 var
  query:TwwQuery;
  sDtIni, sDtFim :string;
  fIndiceAcumulado: Double;

begin
  query:=TwwQuery.Create(Self);
  query.DataBaseName :='BaseDados';
  query.Active:=false;
  query.SQL.Clear;

   sDtFim := '31/12/'+ IntToStr(DiasUteis.ExtraiAno(date)-1);

   if (pData <> EmptyStr) then
   begin
     if (Copy(pData,1,4) >= IntToStr(DiasUteis.ExtraiAno(date)-1))  then
       sDtIni := '01/'+ Copy(pData,6,2)+'/'+Copy(pData,1,4)
     else
      sDtIni := '01/01/'+ IntToStr(DiasUteis.ExtraiAno(date)-1);
   end
   else
     sDtIni := sDtFim;

   //Utilizar indice INPC
   query.SQL.Add('SELECT  ((cotvalor)/100 +1) FATORINDICE ');
   query.SQL.Add('  FROM COTACAOMOEDA');
   query.SQL.Add(' WHERE MOECODIGO = 7 ');
   query.SQL.Add('   AND COTDATA BETWEEN '+#39+sDtIni +#39+ ' AND '+#39+sDtFim+#39 );

    ///Reb/Novo plano, Reg replan Saldado (74,66,28)
   if (qrydet.FieldByName('idplanoprev').text='74') or (qrydet.FieldByName('idplanoprev').text='66') or (qrydet.FieldByName('idplanoprev').text='28') then
     begin
        query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
        query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
        query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJINSS)');
        query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
        query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
        query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJBENEFICIO)');
     end;

   query.open;

   fIndiceAcumulado := 1;
   while not query.Eof do
    begin
      fIndiceAcumulado := fIndiceAcumulado * query.fieldbyname('FATORINDICE').AsFloat;
      query.Next;
    end;

   result :=  fIndiceAcumulado;

   query.close;
   FreeAndNil(query);

end;
//Término - William Santana - SIG 27216

procedure TFrmCtrlDiviBenef.btnProcurarClick(Sender: TObject);
var
i:Integer;
begin
  //inherited;


qrydet.Filtered:=false;

//btnProcurar.Down:=False;

 

  
Consulta;

  for i:= 1 to 17 do
   dbgrdDet.Columns[i].ReadOnly:=True;

if qryDet.IsEmpty then
   begin
     btnProcessar.Enabled:=false;
     bbtnDesfazer.Enabled:=false;
     btnSelTudo.Enabled:=false;
     btnInverte.Enabled:=false;
     Button1.Enabled:=false;
//     btnFiltro.Enabled:=false;
   if pdesPrc = False then
       MsgDlg( 'Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.','Informação',mtInformation,[mbOk],0);
   end
else
   begin
     btnProcessar.Enabled:=true;
     bbtnDesfazer.Enabled:=true;
     btnSelTudo.Enabled:=true;
     btnInverte.Enabled:=true;
     Button1.Enabled:=true;
//     btnFiltro.Enabled:=true;
   end;

end;

procedure TFrmCtrlDiviBenef.rgTipoOpClick(Sender: TObject);
begin
  inherited;
  // FHBS - 16/01/2014 - SOL 174933
  case rgTipoOp.ItemIndex of
    // Preparo
    0: rgTIPOCOB.ItemIndex := 3;
    // Envio
    1: rgTIPOCOB.ItemIndex := 0;
    // Recebimento
    2: rgTIPOCOB.ItemIndex := 1;
  end;
end;


end.
