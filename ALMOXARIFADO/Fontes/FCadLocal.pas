unit FCadLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, CmEventosCadastro,
  ImgList;

type
  TFrmCadLocal = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbArtigo: TDBEdit;
    dbDesc: TDBEdit;
    edLoc: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadLocal: TFrmCadLocal;

implementation

{$R *.DFM}
Uses uSistema, uModulo, uString;
procedure TFrmCadLocal.FormShow(Sender: TObject);
begin
  inherited;
   sbtnInserir.Visible := False;
   sbtnApagar.Visible  := False;
   sbtnAlterar.Left    := 4;
   sbtnProcurar.Left   := 64;
   sbtnAlterar.Enabled  := True;
end;

procedure TFrmCadLocal.FormCreate(Sender: TObject);
begin
  inherited;
  With qry Do
    Begin
        Close;
        Prepare;
        Params[0].AsInteger := Sistema.idEmpresa;
        Params[1].AsInteger := Modulo.iCodAlmoxa;
        Open;
    End;

  MontaSelect.Filtro.add(' SALDO.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) );
  MontaSelect.Filtro.add(' SALDO.CODALMOXARIFADO = ' + IntToStr(Modulo.iCodAlmoxa) );

end;

Procedure TfrmCadLocal.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   EdLoc.SetFocus;
End;

procedure TfrmCadLocal.CmeCadastroFind(Sender: TObject);
Var
  sCodigo : String;
Begin
   if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
        sCodigo := '';
        sCodigo := Espaco(MontaSelect.ValoresChave[0],14);
        qry.locate('CODARTIGO',sCodigo,[LopartialKey]);
    end;
End;
end.
