//inicio andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamAjustFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery;

type
  TfrmParamAjustFinanc = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    Label3: TLabel;
    dblcUnCusteio: TwwDBLookupCombo;
    qryUnCusteio: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  frmParamAjustFinanc: TfrmParamAjustFinanc;

implementation

{$R *.DFM}

Uses DRptRelats, uMensErro;

procedure TfrmParamAjustFinanc.FazRel;
begin
   DtmRptRelats.lbPer.Caption      := ' De '+edDataI.Text+' a '+edDataF.Text+' ';
   DtmRptRelats.LbUnidCust.Caption := dblcUnCusteio.Text;
   With dtmRptRelats.qryAjustFinanc Do
      Begin
          Close;
          Sql.Clear;
          Sql.Append(' SELECT                                                      ');
          Sql.Append('     A.CODALMOXARIFADO,                                      ');
          Sql.Append('     A.DESCALMOX,                                            ');
          Sql.Append('     AR.CODARTIGO,                                           ');
          Sql.Append('     P.DESCPROD,                                             ');
          Sql.Append('     SUM(NVL(U.VALANT,0)) AS VALANT,                         ');
          Sql.Append('     SUM(NVL(U.VALCOMPRA,0)) AS VALCOMPRA,                   ');
          Sql.Append('     SUM(NVL(U.VALREQ,0)) AS VALREQ,                         ');
          Sql.Append('     SUM(NVL(U.VALATUAL,0)) AS VALATUAL,                     ');
          Sql.Append('     (SUM(NVL(U.VALANT,0))+SUM(NVL(U.VALCOMPRA,0))-          ');
          Sql.Append('     SUM(NVL(U.VALREQ,0))-SUM(NVL(U.VALATUAL,0))) AS AJUSTE  ');
          Sql.Append(' FROM                                                        ');
          Sql.Append('     ALMOX A, ARTIGO AR, PRODUTO P,                          ');
          Sql.Append('     ((SELECT                                                ');
          Sql.Append('          VA.CODALMOXARIFADO, VA.CODARTIGO,                  ');
          Sql.Append('          SUM(VA.VALOR) AS VALANT,                           ');
          Sql.Append('          0 AS VALATUAL,                                     ');
          Sql.Append('          0 AS VALREQ,                                       ');
          Sql.Append('          0 AS VALCOMPRA                                     ');
          Sql.Append('     FROM                                                    ');
          Sql.Append('     (                                                       ');
          Sql.Append('     SELECT                                                  ');
          Sql.Append('           M.CODALMOXARIFADO,                                ');
          Sql.Append('           M.CODARTIGO,                                      ');
          Sql.Append('          (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALOR        ');
          Sql.Append('      FROM                                                   ');
          Sql.Append('          MOVIMENT M,                                        ');
          Sql.Append('          ( SELECT                                           ');
          Sql.Append('      	    M.CODALMOXARIFADO,                             ');
          Sql.Append('                  M.CODARTIGO,                               ');
          Sql.Append('                  MAX(M.IDMOV) AS IDMOV                      ');
          Sql.Append('            FROM                                             ');
          Sql.Append('               MOVIMENT M,                                   ');
          Sql.Append('               (                                             ');
          Sql.Append('                SELECT                                       ');
          Sql.Append('                     CODALMOXARIFADO,                        ');
          Sql.Append('                     CODARTIGO,                              ');
          Sql.Append('                     MAX(DATAMOV) AS DATAMOV                 ');
          Sql.Append('                FROM MOVIMENT                                ');
          Sql.Append('                WHERE                                        ');
          Sql.Append('                    (DATAMOV < TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'')) ');
          Sql.Append('                GROUP BY CODALMOXARIFADO, CODARTIGO          ');
          Sql.Append('                ) SUB1                                       ');
          Sql.Append('            WHERE                                            ');
          Sql.Append('                 (M.CODARTIGO       = SUB1.CODARTIGO)        ');
          Sql.Append('             AND (M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO)  ');
          Sql.Append('             AND (M.DATAMOV         = SUB1.DATAMOV)          ');
          Sql.Append('             GROUP BY M.CODALMOXARIFADO, M.CODARTIGO         ');
          Sql.Append('            ) AUX                                            ');
          Sql.Append('      WHERE                                                  ');
          Sql.Append('           (M.CODARTIGO       = AUX.CODARTIGO)               ');
          Sql.Append('       AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)         ');
          Sql.Append('       AND (M.IDMOV           = AUX.IDMOV)                   ');
          Sql.Append('     ) VA                                                    ');
          Sql.Append('     GROUP BY VA.CODALMOXARIFADO, VA.CODARTIGO )             ');
          Sql.Append('     UNION ALL                                               ');
          Sql.Append('     (SELECT                                                 ');
          Sql.Append('          VA.CODALMOXARIFADO, VA.CODARTIGO,                  ');
          Sql.Append('          0 AS VALANT,                                       ');
          Sql.Append('          SUM(VA.VALOR) AS VALATUAL,                         ');
          Sql.Append('          0 AS VALREQ,                                       ');
          Sql.Append('          0 AS VALCOMPRA                                     ');
          Sql.Append('     FROM                                                    ');
          Sql.Append('     (                                                       ');
          Sql.Append('     SELECT                                                  ');
          Sql.Append('           M.CODALMOXARIFADO,                                ');
          Sql.Append('           M.CODARTIGO,                                      ');
          Sql.Append('          (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALOR        ');
          Sql.Append('      FROM                                                   ');
          Sql.Append('          MOVIMENT M,                                        ');
          Sql.Append('          ( SELECT                                           ');
          Sql.Append('      	    M.CODALMOXARIFADO,                             ');
          Sql.Append('                  M.CODARTIGO,                               ');
          Sql.Append('                  MAX(M.IDMOV) AS IDMOV                      ');
          Sql.Append('            FROM                                             ');
          Sql.Append('               MOVIMENT M,                                   ');
          Sql.Append('               (                                             ');
          Sql.Append('                SELECT                                       ');
          Sql.Append('                     CODALMOXARIFADO,                        ');
          Sql.Append('                     CODARTIGO,                              ');
          Sql.Append('                     MAX(DATAMOV) AS DATAMOV                 ');
          Sql.Append('                FROM MOVIMENT                                ');
          Sql.Append('                WHERE                                        ');
          Sql.Append('                    (DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'')) ');
          Sql.Append('                GROUP BY CODALMOXARIFADO, CODARTIGO          ');
          Sql.Append('                ) SUB1                                       ');
          Sql.Append('            WHERE                                            ');
          Sql.Append('                 (M.CODARTIGO       = SUB1.CODARTIGO)        ');
          Sql.Append('             AND (M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO)  ');
          Sql.Append('             AND (M.DATAMOV         = SUB1.DATAMOV)          ');
          Sql.Append('             GROUP BY M.CODALMOXARIFADO, M.CODARTIGO         ');
          Sql.Append('            ) AUX                                            ');
          Sql.Append('      WHERE                                                  ');
          Sql.Append('           (M.CODARTIGO       = AUX.CODARTIGO)               ');
          Sql.Append('       AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)         ');
          Sql.Append('       AND (M.IDMOV           = AUX.IDMOV)                   ');
          Sql.Append('     ) VA                                                    ');
          Sql.Append('     GROUP BY VA.CODALMOXARIFADO, VA.CODARTIGO )             ');
          Sql.Append('     UNION ALL                                               ');
          Sql.Append('     (SELECT                                                 ');
          Sql.Append('           CODALMOXARIFADO, CODARTIGO,                       ');
          Sql.Append('           0 AS VALANT,                                      ');
          Sql.Append('           0 AS VALATUAL,                                    ');
          Sql.Append('           0 AS VALREQ,                                      ');
          Sql.Append('           SUM(round(VALORMOV, 2)) AS VALCOMPRA                        ');
          Sql.Append('      FROM                                                   ');
          Sql.Append('          MOVIMENT                                           ');
          Sql.Append('      WHERE                                                  ');
          Sql.Append('            (DATAMOV >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))  ');
          Sql.Append('        AND (DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))  ');
          Sql.Append('        AND ((CODTIPOMOV = ''K'') OR (CODTIPOMOV = ''A'') OR (CODTIPOMOV = ''B'') OR (CODTIPOMOV = ''Z'')) ');
          Sql.Append('      GROUP BY CODALMOXARIFADO, CODARTIGO   ');
          Sql.Append('     ) UNION ALL                            ');
          Sql.Append('     (SELECT                                ');
          Sql.Append('           CODALMOXARIFADO, CODARTIGO,      ');
          Sql.Append('           0 AS VALANT,                     ');
          Sql.Append('           0 AS VALATUAL,                   ');
          Sql.Append('           SUM(round(VALORMOV, 2))*-1 AS VALREQ,      ');
          Sql.Append('           0 AS VALCOMPRA                   ');
          Sql.Append('      FROM                                  ');
          Sql.Append('          MOVIMENT                          ');
          Sql.Append('      WHERE                                 ');
          Sql.Append('            (DATAMOV >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))  ');
          Sql.Append('        AND (DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))  ');
          Sql.Append('        AND ((CODTIPOMOV <> ''K'') AND (CODTIPOMOV <> ''A'') AND (CODTIPOMOV <> ''Z'') AND (CODTIPOMOV <> ''B''))');
          Sql.Append('      GROUP BY CODALMOXARIFADO, CODARTIGO ');
          Sql.Append('     ) ) U                                ');
          Sql.Append(' WHERE                                       ');
          Sql.Append('       (A.CODCUSTEIO =  '+dblcUnCusteio.LookupValue+' )');
          Sql.Append('   AND (A.CODALMOXARIFADO = U.CODALMOXARIFADO)  ');
          Sql.Append('   AND (AR.CODARTIGO = U.CODARTIGO)             ');
          Sql.Append('   AND (AR.CODPRODUTO = P.CODPRODUTO)           ');
          Sql.Append('GROUP BY      A.CODALMOXARIFADO,                ');
          Sql.Append('     A.DESCALMOX,                               ');
          Sql.Append('     AR.CODARTIGO,                              ');
          Sql.Append('     P.DESCPROD                                 ');
          Sql.Append('HAVING                                          ');

          Sql.Append('     ((SUM(NVL(U.VALANT,0))+SUM(NVL(U.VALCOMPRA,0))-         ');
          Sql.Append('     SUM(NVL(U.VALREQ,0))-SUM(NVL(U.VALATUAL,0))) <> 0)     ');

          Sql.Append('                                                              ');
          Sql.Append(' ORDER BY A.DESCALMOX,P.DESCPROD  ');

          Open;
      End;
end;

procedure TfrmParamAjustFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  qryUnCusteio.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TfrmParamAjustFinanc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
If Trim(dblcUnCusteio.Text) = '' Then
     Begin
        MsgDlg('Unidade de Custeio não preenchido','Erro',mtError,[mbOk],0 );
        dblcUnCusteio.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de Início não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If (edDataI.Date  > edDataF.Date ) Then
     Begin
        MsgDlg('Data de inicio não pode ser maior que a data final','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
    Begin
        ModalResult := mrOK;
        FazRel;
    End;
end;

end.
