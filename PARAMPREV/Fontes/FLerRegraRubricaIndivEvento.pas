unit FLerRegraRubricaIndivEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmLerRegraRubricaIndivEvento = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    lbl4: TLabel;
    dblkpcmbIDREGRAVALIDAASS: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    lblPlano: TLabel;
    gpRegra: TGroupBox;
    lblEvento: TLabel;
    lblrubrica: TLabel;
    Label1: TLabel;
    cmbRegraCalculo: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkpcmbIDREGRAVALIDAASSChange(Sender: TObject);
    procedure cmbRegraCalculoChange(Sender: TObject);
  private
   {Private declarations}
  public
   {Public declarations}
    sRegraValidaAssoc, sRegraCalculo: string;
    bBotaoOk, bAlteraRegra: boolean;
  end;

var
  frmLerRegraRubricaIndivEvento: TfrmLerRegraRubricaIndivEvento;

implementation

uses
    UMensErro, FAssocContribEventoF, FAssocRubricaIndivEvento;

{$R *.DFM}

procedure TfrmLerRegraRubricaIndivEvento.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Close; qryRegra.Open;

  bBotaoOk := False;

  if bAlteraRegra
  then begin
     if frmAssocRubricaindivEvento.qryRubricaIndivEvento.FieldByName('IDREGRAVALIDAASS').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocRubricaindivEvento.qryRubricaIndivEvento.FieldByName('IDREGRAVALIDAASS').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbIDREGRAVALIDAASS.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
     end;

     if frmAssocRubricaindivEvento.qryRubricaIndivEvento.FieldByName('IDREGRACALCULO').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocRubricaindivEvento.qryRubricaIndivEvento.FieldByName('IDREGRACALCULO').AsString, [loCaseInsensitive, loPartialKey]);
        cmbRegraCalculo.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
     end;
  end
  else
  begin
     sRegraValidaAssoc := 'NULL';
     sRegraCalculo := 'NULL';
  end;

  dblkpcmbIDREGRAVALIDAASS.SetFocus;
end;

procedure TfrmLerRegraRubricaIndivEvento.bbtnConfirmarClick(Sender: TObject);
begin
  //inherited;
  if trim(cmbRegraCalculo.text) = '' then
  begin
     MsgDlg(' A regra de cálculo deve ser informada.','Regra faltando',mtError,[mbOK],0);
     exit;
  end;

  bBotaoOk := True;
  Close;
end;

procedure TfrmLerRegraRubricaIndivEvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraRubricaIndivEvento.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraRubricaIndivEvento.dblkpcmbIDREGRAVALIDAASSChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbIDREGRAVALIDAASS.Text <> '' then
     sRegraValidaAssoc := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraValidaAssoc := 'NULL';
end;

procedure TfrmLerRegraRubricaIndivEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;

procedure TfrmLerRegraRubricaIndivEvento.cmbRegraCalculoChange(
  Sender: TObject);
begin
  inherited;
  if cmbRegraCalculo.Text <> '' then
     sRegraCalculo := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraCalculo := 'NULL';
end;

end.
