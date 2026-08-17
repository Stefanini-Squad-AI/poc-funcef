unit FCadItemRFXTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook;

type
  TfrmCadItemRFXTipoOper = class(TfrmCadastroMDetInv)
    dblTipoOper: TwwDBLookupCombo;
    Label1: TLabel;
    qryTipoOper: TwwQuery;
    qryTipoOperIDTIPOOPERACAO: TFloatField;
    qryTipoOperDESCTIPOOPERACAO: TStringField;
    dblItem: TwwDBLookupCombo;
    Label2: TLabel;
    qryItems: TwwQuery;
    qryItemsIDITEMRENFIX: TFloatField;
    qryItemsDESCITEMRENFIX: TStringField;
    qryLKItem: TwwQuery;
    qryLKItemIDITEMRENFIX: TFloatField;
    qryLKItemDESCITEMRENFIX: TStringField;
    qryDetalheItem: TStringField;
    qryDetalheIDITEMRENFIX: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblTipoOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblTipoOperExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(Chave: Largeint);
    procedure HabBtDet;
    function VerificaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadItemRFXTipoOper: TfrmCadItemRFXTipoOper;

implementation

{$R *.DFM}
Uses uMensErro, UDataBase;

{ TfrmCadItemRFXTipoOper }

procedure TfrmCadItemRFXTipoOper.HabBtDet;
begin
  if Trim(dblTipoOper.Text) = '' then
  begin
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     sbtnExcluiDet.Enabled := False;
  end else begin
     sbtnInsDet.Enabled := True;
     sbtnAltDet.Enabled := True;
     sbtnExcluiDet.Enabled := True;
  end;
end;

procedure TfrmCadItemRFXTipoOper.Sel(Chave: Largeint);
begin
   qryDetalhe.Close;
   qryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger := Chave;
   qryDetalhe.Open;
end;

function TfrmCadItemRFXTipoOper.VerificaCampos: Boolean;
begin
   Result := False;
   if Trim(dblTipoOper.Text) = '' then
   begin
      MsgDlg('Tipo de Operação não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblTipoOper.SetFocus;
      Exit;
   end;

   if Trim(dblItem.Text) = '' then
   begin
      MsgDlg('Item não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblItem.SetFocus;
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadItemRFXTipoOper.FormShow(Sender: TObject);
begin
  Sel(-1);
  qryTipoOper.Open;
  qryItems.Open;
  qryLKItem.Open;
  inherited;
end;

procedure TfrmCadItemRFXTipoOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTipoOper.Close;
  qryItems.Close;
  qryLKItem.Close;
  inherited;
end;

procedure TfrmCadItemRFXTipoOper.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      dblTipoOper.LookupValue := MontaSelect.ValoresChave[0];
   end;
   pnlFundo.Enabled := True;
   pnlMestre.Enabled := True;
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   if qryDetalhe.IsEmpty then
      sbtnExcluiDet.Enabled := False
   else sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;

   HabBtDet;

   dblTipoOper.SetFocus;

end;

procedure TfrmCadItemRFXTipoOper.bbtnOkDetClick(Sender: TObject);
begin
   if not VerificaCampos then exit;
   qryDetalheIDTIPOOPERACAO.AsString := dblTipoOper.LookupValue;
   inherited;
   CmeDetalhe.Cancel(Self);  //Cancelar o RepetirInserir
   qryDetalhe.ApplyUpdates;
   qryDetalhe.CommitUpdates;
   qryItems.Close;
   qryItems.Open;
   sbtnInsDet.Click;
   HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.dblTipoOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (Trim(dblTipoOper.Text) <> '') then
     Sel(StrToInt(dblTipoOper.LookupValue));

  HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  qryItems.Close;
  qryItems.ParamByName('IDTIPOOPERACAO').AsString := dblTipoOper.LookupValue;
  qryItems.Open;

  dblItem.SetFocus;
end;

procedure TfrmCadItemRFXTipoOper.dblTipoOperExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.sbtnExcluiDetClick(Sender: TObject);
begin
   if (not qryDetalhe.IsEmpty) then
   begin
      inherited;
      AplicaAlteracoes([qryDetalhe]);
   end;
   HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.sbtnAltDetClick(Sender: TObject);
begin
  qryItems.Close;
  qryItems.ParamByName('IDTIPOOPERACAO').AsInteger := -1;
  qryItems.Open;
  inherited;
end;

procedure TfrmCadItemRFXTipoOper.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadItemRFXTipoOper.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dblTipoOper.CanFocus then
     dblTipoOper.SetFocus;
end;

end.
