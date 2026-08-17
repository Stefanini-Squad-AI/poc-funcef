unit FLerRegraContribEventoF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmLerRegraContribEventoF = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    lbl4: TLabel;
    dblkpcmbIDREGRAVALIDAASS: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    lblPlano: TLabel;
    gpRegra: TGroupBox;
    lblEvento: TLabel;
    lblContribuicao: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkpcmbIDREGRAVALIDAASSChange(Sender: TObject);
  private
   {Private declarations}
  public
   {Public declarations}
    sRegraValidaAssoc: string;
    bBotaoOk, bAlteraRegra: boolean;
  end;

var
  frmLerRegraContribEventoF: TfrmLerRegraContribEventoF;

implementation

uses
    UMensErro, FAssocContribEventoF;

{$R *.DFM}

procedure TfrmLerRegraContribEventoF.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Close; qryRegra.Open;

  bBotaoOk := False;

  if bAlteraRegra
  then begin
     if frmAssocContribEventoF.qryContPrevEvento.FieldByName('IDREGRAVALIDAASS').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocContribEventoF.qryContPrevEvento.FieldByName('IDREGRAVALIDAASS').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbIDREGRAVALIDAASS.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
     end;
  end
  else sRegraValidaAssoc := 'NULL';

  dblkpcmbIDREGRAVALIDAASS.SetFocus;   
end;

procedure TfrmLerRegraContribEventoF.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
  bBotaoOk := True;
  Close;
end;

procedure TfrmLerRegraContribEventoF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraContribEventoF.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraContribEventoF.dblkpcmbIDREGRAVALIDAASSChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbIDREGRAVALIDAASS.Text <> '' then
     sRegraValidaAssoc := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraValidaAssoc := 'NULL';
end;

procedure TfrmLerRegraContribEventoF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//inherited; - > NAO EXECUTAR O CAFREE
end;

end.
