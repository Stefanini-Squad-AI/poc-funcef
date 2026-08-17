{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
Data      : 12/03/2018
Autor     : Everson Luiz Pereira da Cunha
SIG       : SIG TIBERO
Descrição : Melhoria em adequação ao TIBERO.
            Inserir alias nas tabelas e campos.
            Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------
Rotina    : -
Data      : 09/07/2003
Pendência : 14321 e 14322
Autor     : André Pontes
Descrição : Exibição de label "Não há lançamentos em aberto para o período indicado"
            Alteração da propriedade do DataPipeline que permite impressão do
            relatório mesmo sem retorno de dados na query
--------------------------------------------------------------------------------}

Unit rDocAbertos;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass,
  ppCtrls, ppVar, ppMemo, ppStrtch, ppRegion, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCtrlParamIntegra, uCmSqlParams, DBClient,
  uCMClientDataSet, CMProcuraSubTipo, TXRB;

Type
  TRptDocAbertos = Class(TFrmCmReport)
    DsDocAbertos: TwwDataSource;
    PpDocAbertos: TppBDEPipeline;
    RptDocAbertos: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLine44: TppLine;
    ppLabel87: TppLabel;
    LblDocAberto: TppLabel;
    ppLabelCliFor: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel99: TppLabel;
    RptDocAbertosLabel2: TppLabel;
    ppLabel94: TppLabel;
    LblTipoCobranca: TppLabel;
    RptDocAbertosRegion1: TppRegion;
    RptDocAbertosMemo1: TppMemo;
    ppDetailBand24: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText26: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    RptDocAbertosDBText2: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppLabel100: TppLabel;
    ppLine46: TppLine;
    ppCalc41: TppSystemVariable;
    ppCalc42: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabel101: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    RptDocAbertosDBText1: TppDBText;
    RptDocAbertosLabel1: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    RptDocAbertosLabel3: TppLabel;
    RptDocAbertosDBCalc1: TppDBCalc;
    RptDocAbertosLine1: TppLine;
    CdsDocAbertos: TCMClientDataSet;
    SqlDocAbertos: TCMSqlParams;
    PpDocAbertosppField9: TppField;
    ppLabel1: TppLabel;
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    procedure ppLabel1Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptDocAbertos: TRptDocAbertos;

Implementation

{$R *.DFM}

