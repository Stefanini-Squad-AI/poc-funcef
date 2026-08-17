unit rApuracoesRoteiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppDB, ppDBPipe,
  ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppBands,
  ppPrnabl, ppStrtch, ppSubRpt, ppCache, ppVar, Db, DBClient,
  uCMClientDataSet, uCtrlCpRotApurado, dBaseDados, USistema, uCmSqlParams,
  ppModule, raCodMod, ppParameter;

type
  TrptApuracoesRoteiros = class(TFrmCmReport)
    rptRoteiros: TppReport;
    ppBDERoteiros: TppBDEPipeline;
    cdsRoteiros: TCMClientDataSet;
    dtsRoteiros: TDataSource;
    CMSqlParams2: TCMSqlParams;
    CdsEntrada: TCMClientDataSet;
    dtsEntrada: TDataSource;
    ppBDEEntrada: TppBDEPipeline;
    CdsMovimentacao: TCMClientDataSet;
    dtsMovimentacao: TDataSource;
    ppBDEPMovimentacao: TppBDEPipeline;
    sqlEntrada: TCMSqlParams;
    sqlMovimentacao: TCMSqlParams;
    sqlRoteiros: TCMSqlParams;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppEntrada: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppMovimentacao: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLabel123: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppPageStyle1: TppPageStyle;
    ppLabel17: TppLabel;
    ppDBText14: TppDBText;
    ppLine3: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppEntradaPrint(Sender: TObject);
    procedure ppMovimentacaoPrint(Sender: TObject);
  private
    //CtrlCpRotApurado : TCtrlCpRotApurado;

    function ConsultaRot( iIdCpRotApurado : integer;
                                 iIdCpRoteiro    : integer;
                                 iIdCpExecRot    : integer;
                                 iIdCpAtivo      : integer;
                                 sTipoApur       : string;
                                 sSituacao       : string;
                                 dDtApuracao     : TDateTime;
                                 sNomeUsuario    : string;
                                 dDtExecucao     : TDateTime;
                                 sNoDocumento    : string;
                                 sOperacao       : string;
                                 iNumLancto      : integer;
                                 sObs            : string  ) : String;
    function sqlRot:String;                             

  public
    { Public declarations }
  end;

var
  rptApuracoesRoteiros: TrptApuracoesRoteiros;

implementation

{$R *.DFM}

procedure TrptApuracoesRoteiros.FormCreate(Sender: TObject);
begin
  inherited;
  {CtrlCpRotApurado := TCtrlCpRotApurado.Create;
  CtrlCpRotApurado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);}
   
end;

procedure TrptApuracoesRoteiros.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  {cdsRoteiros.data:=CtrlCpRotApurado.ConsultaRotApurado(
        CmpRptCM.ParamValues[0].AsInteger,
        CmpRptCM.ParamValues[1].AsInteger,
        CmpRptCM.ParamValues[2].AsInteger,
        CmpRptCM.ParamValues[3].AsInteger,
        CmpRptCM.ParamValues[4].AsString,
        CmpRptCM.ParamValues[5].AsString,
        CmpRptCM.ParamValues[6].AsDateTime,
        CmpRptCM.ParamValues[7].AsString,
        CmpRptCM.ParamValues[8].AsDateTime,
        CmpRptCM.ParamValues[9].AsString,
        CmpRptCM.ParamValues[10].AsString,
        CmpRptCM.ParamValues[11].AsInteger,
        CmpRptCM.ParamValues[12].AsString
   ); }
   
   with sqlRoteiros, sqlRoteiros.sql do
   begin
     close;
     clear;
     add(ConsultaRot(
        CmpRptCM.ParamValues[0].AsInteger,
        CmpRptCM.ParamValues[1].AsInteger,
        CmpRptCM.ParamValues[2].AsInteger,
        CmpRptCM.ParamValues[3].AsInteger,
        CmpRptCM.ParamValues[4].AsString,
        CmpRptCM.ParamValues[5].AsString,
        CmpRptCM.ParamValues[6].AsDateTime,
        CmpRptCM.ParamValues[7].AsString,
        CmpRptCM.ParamValues[8].AsDateTime,
        CmpRptCM.ParamValues[9].AsString,
        CmpRptCM.ParamValues[10].AsString,
        CmpRptCM.ParamValues[11].AsInteger,
        CmpRptCM.ParamValues[12].AsString));
     prepare;
     open;
   end;

   sqlEntrada.Open;
   sqlMovimentacao.Open;

