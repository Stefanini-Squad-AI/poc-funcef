unit rRelatPlanoTrabalho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppBands, ppCache, Db, ppDB, ppDBPipe, ppDBBDE,
  DBClient, uCMClientDataSet, uCmSqlParams, Math, ppCtrls, ppPrnabl,
  ppStrtch, ppRichTx, ppVar, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, IdDNSResolver, TXRB;

type
  TrptRelatPlanoTrabalho = class(TFrmCmReport)
    ppPlanoTrabalho: TppReport;
    pplPlanoTrabalho: TppBDEPipeline;
    dtsPlanoTrabalho: TDataSource;
    sqlRelatPlanoTrabalho: TCMSqlParams;
    CdsRelatPlanoTrabalho: TCMClientDataSet;
    sqlPlanoTrabalho: TCMSqlParams;
    CdsPlanoTrabalho: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    CdsPlanoPrev: TCMClientDataSet;
    sqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    lblSistema: TppLabel;
    lblEmpresa: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ricUnidadeGestora: TppRichText;
    ricAtivProj: TppRichText;
    ricSubProjeto: TppRichText;
    ricPrioridade: TppRichText;
    ricObjetivo: TppRichText;
    ricNecessidade: TppRichText;
    ricBeneficio: TppRichText;
    ricConsequencia: TppRichText;
    ricPlanoTrabalho: TppRichText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ricExercicio: TppRichText;
    ppLabel7: TppLabel;
    ricCentroCusto: TppRichText;
    ricPlanoPrev: TppRichText;
    ricPatrocinadora: TppRichText;
    ricCenario: TppRichText;
    ppLine3: TppLine;
    sqlPatrocinadora: TCMSqlParams;
    cdsPatrocinadora: TCMClientDataSet;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ricDividirPor: TppRichText;
    ppLabel8: TppLabel;
    CdsSubProjeto: TCMClientDataSet;
    sqlSubProjeto: TCMSqlParams;
    IdDNSResolver1: TIdDNSResolver;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    procedure Inicializa(var pMemo: TppRichText; pTexto: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptRelatPlanoTrabalho: TrptRelatPlanoTrabalho;

implementation

Uses
  uMensErro, uSistema, uFuncoesOrcamento;

{$R *.DFM}
//************************************************
Procedure TrptRelatPlanoTrabalho.CrmRptCMBeforePrint(Sender: TObject);
Var
  FatorDeDivisao : Double;

Begin
  If ( CmpRptCM.ParamValues[ 0 ].AsString = '' ) Then Begin

    MsgDlg( 'É necessário informar o exercício', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else
  try
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 2 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatPlanoTrabalho( 'Abrindo - Centro de Custo' );
      CdsCentroCusto.Close;
      sqlCentroCusto.Prepare;
      sqlCentroCusto.ParamByName( 'IDCENTRO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 2 ].AsString ) );
      sqlCentroCusto.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 5 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatPlanoTrabalho( 'Abrindo - Plano Previdenciário' );
      CdsPlanoPrev.Close;
      sqlPlanoPrev.Prepare;
      sqlPlanoPrev.ParamByName( 'IDPLANO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 5 ].AsString ) );
      sqlPlanoPrev.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 6 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatPlanoTrabalho( 'Abrindo - Patrocinadora' );
      CdsPatrocinadora.Close;
      sqlPatrocinadora.Prepare;
      sqlPatrocinadora.ParamByName( 'IDPESSOA' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 6 ].AsString ) );
      sqlPatrocinadora.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 7 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO
      MostraStatusRelatPlanoTrabalho( 'Abrindo - Cenário - Valores' );
      CdsCenario.Close;
      sqlCenario.Prepare;
      sqlCenario.ParamByName( 'IDCENARIO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 7 ].AsString ) );
      sqlCenario.Open;
    End;

    FatorDeDivisao := Power( 10, StrToInt( CmpRptCM.ParamValues[ 8 ].AsString ) );
    MostraStatusRelatPlanoTrabalho( 'Abrindo - Relatório' );

    CdsRelatPlanoTrabalho.Close;
    sqlRelatPlanoTrabalho.SQL.Clear;
    sqlRelatPlanoTrabalho.SQL.Add( 'SELECT' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PT.IDPLANOTRABALHO,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GO.CODGRUPOORC,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GO.NOMEGRUPOORCAMEN,' );

    If ( CmpRptCM.ParamValues[ 7 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO

      sqlRelatPlanoTrabalho.SQL.Add( '  ROUND( SUM( SO.VLRORCCENARIO ), 2 ) / ' + FloatToStr( FatorDeDivisao ) + ' VLRORCADO,' );
      sqlRelatPlanoTrabalho.SQL.Add( '  0 VLRREALIZADO' );
    End Else Begin

      sqlRelatPlanoTrabalho.SQL.Add( '  ROUND( SUM( SO.VLRORCADO ), 2 ) / ' + FloatToStr( FatorDeDivisao ) + ' VLRORCADO,' );
      sqlRelatPlanoTrabalho.SQL.Add( '  ROUND( SUM( SO.VLRREALIZADO ), 2 ) / ' + FloatToStr( FatorDeDivisao ) + ' VLRREALIZADO' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( 'FROM' );

    If ( CmpRptCM.ParamValues[ 7 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO
      sqlRelatPlanoTrabalho.SQL.Add( '  VALORESCENARIO   SO,' );
    End Else Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  SALDOORCADO      SO,' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( '  CONTASORCAMEN    CO,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GRUPOORCAMEN     GO,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PLANOTRABALHOORC PT' );
    sqlRelatPlanoTrabalho.SQL.Add( 'WHERE' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PT.IDPESSOA         = ' + IntToStr( Sistema.IdEmpresa ) + ' AND' );

    If ( CmpRptCM.ParamValues[ 1 ].AsString <> '-2' ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  PT.IDPLANOTRABALHO  = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' AND' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( '  PT.EXERCICIOINI    <= ' + CmpRptCM.ParamValues[ 0 ].AsString + ' AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PT.EXERCICIOFIM    >= ' + CmpRptCM.ParamValues[ 0 ].AsString + ' AND' );

    If ( CmpRptCM.ParamValues[ 4 ].AsString <> '-2' ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  PT.UNIDNEGOC        = ' + CmpRptCM.ParamValues[ 4 ].AsString + ' AND' );
    End;

    If ( CmpRptCM.ParamValues[ 3 ].AsString <> '-2' ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  PT.CODCENTRORESPON  = ' + CmpRptCM.ParamValues[ 3 ].AsString + ' AND' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( '  CO.IDPESSOA         = PT.IDPESSOA     AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  CO.UNIDNEGOC        = PT.UNIDNEGOC    AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  CO.CODCENTRORESPON  = PT.CODCENTRORESPON AND' );

    If ( CmpRptCM.ParamValues[ 2 ].AsString <> '-2' ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  CO.CODCENTROCUSTO   = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' AND' );
    End;

    If ( CmpRptCM.ParamValues[ 5 ].AsString <> '-2'  ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  CO.IDPLANOPREV      = ' + CmpRptCM.ParamValues[ 5 ].AsString + ' AND' );
    End;

    If ( CmpRptCM.ParamValues[ 6 ].AsString <> '-2'  ) Then Begin
      sqlRelatPlanoTrabalho.SQL.Add( '  CO.IDPATRO          = ' + CmpRptCM.ParamValues[ 6 ].AsString + ' AND' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( '  SO.IDPLANOORCAMEN   = CO.IDPLANOORCAMEN AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  SO.IDCONTAORCAMEN   = CO.IDCONTAORCAMEN AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  SO.EXERCICIO       >= PT.EXERCICIOINI   AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  SO.PERIODO         >= PT.PERIODOINI     AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  SO.EXERCICIO       <= PT.EXERCICIOFIM   AND' );
    sqlRelatPlanoTrabalho.SQL.Add( '  SO.PERIODO         <= PT.PERIODOFIM     AND' );

    If ( CmpRptCM.ParamValues[ 7 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO
      sqlRelatPlanoTrabalho.SQL.Add( '  SO.IDCENARIOORCAMEN = ' + CmpRptCM.ParamValues[ 7 ].AsString + ' AND' );
    End;

    sqlRelatPlanoTrabalho.SQL.Add( '  GO.IDGRUPOORCAMEN   = CO.IDGRUPOORCAMEN' );
    sqlRelatPlanoTrabalho.SQL.Add( 'GROUP BY' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PT.IDPLANOTRABALHO,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GO.CODGRUPOORC,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GO.NOMEGRUPOORCAMEN' );
    sqlRelatPlanoTrabalho.SQL.Add( 'ORDER BY' );
    sqlRelatPlanoTrabalho.SQL.Add( '  PT.IDPLANOTRABALHO,' );
    sqlRelatPlanoTrabalho.SQL.Add( '  GO.CODGRUPOORC' );
    sqlRelatPlanoTrabalho.Open;

    //------------------------------------
    Inicializa( ricExercicio, 'Exercício: ' );
    If ( CmpRptCM.ParamValues[ 0 ].AsString = '-2' ) Then Begin
      ricExercicio.SelText :=  'sem filtro';
    End Else Begin
      ricExercicio.SelText :=  CmpRptCM.ParamValues[ 0 ].AsString;
    End;
    //------------------------------------
    Inicializa( ricCentrocusto, 'Centro de Custo: ' );
    If ( CmpRptCM.ParamValues[2].AsString = '-2' ) Then Begin
      ricCentrocusto.SelText := 'sem filtro';
    End Else Begin
      ricCentrocusto.SelText := CdsCentrocusto.FieldByName( 'NOME' ).AsString;
    End;
    //------------------------------------
    Inicializa( ricPlanoPrev, 'Plano Previdenciário: ' );
    If ( CmpRptCM.ParamValues[ 3 ].AsString = '-2' ) Then Begin
      ricPlanoPrev.SelText := 'sem filtro';
    End Else Begin
      ricPlanoPrev.SelText := CdsPlanoPrev.FieldByName( 'NOME' ).AsString;
    End;
    //------------------------------------
    Inicializa( ricPatrocinadora, 'Patrocinadora: ' );
    If ( CmpRptCM.ParamValues[ 5 ].AsString = '-2' ) Then Begin
      ricPatrocinadora.SelText := 'sem filtro';
    End Else Begin
      ricPatrocinadora.SelText := CdsPatrocinadora.FieldByName( 'NOME' ).AsString;
    End;
    //------------------------------------
    Inicializa( ricCenario, 'Cenário: ' );
    If ( CmpRptCM.ParamValues[ 7 ].AsString = '-2' ) Then Begin
      ricCenario.SelText := 'sem filtro';
    End Else Begin
      ricCenario.SelText := CdsCenario.FieldByName( 'NOMECENARIO' ).AsString;
    End;
    //------------------------------------
    Inicializa( ricDividirPor, 'Valores Divididos Por: ' );
    ricDividirPor.SelText := FloatToStr( FatorDeDivisao );

  finally
    MostraStatusRelatPlanoTrabalho( '' );
  End;
End;
//************************************************
Procedure TrptRelatPlanoTrabalho.Inicializa( Var pMemo : TppRichText;
                                                       pTexto : String );
Begin
  pMemo.Clear;
  pMemo.Text                := '';
  pMemo.SelStart            := 0;
  pMemo.SelAttributes.Style := [ fsBold ];
  pMemo.SelText             := pTexto ;
  pMemo.SelAttributes.Style := [ ];
End;
//************************************************
Procedure TrptRelatPlanoTrabalho.ppHeaderBand1BeforePrint(Sender: TObject);
Begin
  Inherited;

  If ( cdsPlanoTrabalho.IsEmpty ) Or
     ( cdsPlanoTrabalho.FieldByName( 'IDPLANOTRABALHO' ).AsString <> cdsRelatPlanoTrabalho.FieldByName( 'IDPLANOTRABALHO' ).AsString ) Then Begin

    //------------------------------------
    CdsPlanoTrabalho.Close;
    sqlPlanoTrabalho.Prepare;
    sqlPlanoTrabalho.ParamByName( 'IDPLANO' ).AsFloat   := cdsRelatPlanoTrabalho.FieldByName( 'IDPLANOTRABALHO' ).AsFloat;
    sqlPlanoTrabalho.Open;

    CdsSubProjeto.Close;
    sqlSubProjeto.Prepare;
    sqlSubProjeto.ParamByName( 'IDPESSOA' ).AsFloat   := Sistema.IdEmpresa;
    sqlSubProjeto.ParamByName( 'UNECODIGO' ).AsString := CdsPlanoTrabalho.FieldByName( 'UNECODIGO' ).AsString;
    sqlSubProjeto.Open;

    Inicializa( ricPlanoTrabalho, 'Plano de Trabalho: ' );
    ricPlanoTrabalho.SelText    := CdsPlanoTrabalho.FieldByName( 'DESCRICAO' ).AsString;

    Inicializa( ricObjetivo, 'Objetivo: ' );
    ricObjetivo.SelText          := CdsPlanoTrabalho.FieldByName( 'OBJETIVO' ).AsString;

    Inicializa( ricUnidadeGestora, 'Unidade Gestora: ' );
    ricUnidadeGestora.SelText      := CdsPlanoTrabalho.FieldByName( 'CODCENTRORESPON' ).AsString + '-' + CdsPlanoTrabalho.FieldByName( 'NOMECR' ).AsString;

    Inicializa( ricAtivProj, 'Atividade/Projeto: ' );
    ricAtivProj.SelText  := CdsSubProjeto.FieldByName( 'UNECODIGO' ).AsString + '-' +   CdsSubProjeto.FieldByName( 'NOME' ).AsString;

    Inicializa( ricSubProjeto, 'SubProjeto: ' );
    ricSubProjeto.SelText  := CdsPlanoTrabalho.FieldByName( 'UNECODIGO' ).AsString + '-' + CdsPlanoTrabalho.FieldByName( 'NOMEATIV' ).AsString;

    Inicializa( ricNecessidade, 'Necessidade: ' );
    ricNecessidade.SelText  := CdsPlanoTrabalho.FieldByName( 'NECESSIDADE' ).AsString;

    Inicializa( ricBeneficio, 'Benefício esperado: ' );
    ricBeneficio.SelText  := CdsPlanoTrabalho.FieldByName( 'BENEFESPERADO' ).AsString;

    Inicializa( ricConsequencia, 'Conseqüência do não atendimento: ' );
    ricConsequencia.SelText  := CdsPlanoTrabalho.FieldByName( 'CONSEQNAOATEND' ).AsString;

    Inicializa( ricPrioridade, 'Prioridade: ' );
    ricPrioridade.SelText  := CdsPlanoTrabalho.FieldByName( 'PRIORIDADE' ).AsString;
  End;
End;
//************************************************
End.
