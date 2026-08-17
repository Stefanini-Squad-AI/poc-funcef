unit FParamReconSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamReconSaldo = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    qryGrpProd: TwwQuery;
    Label1: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    chkimp: TCheckBox;
    chkEstoque: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamReconSaldo: TFrmParamReconSaldo;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uModulo, DRptRelats;

procedure TFrmParamReconSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpProd.Close;
  qryGrpProd.Params[0].asInteger := Sistema.IdEmpresa;
  qryGrpProd.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].asInteger   := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

Procedure TFrmParamReconSaldo.FazQry;
Begin
    With DtmRptRelats.qryReconSaldo Do
       Begin
           Close;
           Sql.Clear;
         Sql.Add('SELECT                                         ');
         Sql.Add('      UN.CODGRUPOPROD,                         ');
         Sql.Add('      UN.DESCGRUPOPROD,                        ');
         Sql.Add('      UN.STATUSGRUPO,                          ');
         Sql.Add('      UN.CODARTIGO,                            ');
         Sql.Add('      UN.DESCPROD,                             ');
         Sql.Add('      SUM(UN.SALDOINI) AS SALDOINI,            ');
         Sql.Add('      SUM(UN.SALDOFIM) AS SALDOATUAL,          ');
         Sql.Add('      SUM(UN.RECFORN) AS RECFORN,              ');
         Sql.Add('      SUM(UN.DEVFORN)*-1 AS DEVFORN,           ');
         Sql.Add('      SUM(UN.BAITRANS)*-1 AS BAITRANS,         ');
         Sql.Add('      SUM(UN.ENTTRANS) AS ENTTRANS,            ');
         Sql.Add('      SUM(UN.BAIACERTO)*-1 AS BAIACERTO,       ');
         Sql.Add('      SUM(UN.BAIESTRAGO)*-1 AS BAIESTRAGO,     ');
         Sql.Add('      SUM(UN.BAIXACC)*-1 AS BAIXACC,           ');
         Sql.Add('      (SUM(UN.SALDOINI)-SUM(UN.SALDOFIM)+      ');
         Sql.Add('       SUM(UN.RECFORN)+SUM(UN.DEVFORN)+        ');
         Sql.Add('       SUM(UN.BAITRANS)+SUM(UN.ENTTRANS)+      ');
         Sql.Add('       SUM(UN.BAIACERTO)+SUM(UN.BAIESTRAGO)+   ');
         Sql.Add('       SUM(UN.BAIXACC)) AS AJUSTE              ');
         Sql.Add('FROM                                           ');
         Sql.Add('(                                              ');
         Sql.Add('( SELECT                                       ');
         Sql.Add('      P.CODGRUPOPROD,                          ');
         Sql.Add('      G.DESCGRUPOPROD,                         ');
         Sql.Add('      G.STATUSGRUPO,                           ');
         Sql.Add('      MOV.CODARTIGO,                           ');
         Sql.Add('      P.DESCPROD,                              ');
         Sql.Add('      (MOV.SALDOQTDEMOV ) AS SALDOINI, ');
         Sql.Add('      (0) AS SALDOFIM,                                    ');
         Sql.Add('      (0) AS RECFORN,                                     ');
         Sql.Add('      (0) AS DEVFORN,                                     ');
         Sql.Add('      (0) AS BAITRANS,                                    ');
         Sql.Add('      (0) AS ENTTRANS,                                    ');
         Sql.Add('      (0) AS BAIACERTO,                                   ');
         Sql.Add('      (0) AS BAIESTRAGO,                                  ');
         Sql.Add('      (0) AS BAIXACC                                      ');
         Sql.Add(' FROM                                                     ');
         Sql.Add('      PRODUTO P,                                          ');
         Sql.Add('      ARTIGO A,                                           ');
         Sql.Add('      GRUPPROD G,                                         ');
         Sql.Add('      ( SELECT                                            ');
         Sql.Add('               M.IDMOV,                                   ');
         Sql.Add('               M.CODARTIGO,                               ');
         Sql.Add('               M.SALDOQTDEMOV,                            ');
         Sql.Add('               M.CUSTOMEDIOMOV,                           ');
         Sql.Add('               M.CODALMOXARIFADO,                         ');
         Sql.Add('               M.IDPESSOA                                 ');
         Sql.Add('         FROM                                             ');
         Sql.Add('              MOVIMENT M,                                 ');
         Sql.Add('              ( SELECT                                    ');
         Sql.Add('                      M.CODARTIGO,                        ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV               ');
         Sql.Add('                 FROM                                     ');
         Sql.Add('                      MOVIMENT M,                         ');
         Sql.Add('                     (SELECT                              ');
         Sql.Add('                           CODARTIGO,                     ');
         Sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV     ');
         Sql.Add('                      FROM MOVIMENT                       ');
         Sql.Add('                      WHERE  ( DATAMOV < TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('                         AND (CODALMOXARIFADO  = '+dblcAlmox.LookupValue +') ');
         Sql.Add('                      GROUP BY CODARTIGO ');
         Sql.Add('                     ) SUB                                ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)       ');
         Sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV)         ');
         Sql.Add('                  AND (M.CODALMOXARIFADO ='+dblcAlmox.LookupValue +')');
         Sql.Add('                GROUP BY M.CODARTIGO ) AUX                ');
         Sql.Add('         WHERE                                            ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)               ');
         Sql.Add('          AND (M.CODALMOXARIFADO ='+dblcAlmox.LookupValue +') ');
         Sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) MOV                 ');
         Sql.Add(' WHERE                                                    ');
         Sql.Add('         (MOV.CODALMOXARIFADO = '+dblcAlmox.LookupValue +')');
         Sql.Add('     And (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' )');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (MOV.CODARTIGO = A.CODARTIGO)                     ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
         Sql.Add('     AND (G.CODGRUPOPROD = P.CODGRUPOPROD) )              ');
         Sql.Add('UNION ALL                                                 ');
         Sql.Add('( SELECT                                                  ');
         Sql.Add('      P.CODGRUPOPROD,                                     ');
         Sql.Add('      G.DESCGRUPOPROD,                                    ');
         Sql.Add('      G.STATUSGRUPO,                                      ');
         Sql.Add('      M.CODARTIGO,                                        ');
         Sql.Add('      P.DESCPROD,                                         ');
         Sql.Add('      (0) AS SALDOINI,                                    ');
         Sql.Add('      (0) AS SALDOFIM,                                    ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''A'',M.QTDEMOV,0 )) AS RECFORN,   ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''K'',M.QTDEMOV,0 )) AS DEVFORN,   ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''F'',M.QTDEMOV,                   ');
         Sql.Add('                             ''T'',M.QTDEMOV,                   ');
         Sql.Add('                             ''G'',M.QTDEMOV,                   ');
         Sql.Add('                             ''U'',M.QTDEMOV,                   ');
         Sql.Add('                             ''R'',M.QTDEMOV,0 )) AS BAITRANS,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''S'',M.QTDEMOV,                   ');
         Sql.Add('                             ''B'',M.QTDEMOV,0 )) AS ENTTRANS,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''H'',M.QTDEMOV,                   ');
         Sql.Add('                             ''D'',M.QTDEMOV,0 )) AS BAIACERTO, ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''I'',M.QTDEMOV,0 )) AS BAIESTRAGO,');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''M'',M.QTDEMOV,                   ');
         Sql.Add('                             ''N'',M.QTDEMOV,                   ');
         Sql.Add('                             ''L'',M.QTDEMOV,                   ');
         Sql.Add('                             ''Q'',M.QTDEMOV,                   ');
         Sql.Add('                             ''J'',M.QTDEMOV,                   ');
         Sql.Add('                             ''V'',M.QTDEMOV,                   ');
         Sql.Add('                             ''X'',M.QTDEMOV,                   ');
         Sql.Add('                             ''W'',M.QTDEMOV,                   ');
         Sql.Add('                             ''O'',M.QTDEMOV,                   ');
         Sql.Add('                             ''E'',M.QTDEMOV,                   ');
         Sql.Add('                             ''P'',M.QTDEMOV,                   ');
         Sql.Add('                             ''Y'',M.QTDEMOV,0 )) AS BAIXACC    ');
         Sql.Add(' FROM                                                          ');
         Sql.Add('      PRODUTO P,                                               ');
         Sql.Add('      ARTIGO A,                                                ');
         Sql.Add('      GRUPPROD G,                                              ');
         Sql.Add('      MOVIMENT M                                               ');
         Sql.Add(' WHERE                                                         ');
         Sql.Add('         (M.CODALMOXARIFADO = '+dblcAlmox.LookupValue +')      ');
         Sql.Add('     And (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')        ');
         Sql.Add('     AND (M.DATAMOV >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('     AND (M.DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'') ) ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('     AND (M.CODARTIGO = A.CODARTIGO)                           ');
         Sql.Add('     AND (A.CODPRODUTO = P.CODPRODUTO)                         ');
         Sql.Add('     AND (G.CODGRUPOPROD = P.CODGRUPOPROD)                     ');
         Sql.Add(' GROUP BY                                                      ');
         Sql.Add('      P.CODGRUPOPROD,                                          ');
         Sql.Add('      G.DESCGRUPOPROD,                                         ');
         Sql.Add('      G.STATUSGRUPO,                                           ');
         Sql.Add('      M.CODARTIGO,                                             ');
         Sql.Add('      P.DESCPROD)                                              ');
         Sql.Add('UNION ALL                                                      ');
         Sql.Add('( SELECT                                                       ');
         Sql.Add('      P.CODGRUPOPROD,                                          ');
         Sql.Add('      G.DESCGRUPOPROD,                                         ');
         Sql.Add('      G.STATUSGRUPO,                                           ');
         Sql.Add('      MOV.CODARTIGO,                                           ');
         Sql.Add('      P.DESCPROD,                                              ');
         Sql.Add('      (0) AS SALDOINI,                                         ');
         Sql.Add('      (MOV.SALDOQTDEMOV ) AS SALDOFIM,      ');
         Sql.Add('      (0) AS RECFORN,                                          ');
         Sql.Add('      (0) AS DEVFORN,                                          ');
         Sql.Add('      (0) AS BAITRANS,                                         ');
         Sql.Add('      (0) AS ENTTRANS,                                         ');
         Sql.Add('      (0) AS BAIACERTO,                                        ');
         Sql.Add('      (0) AS BAIESTRAGO,                                       ');
         Sql.Add('      (0) AS BAIXACC                                           ');
         Sql.Add(' FROM                                                          ');
         Sql.Add('      PRODUTO P,                                               ');
         Sql.Add('      ARTIGO A,                                                ');
         Sql.Add('      GRUPPROD G,                                              ');
         Sql.Add('      ( SELECT                                                 ');
         Sql.Add('               M.IDMOV,                                        ');
         Sql.Add('               M.CODARTIGO,                                    ');
         Sql.Add('               M.SALDOQTDEMOV,                                 ');
         Sql.Add('               M.CUSTOMEDIOMOV,                                ');
         Sql.Add('               M.CODALMOXARIFADO,                              ');
         Sql.Add('               M.IDPESSOA                                      ');
         Sql.Add('         FROM                                                  ');
         Sql.Add('              MOVIMENT M,                                      ');
         Sql.Add('              ( SELECT                                         ');
         Sql.Add('                      M.CODARTIGO,                             ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV                    ');
         Sql.Add('                 FROM                                          ');
         Sql.Add('                      MOVIMENT M,                              ');
         Sql.Add('                     (SELECT                                   ');
         Sql.Add('                           CODARTIGO,                          ');
         Sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV          ');
         Sql.Add('                      FROM MOVIMENT                            ');
         Sql.Add('                      WHERE  ( DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'') )  ');
         Sql.Add('                         AND (CODALMOXARIFADO  = '+dblcAlmox.LookupValue +') ');
         Sql.Add('                      GROUP BY CODARTIGO                       ');
         Sql.Add('                     ) SUB                                     ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)            ');
         Sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV)              ');
         Sql.Add('                  AND (M.CODALMOXARIFADO ='+dblcAlmox.LookupValue +')');
         Sql.Add('                GROUP BY M.CODARTIGO ) AUX                     ');
         Sql.Add('         WHERE                                                 ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)                    ');
         Sql.Add('          AND (M.CODALMOXARIFADO = '+dblcAlmox.LookupValue +') ');
         Sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) MOV                      ');
         Sql.Add(' WHERE                                                         ');
         Sql.Add('         (MOV.CODALMOXARIFADO = '+dblcAlmox.LookupValue +')    ');
         Sql.Add('     AND (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')      ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('     AND (MOV.CODARTIGO = A.CODARTIGO)                         ');
         Sql.Add('     AND (A.CODPRODUTO = P.CODPRODUTO)                         ');
         Sql.Add('     AND (G.CODGRUPOPROD = P.CODGRUPOPROD) )                   ');
         Sql.Add(' ) UN                                                          ');
         If Trim(dblcGrpProd.Text) <> ''  Then
            Begin
               sql.Add(' WHERE (RTRIM(UN.CODGRUPOPROD) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) ');
               DtmRptRelats.lbFiltro.Caption  := dblcGrpProd.LookupValue + ' - '+ dblcGrpProd.Text;
            End;
         Sql.Add('GROUP BY UN.CODGRUPOPROD,  ');
         Sql.Add('      UN.DESCGRUPOPROD,    ');
         Sql.Add('      UN.STATUSGRUPO,      ');
         Sql.Add('      UN.CODARTIGO,        ');
         Sql.Add('      UN.DESCPROD          ');
         If Not chkimp.Checked Then
            Begin
               Sql.Add('HAVING ');
               Sql.Add('      SUM(UN.SALDOINI) <> 0 OR    ');
               Sql.Add('      SUM(UN.SALDOFIM) <> 0 OR    ');
               Sql.Add('      SUM(UN.RECFORN) <> 0 OR     ');
               Sql.Add('      SUM(UN.DEVFORN) <> 0 OR     ');
               Sql.Add('      SUM(UN.BAITRANS) <> 0 OR    ');
               Sql.Add('      SUM(UN.ENTTRANS) <> 0 OR    ');
               Sql.Add('      SUM(UN.BAIACERTO) <> 0 OR   ');
               Sql.Add('      SUM(UN.BAIESTRAGO) <> 0 OR  ');
               Sql.Add('      SUM(UN.BAIXACC) <> 0      ');
            End;
          Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD  ');
          Open;
       End;
    DtmRptRelats.lbAlmox6.Caption := dblcAlmox.Text;
    DtmRptRelats.lbPer6.Caption   := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';

End;

procedure TFrmParamReconSaldo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAlmox.Text) = '' Then
     Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0 );
        dblcAlmox.SetFocus;
     End
  Else
     FazQry;
end;

end.
