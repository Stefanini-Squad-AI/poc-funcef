// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FParamRecon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery , IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamRecon = class(TfrmOkCancelar)
    dblcGrpProd: TwwDBLookupCombo;
    qryGrpProd: TwwQuery;
    Label1: TLabel;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    dblcUnCusiteo: TwwDBLookupCombo;
    Label4: TLabel;
    qryUnCusteio: TwwQuery;
    procedure FormCreate(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
      Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamRecon: TFrmParamRecon;

implementation

uses DRptRelats, uSistema, uMensErro;

{$R *.DFM}
procedure TFrmParamRecon.FazerQry;
Begin
With DtmRptRelats.qryRecon Do
   Begin
       Close;
       Sql.Clear;
       sql.Add(' SELECT                                ');
       sql.Add('     UN.CODGRUPOPROD,                  ');
       sql.Add('     UN.DESCGRUPOPROD,                 ');
       sql.Add('     UN.STATUSGRUPO,                   ');
       sql.Add('     UN.DESCPROD,                      ');
       sql.Add('     UN.CODARTIGO,                     ');
       sql.Add('     UN.RECFORN,                       ');
       sql.Add('     UN.DEVFORN,                       ');
       sql.Add('     UN.BAITRANS,                      ');
       sql.Add('     UN.ENTTRANS,                      ');
       sql.Add('     UN.BAIACERTO,                     ');
       sql.Add('     UN.BAIESTRAGO,                    ');
       sql.Add('     UN.BAIXACC,                       ');
       sql.Add('     UN.SALDOATUAL,                    ');
       sql.Add('     UN.SALDOINI,                      ');
       sql.Add('     SUM(UN.TRECFORN),                 ');
       sql.Add('     SUM(UN.TDEVFORN),                 ');
       sql.Add('     SUM(UN.TBAITRANS),                ');
       sql.Add('     SUM(UN.TENTTRANS),                ');
       sql.Add('     SUM(UN.TBAIACERTO),               ');
       sql.Add('     SUM(UN.TBAIESTRAGO),              ');
       sql.Add('     SUM(UN.TBAIXACC),                 ');
       sql.Add('     SUM(UN.TSALDOATUAL),              ');
       sql.Add('     SUM(UN.TSALDOINI)                 ');
       sql.Add(' FROM ');
       sql.Add(' ( SELECT                   ');
       sql.Add('        G.CODGRUPOPROD,    ');
       sql.Add('        G.DESCGRUPOPROD,   ');
       sql.Add('        G.STATUSGRUPO,     ');
       sql.Add('        P.DESCPROD,        ');
       sql.Add('        M.CODARTIGO,       ');
       sql.Add('        SUM(DECODE(M.CODTIPoMov,''A'',M.VALORMOV,0 )) AS RECFORN,          ');
       sql.Add('        SUM(DECODE(M.CODTIPoMov,''K'',M.VALORMOV,0 )) AS DEVFORN,          ');
       sql.Add('        SUM(DECODE(M.CODTIPoMov,''F'',M.VALORMOV,                          ');
       sql.Add('                                ''T'',M.VALORMOV,                          ');
       sql.Add('                                ''G'',M.VALORMOV,                          ');
       sql.Add('                                ''U'',M.VALORMOV,                          ');
       sql.Add('                                ''R'',M.VALORMOV,0 )) AS BAITRANS,         ');
       sql.Add('        sum(Decode(M.CodTipoMov,''S'',M.VALORMOV,                          ');
       sql.Add('                                ''B'',M.VALORMOV,0 )) AS ENTTRANS,         ');
       sql.Add('        sum(Decode(M.CodTipoMov,''H'',M.VALORMOV,                          ');
       sql.Add('                                ''D'',M.VALORMOV,0 )) AS BAIACERTO,        ');
       sql.Add('        sum(Decode(M.CodTipoMov,''I'',M.VALORMOV,0 )) AS BAIESTRAGO,       ');
       sql.Add('        sum(Decode(M.CodTipoMov,''M'',M.VALORMOV,                          ');
       sql.Add('                                ''N'',M.VALORMOV,                          ');
       sql.Add('                                ''L'',M.VALORMOV,                          ');
       sql.Add('                                ''Q'',M.VALORMOV,                          ');
       sql.Add('                                ''J'',M.VALORMOV,                          ');
       sql.Add('                                ''A'',M.VALORMOV,                          ');
       sql.Add('                                ''C'',M.VALORMOV,                          ');
       sql.Add('                                ''V'',M.VALORMOV,                          ');
       sql.Add('                                ''X'',M.VALORMOV,                          ');
       sql.Add('                                ''W'',M.VALORMOV,                          ');
       sql.Add('                                ''B'',M.VALORMOV,                          ');
       sql.Add('                                ''O'',M.VALORMOV,                          ');
       sql.Add('                                ''E'',M.VALORMOV,                          ');
       sql.Add('                                ''P'',M.VALORMOV,                          ');
       sql.Add('                                ''Y'',M.VALORMOV,0 )) AS BAIXACC,          ');
       sql.Add('        DECODE(SUM(SALDINI.SALDO),NULL,SUM(M.VALORMOV*(-1)),( SALDINI.SALDO - SUM(M.VALORMOV*(-1))) ) AS SaldoAtual, ');
       sql.Add('        DECODE(SALDINI.SALDO,NULL,0,SALDINI.SALDO) as SaldoIni,           ');
       sql.Add('       (0) AS TRECFORN,                                                   ');
       sql.Add('       (0) AS TDEVFORN,                                                   ');
       sql.Add('       (0) AS TBaiTrans,                                                  ');
       sql.Add('       (0) AS TEntTrans,                                                  ');
       sql.Add('       (0) AS TBaiAcerto,                                                 ');
       sql.Add('       (0) AS TBaiEstrago,                                                ');
       sql.Add('       (0) AS TBaixaCC,                                                   ');
       sql.Add('       (0) AS TSALDOATUAL,                                                ');
       sql.Add('       (0) AS TSALDOINI                                                   ');
       sql.Add(' FROM              ');
       sql.Add('      MOVIMENT M,  ');
       sql.Add('      GRUPPROD G,  ');
       sql.Add('      PRODUTO P,   ');
       sql.Add('      ARTIGO A,    ');
       sql.Add('      ( SELECT     ');
       sql.Add('               M.CODARTIGO,    ');
       sql.Add('               (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS SALDO ');
       sql.Add('         FROM                                    ');
       sql.Add('              MOVIMENT M,                        ');
       sql.Add('              ( SELECT                           ');
       sql.Add('                      M.CODARTIGO,               ');
       sql.Add('                      MAX(M.IDMOV) AS IDMOV      ');
       sql.Add('                 FROM                            ');
       sql.Add('                      MOVIMENT M,                ');
       sql.Add('                     (SELECT                     ');
       sql.Add('                           CODARTIGO,            ');
       sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV ');
       sql.Add('                      FROM MOVIMENT                   ');
       sql.Add('                      WHERE  ( DATAMOV <= TO_DATE('''+DateToStr(EdDataI.Date-1)+''',''DD/MM/YYYY'') )');
       sql.Add('                      GROUP BY CODARTIGO ');
       sql.Add('                     ) SUB ');
       sql.Add('                WHERE (M.CODARTIGO = SUB.CODARTIGO)');
       sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV) ');
       sql.Add('                GROUP BY M.CODARTIGO ) AUX ');
       sql.Add('         WHERE ');
       sql.Add('              (M.CODARTIGO = AUX.CODARTIGO) ');
       sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) SALDINI ');
       sql.Add('WHERE ');
       sql.Add('       (M.DATAMOV  >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
       sql.Add('   AND (M.DATAMOV  <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
       sql.Add('   AND (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM ALMOX WHERE (CODCUSTEIO = '+ dblcUnCusiteo.LookUpValue +')) ) ');
       sql.Add('   AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')  ');
       sql.Add('   AND (M.CODARTIGO  = A.CODARTIGO) ');
       sql.Add('   AND (A.CODPRODUTO = P.CODPRODUTO) ');
       sql.Add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD)  ');
       sql.Add('   AND (SALDINI.CODARTIGO(+) = M.CODARTIGO)  ');
       sql.Add('GROUP BY               ');
       sql.Add('       G.CODGRUPOPROD, ');
       sql.Add('       G.DESCGRUPOPROD,');
       sql.Add('       G.STATUSGRUPO,  ');
       sql.Add('       P.DESCPROD,     ');
       sql.Add('       M.CODARTIGO,    ');
       sql.Add('       SALDINI.SALDO   ');
       sql.Add('UNION                  ');
       sql.Add('SELECT                 ');
       sql.Add('      G.CODGRUPOPROD,   ');
       sql.Add('      G.DESCGRUPOPROD,  ');
       sql.Add('      G.STATUSGRUPO,    ');
       sql.Add('      ('''') AS DESCPROD, ');
       sql.Add('      ('''') AS CODARTIGO,');
       sql.Add('      (0) AS RECFORN,     ');
       sql.Add('      (0) AS DEVFORN,     ');
       sql.Add('      (0) AS BAITRANS,    ');
       sql.Add('      (0) AS ENTTRANS,    ');
       sql.Add('      (0) AS BAIACERTO,   ');
       sql.Add('      (0) AS BAIESTRAGO,  ');
       sql.Add('      (0) AS BAIXACC,     ');
       sql.Add('      (0) AS SALDOATUAL,  ');
       sql.Add('      (0) AS SALDOINI,    ');
       sql.Add('      TOT.TRECFORN,       ');
       sql.Add('      TOT.TDEVFORN,       ');
       sql.Add('      TOT.TBaiTrans,      ');
       sql.Add('      TOT.TEntTrans,      ');
       sql.Add('      TOT.TBaiAcerto,     ');
       sql.Add('      TOT.TBaiEstrago,    ');
       sql.Add('      TOT.TBaixaCC,       ');
       sql.Add('      TOT.TSALDOATUAL,    ');
       sql.Add('      TOT.TSALDOINI       ');
       sql.Add('FROM                      ');
       sql.Add('     (SELECT              ');
       sql.Add('            P.CODGRUPOPROD ');
       sql.Add('      FROM              ');
       sql.Add('            MOVIMENT M, ');
       sql.Add('            PRODUTO P,  ');
       sql.Add('            ARTIGO A    ');
       sql.Add('      WHERE             ');
       sql.Add('            (M.DATAMOV  >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
       sql.Add('        AND (M.DATAMOV  <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
       sql.Add('        AND (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM ALMOX WHERE (CODCUSTEIO = '+dblcUnCusiteo.LookUpValue +')) ) ');
       sql.Add('        AND (M.IDPESSOA = ' + INTTOStr(Sistema.IdEmpresa) + ') ');
       sql.Add('        AND (M.CODARTIGO = A.CODARTIGO) ');
       sql.Add('        AND (A.CODPRODUTO = P.CODPRODUTO) ) AUX, ');
       sql.Add('       (SELECT                   ');
       sql.Add('              P.CODGRUPOPROD,    ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''A'',M.VALORMOV,0 )) AS TRECFORN,         ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''K'',M.VALORMOV,0 )) AS TDEVFORN,         ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''F'',M.VALORMOV,                          ');
       sql.Add('                                      ''T'',M.VALORMOV,                          ');
       sql.Add('                                      ''G'',M.VALORMOV,                          ');
       sql.Add('                                      ''U'',M.VALORMOV,                          ');
       sql.Add('                                      ''R'',M.VALORMOV,0 )) AS TBAITRANS,        ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''S'',M.VALORMOV,                          ');
       sql.Add('                                      ''B'',M.VALORMOV,0 )) AS TENTTRANS,        ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''H'',M.VALORMOV,                          ');
       sql.Add('                                      ''D'',M.VALORMOV,0 )) AS TBAIACERTO,       ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''I'',M.VALORMOV,0 )) AS TBAIESTRAGO,      ');
       sql.Add('              SUM(DECODE(M.CODTIPOMOV,''M'',M.VALORMOV,                          ');
       sql.Add('                                      ''N'',M.VALORMOV,                          ');
       sql.Add('                                      ''L'',M.VALORMOV,                          ');
       sql.Add('                                      ''Q'',M.VALORMOV,                          ');
       sql.Add('                                      ''J'',M.VALORMOV,                          ');
       sql.Add('                                      ''A'',M.VALORMOV,                          ');
       sql.Add('                                      ''C'',M.VALORMOV,                          ');
       sql.Add('                                      ''V'',M.VALORMOV,                          ');
       sql.Add('                                      ''X'',M.VALORMOV,                          ');
       sql.Add('                                      ''W'',M.VALORMOV,                          ');
       sql.Add('                                      ''B'',M.VALORMOV,                          ');
       sql.Add('                                      ''O'',M.VALORMOV,                          ');
       sql.Add('                                      ''E'',M.VALORMOV,                          ');
       sql.Add('                                      ''P'',M.VALORMOV,                          ');
       sql.Add('                                      ''Y'',M.VALORMOV,0 )) AS TBAIXACC,         ');
       sql.Add('               DECODE(SALDINI.SALDO,NULL,SUM(M.VALORMOV*(-1)),(SALDINI.SALDO- SUM(M.VALORMOV*(-1)) ) ) AS TSaldoAtual, ');
       sql.Add('               DECODE(SALDINI.SALDO,NULL,0,SALDINI.SALDO)  as TSaldoIni     ');
       sql.Add('       FROM    ');
       sql.Add('            MOVIMENT M, ');
       sql.Add('            PRODUTO P,  ');
       sql.Add('            ARTIGO A,  ');
       sql.Add('                   (SELECT M.CODARTIGO, ');
       sql.Add('                          (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS SALDO ');
       sql.Add('                    FROM MOVIMENT M ');
       sql.Add('                    WHERE (M.IDMOV IN (SELECT MAX(IDMOV) FROM MOVIMENT WHERE ( CODARTIGO = M.CODARTIGO)  AND (DATAMOV < TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY'') ) ) ) ');
       sql.Add('                    ) SALDINI ');
       sql.Add('       WHERE                  ');
       sql.Add('              (M.DATAMOV  >= TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY'')) ');
       sql.Add('          AND (M.DATAMOV  <= TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY'')) ');
       sql.Add('          AND (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM ALMOX WHERE (CODCUSTEIO = '+ dblcUnCusiteo.LookUpValue +')) ) ');
       sql.Add('          AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')  ');
       sql.Add('          AND (M.CODARTIGO = A.CODARTIGO) ');
       sql.Add('          AND (A.CODPRODUTO = P.CODPRODUTO) ');
       sql.Add('          AND (SALDINI.CODARTIGO(+) = M.CODARTIGO)  ');
       sql.Add('       GROUP BY P.CODGRUPOPROD, SALDINI.SALDO ) TOT,');
       sql.Add('       GRUPPROD G        ');
       sql.Add('WHERE ');
       sql.Add('      (G.STATUSGRUPO = ''S'') ');
       sql.Add('  AND (AUX.CODGRUPOPROD LIKE RTRIM(G.CODGRUPOPROD) || ''%'') ');
       sql.Add('  AND (TOT.CODGRUPOPROD LIKE RTRIM(G.CODGRUPOPROD) || ''%'') ');
       sql.Add(' ) UN ');
       If Trim(dblcGrpProd.Text) <> '' Then
           sql.Add('WHERE (UN.CODGRUPOPROD LIKE '''+ Trim(dblcGrpProd.LookUpValue) +''' || ''%'')');
       sql.Add('  GROUP BY               ');
       sql.Add('     UN.CODGRUPOPROD,    ');
       sql.Add('     UN.DESCGRUPOPROD,   ');
       sql.Add('     UN.STATUSGRUPO,     ');
       sql.Add('     UN.DESCPROD,        ');
       sql.Add('     UN.CODARTIGO,       ');
       sql.Add('     UN.RECFORN,         ');
       sql.Add('     UN.DEVFORN,         ');
       sql.Add('     UN.BAITRANS,        ');
       sql.Add('     UN.ENTTRANS,        ');
       sql.Add('     UN.BAIACERTO,       ');
       sql.Add('     UN.BAIESTRAGO,      ');
       sql.Add('     UN.BAIXACC,         ');
       sql.Add('     UN.SALDOATUAL,      ');
       sql.Add('     UN.SALDOINI         ');
       //Sql.SaveToFile('c:\chabu.sql');
       Sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\chabu.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
       Open;
   End;
    DtmRptRelats.lbAlmox3.Caption := dblcUnCusiteo.Text;
    DtmRptRelats.lbPer3.Caption   := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';

End;
procedure TFrmParamRecon.FormCreate(Sender: TObject);
begin
  inherited;
  qryUncusteio.Close;
  qryUncusteio.Params[0].asInteger := Sistema.IdEmpresa;
  qryUncusteio.Open;
  //
  qryGrpProd.Close;
  qryGrpProd.Params[0].asInteger   := Sistema.IdEmpresa;
  qryGrpProd.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TFrmParamRecon.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcUnCusiteo.Text) = '' Then
    Begin
        MsgDlg('Unidade de Custeio não preenchido','Erro',mtError,[mbOk],0);
        dblcUnCusiteo.SetFocus;
    End
  Else
    FazerQry;
end;

end.

