unit FTipoAltxImpostos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Db, Wwdatsrc, DBTables, Wwquery, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmTipoAltxImpostos = class(TfrmOkCancelar)
    upd: TUpdateSQL;              
    qry: TwwQuery;
    ds: TwwDataSource;
    qryIDALTXIMPOSTO: TFloatField;
    qryCODALTERADOR: TFloatField;
    qryCODIMPOSTO: TFloatField;
    lblImposto: TLabel;
    dbgrTipoAltPos: TwwDBGrid;
    btnVaiUm2: TBitBtn;
    btnVoltaUm2: TBitBtn;
    dbgrAltSel: TwwDBGrid;
    qryDESCRICAO: TStringField;
    updTipoPos: TUpdateSQL;
    qryTipoPos: TwwQuery;
    dsTipoPos: TwwDataSource;
    qryTipoPosCODALTERADOR: TFloatField;
    qryTipoPosDESCRICAO: TStringField;
    dblcImposto: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVaiUm2Click(Sender: TObject);
    procedure btnVoltaUm2Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcImpostoChange(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iCodImp:LongInt);
  public
    { Public declarations }
  end;

var
  frmTipoAltxImpostos: TfrmTipoAltxImpostos;

implementation

Uses uSistema, uDataBase,uMensErro;

{$R *.DFM}

procedure TfrmTipoAltxImpostos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoPos.Close;
  If qryTipoPos.Prepared Then qryTipoPos.UnPrepare;
  qry.Close;
  If qry.Prepared Then qry.UnPrepare;
end;

procedure TfrmTipoAltxImpostos.btnVaiUm2Click(Sender: TObject);
begin
  inherited;
  If trim(dblcImposto.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Imposto','Erro',mtError,[mbOk],0);
     dblcImposto.SetFocus;
  end else begin
     //
     qry.Append;
     qryIDALTXIMPOSTO.asInteger := LeUltRegistro(nil,'ALTXIMPOSTO');
     qryCODALTERADOR.asInteger  := qryTipoPosCODALTERADOR.asInteger;
     if dblcImposto.ItemIndex < 2 then
        qryCODIMPOSTO.asInteger    := (dblcImposto.ItemIndex+1)
     else
        qryCODIMPOSTO.asInteger    := (dblcImposto.ItemIndex+13);
     qryDESCRICAO.asString      := qryTipoPosDESCRICAO.asString;
     qry.Post;
     //
     qryTipoPos.Delete;
     //
     btnVoltaUm2.Enabled := not qry.IsEmpty;
     btnVaiUm2.Enabled   := not qryTipoPos.IsEmpty;
  end;
end;

procedure TfrmTipoAltxImpostos.btnVoltaUm2Click(Sender: TObject);
begin
  inherited;
  If trim(dblcImposto.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Imposto','Erro',mtError,[mbOk],0);
     dblcImposto.SetFocus;
  end else begin
     qryTipoPos.Append;
     qryTipoPosCODALTERADOR.asInteger  := qryCODALTERADOR.asInteger;
     qryTipoPosDESCRICAO.asString      := qryDESCRICAO.asString;
     qryTipoPos.Post;
     //
     qry.Delete;
     //
     btnVoltaUm2.Enabled := not qry.IsEmpty;
     btnVaiUm2.Enabled   := not qryTipoPos.IsEmpty;
  end;
end;

procedure TfrmTipoAltxImpostos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.CancelUpdates;
  qryTipoPos.CancelUpdates;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1))
  else
     Sel((dblcImposto.ItemIndex+13));

end;

procedure TfrmTipoAltxImpostos.Sel(iCodImp:LongInt);
Begin
  qryTipoPos.Close;
  If not qryTipoPos.Prepared Then qryTipoPos.Prepare;
  qryTipoPos.ParamByName('IDPESSOA').AsInteger     :=Sistema.idEmpresa;
  qryTipoPos.open;
  //
  qry.Close;
  If not qry.Prepared Then qry.Prepare;
  qry.ParamByName('IDPESSOA').AsInteger     :=Sistema.idEmpresa;
  qry.ParamByName('CODIMPOSTO').AsInteger   :=iCodImp;
  qry.open;
  //
  btnVoltaUm2.Enabled := not qry.IsEmpty;
  btnVaiUm2.Enabled   := not qryTipoPos.IsEmpty;
end;

procedure TfrmTipoAltxImpostos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AplicaAlteracoes([qry]);
  qryTipoPos.CancelUpdates;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1))
  else
     Sel((dblcImposto.ItemIndex+13));
end;

procedure TfrmTipoAltxImpostos.FormActivate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmTipoAltxImpostos.dblcImpostoChange(Sender: TObject);
begin
  inherited;
  If qry.UpdatesPending then begin
     If MsgDlg('Existem registros pendentes de gravação. Efetua a gravação ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        AplicaAlteracoes([qry]);
        qryTipoPos.CancelUpdates;
     end;
  end;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1))
  else
     Sel((dblcImposto.ItemIndex+13));
end;

end.
