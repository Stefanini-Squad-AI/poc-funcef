//inicio andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamConAlmoxContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CMProcuraMask, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamConAlmoxContab = class(TfrmOkCancelar)
    pmConta: TCMProcuraMaskContabil;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    chkDif: TCheckBox;
    chkIntegra: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIExit(Sender: TObject);
    procedure EdDataFExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamConAlmoxContab: TFrmParamConAlmoxContab;

implementation

{$R *.DFM}
uses DRptRelats,uSistema, uMensErro, uCMTypes, uIntegraBack;

Procedure TFrmParamConAlmoxContab.FazerQry;
Begin
  DtmRptRelats.LbInteg.Caption := ' NÃO ';
  DtmRptRelats.LbDif.Caption   := ' NÃO ';

   With DtmRptRelats.QryConAlmoxContab DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                  ');
         Sql.Add('     UN.DATA,                                                            ');
         Sql.Add('     UN.CONTA,                                                           ');
         Sql.Add('     SUM(UN.ALMOXCREDITO) AS ALMOXCREDITO,                                                    ');
         Sql.Add('     SUM(UN.ALMOXDEBITO) AS ALMOXDEBITO,                                                     ');
         Sql.Add('     SUM(UN.CONTABCREDITO) AS CONTABCREDITO,                                                   ');
         Sql.Add('     SUM(UN.CONTABDEBITO) AS CONTABDEBITO,                                                    ');
         Sql.Add('     SUM((UN.ALMOXCREDITO - UN.CONTABCREDITO)) AS DIFCREDITO,                 ');
         Sql.Add('     SUM((UN.ALMOXDEBITO - UN.CONTABDEBITO)) AS DIFDEBITO                     ');
         Sql.Add(' FROM                                                                       ');
         Sql.Add(' (                                                                          ');
         Sql.Add(' SELECT                                                                     ');
         Sql.Add('      M.DATAMOV AS DATA,                                                    ');
         Sql.Add('      DECODE(ART.CONTA,NULL,GRP.CONTA,ART.CONTA) AS CONTA,                  ');
         Sql.Add('      SUM(DECODE(M.CODTIPOMOV,''A'',0,DECODE(SIGN(round(M.VALORMOV, 2)),-1,round(M.VALORMOV, 2) * -1,0))) AS  ALMOXCREDITO,  ');
         Sql.Add('      SUM(DECODE(M.CODTIPOMOV,''A'',round(M.VALORMOV, 2),DECODE(SIGN(round(M.VALORMOV, 2)),1,round(M.VALORMOV, 2),0))) AS ALMOXDEBITO,          ');
         Sql.Add('      (0) AS CONTABCREDITO,                                              ');
         Sql.Add('      (0) AS CONTABDEBITO                                                ');
         Sql.Add(' FROM                                                                    ');
         Sql.Add('      MOVIMENT M,                                                        ');
         Sql.Add('      PRODUTO P,                                                         ');
         Sql.Add('      ALMOX A,                                                           ');
         Sql.Add('      ALMOX T,                                                           ');
         Sql.Add('      ( SELECT                                                           ');
         Sql.Add('             CODARTIGO,                                                  ');
         Sql.Add('             CONTAENTRADA AS CONTA                                       ');
         Sql.Add('        FROM                                                             ');
         Sql.Add('             ARTXCONTAXCC                                                ');
         Sql.Add('        GROUP BY CODARTIGO, CONTAENTRADA                                 ');
         Sql.Add('       ) ART,                                                            ');
         Sql.Add('       ( SELECT                                                          ');
         Sql.Add('             CODGRUPOPROD,                                               ');
         Sql.Add('             CONTAENTRADA AS CONTA                                       ');
         Sql.Add('        FROM                                                             ');
         Sql.Add('             ARTXCONTAXCC                                                ');
         Sql.Add('        GROUP BY CODGRUPOPROD, CONTAENTRADA                              ');
         Sql.Add('       ) GRP                                                             ');
         Sql.Add(' WHERE                                                                   ');
         Sql.Add('         (M.DATAMOV >= TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY''))     ');
         Sql.Add('     AND (M.DATAMOV <= TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY''))     ');
         Sql.Add('     AND (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')');
         Sql.Add('     AND (A.CONTABIL = ''T'') AND (M.CODTIPOMOV <> ''Z'')                ');
         Sql.Add('     AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                         ');
         Sql.Add('     AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                       ');
         Sql.Add('     AND ( (M.CODALMOXTRANSF IS NULL) OR                                    ');
         Sql.Add('         ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)');
         Sql.Add('          AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))');
         Sql.Add('     AND (SUBSTR(M.CODARTIGO,1,6) = P.CODPRODUTO)                        ');
         Sql.Add('     AND (M.CODARTIGO = ART.CODARTIGO(+))                                ');
         Sql.Add('     AND (P.CODGRUPOPROD = GRP.CODGRUPOPROD(+))                             ');
         Sql.Add(' GROUP BY                                                                ');
         Sql.Add('       M.DATAMOV,                                                        ');
         Sql.Add('       DECODE(ART.CONTA,NULL,GRP.CONTA,ART.CONTA),                       ');
         Sql.Add('       DECODE(ART.CONTA,NULL,''G'',''A'')                                ');
         Sql.Add(' UNION ALL                                                               ');
         Sql.Add('    SELECT                                                               ');
         Sql.Add('         PLN.PLNDATDIA AS DATA,                                          ');
         Sql.Add('         LAC.PLACONTA AS CONTA,                                          ');
         Sql.Add('         (0) AS ALMOXCREDITO,                                            ');
         Sql.Add('         (0) AS ALMOXDEBITO,                                             ');
         Sql.Add('         SUM(DECODE(LAC.LACDEBCRE,''C'',LAC.LACVALOR,0)) AS CONTABCREDITO,');
         Sql.Add('         SUM(DECODE(LAC.LACDEBCRE,''D'',LAC.LACVALOR,0)) AS CONTABDEBITO ');
         Sql.Add('    FROM                                                                 ');
         Sql.Add('        LANCAMENTO LAC,                                                  ');
         Sql.Add('        PLANILHA PLN                                                     ');
         Sql.Add('    WHERE                                                                ');
         Sql.Add('          (PLN.PLNDATDIA >= TO_DATE('''+EdDataI.Text+''',''DD/MM/YYYY''))');
         Sql.Add('      AND (PLN.PLNDATDIA <= TO_DATE('''+EdDataF.Text+''',''DD/MM/YYYY''))');
     If chkIntegra.Checked Then
       Begin
         DtmRptRelats.LbInteg.Caption := ' SIM ';
         Sql.Add('              AND (PLN.PLNEFETIVADO = ''S'') ');
       End;
         Sql.Add('              AND (PLN.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')         ');
         Sql.Add('              AND (PLN.PLNCODIGO = LAC.PLNCODIGO)                          ');
         Sql.Add('            GROUP BY PLN.PLNDATDIA, LAC.PLACONTA                           ');
         Sql.Add('          ) UN                                                             ');
         Sql.Add(' WHERE ( RTRIM(UN.CONTA) = '''+Trim(pmConta.Conta.Numero)+''')');
         Sql.Add(' GROUP BY                                                                  ');
         Sql.Add('     UN.DATA,                                                              ');
         Sql.Add('     UN.CONTA                                                              ');
     If chkDif.Checked Then
       Begin
         DtmRptRelats.LbDif.Caption := ' SIM ';
         Sql.Add(' HAVING                                                          ');
         Sql.Add('     (SUM((UN.ALMOXCREDITO - UN.CONTABCREDITO)) <> 0) OR         ');
         Sql.Add('     (SUM((UN.ALMOXDEBITO - UN.CONTABDEBITO)) <> 0)            ');
       End;
         Sql.Add(' ORDER BY UN.DATA, UN.CONTA                                                ');
         Open;
     End;
     DtmRptRelats.LbConta.Caption := pmConta.Conta.Nome;
     DtmRptRelats.LbPer13.Caption := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;

procedure TFrmParamConAlmoxContab.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If pmConta.Valida <> vcOk Then
    Begin
       ModalResult := MrNone;
    End
  Else
    Begin
       ModalResult := MrOk;
       FazerQry;
    End;
end;

procedure TFrmParamConAlmoxContab.edDataIExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataF.Text) <> '' Then
    Begin
        IF StrToDate(EdDataI.Text) > StrToDate(EdDataF.Text) Then
          Begin
              MsgDlg('A data inicial não pode ser maior que a data final','Erro',mtError,[mbOk],0);
              EdDataI.SetFocus;
          End;
    End;
end;

procedure TFrmParamConAlmoxContab.EdDataFExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) <> '' Then
    Begin
        IF StrToDate(EdDataF.Text) < StrToDate(EdDataI.Text) Then
          Begin
              MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
              EdDataF.SetFocus;
          End;
    End;
end;

procedure TFrmParamConAlmoxContab.FormCreate(Sender: TObject);
begin
  inherited;
  pmConta.Mascara := IntegraBack.MascaraPlano;
  pmConta.Plano   := IntegraBack.Plano;
  edDataI.Date    := Date;
  edDataF.Date    := Date;
end;

End.









































