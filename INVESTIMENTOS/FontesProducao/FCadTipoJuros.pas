unit FCadTipoJuros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, UDataBase;

type
  TfrmCadTipoJuros = class(TfrmCadastroCS)
    qryCODTIPTXJUROS: TFloatField;
    qryDESCTIPJUROS: TStringField;
    qryTAMPERJUROS: TFloatField;
    qryEFETNOMI: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    qrySIGLATIPJUROS: TStringField;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetParam(Param: Integer);

  end;

var
  frmCadTipoJuros: TfrmCadTipoJuros;

implementation

{$R *.DFM}

procedure TfrmCadTipoJuros.SetParam(Param: Integer);
begin
     qry.Close;
     qry.Params[0].Value := Param;
     qry.Open
end;

procedure TfrmCadTipoJuros.CmeCadastroFind(Sender: TObject);
begin
     if not MontaSelect.RetornouValor then exit;
     inherited;
     SetParam(StrToInt(MontaSelect.ValoresChave[0]))
end;

procedure TfrmCadTipoJuros.CmeCadastroEdit(Sender: TObject);
begin
     inherited;
     DBEdit1.SetFocus
end;

procedure TfrmCadTipoJuros.CmeCadastroInsert(Sender: TObject);
begin
     inherited;
     DBEdit1.SetFocus
end;

procedure TfrmCadTipoJuros.CmeCadastroDelete(Sender: TObject);
begin
     inherited;
     SetParam(-1)
end;

procedure TfrmCadTipoJuros.CmeCadastroConfirma(Sender: TObject);
begin
     if qry.State in [dsInsert] then
        qry.FieldByName('CODTIPTXJUROS').AsInteger :=
            LeUltRegistro(nil, 'TipoJuros');
     inherited
end;

procedure TfrmCadTipoJuros.FormCreate(Sender: TObject);
begin
     inherited;
     SetParam(-1)
end;

end.