end;

procedure TrptApuracoesRoteiros.ppEntradaPrint(Sender: TObject);
begin
  inherited;
  //cdsEntrada.data:= CtrlCpRotApurado.DadosRotAprEnt( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsInteger );
  with sqlEntrada, sqlEntrada.sql do
  begin
   close;
   clear;
   add(' SELECT cra.IDCPROTAPRENT                                    , ' +
   '        cte.NOME                                                 , ' +
   '        cra.VALOR                                                , ' +
   '        cra.IDCPTPENTRADA                                        , ' +
   '        cra.IDCPROTAPURADO                                       , ' +
   '        cte.NOMEPARAREGRA                                        , ' +
   '        cra.IDPESSOA                                             , ' +
   '        cra.RECPAG                                               , ' +
   '        cra.CODTIPRECDES                                         , ' +
   '        cra.CODALTERADOR                                         , ' +
   '        trc.DESCRICAO as DESCRECDES                              , ' +
   '        cra.FLGORIGEM                                            , ' +
   '        ta.DESCRICAO as DESCALTERADOR                            , ' +
   '        decode( cra.FLGORIGEM, ''R'', ''Desembolso/Recebimento'' , ' +
   '         ''V'', ''Valor Líquido da Operação'',                     ' +
   '         ''A'', ''Alterador'',                                     ' +
   '         ''Q'', ''Quantidade de Cotas'' ) as ORIGEM                ' +
   ' FROM   CPROTAPRENT     cra ,                                      ' +
   '        CPTPENTRADA     cte ,                                      ' +
   '        TIPORECEBDESEMB trc ,                                      ' +
   '        TIPOALTERADOR   ta                                         ' +
   ' WHERE  cra.IDCPTPENTRADA   = cte.IDCPTPENTRADA                    ' +
   '   and  cra.IDPESSOA        = trc.IDPESSOA      (+)                ' +
   '   and  cra.RECPAG          = trc.RECPAG        (+)                ' +
   '   and  cra.CODTIPRECDES    = trc.CODTIPRECDES  (+)                ' +
   '   and  cra.CODALTERADOR    = ta.CODALTERADOR   (+)                ' +   
   '   and  cra.IDCPROTAPURADO = ' + cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString);
   Prepare;
   open;
  end;
end;

