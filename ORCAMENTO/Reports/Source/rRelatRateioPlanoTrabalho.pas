Unit
  rRelatRateioPlanoTrabalho;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppPrnabl, ppCtrls, ppBands, ppCache,
  ppModule, daDataModule, ppVar, uFuncoesOrcamento, 
  ppStrtch, ppMemo, ppRichTx, TXRB;

Type
  TrptRelatRateioPlanoTrabalho = class(TFrmCmReport)
    rptRateioPlanoTrabalho: TppReport;
    pplRateioPlanoTrabalho: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    LblNomeSistema: TppLabel;
    sqlRateioPlanoTrabalho: TCMSqlParams;
    dtsRateioPlanoTrabalho: TDataSource;
    CdsRateioPlanoTrabalho: TCMClientDataSet;
    LblEmpresa: TppLabel;
    ppLabel207: TppLabel;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
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
    ppDBText1: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine2: TppLine;
    ppLabel14: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLine3: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    sqlPlanoTrabalho: TCMSqlParams;
    CdsPlanoTrabalho: TCMClientDataSet;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlCriterio: TCMSqlParams;
    CdsCriterio: TCMClientDataSet;
    sqlGrupoOrcamen: TCMSqlParams;
    CdsGrupoOrcamen: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    CdsPlanoPrev: TCMClientDataSet;
    sqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    lblAtividadeProjeto: TppRichText;
    lblCentrocusto: TppRichText;
    lblExercicio: TppRichText;
    lblGrupoOrcamentario: TppRichText;
    lblCenario: TppRichText;
    lblPlanoTrabalho: TppRichText;
    lblPeriodo: TppRichText;
    lblCentroRespon: TppRichText;
    lblPrioridade: TppRichText;
    lblPlano: TppRichText;
    lblPatrocinadora: TppRichText;
    lblCriterioRateio: TppRichText;
    lblObjetivo: TppRichText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  Private
    procedure Inicializa(var pMemo: TppRichText; pTexto: String);
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  rptRelatRateioPlanoTrabalho: TrptRelatRateioPlanoTrabalho;

Implementation

Uses
  uSistema, uMensErro;

{$R *.DFM}
//************************************************
Procedure TrptRelatRateioPlanoTrabalho.FormCreate(Sender: TObject);
Begin
  Inherited;

End;
//************************************************
Procedure TrptRelatRateioPlanoTrabalho.CrmRptCMBeforePrint(Sender: TObject);
Var
  Posicao,
  Posicao2  : Integer;

