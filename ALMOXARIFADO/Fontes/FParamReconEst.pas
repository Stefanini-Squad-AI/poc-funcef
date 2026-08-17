unit FParamReconEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid;

Type
   TObjGrupo = Class
   Public
          CodGrupoProd : String;
          TRecForn     : Double;
          TDevForn     : Double;
          TBaiTrans    : Double;
          TEntTrans    : Double;
          TBaiAcerto   : Double;
          TBaiEstrago  : Double;
          TBaixaCC     : Double;
          TSaldoAtual  : Double;
   End;

type
  TFrmParamReconEst = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    Label5: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    qryGrpProd: TwwQuery;
    Label1: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    chkimp: TCheckBox;
    qryMov: TwwQuery;
    qryMovCODGRUPOPROD: TStringField;
    qryMovDESCGRUPOPROD: TStringField;
    qryMovSTATUSGRUPO: TStringField;
    qryMovDESCPROD: TStringField;
    qryMovCODARTIGO: TStringField;
    qryMovRECFORN: TFloatField;
    qryMovDEVFORN: TFloatField;
    qryMovBAITRANS: TFloatField;
    qryMovENTTRANS: TFloatField;
    qryMovBAIACERTO: TFloatField;
    qryMovBAIESTRAGO: TFloatField;
    qryMovBAIXACC: TFloatField;
    qryMovTOTAL: TFloatField;
    qryUnCusteio: TwwQuery;
    Label4: TLabel;
    dblcUnCusteio: TwwDBLookupCombo;
    chkEstoque: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcUnCusteioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure  FazRel;
    Function  ListAlmox( CodCusteio : Integer ) : String;    
  public
    { Public declarations }
  end;

var
  FrmParamReconEst: TFrmParamReconEst;

implementation

uses DRptRelats, uSistema, uMensErro, uModulo, FAguarde, uDataBase, DBaseDados;

{$R *.DFM}

procedure TFrmParamReconEst.FormCreate(Sender: TObject);
begin
  inherited;
  edDataI.Date := Date;
  edDataF.Date := Date;
  //
  qryUnCusteio.Open;
  //
  qryGrpProd.Close;
  qryGrpProd.Params[0].asInteger := Sistema.IdEmpresa;
  qryGrpProd.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].asInteger   := Sistema.IdEmpresa;
  qryAlmox.Open;

end;

procedure TFrmParamReconEst.FazRel;
Var
   x      : Integer;
   sAlmox : String;
