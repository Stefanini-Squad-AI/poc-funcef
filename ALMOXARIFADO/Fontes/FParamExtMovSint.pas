unit FParamExtMovSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamExtMovSint = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    qryGrpProd: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    chkImpSaldo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamExtMovSint: TFrmParamExtMovSint;

implementation

{$R *.DFM}
Uses DRptRelats, uSistema, uMensErro;
procedure TFrmParamExtMovSint.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

Procedure TFrmParamExtMovSint.FazQry;

Begin
   With DtmRptRelats.QryExtMovSint DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT /* + rule */ ');
         Sql.Add('   G.CODGRUPOPROD, ');
         Sql.Add('   G.DESCGRUPOPROD, ');
         Sql.Add('   M.CODARTIGO,     ');
         Sql.Add('   P.DESCPROD,      ');
         Sql.Add('   P.CODMEDCUSTO,   ');
         Sql.Add('   (DECODE (SIGN(M.VALORMOV), 1,SUM(M.VALORMOV) ) )   as VALENTRADA,  ');
         Sql.Add('   (DECODE (SIGN(M.VALORMOV), -1,SUM(M.VALORMOV)*(-1) ) ) as VALSAIDA,');
         Sql.Add('   (DECODE (SIGN(M.QTDEMOV), 1,SUM(M.QTDEMOV) ) )   as QTDENTRADA,    ');
         Sql.Add('   (DECODE (SIGN(M.QTDEMOV), -1,SUM(M.QTDEMOV)*(-1) ) ) as QTDSAIDA,  ');
         Sql.Add('   S.SALDOQTDE,                                                       ');
         If chkImpSaldo.Checked Then
         Begin
            Sql.Add('   MIN(ANT.SALDOVLRANT)  AS SALDOVLRANT,  ');
            Sql.Add('   MIN(ANT.SALDOQTDEANT) AS SALDOQTDEANT ');
         End
         Else
         Begin
            Sql.Add('   (0) AS SALDOVLRANT,  ');
            Sql.Add('   (0) AS SALDOQTDEANT ');
         End;
         Sql.Add(' FROM ');
         If chkImpSaldo.Checked Then
         Begin
            Sql.Add('      (                            ');
            Sql.Add('        SELECT                     ');
            Sql.Add('              M.CODARTIGO,');
            Sql.Add('              (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS SALDOVLRANT, ');
            Sql.Add('              (M.SALDOQTDEMOV) AS SALDOQTDEANT ');
            Sql.Add('        FROM                       ');
            Sql.Add('              MOVIMENT M,          ');
            Sql.Add('              (                    ');
            Sql.Add('               SELECT M.CODARTIGO, ');
            Sql.Add('                      MAX(M.IDMOV) AS MAXIDMOV  ');
            Sql.Add('               FROM MOVIMENT M,                 ');
            Sql.Add('                    ( SELECT M.CODARTIGO ,MAX(M.DATAMOV) AS DATAMOV ');
            Sql.Add('                      FROM MOVIMENT M                               ');
            Sql.Add('                      WHERE (1=1)                                   ');
            Sql.Add('                        AND (M.CODALMOXARIFADO = ' + dblcAlmox.LookUpValue + ') ');
            Sql.Add('                        AND (M.DATAMOV < TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY'') ) ');
            Sql.Add('                        AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')  ');
            Sql.Add('                      GROUP BY M.CODARTIGO ');
            Sql.Add('                      ) SUB ');
            Sql.Add('               WHERE                           ');
            Sql.Add('                    (M.DATAMOV = SUB.DATAMOV ) ');
            Sql.Add('               GROUP BY M.CODARTIGO ');
            Sql.Add('              ) AUX      ');
            Sql.Add('        WHERE                                  ');
            Sql.Add('             (M.IDMOV = AUX.MAXIDMOV)          ');
            Sql.Add('      ) ANT,                                   ');
         End;
         Sql.Add('    MOVIMENT M, ');
         Sql.Add('    SALDO S,    ');
         Sql.Add('    ARTIGO A, ');
         Sql.Add('    PRODUTO P, ');
         Sql.Add('    GRUPPROD G ');
         Sql.Add(' WHERE ');
         Sql.Add('       (M.CODALMOXARIFADO = ' + dblcAlmox.LookUpValue + ')  ');
         Sql.Add('   AND (S.CODALMOXARIFADO = ' + dblcAlmox.LookUpValue + ')  ');
         Sql.Add('   AND (M.IDPESSOA        = ' + IntToStr(Sistema.IdEmpresa) + ') ');
         Sql.Add('   AND (M.DATAMOV        >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
         Sql.Add('   AND (M.DATAMOV        <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
         If Trim(dblcGrpProd.Text) <> '' Then
            Sql.Add(' And (P.CODGRUPOPROD = '''+ dblcGrpProd.LookUpValue +''') ');

         Sql.Add('   AND (M.CODARTIGO = A.CODARTIGO) ');
         Sql.Add('   AND (A.CODPRODUTO = P.CODPRODUTO) ');
         If chkImpSaldo.Checked Then
            Sql.Add('   And (M.CODARTIGO = ANT.CODARTIGO(+)) ');
         Sql.Add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD) ');
         Sql.Add('   AND (M.CODARTIGO = S.CODARTIGO) ');
         Sql.Add(' GROUP BY ');
         Sql.Add('      G.CODGRUPOPROD, ');
         Sql.Add('      G.DESCGRUPOPROD, ');
         Sql.Add('      M.CODARTIGO, ');
         Sql.Add('      P.DESCPROD, ');
         Sql.Add('      M.VALORMOV, ');
         Sql.Add('      M.QTDEMOV,  ');
         Sql.Add('      P.CODMEDCUSTO, S.SALDOQTDE');
         Open;
     End;
     DtmRptRelats.lbAlmox7.Caption := dblcAlmox.Text;
     DtmRptRelats.lbPer7.Caption   := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;


procedure TFrmParamExtMovSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAlmox.Text) = '' Then
     Begin
         MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOK],0);
         dblcAlmox.SetFocus;
     End
  Else
     FazQry;
end;

end.
