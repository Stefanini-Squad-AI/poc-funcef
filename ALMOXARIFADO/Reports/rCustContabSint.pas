//inicio andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rCustContabSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc, uSistema, TXRB;

type
  TRptCustContabSint = class(TFrmCmReport)
    dsCustContabSint: TwwDataSource;
    bdeCustContabSint: TppBDEPipeline;
    bdeCustContabSintppField1: TppField;
    bdeCustContabSintppField2: TppField;
    bdeCustContabSintppField3: TppField;
    bdeCustContabSintppField4: TppField;
    bdeCustContabSintppField5: TppField;
    bdeCustContabSintppField6: TppField;
    bdeCustContabSintppField7: TppField;
    bdeCustContabSintppField8: TppField;
    RptCustContabSint: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppLabel118: TppLabel;
    ppLine47: TppLine;
    LblEmpresa: TppLabel;
    ppLine50: TppLine;
    LbGrupo: TppLabel;
    LbCentCust3: TppLabel;
    ppLabel127: TppLabel;
    lbPer14: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppFooterBand22: TppFooterBand;
    ppLine53: TppLine;
    LblSistema: TppLabel;
    ppCalc42: TppSystemVariable;
    ppCalc43: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText51: TppDBText;
    ppLabel134: TppLabel;
    ppDBText52: TppDBText;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLine56: TppLine;
    ppGroup8: TppGroup;
    CabecCustContabSint: TppGroupHeaderBand;
    ppDBText53: TppDBText;
    ppLabel137: TppLabel;
    ppLine57: TppLine;
    RodapeCustContabSint: TppGroupFooterBand;
    ppLabel138: TppLabel;
    ppDBText54: TppDBText;
    ppDBCalc14: TppDBCalc;
    ppLabel139: TppLabel;
    RptCustContabSintGroup1: TppGroup;
    RptCustContabSintGroupHeaderBand1: TppGroupHeaderBand;
    RptCustContabSintGroupFooterBand1: TppGroupFooterBand;
    ppDBText40: TppDBText;
    ppDBText49: TppDBText;
    ppDBText44: TppDBText;
    RptCustContabSintDBCalc1: TppDBCalc;
    SqlCustContabSint: TCMSqlParams;
    CdsCustContabSint: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CriaCampo( sNome: String; ft: TFieldType; itam: Integer = 0 );
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCustContabSint: TRptCustContabSint;

implementation

uses fAguarde, uModulo, uFuncaoGeral, uCtrlParamIntegra;

{$R *.DFM}

procedure TRptCustContabSint.CriaCampo( sNome: String; ft: TFieldType; itam: Integer = 0 );
begin
  With CdsCustContabSint.FieldDefs.AddFieldDef Do Begin
       Name := sNome;
       DataType := ft;

       If ft in [ ftString, ftFixedChar, ftWideString ] Then
          Size := iTam;
  End;
end;

procedure TRptCustContabSint.CrmRptCMBeforePrint(Sender: TObject);
Var
  iUnidNegoc, x: LongInt;
  sContaEnt, sContaSai, sObr, sNome, sSub: String;
