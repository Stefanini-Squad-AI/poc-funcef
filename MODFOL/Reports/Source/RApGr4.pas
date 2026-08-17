{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 26662 19/10/2007
{ Descrição    : Corrigido o cabeçario do relatório
{===============================================================================
{ Desenvolvedor: Antonio Marcos (amf)
{ Pendência    : 26661
{ Descrição    : Corrige o "invalid data packet" que ocorria ao selecionar mais de um documento na consulta.
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 26449 04/10/2007
{ Descrição    : Calcula o valor total do documento englobado
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25838 12/07/2007
{ Descrição    : Ajusta para pegar rateios duplicados.
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25768 - 06/07/2007
{ Descrição    : Passar o filtro do estorno do lote só quando tiver lote.
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25542 - 08/06/2007
{ Descrição    : Adicionado o Outer Para trazer quando não tiver Rateio, Documento englobado.
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25184 - 29/05/2007
{ Descrição    : Na contabilização da baixa, operação 5. O relatório passa a visualizar apenas
                 a contabilização do próprio documento, e não a contabilização do lote. Isto se dá apenas
                 para o lançamento à crédito. O banco permanece inalterado, ou seja, totalizando o valor
                 do lote.
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25359 - 17/05/2007
{ Descrição    : O Campo Banco está sendo passado pelo Documento.IdcBancaria
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 25335 - 17/05/2007
{ Descrição    : Corrigido o relatório que não passava o estorno no lote
{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 24816 - 02/04/2007
{ Descrição    : Adicionado um campo no CPF/CNPJ no formulário.
{---------------------------------------------------------------------------------------------------}
{ Data         : 19/01/2007
{ Autor        : Rodolpho da Silva
{ Pendência    : 24244
{ Descrição    : Não considerar as baixas no saldo do documento
---------------------------------------------------------------------------------------------------}
{ Data         : 01/12/2006
{ Autor        : Rodolpho da Silva
{ Pendência    : 23831
{ Descrição    : Corrigir erro de filtragem do Cds quando o mesmo não tiver registros
---------------------------------------------------------------------------------------------------}
{ Data         : 31/10/2006
{ Autor        : Marcus Oliveira
{ Pendência    : 22030 - 31/10/2006
{ Descrição    : Tela do relatório de AP para VALIA, incluíndo horário
{                das autorizações dos processos RAD e um filtro por lote.
---------------------------------------------------------------------------------------------------}

unit RApGr4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls,
  ppPrnabl, ppClass, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlPadroes,
  uCmSqlParams, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, uSistema, uCtrlRelatoriosCAPCAR, uCtrlDocumento,
  StdCtrls, Mask, ppStrtch, ppMemo, ppVar, ppSubRpt, ppModule, raCodMod,
  ppParameter, ppRegion, uCtrlRadPlus, uMensErro, uDiasUteis;

type
  TRptApGr4 = class(TFrmCmReport)
    ppRptApGr4: TppReport;
    sqlAP: TCMSqlParams;
    cdsPrincipal: TCMClientDataSet;
    dsPrincipal: TwwDataSource;
    sqlCabecario: TCMSqlParams;
    cdsCabecario: TCMClientDataSet;
    sqlRAD: TCMSqlParams;
    cdsRAD: TCMClientDataSet;
    dsCabecalho: TDataSource;
    pplCabecalho: TppDBPipeline;
    CdsRateio: TCMClientDataSet;
    SqlRateio: TCMSqlParams;
    ppParameterList1: TppParameterList;
    pplRateio: TppDBPipeline;
    dsRateio: TDataSource;
    SqlContab: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    dsContab: TDataSource;
    pplContab: TppDBPipeline;
    SqlAlterador: TCMSqlParams;
    CdsAlterador: TCMClientDataSet;
    dsAlterador: TDataSource;
    pplAlterador: TppDBPipeline;
    pplPrincipal: TppDBPipeline;
    dsRad: TDataSource;
    pplRAD: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLogo: TppDBImage;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppeMPRESA: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    RegionRAD: TppRegion;
    SubRptRAD: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppShape6: TppShape;
    ppLabel44: TppLabel;
    ppLabel50: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel49: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText29: TppDBText;
    ppDBText33: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppShape7: TppShape;
    ppLabel8: TppLabel;
    LinhaRAD: TppLine;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppdbAP: TppDBText;
    ppLabel4: TppLabel;
    ppdbFavorecido: TppDBText;
    ppLabel5: TppLabel;
    ppDBDesembolso: TppDBText;
    ppLabel6: TppLabel;
    ppdbValorBruto: TppDBText;
    ppLabel7: TppLabel;
    ppdbValorLiquido: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppdbDtVenc: TppDBText;
    ppdbDtProg: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBStatus: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel22: TppLabel;
    ppdbFormaPagamento: TppDBText;
    ppLabel23: TppLabel;
    ppLabel18: TppLabel;
    ppDBText6: TppDBText;
    ppLabel19: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    SubRptRateio: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine10: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppLabel20: TppLabel;
    LinhaRateio: TppLine;
    RegionTributo: TppRegion;
    ppShape5: TppShape;
    ppLabel39: TppLabel;
    SupRptTributo: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLine12: TppLine;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLine9: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    RegionContab: TppRegion;
    SubContab: TppSubReport;
    ppChildReport2: TppChildReport;
    ppShape4: TppShape;
    ppLabel21: TppLabel;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLine11: TppLine;
    ppDBText17: TppDBText;
    ppLabel24: TppLabel;
    ppDBText18: TppDBText;
    ppLabel33: TppLabel;
    ppDBText19: TppDBText;
    ppLabel34: TppLabel;
    ppDBText20: TppDBText;
    ppLabel35: TppLabel;
    ppDBText21: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppDBText23: TppDBText;
    ppLabel38: TppLabel;
    LinhaContab: TppLine;
    LinhaAlterador: TppLine;
    lblCPFCNPJ: TppLabel;
    dbCPFCNPJ: TppDBText;
    lblDocumento: TppLabel;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppDBMemo1: TppDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubRptRateioPrint(Sender: TObject);
    procedure SubRptContabilPrint(Sender: TObject);
    procedure SupRptTributoPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure SubRptRADPrint(Sender: TObject);
    procedure dbCPFCNPJPrint(Sender: TObject);
    procedure lblDocumentoPrint(Sender: TObject);
  private
    { Private declarations }
    iNumDetalhe : Integer;
    OldDoc : String;
    CtrlRelatoriosCAPCAR : TCtrlRelatoriosCAPCAR;
    Documento            : TCtrlDocumento;
    CtrlRadPlus          : TCtrlRadPlus;

    procedure InsereNumApGr;
    procedure ExibeApsAtrasoxDataProg(iDias: integer);

  public
    { Public declarations }
  end;

var
  RptApGr4: TRptApGr4;

implementation
{$R *.DFM}
uses
   uString, uCtrlParamIntegra ;



   
procedure TRptApGr4.FormCreate(Sender: TObject);
begin
  inherited;
    CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
    CtrlRelatoriosCAPCAR.InitializeAs(Padroes);

    Documento            := TCtrlDocumento.Create;
    Documento.InitializeAs(Padroes);

    CtrlRadPlus := TCtrlRadPlus.Create;
    CtrlRadPlus.InitializeAs(Padroes);
end;




procedure TRptApGr4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlRelatoriosCAPCAR.Free;
  Documento.Free;
  FreeAndNil(CtrlRadPlus);
  inherited;
end;


procedure TRptApGr4.SubRptRateioPrint(Sender: TObject);
begin
  inherited;
  if not CdsPrincipal.IsEmpty then
  begin
     CdsRateio.Filtered := False;

     if not ( CdsRateio.IsEmpty ) then
     begin
        CdsRateio.Filter   := 'CODDOCUMENTO = ' + cdsPrincipal.FieldByName('CODDOCUMENTO').AsString ;
        CdsRateio.Filtered := true;
     end;

  end
  else
  if not CdsRateio.IsEmpty then
     CdsRateio.EmptyDataSet;
end;


procedure TRptApGr4.SubRptContabilPrint(Sender: TObject);
var
   sFiltro: string;
begin
  inherited;
  if not CdsPrincipal.IsEmpty then
  begin
     //Marcus Oliveira P.24308 - 02/04/2007 Inicio
     sFiltro := '';
     if CmpRptCM.ParamValues[14].AsBoolean then
       sFiltro := 'OPERACAO <> 5 AND ';

     CdsContab.Filtered := False;
     if not (CdsContab.IsEmpty) then
     begin
       CdsContab.Filter   := sFiltro + 'CODDOCUMENTO = ' + cdsPrincipal.FieldByName('CODDOCUMENTO').AsString;
       CdsContab.Filtered := true;
     end
  end
  else
  if not CdsContab.IsEmpty then
     CdsContab.EmptyDataSet;
end;




procedure TRptApGr4.SupRptTributoPrint(Sender: TObject);
begin
  inherited;
  if not CdsPrincipal.IsEmpty then
  begin
     CdsAlterador.Filtered := False;
     if not CdsAlterador.IsEmpty then
     begin
        CdsAlterador.Filter   := 'CODDOCUMENTO = ' + cdsPrincipal.FieldByName('CODDOCUMENTO').AsString;
        CdsAlterador.Filtered := true;
     end;
  end
  else
  if not CdsAlterador.IsEmpty then
     CdsAlterador.EmptyDataSet;
end;




procedure TRptApGr4.CrmRptCMBeforePrint(Sender: TObject);
var
   aiIdProcessos: array of integer;

begin
  inherited;

    SubRptRAD.ExpandAll     := CmpRptCM.ParamValues[1].AsBoolean;
    SubRptRateio.ExpandAll  := CmpRptCM.ParamValues[1].AsBoolean;
    SupRptTributo.ExpandAll := CmpRptCM.ParamValues[1].AsBoolean;
    SubContab.ExpandAll     := CmpRptCM.ParamValues[1].AsBoolean;
    RegionContab.Visible    := CmpRptCM.ParamValues[6].AsBoolean;

    //Marcus Oliveira 26662 19/10/2007  Inicio
    with sqlCabecario do
    Begin
      Prepare;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('  I.IMAGEM, P.NUMDOCUMENTO ');
      SQL.Add('FROM');
      SQL.Add('  IMAGENS I, PESSOA P');
      SQL.Add('WHERE');
      SQL.Add('  ( P.IDIMAGEM = I.IDIMAGEM ) AND');
      SQL.Add('  ( P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +')');
      Open;
    end;

    ppDBText1.DisplayFormat := '99.999.999/9999-99;0;';
    
    with sqlAP do
    begin   //Qry da AP
      Prepare;
      SQL.Clear;

      //Marcus Oliveira P. 25542 12/06/2007
      SQL.Add('SELECT ');

      //Marcus Oliveira P.24816 30/03/2007
      SQL.Add('   LT.TIPO, ');

      SQL.Add('   LT.NUMLOTE,                                                                   ');
      SQL.Add('   RAD.DATAFIMPROCESSO,                                                          ');
      SQL.Add('   DECODE(RAD.FLGOK,''S'',''Aprovado'',''N'',''Pendente'',''R'',''Recusado'') AS STATUSRAD,  ');
      SQL.Add('   LT.OPERACAO, LT.NUMFATURA, LT.CODDOCUMENTO, LT.NUMAPGR,                       ');
      SQL.Add('   LT.REFERENCIA, LT.NODOCUMENTO, LT.COMPLDOCUMENTO, LT.DATAVENCTO,              ');

      //Marcus Oliveira P.26449 04/10/2007
      SQL.Add('   LT.DATAEMISSAO, LT.DATAPROGRAMADA, LT.NUMDOCUMENTO, VBrutoEngl.VLRBRUTOENGL as VALOR, ');

      SQL.Add('   LT.VALOROUTRAMOEDA, LT.RAZAOSOCIAL, LT.DESCRICAO,                             ');
      SQL.Add('   LT.HISTORICOCOMPL AS HISTORICO, LT.OBS,                                       ');
      SQL.Add('   LT.IDPROCESSO,                                                                ');
      SQL.Add('   LT.FLGDOCBANCARIO, LT.VLACRE, LT.VLDEC, LT.VLIMP,                             ');


      //David - 26/10/07 - Inserido o valor líquido
      SQL.Add(' SALDO.VLLIQ,                                                                    ');


      SQL.Add('   LT.TRGUSERINCLUSAO, LT.TRGDTINCLUSAO, LT.IDFORCLI, LT.TIPODOC,                ');
      SQL.Add('   USU.IDUSUARIO, USU.NOMEUSUARIO,                                               ');
      SQL.Add('   '''' AS DESCESTORNO,                                                          ');

      // Rodolpho da Silva - P:23831 - 01/12/2006
      if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
         SQL.Add('   LTP.IDPROCESSO,')
      else
         SQL.Add('   LT.IDPROCESSO,');

      SQL.Add('   CBA.CONTACORRENTE, CBA.NUMAGENCIA, CBA.NUMBANCO,                              ');
      SQL.Add('   SALDO.VALSALDO                                                               ');
      SQL.Add(' FROM                                                                 ');

      //Marcus Oliveira P. 25542 12/06/2007
      SQL.Add('   USUARIOSISTEMA USU,                                                ');

      SQL.Add('  (SELECT                                                             ' );
      SQL.Add('      CBA.IDPESSOA, CBA.IDCBANCARIA,CBA.CONTACORRENTE,                ' );
      SQL.Add('      CBA.IDAGENCIA, AGE.IDBANCO, AGE.NUMAGENCIA, BAN.NUMBANCO        ' );
      SQL.Add('   FROM                                                               ' );
      SQL.Add('      CONTABANCARIA CBA, AGENCIABANCARIA AGE, BANCO BAN               ' );
      SQL.Add('   WHERE                                                              ' );
      //Marcus Oliveira P. 25359 21/05/2007
      SQL.Add('        CBA.IDAGENCIA    = AGE.IDPESSOA                             ' );
      SQL.Add('    AND AGE.IDBANCO      = BAN.IDPESSOA) CBA,                       ' );

      //Marcus Oliveira P.26449 04/10/2007 Calcula o valor total do documento englobado Inicio

      //David - 26/10/07 - Corrigindo o problema de somar os valores de todos os documentos
      SQL.Add('( SELECT DOCUMENTOS.CODDOCUMENTO, SUM(DOCUMENTOS.VALOR) AS VLRBRUTOENGL                   ');

      SQL.Add('  FROM                                                           ');
      SQL.Add('    (SELECT R.CODDOCUMENTO, R.VALOR                              ');
      SQL.Add('     FROM DOCUMENTO D, RATEIODOCUM R                             ');
      SQL.Add('     WHERE D.CODDOCUMENTO = R.CODDOCUMENTO                       ');
      SQL.Add('       AND D.OPERACAO <> 3                                       ');
      SQL.Add('     UNION ALL                                                   ');
      SQL.Add('     SELECT ENGLOBADO.CODDOCUMENTO, R.VALOR                      ');
      SQL.Add('     FROM DOCUMENTO D, RATEIODOCUM R,                            ');
      SQL.Add('         (SELECT CODDOCUMENTO, NUMFATURA                         ');
      SQL.Add('          FROM DOCUMENTO                                         ');
      SQL.Add('          WHERE OPERACAO = 3) ENGLOBADO                          ');
      SQL.Add('     WHERE                                                       ');
      SQL.Add('       D.CODDOCUMENTO = R.CODDOCUMENTO                           ');
      SQL.Add('       AND D.NUMFATURA = ENGLOBADO.NUMFATURA                     ');
      SQL.Add('     ) DOCUMENTOS                                                ');
      SQL.Add('  WHERE                                                          ');

      //amf 18.10.2007 26661 - passa o documento somente se não for pesquisa por mais de 1 documento.
      if ( Trim(CmpRptCM.ParamValues[0].AsString) = '' ) then
          SQL.Add(' ( 1 = 1) ')
      else
          SQL.Add(' ( DOCUMENTOS.CODDOCUMENTO = ' + (Trim(CmpRptCM.ParamValues[0].AsString)) + ' ) ');


      //David - 26/10/07 - Corrigindo o problema de somar os valores de todos os documentos
      SQL.Add(' group by DOCUMENTOS.CODDOCUMENTO ' );

      SQL.Add(' ) VBrutoEngl,      ');

      //Marcus Oliveira P.26449 04/10/2007 Calcula o valor total do documento englobado Fim

      SQL.Add('  (SELECT                                                            ' );

      //David - 26/10/07 - Inserido o valor líquido
      SQL.Add('      SUM( DECODE( OPERACAO,  5, 0,                                   ' );
      SQL.Add('                             10, 0,                                   ' );
      SQL.Add('                             DECODE( DEBCRE, ''C'', VALOR, VALOR * -1 ) ) ) AS VALSALDO , ' );
      SQL.Add('        SUM( DECODE( DEBCRE, ''C'', VALOR, VALOR * -1 ) ) AS VLLIQ                      , ' );


      SQL.Add('      CODDOCUMENTO                                                    ' );
      SQL.Add('   FROM                                                              ' );
      SQL.Add('      LANCTODOCUM                                                     ' );

      //David - 26/10/07 - Inserido o valor líquido
      SQL.Add('   GROUP BY                                                          ' );
      SQL.Add('      CODDOCUMENTO) SALDO,                                            ' );

      // Rodolpho da Silva - P:23831 - 01/12/2006
      if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
         SQL.Add('   (SELECT NUMLOTE, IDPROCESSO FROM LOTEPAGTO GROUP BY NUMLOTE,IDPROCESSO) LTP,');

      SQL.Add('   (SELECT FLGOK,IDPROCESSO,');
      SQL.Add('       DECODE(DATAFIMPREV,NULL,SYSDATE,DATAFIMPREV) AS DATAFIMPREV,');
      SQL.Add('       DECODE(DATAFIMPROCESSO,NULL,SYSDATE,DATAFIMPROCESSO) AS DATAFIMPROCESSO ');
      SQL.Add('    FROM RADINSTPROCESSO');

      //Situação do processo RAD
      case CmpRptCM.ParamValues[13].AsInteger of
         1: SQL.Add('    WHERE FLGOK = ''S'' ');
         2: SQL.Add('    WHERE FLGOK = ''R'' ');
         3: SQL.Add('    WHERE FLGOK = ''N'' ');
      end;
      SQL.Add('    ) RAD,');

      //Marcus Oliveira  P. 25542 12/06/2007
      if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
      begin
        SQL.Add('( SELECT CODDOCUMENTO');
        SQL.Add('  FROM RATEIODOCUM');
        SQL.Add('  WHERE CODCENTRORESPON = ' + Espaco(CmpRptCM.ParamValues[2].AsString,10));
        SQL.Add('  GROUP BY CODDOCUMENTO ) R,');
      end;

      SQL.Add('   (SELECT  P.TIPO, L.OPERACAO, D.NUMFATURA, D.CODDOCUMENTO,           ' ); //Inserido o "P.TIPO" - Marcus Oliveira P.24816 30/03/2007
      SQL.Add('       D.NUMAPGR, D.REFERENCIA, D.NODOCUMENTO,                         ' );
      SQL.Add('       D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,                  ' );
      SQL.Add('       D.DATAPROGRAMADA, P.NUMDOCUMENTO, L.VALOR,  L.VALOROUTRAMOEDA,  ' );
      SQL.Add('       P.RAZAOSOCIAL, F.DESCRICAO, L.HISTORICOCOMPL, D.OBS,            ' );
      SQL.Add('       D.IDPROCESSO,');
      SQL.Add('       F.FLGDADOSBANCARIOS  AS FLGDOCBANCARIO,                         ' );
      SQL.Add('       (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,                      ' );

      //David - 26/10/07 - Inserido o valor líquido
      SQL.Add('       D.TRGUSERINCLUSAO,   ' );
      SQL.Add('       D.TRGDTINCLUSAO,  D.IDFORCLI, TD.DESCRICAO AS TIPODOC,           ' );
      SQL.Add('       LXDOC.NUMLOTE, D.IDUSUARIOINCLUSAO, D.IDCBANCARIA                ' );
      SQL.Add('    FROM                                                                ' );
      SQL.Add('       PESSOA P, DOCUMENTO D, LANCTODOCUM L,                            ' );
      SQL.Add('       FORMARECPAG F, TIPODOCRECPAG TD,                                 ' );
      //Marcus Oliveira  P. 25542 12/06/2007
      SQL.Add('       LOTEXDOCUM LXDOC                               ' );

      SQL.Add('    WHERE                                                              ' );

      // Se for informado uma data, filtra pela mesma e não por apenas 1 documento específico
      If (trim(CmpRptCM.ParamValues[10].AsString) <> '') or (trim(CmpRptCM.ParamValues[11].AsString) <> '') Then
      Begin
        Case StrToInt(CmpRptCM.ParamValues[4].AsString) Of
          0: SQL.Add('(D.NUMAPGR IS NOT NULL) AND ');
          1: SQL.Add('(D.NUMAPGR IS  NULL) AND ');
        End;

        // Data inicial
        If (trim(CmpRptCM.ParamValues[10].AsString) <> '') Then
        begin
           case CmpRptCM.ParamValues[12].AsInteger of
              0: SQL.Add('   (D.DATAEMISSAO    >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  AND ');
              1: SQL.Add('   (D.DATAVENCTO     >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  AND ');
              2: SQL.Add('   (D.DATAPROGRAMADA >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  AND ');
           end;
        end;
        // Data final
        If (trim(CmpRptCM.ParamValues[11].AsString) <> '') Then
        begin
           case CmpRptCM.ParamValues[12].AsInteger of
              0: SQL.Add('   (D.DATAEMISSAO    <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  AND ');
              1: SQL.Add('   (D.DATAVENCTO     <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  AND ');
              2: SQL.Add('   (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  AND ');
           end;
        end;
      End;

      if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
         SQL.Add('   (D.CODDOCUMENTO = ' + (Trim(CmpRptCM.ParamValues[0].AsString))+ ' ) AND ' );

      if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
         SQL.Add('   (LXDOC.NUMLOTE = ' + Trim(CmpRptCM.ParamValues[5].AsString) + ' ) AND ' );

      SQL.Add('      (D.CODDOCUMENTO = LXDOC.CODDOCUMENTO(+)) AND                      ' );
      SQL.Add('      (L.OPERACAO IN (''1'',''2'',''3'',''11'',''14'')) AND             ' );
      SQL.Add('      (L.ESTORNO IS NULL) AND                                           ' );
      SQL.Add('      (D.RECPAG           = ' + QuotedStr(ParamIntegra.RecPag) + ') AND ' );
      SQL.Add('      (D.IDPESSOA         = ' + IntToStr(Sistema.IdEmpresa) +')  AND    ' );
      SQL.Add('      (D.CODDOCUMENTO     = L.CODDOCUMENTO) AND                         ' );
      SQL.Add('      (P.IDPESSOA         = D.IDFORCLI) AND                             ' );
      SQL.Add('      (D.CODFORMA         = F.CODFORMA(+)) AND                          ' );
      SQL.Add('      (TD.CODTIPDOC       = D.CODTIPDOC)         AND                    ' );
      //Marcus Oliveira  P. 25542 12/06/2007

      //Marcus Oliveira  P. 25768 06/07/2007
      if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
      SQL.Add('      (NVL(LXDOC.FLGESTORNO, ''N'') <> ''S'')  AND                      ' );

      SQL.ADD('      (NVL(TD.FLGIMPRIMEAP, ''S'') = ''S'')                             ' );
      SQL.ADD('      ) LT                                                              ' );

      SQL.Add('   WHERE                                                                ' );
      SQL.Add('         (lt.IDCBANCARIA  = CBA.IDCBANCARIA(+))                         ' );
      SQL.Add('     AND (lt.IDUSUARIOINCLUSAO = USU.IDUSUARIO)                         ' );
      SQL.Add('     AND (LT.CODDOCUMENTO  = SALDO.CODDOCUMENTO)                        ' );
      SQL.Add('     AND (LT.IDPROCESSO    = RAD.IDPROCESSO(+))                         ' );

      //Marcus Oliveira  P. 25542 12/06/2007
      if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
      SQL.Add('     AND (R.CODDOCUMENTO = LT.CODDOCUMENTO)                          ' );

      if CmpRptCM.ParamValues[7].AsBoolean then
      begin
         SQL.Add('  AND (LT.IDPROCESSO    = RAD.IDPROCESSO)                         ' );
         SQL.Add('  AND (RAD.DATAFIMPREV  < RAD.DATAFIMPROCESSO)                    ' );
      end
      else
      // Imprime somente AP' em atraso com "n" dias de antecedência à data programada
      // O processo de filtragem dos registros está no método ExibeApsAtrasoxDataProg
      if CmpRptCM.ParamValues[8].AsBoolean then
         SQL.Add('  AND (LT.IDPROCESSO        = RAD.IDPROCESSO)                     ' )
      else
      // Fim - Rodolpho da Silva - P:22084 - 23/11/2006

      // Se o filtro de situação do processo RAD for informado, listar apenas os
      //documentos que possuam RAD
      if CmpRptCM.ParamValues[13].AsInteger <> 0 then
         SQL.Add('  AND (LT.IDPROCESSO    = RAD.IDPROCESSO)                         ' )
      else
         SQL.Add('  AND (LT.IDPROCESSO    = RAD.IDPROCESSO(+))                      ' ) ;

      //Marcus Oliveira 15/06/2007 Feito pra fazer o join quando passa o lote
      IF CmpRptCM.ParamValues[5].AsInteger <> 0 then
         SQL.Add('  AND (LTP.IDPROCESSO(+)   = LT.IDPROCESSO )                      ' ) ;


      //David - 26/10/07 - Corrigindo o problema de somar os valores de todos os documentos
      SQL.Add(' AND VBrutoEngl.CODDOCUMENTO = LT.CODDOCUMENTO ' ) ;

      Open;
    end;

    // Insere o número das AP's caso não tenha sido informada
    //na tela de Documento/Registra
    InsereNumApGr;

    // Este método, exclui os registros que não atenderem as
    //condições especificadas pelos parâmetros de "n" dias de atraso
    if CmpRptCM.ParamValues[8].AsBoolean then
       ExibeApsAtrasoxDataProg(CmpRptCM.ParamValues[9].AsInteger);


    // Abre a qry de rateio
    CdsRateio.Close;
    SqlRateio.Prepare;
    SqlRateio.SQL.Clear;
    SqlRateio.SQL.Add('SELECT');

    //Marcus Oliveira P. 25542 - 13/06/2007

    SQLRATEIO.SQL.ADD('      DOCUMENTOS.CODDOCUMENTO, ATV.NOME AS ATIVPROJ, ');
    SQLRATEIO.SQL.ADD('      DECODE(TRIM(CC.CODEXTERNO),'''','''',TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME) AS CENTCUSTO, ');
    SQLRATEIO.SQL.ADD('      DECODE(TRIM(CR.CODEXTERNO),'''','''',TRIM(CR.CODEXTERNO) || '' - '' || CR.NOME) AS CENTRESP, ');
    SqlRateio.SQL.Add('      DECODE(TRIM(TRD.CODTIPRECDES),'''','''',TRIM(TRD.CODTIPRECDES) || '' - '' || TRD.DESCRICAO) AS TIPORECDES, ');
    SqlRateio.SQL.Add('      PRG.DESCPROGRAMA, ');
    SqlRateio.SQL.Add('      PL.NOME AS PLANO, ');
    SqlRateio.SQL.Add('      PT.NOME AS PATRO, ');
    SQLRATEIO.SQL.ADD('      DOCUMENTOS.VALOR ');

    SqlRateio.SQL.Add('FROM');

    SQLRATEIO.SQL.ADD(' (SELECT ');
    SQLRATEIO.SQL.ADD('     D.CODDOCUMENTO, ');
    SQLRATEIO.SQL.ADD('     R.UNIDNEGOC, ');
    SQLRATEIO.SQL.ADD('     R.CODCENTROCUSTO, ');
    SQLRATEIO.SQL.ADD('     R.CODCENTRORESPON, ');
    SQLRATEIO.SQL.ADD('     R.CODTIPRECDES, ');
    SQLRATEIO.SQL.ADD('     R.RECPAG, ');
    SQLRATEIO.SQL.ADD('     R.IDPROGRAMA, ');
    SQLRATEIO.SQL.ADD('     R.IDPLANOPREV, ');
    SQLRATEIO.SQL.ADD('     R.IDPATRO, ');
    SQLRATEIO.SQL.ADD('     D.DATAEMISSAO, ');
    SQLRATEIO.SQL.ADD('     D.DATAVENCTO, D.DATAPROGRAMADA, ');
    SQLRATEIO.SQL.ADD('     R.VALOR, ');
    SQLRATEIO.SQL.ADD('     D.IDPESSOA ');
    SQLRATEIO.SQL.ADD('  FROM DOCUMENTO D, RATEIODOCUM R ');
    SQLRATEIO.SQL.ADD('  WHERE D.CODDOCUMENTO = R.CODDOCUMENTO ');
    SQLRATEIO.SQL.ADD('  AND D.OPERACAO <> 3 ');

    //Marcus Oliveira P.25838 12/07/2007
    SQLRATEIO.SQL.ADD('  UNION ALL');

    SQLRATEIO.SQL.ADD('  SELECT ');
    SQLRATEIO.SQL.ADD('     ENGLOBADO.CODDOCUMENTO, ');
    SQLRATEIO.SQL.ADD('     R.UNIDNEGOC, ');
    SQLRATEIO.SQL.ADD('     R.CODCENTROCUSTO, ');
    SQLRATEIO.SQL.ADD('     R.CODCENTRORESPON, ');
    SQLRATEIO.SQL.ADD('     R.CODTIPRECDES, ');
    SQLRATEIO.SQL.ADD('     R.RECPAG, ');
    SQLRATEIO.SQL.ADD('     R.IDPROGRAMA, ');
    SQLRATEIO.SQL.ADD('     R.IDPLANOPREV, ');
    SQLRATEIO.SQL.ADD('     R.IDPATRO, ');
    SQLRATEIO.SQL.ADD('     ENGLOBADO.DATAEMISSAO, ');
    SQLRATEIO.SQL.ADD('     ENGLOBADO.DATAVENCTO, ');
    SQLRATEIO.SQL.ADD('     ENGLOBADO.DATAPROGRAMADA, ');
    SQLRATEIO.SQL.ADD('     R.VALOR, ');
    SQLRATEIO.SQL.ADD('     D.IDPESSOA ');
    SQLRATEIO.SQL.ADD('  FROM DOCUMENTO D, RATEIODOCUM R, ');
    SQLRATEIO.SQL.ADD('   (SELECT CODDOCUMENTO, NUMFATURA, DATAEMISSAO, DATAVENCTO, DATAPROGRAMADA ');
    SQLRATEIO.SQL.ADD('    FROM DOCUMENTO ');
    SQLRATEIO.SQL.ADD('    WHERE OPERACAO = 3) ENGLOBADO ');
    SQLRATEIO.SQL.ADD('  WHERE D.CODDOCUMENTO = R.CODDOCUMENTO ');
    SQLRATEIO.SQL.ADD('  AND D.NUMFATURA = ENGLOBADO.NUMFATURA ');

    SQLRATEIO.SQL.ADD('  ) DOCUMENTOS, ');

    SQLRATEIO.SQL.ADD('     UNIDNEGOCIO ATV, ');
    SqlRateio.SQL.Add('     CENTRESPON CR, ');
    SqlRateio.SQL.Add('     CENTCUST CC, ');
    SqlRateio.SQL.Add('     TIPORECEBDESEMB TRD, ');
    SqlRateio.SQL.Add('     PROGRAMA PRG, ');
    SqlRateio.SQL.Add('     PLANPREVCONTABIL PL, ');
    SqlRateio.SQL.Add('     PESSOA PT ');

    //Rodolpho 03/04/2007
    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
       SqlRateio.SQL.Add('   , LOTEXDOCUM LXD ');

    SqlRateio.SQL.Add('WHERE');

    //Marcus Oliveira P. 25542 - 13/06/2007 Foi necessário adicionar numfatura para trazer os doc. englobados
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.UNIDNEGOC       = ATV.UNIDNEGOC(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPESSOA       = ATV.IDPESSOA(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPESSOA  = CC.IDEMPRESA(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPESSOA = CR.IDPESSOA(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.CODTIPRECDES    = TRD.CODTIPRECDES) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPESSOA    = TRD.IDPESSOA) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.RECPAG    = TRD.RECPAG) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.RECPAG        = ' + QuotedStr( ParamIntegra.RecPag ) + ') AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPROGRAMA      = PRG.IDPROGRAMA(+)) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPLANOPREV     = PL.IDPLANOPREV) AND ');
    SQLRATEIO.SQL.ADD('   (DOCUMENTOS.IDPATRO         = PT.IDPESSOA) ');


    if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
    begin
       // Rodolpho da Silva - P: 23834 - 01/12/2006
       if not cdsPrincipal.IsEmpty then
          SqlRateio.SQL.Add('   AND ( DOCUMENTOS.CODDOCUMENTO = '+ CmpRptCM.ParamValues[0].AsString +' ) ' )
       else
          SqlRateio.SQL.Add('   AND ( DOCUMENTOS.CODDOCUMENTO = -1)' );
    end
    else

    // Data inicial
    If (trim(CmpRptCM.ParamValues[10].AsString) <> '') Then
    begin
       case CmpRptCM.ParamValues[12].AsInteger of
          0: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAEMISSAO    >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
          1: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAVENCTO     >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
          2: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAPROGRAMADA >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
       end;
    end;
    // Data final
    If (trim(CmpRptCM.ParamValues[11].AsString) <> '') Then
    begin
       case CmpRptCM.ParamValues[12].AsInteger of
          0: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAEMISSAO    <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
          1: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAVENCTO     <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
          2: SqlRateio.SQL.Add('   AND (DOCUMENTOS.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
       end;
    end;

    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
    begin
       SqlRateio.SQL.Add('  AND (DOCUMENTOS.CODDOCUMENTO  = LXD.CODDOCUMENTO(+))') ;
       SqlRateio.SQL.Add('  AND (LXD.NUMLOTE     = ' + CmpRptCM.ParamValues[5].AsString + ')' );
    end;

    SqlRateio.Open;

    // Abre a qry de contabilidade
    CdsContab.Close;
    SqlContab.SQL.Clear;
    SqlContab.Prepare;
    SqlContab.SQL.Add('SELECT');
    SqlContab.SQL.Add('   DOCS.OPERACAO,  '); //Marcus Oliveira P.24308 03/04/2007
    SqlContab.SQL.Add('   DOCS.CODDOCUMENTO, LC.PLACONTA,LC.CODSUBCONTA,  PC.PLANOME,                   ' ) ;
    SqlContab.SQL.Add('   LC.LACDEBCRE,LC.LACVALOR,  LC.LACVALHIST,  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 ||      ' ) ;
    SqlContab.SQL.Add('   LC.LACHIST4 || LC.LACHIST5 AS HISTORICO,   LC.PLNCODIGO,  LC.PLANO,LC.LACTIPO,LC.LACNUMDOC,  ' ) ;
    SqlContab.SQL.Add('   P.PLNDATDIA                                                                                  ' ) ;

    SqlContab.SQL.Add('FROM');

        //Rodolpho 03/04/2007
    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
       SqlContab.SQL.Add('   LOTEXDOCUM LXD, ');

    SqlContab.SQL.Add('   (SELECT  ' );
    SqlContab.SQL.Add('         L.OPERACAO,   L.CODDOCUMENTO, D.DATAEMISSAO, D.DATAVENCTO, D.DATAPROGRAMADA,  ' );
    SqlContab.SQL.Add('         L.PLNCODIGO, L.PLNANTECIPA, D.PLACONTA  ' );
    SqlContab.SQL.Add('   FROM documento d,LANCTODOCUM L  ' );
    SqlContab.SQL.Add('   WHERE  ' );
    SqlContab.SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO)  ' );
    SqlContab.SQL.Add('   AND D.OPERACAO <> 3  ' );
    SqlContab.SQL.Add('   UNION  ' );
    SqlContab.SQL.Add('   SELECT  ' );
    SqlContab.SQL.Add('      L.OPERACAO,   ENGLOBADO.CODDOCUMENTO, Englobado.dataemissao,d.datavencto, d.dataprogramada,  ' );
    SqlContab.SQL.Add('      L.PLNCODIGO,    L.PLNANTECIPA, D.PLACONta  ' );
    SqlContab.SQL.Add('   FROM DOCUMENTO D, LANCTODOCUM L ,  ' );
    SqlContab.SQL.Add('   (SELECT CODDOCUMENTO, NUMFATURA, DATAEMISSao  ' );
    SqlContab.SQL.Add('   FROM DOCUMENTO  ' );
    SqlContab.SQL.Add('   WHERE OPERACAO = 3) ENGLOBADO  ' );
    SqlContab.SQL.Add('   WHERE  ' );
    SqlContab.SQL.Add('       ( D.NUMFATURA = ENGLOBADO.NUMFATURA )  ' );
    SqlContab.SQL.Add('   AND ( D.CODDOCUMENTO = L.CODDOCUMENTO )  ' );
    SqlContab.SQL.Add('   ) DOCS,  ' );
    SqlContab.SQL.Add('   PLANILHA P,    LANCAMENTO LC,    PLANOCONTA PC  ' );

    SqlContab.SQL.Add('WHERE');
    SqlContab.SQL.Add(' ((DOCS.PLNCODIGO = P.PLNCODIGO    ) OR ' );
    SqlContab.SQL.Add('  (DOCS.PLNANTECIPA = P.PLNCODIGO  ) )AND ' );
    SqlContab.SQL.Add(' (P.PLNCODIGO = LC.PLNCODIGO) AND ' );
    SqlContab.SQL.Add(' (LC.PLACONTA    = PC.PLACONTA) AND ' );
    SqlContab.SQL.Add(' (LC.PLANO = PC.PLANO) AND ' );

    //Marcus Oliveira P. 25184 29/05/2007 Inicio
    SqlContab.SQL.Add(' ((LC.CODDOCUMENTO IS NULL) OR           ');
    SqlContab.SQL.Add('  (DOCS.CODDOCUMENTO = LC.CODDOCUMENTO)) ');
    //Marcus Oliveira P. 25184 29/05/2007 Fim

    if CmpRptCM.ParamValues[6].AsBoolean then
    begin
       if  Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
       begin
         // Rodolpho da Silva - P: 23834 - 01/12/2006
         if not cdsPrincipal.IsEmpty then
            SqlContab.SQL.Add('   AND ( DOCS.CODDOCUMENTO = '+ CmpRptCM.ParamValues[0].AsString + ')' )
         else
            SqlContab.SQL.Add('   AND ( DOCS.CODDOCUMENTO = -1)');

       end;

       // Data inicial
       If (trim(CmpRptCM.ParamValues[10].AsString) <> '') Then
       begin
          case CmpRptCM.ParamValues[12].AsInteger of
             0: SqlContab.SQL.Add('   AND (DOCS.DATAEMISSAO    >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
             1: SqlContab.SQL.Add('   AND (DOCS.DATAVENCTO     >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
             2: SqlContab.SQL.Add('   AND (DOCS.DATAPROGRAMADA >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
          end;
       end;
       // Data final
       If (trim(CmpRptCM.ParamValues[11].AsString) <> '') Then
       begin
          case CmpRptCM.ParamValues[12].AsInteger of
             0: SqlContab.SQL.Add('   AND (DOCS.DATAEMISSAO    <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
             1: SqlContab.SQL.Add('   AND (DOCS.DATAVENCTO     <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
             2: SqlContab.SQL.Add('   AND (DOCS.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
          end;
       end;

       if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
       begin
          SqlContab.SQL.Add('   AND (DOCS.CODDOCUMENTO = LXD.CODDOCUMENTO(+))');
          SqlContab.SQL.Add('   AND (LXD.NUMLOTE = ' + CmpRptCM.ParamValues[5].AsString + ')');
       end;

       SqlContab.SQL.Add('   ORDER BY     ' );
       SqlContab.SQL.Add('   P.PLNCODIGO  ' );
    end
    else
       SqlContab.SQL.Add(' AND 1 = 2');

    SqlContab.Open;



    // Abre a qry de alteradores
    CdsAlterador.Close;
    SqlAlterador.SQL.Clear;
    SqlAlterador.SQL.Add('SELECT');

   SqlAlterador.SQL.Add('DOCS.HISTORICOCOMPL, A.DESCRICAO,    ');
   SqlAlterador.SQL.Add('DOCS.CODDOCUMENTO, A.DESCRICAO, DOCS.VALOR,          ');
   SqlAlterador.SQL.Add('DOCS.DEBCRE,   DOCS.VLRLIQUIDO,    A.CODALTERADOR,   ');
   SqlAlterador.SQL.Add('A.FLGINCIDEIRRF,    A.FLGINCIDEIRRF                  ');

   SqlAlterador.SQL.Add('FROM');

  SqlAlterador.SQL.Add(' (SELECT ');
  SqlAlterador.SQL.Add('   D.CODDOCUMENTO,    LC.VALOR, LC.CODALTERADOR, LC.OPERACAO, ');
  SqlAlterador.SQL.Add('   LC.HISTORICOCOMPL,    LC.DEBCRE,    LC.VLRLIQUIDO, D.DATAEMISSAO,D.DATAVENCTO, D.DATAPROGRAMADA ');
  SqlAlterador.SQL.Add('   FROM DOCUMENTO D, LANCTODOCUM LC ');
  SqlAlterador.SQL.Add('   WHERE ');
  SqlAlterador.SQL.Add('       (D.CODDOCUMENTO = LC.CODDOCUMENTO) ');
  SqlAlterador.SQL.Add('   AND (LC.OPERACAO = 4 ) ');

  SqlAlterador.SQL.Add('   UNION ');
  SqlAlterador.SQL.Add('   SELECT ');
  SqlAlterador.SQL.Add('     ENGLOBADO.CODDOCUMENTO,    LC.VALOR, LC.CODALTERADOR, LC.OPERACAO, ');
  SqlAlterador.SQL.Add('     LC.HISTORICOCOMPL,    LC.DEBCRE,    LC.VLRLIQUIDO, ENGLOBADO.DATAEMISSAO, ');
  SqlAlterador.SQL.Add('     ENGLOBADO.DATAVENCTO, ENGLOBADO.DATAPROGRAMADA ');
  SqlAlterador.SQL.Add('   FROM DOCUMENTO D, LANCTODOCUM LC, ');
  SqlAlterador.SQL.Add('   (SELECT CODDOCUMENTO, NUMFATURA, DATAEMISSAO, DATAVENCTO, DATAPROGRAMADA ');
  SqlAlterador.SQL.Add('   FROM DOCUMENTO ');
  SqlAlterador.SQL.Add('   WHERE OPERACAO = 3 ');
  SqlAlterador.SQL.Add('   ) ENGLOBADO ');
  SqlAlterador.SQL.Add(' WHERE         ');
  SqlAlterador.SQL.Add('     ( D.CODDOCUMENTO = LC.CODDOCUMENTO ) ');
  SqlAlterador.SQL.Add(' AND ( D.NUMFATURA = ENGLOBADO.NUMFATURA ) ');
  SqlAlterador.SQL.Add(' AND ( LC.OPERACAO = 4 ) ');
  SqlAlterador.SQL.Add(' ) DOCS, ');
  SqlAlterador.SQL.Add('   TIPOALTERADOR A ');

    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
       SqlAlterador.SQL.Add('   , LOTEXDOCUM LXD ');

    SqlAlterador.SQL.Add('WHERE');

    SqlAlterador.SQL.Add('  (DOCS.CODALTERADOR = A.CODALTERADOR)    ');

    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
    begin
       SqlAlterador.SQL.Add('  AND (LXD.NUMLOTE = ' + CmpRptCM.ParamValues[5].AsString + ')  ');
       SqlAlterador.SQL.Add('  AND (DOCS.CODDOCUMENTO  = LXD.CODDOCUMENTO) ');
    end;

    //Marcus Oliveira P. 25542 - 13/06/2007 Inicio
    if  Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
    begin
      // Rodolpho da Silva - P: 23834 - 01/12/2006
      if not cdsPrincipal.IsEmpty then
         SqlAlterador.SQL.Add('   AND ( DOCS.CODDOCUMENTO = '+ CmpRptCM.ParamValues[0].AsString +' ) ' )

      else
         SqlAlterador.SQL.Add('   AND ( DOCS.CODDOCUMENTO = -1)' );
    end;
   //Marcus Oliveira P. 25542 - 13/06/2007 Fim

    // Data inicial
    If (trim(CmpRptCM.ParamValues[10].AsString) <> '') Then
    begin
       case CmpRptCM.ParamValues[12].AsInteger of
          0: SqlAlterador.SQL.Add('   AND (DOCS.DATAEMISSAO    >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
          1: SqlAlterador.SQL.Add('   AND (DOCS.DATAVENCTO     >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
          2: SqlAlterador.SQL.Add('   AND (DOCS.DATAPROGRAMADA >= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ',''DD/MM/YYYY''))  ');
       end;
    end;
    // Data final
    If (trim(CmpRptCM.ParamValues[11].AsString) <> '') Then
    begin
       case CmpRptCM.ParamValues[12].AsInteger of
          0: SqlAlterador.SQL.Add('   AND (DOCS.DATAEMISSAO    <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
          1: SqlAlterador.SQL.Add('   AND (DOCS.DATAVENCTO     <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
          2: SqlAlterador.SQL.Add('   AND (DOCS.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[11].AsString) + ',''DD/MM/YYYY''))  ');
       end;
    end;

    if Trim(CmpRptCM.ParamValues[5].AsString) <> '0' then
     SqlAlterador.SQL.Add('   AND (LXD.NUMLOTE = ' + CmpRptCM.ParamValues[5].AsString + ')');

    SqlAlterador.Open;


    cdsPrincipal.First;
    while not cdsPrincipal.Eof do
    begin
        SetLength(aiIdProcessos,Length(aiIdProcessos) + 1);
        aiIdProcessos[(CdsPrincipal.RecNo - 1)] := StrToIntDef(CdsPrincipal.FieldByName('IDPROCESSO').AsString,-1);
        cdsPrincipal.Next;
    end;

    if Length(aiIdProcessos) = 0   then
    begin
       SetLength(aiIdProcessos,1);
       aiIdProcessos[0] := -1;
    end;

    // Abre a qry do RAD
    CdsRAD.Data := CtrlRadPlus.EtapasValidasDeProcessos(aiIdProcessos);

end;








procedure TRptApGr4.SubRptRADPrint(Sender: TObject);
var
  sIdProcesso: string;

begin
  inherited;
  if not CdsPrincipal.IsEmpty then
  begin
     // Rodolpho da Silva - P: 23831 - 01/12/2006
     cdsRAD.Filtered := False;
     if not CdsRAD.IsEmpty then
     begin
        sIdProcesso := cdsPrincipal.FieldByName('IDPROCESSO').AsString;
        if Trim(sIdProcesso) = '' then
           sIdProcesso := '-1';

        cdsRAD.Filter   := 'IDPROCESSO = ' + sIdProcesso;
        cdsRAD.Filtered := true;
     end;
  end
  else
  if not cdsRAD.IsEmpty then
     cdsRAD.EmptyDataSet; 
end;




procedure TRptApGr4.InsereNumApGr;
var
  iNumApGr: integer;
  sCodDocumentoAnterior: string;
begin
    iNumApGr := 0;

    cdsPrincipal.First;
    while not cdsPrincipal.Eof do
    begin
       if sCodDocumentoAnterior <> cdsPrincipal.FieldByName('CODDOCUMENTO').AsString then
       begin
          if cdsPrincipal.FieldByName('NUMAPGR').IsNull then
          begin
             if not CtrlRelatoriosCAPCAR.SetSEQAPGR(cdsPrincipal.FieldByName('CODDOCUMENTO').AsInteger,
                                                    cdsPrincipal.FieldByName('NUMFATURA').AsString,
                                                    iNumApGr) then
             begin
                MsgDlg('Não foi possível imprimir a Autorização de Pagamento.' + #13 +
                       'Motivo: ' + CtrlRelatoriosCAPCAR.MessageInfo,'Erro',mtError,[mbOk],0);
                Abort;
             end;
             cdsPrincipal.Edit;
             cdsPrincipal.FieldByName('NUMAPGR').AsInteger := iNumApGr;
             cdsPrincipal.Post;
          end;
       end;

       sCodDocumentoAnterior := cdsPrincipal.FieldByName('CODDOCUMENTO').AsString;
       cdsPrincipal.Next;
    end;
end;




procedure TRptApGr4.ExibeApsAtrasoxDataProg(iDias: integer);
var
   dDataProgramada: TDateTime;
   i: integer;

 begin
   CdsPrincipal.First;
   while not CdsPrincipal.Eof do
   begin
      with TDiasUteis.Create do
      try
         InitializeAs(Padroes);
         // Extrai a data programada
         dDataProgramada := CdsPrincipal.FieldByName('DATAPROGRAMADA').AsDateTime;

         // Percorre o número de dias a serem descontados
         for i:= 1 to iDias do
         begin
            // Se o dia em foco não for um dia útil, decrementa a data até
            //que se encontre o primeiro dia útil anterior
            while not DiaUtil(Sistema.IdEmpresa,dDataProgramada,true,false,false) do
               dDataProgramada := dDataProgramada - 1;

            // Decrementa a data (dia útil), com referência ao número de dias a
            //serem descontados
            dDataProgramada := dDataProgramada - 1;
         end;

      finally
         Free;
      end;

      // Se não atender a condição, excluir o registro do Cds para que
      //apenas sejam exibidos os RAD's com atraso x dataprogramada
      if ( CdsPrincipal.FieldByName('DATAFIMPROCESSO').AsDateTime <= dDataProgramada ) then
         CdsPrincipal.Delete
      else
         CdsPrincipal.Next;
   end;
end;

//MArcus Oliveira P. 24861 30/03/2007 Mascara
procedure TRptApGr4.dbCPFCNPJPrint(Sender: TObject);
begin
  inherited;
  if cdsPrincipal.FieldByName('TIPO').AsString = 'F' then
  begin
     dbCPFCNPJ.DisplayFormat := '999.999.999-99;0;';
     lblCPFCNPJ.Caption := 'CPF:';
  end
  else if cdsPrincipal.FieldByName('TIPO').AsString = 'J' then
  begin
     dbCPFCNPJ.DisplayFormat := '99.999.999/9999-99;0;';
     lblCPFCNPJ.Caption := 'CNPJ:';
  end

end;

procedure TRptApGr4.lblDocumentoPrint(Sender: TObject);
begin
  inherited;
  if Trim( cdsPrincipal.FieldByName('NUMFATURA').AsString ) = '' then
     lblDocumento.Visible := False
     else
     begin
     lblDocumento.Visible := True;
     lblDocumento.Caption := 'Documento Englobado/Parcelado';
     end;
end;

end.
