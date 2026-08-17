// Andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamResFinanCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  CMDBLookupCombo;

type
  TFrmParamResFinanCC = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    Label3: TLabel;
    qryCCust: TwwQuery;
    dblcCCust: TwwDBLookupCombo;
    Label4: TLabel;
    dbseGrauCC: TwwDBSpinEdit;
    dbseGrauGrupo: TwwDBSpinEdit;
    Label5: TLabel;
    qryGrp: TwwQuery;
    qryGrpDESCGRUPOPROD: TStringField;
    qryGrpCODGRUPOPROD: TStringField;
    Label6: TLabel;
    dblcGrp: TCMDBLookupCombo;
    ChkImp: TCheckBox;
    procedure edDataIExit(Sender: TObject);
    procedure EdDataFExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamResFinanCC: TFrmParamResFinanCC;

implementation

{$R *.DFM}
Uses uMensErro, DRptRelats,uSistema,uFuncaoGeral, uModulo, uIntegraBack;
procedure TFrmParamResFinanCC.FazerQry;
var
  iNumElemCC, iNumElemGr : Integer;
Begin
  iNumElemCC := FuncaoGeral.CalcNumEleGrau(IntegraBack.MascaraCC,StrToInt(FloatToStr(dbseGrauCC.Value)));
  iNumElemGr := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraGrupoProd,StrToInt(FloatToStr(dbseGrauGrupo.Value)));

  With DtmRptRelats.QryResFinanCC Do
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                              ');
         Sql.Add('      SUBSTR(P.CODGRUPOPROD,1,'+IntToStr(iNumElemGr)+') AS CODGRUPOPROD,             ');
         Sql.Add('      SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+') AS CODCENTROCUSTO,         ');
         Sql.Add('      G.DESCGRUPOPROD,                                                               ');
         Sql.Add('      C.NOME,                                                                        ');
         Sql.Add('      SUM(round(M.VALORMOV, 2))*-1 AS VALORMOV,                                                ');
         Sql.Add('      DECODE(TOTGRP.TOTCC,0,0,((SUM(round(M.VALORMOV, 2))*-1)/TOTGRP.TOTCC * 100 )) AS PERCGRP,');
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
         Sql.Add('      (                                                                              ');
         Sql.Add('        SELECT                                                                       ');
         Sql.Add('            SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+') AS CODCENTROCUSTO,   ');
         Sql.Add('            SUM(round(M.VALORMOV, 2))*-1 AS TOTCC                                              ');
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
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (P.CODGRUPOPROD LIKE '''+ Trim(dblcGrp.LookUpValue)+'''||''%'' ) ');

         Sql.Add('          AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                ');
         Sql.Add('          AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                              ');
         Sql.Add('          AND ( (M.CODALMOXTRANSF IS NULL) OR                                        ');
         Sql.Add('              ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    ');
         Sql.Add('               AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))                 ');
         Sql.Add('          AND (SUBSTR(M.CODARTIGO,1,6) = P.CODPRODUTO)                               ');
         Sql.Add('         GROUP BY SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+')                ');
         Sql.Add('      ) TOTGRP,                                                                      ');
         Sql.Add('      (                                                                              ');
         Sql.Add('       SELECT                                                                        ');
         Sql.Add('            SUM(round(M.VALORMOV, 2))*-1 AS TOTAL                                              ');
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
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (P.CODGRUPOPROD LIKE '''+ Trim(dblcGrp.LookUpValue)+'''||''%'' ) ');

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
         Sql.Add('  AND (A.CONTABIL = ''T'')                                                           ');
         IF Trim(dblcCCust.Text) <> '' Then
            Begin
              Sql.Add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+ Trim(dblcCCust.LookUpValue)+''') ');
            End;
         IF Trim(dblcGrp.Text) <> '' Then
            Sql.Add(' AND (P.CODGRUPOPROD LIKE '''+ Trim(dblcGrp.LookUpValue)+'''||''%'' ) ');

         Sql.Add('  AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                        ');
         Sql.Add('  AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                                      ');
         Sql.Add('  AND ( (M.CODALMOXTRANSF IS NULL) OR                                        ');
         Sql.Add('      ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    ');
         Sql.Add('       AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))');
         Sql.Add('  AND (SUBSTR(M.CODARTIGO,1,6) = P.CODPRODUTO)                                       ');
         IF Trim(dblcGrp.Text) = '' Then
            Sql.Add('  AND (RTRIM(SUBSTR(P.CODGRUPOPROD,1,'+IntToStr(iNumElemGr)+')) = RTRIM(G.CODGRUPOPROD))  ')
         Else
            Sql.Add('  AND (P.CODGRUPOPROD = G.CODGRUPOPROD)  ');

         Sql.Add('  AND (RTRIM(SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+')) = RTRIM(C.CODCENTROCUSTO(+))) ');
         Sql.Add('  AND (M.IDEMPRESA = C.IDEMPRESA(+))                                                    ');
         Sql.Add('  AND (SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+') = TOTGRP.CODCENTROCUSTO(+))                                     ');
         Sql.Add('                                                                                     ');
         Sql.Add(' GROUP BY                                                                            ');
         Sql.Add('      SUBSTR(P.CODGRUPOPROD,1,'+IntToStr(iNumElemGr)+'),                             ');
         Sql.Add('      SUBSTR(M.CODCENTROCUSTO,1,'+IntToStr(iNumElemCC)+'),                           ');
         Sql.Add('      G.DESCGRUPOPROD,                                                               ');
         Sql.Add('      C.NOME,                                                                        ');
         Sql.Add('      TOTGRP.TOTCC,                                                                  ');
         Sql.Add('      TOT.TOTAL                                                                      ');
         Sql.Add(' ORDER BY C.NOME,                                                                    ');
         Sql.Add('          G.DESCGRUPOPROD                                                            ');
         Open;
        IF Not ChkImp.Checked Then
           Begin
              Filter   := ' VALORMOV <> 0 ';
              Filtered := True;
           End;
     End;
     DtmRptRelats.lbPer2.Caption := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;
procedure TFrmParamResFinanCC.edDataIExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) <> '' Then
    Begin
        IF EdDataI.Date > EdDataF.Date Then
          Begin
              MsgDlg('A data inicial não pode ser maior que a data final','Erro',mtError,[mbOk],0);
              EdDataI.SetFocus;
          End;
    End;
end;

procedure TFrmParamResFinanCC.EdDataFExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataF.Text) <> '' Then
    Begin
        IF EdDataF.Date < EdDataI.Date Then
          Begin
              MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
              EdDataF.SetFocus;
          End;
    End;
end;

procedure TFrmParamResFinanCC.FormCreate(Sender: TObject);
begin
  inherited;
  qryCCust.Close;
  qryCCust.Sql.text := ' Select CodCentroCusto,Nome From CentCust ' +
                       ' Where (idEmpresa = '+ IntToStr(Sistema.IdEmpresa ) +')'+
                       ' Order By Nome ';
  qryCCust.Open;

  edDataI.Date := Date;
  edDataF.Date := Date;
  //
  qryGrp.Close;
  qryGrp.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryGrp.Open;
  //

  dbseGrauCC.MinValue := 1;
  dbseGrauCC.MaxValue := FuncaoGeral.CalcGrauMax(IntegraBack.MascaraCC);
  dbseGrauCC.Value    := dbseGrauCC.MaxValue;
  //
  dbseGrauGrupo.MinValue := 1;
  dbseGrauGrupo.MaxValue := FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupoProd);
  dbseGrauGrupo.Value    := dbseGrauGrupo.MaxValue;

end;

procedure TFrmParamResFinanCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazerQry;
end;

end.