procedure TrptApuracoesRoteiros.ppMovimentacaoPrint(Sender: TObject);
begin
  inherited;
  //cdsMovimentacao.data:= CtrlCpRotApurado.DadosRotAprMov( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsInteger );
  with sqlMovimentacao, sqlMovimentacao.sql do
  begin
    close;
    clear;
    add(' SELECT cra.IDCPROTAPRMOV  ,                                                 ' +
   '        ctm.NOME                ,                                                 ' +
   '        cra.VALOR               ,                                                 ' +
   '        cra.IDCPTIPOMOVIM       ,                                                 ' +
   '        cra.IDCPROTAPURADO      ,                                                 ' +
   '        ctm.NOMEPARAREGRA       ,                                                 ' +
   '        cra.IDREGRA             ,                                                 ' +
   '        cra.IDCPROTAPRENT       ,                                                 ' +
   '        cra.IDCPCONTA           ,                                                 ' +
   '        cra.FLGTPMOVIM          ,                                                 ' +
   '        cra.QTDECOTAS           ,                                                 ' +   
   '        decode( cra.FLGORIGEM, ''E'', ''Entrada'', ''R'', ''Regra'' ) as ORIGEM , ' +
   '        r.NOMEREGRA             ,                                                 ' +
   '        ctm.NOME as NOMEMOVIM   ,                                                 ' +
   '        cte.NOME as NOMEENTRADA ,                                                 ' +
   '        C.NOME as NOMECONTA                                                       ' +
   ' FROM   CPROTAPRMOV     cra ,                                                     ' +
   '        CPTIPOMOVIM     ctm ,                                                     ' +
   '        REGRA           r   ,                                                     ' +
   '        CPROTAPRENT     cre ,                                                     ' +
   '        CPTPENTRADA     cte ,                                                     ' +
   '        CPCONTA         c                                                         ' +
   ' WHERE  cra.IDCPTIPOMOVIM   = ctm.IDCPTIPOMOVIM                                   ' +
   '   AND  cra.IDCPCONTA       = c.IDCPCONTA       (+)                               ' +
   '   AND  cra.IDREGRA         = r.IDREGRA         (+)                               ' +
   '   AND  cra.IDCPROTAPRENT   = cre.IDCPROTAPRENT (+)                               ' +
   '   AND  cre.IDCPTPENTRADA   = cte.IDCPTPENTRADA (+)                               ' +
   '   AND  cra.IDCPROTAPURADO  = ' + cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString +
   '  ORDER BY ctm.NOME ' );
   prepare;
   open;
  end;
end;

function TrptApuracoesRoteiros.ConsultaRot(iIdCpRotApurado,
  iIdCpRoteiro, iIdCpExecRot, iIdCpAtivo: integer; sTipoApur,
  sSituacao: string; dDtApuracao: TDateTime; sNomeUsuario: string;
  dDtExecucao: TDateTime; sNoDocumento, sOperacao: string;
  iNumLancto: integer; sObs: string): String;
var
  sSQL : string;
begin

  sSQL := sqlRot + ' AND cra.FLGSTATUS in ( ''E'', ''C'' ) ';

  if iIdCpRotApurado > 0 then
    sSQL := sSQL + ' AND cra.IDCPROTAPURADO = ' + IntToStr( iIdCpRotApurado );

  if iIdCpRoteiro > 0 then
    sSQL := sSQL + ' AND cra.IDCPROTEIRO = ' + IntToStr( iIdCpRoteiro );

  if iIdCpExecRot > 0 then
    sSQL := sSQL + ' AND cra.IDCPEXECROT = ' + IntToStr( iIdCpExecRot );

  if iIdCpAtivo > 0 then
    sSQL := sSQL + ' AND cr.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

  if sTipoApur <> '' then
    sSQL := sSQL + ' AND cra.FLGTIPOAPUR = ' + QuotedStr( sTipoApur );

  if sSituacao <> '' then
    sSQL := sSQL + ' AND cra.FLGSTATUS = ' + QuotedStr( sSituacao );

  if dDtApuracao > 0 then
    sSQL := sSQL + ' AND trunc( cra.DTAPURACAO ) = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtApuracao ) ) + ', ''DD/MM/YYYY'' ) ' ;

  if sNomeUsuario <> '' then
    sSQL := sSQL + ' AND usu.NOMEUSUARIO = ' + QuotedStr( UpperCase( sNomeUsuario ) );

  if dDtExecucao > 0 then
    sSQL := sSQL + ' AND trunc( cer.DTEXECUCAO ) = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtExecucao ) ) + ', ''DD/MM/YYYY'' ) ' ;

  if sNoDocumento <> '' then
    sSQL := sSQL + ' AND d.NODOCUMENTO = ' + QuotedStr( sNoDocumento );

  if sOperacao <> '' then
    sSQL := sSQL + ' AND cra.FLGOPERACAO = ' + QuotedStr( UpperCase( sOperacao ) );

  if iNumLancto > 0 then
    sSQL := sSQL + ' AND cra.NUMLANCTO = ' + IntToStr( iNumLancto );

  if sObs <> '' then
    sSQL := sSQL + ' AND upper( cra.OBSERVACAO ) like ''%' + UpperCase( sObs ) + '%''';

  sSQL := sSQL + ' ORDER BY cra.DTAPURACAO,  cra.IDCPROTAPURADO ';
  result:= sSQL;
