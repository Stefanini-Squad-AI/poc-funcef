// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamCustAnali;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamCustAnali = class(TfrmOkCancelar)
    qryCCust: TwwQuery;
    Label3: TLabel;
    dblcCCust: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    dblcGrp: TCMDBLookupCombo;
    Label4: TLabel;
    qryGrp: TwwQuery;
    qryGrpCODGRUPOPROD: TStringField;
    qryGrpDESCGRUPOPROD: TStringField;
    GroupBox1: TGroupBox;
    edCCIni: TEdit;
    Label5: TLabel;
    edCCFim: TEdit;
    ChkImp: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamCustAnali: TFrmParamCustAnali;

implementation

{$R *.DFM}
 Uses uSistema, uMensErro, DRptRelats;
procedure TFrmParamCustAnali.FormCreate(Sender: TObject);
begin
  inherited;
  qryCCust.Close;
  qryCCust.Sql.text := ' SELECT CODCENTROCUSTO,NOME FROM CENTCUST ' +
                       ' WHERE (IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa ) +')'+
                       ' ORDER BY NOME ';
  qryCCust.Open;
  //
  qryGrp.Open;
  //
  edDataI.Date :=  Date;
  edDataF.Date :=  Date;
end;

Procedure TFrmParamCustAnali.FazerQry;
Begin
  DtmRptRelats.LbGrp.Caption := 'TODOS';
  If Trim(dblcGrp.Text) <> '' Then
     DtmRptRelats.LbGrp.Caption := dblcGrp.Text;
  With DtmRptRelats.QryCustAnali DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                              ');
         Sql.Add('      M.CODARTIGO,                                                                   ');
         Sql.Add('      (P.DESCPROD || '' '' || AR.CODCOR || '' '' || AR.CODTAMANHO ) AS DESCRICAO,    ');
         Sql.Add('      G.CODGRUPOPROD,                                                                ');
         Sql.Add('      G.DESCGRUPOPROD,                                                               ');
         Sql.Add('      M.CODCENTROCUSTO,                                                              ');
         Sql.Add('      C.NOME,                                                                        ');
         Sql.Add('      SUM(round(M.VALORMOV, 2)*-1) AS VALORMOV,                                                ');
         Sql.Add('      SUM(M.QTDEMOV*-1) AS QTDEMOV,                                                  ');
         Sql.Add('      P.CODMEDCUSTO,                                                                 ');
         Sql.Add('      DECODE(TOTGRP.TOTCC,0,0,((SUM(round(M.VALORMOV, 2)*-1))/TOTGRP.TOTCC * 100 )) AS PERCGRP,');
         Sql.Add('      DECODE(TOT.TOTAL,0,0,(TOTGRP.TOTCC/TOT.TOTAL * 100 )) AS PERCCC,               ');
         Sql.Add('      TOTGRP.TOTCC,                                                                  ');
         Sql.Add('      TOT.TOTAL                                                                      ');
         Sql.Add(' FROM                                                                                ');
         Sql.Add('      MOVIMENT M,                                                                    ');
         Sql.Add('      ALMOX A,                                                                       ');
         Sql.Add('      PRODUTO P,                                                                     ');
         Sql.Add('      ALMOX T,                                                                       ');
         Sql.Add('      GRUPPROD G,                                                                    ');
         Sql.Add('      CENTCUST C,                                                                    ');
         Sql.Add('      ARTIGO AR,                                                                     ');
         Sql.Add('      (                                                                              ');
         Sql.Add('        SELECT                                                                       ');
         Sql.Add('            M.CODCENTROCUSTO,                                                        ');
         Sql.Add('            SUM(round(M.VALORMOV, 2)*-1) AS TOTCC                                              ');
         Sql.Add('         FROM                                                                        ');
         Sql.Add('              MOVIMENT M,                                                            ');
         Sql.Add('              ALMOX A,                                                               ');
         Sql.Add('              PRODUTO P,                                                             ');
         Sql.Add('              ALMOX T                                                                ');
         Sql.Add('         WHERE                                                                       ');
         Sql.Add('              (M.CODTIPOMOV <> ''A'')                                                ');
         Sql.Add('          AND (M.CODTIPOMOV <> ''K'')                                                ');
         Sql.Add('          AND (M.CODTIPOMOV <> ''Z'')                                                ');
         Sql.Add('          AND (M.DATAMOV BETWEEN TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY''))');
         Sql.Add('          AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')                     ');
         Sql.Add('          AND (A.CONTABIL = ''T'')                                                   ');
         IF Trim(dblcCCust.Text) <> '' Then
            Begin
              Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+ Trim(dblcCCust.LookUpValue)+''') ');
            End
         Else
            Begin
               IF Trim(edCCIni.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) >= '''+ Trim(edCCIni.Text)+''') ');
               IF Trim(edCCFim.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) <= '''+ Trim(edCCFim.Text)+''') ');
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (RTRIM(P.CODGRUPOPROD) = '''+ Trim(dblcGrp.LookUpValue)+''') ');

         Sql.Add('          AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                ');
         Sql.Add('          AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                              ');
         Sql.Add('          AND ( (M.CODALMOXTRANSF IS NULL) OR                                        ');
         Sql.Add('              ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    ');
         Sql.Add('               AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))');
         Sql.Add('          AND (SUBSTR(M.CODARTIGO,1,6) = P.CODPRODUTO)                               ');
         Sql.Add('         GROUP BY M.CODCENTROCUSTO                                                   ');
         Sql.Add('      ) TOTGRP,                                                                      ');
         Sql.Add('      (                                                                              ');
         Sql.Add('       SELECT                                                                        ');
         Sql.Add('           SUM(round(M.VALORMOV, 2)*-1) AS TOTAL                                               ');
         Sql.Add('         FROM                                                                        ');
         Sql.Add('              MOVIMENT M,                                                            ');
         Sql.Add('              ALMOX A,                                                               ');
         Sql.Add('              PRODUTO P,                                                             ');
         Sql.Add('              ALMOX T                                                                ');
         Sql.Add('         WHERE                                                                       ');
         Sql.Add('              (M.CODTIPOMOV <> ''A'')                                                  ');
         Sql.Add('          AND (M.CODTIPOMOV <> ''K'')                                                  ');
         Sql.Add('          AND (M.CODTIPOMOV <> ''Z'')                                                  ');
         Sql.Add('          AND (M.DATAMOV BETWEEN TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY''))');
         Sql.Add('          AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')                     ');
         Sql.Add('          AND (A.CONTABIL = ''T'')                                                   ');
         IF Trim(dblcCCust.Text) <> '' Then
            Begin
              Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+ Trim(dblcCCust.LookUpValue)+''') ');
            End
         Else
            Begin
               IF Trim(edCCIni.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) >= '''+ Trim(edCCIni.Text)+''') ');
               IF Trim(edCCFim.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) <= '''+ Trim(edCCFim.Text)+''') ');
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (RTRIM(P.CODGRUPOPROD) = '''+ Trim(dblcGrp.LookUpValue)+''') ');

         Sql.Add('          AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                ');
         Sql.Add('          AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                              ');
         Sql.Add('          AND ( (M.CODALMOXTRANSF IS NULL) OR                                        ');
         Sql.Add('              ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    ');
         Sql.Add('               AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))');
         Sql.Add('          AND (SUBSTR(M.CODARTIGO,1,6) = P.CODPRODUTO)                               ');
         Sql.Add('      ) TOT                                                                          ');
         Sql.Add(' WHERE                                                                               ');
         Sql.Add('      (M.CODTIPOMOV <> ''A'')                                                          ');
         Sql.Add('  AND (M.CODTIPOMOV <> ''K'')                                                          ');
         Sql.Add('  AND (M.CODTIPOMOV <> ''Z'')                                                          ');
         Sql.Add('  AND (M.DATAMOV BETWEEN TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY''))');
         Sql.Add('  AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')                     ');
         Sql.Add('  AND (A.CONTABIL = ''T'')  ');

         IF Trim(dblcCCust.Text) <> '' Then
            Begin
              Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+ Trim(dblcCCust.LookUpValue)+''') ');
            End
         Else
            Begin
               IF Trim(edCCIni.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) >= '''+ Trim(edCCIni.Text)+''') ');
               IF Trim(edCCFim.Text) <> '' Then
                  Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) <= '''+ Trim(edCCFim.Text)+''') ');
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (RTRIM(P.CODGRUPOPROD) = '''+ Trim(dblcGrp.LookUpValue)+''') ');

         Sql.Add('  AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                        ');
         Sql.Add('  AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                                      ');
         Sql.Add('  AND ( (M.CODALMOXTRANSF IS NULL) OR                                        ');
         Sql.Add('      ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    ');
         Sql.Add('       AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))');
         Sql.Add('  AND (M.CODARTIGO = AR.CODARTIGO)                                       ');
         Sql.Add('  AND (AR.CODPRODUTO = P.CODPRODUTO)                                       ');
         Sql.Add('  AND (P.CODGRUPOPROD = G.CODGRUPOPROD)                                              ');
         Sql.Add('  AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO)                                          ');
         Sql.Add('  AND (M.IDEMPRESA = C.IDEMPRESA)                                                    ');
         Sql.Add('  AND (M.CODCENTROCUSTO = TOTGRP.CODCENTROCUSTO)                                     ');
         Sql.Add('                                                                                     ');
         Sql.Add(' GROUP BY                                                                            ');
         Sql.Add('      M.CODARTIGO,                                                                   ');
         Sql.Add('      (P.DESCPROD || '' '' || AR.CODCOR || '' '' || AR.CODTAMANHO ),                 ');
         Sql.Add('      G.CODGRUPOPROD,                                                                ');
         Sql.Add('      G.DESCGRUPOPROD,                                                               ');
         Sql.Add('      M.CODCENTROCUSTO,                                                              ');
         Sql.Add('      C.NOME,                                                                        ');
         Sql.Add('      P.CODMEDCUSTO,                                                                 ');
         Sql.Add('      TOTGRP.TOTCC,                                                                  ');
         Sql.Add('      TOT.TOTAL                                                                      ');
         Sql.Add(' ORDER BY C.NOME,DESCRICAO                                                                    ');
         Open;
        IF Not ChkImp.Checked Then
           Begin
              Filter   := ' VALORMOV <> 0 ';
              Filtered := True;
           End;
     End;
     DtmRptRelats.lbPer5.Caption := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;

procedure TFrmParamCustAnali.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(edDataI.Text) = '' Then
    Begin
        MsgDlg('Data de início não preenchido','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
        exit;
    End;
 If trim(edDataF.Text) = '' Then
    Begin
        MsgDlg('Data de término não preenchido','Erro',mtError,[mbOk],0);
        edDataF.SetFocus;
        exit;
    End;
  FazerQry;
end;

end.
