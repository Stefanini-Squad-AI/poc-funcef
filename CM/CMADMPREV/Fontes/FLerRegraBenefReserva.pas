unit FLerRegraBenefReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmLerRegraBenefReserva = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    lbl4: TLabel;
    dblkpcmbRegraAbateReserva: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    lblPlano: TLabel;
    gpConcessao: TGroupBox;
    edNumOrdem: TEdit;
    Label1: TLabel;
    lblReserva: TLabel;
    lblBeneficio: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkpcmbRegraAbateReservaChange(Sender: TObject);
  private
   {Private declarations}
  public
   {Public declarations}
    sRegraAbateReserva: string;
    bBotaoOk, bAlteraRegra: boolean;
  end;

var
  frmLerRegraBenefReserva: TfrmLerRegraBenefReserva;

implementation

uses
    UMensErro, FAssocBenefReserva;

{$R *.DFM}

procedure TfrmLerRegraBenefReserva.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Close; qryRegra.Open;

  bBotaoOk := False;

  if bAlteraRegra then
     begin
          if frmAssocBenefReserva.qryBenefReserva.FieldByName('IDREGRAABATERESE').AsString <> '' then
             begin
                  qryRegra.Locate('IDREGRA', frmAssocBenefReserva.qryBenefReserva.FieldByName('IDREGRAABATERESE').AsString, [loCaseInsensitive, loPartialKey]);
                  dblkpcmbRegraAbateReserva.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
                  dblkpcmbRegraAbateReserva.PerformSearch;
             end;

          edNumOrdem.Text := frmAssocBenefReserva.qryBenefReserva.FieldByName('NUMORDEM').AsString;
     end
  else
     begin
          sRegraAbateReserva := 'NULL';

          if not frmAssocBenefReserva.qryBenefReserva.IsEmpty then
             edNumOrdem.Text := IntToStr(frmAssocBenefReserva.qryBenefReserva.RecordCount + 1)
          else
             edNumOrdem.Text := '1';
     end;

  dblkpcmbRegraAbateReserva.SetFocus;
end;

procedure TfrmLerRegraBenefReserva.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
  if Trim(edNumOrdem.Text) = '' then
     begin
          MsgDlg('O N° de Ordem deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
          edNumOrdem.SetFocus;
          Exit;
     end;

  bBotaoOk := True;
  Close;
end;

procedure TfrmLerRegraBenefReserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraBenefReserva.bbtnSairClick(Sender: TObject);
begin 
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerRegraBenefReserva.dblkpcmbRegraAbateReservaChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraAbateReserva.Text <> '' then
     sRegraAbateReserva := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraAbateReserva := 'NULL';
end;

procedure TfrmLerRegraBenefReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//inherited; - > NAO EXECUTAR O CAFREE
end;

end.
