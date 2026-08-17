unit fVariavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, Db, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList, FCadastroGridCS,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmVariavel = class(TFrmCadastroGridCS)
    dbedIdCmp: TwwDBEdit;
    dbedDescCmp: TwwDBEdit;
    Label3: TLabel;
    Label1: TLabel;
    procedure qryAfterInsert(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N:String);
  public
    { Public declarations }
  end;

var
  frmVariavel: TfrmVariavel;

implementation

{$R *.DFM}
uses uDataBase, uMensErro;

procedure TfrmVariavel.Sel(N:String);
Begin
  { Localiza Registro passado pelo parametro }
  Qry.Locate('IDCAMPO',N,[]);
End;

procedure TfrmVariavel.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  dbedIdCmp.SetFocus;
end;

procedure TfrmVariavel.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
  dbedIdCmp.SetFocus;
end;

procedure TfrmVariavel.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  { Caso tenha escolhido algo, Localiza }
  If MontaSelect.RetornouValor Then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmVariavel.CmeCadastroConfirma(Sender: TObject);
begin
  If qry.State in [dsEdit,dsInsert] Then
    If (Trim(dbedIdCmp.Text) = '') or (dbedDescCmp.Text = '') Then
      MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0)
    Else Inherited
  Else
    Inherited;
end;

procedure TfrmVariavel.qryAfterInsert(DataSet: TDataSet);
begin
  Inherited;
  Qry.FieldByName('CAMPODOBANCO').AsInteger := 0;
  Qry.FieldbyName('CHAVE').AsInteger        := 0;
end;

end.