Procedure TRptDocAbertos.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  x: String;
Begin
  Inherited;
  CmpRptCM.ParamValues[2].LookupSettings.SQL.text :=
    'SELECT CODPORTFORMA,DESCRICAO FROM PORTADORFORMA WHERE ' + #13 +
    '     IDPESSOA = ' + Floattostr(CrmRptCM.IdEmpresa) +
    ' AND RECPAG = ''' + ParamIntegra.RecPag + '''' + ' ORDER BY DESCRICAO';

  x := 'SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '
    + #13 +
    '  WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' + #13 +
    ' and not exists (select 1 from UsuarioxTpdocto b ' + #13 +
    '  where b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= '''
    + ParamIntegra.RecPag + '''' + ') ' + #13 +
    ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, FLGDOCFISCAL   ' + #13
    +
    '  FROM TIPODOCRECPAG a                               ' + #13 +
    ' WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' +
    ' and  exists                   ' + #13 +
    ' (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc  ' + #13 +
    ' and b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= ''' +
    ParamIntegra.RecPag + '''' + ')  ' + #13 +
    '  ORDER BY DESCRICAO  ';
  CmpRptCM.ParamValues[3].LookupSettings.SQL.text := x;
    if ParamIntegra.recpag = 'R' then
  begin
      ppLabelCliFor.Caption := 'Cliente';
     CmpRptCM.ParamValues[4].Caption := 'Cliente';
     CmpRptCM.ParamValues[4].ProcuraFCSettings.ForCli := fcCliente;
     CmpRptCM.ParamValues[4].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end
  else
  begin
      ppLabelCliFor.Caption := 'Fornecedor';
     CmpRptCM.ParamValues[4].Caption := 'Fornecedor';
     CmpRptCM.ParamValues[4].ProcuraFCSettings.ForCli := fcFornecedor;
     CmpRptCM.ParamValues[4].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end;
End;

Procedure TRptDocAbertos.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  With SqlDocAbertos Do
  Begin
    sql.clear;
//    sql.add('SELECT  /*+ RULE */ P.RAZAOSOCIAL,   ');  //Everson TIBERO
    sql.add('SELECT P.RAZAOSOCIAL,   ');  //Everson TIBERO
    sql.add('       (D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS DOC,  ');
    sql.add('        D.DATAPROGRAMADA,  ');
    sql.add('        L.DATALANCTO,   ');
    sql.add('        L.HISTORICOCOMPL,   ');
    sql.add('        DECODE(D.RECPAG,''P'',saldo.svalor,(SALDO.SVALOR*-1)) AS VALOR,      ');
    sql.add('        DECODE(D.RECPAG,''P'',saldo.svaloroutramoeda,(saldo.svaloroutramoeda*-1)) AS VALOROUTRA,   ');
    sql.add('        F.DESCRICAO AS DESCFORMARECPAG, P.NOME  ');
    sql.add('FROM    DOCUMENTO D,      ');
    sql.add('        LANCTODOCUM L,   ');
    sql.add('        PESSOA P,        ');
    sql.add('        FORMARECPAG F,    ');
    sql.add('        (SELECT  D.CODDOCUMENTO,    ');
    sql.add('                 SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) ) AS SVALOR,  ');
    sql.add('                 SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1)) AS SVALOROUTRAMOEDA  ');
    sql.add('         FROM DOCUMENTO D,LANCTODOCUM L  ');
    sql.add('         WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)    ');

    If CmpRptCM.ParamValues[4].AsInteger <> 0 Then
      sql.add('              AND (D.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[4].AsInteger) + ')');

    sql.add('         GROUP BY D.CODDOCUMENTO  ');
    sql.add('         HAVING     ');
    sql.add('           (ABS(SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1))) >= 0.01) OR ');
    sql.add('           (ABS(SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1))) >= 0.01)) SALDO ');
    sql.add('  WHERE   ((LTRIM(RTRIM(D.STATUS)) <> ''2'') OR (D.STATUS IS NULL)) AND  ');
    sql.add(' D.CODTIPDOC IN ' +
      ' (SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
      '   WHERE a.RECPAG =   ''' + ParamIntegra.RecPag + ''' and not exists ' +
      '   (select 1 from UsuarioxTpdocto b ' +
      '    where recpag = ''' + ParamIntegra.recpag + ''' and ' +
      '       b.idusuario = ' + Floattostr(CrmRptCM.IdUsuario) + ') ' +
      '    union ' +
      '       SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
      '       WHERE a.RECPAG =   ''' + ParamIntegra.RecPag + '''  and ' +
      '            exists (select 1 from UsuarioxTpdocto b ' +
      '                    where recpag = ''' + ParamIntegra.recpag + ''' and '
      +
      '                       a.codtipdoc = b.codtipdoc and ' +
      '                       b.idusuario = ' + Floattostr(CrmRptCM.IdUsuario) +
      ')) AND ');
    sql.add('        (D.RECPAG =  ''' + ParamIntegra.RecPag + ''' ) AND   ');
    sql.add('        (D.IDPESSOA = ' + Floattostr(CrmRptCM.IdEmpresa) +
      ') AND   ');
    sql.add('        (D.DATAPROGRAMADA <= :datafim ) AND    ');

    If Not CmpRptCM.ParamValues[0].IsNull Then
      sql.add('      (D.DATAPROGRAMADA >= :dataini) AND    ');

    If Not CmpRptCM.ParamValues[2].IsNull Then
      sql.add('      (D.codportforma  = ' + CmpRptCM.ParamValues[2].AsString +
        ') AND    ');

    If Not CmpRptCM.ParamValues[3].IsNull Then
      sql.add('      (D.codtipdoc  = ' + CmpRptCM.ParamValues[3].AsString +
        ') AND    ');

    sql.add('        (D.OPERACAO IN (''1'',''2'',''3'',''14'')) AND  ');
    sql.add('        (D.CODFORMA = F.CODFORMA(+)) AND     ');
    sql.add('        (D.CODDOCUMENTO = L.CODDOCUMENTO) AND   ');
    sql.add('        (D.OPERACAO = L.OPERACAO) AND     ');
    sql.add('        (L.ESTORNO IS NULL) AND      ');
    sql.add('        (D.IDFORCLI = P.IDPESSOA)  and    ');
    sql.add('        (D.CODDOCUMENTO = SALDO.CODDOCUMENTO(+))    ');
    If CmpRptCM.ParamValues[4].Asinteger <> 0 Then
      sql.add('              AND (D.IDFORCLI = ' +   IntToStr(CmpRptCM.ParamValues[4].AsInteger) + ')');

    sql.add('ORDER BY          ');
    sql.add('      D.DATAPROGRAMADA, P.RAZAOSOCIAL ');
    Prepare;
    parambyname('datafim').asdatetime := CmpRptCM.ParamValues[1].AsDateTime;

    If Not CmpRptCM.ParamValues[0].IsNull Then
      parambyname('dataini').asdatetime := CmpRptCM.ParamValues[0].AsDateTime;

    Open;

    If ParamIntegra.RecPag = 'P' Then
      LblDocAberto.caption := 'Pagamentos em Aberto '
    Else
      LblDocAberto.caption := 'Recebimentos em Aberto ';

    If Not CmpRptCM.ParamValues[0].IsNull Then
      LblDocAberto.caption := LblDocAberto.caption + ' De ' +
        CmpRptCM.ParamValues[0].AsString;
    LblDocAberto.caption := LblDocAberto.caption + ' Até ' +
      CmpRptCM.ParamValues[1].AsString;

    RptDocAbertosMemo1.lines.clear;
    If Not CmpRptCM.ParamValues[2].IsNull Then
      RptDocAbertosMemo1.lines.add('Contas/Caixas x Forma de Pag: ' +
        CmpRptCM.ParamValues[2].AsString);
    If Not CmpRptCM.ParamValues[3].IsNull Then
      RptDocAbertosMemo1.lines.add('Tipo de Documento: ' +
        CmpRptCM.ParamValues[3].AsString);
  End;
End;

Procedure TRptDocAbertos.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
  Begin
    CmpRptCM.Caption := 'Relatório de Pagamentos em Aberto';
    CmpRptCM.ParamValues[4].Caption := ' Fornecedor ';
  End
  Else
  Begin
    CmpRptCM.Caption := 'Relatório de Recebimentos em Aberto';
    CmpRptCM.ParamValues[4].Caption := ' Cliente ';
  End;
  CmpRptCM.ParamValues[1].AsString := DateToStr(Date);
End;

procedure TRptDocAbertos.ppLabel1Print(Sender: TObject);
begin
   inherited;
   ppLabel1.Visible := not(CdsDocAbertos.RecordCount > 0);
end;



end.
