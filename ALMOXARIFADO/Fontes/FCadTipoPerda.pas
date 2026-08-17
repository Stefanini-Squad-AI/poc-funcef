unit FCadTipoPerda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadTipoPerda = class(TfrmCadastroCS)
    qryIDTIPOPERDA: TFloatField;
    qryDESCTIPOPERDA: TStringField;
    qryCONSUMO: TStringField;
    edDesc: TDBEdit;
    LbDesc: TLabel;
    chkConsumo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadTipoPerda: TFrmCadTipoPerda;

implementation

{$R *.DFM}
Uses UDataBase;

Procedure TFrmCadTipoPerda.Sel( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
End;

Procedure TFrmCadTipoPerda.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    EdDesc.SetFocus;
    qry.FieldByName('CONSUMO').AsString := 'S';
End;

Procedure TFrmCadTipoPerda.CmeCadastroEdit(Sender: TObject);
Begin
    Inherited;
    EdDesc.SetFocus;
End;

Procedure TFrmCadTipoPerda.CmeCadastroConfirma(Sender: TObject);
Begin
  If qry.State in [dsInsert,dsEdit] Then
    Begin
         if qry.State = dsInsert Then
              qry.FieldByName('IDTIPOPERDA').asInteger := LeUltRegistro(nil,'TIPOPERDA');
    End;          
   inherited;
End;
procedure TFrmCadTipoPerda.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1 );
end;

Procedure TFrmCadTipoPerda.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
       Sel( StrToInt(MontaSelect.ValoresChave[0]) );
    End;
End;

end.
