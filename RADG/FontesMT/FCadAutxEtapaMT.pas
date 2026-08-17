unit FCadAutxEtapaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlEtapaxGrupoAut,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo,
  Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery;

type
  TfrmCadAutxEtapaMT = class(TFrmCadastroMT)
    cdsGrupoDisp: TCMClientDataSet;
    dsGrupoDisp: TwwDataSource;
    Label5: TLabel;
    edProc: TEdit;
    Label1: TLabel;
    edEtapa: TEdit;
    plnGrp: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnRemover: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    Panel1: TPanel;
    grdGrupoSelec: TwwDBGrid;
    grdGrupoDispo: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    _EtapaxGrupoAut : TCtrlEtapaxGrupoAut;
    Procedure Adiciona;
    Procedure Remove;
    Procedure Sel(idProcesso,idEtapa : Double);

  public
    { Public declarations }
  end;

var
  frmCadAutxEtapaMT: TfrmCadAutxEtapaMT;
  iProcesso, iEtapa: Double;
  sNomeProc, sNomeEtapa: String;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadAutxEtapaMT.FormCreate(Sender: TObject);
begin
  inherited;
  _EtapaxGrupoAut := TCtrlEtapaxGrupoAut.Create;
  _EtapaxGrupoAut.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _EtapaxGrupoAut.CdsEtapaxGrupo := cds;

  sNomeProc  := '';
  sNomeEtapa := '';
  Sel( -1, -1 );
end;

procedure TfrmCadAutxEtapaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _EtapaxGrupoAut.Free;
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     sNomeProc  := MontaSelect.ValoresChave[2];
     sNomeEtapa := MontaSelect.ValoresChave[3];
     Sel(StrToFloat(MontaSelect.ValoresChave[0]),StrToFloat(MontaSelect.ValoresChave[1]));
  end;

end;

procedure TfrmCadAutxEtapaMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _EtapaxGrupoAut.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _EtapaxGrupoAut.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Sel( iProcesso, iEtapa );
end;

procedure TfrmCadAutxEtapaMT.Adiciona;
begin
   If Not cdsGrupoDisp.IsEmpty Then Begin
      With Cds Do Begin
           Append;
           FieldByName('IDTIPOPROCESSO').AsFloat  := iProcesso;
           FieldByName('IDTIPOETAPA').AsFloat     := iEtapa;
           FieldByName('IDGRUPOAUTORIZA').AsFloat := cdsGrupoDisp.FieldByName('IDGRUPOAUTORIZA').AsFloat;
           FieldByName('NOMEGRUPOAUT').asString   := cdsGrupoDisp.FieldByName('NOMEGRUPOAUT').asString;
      End;

      cdsGrupoDisp.Delete;
   End;
end;

procedure TfrmCadAutxEtapaMT.Remove;
begin
   If Not cds.IsEmpty Then Begin
      With cdsGrupoDisp Do Begin
           Append;
           FieldByName('IDGRUPOAUTORIZA').AsFloat := cds.FieldByName('IDGRUPOAUTORIZA').AsFloat;
           FieldByName('NOMEGRUPOAUT').asString   := cds.FieldByName('NOMEGRUPOAUT').asString;
      End;

      cds.Delete;
   End;
end;

procedure TfrmCadAutxEtapaMT.Sel(idProcesso, idEtapa: Double);
begin
  cds.Data          := _EtapaxGrupoAut.ProcurarEtapaxGrupo(idProcesso, idEtapa);
  cdsGrupoDisp.Data := _EtapaxGrupoAut.ProcurarGrpDisp(idProcesso, idEtapa);
  iProcesso         := idProcesso;
  iEtapa            := idEtapa;
  edProc.Text       := sNomeProc;
  edEtapa.Text      := sNomeEtapa;
end;

procedure TfrmCadAutxEtapaMT.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsGrupoDisp.First;

  While not cdsGrupoDisp.Eof do
        Adiciona;
end;

procedure TfrmCadAutxEtapaMT.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;

  While not cds.Eof do
        Remove;
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxGrupoAut.AplicaOperacao(Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo);
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxGrupoAut.AplicaOperacao(Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo);
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxGrupoAut.AplicaOperacao(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadAutxEtapaMT.btnRemoverClick(Sender: TObject);
begin
  inherited;
  Remove;
end;

procedure TfrmCadAutxEtapaMT.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  Adiciona;
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := ( Trim( edProc.Text ) <> '' );
end;

procedure TfrmCadAutxEtapaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  cds.Cancel;
  grdGrupoDispo.SetFocus;
end;

end.