begin
  inherited;
  With SqlAux Do Begin
       Sql.Clear;
       Sql.Add( 'SELECT G.CODGRUPOPROD, ' +
                       'G.DESCGRUPOPROD, ' +
                       'C.NOME, ' +
                       'M.CODARTIGO, ' );

       If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add( 'M.DATAMOV, ' )
       Else
          Sql.Add( 'TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'') AS DATAMOV, ' );

       Sql.Add( 'M.CODCENTROCUSTO, ' +
                'SUM( round(M.VALORMOV, 2) ) AS VALORMOV ' +
                'FROM MOVIMENT M, ' +
                     'ALMOX A, ' +
                     'PRODUTO P, ' +
                     'ARTIGO AR, ' +
                     'ALMOX T, ' +
                     'GRUPPROD G, ' +
                     'CENTCUST C ' +
               'WHERE ( M.CODTIPOMOV <> ''A'' ) ' +
                 'AND ( M.CODTIPOMOV <> ''K'' ) ' +
                 'AND ( M.CODTIPOMOV <> ''Z'' ) ' );

       If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then
          Sql.Add( 'AND ( M.FLGENTRADACUSTO <> ''S'' ) ' );

       Sql.Add( 'AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) +
                       ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ' +
                'AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' +
                'AND ( A.CONTABIL = ''T'' ) ' +
                'AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ' +
                'AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ' +
                'AND ( ( M.CODALMOXTRANSF IS NULL ) OR ' +
                      '( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ' +
                        '( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ' +
                'AND ( M.CODARTIGO = AR.CODARTIGO ) ' +
                'AND ( AR.CODPRODUTO = P.CODPRODUTO ) ' +
                'AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ' +
                'AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) ' +
                'AND ( M.IDEMPRESA = C.IDEMPRESA ) ' +
              'GROUP BY G.CODGRUPOPROD, ' +
                       'G.DESCGRUPOPROD, ' +
                       'C.NOME, ' +
                       'M.CODARTIGO, ' );

       If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add( 'M.DATAMOV, ' );

       Sql.Add( 'M.CODCENTROCUSTO ' );

       // Ajusta o LayOut do Relatorio para o Resumido
       If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then Begin
          Sql.Add( 'ORDER BY M.DATAMOV' );
          CabecCustContabSint.Visible  := True;
          RodapeCustContabSint.Visible := True;
          LbCentCust3.Visible          := True;
          LbGrupo.Caption              := 'GRUPO';
       End Else Begin
          CabecCustContabSint.Visible  := False;
          RodapeCustContabSint.Visible := False;
          LbCentCust3.Visible          := False;
          LbGrupo.Caption              := 'CENTRO DE CUSTO';
       End;

       Open;
  End;

  With CdsCustContabSint Do Begin
       CriaCampo( 'CONTA',          ftString, 18 );
       CriaCampo( 'CONTANOME',      ftString, 40 );
       CriaCampo( 'DATA',           ftDate );
       CriaCampo( 'CODCENTROCUSTO', ftString, 10 );
       CriaCampo( 'CODARTIGO',      ftString, 14 );
       CriaCampo( 'DESCARTIGO',     ftString, 30 );
       CriaCampo( 'VALOR',          ftFloat );
       CreateDataSet;

       FrmAguarde.Min := 0;
       FrmAguarde.Pos := 0;
       FrmAguarde.Max := CdsAux.RecordCount;
       FrmAguarde.Mostra('Processando Informações');
       CdsAux.First;
       x := 0;

       lbPer14.Caption := 'De ' + CmpRptCM.ParamValues[0].AsString + ' a '+ CmpRptCM.ParamValues[1].AsString;

       While Not CdsAux.Eof Do Begin
             Modulo.LeContaContabil( CdsAux.FieldByName( 'CODARTIGO' ).AsString,
                                     CdsAux.FieldByName( 'CODCENTROCUSTO' ).AsString,
                                     sContaEnt, sContaSai, iUnidNegoc );
             Append;

             If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then Begin
                FieldByName( 'CONTA' ).asString := sContaEnt;
                FuncaoGeral.TestaContaCC( true, ParamIntegra.Plano, sContaEnt, sObr, sNome, sSub );
             End Else Begin
                FieldByName( 'CONTA' ).asString := sContaSai;
                FuncaoGeral.TestaContaCC( true, ParamIntegra.Plano, sContaSai, sObr, sNome, sSub );
             End;

             FieldByName( 'CONTANOME' ).asString := sNome;
             FieldByName( 'DATA' ).asString := CdsAux.FieldByName( 'DATAMOV' ).asString;
             FieldByName( 'VALOR' ).asFloat := CdsAux.FieldByName( 'VALORMOV' ).asFloat * -1;

             If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then Begin
                FieldByName( 'CODCENTROCUSTO' ).asString := CdsAux.FieldByName( 'CODCENTROCUSTO' ).asString;
                FieldByName( 'CODARTIGO' ).asString      := CdsAux.FieldByName( 'CODGRUPOPROD' ).asString;
                FieldByName( 'DESCARTIGO' ).asString     := CdsAux.FieldByName( 'DESCGRUPOPROD' ).asString;
             End Else Begin
                FieldByName( 'CODCENTROCUSTO' ).asString := '';
                FieldByName( 'CODARTIGO' ).asString      := CdsAux.FieldByName( 'CODCENTROCUSTO' ).asString;
                FieldByName( 'DESCARTIGO' ).asString     := CdsAux.FieldByName( 'NOME' ).asString;
             End;

             Post;
             CdsAux.Next;
             Inc( x );
             FrmAguarde.Pos := x;
             Application.ProcessMessages;
       End;

       CdsAux.Close;
       AddIndex( 'Idx1', 'CONTA;DATA;CODARTIGO;CODCENTROCUSTO', [], '' );
       IndexName := 'Idx1';
       First;
       FrmAguarde.Apaga;
  End;
end;

procedure TRptCustContabSint.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date - 1 );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date - 1 );

  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Mascara := ParamIntegra.MascaraPlano;
  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Plano   := ParamIntegra.Plano;
end;

end.
