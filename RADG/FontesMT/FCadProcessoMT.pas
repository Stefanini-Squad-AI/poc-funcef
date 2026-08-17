// André tavares - colocada a critica numero de etapas finais e inciacais (nao podem ser > 1)
unit FCadProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, Mask, wwdbedit, DBCtrls,
  DBCtrls2, DBTables, ComCtrls, FCadastroMestreDetMT, Grids,
  Wwdbigrd, Wwdbgrid, TabControlDetalhe, wwdbdatetimepicker,
  CMDateTimePicker,uCMTypes, CMDBLookupCombo, Wwdotdot, Wwdbcomb,
  uCtrlTipoProcesso, uCtrlGrupoRespon, uCtrlGrupoAut, uCtrlTipoEtapa,
  uCtrlGrpProcesso,uCmSqlParams, Wwquery, Wwdbspin, wwclient;
type
  TfrmCadProcessoMT = class(TFrmCadastroMestreDetMT)
    cdsGrupoAut: TCMClientDataSet;
    cdsGrupoRespon: TCMClientDataSet;
    cdsModulo: TCMClientDataSet;
    cdsTipoEtapa: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    lblNome: TLabel;
    edNome: TDBEdit;
    Label3: TLabel;
    spNDias: TSpinEdit;
    Label14: TLabel;
    dblcGrpProc: TCMDBLookupCombo;
    memDesc: TDBMemo;
    Label15: TLabel;
    tbsObservacao: TTabSheet;
    tbsRestricao: TTabSheet;
    tbsGerenciamento: TTabSheet;
    Label2: TLabel;
    dblcEtapa: TCMDBLookupCombo;
    chkInicial: TDBCheckBox;
    chkFinal: TDBCheckBox;
    dblcModulo: TCMDBLookupCombo;
    Label4: TLabel;
    Label9: TLabel;
    memOBS: TDBMemo;
    Label6: TLabel;
    edGaruGrp: TDBRealEdit;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    Label7: TLabel;
    dblcGrpResp: TCMDBLookupCombo;
    Label8: TLabel;
    dblcGrpConsulta: TCMDBLookupCombo;
    Label13: TLabel;
    dblcGrpInst: TCMDBLookupCombo;
    Label16: TLabel;
    dblcReferencia: TCMDBLookupCombo;
    spNDiaEtapa: TwwDBSpinEdit;
    cdsReferencia: TCMClientDataSet;
    sqlReferencia: TCMSqlParams;
    qryDet: TwwQuery;
    cdsGrupoProc: TCMClientDataSet;
    cdsDet: TwwClientDataSet;
    dbrValMinimo: TDBRealEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    DbmDescricao: TDBMemo;
    Label5: TLabel;
    dsReferencia: TwwDataSource;
    cdsAux: TCMClientDataSet;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
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
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    _GrupoRespon  : TCtrlGrupoRespon;
    _TipoEtapa    : TCtrlTipoEtapa;
    _GrpProcesso  : TCtrlGrpProcesso;
    _GrupoAut     : TCtrlGrupoAut;
    _TipoProcesso : TCtrlTipoProcesso;
    _iContaEtapaIni, _iContaEtapaFinal : integer; // andre tavares
    procedure SelecionaDet(idTipoProcesso: Double);
    // andre tavares - 06/05/2005 - soma os números de dias do detalhe
    function somaNumDias: integer;
  public
    { Public declarations }
  end;

var
  frmCadProcessoMT: TfrmCadProcessoMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadProcessoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := False;
   If Trim(edNome.Text) = '' Then Begin
      MsgDlg('Nome do Processo não preenchido','Erro',mtError,[mbOK],0);
      edNome.SetFocus;
      Exit;
   End;
   If Trim(dblcGrpProc.Text) = '' Then Begin
      MsgDlg('Grupo de Processo não preenchido','Erro',mtError,[mbOK],0);
      dblcGrpProc.SetFocus;
      Exit;
   End;
   If (cds.State = dsInsert ) And ( _TipoProcesso.VerifNome(edNome.Text) )  Then Begin
      MsgDlg('Nome do Processo :'+edNome.Text+' já Exite','Erro',mtError,[mbOK],0);
      edNome.SetFocus;
      Exit;
   End;
   If Trim(dblcGrpInst.Text) = '' Then Begin
      MsgDlg('Grupo para criar processo não preenchido','Erro',mtError,[mbOK],0);
      dblcGrpInst.SetFocus;
      Exit;
   End;
   If Trim(dblcGrpResp.Text) = '' Then Begin
      MsgDlg('Gestor de processo não preenchido','Erro',mtError,[mbOK],0);
      dblcGrpResp.SetFocus;
      Exit;
   End;
   If Trim(dblcGrpConsulta.Text) = '' Then Begin
      MsgDlg('Grupo Autorizado disponível para consulta não preenchido','Erro',mtError,[mbOK],0);
      dblcGrpConsulta.SetFocus;
      Accept := False;
      Exit;
   End;
   // início andré tavares - 06/05/2005
   if _TipoProcesso.ReferenciaEmUso(strToIntDef(dblcReferencia.LookupValue, -1), cds.FieldByName('IDTIPOPROCESSO').AsInteger) then
   Begin
     MsgDlg('Esta referência já está sendo utilizada em outro tipo processo','Erro',mtError,[mbOK],0);
     dblcReferencia.SetFocus;
     Accept := False;
     Exit;
   End;

   if trunc(spNDias.value) <> somaNumDias then
   Begin
     MsgDlg('O total do nº de dias do tipo de processo tem que ser igual à soma nº de dias das etapas do mesmo.','Erro',mtError,[mbOK],0);
     spNDias.SetFocus;
     Accept := False;
     Exit;
   End;
   // fim andré tavares - 06/05/2005

   // inicio andre tavares
   accept := false;
   _iContaEtapaIni := 0;
   _iContaEtapaFinal := 0;
   cdsAux.Data := cdsDet.Data;
   cdsAux.first;
   while not cdsAux.Eof do
   begin
     if cdsAux.FieldByName('FLGINICIAL').AsString = 'S' then
       inc(_iContaEtapaIni);

     cdsAux.Next;
   end;
   if (_iContaEtapaIni > 1) then
   begin
     MsgDlg('Só é permitido 1 etapa inicial por processo.','Erro',mtError,[mbOK],0);
     Accept := False;
     exit;
   end;

   // fim andre tavares


   Accept := True;
