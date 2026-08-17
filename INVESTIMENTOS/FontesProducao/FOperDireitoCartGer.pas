unit FOperDireitoCartGer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TFrmOperDireitoCartGer = class(TfrmOkCancelar)
    PnlOrigem: TPanel;
    Panel1: TPanel;
    dbgOrigemDirJur: TwwDBGrid;
    QryOrigemDivJurCart: TwwQuery;
    QryOrigemDivJurCartDESCINVESTIMENTO: TStringField;
    QryOrigemDivJurCartQTDEDIREITO: TFloatField;
    QryOrigemDivJurCartVALOREXERCIDO: TFloatField;
    QryOrigemDivJurCartVLRREMUNERACAO: TFloatField;
    QryOrigemDivJurCartIR: TFloatField;
    QryOrigemDivJurCartVLRLIQ: TFloatField;
    QryOrigemDivJurCartSGLCUSTODIANTE: TStringField;
    QryOrigemDivJurCartSIGLAMOTBLOQ: TStringField;
    QryOrigemDivJurCartDATAREFERENCIA: TDateTimeField;
    QryOrigemDivJurCartQTDE: TFloatField;
    QryOrigemDivJurCartVLRCUSTOATUAL: TFloatField;
    QryOrigemDivJurCartIDLOTE: TStringField;
    QryOrigemDivJurCartVLRIRREMUNERACAO: TFloatField;
    QryOrigemDivJurCartIDCARTEIRAINVEST: TFloatField;
    QryOrigemDivJurCartIDINVESTIMENTO: TFloatField;
    QryOrigemDivJurCartIDCUSTODIANTE: TFloatField;
    QryOrigemDivJurCartIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemDivJurCartPERCENTUALINV: TFloatField;
    QryOrigemDivJurCartVLRCUSTO: TFloatField;
    UpdOrigemDivJurCart: TUpdateSQL;
    DsOrigemDivJurCart: TwwDataSource;
    QryOrigemDivJurCartDESCCARTGERENC: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure QryOrigemDivJurCartQTDEDIREITOSetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
     function MontaOperDireito(QtdeDir            : Double;
                               VlrOper, IrExer    : Currency;
                               iIdOperDir         : Integer) : Boolean;

  end;

var
  FrmOperDireitoCartGer : TFrmOperDireitoCartGer;
  fVlrRendimento : Double;

implementation

uses FCadOperAgeNovo, UOperComum, UImpostos;

{$R *.DFM}

procedure TFrmOperDireitoCartGer.FormActivate(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
end;

function TFrmOperDireitoCartGer.MontaOperDireito(QtdeDir            : Double;
                                                 VlrOper, IrExer    : Currency;
                                                 iIdOperDir         : Integer) : Boolean;
begin
   Try
      QryOrigemDivJurCart.Close;
      QryOrigemDivJurCart.ParamByName('IDCARTEIRAGERENC').AsInteger  :=
         frmCadOperAGENovo.QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger;
      QryOrigemDivJurCart.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperDir;
      QryOrigemDivJurCart.Open;

      QryOrigemDivJurCart.Edit;
      QryOrigemDivJurCart.FieldByName('QTDE').AsFloat          := QtdeDir;
      QryOrigemDivJurCart.FieldByName('QTDEDIREITO').AsFloat   := QtdeDir;
      QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat := VlrOper;
      QryOrigemDivJurCart.FieldByName('IR').AsFloat            := IrExer;
      If frmCadOperAGENovo.QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' Then
         QryOrigemDivJurCart.FieldByName('VLRLIQ').AsFloat     := VlrOper
      Else
         QryOrigemDivJurCart.FieldByName('VLRLIQ').AsFloat     := VlrOper-IrExer;

      QryOrigemDivJurCart.Post;

      QryOrigemDivJurCart.Edit;

      dbgOrigemDirJur.Options := dbgOrigemDirJur.Options - [TwwDBgridOption(dgEditing)];

     Result := True;      
  Except
     Result := False;
  End;
end;

procedure TFrmOperDireitoCartGer.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   QryOrigemDivJurCart.Post;
   frmCadOperAGENovo.wQtdeDireitoCart := QryOrigemDivJurCart.FieldByName('QTDEDIREITO').AsFloat;
   frmCadOperAGENovo.wVlrOperacaoCart := QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat;
   frmCadOperAGENovo.wIRExercidoCart  := QryOrigemDivJurCart.FieldByName('IR').AsFloat;
   QryOrigemDivJurCart.Close;
   Close;
end;

procedure TFrmOperDireitoCartGer.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   QryOrigemDivJurCart.Cancel;
end;

procedure TFrmOperDireitoCartGer.bbtnSairClick(Sender: TObject);
begin
  inherited;
   QryOrigemDivJurCart.Close;
   Close;
end;

procedure TFrmOperDireitoCartGer.QryOrigemDivJurCartQTDEDIREITOSetText(
  Sender: TField; const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;
    eIRExercido := 0;
    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    QryOrigemDivJurCart.FieldByName('QTDEDIREITO').AsFloat    := StrToFloat(sValor);
    QryOrigemDivJurCart.FieldByName('QTDE').AsFloat           := StrToFloat(sValor);
    QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat  := OperComum.Round(
      (QryOrigemDivJurCart.FieldByName('QTDEDIREITO').AsFloat *
          OperComum.DivValorZero(Reg.DIVPORACAO,
                                 frmCadOperAGENovo.QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                                 QryOrigemDivJurCart.FieldByName('VLRREMUNERACAO').AsFloat;

    fVlrRendimento := 0;
    if frmCadOperAGENovo.QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                                QryOrigemDivJurCart.FieldByName('IDINVESTIMENTO').AsInteger,
                                0{CARTEIRAGERENC},
                                QryOrigemDivJurCart.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                frmCadOperAGENovo.QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                                Reg.IDMERCADO,
                                QryOrigemDivJurCart.FieldByName('IDLOTE').AsString,
                                Date, Date,
                                0,
                                QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat, 0, 'S',
                                Reg.FLGTRATAIR,fVlrRendimento);

    eIRExercido   := eIRExercido + QryOrigemDivJurCart.FieldByName('VLRREMUNERACAO').AsFloat;

    QryOrigemDivJurCart.FieldByName('IR').AsFloat              := eIRExercido;
    if frmCadOperAGENovo.QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'S' then
       QryOrigemDivJurCart.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat
    else
       QryOrigemDivJurCart.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJurCart.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;
end;

end.
