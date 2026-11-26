unit FComparaReembDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, TREdit, Db, DBTables, Wwquery;

type
  TFrmComparaReembDesemb = class(TfrmSairAjuda)
    grpMesAno: TGroupBox;
    lblMes: TLabel;
    seAno: TSpinEdit;
    cboxMes: TComboBox;
    BtConsultar: TBitBtn;
    GrBxReembolso: TGroupBox;
    PnlRItem1: TPanel;
    EdVRItem1: TRealEdit;
    PnlRItem2: TPanel;
    EdVRItem2: TRealEdit;
    PnlRItem3: TPanel;
    EdVRItem3: TRealEdit;
    PnlRItem4: TPanel;
    EdVRItem4: TRealEdit;
    PnlRItem5: TPanel;
    EdVRItem5: TRealEdit;
    PnlRItem6: TPanel;
    EdVRItem6: TRealEdit;
    PnlRItem7: TPanel;
    EdVRItem7: TRealEdit;
    PnlRItem8: TPanel;
    EdVRItem8: TRealEdit;
    PnlRItem9: TPanel;
    EdVRItem9: TRealEdit;
    PnlRItem10: TPanel;
    EdVRItem10: TRealEdit;
    PnlRItem11: TPanel;
    EdVRItem11: TRealEdit;
    PnlRItem12: TPanel;
    EdVRItem12: TRealEdit;
    PnlRItem14: TPanel;
    EdVRItem14: TRealEdit;
    GrBxDesembolso: TGroupBox;
    PnlDItem1: TPanel;
    EdVDItem1: TRealEdit;
    PnlDItem2: TPanel;
    EdVDItem2: TRealEdit;
    PnlDItem3: TPanel;
    EdVDItem3: TRealEdit;
    PnlDItem4: TPanel;
    EdVDItem4: TRealEdit;
    PnlDItem5: TPanel;
    EdVDItem5: TRealEdit;
    PnlDItem6: TPanel;
    EdVDItem6: TRealEdit;
    PnlDItem7: TPanel;
    EdVDItem7: TRealEdit;
    PnlDItem8: TPanel;
    EdVDItem8: TRealEdit;
    PnlDItem9: TPanel;
    EdVDItem9: TRealEdit;
    PnlDItem10: TPanel;
    EdVDItem10: TRealEdit;
    PnlDItem11: TPanel;
    EdVDItem11: TRealEdit;
    PnlItem14: TPanel;
    EdVItem14: TRealEdit;
    QryConsulta: TwwQuery;
    EdQRItem1: TRealEdit;
    EdQDItem1: TRealEdit;
    PnlRItem13: TPanel;
    EdVRItem13: TRealEdit;
    LblTEMPO: TLabel;
    EdQRItem2: TRealEdit;
    EdQRItem3: TRealEdit;
    EdQRItem4: TRealEdit;
    EdQRItem5: TRealEdit;
    EdQRItem6: TRealEdit;
    EdQRItem7: TRealEdit;
    EdQRItem8: TRealEdit;
    EdQRItem9: TRealEdit;
    EdQRItem10: TRealEdit;
    EdQRItem11: TRealEdit;
    EdQRItem12: TRealEdit;
    EdQRItem13: TRealEdit;
    EdQRItem14: TRealEdit;
    EdQDItem2: TRealEdit;
    EdQDItem3: TRealEdit;
    EdQDItem4: TRealEdit;
    EdQDItem5: TRealEdit;
    EdQDItem6: TRealEdit;
    EdQDItem7: TRealEdit;
    EdQDItem8: TRealEdit;
    EdQDItem9: TRealEdit;
    EdQDItem10: TRealEdit;
    EdQDItem11: TRealEdit;


    procedure BtConsultarClick(Sender: TObject);
  private
    { Private declarations }
    Function ExisteCONCINSS(psMesReferencia : String): Boolean;

    Procedure EfetuaConsultas(psAnoMesRef : String);
    Procedure ConsultasReembolso(psAnoMesRef : String);
    Procedure ConsultasDesembolso(psAnoMesRef : String);
    Procedure CalculaDiferenca;


  public
    { Public declarations }
  end;

