unit FCADCOMPASSUNTO;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, DBTables, Db, Wwquery, CmEventosCadastro, cmseldlg,
  wwDialog, wwidlg, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, MontaSelect,Mask, FCadastroCS, wwdblook;

type
  TFRMCADCOMPLASSUNTO = class(TfrmCadastroCS)
    qryassunto: TwwQuery;
    qryassuntoIDFIARASS: TFloatField;
    qryassuntoDESCRICAO: TStringField;
    DBLKPASSUNTO: TwwDBLookupCombo;
    MASCOMPLASSUNTO: TMaskEdit;
    qryincluir: TwwQuery;
    qryalterar: TwwQuery;
    qryexcluir: TwwQuery;
    Qryid: TwwQuery;
    QryidIDENTIFICADOR: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
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
  FRMCADCOMPLASSUNTO: TFRMCADCOMPLASSUNTO;

implementation
 Uses UdataBase, FPrincipal;
{$R *.DFM}

procedure TFRMCADCOMPLASSUNTO.FormCreate(Sender: TObject);
begin
 //inherited;
 if qryassunto.active then
 qryassunto.close;
 qryassunto.open ;
SBTNINSERIR.ENABLED := TRUE;
SBTNALTERAR.ENABLED := False;
SBTNAPAGAR.Enabled := False;
dblkpassunto.Enabled := False;
mascomplassunto.Enabled := False;
bbtnconfirmar.Enabled := False;
bbtncancelar.Enabled := false;

end;

procedure TFRMCADCOMPLASSUNTO.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
 montaselect.executar;
 If Montaselect.RetornouValor Then
 begin
     SBTNINSERIR.ENABLED := false;
     SBTNALTERAR.ENABLED := true;
     SBTNAPAGAR.Enabled := true;
 end;

end;

procedure TFRMCADCOMPLASSUNTO.sbtnInserirClick(Sender: TObject);
begin
  // inherited;
  pnlfundo.enabled        := true;
  dblkpassunto.Enabled    := true;
  mascomplassunto.Enabled := true;
  tag                     := 1;
  bbtnconfirmar.Enabled   := true;
  bbtncancelar.Enabled    := true;
end;

procedure TFRMCADCOMPLASSUNTO.sbtnAlterarClick(Sender: TObject);
begin
  // inherited;

  pnlfundo.enabled        := true;
  mascomplassunto.Enabled := true;
  dblkpassunto.text       := MontaSelect.ValoresChave[3];
  mascomplassunto.text    := MontaSelect.ValoresChave[2];
  bbtnconfirmar.Enabled   := true;
  bbtncancelar.Enabled    := true;
  tag := 2;
end;

procedure TFRMCADCOMPLASSUNTO.sbtnApagarClick(Sender: TObject);
begin
  // inherited;

  pnlfundo.enabled      := false;
  dblkpassunto.text     := MontaSelect.ValoresChave[3];
  mascomplassunto.text  := MontaSelect.ValoresChave[2];
  bbtnconfirmar.Enabled := true;
  bbtncancelar.Enabled  := true;
  tag := 3;
end;

procedure TFRMCADCOMPLASSUNTO.bbtnConfirmarClick(Sender: TObject);
var id : integer;
begin
  // inherited;
   if self.Tag  = 1   then
   begin

   if qryid.active then
             qryid.close;
    qryid.open ;
    id := Qryididentificador.AsInteger;
    id := id + 1;
    Qryincluir.ParamByName('IDcomplass').Asinteger := id;
    Qryincluir.ParamByName('idfiarass').Asinteger := strtoint(dblkpassunto.LookupValue);
    Qryincluir.ParamByName('descricao').Asstring:= mascomplassunto.text;
    Qryincluir.ParamByName('datainclusao').AsDateTime:= date;
    QryIncluir.ExecSql;
   end;
   if self.Tag  = 2    then
   begin
    Qryalterar.ParamByName('IDcomplass').Asinteger := StrToint(MontaSelect.ValoresChave[1]);
    Qryalterar.ParamByName('descricao').Asstring:= mascomplassunto.text;
    Qryalterar.ExecSql;
   end;
   if self.Tag  = 3   then
   begin
    Qryexcluir.ParamByName('IDcomplass').Asinteger := StrToint(MontaSelect.ValoresChave[1]);
    Qryexcluir.ExecSql;
   end;
   SBTNINSERIR.ENABLED := TRUE;
   SBTNALTERAR.ENABLED := False;
   SBTNAPAGAR.Enabled := False;
   dblkpassunto.Enabled := False;
   mascomplassunto.Enabled := False;
   bbtnconfirmar.Enabled := False;
   bbtncancelar.Enabled := False;
   mascomplassunto.text := '';
   tag := 0;
end;

procedure TFRMCADCOMPLASSUNTO.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;
   SBTNINSERIR.ENABLED := TRUE;
   SBTNALTERAR.ENABLED := False;
   SBTNAPAGAR.Enabled := False;
   dblkpassunto.Enabled := False;
   mascomplassunto.Enabled := False;
   bbtnconfirmar.Enabled := False;
   bbtncancelar.Enabled := False;
   mascomplassunto.text := '';
   tag := 0;
end;

end.