begin
   x:= Pos('.',Modulo.sMascaraGrupoProd)-1;
   If Trim(dblcAlmox.Text) <> '' Then
      Begin
         DtmRptRelats.lbAlmox3.Caption      := dblcAlmox.Text;
         DtmRptRelats.lbTituloAlmox.Caption := 'Almoxarifado';
      End
   Else
      Begin
         DtmRptRelats.lbAlmox3.Caption      := dblcUnCusteio.Text;
         DtmRptRelats.lbTituloAlmox.Caption := 'Unidade de Custeio';
      End;

   If Trim(dblcAlmox.Text) <> '' Then
      Begin
         sAlmox := dblcAlmox.LookupValue;
      End
   Else
      Begin
         sAlmox := ListAlmox(StrtoIntDef(dblcUnCusteio.LookupValue,0 ));
      End;

   With DtmRptRelats.qryRecon Do
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
         Sql.Add('      SUM(UN.TSALDOINI) AS TSALDOINI,          ');
         Sql.Add('      SUM(UN.SALDOFIM) AS SALDOATUAL,          ');
         Sql.Add('      SUM(UN.TSALDOFIM) AS TSALDOATUAL,        ');
         Sql.Add('      SUM(UN.RECFORN) AS RECFORN,              ');
         Sql.Add('      SUM(UN.DEVFORN)*-1 AS DEVFORN,           ');
         Sql.Add('      SUM(UN.BAITRANS)*-1 AS BAITRANS,         ');
         Sql.Add('      SUM(UN.ENTTRANS) AS ENTTRANS,            ');
         Sql.Add('      SUM(UN.BAIACERTO)*-1 AS BAIACERTO,       ');
         Sql.Add('      SUM(UN.BAIESTRAGO)*-1 AS BAIESTRAGO,     ');
         Sql.Add('      SUM(UN.BAIXACC)*-1 AS BAIXACC,           ');
         Sql.Add('      SUM(UN.TRECFORN) AS TRECFORN,            ');
         Sql.Add('      SUM(UN.TDEVFORN)*-1 AS TDEVFORN,         ');
         Sql.Add('      SUM(UN.TBAITRANS)*-1 AS TBAITRANS,       ');
         Sql.Add('      SUM(UN.TENTTRANS) AS TENTTRANS,          ');
         Sql.Add('      SUM(UN.TBAIACERTO)*-1 AS TBAIACERTO,     ');
         Sql.Add('      SUM(UN.TBAIESTRAGO)*-1 AS TBAIESTRAGO,   ');
         Sql.Add('      SUM(UN.TBAIXACC)*-1 AS TBAIXACC,         ');
         Sql.Add('      (SUM(UN.SALDOINI)-SUM(UN.SALDOFIM)+      ');
         Sql.Add('       SUM(UN.RECFORN)+SUM(UN.DEVFORN)+        ');
         Sql.Add('       SUM(UN.BAITRANS)+SUM(UN.ENTTRANS)+      ');
         Sql.Add('       SUM(UN.BAIACERTO)+SUM(UN.BAIESTRAGO)+   ');
         Sql.Add('       SUM(UN.BAIXACC)) AS AJUSTE,             ');
         Sql.Add('      (SUM(UN.TSALDOINI)-SUM(UN.TSALDOFIM)+    ');
         Sql.Add('       SUM(UN.TRECFORN)+SUM(UN.TDEVFORN)+      ');
         Sql.Add('       SUM(UN.TBAITRANS)+SUM(UN.TENTTRANS)+    ');
         Sql.Add('       SUM(UN.TBAIACERTO)+SUM(UN.TBAIESTRAGO)+ ');
         Sql.Add('       SUM(UN.TBAIXACC)) AS TAJUSTE            ');
         Sql.Add('FROM                                           ');
         Sql.Add('(                                              ');
         Sql.Add('( SELECT                                       ');
         Sql.Add('      P.CODGRUPOPROD,                          ');
         Sql.Add('      G.DESCGRUPOPROD,                         ');
         Sql.Add('      G.STATUSGRUPO,                           ');
         Sql.Add('      MOV.CODARTIGO,                           ');
         Sql.Add('      P.DESCPROD,                              ');
         Sql.Add('      (MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV) AS SALDOINI, ');
         Sql.Add('      (0) AS TSALDOINI,                                   ');
         Sql.Add('      (0) AS SALDOFIM,                                    ');
         Sql.Add('      (0) AS TSALDOFIM,                                   ');
         Sql.Add('      (0) AS RECFORN,                                     ');
         Sql.Add('      (0) AS DEVFORN,                                     ');
         Sql.Add('      (0) AS BAITRANS,                                    ');
         Sql.Add('      (0) AS ENTTRANS,                                    ');
         Sql.Add('      (0) AS BAIACERTO,                                   ');
         Sql.Add('      (0) AS BAIESTRAGO,                                  ');
         Sql.Add('      (0) AS BAIXACC,                                     ');
         Sql.Add('      (0) AS TRECFORN,                                    ');
         Sql.Add('      (0) AS TDEVFORN,                                    ');
         Sql.Add('      (0) AS TBAITRANS,                                   ');
         Sql.Add('      (0) AS TENTTRANS,                                   ');
         Sql.Add('      (0) AS TBAIACERTO,                                  ');
         Sql.Add('      (0) AS TBAIESTRAGO,                                 ');
         Sql.Add('      (0) AS TBAIXACC                                     ');
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
         Sql.Add('                      M.CODARTIGO, M.CODALMOXARIFADO,     ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV               ');
         Sql.Add('                 FROM                                     ');
         Sql.Add('                      MOVIMENT M,                         ');
         Sql.Add('                     (SELECT                              ');
         Sql.Add('                           CODARTIGO, CODALMOXARIFADO,    ');
         Sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV     ');
         Sql.Add('                      FROM MOVIMENT                       ');
         Sql.Add('                      WHERE  ( DATAMOV < TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('                         AND (CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                      GROUP BY CODARTIGO,CODALMOXARIFADO  ');
         Sql.Add('                     ) SUB                                ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)       ');
         Sql.Add('                  AND (M.CODALMOXARIFADO =SUB.CODALMOXARIFADO)         ');
         Sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV)         ');
         Sql.Add('                  AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                GROUP BY M.CODARTIGO, M.CODALMOXARIFADO ) AUX        ');
         Sql.Add('         WHERE                                            ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)               ');
         Sql.Add('          AND (M.CODALMOXARIFADO =AUX.CODALMOXARIFADO)    ');
         Sql.Add('          AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) MOV                 ');
         Sql.Add(' WHERE                                                    ');
         Sql.Add('        (MOV.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('    AND (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' )');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (MOV.CODARTIGO = A.CODARTIGO)                     ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
         Sql.Add('    AND (G.CODGRUPOPROD = P.CODGRUPOPROD) )              ');
         Sql.Add(' UNION ALL                                                ');
         Sql.Add('( SELECT                                                  ');
         Sql.Add('      G.CODGRUPOPROD,                                     ');
         Sql.Add('      G.DESCGRUPOPROD,                                    ');
         Sql.Add('      G.STATUSGRUPO,                                      ');
         Sql.Add('      ('''') AS CODARTIGO,                                  ');
         Sql.Add('      ('''') AS DESCPROD,                                   ');
         Sql.Add('      (0) AS SALDOINI,                                    ');
         Sql.Add('      (SUM(MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV)) AS TSALDOINI,');
         Sql.Add('      (0) AS SALDOFIM,                                    ');
         Sql.Add('      (0) AS TSALDOFIM,                                   ');
         Sql.Add('      (0) AS RECFORN,                                     ');
         Sql.Add('      (0) AS DEVFORN,                                     ');
         Sql.Add('      (0) AS BAITRANS,                                    ');
         Sql.Add('      (0) AS ENTTRANS,                                    ');
         Sql.Add('      (0) AS BAIACERTO,                                   ');
         Sql.Add('      (0) AS BAIESTRAGO,                                  ');
         Sql.Add('      (0) AS BAIXACC,                                     ');
         Sql.Add('      (0) AS TRECFORN,                                    ');
         Sql.Add('      (0) AS TDEVFORN,                                    ');
         Sql.Add('      (0) AS TBAITRANS,                                   ');
         Sql.Add('      (0) AS TENTTRANS,                                   ');
         Sql.Add('      (0) AS TBAIACERTO,                                  ');
         Sql.Add('      (0) AS TBAIESTRAGO,                                 ');
         Sql.Add('      (0) AS TBAIXACC                                     ');
         Sql.Add('   FROM                                                   ');
         Sql.Add('        PRODUTO P,                                        ');
         Sql.Add('        ARTIGO A,                                         ');
         Sql.Add('        GRUPPROD G,                                       ');
         Sql.Add('        ( SELECT                                          ');
         Sql.Add('               M.IDMOV,                                   ');
         Sql.Add('               M.CODARTIGO,                               ');
         Sql.Add('               M.SALDOQTDEMOV,                            ');
         Sql.Add('               M.CUSTOMEDIOMOV,                           ');
         Sql.Add('               M.CODALMOXARIFADO,                         ');
         Sql.Add('               M.IDPESSOA                                 ');
         Sql.Add('          FROM                                            ');
         Sql.Add('               MOVIMENT M,                                ');
         Sql.Add('               ( SELECT                                   ');
         Sql.Add('                      M.CODARTIGO, M.CODALMOXARIFADO,     ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV               ');
         Sql.Add('                 FROM                                     ');
         Sql.Add('                      MOVIMENT M,                         ');
         Sql.Add('                      ( SELECT                            ');
         Sql.Add('                             CODARTIGO, CODALMOXARIFADO,  ');
         Sql.Add('                             MAX(DATAMOV) AS MAXDATAMOV   ');
         Sql.Add('                        FROM MOVIMENT                     ');
         Sql.Add('                        WHERE (DATAMOV < TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('                          AND (CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                        GROUP BY CODARTIGO, CODALMOXARIFADO ');
         Sql.Add('                       ) SUB                              ');
         Sql.Add('                 Where (M.CODARTIGO = SUB.CODARTIGO)      ');
         Sql.Add('                   AND (M.CODALMOXARIFADO = SUB.CODALMOXARIFADO) ');
         Sql.Add('                   AND (M.DATAMOV =SUB.MAXDATAMOV)        ');
         Sql.Add('                   AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                 GROUP BY M.CODARTIGO, M.CODALMOXARIFADO  ');
         Sql.Add('                ) AUX                                     ');
         Sql.Add('          WHERE                                           ');
         Sql.Add('               (M.CODARTIGO = AUX.CODARTIGO)              ');
         Sql.Add('           AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)  ');
         Sql.Add('           AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('           AND (M.IDMOV = AUX.IDMOV)                      ');
         Sql.Add('        ) MOV                                             ');
         Sql.Add('   WHERE                                                  ');
         Sql.Add('        (MOV.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('    And (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (MOV.CODARTIGO = A.CODARTIGO)                     ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
         Sql.Add('    AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+IntToStr(x)+') || ''%'') ');
         Sql.Add('    AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+IntToStr(x)+')');
         Sql.Add('    And (G.STATUSGRUPO = ''S'')                           ');
         Sql.Add('   GROUP BY   G.CODGRUPOPROD,                             ');
         Sql.Add('              G.DESCGRUPOPROD,                            ');
         Sql.Add('              G.STATUSGRUPO)                              ');
         Sql.Add('                                                          ');
         Sql.Add('UNION ALL                                                 ');
         Sql.Add('( SELECT                                                  ');
         Sql.Add('      P.CODGRUPOPROD,                                     ');
         Sql.Add('      G.DESCGRUPOPROD,                                    ');
         Sql.Add('      G.STATUSGRUPO,                                      ');
         Sql.Add('      M.CODARTIGO,                                        ');
         Sql.Add('      P.DESCPROD,                                         ');
         Sql.Add('      (0) AS SALDOINI,                                    ');
         Sql.Add('      (0) AS TSALDOINI,                                   ');
         Sql.Add('      (0) AS SALDOFIM,                                    ');
         Sql.Add('      (0) AS TSALDOFIM,                                   ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''A'',M.VALORMOV,0 )) AS RECFORN,   ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''K'',M.VALORMOV,0 )) AS DEVFORN,   ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''F'',M.VALORMOV,                   ');
         Sql.Add('                             ''T'',M.VALORMOV,                   ');
         Sql.Add('                             ''G'',M.VALORMOV,                   ');
         Sql.Add('                             ''U'',M.VALORMOV,                   ');
         Sql.Add('                             ''R'',M.VALORMOV,0 )) AS BAITRANS,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''S'',M.VALORMOV,                   ');
         Sql.Add('                             ''C'',M.VALORMOV,                   ');
         Sql.Add('                             ''B'',M.VALORMOV,0 )) AS ENTTRANS,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''H'',M.VALORMOV,                   ');
         Sql.Add('                             ''b'',M.VALORMOV,                   ');
         Sql.Add('                             ''a'',M.VALORMOV,                   ');
         Sql.Add('                             ''D'',M.VALORMOV,0 )) AS BAIACERTO, ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''I'',M.VALORMOV,0 )) AS BAIESTRAGO,');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''M'',M.VALORMOV,                   ');
         Sql.Add('                             ''N'',M.VALORMOV,                   ');
         Sql.Add('                             ''L'',M.VALORMOV,                   ');
         Sql.Add('                             ''Q'',M.VALORMOV,                   ');
         Sql.Add('                             ''J'',M.VALORMOV,                   ');
         Sql.Add('                             ''V'',M.VALORMOV,                   ');
         Sql.Add('                             ''X'',M.VALORMOV,                   ');
         Sql.Add('                             ''W'',M.VALORMOV,                   ');
         Sql.Add('                             ''O'',M.VALORMOV,                   ');
         Sql.Add('                             ''E'',M.VALORMOV,                   ');
         Sql.Add('                             ''P'',M.VALORMOV,                   ');
         Sql.Add('                             ''Y'',M.VALORMOV,0 )) AS BAIXACC,   ');
         Sql.Add('      (0) AS TRECFORN,                                          ');
         Sql.Add('      (0) AS TDEVFORN,                                         ');
         Sql.Add('      (0) AS TBAITRANS,                                        ');
         Sql.Add('      (0) AS TENTTRANS,                                        ');
         Sql.Add('      (0) AS TBAIACERTO,                                       ');
         Sql.Add('      (0) AS TBAIESTRAGO,                                      ');
         Sql.Add('      (0) AS TBAIXACC                                          ');
         Sql.Add(' FROM                                                          ');
         Sql.Add('      PRODUTO P,                                               ');
         Sql.Add('      ARTIGO A,                                                ');
         Sql.Add('      GRUPPROD G,                                              ');
         Sql.Add('      MOVIMENT M                                               ');
         Sql.Add(' WHERE                                                         ');
         Sql.Add('         (M.CODALMOXARIFADO in ('+sAlmox+'))');
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
         Sql.Add(' UNION ALL                                                     ');
         Sql.Add('( SELECT                                                       ');
         Sql.Add('      G.CODGRUPOPROD,                                          ');
         Sql.Add('      G.DESCGRUPOPROD,                                         ');
         Sql.Add('      G.STATUSGRUPO,                                           ');
         Sql.Add('      ('''') AS CODARTIGO,                                       ');
         Sql.Add('      ('''') AS DESCPROD,                                        ');
         Sql.Add('      (0) AS SALDOINI,                                         ');
         Sql.Add('      (0) AS TSALDOINI,                                        ');
         Sql.Add('      (0) AS SALDOFIM,                                         ');
         Sql.Add('      (0) AS TSALDOFIM,                                        ');
         Sql.Add('      (0) AS RECFORN,                                          ');
         Sql.Add('      (0) AS DEVFORN,                                          ');
         Sql.Add('      (0) AS BAITRANS,                                         ');
         Sql.Add('      (0) AS ENTTRANS,                                         ');
         Sql.Add('      (0) AS BAIACERTO,                                        ');
         Sql.Add('      (0) AS BAIESTRAGO,                                       ');
         Sql.Add('      (0) AS BAIXACC,                                          ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''A'',M.VALORMOV,0 )) AS TRECFORN,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''K'',M.VALORMOV,0 )) AS TDEVFORN,  ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''F'',M.VALORMOV,                   ');
         Sql.Add('                             ''T'',M.VALORMOV,                   ');
         Sql.Add('                             ''G'',M.VALORMOV,                   ');
         Sql.Add('                             ''U'',M.VALORMOV,                   ');
         Sql.Add('                             ''R'',M.VALORMOV,0 )) AS TBAITRANS, ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''S'',M.VALORMOV,                   ');
         Sql.Add('                             ''C'',M.VALORMOV,                   ');
         Sql.Add('                             ''B'',M.VALORMOV,0 )) AS TENTTRANS, ');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''H'',M.VALORMOV,                   ');
         Sql.Add('                             ''b'',M.VALORMOV,                   ');
         Sql.Add('                             ''a'',M.VALORMOV,                   ');
         Sql.Add('                             ''D'',M.VALORMOV,0 )) AS TBAIACERTO,');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''I'',M.VALORMOV,0 )) AS TBAIESTRAGO,');
         Sql.Add('     SUM(DECODE(M.CODTIPOMOV,''M'',M.VALORMOV,                   ');
         Sql.Add('                             ''N'',M.VALORMOV,                   ');
         Sql.Add('                             ''L'',M.VALORMOV,                   ');
         Sql.Add('                             ''Q'',M.VALORMOV,                   ');
         Sql.Add('                             ''J'',M.VALORMOV,                   ');
         Sql.Add('                             ''V'',M.VALORMOV,                   ');
         Sql.Add('                             ''X'',M.VALORMOV,                   ');
         Sql.Add('                             ''W'',M.VALORMOV,                   ');
         Sql.Add('                             ''O'',M.VALORMOV,                   ');
         Sql.Add('                             ''E'',M.VALORMOV,                   ');
         Sql.Add('                             ''P'',M.VALORMOV,                   ');
         Sql.Add('                             ''Y'',M.VALORMOV,0 )) AS TBAIXACC   ');
         Sql.Add('   FROM                                                        ');
         Sql.Add('        PRODUTO P,                                             ');
         Sql.Add('        ARTIGO A,                                              ');
         Sql.Add('        GRUPPROD G,                                            ');
         Sql.Add('        MOVIMENT M                                             ');
         Sql.Add('   WHERE                                                       ');
         Sql.Add('        (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('    And (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')         ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (M.CODARTIGO = A.CODARTIGO)                            ');
         Sql.Add('    AND (M.DATAMOV >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('    AND (M.DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                          ');
         Sql.Add('    AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+IntToStr(x)+') || ''%'') ');
         Sql.Add('    AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+IntToStr(x)+')     ');
         Sql.Add('    And (G.STATUSGRUPO = ''S'')                                ');
         Sql.Add('   GROUP BY   G.CODGRUPOPROD,                                  ');
         Sql.Add('              G.DESCGRUPOPROD,                                 ');
         Sql.Add('              G.STATUSGRUPO)                                   ');
         Sql.Add('UNION ALL                                                      ');
         Sql.Add('( SELECT                                                       ');
         Sql.Add('      P.CODGRUPOPROD,                                          ');
         Sql.Add('      G.DESCGRUPOPROD,                                         ');
         Sql.Add('      G.STATUSGRUPO,                                           ');
         Sql.Add('      MOV.CODARTIGO,                                           ');
         Sql.Add('      P.DESCPROD,                                              ');
         Sql.Add('      (0) AS SALDOINI,                                         ');
         Sql.Add('      (0) AS TSALDOINI,                                        ');
         Sql.Add('      (MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV) AS SALDOFIM,      ');
         Sql.Add('      (0) AS TSALDOFIM,                                        ');
         Sql.Add('      (0) AS RECFORN,                                          ');
         Sql.Add('      (0) AS DEVFORN,                                          ');
         Sql.Add('      (0) AS BAITRANS,                                         ');
         Sql.Add('      (0) AS ENTTRANS,                                         ');
         Sql.Add('      (0) AS BAIACERTO,                                        ');
         Sql.Add('      (0) AS BAIESTRAGO,                                       ');
         Sql.Add('      (0) AS BAIXACC,                                          ');
         Sql.Add('      (0) AS TRECFORN,                                         ');
         Sql.Add('      (0) AS TDEVFORN,                                         ');
         Sql.Add('      (0) AS TBAITRANS,                                        ');
         Sql.Add('      (0) AS TENTTRANS,                                        ');
         Sql.Add('      (0) AS TBAIACERTO,                                       ');
         Sql.Add('      (0) AS TBAIESTRAGO,                                      ');
         Sql.Add('      (0) AS TBAIXACC                                          ');
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
         Sql.Add('                      M.CODARTIGO, M.CODALMOXARIFADO,          ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV                    ');
         Sql.Add('                 FROM                                          ');
         Sql.Add('                      MOVIMENT M,                              ');
         Sql.Add('                     (SELECT                                   ');
         Sql.Add('                           CODARTIGO, CODALMOXARIFADO,         ');
         Sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV          ');
         Sql.Add('                      FROM MOVIMENT                            ');
         Sql.Add('                      WHERE  ( DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'') )  ');
         Sql.Add('                         AND (CODALMOXARIFADO  in ('+sAlmox+'))');
         Sql.Add('                      GROUP BY CODARTIGO,CODALMOXARIFADO       ');
         Sql.Add('                     ) SUB                                     ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)            ');
         Sql.Add('                  AND (M.CODALMOXARIFADO =SUB.CODALMOXARIFADO) ');
         Sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV)              ');
         Sql.Add('                  AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                GROUP BY M.CODARTIGO, M.CODALMOXARIFADO ) AUX                     ');
         Sql.Add('         WHERE                                                 ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)                    ');
         Sql.Add('          AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)        ');
         Sql.Add('          AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) MOV                      ');
         Sql.Add(' WHERE                                                         ');
         Sql.Add('         (MOV.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('     And (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')      ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (MOV.CODARTIGO = A.CODARTIGO)                          ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                          ');
         Sql.Add('    AND (G.CODGRUPOPROD = P.CODGRUPOPROD) )                    ');
         Sql.Add(' UNION ALL                                                     ');
         Sql.Add('( SELECT                                                       ');
         Sql.Add('      G.CODGRUPOPROD,                                          ');
         Sql.Add('      G.DESCGRUPOPROD,                                         ');
         Sql.Add('      G.STATUSGRUPO,                                           ');
         Sql.Add('      ('''') AS CODARTIGO,                                       ');
         Sql.Add('      ('''') AS DESCPROD,                                        ');
         Sql.Add('      (0) AS SALDOINI,                                         ');
         Sql.Add('      (0) AS TSALDOINI,                                        ');
         Sql.Add('      (0) AS SALDOFIM,                                         ');
         Sql.Add('      (SUM(MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV)) AS TSALDOFIM,');
         Sql.Add('      (0) AS RECFORN,                                          ');
         Sql.Add('      (0) AS DEVFORN,                                          ');
         Sql.Add('      (0) AS BAITRANS,                                         ');
         Sql.Add('      (0) AS ENTTRANS,                                         ');
         Sql.Add('      (0) AS BAIACERTO,                                        ');
         Sql.Add('      (0) AS BAIESTRAGO,                                       ');
         Sql.Add('      (0) AS BAIXACC,                                          ');
         Sql.Add('      (0) AS TRECFORN,                                         ');
         Sql.Add('      (0) AS TDEVFORN,                                         ');
         Sql.Add('      (0) AS TBAITRANS,                                        ');
         Sql.Add('      (0) AS TENTTRANS,                                        ');
         Sql.Add('      (0) AS TBAIACERTO,                                       ');
         Sql.Add('      (0) AS TBAIESTRAGO,                                      ');
         Sql.Add('      (0) AS TBAIXACC                                          ');
         Sql.Add('   FROM                                                        ');
         Sql.Add('        PRODUTO P,                                             ');
         Sql.Add('        ARTIGO A,                                              ');
         Sql.Add('        GRUPPROD G,                                            ');
         Sql.Add('        ( SELECT                                               ');
         Sql.Add('               M.IDMOV,                                        ');
         Sql.Add('               M.CODARTIGO,                                    ');
         Sql.Add('               M.SALDOQTDEMOV,                                 ');
         Sql.Add('               M.CUSTOMEDIOMOV,                                ');
         Sql.Add('               M.CODALMOXARIFADO,                              ');
         Sql.Add('               M.IDPESSOA                                      ');
         Sql.Add('          FROM                                                 ');
         Sql.Add('               MOVIMENT M,                                     ');
         Sql.Add('               ( SELECT                                        ');
         Sql.Add('                      M.CODARTIGO, M.CODALMOXARIFADO,          ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV                    ');
         Sql.Add('                 FROM                                          ');
         Sql.Add('                      MOVIMENT M,                              ');
         Sql.Add('                      ( SELECT                                 ');
         Sql.Add('                             CODARTIGO, CODALMOXARIFADO,       ');
         Sql.Add('                             MAX(DATAMOV) AS MAXDATAMOV        ');
         Sql.Add('                        FROM MOVIMENT                          ');
         Sql.Add('                        WHERE   ( DATAMOV <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY'') ) ');
         Sql.Add('                         AND (CODALMOXARIFADO  in ('+sAlmox+'))');
         Sql.Add('                        GROUP BY CODARTIGO, CODALMOXARIFADO    ');
         Sql.Add('                       ) SUB                                   ');
         Sql.Add('                 Where (M.CODARTIGO = SUB.CODARTIGO)           ');
         Sql.Add('                   AND (M.DATAMOV =SUB.MAXDATAMOV)             ');
         Sql.Add('                   AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('                 GROUP BY M.CODARTIGO, M.CODALMOXARIFADO       ');
         Sql.Add('                ) AUX                                          ');
         Sql.Add('          WHERE                                                ');
         Sql.Add('               (M.CODARTIGO = AUX.CODARTIGO)                   ');
         Sql.Add('           AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)       ');
         Sql.Add('           AND (M.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('           AND (M.IDMOV = AUX.IDMOV)                           ');
         Sql.Add('        ) MOV                                                  ');
         Sql.Add('   WHERE                                                       ');
         Sql.Add('        (MOV.CODALMOXARIFADO in ('+sAlmox+'))');
         Sql.Add('    And (MOV.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')       ');

        If chkEstoque.Checked Then
           Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('    AND (MOV.CODARTIGO = A.CODARTIGO)                          ');
         Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                          ');
         Sql.Add('    AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+IntToStr(x)+') || ''%'') ');
         Sql.Add('    AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+IntToStr(x)+')     ');
         Sql.Add('    And (G.STATUSGRUPO = ''S'')                                ');
         Sql.Add('   GROUP BY   G.CODGRUPOPROD,                                  ');
         Sql.Add('              G.DESCGRUPOPROD,                                 ');
         Sql.Add('              G.STATUSGRUPO)                                   ');
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
               Sql.Add('      SUM(UN.TSALDOINI) <> 0 OR   ');
               Sql.Add('      SUM(UN.SALDOFIM) <> 0 OR    ');
               Sql.Add('      SUM(UN.TSALDOFIM) <> 0 OR   ');
               Sql.Add('      SUM(UN.RECFORN) <> 0 OR     ');
               Sql.Add('      SUM(UN.DEVFORN) <> 0 OR     ');
               Sql.Add('      SUM(UN.BAITRANS) <> 0 OR    ');
               Sql.Add('      SUM(UN.ENTTRANS) <> 0 OR    ');
               Sql.Add('      SUM(UN.BAIACERTO) <> 0 OR   ');
               Sql.Add('      SUM(UN.BAIESTRAGO) <> 0 OR  ');
               Sql.Add('      SUM(UN.BAIXACC) <> 0 OR     ');
               Sql.Add('      SUM(UN.TRECFORN) <> 0 OR    ');
               Sql.Add('      SUM(UN.TDEVFORN) <> 0 OR    ');
               Sql.Add('      SUM(UN.TBAITRANS) <> 0 OR   ');
               Sql.Add('      SUM(UN.TENTTRANS) <> 0 OR   ');
               Sql.Add('      SUM(UN.TBAIACERTO) <> 0 OR  ');
               Sql.Add('      SUM(UN.TBAIESTRAGO) <> 0 OR ');
               Sql.Add('      SUM(UN.TBAIXACC) <> 0       ');
            End;
         Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD  ');
         Open;
      End;

      DtmRptRelats.lbPer3.Caption   := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
end;

procedure TFrmParamReconEst.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (trim(dblcUnCusteio.Text) = '') And (trim(dblcAlmox.Text) = '') Then
     Begin
        MsgDlg('Unidade de Custeio','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := mrNone;
     End
  Else
     Begin
        ModalResult := mrOk;
        FazRel;
     End;
end;

procedure TFrmParamReconEst.dblcUnCusteioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcUnCusteio.Text) <> '') Then
      dblcAlmox.Text := '';

end;

function TFrmParamReconEst.ListAlmox(CodCusteio: Integer): String;
Var
   SQL : String;
begin
   Result := '0';
   if CodCusteio = 0 then
      begin
         SQL := ' SELECT CODALMOXARIFADO FROM ALMOX '+
                ' WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
      end
   else
      begin
         SQL := ' SELECT CODALMOXARIFADO FROM ALMOX '+
                ' WHERE (CODCUSTEIO = '+IntToStr(CodCusteio)+')';
      end;
   If FazQuery(DtmBaseDados.qry,SQL) Then
      Begin
          Result := '';
          DtmBaseDados.qry.First;
          While Not DtmBaseDados.qry.Eof Do
             Begin
                Result := Result + DtmBaseDados.qry.FieldByName('CODALMOXARIFADO').AsString +',';
                DtmBaseDados.qry.Next;
             End;
         Result := Copy(Result,1,length(Result)-1);
      End;
end;

end.

