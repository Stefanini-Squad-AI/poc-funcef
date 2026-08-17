unit FParamListaFundos;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, MontaSelect, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamListaFundos = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var FrmParamListaFundos: TFrmParamListaFundos;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorio, FDmRelatorios;

Procedure TFrmParamListaFundos.FazQry;
Var
  RecSaldos: TRecSaldos;
  wTotFundo: Double;
Begin

 With DtmRelatorio.QryFundos Do Begin
   Close;
   Sql.Clear;

   Sql.add(' SELECT  C.IDCONTRATOINVEST, C.IDEMISSOR, C.IDCORRETVALORES,            ');
   Sql.add('          C.IDTIPOCONTRINVEST, C.IDBOLSAVALORES,                        ');
   Sql.add('          C.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.SERIE,                ');
   Sql.add('          C.IDLOTE, C.DATACOMPRALOTE, C.DATAVENCIM, C.VLRCOMPRATITLOTE, ');
   Sql.add('          C.QTDETITLOTE, C.SALDOTITLOTE, C.VLRRESGATE,                  ');
   Sql.add('          C.PRECOVENCIM, C.IDCARTLASTRO,                                ');
   Sql.add('          C.IDCARTAVISTA, C.PRZVENC, C.QTDECOMPRATITLOTE,               ');
   Sql.add('          C.DATACARENCIA, C.ANIVERSARIO,                                ');
   Sql.add('          (0) AS ULTSALDOQTD,  (0) AS ULTSALDOVALOR                     ');
   Sql.add('                                                                        ');
   Sql.add('  FROM  CONTRATOINVESTIM C, INVESTIMENTO I                        ');
   Sql.add('                                                                        ');
   Sql.add('  WHERE                                                                 ');

   If (Trim(edDataRef.Text) <> '' )  Then Begin
     DtmRelatorio.ppLabel38.Caption    := edDataRef.Text;
     Sql.Add(' (C.DATACOMPRALOTE < = TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY''))  AND');
   End;

   Sql.add(' (I.IDINVESTIMENTO = C.IDINVESTIMENTO)                           ');

   Sql.add(' ORDER BY I.IDINVESTIMENTO, C.IDLOTE                             ');
   Open;
   First;

   wTotFundo := 0;
   While Not DtmRelatorio.QryFundos.Eof Do Begin
     RecSaldos := OperacaoInvest.BuscaSaldosLote(
                   DtmRelatorio.QryFundos.FieldByName('IDINVESTIMENTO').AsInteger,
                   DtmRelatorio.QryFundos.FieldByName('IDLOTE').AsString,
                   Date);
     DtmRelatorio.QryFundos.Edit;
     DtmRelatorio.QryFundos.FieldByName('ULTSALDOQTD').AsFloat   := RecSaldos.SldQtdInvCart;
     DtmRelatorio.QryFundos.FieldByName('ULTSALDOVALOR').AsFloat := RecSaldos.SldVlrInvCart;
     wTotFundo := wTotFundo+RecSaldos.SldVlrInvCart;
     DtmRelatorio.QryFundos.Post;
     DtmRelatorio.QryFundos.Next;
   End;
 End;
End;

procedure TFrmParamListaFundos.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamListaFundos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (trim(edDataRef.Text) = '') Then Begin
     MsgDlg('Preencher Data. ','Erro',mtError,[mbOK],0);
     edDataRef.SetFocus;
  End;

  FazQry;

  DtmRelatorio.QryFundos.Open;

end;


end.
