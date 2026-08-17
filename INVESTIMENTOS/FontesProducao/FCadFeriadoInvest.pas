unit FCadFeriadoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CmEventosCadastro, ImgList;

type
  TfrmCadFeriadoInvest = class(TfrmCadastroCS)
    qryIDFERIADOINVEST: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryFLGFERIADO: TStringField;
    qryDATAFERIADO: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    DsBolsaValores: TwwDataSource;
    DbLkcBolsa: TwwDBLookupCombo;
    QryTipoInvest: TwwQuery;
    DsAux: TwwDataSource;
    DblkcTipoInvest: TwwDBLookupCombo;
    DbDateFeriado: TCMDateTimePicker;
    DBChbFlagFeriado: TDBCheckBox;
    qryIDBOLSAVALORES: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure Sel( N : LongInt );
    Procedure CmeCadastroFind(Sender: TObject);

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFeriadoInvest: TfrmCadFeriadoInvest;

implementation

{$R *.DFM}
Uses UDataBase;

Procedure TfrmCadFeriadoInvest.Sel( N : LongInt );
Begin
   qry.Close;
   qry.ParamByName('IDFERIADOINVEST').asInteger  := n;
   qry.Open;
   QryBolsaValores.Close;
   QryTipoInvest.Close;
   QryBolsaValores.Open;
   QryTipoInvest.Open;
End;

procedure TfrmCadFeriadoInvest.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          Sel(StrToInt(MontaSelect.ValoresChave[0]));
      End;
End;

procedure TfrmCadFeriadoInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  QryBolsaValores.Close;
  QryTipoInvest.Close;
end;

procedure TfrmCadFeriadoInvest.bbtnConfirmarClick(Sender: TObject);
begin
  if qry.State in [dsinsert] Then
    qry.FieldByName('IDFERIADOINVEST').AsInteger := LeUltRegistro(nil,'FERIADOINVEST');

  inherited;
end;

procedure TfrmCadFeriadoInvest.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

end.
