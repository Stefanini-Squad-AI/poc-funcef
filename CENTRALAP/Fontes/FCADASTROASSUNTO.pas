unit FCADASTROASSUNTO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, DBTables, Db, Wwquery, CmEventosCadastro, cmseldlg,
  wwDialog, wwidlg, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, MontaSelect,Mask;

type
  Tfrmcadastroassunto = class(TfrmCadastroGrid)
    qry: TwwQuery;
    MontaSelect: TMontaSelect;
    qryIDFIARASS: TFloatField;
    qryDESCRICAO: TStringField;
    qryDATAINCLUSAO: TDateTimeField;
    Upd: TUpdateSQL;
    Label1: TLabel;
    masdescricao: TMaskEdit;
    qryinsertassunto: TwwQuery;
    qryalteraassunto: TwwQuery;
    qrydelete: TwwQuery;
    qryassunto: TwwQuery;
    qryassuntoIDFIARASS: TFloatField;
    qryassuntoDESCRICAO: TStringField;
    qryassuntoDATAINCLUSAO: TDateTimeField;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastroassunto: Tfrmcadastroassunto;

implementation
Uses UdataBase, FPrincipal;
{$R *.DFM}

procedure Tfrmcadastroassunto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
if masdescricao.CanFocus then masdescricao.setFocus;
end;

procedure Tfrmcadastroassunto.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MONTASELECT.Executar;
  If Montaselect.RetornouValor Then
  begin
       qry.ParamByName('IDfiarass').Asinteger := StrToint(MontaSelect.ValoresChave[0]);
       if qry.active then
          qry.close;
       qry.open ;
       sbtnInserir.Enabled := false;
       sbtnalterar.Enabled  := True;
       Sbtnapagar.Enabled   := True;
  end;
end;

procedure Tfrmcadastroassunto.sbtnInserirClick(Sender: TObject);
begin
 //inherited;
masdescricao.text :='';
pnlControles.Visible := True;
bbtnconfirmar.Visible := True;
bbtncancelar.Visible := True;
dbGrd.Visible        := False;
tag := 1;
end;

procedure Tfrmcadastroassunto.sbtnAlterarClick(Sender: TObject);
begin
 // inherited;
 masdescricao.text :=qrydescricao.AsString;
pnlControles.Visible := True;
bbtnconfirmar.Visible := True;
bbtncancelar.Visible := True;
dbGrd.Visible        := False;
 tag := 2;
end;

procedure Tfrmcadastroassunto.sbtnApagarClick(Sender: TObject);
begin
 // inherited;
masdescricao.text :=qrydescricao.AsString;
pnlControles.Visible := True;
bbtnconfirmar.Visible := True;
bbtncancelar.Visible := True;
dbGrd.Visible        := False;
tag := 3;
end;

procedure Tfrmcadastroassunto.bbtnConfirmarClick(Sender: TObject);
var
 id : integer;
begin
  inherited;
  if self.Tag  = 1   then
   begin
    id := leUltRegistro(nil,'FiarioAssunto');
    Qryinsertassunto.ParamByName('IDfiarass').Asinteger := id;
     Qryinsertassunto.ParamByName('descricao').Asstring := masdescricao.text;
     Qryinsertassunto.ParamByName('datainclusao').AsDateTime:= date;
     QryInsertassunto.ExecSql;
   end;
   if self.Tag  = 2    then
   begin
     Qryalteraassunto.ParamByName('IDfiarass').Asinteger := StrToint(MontaSelect.ValoresChave[0]);
     Qryalteraassunto.ParamByName('descricao').Asstring := masdescricao.text;
     Qryalteraassunto.ExecSql;
   end;
   if self.Tag  = 3   then
   begin
     Qrydelete.ParamByName('IDfiarass').Asinteger := StrToint(MontaSelect.ValoresChave[0]);
     Qrydelete.ExecSql;
   end;
sbtnInserir.Enabled := True;
sbtnalterar.Enabled  := false;
Sbtnapagar.Enabled   := false;
 tag := 0;
  masdescricao.text := '';
end;

procedure Tfrmcadastroassunto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
sbtnInserir.Enabled := True;
sbtnalterar.Enabled  := false;
Sbtnapagar.Enabled   := false;
tag := 0;
end;

end.