var
  FrmComparaReembDesemb: TFrmComparaReembDesemb;

implementation

Uses uDataBase, UMensErro, UAdmPrev, DBaseDados, Usistema, fAguarde;


{$R *.DFM}

procedure TFrmComparaReembDesemb.BtConsultarClick(Sender: TObject);
Var
  sMes, sAnoMesRef : String;
  tmInicio : TTime;
begin
  inherited;
  If (cboxMes.Text = '') Then Begin
    MsgDlg('Parâmetros Incompletos.','Erro',mtError,[mbOk],0);
    cboxMes.SetFocus;
    Exit;
  End;

  If (cboxMes.ItemIndex + 1) < 10
  Then sMes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  Else sMes := IntToStr((cboxMes.ItemIndex + 1));

  sAnoMesRef :=  IntToStr(seAno.Value) + '/' + sMes;

  tmInicio := Time;
  LblTEMPO.Caption := TimeToStr( Time );

  { Verifica fechamento }
  If Not ExisteCONCINSS(sAnoMesRef) Then Begin
    If MsgDlg('Fechamento não encontrado neste mês. Deseja continuar?? ',
              'Confirmação', mtInformation,[mbYes,mbNo],0) = mrNo Then Exit;
  End;

  { Efetuas as consultas e preenche a tela }
  EfetuaConsultas(sAnoMesRef);

  LblTEMPO.Caption := TimeToStr( ( tmInicio - Time ) * 60 );

end;


procedure TFrmComparaReembDesemb.EfetuaConsultas(psAnoMesRef: String);
Var
  sSQL : String;
begin

  { Obs.: Cada Item da tela será preenchido por uma consulta, indicada pelo tipo, }
  { Reembolso e Desembolso, e pelo Item.                                          }

  frmAguarde.Mostra('Efetuando consultas de Reembolso ...');
  ConsultasReembolso(psAnoMesRef);

  frmAguarde.Mostra('Efetuando consultas de Desembolso ...');
  ConsultasDesembolso(psAnoMesRef);

  frmAguarde.Mostra('Calculando diferença ...');
  CalculaDiferenca;

  frmAguarde.Apaga;
end;

procedure TFrmComparaReembDesemb.ConsultasReembolso(psAnoMesRef: String);
Var
  sSQL : String;