end;

procedure TfrmCadProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _iContaEtapaIni := 0;   // andre tavares
  _iContaEtapaFinal := 0; // andre tavares

  _GrpProcesso := TCtrlGrpProcesso.Create;
  _GrpProcesso.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  

  _TipoEtapa := TCtrlTipoEtapa.Create;
  _TipoEtapa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _GrupoRespon := TCtrlGrupoRespon.Create;
  _GrupoRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _TipoProcesso := TCtrlTipoProcesso.Create;
  _TipoProcesso.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _GrupoAut := TCtrlGrupoAut.Create;
  _GrupoAut.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _TipoProcesso.CdsTipoProc   := cds;
  _TipoProcesso.CdsEtapaxProc := cdsDet;
  
  cds.Data := _TipoProcesso.Procurar(-1);
  SelecionaDet(-1);
  
end;

procedure TfrmCadProcessoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GrupoRespon.Free;
  _TipoEtapa.Free;
  _GrpProcesso.Free;
  _GrupoAut.Free;
  _TipoProcesso.Free;
end;

procedure TfrmCadProcessoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGCENTCUST').AsString   := 'N';
  cds.FieldByName('FLGCENTRESPON').AsString := 'N';
  cds.FieldByName('FLGGRUPPROD').AsString   := 'N';
  cds.FieldByName('FLGUNIDNEGOC').AsString  := 'N';
  cds.FieldByName('FLGVALOR').AsString      := 'N';
  edNome.SetFocus;
  SelecionaDet(-1);
end;

procedure TfrmCadProcessoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edNome.SetFocus;
end;

procedure TfrmCadProcessoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := _TipoProcesso.Procurar(StrTointDef(MontaSelect.ValoresChave[0],0));
     SelecionaDet(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoProcesso.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoProcesso.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoProcesso.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadProcessoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _TipoProcesso.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _TipoProcesso.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadProcessoMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsGrupoAut.Data     := _GrupoAut.ListaGrupoAut;
  cdsGrupoRespon.Data  := _GrupoRespon.ListaGrupoRespon;
  cdsTipoEtapa.Data    := _TipoEtapa.ListaRadTipoEtapa(0);
  cdsGrupoProc.Data    := _GrpProcesso.ListaRadGrupoProcesso;
  
  sqlReferencia.Prepare;
  sqlReferencia.Open;
  
  sqlModulo.Prepare;
  sqlModulo.Open;
end;

procedure TfrmCadProcessoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := _TipoProcesso.Procurar(cds.FieldByName('IDTIPOPROCESSO').AsFloat);
  SelecionaDet(cds.FieldByName('IDTIPOPROCESSO').AsFloat);
end;

procedure TfrmCadProcessoMT.SelecionaDet(idTipoProcesso: Double);
begin
  cdsDet.Data := _TipoProcesso.ProcurarEtapaxProcesso(idTipoProcesso);
  cdsDet.ControlType.Add('FLGINICIAL;CheckBox;S;N');
  cdsDet.ControlType.Add('FLGFINAL;CheckBox;S;N');
end;

procedure TfrmCadProcessoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage.PageIndex = 0) then begin
     dblcEtapa.SetFocus;
     cdsDet.FieldByName('FLGINICIAL').AsString := 'N';
     cdsDet.FieldByName('FLGFINAL').AsString   := 'N';
  end;
end;

procedure TfrmCadProcessoMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage.PageIndex = 0) then begin
     dblcEtapa.SetFocus;
  end;
end;

procedure TfrmCadProcessoMT.bbtnOkDetClick(Sender: TObject);
begin
   if (cds.State in ([dsInsert,dsEdit])) then begin
      If Trim(dblcEtapa.Text) = '' Then Begin
         MsgDlg('Etapa não foi preenchida','Erro',mtError,[mbOK],0);
         dblcEtapa.SetFocus;
         exit;
      End;
      If Trim(dblcModulo.Text) = '' Then Begin
         MsgDlg('Sistema não preenchido','Erro',mtError,[mbOK],0);
         dblcModulo.SetFocus;
         exit;
      End;
      cdsDet.FieldByName('DESCETAPA').AsString  := dblcEtapa.Text;
      cdsDet.FieldByName('NOMEMODULO').AsString := dblcModulo.Text;
   end;

   inherited;
end;

// início - andre tavares - 06/05/2005
function TfrmCadProcessoMT.somaNumDias: integer;
begin
  if cdsDet.Active then
  begin
    cdsDet.DisableControls;
    cdsDet.First;
    result := 0;
    while not cdsDet.Eof do
    begin
      result := result + cdsDet.fieldByName('NUMDIASPREVISTO').asInteger;
      cdsDet.Next;
    end;
    cdsDet.EnableControls;
  end;
end;

// fim - andre tavares - 06/05/2005



procedure TfrmCadProcessoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  _iContaEtapaIni := 0;   // andre tavares
  _iContaEtapaFinal := 0; // andre tavares
end;

end.


