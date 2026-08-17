unit FProcxEtapaxObjMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlEtapaxObjeto,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo,
  Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery;

type
  TfrmProcxEtapaxObjMT = class(TFrmCadastroMT)
    cdsObjRadDisp: TCMClientDataSet;
    dsObjRadDisp: TwwDataSource;
    Label5: TLabel;
    edProc: TEdit;
    Label1: TLabel;
    edEtapa: TEdit;
    Label4: TLabel;
    edSitema: TEdit;
    plnGrp: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnRemover: TSpeedButton;
    btnAdicionar: TSpeedButton;
    BtnSobe: TSpeedButton;
    BtnDesce: TSpeedButton;
    Panel1: TPanel;
    grdGrupoDispo: TwwDBGrid;
    grdGrupoSelec: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure BtnSobeClick(Sender: TObject);
    procedure BtnDesceClick(Sender: TObject);
  private
    { Private declarations }
    _EtapaxObjeto : TCtrlEtapaxObjeto;
    Procedure Adiciona;
    Procedure Remove;
    Procedure Sel(idProcesso,idEtapa,idModulo : Double);

  public
    { Public declarations }
  end;

var
  frmProcxEtapaxObjMT: TfrmProcxEtapaxObjMT;
  iProcesso,iEtapa,iModulo : Double;
  sNomeProc, sNomeEtapa, sNomeModulo : String;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmProcxEtapaxObjMT.FormCreate(Sender: TObject);
begin
  inherited;
  _EtapaxObjeto := TCtrlEtapaxObjeto.Create;
  _EtapaxObjeto.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _EtapaxObjeto.CdsEtapaxObjeto := cds;
  
  sNomeProc   := '';
  sNomeEtapa  := '';
  sNomeModulo := '';
  Sel(-1,-1,-1);
  
end;

procedure TfrmProcxEtapaxObjMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _EtapaxObjeto.Free;
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     sNomeProc   := MontaSelect.ValoresChave[3];
     sNomeEtapa  := MontaSelect.ValoresChave[4];
     sNomeModulo := MontaSelect.ValoresChave[5];
     Sel(StrToFloat(MontaSelect.ValoresChave[0]),StrToFloat(MontaSelect.ValoresChave[1]),StrToFloat(MontaSelect.ValoresChave[2]));
  end;
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _EtapaxObjeto.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _EtapaxObjeto.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Sel(iProcesso,iEtapa,iModulo);
end;

procedure TfrmProcxEtapaxObjMT.Adiciona;
begin
   If Not cdsObjRadDisp.IsEmpty Then Begin
      With Cds Do Begin
         Append;
         FieldByName('IDTIPOPROCESSO').AsFloat := iProcesso;
         FieldByName('IDTIPOETAPA').AsFloat    := iEtapa;
         FieldByName('IDOBJETO').AsFloat       := cdsObjRadDisp.FieldByName('IDOBJETO').AsFloat;
         FieldByName('DESCOBJETO').asString    := cdsObjRadDisp.FieldByName('DESCOBJETO').asString;
         FieldByName('ORDEM').AsFloat          := RecordCount+1;
         Post;
      End;
      cdsObjRadDisp.Delete;
   End;
end;

procedure TfrmProcxEtapaxObjMT.Remove;
var iCont : Integer;
begin
   If Not cds.IsEmpty Then Begin
      With cdsObjRadDisp Do Begin
         Append;
         FieldByName('IDOBJETO').AsFloat    := cds.FieldByName('IDOBJETO').AsFloat;
         FieldByName('DESCOBJETO').asString := cds.FieldByName('DESCOBJETO').asString;
         Post;
      End;
      With Cds do Begin
         Delete;
         iCont := 0;
         DisableControls;
         cds.IndexFieldNames := '';
         First;
         While not Eof do Begin
            inc(iCont);
            Edit;
            FieldByName('ORDEM').AsFloat := iCont;
            Post;
            Next;
         End;
         cds.IndexFieldNames := 'ORDEM';
         EnableControls;
      End;
   End;
