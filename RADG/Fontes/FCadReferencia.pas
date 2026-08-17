unit FCadReferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TFrmCadReferencia = class(TfrmCadastroGridCS)
    qryIDREFERENCIA: TFloatField;
    qryDESCREFERENCIA: TStringField;
    Label1: TLabel;
    edDesc: TDBEdit;
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadReferencia: TFrmCadReferencia;

implementation

{$R *.DFM}

Uses uDataBase, uMensErro;

procedure TFrmCadReferencia.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    edDesc.SetFocus;
End;

procedure TFrmCadReferencia.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    edDesc.SetFocus;
End;

Procedure TFrmCadReferencia.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    if Trim(edDesc.Text) = '' Then
       Begin
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
          edDesc.SetFocus;
          Accept := False;
       End;
End;

procedure TFrmCadReferencia.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State = dsInsert Then
       Begin
          qryIDREFERENCIA.AsInteger := LeUltRegistro(nil,'RADREFERENCIA');
          AplicaAlteracoes([qry]);
       End
    Else
       inherited;
End;


procedure TFrmCadReferencia.FormShow(Sender: TObject);
begin
  inherited;
  if Not qry.IsEmpty Then
     Begin
         sbtnAlterar.Enabled := True;
         sbtnApagar.Enabled  := True;
     End;

end;

end.
