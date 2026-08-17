unit FParamReqLancSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery;
type
  TFrmParamReqLancSint = class(TfrmOkCancelar)
    qryCCust: TwwQuery;
    qryAlmox: TwwQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    Label5: TLabel;
    dblkcmbAlmox: TwwDBLookupCombo;
    Label6: TLabel;
    dblcCCust: TwwDBLookupCombo;
    RgTipo: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamReqLancSint: TFrmParamReqLancSint;

implementation

{$R *.DFM}

{ TFrmParamReqLancSint }

uses DRptRelats, uMensErro, uModulo, uSistema;

procedure TFrmParamReqLancSint.FazRel;
Var
   x : Integer;
begin
   x:= Pos('.',Modulo.sMascaraGrupoProd)-1;
  DtmRptRelats.LbTipo.Caption  := RgTipo.Items.Strings[RgTipo.ItemIndex];
  DtmRptRelats.lbData.caption  := deDataInicial.Text+' a '+deDataFinal.Text;
  If Trim(dblkcmbAlmox.text ) <> '' Then
     DtmRptRelats.lbAlmox13.caption := dblkcmbAlmox.text;
  With DtmRptRelats.qryReqLancSint Do
     Begin
        Close;
        Sql.Clear;
        Sql.add('SELECT                                         ');
        Sql.add('     M.CODCENTROCUSTO,                         ');
        Sql.add('     MIN(C.NOME) AS DESCC,                     ');
        Sql.add('     G.STATUSGRUPO,                            ');
        Sql.add('     P.CODGRUPOPROD AS GRUPO,                  ');
        Sql.add('     MAX(SUBSTR(P.CODGRUPOPROD,1,'+IntToStr( X )+')) AS QUEBRA, ');
        Sql.add('     G.DESCGRUPOPROD,                          ');
        Sql.add('     SUM((M.VALORMOV*(-1))) AS VALORMOV,       ');
        Sql.add('     (0) AS TOTAL                              ');
        Sql.add('FROM                                           ');
        Sql.add('   MOVIMENT M,                                 ');
        Sql.add('   PRODUTO P,                                  ');
        Sql.add('   ARTIGO A,                                   ');
        Sql.add('   GRUPPROD G,                                 ');
        Sql.add('   CENTCUST C                                  ');
        Sql.add('WHERE  (1=1)                                   ');
        Case RgTipo.ItemIndex Of
           0 : Sql.add(' AND (M.CODTIPOMOV <> ''Z'') AND (M.CODTIPOMOV <> ''A'') AND (M.CODTIPOMOV <> ''K'') AND (M.CODTIPOMOV <> ''B'') ');
           1 : Sql.add(' AND ((M.CODTIPOMOV = ''E'') OR (M.CODTIPOMOV = ''P'')) ');
           2 : Sql.add(' AND (M.CODTIPOMOV = ''I'') ');
           3 : Sql.add(' AND (M.CODTIPOMOV IN (''F'',''T'',''G'',''U'',''R'',''S''))');
        End;
        Sql.add('   AND (M.DATAMOV >= TO_DATE('''+DateToStr(deDataInicial.Date)+''',''DD/MM/YYYY'')) ');
        Sql.add('   AND (M.DATAMOV <= TO_DATE('''+DateToStr(deDataFinal.Date)+''',''DD/MM/YYYY''))   ');
        If Trim(dblkcmbAlmox.text ) <> '' Then
            Sql.add(' AND (M.CODALMOXARIFADO = ' +Trim(dblkcmbAlmox.LookupValue)+')' );
        If Trim(dblcCCust.text ) <> '' Then
            Sql.add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+Trim(dblcCCust.LookupValue)+''')' );

        Sql.add(' AND (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
        Sql.add('    AND (M.IDPESSOA = C.IDEMPRESA)            ');
        Sql.add('    AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO) ');
        Sql.add('   AND (A.CODARTIGO = M.CODARTIGO)       ');
        Sql.add('   AND (A.CODPRODUTO   = P.CODPRODUTO)   ');
        Sql.add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD) ');
        Sql.add('GROUP BY                                 ');
        Sql.add('        M.CODCENTROCUSTO,                ');
        Sql.add('        G.STATUSGRUPO,                   ');
        Sql.add('        P.CODGRUPOPROD,                  ');
        Sql.add('        G.DESCGRUPOPROD                  ');
        Sql.add('UNION ALL                                ');
        Sql.add('SELECT                                   ');
        Sql.add('   M.CODCENTROCUSTO,                     ');
        Sql.add('   MIN(C.NOME) AS DESCC,                 ');
        Sql.add('  G.STATUSGRUPO,                         ');
        Sql.add('  G.CODGRUPOPROD AS GRUPO,               ');
        Sql.add('  MAX(SUBSTR(P.CODGRUPOPROD,1,'+IntToStr( X )+')) AS QUEBRA, ');
        Sql.add('  G.DESCGRUPOPROD,                       ');
        Sql.add('  (0) AS VALORMOV,                       ');
        Sql.add('  SUM((M.VALORMOV*(-1))) AS TOTAL        ');
        Sql.add('FROM                                     ');
        Sql.add('   MOVIMENT M,                           ');
        Sql.add('   PRODUTO P,                            ');
        Sql.add('   ARTIGO A,                             ');
        Sql.add('   GRUPPROD G,                           ');
        Sql.add('   CENTCUST C                            ');
        Sql.add('WHERE  (1=1)                             ');
        Case RgTipo.ItemIndex Of
           0 : Sql.add(' AND (M.CODTIPOMOV <> ''Z'') AND (M.CODTIPOMOV <> ''A'') AND (M.CODTIPOMOV <> ''K'') AND (M.CODTIPOMOV <> ''B'') ');
           1 : Sql.add(' AND ((M.CODTIPOMOV = ''E'') OR (M.CODTIPOMOV = ''P'')) ');
           2 : Sql.add(' AND (M.CODTIPOMOV = ''I'') ');
           3 : Sql.add(' AND (M.CODTIPOMOV IN (''F'',''T'',''G'',''U'',''R'',''S''))');
        End;
        Sql.add('   AND (M.DATAMOV >= TO_DATE('''+DateToStr(deDataInicial.Date)+''',''DD/MM/YYYY'')) ');
        Sql.add('   AND (M.DATAMOV <= TO_DATE('''+DateToStr(deDataFinal.Date)+''',''DD/MM/YYYY''))   ');
        Sql.add('   AND (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
        If Trim(dblkcmbAlmox.text ) <> '' Then
            Sql.add(' AND (M.CODALMOXARIFADO = ' +Trim(dblkcmbAlmox.LookupValue)+')' );
        If Trim(dblcCCust.text ) <> '' Then
            Sql.add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+Trim(dblcCCust.LookupValue)+''')' );
        Sql.add('   AND (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
        Sql.add('   AND (M.IDPESSOA = C.IDEMPRESA)            ');
        Sql.add('   AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO) ');
        Sql.add('   AND (G.STATUSGRUPO = ''S'') ');
        Sql.add('   AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+IntToStr( X )+') || ''%'') ');
        Sql.add('   AND (A.CODARTIGO = M.CODARTIGO)    ');
        Sql.add('   AND (A.CODPRODUTO   = P.CODPRODUTO)');
        Sql.add('GROUP BY                              ');
        Sql.add('        M.CODCENTROCUSTO,             ');
        Sql.add('        G.STATUSGRUPO,                ');
        Sql.add('        G.CODGRUPOPROD,               ');
        Sql.add('        G.DESCGRUPOPROD               ');
        Sql.add('ORDER BY  CODCENTROCUSTO, GRUPO       ');
        Open;
     End;
end;

procedure TFrmParamReqLancSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
  FazRel;
end;

procedure TFrmParamReqLancSint.FormCreate(Sender: TObject);
begin
  inherited;
  deDataInicial.Date := Date;
  deDataFinal.Date   := Date;
  //
  qryCCust.Close;
  qryCCust.Sql.text := ' Select CodCentroCusto,Nome From CentCust ' +
                       ' Where (idEmpresa = '+ IntToStr(Sistema.IdEmpresa ) +')'+
                       ' Order By Nome ';
  qryCCust.Open;
  //
  qryAlmox.Close;
  qryAlmox.SQL.Text:= ' SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +IntToStr(Sistema.IdEmpresa) +
                      ' ORDER BY DESCALMOX ';
  qryAlmox.Open;
end;

end.

