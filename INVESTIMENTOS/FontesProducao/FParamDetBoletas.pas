//********************************************************************************************************
// Data      : 07/03/2006
// Código    : AL_1
// Motivo    : Implementação de filtragem para não trazer Operações em Carteira Gerencial
//********************************************************************************************************

unit FParamDetBoletas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamDetBoletas = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label3: TLabel;
    edBoleta: TEdit;
    BtMostraCot: TSpeedButton;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure BtMostraCotClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamDetBoletas: TFrmParamDetBoletas;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios;

Procedure TfrmParamDetBoletas.FazQry;
Begin
 With DmRelatorios.qryDetBoleta Do Begin
   Close;
   Sql.Clear;
   Sql.add(' SELECT                                                            ');
   Sql.add('  BV.SGLBOLSAVALORES,   OI.DATAOPERACAO, OI.DATAVENCOPER,       ');
   Sql.add('  OI.QTDEOPERACAO,      DOP.VLRDESPOPER, DOP.IDTIPODESPINVEST,  ');
   Sql.add('  OI.PRECOUNITOPERACAO, OI.VLROPERACAO,  DS.TOTALDESPESAS,      ');
   Sql.add('  SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                   ');
   Sql.add('  PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO,');
   Sql.add('  TI.DESCTIPOOPERACAO,  OI.NUMDOCUMENTO,');
   Sql.add('  TI.NATUREZAOPERACAO,  TP.DESCTIPODESPINV, TP.NATUREZAOPERACAO AS DESPNATUR, ');
   Sql.add('  CA.DESCCARTINVEST,    DS.IDOPERACAOINVEST');

   Sql.add(' FROM                                       ');
   Sql.add('  OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,');
   Sql.add('  INVESTIMENTO IV,   TIPOOPERACAO TI, MERCADO ME, DESPOPERINVEST DOP,');
   Sql.add('  TIPODESPINVEST TP, CARTEIRAINVEST CA,');

   Sql.add('  (SELECT IDOPERACAOINVEST, SUM(VLRDESPOPER) AS TOTALDESPESAS');
   Sql.add('   FROM DESPOPERINVEST GROUP BY IDOPERACAOINVEST) DS');


   Sql.add(' WHERE                                      ');

   If (Trim(edDataRef.Text) <> '' )  Then Begin
     DmRelatorios.lbDataRef.Caption    := edDataRef.Text;
     Sql.Add(' (OI.DATAOPERACAO = TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
   End;

   If Trim(edBoleta.Text) <> '' Then
     Sql.add('  AND (OI.NUMDOCUMENTO = '''+EdBoleta.Text+''')    ');

   Sql.add('  AND (TP.NATUREZAOPERACAO  <> ''N'')              ');
   //AL_1
   Sql.add('  AND (OI.IDCARTEIRAGERENC IS NULL)  ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = OA.IDOPERACAOINVEST)  ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = DS.IDOPERACAOINVEST)  ');
   Sql.add('  AND (OI.IDCORRETVALORES   = PS.IDPESSOA)          ');
   Sql.add('  AND (OA.IDBOLSAVALORES    = BV.IDBOLSAVALORES)    ');
   Sql.add('  AND (OA.IDACAO 	        = IV.IDINVESTIMENTO)    ');
   Sql.add('  AND (TI.IDMERCADO         = ME.IDMERCADO)         ');
   Sql.add('  AND (OI.IDTIPOOPERACAO    = TI.IDTIPOOPERACAO)    ');
   Sql.add('  AND (DOP.IDTIPODESPINVEST = TP.IDTIPODESPINVEST)  ');
   Sql.add('  AND (OI.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)  ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = DOP.IDOPERACAOINVEST) ');

   Sql.add('  ORDER BY                                  ');
   Sql.add('        OI.DATAOPERACAO,                    ');
   Sql.add('        OI.NUMDOCUMENTO,                    ');
   Sql.add('        OI.IDOPERACAOINVEST,                ');
   Sql.add('        DOP.IDTIPODESPINVEST                ');
   Open;

 End;
End;

procedure TFrmParamDetBoletas.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;

end;

procedure TFrmParamDetBoletas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamDetBoletas.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamDetBoletas.BtMostraCotClick(Sender: TObject);
begin
  inherited;
//  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
     edDataRef.Date  := StrToDate(MontaSelect.ValoresChave[0]);
     edBoleta.Text   := MontaSelect.ValoresChave[1];
  End;
end;

end.