end;

procedure TfrmProcxEtapaxObjMT.Sel(idProcesso,idEtapa,idModulo : Double);
begin
  cds.Data            := _EtapaxObjeto.ProcurarEtapaxObjeto(idProcesso,idEtapa);
  cdsObjRadDisp.Data  := _EtapaxObjeto.ProcurarObjDisp(idProcesso,idEtapa,idModulo);
  iProcesso           := idProcesso;
  iEtapa              := idEtapa;
  iModulo             := idModulo;
  edProc.Text         := sNomeProc;
  edEtapa.Text        := sNomeEtapa;
  edSitema.Text       := sNomeModulo;
  cds.IndexFieldNames := 'ORDEM';
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxObjeto.AplicaOperacao(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxObjeto.AplicaOperacao(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _EtapaxObjeto.AplicaOperacao(Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmProcxEtapaxObjMT.btnRemoverClick(Sender: TObject);
begin
  inherited;
  Remove;
end;

procedure TfrmProcxEtapaxObjMT.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  Adiciona;
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := (Trim(edProc.Text) <> '');
end;

procedure TfrmProcxEtapaxObjMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  cds.Cancel;
  grdGrupoDispo.SetFocus;
end;

procedure TfrmProcxEtapaxObjMT.BtnSobeClick(Sender: TObject);
var iOrdemDe, iOrdemPara,iNumRef : Integer;
begin
   inherited;
   With Cds do Begin
      if FieldByName('ORDEM').AsInteger > 1 then begin
         DisableControls;
         cds.IndexFieldNames := '';
         iOrdemDe   := FieldByName('ORDEM').AsInteger;
         iNumRef    := FieldByName('IDOBJETO').AsInteger;
         iOrdemPara := FieldByName('ORDEM').AsInteger-1;
         First;
         while not EOF do begin
            if iNumRef = FieldByName('IDOBJETO').AsInteger then begin
               Edit;
               FieldByName('ORDEM').AsFloat := iOrdemPara;
               Post;
            end else begin
              if FieldByName('ORDEM').AsInteger = iOrdemPara then begin
                 Edit;
                 FieldByName('ORDEM').AsFloat := iOrdemDe;
                 Post;
              end;
            end;
            Next;
         end;
         First;
         while not EOF do begin
            if iNumRef = FieldByName('IDOBJETO').AsInteger then
               Break;
            Next;
         end;
         cds.IndexFieldNames := 'ORDEM';
         EnableControls;
      end;
   end;
end;

procedure TfrmProcxEtapaxObjMT.BtnDesceClick(Sender: TObject);
var iOrdemDe, iOrdemPara,iNumRef : Integer;
begin
   inherited;
   With Cds do Begin
      if FieldByName('ORDEM').AsInteger < RecordCount then begin
         DisableControls;
         cds.IndexFieldNames := '';
         iOrdemDe   := FieldByName('ORDEM').AsInteger;
         iNumRef    := FieldByName('IDOBJETO').AsInteger;
         iOrdemPara := FieldByName('ORDEM').AsInteger+1;
         First;
         while not EOF do begin
            if iNumRef = FieldByName('IDOBJETO').AsInteger then begin
               Edit;
               FieldByName('ORDEM').AsFloat := iOrdemPara;
               Post;
            end else begin
              if FieldByName('ORDEM').AsInteger = iOrdemPara then begin
                 Edit;
                 FieldByName('ORDEM').AsFloat := iOrdemDe;
                 Post;
              end;
            end;
            Next;
         end;
         First;
         while not EOF do begin
            if iNumRef = FieldByName('IDOBJETO').AsInteger then
               Break;
            Next;
         end;
         cds.IndexFieldNames := 'ORDEM';
         EnableControls;
      end;
   end;
end;

end.
