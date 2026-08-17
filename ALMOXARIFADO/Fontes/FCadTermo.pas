unit FCadTermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadTermo = class(TfrmCadastroCS)
    qryIDPESSOA: TFloatField;
    qryFLGABREFECHA: TStringField;
    memTexto: TDBMemo;
    RagTermo: TDBRadioGroup;
    qryTEXTO: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    //
    Procedure Sel( sTipo : String );

  public
    { Public declarations }
  end;

var
  FrmCadTermo: TFrmCadTermo;

implementation

{$R *.DFM}
Uses uMensErro, uSistema;

procedure TFrmCadTermo.FormCreate(Sender: TObject);
begin
  inherited;
  Sel('');
end;

Procedure TFrmCadTermo.Sel( sTipo : String );
Begin
  qry.Close;
  qry.Params[0].AsInteger := Sistema.IdEmpresa;
  qry.Params[1].AsString  := Trim( sTipo );
  qry.Open;
End;

procedure TFrmCadTermo.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     qry.FieldByName('FLGABREFECHA').asString := 'A';
     memTexto.SetFocus;
end;

procedure TFrmCadTermo.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
    memTexto.SetFocus;
end;

procedure TFrmCadTermo.CmeCadastroFind(Sender: TObject);
begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Sel(MontaSelect.ValoresChave[1]);

end;

Procedure TFrmCadTermo.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(memTexto.Text) = ''  Then
       Begin
          MsgDlg('Texto não preenchido','Erro',mtError,[mbOK],0);
          memTexto.SetFocus;
          Accept := False;
       End;
End;

Procedure TFrmCadTermo.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State in [dsInsert,dsEdit] Then
       Begin
          qry.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
       End;
    inherited;
End;

procedure TFrmCadTermo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

end.
