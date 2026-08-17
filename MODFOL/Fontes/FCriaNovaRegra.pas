unit FCriaNovaRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, DBTables, Db, Wwquery, wwdblook;

type
  TfrmCriaNovaRegra = class(TfrmOkCancelar)
    qryRubRub: TwwQuery;
    qryRegra: TwwQuery;
    updRegra: TUpdateSQL;
    spedNumRegra: TSpinEdit;
    Label1: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryTipoRegra: TwwQuery;
    Label2: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriaNovaRegra: TfrmCriaNovaRegra;

implementation

uses USistema;
{$R *.DFM}

procedure TfrmCriaNovaRegra.bbtnConfirmarClick(Sender: TObject);
var
  IdRub, IdReg : Integer;
  Texto, NomeReg : String;
begin
  inherited;
  IdRub := 0;
  Texto := '';
  IdReg := spedNumRegra.Value;
  with qryRubRub do begin
    Close;
    ParamByName('IdPessoa').AsInteger := Sistema.IdEmpresa;
    Open;
    while True do
    begin
       if eof or ((IdRub <> FieldByName('IdRubsecund').AsInteger) and (IdRub > 0)) then
       begin
         qryRegra.Insert;
         qryRegra.FieldByName('IdRegra').AsInteger := IdReg + IdRub;
         qryRegra.FieldByName('IdTipoRegra').AsInteger :=
              qryTipoRegra.FieldByName('IdTipoRegra').AsInteger;
         qryRegra.FieldByName('NomeRegra').AsString      := NomeReg;
         qryRegra.FieldByName('DescricaoRegra').AsString := Texto;
         qryRegra.Post;
         qryRegra.ApplyUpdates;
         if eof then break  else  Texto := '';
       end;
       IdRub   := FieldByName('IdRubsecund').AsInteger;
       NomeReg := FieldByName('Descricao').AsString;
       //Texto   := Texto + FieldByName('Codigo').AsString;
       Texto   := 'C(BSRUBRICA)';
       Next;
    end;
  end;
end;

procedure TfrmCriaNovaRegra.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoRegra.Open;
  qryRegra.Open;
end;

end.
