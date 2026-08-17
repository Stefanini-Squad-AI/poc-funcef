unit FParamSugestComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti;

type
  TFrmParamSugestComp = class(TfrmOkCancelar)
    GrpAnalise: TGroupBox;
    qryAnalise: TwwQuery;
    dblcAnalise: TCMDBLookupCombo;
    chkZero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamSugestComp: TFrmParamSugestComp;

implementation

{$R *.DFM}
Uses uModulo, uSistema, uMensErro,DRptRelats;

procedure TFrmParamSugestComp.FormCreate(Sender: TObject);
begin
  inherited;
   With qryAnalise Do
      Begin
          Close;
          Params[0].asInteger := Modulo.iCodAlmoxa;
          Params[1].asInteger := Sistema.idEmpresa;
          Open;
      End;
end;
Procedure TFrmParamSugestComp.FazQry;
Begin
    With DtmRptRelats.qrySugestComp Do
      Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT                   ');
          Sql.Add('     I.IDANALISEESTOQUE, ');
          Sql.Add('     A.CODARTIGO,        ');
          Sql.Add('     P.DESCPROD || '' '' || RTRIM(A.CODCOR ) ||'' ''|| RTRIM(A.CODTAMANHO) AS PRODUTO, ');
          Sql.Add('     DECODE(FLGTEMPMEDCALC,''S'',TRMEDCALCULADO,TRMEDINFORMADO) AS TEMPOMED,        ');
          Sql.Add('     DECODE(FLGCONSMEDCALC,''S'',CONSMEDCALCULADO,CONSMEDINFORMADO) AS CONSMED,     ');
          Sql.Add('     DECODE(FLGPONTOREPCALC,''S'',PONTOREPCALCULADO,PONTOREPINFORMADO) AS PONTOREP, ');
          Sql.Add('     DECODE(FLGQTDEMINCALC,''S'',QTDEMINCALCULADA,QTDEMININFORMADA) AS QTDEMIN,     ');
          Sql.Add('     I.QTDESUGAUTO,      ');
          Sql.Add('     I.QTDESUGCALCULADA, ');
          Sql.Add('     I.QTDECOMPRAR,      ');
          Sql.Add('     I.SALDOESTOQUE,     ');
          Sql.Add('     P.CODMEDCUSTO       ');
          Sql.Add('FROM                     ');
          Sql.Add('    ITEMANALISEESTOQ I,  ');
          Sql.Add('    ARTIGO A,            ');
          Sql.Add('    PRODUTO P            ');
          Sql.Add('WHERE                    ');
          Sql.Add('      (I.IDANALISEESTOQUE = '+dblcAnalise.LookupValue+') ');
          If chkZero.Checked Then
             Sql.Add('  AND ( ( I.QTDESUGCALCULADA <> 0 ) OR (I.QTDECOMPRAR <> 0) ) ');

          Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)   ');
          Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO) ');
          Sql.Add('ORDER BY PRODUTO                    ');
          Open;
      End;
End;

procedure TFrmParamSugestComp.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(dblcAnalise.Text) = '' Then
     Begin
         ModalResult := mrNone;
         msgDlg('A Análise não foi preenchido','Erro',mtError,[mbOK],0);
         dblcAnalise.SetFocus;
         Abort;
     End;
  inherited;
  FazQry;

end;

end.
