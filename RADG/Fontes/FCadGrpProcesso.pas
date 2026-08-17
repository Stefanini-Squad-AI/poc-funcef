unit FCadGrpProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadGrpProcesso = class(TfrmCadastroCS)
    qryIDGRUPOPROCESSO: TFloatField;
    qryDESCGRUPOPROCESSO: TStringField;
    Label1: TLabel;
    edDesc: TDBEdit;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadGrpProcesso: TFrmCadGrpProcesso;

implementation

{$R *.DFM}
Uses uDataBase, uMensErro;


Procedure TFrmCadGrpProcesso.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].AsInteger := n;
   qry.Open;
End;

procedure TFrmCadGrpProcesso.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    edDesc.SetFocus;
End;

procedure TFrmCadGrpProcesso.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    edDesc.SetFocus;
End;

Procedure TFrmCadGrpProcesso.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
       Sel(StrToInt(MontaSelect.ValoresChave[0]));
End;

Procedure TFrmCadGrpProcesso.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    if Trim(edDesc.Text) = '' Then
       Begin
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
          edDesc.SetFocus;
          Accept := False;
       End;
End;

procedure TFrmCadGrpProcesso.CmeCadastroConfirma(Sender: TObject);
Begin
   If qry.State = dsInsert Then
      qryIDGRUPOPROCESSO.AsInteger := LeUltRegistro(nil,'RADGRUPOPROCESSO');
   inherited;

End;

procedure TFrmCadGrpProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

end.
