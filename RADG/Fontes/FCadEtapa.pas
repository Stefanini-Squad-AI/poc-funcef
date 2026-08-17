unit FCadEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadEtapa = class(TfrmCadastroCS)
    qryIDTIPOETAPA: TFloatField;
    qryFLGAUTOMATICA: TStringField;
    qryFLGAUTORIZACAO: TStringField;
    qryDESCRICAO: TStringField;
    lblNome: TLabel;
    dbedNome: TDBEdit;
    lblDescEtapa: TLabel;
    dbmeDescEtapa: TDBMemo;
    dbchkautoriz: TDBCheckBox;
    qryNOME: TStringField;
    qryFLGRETORETAPA: TStringField;
    dbchkRetorna: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }

   public
    { Public declarations }
  end;

var
  frmCadEtapa: TfrmCadEtapa;

implementation

{$R *.DFM}


Uses uDataBase, uMensErro;

procedure TfrmCadEtapa.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.ParamByName('IDRADTIP').asInteger := -1;
   qry.Open;
end;

procedure TfrmCadEtapa.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    dbedNome.SetFocus;
    qry.FieldByName('FLGAUTOMATICA').AsString  := 'N';
    qry.FieldByName('FLGAUTORIZACAO').AsString := 'N';
    qry.FieldByName('FLGRETORETAPA').AsString  := 'N';    
End;

procedure TfrmCadEtapa.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedNome.SetFocus;
End;

Procedure TfrmCadEtapa.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    if Trim(dbedNome.Text) = '' Then
       Begin
          MsgDlg('Nome não preenchido','Erro',mtError,[mbOK],0);
          dbedNome.SetFocus;
          Accept := False;
       End;
End;

procedure TfrmCadEtapa.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State = dsInsert Then
         qryIDTIPOETAPA.AsInteger   := LeUltRegistro(nil,'RADTIPOETAPA');
    inherited;
End;


procedure TfrmCadEtapa.CmeCadastroFind(Sender: TObject);
Begin
 inherited;
 If MontaSelect.RetornouValor then
    Begin
      qry.Close;
      qry.ParamByName('IDRADTIP').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qry.Open;
    end;
End;
 
end.