end;

function TrptApuracoesRoteiros.sqlRot: String;
begin
   result:=
         ' SELECT cra.IDCPROTAPURADO   ,                                                                       ' +
         '        cr.NOME              ,                                                                       ' +
         '        cra.DTAPURACAO       ,                                                                       ' +
         '        usu.NOMEUSUARIO      ,                                                                       ' +
         '        cra.IDCPROTEIRO      ,                                                                       ' +
         '        cra.IDUSUARIO        ,                                                                       ' +
         '        cra.FLGTIPOAPUR      ,                                                                       ' +
         '        decode( cra.FLGTIPOAPUR, ''M'', ''Manual'', ''D'', ''Por documento'',                        ' +
         ' ''F'', ''Por lançamento financeiro'' ) as TIPOAPUR,                                                 ' +
         '        cra.FLGSTATUS        ,                                                                       ' +
         '        decode( cra.FLGSTATUS, ''A'', ''Apurado'', ''E'', ''Executado'', ''Cotizado'' ) as SITUACAO, ' +
         '        cer.DTEXECUCAO       ,                                                                       ' +
         '        cr.IDCPATIVO         ,                                                                       ' +
         '        cra.OBSERVACAO       ,                                                                       ' +
         '        cra.CODDOCUMENTO     ,                                                                       ' +
         '        cra.NUMLANCTO        ,                                                                       ' +
         '        cra.FLGOPERACAO      ,                                                                       ' +
         '        cr.FLGORIGEM         ,                                                                       ' +
         '        cra.CODLANCFINANC    ,                                                                       ' +
         '        decode( cra.FLGOPERACAO, ''D'', ''Baixa Documento'', ''E'',                                  ' +
         '         ''Estorno Baixa'', ''P'', ''Próxima Baixa'', '''' ) as OPERACAO,                            ' +
         '        cra.IDCPEXECROT      ,                                                                       ' +
         '        d.NODOCUMENTO        ,                                                                       ' +
         '        l.DATALANCTO         ,                                                                       ' +
         '        a.IDPLANOPREV        ,                                                                       ' +
         '        a.IDPATRO            ,                                                                       ' +
         '        a.NOME as NOMEATIVO  ,                                                                       ' +
         '        v.DTCOTA                                                                                     ' +
         ' FROM   CPROTAPURADO    cra  ,                                                                       ' +
         '        CPROTEIRO       cr   ,                                                                       ' +
         '        USUARIOSISTEMA  usu  ,                                                                       ' +
         '        CPEXECROT       cer  ,                                                                       ' +
         '        DOCUMENTO       d    ,                                                                       ' +
         '        LANCTODOCUM     l    ,                                                                       ' +
         '        CPATIVO         a    ,                                                                       ' +
         '        CPVALORCOTA     v                                                                            ' +
         ' WHERE  cra.IDCPROTEIRO    = cr.IDCPROTEIRO                                                          ' +
         '   AND  cra.IDUSUARIO      = usu.IDUSUARIO                                                           ' +
         '   AND  cr.IDCPATIVO       = a.IDCPATIVO                                                             ' +
         '   AND  cra.IDCPEXECROT    = cer.IDCPEXECROT (+)                                                     ' +
         '   AND  cra.CODDOCUMENTO   = d.CODDOCUMENTO  (+)                                                     ' +
         '   AND  cra.CODDOCUMENTO   = l.CODDOCUMENTO  (+)                                                     ' +
         '   AND  cra.NUMLANCTO      = l.NUMLANCTO     (+)                                                     ' +
         '   AND  cer.IDCPVALORCOTA  = v.IDCPVALORCOTA (+)                                                     ' +
         '   AND cra.FLGSTATUS in ( ''E'', ''C'' )                                                             ' ; 
end;

end.