Begin

  If ( CmpRptCM.ParamValues[ 0 ].AsString = '' ) Then Begin

    MsgDlg( 'É necessário informar o plano de trabalho', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else Begin
    MostraStatusRelatRateioPlano( 'Abrindo - Plano de Trabalho' );
    //------------------------------------
    CdsPlanoTrabalho.Close;
    sqlPlanoTrabalho.Prepare;
    sqlPlanoTrabalho.ParamByName( 'IDPLANO' ).AsFloat   := Trunc( StrToFloat( CmpRptCM.ParamValues[ 0 ].AsString ) );
    sqlPlanoTrabalho.Open;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 1 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatRateioPlano( 'Abrindo - Grupo Orçamentário' );
      CdsGrupoOrcamen.Close;
      sqlGrupoOrcamen.Prepare;
      sqlGrupoOrcamen.ParamByName( 'IDGRUPO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 1 ].AsString ) );
      sqlGrupoOrcamen.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 2 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatRateioPlano( 'Abrindo - Centro de Custo' );
      CdsCentroCusto.Close;
      sqlCentroCusto.Prepare;
      sqlCentroCusto.ParamByName( 'IDCENTRO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 2 ].AsString ) );
      sqlCentroCusto.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 3 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatRateioPlano( 'Abrindo - Plano Previdenciário' );
      CdsPlanoPrev.Close;
      sqlPlanoPrev.Prepare;
      sqlPlanoPrev.ParamByName( 'IDPLANO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 3 ].AsString ) );
      sqlPlanoPrev.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 5 ].AsString <> '-2' ) Then Begin
      MostraStatusRelatRateioPlano( 'Abrindo - Critério' );
      CdsCriterio.Close;
      sqlCriterio.Prepare;
      sqlCriterio.ParamByName( 'IDCRITERIO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 5 ].AsString ) );
      sqlCriterio.Open;
    End;
    //------------------------------------
    If ( CmpRptCM.ParamValues[ 6 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO
      MostraStatusRelatRateioPlano( 'Abrindo - Cenário - Valores' );
      CdsCenario.Close;
      sqlCenario.Prepare;
      sqlCenario.ParamByName( 'IDCENARIO' ).AsFloat := Trunc( StrToFloat( CmpRptCM.ParamValues[ 6 ].AsString ) );
      sqlCenario.Open;
    End;

    MostraStatusRelatRateioPlano( 'Abrindo - Relatório' );
    CdsRateioPlanoTrabalho.Close;
    sqlRateioPlanoTrabalho.SQL.Clear;
    sqlRateioPlanoTrabalho.SQL.Add( 'SELECT C.CODCENTROCUSTO, C.FLGSINALCONTA,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       C.IDCONTAORCAMEN, C.IDPLANOORCAMEN,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       C.NOMECONTAORCAMEN,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       S.EXERCICIO, S.IDCRITERIORATORC, S.IDPESSOA,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       C.CODCENTRORESPON, C.UNIDNEGOC,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       C.IDPLANOPREV, C.IDPATRO,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO1,0))    AS VLRORCADO1,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI1,0)) AS VLRRATEIOORI1,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO2,0)) AS VLRORCADO2,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI2,0)) AS VLRRATEIOORI2,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO3,0)) AS VLRORCADO3,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI3,0)) AS VLRRATEIOORI3,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO4,0)) AS VLRORCADO4,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI4,0)) AS VLRRATEIOORI4,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO5,0)) AS VLRORCADO5,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI5,0)) AS VLRRATEIOORI5,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO6,0)) AS VLRORCADO6,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI6,0)) AS VLRRATEIOORI6,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO7,0)) AS VLRORCADO7,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI7,0)) AS VLRRATEIOORI7,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO8,0)) AS VLRORCADO8,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI8,0)) AS VLRRATEIOORI8,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO9,0)) AS VLRORCADO9,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI9,0)) AS VLRRATEIOORI9,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO10,0)) AS VLRORCADO10,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI10,0)) AS VLRRATEIOORI10,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO11,0)) AS VLRORCADO11,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI11,0)) AS VLRRATEIOORI11,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRORCADO12,0)) AS VLRORCADO12,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       SUM(NVL(S.VLRRATEIOORI12,0)) AS VLRRATEIOORI12,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       NVL(SUM(S.VLRORCADO1+S.VLRORCADO2+S.VLRORCADO3+S.VLRORCADO4+S.VLRORCADO5+S.VLRORCADO6+S.VLRORCADO7+' );
    sqlRateioPlanoTrabalho.SQL.Add( '       S.VLRORCADO8+S.VLRORCADO9+S.VLRORCADO10+S.VLRORCADO11+S.VLRORCADO12),0) AS VLRORCADOTOTAL,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       NVL(SUM(S.VLRRATEIOORI1+S.VLRRATEIOORI2+S.VLRRATEIOORI3+S.VLRRATEIOORI4+S.VLRRATEIOORI5+S.VLRRATEIOORI6+' );
    sqlRateioPlanoTrabalho.SQL.Add( '       S.VLRRATEIOORI7+S.VLRRATEIOORI8+S.VLRRATEIOORI9+S.VLRRATEIOORI10+S.VLRRATEIOORI11+S.VLRRATEIOORI12),0) AS VLRRATORITOTAL,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       C.FLGATIVA, ' );
    sqlRateioPlanoTrabalho.SQL.Add( '       P.NOME AS NOMEPATRO,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       O.IDPLANOTRABALHO, ' );
    sqlRateioPlanoTrabalho.SQL.Add( '       DECODE(O.PRIORIDADE,''A'','' ALTA'',DECODE(O.PRIORIDADE,''B'',''BAIXA'',''MEDIA'')) AS PRIORIDADE, O.OBJETIVO, O.NECESSIDADE,' );
    sqlRateioPlanoTrabalho.SQL.Add( '       O.BENEFESPERADO, O.CONSEQNAOATEND, O.EXERCICIOINI, O.EXERCICIOFIM' );
    sqlRateioPlanoTrabalho.SQL.Add( 'FROM (' );

    For Posicao := 1 To 12 Do Begin

      sqlRateioPlanoTrabalho.SQL.Add( '  (SELECT S.EXERCICIO, S.PERIODO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDPLANOORCAMEN, S.IDPESSOA,' );

      For Posicao2 := 1 To 12 Do Begin

        If ( CmpRptCM.ParamValues[ 6 ].AsString = '-2' ) Then Begin             // SALDOORCADO
          If ( Posicao2 = Posicao ) Then Begin
            sqlRateioPlanoTrabalho.SQL.Add( '          ROUND( SUM(S.VLRORCADO), 2 ) AS VLRORCADO' + IntToStr( Posicao2 ) + ',' );
            sqlRateioPlanoTrabalho.SQL.Add( '          ROUND( SUM(S.VLRRATEIOORI), 2 ) AS VLRRATEIOORI' + IntToStr( Posicao2 ) + ',' );
          End Else Begin
            sqlRateioPlanoTrabalho.SQL.Add( '          (0) AS VLRORCADO' + IntToStr( Posicao2 ) + ',' );
            sqlRateioPlanoTrabalho.SQL.Add( '          (0) AS VLRRATEIOORI' + IntToStr( Posicao2 ) + ',' );
          End;
        End Else Begin                                                          // VALORESCENARIO
          If ( Posicao2 = Posicao ) Then Begin
            sqlRateioPlanoTrabalho.SQL.Add( '          ROUND( SUM(S.VLRORCCENARIO), 2 ) AS VLRORCADO' + IntToStr( Posicao2 ) + ',' );
            sqlRateioPlanoTrabalho.SQL.Add( '          ROUND( SUM(S.VLRRATEIOORI), 2 ) AS VLRRATEIOORI' + IntToStr( Posicao2 ) + ',' );
          End Else Begin
            sqlRateioPlanoTrabalho.SQL.Add( '          (0) AS VLRORCADO' + IntToStr( Posicao2 ) + ',' );
            sqlRateioPlanoTrabalho.SQL.Add( '          (0) AS VLRRATEIOORI' + IntToStr( Posicao2 ) + ',' );
          End;
        End;
      End;

      // Retirar a última vírgula
      sqlRateioPlanoTrabalho.SQL.Strings[ sqlRateioPlanoTrabalho.SQL.Count - 1 ] :=
            Copy( sqlRateioPlanoTrabalho.SQL.Strings[ sqlRateioPlanoTrabalho.SQL.Count - 1 ],
                  1,
                  Length( sqlRateioPlanoTrabalho.SQL.Strings[ sqlRateioPlanoTrabalho.SQL.Count - 1 ] ) - 1 );

      If ( CmpRptCM.ParamValues[ 6 ].AsString = '-2' ) Then Begin             // SALDOORCADO
        sqlRateioPlanoTrabalho.SQL.Add( '  FROM SALDOORCADO S' );
      End Else Begin                                                          // VALORESCENARIO
        sqlRateioPlanoTrabalho.SQL.Add( '  FROM VALORESCENARIO S' );
      End;

      sqlRateioPlanoTrabalho.SQL.Add( '  WHERE' );

      If ( CmpRptCM.ParamValues[ 7 ].AsString <> '-2' ) Then Begin
        sqlRateioPlanoTrabalho.SQL.Add( '        ( S.EXERCICIO        = ' + CmpRptCM.ParamValues[ 7 ].AsString + ' ) AND' );
      End;

      sqlRateioPlanoTrabalho.SQL.Add( '        ( S.IDPLANOORCAMEN = ' + IntToStr( CmpRptCM.ParamValues[ 8 ].AsInteger ) + ' ) AND' );
      sqlRateioPlanoTrabalho.SQL.Add( '        ( S.PERIODO = ' + IntToStr( Posicao ) + ' ) AND' );
      sqlRateioPlanoTrabalho.SQL.Add( '        ( S.EXERCICIO||S.PERIODO BETWEEN ' + CdsPlanoTrabalho.FieldByName( 'EXERCICIOINI' ).AsString + CdsPlanoTrabalho.FieldByName( 'PERIODOINI' ).AsString + ' AND ' +
                                                                                    CdsPlanoTrabalho.FieldByName( 'EXERCICIOFIM' ).AsString + CdsPlanoTrabalho.FieldByName( 'PERIODOFIM' ).AsString + ')' );

      If ( CmpRptCM.ParamValues[ 6 ].AsString <> '-2' ) Then Begin             // VALORESCENARIO
        sqlRateioPlanoTrabalho.SQL.Add( '        AND ( S.IDCENARIOORCAMEN = ' + CmpRptCM.ParamValues[ 6 ].AsString + ' )' );
      End;

      sqlRateioPlanoTrabalho.SQL.Add( '  GROUP BY S.EXERCICIO, S.PERIODO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDPLANOORCAMEN, S.IDPESSOA)' );

      If ( Posicao < 12 ) Then Begin

        sqlRateioPlanoTrabalho.SQL.Add( 'UNION ALL' );
      End;
    End;

    sqlRateioPlanoTrabalho.SQL.Add( '      ) S,' );
    sqlRateioPlanoTrabalho.SQL.Add( '     CONTASORCAMEN C, PLANOTRABALHOORC O, PESSOA P' );
    sqlRateioPlanoTrabalho.SQL.Add( '  WHERE' );

    sqlRateioPlanoTrabalho.SQL.Add( '  ( P.IDPESSOA           = ' +  IntToStr( Sistema.IdEmpresa ) + ' ) AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDPLANOORCAMEN = ' + IntToStr( CmpRptCM.ParamValues[ 8 ].AsInteger ) + ' ) AND' );

    sqlRateioPlanoTrabalho.SQL.Add( '  ( O.IDPESSOA           = P.IDPESSOA )        AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( O.IDPLANOTRABALHO    = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) AND' );

    If ( CmpRptCM.ParamValues[1].AsString <> '-2' ) Then Begin
      sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDGRUPOORCAMEN   = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' ) AND' );
    End;

    sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDPESSOA         = P.IDPESSOA )          AND' );

    If ( CmpRptCM.ParamValues[2].AsString <> '-2' ) Then Begin
      sqlRateioPlanoTrabalho.SQL.Add( '  ( C.CODCENTROCUSTO   = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) AND' );
    End;

    sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDEMPRESA        = P.IDPESSOA )          AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( C.UNIDNEGOC        = O.UNIDNEGOC )         AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( C.CODCENTRORESPON  = O.CODCENTRORESPON )   AND' );

    If ( CmpRptCM.ParamValues[ 3 ].AsString <> '-2' ) Then Begin
      sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDPLANOPREV      = ' + CmpRptCM.ParamValues[ 3 ].AsString + ' )          AND' );
    End;
    If ( CmpRptCM.ParamValues[ 4 ].AsString <> '-2' ) Then Begin
      sqlRateioPlanoTrabalho.SQL.Add( '  ( C.IDPATRO          = ' + CmpRptCM.ParamValues[ 4 ].AsString + ' )          AND' );
    End;
    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.IDPLANOORCAMEN   = C.IDPLANOORCAMEN)     AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.IDCONTAORCAMEN   = C.IDCONTAORCAMEN)     AND' );

    If ( CmpRptCM.ParamValues[ 5 ].AsString <> '-2' ) Then Begin
      sqlRateioPlanoTrabalho.SQL.Add( '  ( S.IDCRITERIORATORC = ' + CmpRptCM.ParamValues[ 5 ].AsString + ') AND' );
    End;

    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.EXERCICIO        >= O.EXERCICIOINI )     AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.PERIODO          >= O.PERIODOINI )       AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.EXERCICIO        <= O.EXERCICIOFIM )     AND' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ( S.PERIODO          <= O.PERIODOFIM )' );

    sqlRateioPlanoTrabalho.SQL.Add( '  GROUP BY' );
    sqlRateioPlanoTrabalho.SQL.Add( '    C.CODCENTROCUSTO,  C.FLGSINALCONTA,' );
    sqlRateioPlanoTrabalho.SQL.Add( '    C.IDCONTAORCAMEN,  C.IDPLANOORCAMEN,   C.NOMECONTAORCAMEN,' );
    sqlRateioPlanoTrabalho.SQL.Add( '    S.EXERCICIO,       S.IDCRITERIORATORC, S.IDPESSOA,' );
    sqlRateioPlanoTrabalho.SQL.Add( '    C.CODCENTRORESPON, C.UNIDNEGOC,        C.IDPLANOPREV, ' );
    sqlRateioPlanoTrabalho.SQL.Add( '    C.IDPATRO,         C.FLGATIVA,         ' );
    sqlRateioPlanoTrabalho.SQL.Add( '    P.NOME,            O.IDPLANOTRABALHO,  O.PRIORIDADE, ' );
    sqlRateioPlanoTrabalho.SQL.Add( '    O.OBJETIVO,        O.NECESSIDADE,      O.BENEFESPERADO,' );
    sqlRateioPlanoTrabalho.SQL.Add( '    O.CONSEQNAOATEND,  O.EXERCICIOINI,     O.EXERCICIOFIM' );
    sqlRateioPlanoTrabalho.SQL.Add( '  ORDER BY' );
    sqlRateioPlanoTrabalho.SQL.Add( '    IDPESSOA, CODCENTROCUSTO, EXERCICIO' );

    sqlRateioPlanoTrabalho.Open;

    Inicializa( lblPlanoTrabalho, 'Plano de Trabalho: ' );
    lblPlanoTrabalho.SelText    := CdsPlanoTrabalho.FieldByName( 'DESCRICAO' ).AsString;

    Inicializa( lblPeriodo, 'Período: ' );
    lblPeriodo.SelText           := CdsPlanoTrabalho.FieldByName( 'PERIODOINI' ).AsString + '/' + CdsPlanoTrabalho.FieldByName( 'EXERCICIOINI' ).AsString + ' à ' +
                                    CdsPlanoTrabalho.FieldByName( 'PERIODOFIM' ).AsString + '/' + CdsPlanoTrabalho.FieldByName( 'EXERCICIOFIM' ).AsString;

    Inicializa( lblObjetivo, 'Objetivo: ' );
    lblObjetivo.SelText          := CdsPlanoTrabalho.FieldByName( 'OBJETIVO' ).AsString;

    Inicializa( lblCentroRespon, 'Centro de Responsabilidade: ' );
    lblCentroRespon.SelText      := CdsPlanoTrabalho.FieldByName( 'CODCENTRORESPON' ).AsString + '-' + CdsPlanoTrabalho.FieldByName( 'NOMECR' ).AsString;

    Inicializa( lblAtividadeProjeto, 'Atividade/Projeto: ' );
    lblAtividadeProjeto.SelText  := CdsPlanoTrabalho.FieldByName( 'NOMEATIV' ).AsString;

    Inicializa( lblPrioridade, 'Prioridade: ' );
    lblPrioridade.SelText  := CdsRateioPlanoTrabalho.FieldByName( 'PRIORIDADE' ).AsString;
    //------------------------------------
    Inicializa( lblExercicio, 'Exercício: ' );
    If ( CmpRptCM.ParamValues[ 7 ].AsString = '-2' ) Then Begin
      lblExercicio.SelText :=  'sem filtro';
    End Else Begin
      lblExercicio.SelText :=  CmpRptCM.ParamValues[ 7 ].AsString;
    End;
    //------------------------------------
    Inicializa( lblCriterioRateio, 'Criterio de Rateio: ' );
    If ( CmpRptCM.ParamValues[ 5 ].AsString = '-2' ) Then Begin
      lblCriterioRateio.SelText := 'sem filtro';
    End Else Begin
      lblCriterioRateio.SelText := CdsCriterio.FieldByName( 'DESCRICAO' ).AsString;
    End;
    //------------------------------------
    Inicializa( lblGrupoOrcamentario, 'Grupo Orçamentário: ' );
    If ( CmpRptCM.ParamValues[1].AsString = '-2' ) Then Begin
      lblGrupoOrcamentario.SelText := 'sem filtro';
    End Else Begin
      lblGrupoOrcamentario.SelText := CdsGrupoOrcamen.FieldByName( 'NOMEGRUPOORCAMEN' ).AsString;
    End;
    //------------------------------------
    Inicializa( lblCentrocusto, 'Centro de Custo: ' );
    If ( CmpRptCM.ParamValues[2].AsString = '-2' ) Then Begin
      lblCentroCusto.SelText := 'sem filtro';
    End Else Begin
      lblCentroCusto.SelText := CdsCentrocusto.FieldByName( 'NOME' ).AsString;
    End;
    //------------------------------------
    Inicializa( lblPlano, 'Plano Previdenciário: ' );
    If ( CmpRptCM.ParamValues[ 3 ].AsString = '-2' ) Then Begin
      lblPlano.SelText := 'sem filtro';
    End Else Begin
      lblPlano.SelText := CdsPlanoPrev.FieldByName( 'NOME' ).AsString;
    End;
    //------------------------------------
    Inicializa( lblPatrocinadora, 'Patrocinadora: ' );
    If ( Trim( CdsRateioPlanoTrabalho.FieldByName( 'NOMEPATRO' ).AsString ) = '' ) Then Begin
      lblPatrocinadora.SelText := 'sem filtro';
    End Else Begin
      lblPatrocinadora.SelText := CdsRateioPlanoTrabalho.FieldByName( 'NOMEPATRO' ).AsString;
    End;
    //------------------------------------
    Inicializa( lblCenario, 'Cenário: ' );
    If ( CmpRptCM.ParamValues[ 6 ].AsString = '-2' ) Then Begin
      lblCenario.SelText := 'sem filtro';
    End Else Begin
      lblCenario.SelText := CdsCenario.FieldByName( 'NOMECENARIO' ).AsString;
    End;
    //------------------------------------
    MostraStatusRelatRateioPlano( '' );
  End;
End;
//************************************************
Procedure TrptRelatRateioPlanoTrabalho.Inicializa( Var pMemo : TppRichText;
                                                       pTexto : String );
Begin
  pMemo.Text                := '';
  pMemo.SelStart            := 0;
  pMemo.SelAttributes.Style := [ fsBold ];
  pMemo.SelText             := pTexto ;
  pMemo.SelAttributes.Style := [ ];
End;
//************************************************
End.
