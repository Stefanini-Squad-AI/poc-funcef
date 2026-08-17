unit FTipoAltxImpostosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uMensErro, uDataBase, uCtrlTipoAltxImpostos,
  uSistema, DBasedados, uctrlDarf;

type
  TfrmTipoAltxImpostosMT = class(TfrmOkCancelar)
    lblImposto: TLabel;
    dblcImposto: TComboBox;
    dbgrTipoAltPos: TwwDBGrid;
    btnVaiUm2: TBitBtn;
    btnVoltaUm2: TBitBtn;
    dbgrAltSel: TwwDBGrid;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    cdsTipoPos: TCMClientDataSet;
    dsTipoPos: TwwDataSource;
    procedure btnVaiUm2Click(Sender: TObject);
    procedure btnVoltaUm2Click(Sender: TObject);
    procedure dblcImpostoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ImpostosXAlterador : TCtrlTipoAltxImpostos;
    Darf : TCtrlDARF;
    procedure Sel(iCodImp:LongInt; bAplicaAlteracoes : boolean);
  public
    { Public declarations }
  end;

var
  frmTipoAltxImpostosMT: TfrmTipoAltxImpostosMT;

implementation





{$R *.DFM}

procedure TfrmTipoAltxImpostosMT.btnVaiUm2Click(Sender: TObject);
begin
  inherited;
  If trim(dblcImposto.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Imposto','Erro',mtError,[mbOk],0);
     dblcImposto.SetFocus;
  end else begin
     //
     cds.Append;
     cds.fieldByname('IDALTXIMPOSTO').asInteger := Darf.PegaId('ALTXIMPOSTO');
     cds.fieldByname('CODALTERADOR').asInteger  := cdsTipoPos.fieldByname('CODALTERADOR').asInteger;
     if dblcImposto.ItemIndex < 2 then
        cds.fieldByname('CODIMPOSTO').asInteger    := (dblcImposto.ItemIndex+1)
     else
        cds.fieldByname('CODIMPOSTO').asInteger    := (dblcImposto.ItemIndex+13);
     cds.fieldByname('DESCRICAO').asString      := cdsTipoPos.fieldByname('DESCRICAO').asString;
     cds.Post;
     //
     cdsTipoPos.Delete;

     dblcImposto.Enabled := False;
     btnVoltaUm2.Enabled := not cds.IsEmpty;
     btnVaiUm2.Enabled   := not cdsTipoPos.IsEmpty;
  end;
end;

procedure TfrmTipoAltxImpostosMT.btnVoltaUm2Click(Sender: TObject);
begin
  inherited;
  If trim(dblcImposto.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Imposto','Erro',mtError,[mbOk],0);
     dblcImposto.SetFocus;
  end else begin
     cdsTipoPos.Append;
     cdsTipoPos.fieldByname('CODALTERADOR').asInteger  := cds.fieldByname('CODALTERADOR').asInteger;
     cdsTipoPos.fieldByname('DESCRICAO').asString      := cds.fieldByname('DESCRICAO').asString;
     cdsTipoPos.Post;
     //
     cds.Delete;
     //
     if dblcImposto.ItemIndex < 2 then
        Sel((dblcImposto.ItemIndex+1), True)
     else
        Sel((dblcImposto.ItemIndex+13), True);
     btnVoltaUm2.Enabled := not cds.IsEmpty;
     btnVaiUm2.Enabled   := not cdsTipoPos.IsEmpty;
  end;

end;

procedure TfrmTipoAltxImpostosMT.dblcImpostoChange(Sender: TObject);
begin
  inherited;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1), False)
  else
     Sel((dblcImposto.ItemIndex+13), False);

end;

procedure TfrmTipoAltxImpostosMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1), True)
  else
     Sel((dblcImposto.ItemIndex+13), True);
end;

procedure TfrmTipoAltxImpostosMT.Sel(iCodImp: Integer; bAplicaAlteracoes : boolean);
begin
  if bAplicaAlteracoes then
     Begin
       ImpostosXAlterador.AplicaAlteracoesAlterador;
     end;
  cdsTipoPos.data := ImpostosXAlterador.ListAlteradoresPossiveis(Sistema.IdEmpresa);

  cds.data := ImpostosXAlterador.ListAlteradoresSelecionados(Sistema.IdEmpresa, iCodImp);


  dblcImposto.Enabled := true;
  btnVoltaUm2.Enabled := not cds.IsEmpty;
  btnVaiUm2.Enabled   := not cdsTipoPos.IsEmpty;
end;

procedure TfrmTipoAltxImpostosMT.FormCreate(Sender: TObject);
begin
  inherited;
  ImpostosXAlterador := TCtrlTipoAltxImpostos.Create;
  ImpostosXAlterador.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  ImpostosXAlterador.CdsTipoAlterador := cdsTipoPos;
  ImpostosXAlterador.CdsAltxImpostos  := Cds;

  Darf := TCtrlDARF.Create;
  Darf.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  //
  Sel(-1, False);
end;

procedure TfrmTipoAltxImpostosMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dblcImposto.ItemIndex < 2 then
     Sel((dblcImposto.ItemIndex+1), False)
  else
     Sel((dblcImposto.ItemIndex+13), False);
end;

procedure TfrmTipoAltxImpostosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpostosXAlterador.free;
end;

end.
