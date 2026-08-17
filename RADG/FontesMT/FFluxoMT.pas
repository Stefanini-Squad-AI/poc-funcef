unit FFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, Mask, wwdbedit,uCMTypes,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery,
  uCtrlFluxo, uCtrlAndamentos, uCtrlTipoEtapa;

type
  TfrmFluxoMT = class(TFrmCadastroMT)
    EdProc: TEdit;
    Label1: TLabel;
    plnAndxEtp: TPanel;
    plnEtapa: TPanel;
    Panel1: TPanel;
    grdEtapa: TwwDBGrid;
    plnFluxo: TPanel;
    plnDet: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dblcAndamento: TCMDBLookupCombo;
    dblcEtapa: TCMDBLookupCombo;
    GrdFluxo: TwwDBGrid;
    Panel3: TPanel;
    plnBtn: TPanel;
    sbtnInsDet: TSpeedButton;
    sbtnAltDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    dsTipoEtapa: TwwDataSource;
    cdsTipoEtapa: TCMClientDataSet;
    cdsTipoEtapaAnt: TCMClientDataSet;
    cdsAndamento: TCMClientDataSet;
    Splitter2: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dsTipoEtapaDataChange(Sender: TObject; Field: TField);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    _Fluxo     : TCtrlFluxo;
    _Andamentos: TCtrlAndamentos;
    _TipoEtapa : TCtrlTipoEtapa;
    procedure Sel(iIdTipoProcesso : Double);
    Procedure BtnDet( b : Boolean );
  public
    { Public declarations }
  end;

var
  frmFluxoMT: TfrmFluxoMT;
  sNomeTipoProcesso : String;
  iIdProc : Double;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmFluxoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _Fluxo := TCtrlFluxo.Create;
  _Fluxo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _TipoEtapa := TCtrlTipoEtapa.Create;
  _TipoEtapa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _Andamentos := TCtrlAndamentos.Create;
  _Andamentos.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _Fluxo.CdsRadFluxo := cds;
  
  sNomeTipoProcesso := '';
  Sel(-1);
  
end;

procedure TfrmFluxoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Fluxo.Free;
  _Andamentos.Free;
  _TipoEtapa.Free;
end;

procedure TfrmFluxoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  grdEtapa.SetFocus;
end;

procedure TfrmFluxoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  grdEtapa.SetFocus;
end;

procedure TfrmFluxoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     sNomeTipoProcesso := MontaSelect.ValoresChave[1];
     Sel(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;
end;

procedure TfrmFluxoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Fluxo.AplicaOperacao(opApagar,iIdProc,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmFluxoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Fluxo.AplicaOperacao(opAlterar,iIdProc,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmFluxoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Fluxo.AplicaOperacao(opInserir,iIdProc,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmFluxoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _Fluxo.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _Fluxo.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmFluxoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Sel(iIdProc);
end;

procedure TfrmFluxoMT.Sel(iIdTipoProcesso : Double);
begin
  cdsTipoEtapa.Data   := _TipoEtapa.ListaRadTipoEtapa(iIdTipoProcesso);
  
  cds.Filtered        := False;
  cds.Data            := _Fluxo.ListaRadFluxo(iIdTipoProcesso,0);
  cds.FilterOptions   := [foCaseInsensitive];
  cds.Filter          := 'IDTIPOETAPA = '+IntToStr(cdsTipoEtapa.FieldByName('IDTIPOETAPA').asInteger);
  cds.Filtered        := True;
  
  cdsTipoEtapaAnt.Data:= _TipoEtapa.ListaRadTipoEtapa(iIdTipoProcesso);
  cdsAndamento.Data   := _Andamentos.ListaRadAndamento;
  EdProc.Text         := sNomeTipoProcesso;
  iIdProc             := iIdTipoProcesso;
  
end;

procedure TfrmFluxoMT.BtnDet(b: Boolean);
begin
   plnBtn.Enabled   := b;
   plnDet.Enabled   := Not b;
   plnEtapa.Enabled := b;
   if Not plnBtn.Enabled Then
     plnDet.BringToFront
   Else
     plnDet.SendToBack;
end;

procedure TfrmFluxoMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  cds.Append;
  BtnDet( False );
end;

procedure TfrmFluxoMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  cds.Edit;
  BtnDet( False );
end;

procedure TfrmFluxoMT.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Confirma a exclusão','Confirmação',mtConfirmation,[mbOK,mbCancel],0) = mrOk Then
     cds.Delete;
  sbtnExcluiDet.Down := False;
end;

procedure TfrmFluxoMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAndamento.Text) = '' Then
     Begin
          MsgDlg('Andamento não preenchido','Erro',mtConfirmation,[mbOK],0);
          dblcAndamento.SetFocus;
     End
  Else
  If Trim(dblcEtapa.Text) = '' Then
     Begin
          MsgDlg('Etapa não preenchido','Erro',mtConfirmation,[mbOK],0);
          dblcEtapa.SetFocus;
     End
  Else
     Begin
        cds.FieldByName('IDTIPOPROCESSO').AsFloat := iIdProc;
        cds.FieldByName('IDTIPOETAPA').AsFloat    := cdsTipoEtapa.FieldByName('IDTIPOETAPA').AsInteger;
        cds.FieldByName('ANDAMENTO').AsString     := dblcAndamento.Text;
        cds.FieldByName('ETAPAANTES').AsString    := dblcEtapa.Text;
        cds.Post;
        If sbtnInsDet.Down Then
           cds.Append
        Else
           Begin
              BtnDet( True );
              sbtnInsDet.Down :=  False;
              sbtnAltDet.Down :=  False;
           End;
     End;

end;

procedure TfrmFluxoMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  cds.Cancel;
  BtnDet( True );
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
end;

procedure TfrmFluxoMT.dsTipoEtapaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If cdsTipoEtapa.State <> DsInactive Then Begin
     if cds.State in [DsEdit,DsInsert] Then
        cds.Post;
     cds.Filtered      := False;
     cds.FilterOptions := [foCaseInsensitive];
     cds.Filter        := 'IDTIPOETAPA = '+IntToStr(cdsTipoEtapa.FieldByName('IDTIPOETAPA').asInteger) ;
     cds.Filtered      := True;
  End;
end;

procedure TfrmFluxoMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := (iIdProc > 0);
  pnlFundo.Enabled    := (iIdProc > 0);
  plnBtn.Enabled      := (sbtnAlterar.Down);
end;

end.