begin

  {-----------------------------------------------------------------------------------------}
  { Item 01 -> TOTAL CONCESSÃO: PRIMEIRO REEMBOLSO                                          }
  {            Demonstrar total dos valores reembolsados pela primeira vez, na competência  }
  {            selecionada, ou seja, somar os valores dos benefícios que estão chegando a   }
  {            primeira vez dentro do convênio.                                             }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM(DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',  -DET.VALORINSS, '+
          '	    DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''94'',  -DET.VALORINSS, '+
          '	    DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''203'', -DET.VALORINSS, '+
          ' 	    DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''202'', -DET.VALORINSS, '+
          '  	    DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''30'',  -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''206'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''208'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,4),''4201'',-DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,4),''2201'',-DET.VALORINSS, DET.VALORINSS))))))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')                AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9''))            AND '+
          '     (DET.NUMPROCINSS, DET.MESCOBRANCA) IN (SELECT NUMPROCINSS, MIN(MESCOBRANCA) '+
          '                                            FROM DETCONCINSS '+
          '                                            GROUP BY NUMPROCINSS) AND '+
          '	(NOT EXISTS (SELECT TC.NUMPROCINSS '+
          ' 		      FROM TEMPCONCINSS TC '+
          '		      WHERE TC.NUMPROCINSS = DET.NUMPROCINSS AND '+
          '                         TC.MESPROCESSAMENTO < DET.MESCOBRANCA)) ) DETCONCINSS, '+
          '  (SELECT '+
          '	SUM(DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',  -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''94'',  -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''203'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''202'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''30'',  -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''206'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''208'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''201'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)))))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE                 '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     (TEM.NUMPROCINSS, TEM.MESPROCESSAMENTO) IN (SELECT NUMPROCINSS,    '+
          '                                                 MIN(MESPROCESSAMENTO)  '+
          '                                                 FROM TEMPCONCINSS      '+
          '                                                 GROUP BY NUMPROCINSS) ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem1.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem1.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 02 -> TOTAL DE PAB                        d                                         }
  {            Demonstrar o total dos valores reembolsados a titulo de PAB na competência   }
  {            selecionada, ou seja, somatório das RUBRICAINSS com tipo '4' e diferente das }
  {            RUBRICAINSS informativas.                                                    }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM(DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''203'', -DET.VALORINSS, '+
          ' 	    DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''202'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,4),''4201'',-DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''206'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,2,3),''208'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,4),''2201'',-DET.VALORINSS, DET.VALORINSS)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     (DET.RUBRICAINSS LIKE ''4%'')) DETCONCINSS, '+
          '  (SELECT '+
          '	SUM(DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''203'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''202'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''206'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''208'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,2,3),''201'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     (TEM.CODRUBRICA1 LIKE ''4%'') ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem2.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem2.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 03 -> TOTAL REVISAO                                                                }
  {            Demonstrar o total dos valores reembolsados na competência selecionada com a }
  {            rubrica de revisão lançada pelo INSS, ou seja, somatório das rubricas        }
  {            ('%143', '%144', '%131')                                                     }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( DECODE (SUBSTR(DET.RUBRICAINSS,1,1),''9'', -DET.VALORINSS, DET.VALORINSS) ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (DET.RUBRICAINSS LIKE ''%107'') OR  (DET.RUBRICAINSS LIKE ''%125'') OR  '+
          '       (DET.RUBRICAINSS LIKE ''%126'') OR '+
          '       (DET.RUBRICAINSS LIKE ''%131'') OR  (DET.RUBRICAINSS LIKE ''%143'')  )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '	SUM( DECODE (SUBSTR(TEM.CODRUBRICA1,1,1),''9'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1) ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (TEM.CODRUBRICA1 LIKE ''%107'') OR (TEM.CODRUBRICA1 LIKE ''%125'') OR '+
          '       (TEM.CODRUBRICA1 LIKE ''%126'') OR  '+
          '       (TEM.CODRUBRICA1 LIKE ''%131'') OR  (TEM.CODRUBRICA1 LIKE ''%143'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem3.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem3.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 04 -> TOTAL IRSM(RUB:                                                              }
  {            Quantidade de benefícios e valor total reembolsado a titulo de IRSM(R:'%144')}
  {            NA COMPETENCIA SELECIONADA PARA O CODMANTENEDORA IN('14','99') OR            }
  {            CODMANTENEDORA IS NULL.                                                      }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
                    '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',-DET.VALORINSS, DET.VALORINSS)  '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(DET.RUBRICAINSS,2,3) = ''144'' )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',-TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)  '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(TEM.CODRUBRICA1,2,3) = ''144'' ) '+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem4.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem4.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;



  {-----------------------------------------------------------------------------------------}
  { Item 05 -> TOTAL GLOSAS                                                                 }
  {            Demonstrar o total dos valores glosados pelo INSS na competência em seleção, }
  {            por meio da RUBRICAINSS tipo ‘9%’, e diferente das rubricas informativas     }
  {            ('93%','99%').                                                               }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',-DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''92'', DET.VALORINSS))  '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (DET.RUBRICAINSS LIKE ''9%'') )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',-TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''92'', TEM.VLRRUBRICA1))  '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (TEM.CODRUBRICA1 LIKE ''9%'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem5.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem5.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 06 -> TOTAL ADICIONAL 25%                                                          }
  {            Demonstrar o total dos valores reembolsados na competência em referencia     }
  {            através da rubrica de adicional 25%, tendo como critério: RUBRICAINSS igual  }
  {            '%118' e CODMANTENEDORA('14','99') ou CODMANTENEDORA is NULL.                }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',-DET.VALORINSS, DET.VALORINSS) '+
          '        ) AS VALOR, '+
           '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (DET.RUBRICAINSS LIKE ''%118'') )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',-TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)   '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (TEM.CODRUBRICA1 LIKE ''%118'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem6.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem6.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 07 -> TOTAL CPMF                                                                   }
  {            Demonstrar o total dos valores reembolsados na competência por meio da       }
  {            rubrica '%121', ou seja, somatório dos valores reembolsados na rubrica de    }
  {            CPMF (RUBRICAINSS '%121') e com o CODMANTENEDORA igual o da FUNCEF('14','99' }
  {            ,'6', IS NULL).                                                              }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',-DET.VALORINSS, DET.VALORINSS) '+
          '        ) AS VALOR, '+
           '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (DET.RUBRICAINSS LIKE ''%121'') )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',-TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)   '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (TEM.CODRUBRICA1 LIKE ''%121'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem7.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem7.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 08 -> TOTAL SALARIO FAMILIA                                                        }
  {            Demonstrar o total dos valores reembolsados na competência por meio da       }
  {            rubrica '%105', ou seja, somatório dos valores reembolsados na rubrica de    }
  {            salário família (RUBRICAINSS '%105') e com CODMANTENEDORA igual o da FUNCEF  }
  {            ('14','99', IS NULL).                                                        }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'',-DET.VALORINSS, DET.VALORINSS) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (DET.RUBRICAINSS LIKE ''%105'') )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'',-TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)   '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( (TEM.CODRUBRICA1 LIKE ''%105'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem8.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem8.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 09 -> TOTAL DESCONTO INSS                                                          }
  {            Demonstrar o total dos valores descontados na competência por meio da        }
  {            rubrica: '%203','%206', ou seja, somatório dos descontos ocorridos por meio  }
  {            das rubricas de descontos( RUBRICAINSS: '%203','%206') e com CODMANTENEDORA  }
  {            igual o da FUNCEF ('14','99', IS NULL).                                      }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''12'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''22'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''42'', -DET.VALORINSS, DET.VALORINSS)))  '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(DET.RUBRICAINSS,2,3) IN (''203'',''206'') )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''12'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''22'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''42'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(TEM.CODRUBRICA1,2,3) IN (''203'',''206'') )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem9.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem9.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 10 -> TOTAL EXTRA-FOLHA                                                            }
  {            Demonstrar o total dos valores provisionados pelo INSS na competência por    }
  {            meio das rubricas: '1093' e '3093'(lembrando que 1093 é credito, 3093 é      }
  {            debito) e com CODMANTENEDORA igual o da FUNCEF ('14','99','6',IS NULL).      }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''30'',-DET.VALORINSS, DET.VALORINSS) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(DET.RUBRICAINSS,3,2)= ''93'' )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''30'',-TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)   '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(TEM.CODRUBRICA1,3,2)= ''93'' )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem10.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem10.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 11 –> TOTAL DE PENSÃO ALIMENTICIA                                                  }
  {            Demonstrar o total reembolsado na competência através da rubrica de pensão   }
  {            alimentícia, ou seja, somatório da rubrica '%202' com CODMANTENEDORA igual   }
  {            o da FUNCEF ('14','99',IS NULL).                                             }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''12'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''22'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''42'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''92'', -DET.VALORINSS, DET.VALORINSS)))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(DET.RUBRICAINSS,2,3)= ''202'' )'+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''12'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''22'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''42'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''92'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( SUBSTR(TEM.CODRUBRICA1,2,3)= ''202'' )'+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem11.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem11.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 12 -> TOTAL DE VALORES APOSENTADORIA                                               }
  {            Demonstrar o total reembolsado na competência selecionada somente de         }
  {            aposentadoria e invalidez, ou seja, somatório das espécie ('42','32','92',   }
  {            '41','43','46','58','81’, '82','83') com CODMANTENEDORA igual o da FUNCEF    }
  {            ('14','99',IS NULL).                                                         }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''12'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''22'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''30'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''42'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''92'', -DET.VALORINSS, DET.VALORINSS)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( DET.ESPECIE IN (''42'',''32'',''92'',''41'',''43'',''46'',''58'',''81'',''82'',''83'') ) '+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''12'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''22'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''30'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''42'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''92'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9''))  AND '+
          '     ( TEM.ESPECIE IN (''42'',''32'',''92'',''41'',''43'',''46'',''58'',''81'',''82'',''83'') ) '+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem12.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem12.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {-----------------------------------------------------------------------------------------}
  { Item 13 –> TOTAL DE VALORES PENSÃO                                                      }
  {            Demonstrar o total reembolsado na competência selecionada, somente de pensão,}
  {            ou seja, somatório das espécie (‘21’,’84’,’23’,’59’,’93’) com CODMANTENEDORA }
  {            igual o da FUNCEF (‘14’,’99’,IS NULL).                                       }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''12'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''22'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''30'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''42'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''92'', -DET.VALORINSS, DET.VALORINSS)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) AND '+
          '     ( DET.ESPECIE IN (''21'',''84'',''23'',''59'',''93'') ) '+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''12'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''22'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''30'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''42'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''92'', -TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9''))  AND '+
          '     ( TEM.ESPECIE IN (''21'',''84'',''23'',''59'',''93'') ) '+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem13.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem13.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;


  {--------------------------------------------------------------------------------------------}
  { Item 14 -> TOTAL REEMBOLSO: (TOTAL REEMBOLSADO) MENOS (O VALOR MANTENEDORA: '3', '5', '2') }
  {            Demonstrar o total dos valores reembolsados na competência, que se refere       }
  {            somente ao reembolso da FUNCEF, ou seja, os valores reembolsados sem o valor    }
  {            'do repasse( somente o CODMANTENEDORA: '14','99','6', IS NULL).                 }
  sSQL := 'SELECT '+
          '       (NVL(DETCONCINSS.VALOR,0)+NVL(TEMPCONCINSS.VALOR,0)) AS VALOR, '+
          '       (NVL(DETCONCINSS.QUANTIDADE,0)+NVL(TEMPCONCINSS.QUANTIDADE,0)) AS QUANTIDADE '+
          'FROM '+
          '  (SELECT '+
          '     SUM( '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''12'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''22'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''30'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''42'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''91'', -DET.VALORINSS, '+
          '         DECODE(SUBSTR(DET.RUBRICAINSS,1,2),''92'', DET.VALORINSS, DET.VALORINSS)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT DET.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM '+
          '     DETCONCINSS DET '+
          '   WHERE '+
          '     (DET.MESCOBRANCA = '+QuotedStr(psAnoMesRef)+')     AND '+
          '     (DET.CODMANTENEDORA IN (''14'',''99'') OR DET.CODMANTENEDORA IS NULL) AND ' +
          '     (SUBSTR(DET.RUBRICAINSS,2,1) NOT IN (''3'',''9'')) '+
          '  ) DETCONCINSS, '+
          '  (SELECT '+
          '     SUM( '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''12'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''22'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''30'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''42'', -TEM.VLRRUBRICA1, '+
          '         DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''91'', -TEM.VLRRUBRICA1, '+
          '	    DECODE(SUBSTR(TEM.CODRUBRICA1,1,2),''92'', TEM.VLRRUBRICA1, TEM.VLRRUBRICA1)))))) '+
          '        ) AS VALOR, '+
          '     COUNT(DISTINCT TEM.NUMPROCINSS) AS QUANTIDADE '+
          '   FROM                '+
          '     TEMPCONCINSS TEM  '+
          '   WHERE               '+
          '     (TEM.MESPROCESSAMENTO = '+QuotedStr(psAnoMesRef)+') AND '+
          '     (SUBSTR(TEM.CODRUBRICA1,2,1) NOT IN (''3'',''9''))      '+
          '  ) TEMPCONCINSS ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVRItem14.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQRItem14.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

end;

procedure TFrmComparaReembDesemb.ConsultasDesembolso(psAnoMesRef: String);
Var
  sSQL : String;
begin

  {-----------------------------------------------------------------------------------------}
  { Item 01 -> TOTAL CONCESSÃO                                                              }
  {            Demonstrar o total de valores desembolsados a primeira vez pela folha na     }
  {            competência selecionada, ou seja, somatório dos valores desembolsados para   }
  {            os benefícios que estão tendo o seu primeiro pagamento naquela competência   }
  {            com fonte pagadora igual a ‘2’.                                              }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST, BENEFBFCIARIO BB '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)          AND '+
          '  (HST.FONTEPAGADORA = 2)                  AND '+
          '  (HST.IDMODULO      = 18)                 AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'') AND '+

          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL) AND '+
          '  (HST.IDPATRO       = BB.IDPESSJUR)       AND ' +
          '  (HST.IDPLANOPREV   = BB.IDPLANOPREV)     AND ' +
          '  (HST.IDTITULAR     = BB.IDTITULAR)       AND ' +
          '  (HST.IDPESSOA      = BB.IDPESSOA)        AND ' +
          '  (HST.FONTEPAGADORA = BB.FONTEPAGADORA)   AND '+
          '  (HST.MESCOBRANCA   = TO_CHAR(BB.DATACONCESSAO, ''YYYY/MM'') ) AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323''))            ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem1.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem1.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 02 –> TOTAL REVISAO                                                                }
  {            Demonstrar o total de valores desembolsados a titulo de INSS(FONTEPGADORA=2) }
  {            pela folha de pagamento na competência selecionada com a referencia          }
  {            diferente que tenha registro na tabela MOVBENEF para pagamento na            }
  {            competência em  consulta.                                                    }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST, '+
          '  (SELECT DISTINCT '+
          '     IDPESSJUR, IDPLANOPREV,IDTITULAR, IDPESSOA, '+
          '     ANOMESACERTO, IDMOTIVO '+
          '   FROM  '+
          '     RETROATIVOPREV  '+
          '   WHERE '+
          '     ANOMESACERTO = '+QuotedStr(psAnoMesRef)+' )  RP '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)          AND '+
          '  (HST.FONTEPAGADORA = 2)                  AND '+
          '  (HST.IDMODULO      = 18)                 AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'') AND '+

          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL) AND '+
          '  (HST.MESCOBRANCA  <> HST.MES)            AND '+

          '  (HST.IDPATRO       = RP.IDPESSJUR)       AND ' +
          '  (HST.IDPLANOPREV   = RP.IDPLANOPREV)     AND ' +
          '  (HST.IDTITULAR     = RP.IDTITULAR)       AND ' +
          '  (HST.IDPESSOA      = RP.IDPESSOA)        AND ' +
          '  (HST.MESCOBRANCA   = RP.ANOMESACERTO)    AND ' +
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  (HST.IDMOTIVO      = RP.IDMOTIVO)            ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem2.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem2.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 03 –> TOTAL DE VALORES A RECEBER DO ASSISTIDO                                      }
  {            Demonstrar o total de valores lançados naquela competência a cobrar do       }
  {            assistido a titulo de INSS, para este usar o RELATORIO DE RUBRICA DE REVISAO }
  {            DO INSS disponível no modulo folha conforme tela abaixo:                     }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (HST.VALORPROVENTO <> ''0'')                     AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  ( SUBSTR(HST.CODPROVDESC,2,5) NOT IN(''30404'',''30104'') ) AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  ( SUBSTR(HST.CODPROVDESC,1,1) IN (''3'',''4'') )  ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem3.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem3.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { ITEM 04 – SOMATORIO DE VALORES DESEMBOLSADOS A TITULO DE IRSM                           }
  {           Neste campo será demonstrado o total de valores desembolsados pela folha de   }
  {           pagamento funcef a titulo de rubrica irsm inss na competencia selecionada     }
  {           (rubrica na folha:codprovdesc 22704).                                         }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  ( SUBSTR(HST.CODPROVDESC,2,5) = ''22704'' )          ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem4.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem4.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 05 –> TOTAL ADICIONAL 25%                                                          }
  {            Demonstrar o total de valores desembolsados a titulo de INSS(FONTEPAGADORA=2)}
  {            pela folha de pagamento na competência selecionada com o IDPROVENTO igual ao }
  {            do adicional 25% ('30068', '31231', '36033','36034','36035' ,'36036',        }
  {            '36129','36144', '36145', '36193', '36194', '36195', '36218', '36236',       }
  {            '36237',' 36614','36629').                                                   }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  ( (HST.IDRUBRICA) IN (''30068'', ''31231'', ''36033'', '+
          '                        ''36034'', ''36035'', ''36036'', '+
          '                        ''36129'', ''36144'', ''36145'', '+
          '                        ''36193'', ''36194'', ''36195'', '+
          '                        ''36218'', ''36236'', ''36237'') )';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem5.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem5.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 06 –> TOTAL CPMF                                                                   }
  {            Demonstrar o total de valores desembolsados a titulo de INSS(FONTEPAGADORA=2)}
  {            pela folha de pagamento na competência selecionada com o IDPROVENTO da CPMF  }
  {            (CODPROVDESC: '216804','316804','134604','334604').                          }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.CODPROVDESC NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  ( (HST.CODPROVDESC) IN (''216804'', ''316804'', ''116804'', ''416804'', '+
          '                        ''430104'', ''230104'', ''134604'', ''334604'' ) )';
  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem6.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem6.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 07 –> TOTAL SALARIO FAMILIA                                                        }
  {            Demonstrar o total de valores desemboldados a titulo de INSS(FONTEPAGADORA=2)}
  {            pela folha de pagamento na competência selecionada com o IDPROVENTO igual ao }
  {            se salário família ('29887', '30088',' 30431',' 36123',' 36169',' 36214',    }
  {            '37312').                                                                    }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  ( (HST.IDRUBRICA) IN (''29887'', ''30088'', ''30431'', '+
          '                        ''36123'', ''36169'', ''36214'' ) )';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem7.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem7.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 08 –> TOTAL PENSÃO ALIMENTICIA                                                     }
  {            Demonstrar o total de valores desembolsados a titulo de INSS(FONTEPAGADORA=2)}
  {            pela folha de pagamento na competência selecionada com CODPROVDESC:'430404', }
  {            '433404','334504','334304','333404','330404','233404')                       }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  (HST.CODPROVDESC = ''230404'' ) ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem8.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem8.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 09 –> TOTAL DESEMBOLSO APOSENTADORIA INSS                                          }
  {            Demonstrar o total de valores desembolsados a titulo de INSS para benefícios }
  {            de aposentadoria, invalidez(IDBENEFICIO:'148','155','157','158','192','193', }
  {            '195','153','191','254'), FONTEPAGADORA=2.                                   }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST, (SELECT IDPESSOA,    MAX(IDPLANOPREV) AS IDPLANOPREV, '+
          '                          NUMPROCINSS, IDBENEFICIO                      '+
          '                   FROM                                                 '+
          '                     BENEFBFCIARIO                                      '+
	  '	              WHERE                                                '+
          '                     IDSITBENEFICIO <> 4 AND                            '+
          '                     FONTEPAGADORA = 2                                  '+
          '                   GROUP BY                                             '+
          '                     IDPESSOA, NUMPROCINSS, IDBENEFICIO                 '+
          '                  ) BNF '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (BNF.IDBENEFICIO IN (''148'',''155'',''157'',''158'','+
          '                       ''192'',''193'',''195'',''153'','+
          '                       ''191'',''254''))           AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  (HST.IDPESSOA    = BNF.IDPESSOA)                 AND '+
          '  (HST.NUMPROCINSS = BNF.NUMPROCINSS)                  ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem9.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem9.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 10 –> TOTAL DESEMBOLSO PENSÃO INSS                                                 }
  {            Demonstrar o total de valores desembolsados a titulo de INSS para benefícios }
  {            de pensão(IDBENEFICIO: '163','166','168','169','162'), FONTEPAGADORA=2.      }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST, (SELECT IDPESSOA,    MAX(IDPLANOPREV) AS IDPLANOPREV, '+
          '                          NUMPROCINSS, IDBENEFICIO                      '+
          '                   FROM                                                 '+
          '                     BENEFBFCIARIO                                      '+
	  '	              WHERE                                                '+
          '                     IDSITBENEFICIO <> 4 AND                            '+
          '                     FONTEPAGADORA = 2                                  '+
          '                   GROUP BY                                             '+
          '                     IDPESSOA, NUMPROCINSS, IDBENEFICIO                 '+
          '                  ) BNF '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (BNF.IDBENEFICIO IN (''162'',''163'',''166'',''168'','+
          '                       ''169''))           AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) AND '+
          '  (HST.IDPESSOA    = BNF.IDPESSOA)                 AND '+
          '  (HST.NUMPROCINSS = BNF.NUMPROCINSS)                  ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem10.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem10.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

  {-----------------------------------------------------------------------------------------}
  { Item 11 -> TOTAL DESEMBOLSADO A TITULO DE INSS                                          }
  {            Demonstrar o total de valores desembolsados a titulo de INSS pela folha de   }
  {            pagamento na competência selecionada, conforme relatório da GECAP(RELATORIO  }
  {            DE RUBRICAS DO INSS POR VERSÃO DA FOLHA),demonstrando o total geral proventos}
  {            menos o total geral descontos= valor liquido, conforme abaixo:               }
  sSQL := 'SELECT '+
          '  SUM( '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''3'', -HST.VALORPROVENTO, '+
          '       DECODE(SUBSTR(HST.CODPROVDESC,1,1), ''4'', -HST.VALORPROVENTO, HST.VALORPROVENTO)) '+
          '     )  AS VALOR, '+
          '  COUNT( DISTINCT HST.IDPESSOA ) AS QUANTIDADE '+
          'FROM '+
          '  HISTRUBSAL HST '+
          'WHERE '+
          '  (HST.MESCOBRANCA   = '+QuotedStr(psAnoMesRef)+') AND '+
          '  (HST.DATAPAGAMENTO IS NOT NULL)                  AND '+
          '  (HST.FONTEPAGADORA = 2)                          AND '+
          '  (HST.IDMODULO      = 18)                         AND '+
          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)   AND '+
          '  (SUBSTR(HST.CODPROVDESC,3,3) <> ''280'')         AND '+
          '  (HST.IDRUBRICA NOT IN (''36952'',''34325'',''34323'')) ';

  If FazQuery(QryConsulta, sSQL) Then  Begin
    EdVDItem11.Value := QryConsulta.FieldByName('VALOR').AsFloat;
    EdQDItem11.Value := QryConsulta.FieldByName('QUANTIDADE').AsFloat;
  End;

end;

procedure TFrmComparaReembDesemb.CalculaDiferenca;
begin
  {--------------------------------------------------------------------------------------------}
  { Item 14 -> DIFERENCA ENTRE REEMBOLSO E DESEMBOLSO                                          }
  {            Demonstrar a diferença dos valores reembolsados e desembolsados a titulo de     }
  {            proventos INSS(REEMBOLSO-DESEMBOLSO, CASO O RESULTADO NEGATIVO CAMPO DEVERÁ     }
  {            FICAR COM A MARCAÇÃO EM VERMELHO CONFORME CAMPO DA DIFERENCA NA TELA DE EXTRATO }
  {            INDIVIDUAL DO REEMBOLSO), ou seja, o item 13 do reembolso menos o item 11 do    }
  {            desembolso.                                                                     }

  EdVItem14.Value := (EdVRItem14.Value - EdVDItem11.Value );

  EdVItem14.Font.Color := clBlack;
  If EdVItem14.Value < 0 Then EdVItem14.Font.Color := clRed;

End;

function TFrmComparaReembDesemb.ExisteCONCINSS(psMesReferencia: String): Boolean;
Var
  sNomeCampo, sSQL : String;
begin
  Result := False;

  sSQL := 'SELECT MESREFERENCIA FROM CONCINSS '+
          'WHERE MESREFERENCIA = '+QuotedStr(psMesReferencia);

  If Not FazQuery(QryConsulta, sSQL) Then Exit;

  Result := True;

end;



end.