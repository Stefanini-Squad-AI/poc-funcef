unit FCadAndamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, CmEventosCadastro,
  ImgList;

type
  TfrmCadAndamento = class(TfrmCadastroCS)
    dbedNome: TwwDBEdit;
    lblNome: TLabel;
    qryIDANDAMENTO: TFloatField;
    qryNOME: TStringField;
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
  frmCadAndamento: TfrmCadAndamento;

implementation

{$R *.DFM}

Uses uDataBase, uMensErro;

procedure TfrmCadAndamento.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.ParamByName('IDAND').asInteger := -1;
   qry.Open;
end;

procedure TfrmCadAndamento.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    dbedNome.SetFocus;
End;

procedure TfrmCadAndamento.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedNome.SetFocus;
End;

Procedure TfrmCadAndamento.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    if Trim(dbedNome.Text) = '' Then
       Begin
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
          dbedNome.SetFocus;
          Accept := False;
       End;
End;

procedure TfrmCadAndamento.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State = dsInsert Then
       qryIDANDAMENTO.AsInteger := LeUltRegistro(nil,'RADANDAMENTO');
    inherited;
End;


procedure TfrmCadAndamento.CmeCadastroFind(Sender: TObject);
Begin
 inherited;
 If MontaSelect.RetornouValor then
    Begin
      qry.Close;
      qry.ParamByName('IDAND').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qry.Open;
    end;
End;







end.
