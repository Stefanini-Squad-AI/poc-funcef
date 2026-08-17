unit FCLassInstFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  FCadastro, Db, DBTables, Wwquery, cmseldlg, wwidlg, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, Mask, FCadastroCS, MontaSelect, TREdit,
  CmEventosCadastro, ImgList, FCadastroCSInv, fcLabel;

type
  TFrmCadClassInstFin = class(TfrmCadastroCSInv)
    Label1: TLabel;
    edDescricao: TDBEdit;
    Label6: TLabel;
    qryIDCLASSINSTFIN: TFloatField;
    qryDESCCLASSINSTFIN: TStringField;
    qrySIGLACLASSINSTFIN: TStringField;
    qryPERCLIMINSTFIN: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    dbLimite: TDBRealEdit;
    edSigla: TDBEdit;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    //
    procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadClassInstFin: TFrmCadClassInstFin;

implementation

{$R *.DFM}
Uses  uMensErro,uDataBase;

Procedure TFrmCadClassInstFin.Sel( N : LongInt );
Begin
   qry.Close;
   qry.ParamByName('CLASSIFICACAO').asInteger  := n;
   qry.Open;
End;

procedure TFrmCadClassInstFin.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   edDescricao.SetFocus;
End;

procedure TFrmCadClassInstFin.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   edDescricao.SetFocus;
End;

procedure TFrmCadClassInstFin.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          Sel(StrToInt(MontaSelect.ValoresChave[0]));
      End;
End;

Procedure TFrmCadClassInstFin.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edDescricao.text) = '' then
      Begin
         MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
         edDescricao.SetFocus;
         Accept := False;
      end
    Else
    If Trim(edSigla.text) = '' then
      Begin
         MsgDlg('Sigla não preenchida','Erro',mtError,[mbOK],0);
         edSigla.SetFocus;
         Accept := False;
      end;
End;

procedure TFrmCadClassInstFin.CmeCadastroConfirma(Sender: TObject);
Begin
  if qry.State in [dsInsert,dsEdit] Then
    Begin
      If qry.State = dsInsert Then
          qry.FieldByName('IDCLASSINSTFIN').asInteger := LeUltRegistro(nil,'CLASSINSTFIN');
    End;
   Inherited;
End;

procedure TFrmCadClassInstFin.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

end.
