unit fCadHstMovCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, uVerificapreenchimento, Wwdatsrc, uCmSqlParams,
  Db, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMDBLookupCombo, Buttons, TREdit, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlAtivoCota, uMensErro, uCmTypes,uCtrlPatro, uCtrlPlanPrevContabil, uCtrlHstMovCota,
  Mask, dBasedados, uCtrlCotatipooper, uSistema, DBCtrls, uCtrlPlanPrevContabPatro,
  Wwdbdlg, uCtrlParamCota;

type
  TfrmCadHstMovCota = class(TFrmCadastroGridMTCotas)
    pnlCriterios: TPanel;
    cmbPlano: TCMDBLookupCombo;
    cmbPatro: TCMDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    CdsCotatipoOper: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    cmbAtivos: TCMDBLookupCombo;
    Label10: TLabel;
    CdsAtivos: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    edValor: TDBRealEdit;
    Label5: TLabel;
    CdsIDATIVOCOTA: TFloatField;
    CdsIDCOTATIPOOPER: TFloatField;
    CdsDATA: TDateTimeField;
    CdsVALOR: TFloatField;
    CdsIDPLANOPREV: TFloatField;
    CdsIDPATRO: TFloatField;
    CdsDESCATIVO: TStringField;
    CdsDESCTIPOOPER: TStringField;
    CdsDESCPLANO: TStringField;
    CdsDESCPATRO: TStringField;
    CdsIDHSTMOVCOTA: TFloatField;
    MontaSelectLote: TMontaSelect;
    Label6: TLabel;
    edLote: TEdit;
    edData: TCMDateTimePicker;
    Label2: TLabel;
    cmbRecDes: TCMDBLookupCombo;
    Label1: TLabel;
    btProcuraLote: TBitBtn;
    btLimparLote: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbPlanoEnter(Sender: TObject);
    procedure cmbPatroEnter(Sender: TObject);
    procedure cmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edDataCloseUp(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btProcuraLoteClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure cmbAtivosExit(Sender: TObject);
    procedure btLimparLoteClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }

  CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
  CtrlCotatipooper        : TCtrlCotatipooper;
  CtrlAtivoCota           : TCtrlAtivoCota;
  CtrlHstMovCota          : TCtrlHSTMovCota;
  CtrlParamCota : TCtrlParamCota;

  procedure  FazerRefresh; Override;
  function   VerificaPreenchimento : Boolean;

  procedure MensErroMt(sMsgInfo: string);


  public
    { Public declarations }
  end;

var
  frmCadHstMovCota: TfrmCadHstMovCota;

implementation

{$R *.DFM}

procedure TfrmCadHstMovCota.FormCreate(Sender: TObject);
begin

  CtrlPlanPrevContabPatro  :=  TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                      MensErroMT);

  CtrlCotatipooper  :=  TCtrlCotatipooper.Create;
  CtrlCotatipooper.InitializeAs(CtrlPlanPrevContabPatro);


  CtrlAtivoCota := TCtrlAtivoCota.Create;
  CtrlAtivoCota.InitializeAs(CtrlPlanPrevContabPatro);

  CtrlHstMovCota := TCtrlHstMovCota.Create;
  CtrlHstMovCota.InitializeAs(CtrlPlanPrevContabPatro);

  CtrlHstMovCota.cdsHstMovCota := Cds;

  Cds.Data             := CtrlHstMovCota.ListaHistMovAtivos(-2);
  CdsAtivos.Data       := CtrlAtivoCota.ListaAtivoCota(-1,True);
  CdsCotatipoOper.Data := CtrlCotatipooper.ListaCota;

  CtrlParamCota := TCtrlParamCota.Create;
  CtrlParamCota.InitializeAs(CtrlPlanPrevContabPatro);
  CtrlParamCota.GetParams(Sistema.IDEmpresa);

  edData.MinDate := CtrlParamCota.DtPrimeira;
end;

procedure TfrmCadHstMovCota.MensErroMt(sMsgInfo: string);
begin
 //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmCadHstMovCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlCotatipooper);
  FreeAndNil(CtrlAtivoCota);
  FreeAndNil(CtrlHstMovCota);
  FreeAndNil(CtrlParamCota);
end;

procedure TfrmCadHstMovCota.cmbPlanoEnter(Sender: TObject);
begin
  inherited;

  if cmbPatro.Text = '' then
    CdsPlano.Data := CtrlHstMovCota.ListaPlanoContabil
  else
    CdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,CdsPatro.FieldByName('IDPATRO').AsInteger,-1);
  if CmeCadastro.Operacao = opInserir then  cmbPlano.DropDown;

end;

procedure TfrmCadHstMovCota.cmbPatroEnter(Sender: TObject);
begin
  inherited;
  if cmbPlano.Text = '' then
    CdsPatro.Data := CtrlHstMovCota.ListaPatro
  else
    CdsPatro.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(CdsPlano.FieldByName('IDPLANOPREV').AsInteger,-1,-1);
  if CmeCadastro.Operacao = opInserir then  cmbPatro.DropDown;
end;


procedure TfrmCadHstMovCota.FazerRefresh;
var
iIdHstMovCota, iIdAtivoCota, iIdLote, iIdPlanoPrev, iIdPatro : integer;

begin
  if cmbAtivos.Text <> '' then
    iIdAtivoCota := CdsAtivos.FieldbyName('IDATIVOCOTA').AsInteger
  else iIdAtivoCota := -1;
  if cmbPlano.Text <> '' then
    iIdPlanoPrev := CdsPlano.FieldbyName('IDPLANOPREV').AsInteger
  else iIdPlanoPrev := -1;
  if cmbPatro.Text <> '' then
    iIdPatro := CdsPatro.FieldbyName('IDPATRO').AsInteger
  else iIdPatro := -1;
  if edLote.Text <> '' then
    iIdLote :=  StrToInt(edLote.Text)
  else
    iIdLote := -1;

  //  Caso não contenha nenhuma condição nos combo's/edit's, o Cds é aberto com uma qry em branco
  if (cmbAtivos.Text = '') and (cmbPlano.Text = '') and (cmbPatro.Text = '') and (edLote.Text = '')  then
    iIdHstMovCota := -2
  else
    iIdHstMovCota := -1;
  Cds.Data := CtrlHstMovCota.ListaHistMovAtivos(iIdHstMovCota,iIdAtivoCota,iIdLote,iIdPlanoPrev,iIdPatro,-1);
  CmeCadastro.AtualizaBotoes(self);
end;


procedure TfrmCadHstMovCota.cmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if CmeCadastro.Operacao <> opInserir then
    FazerRefresh;
end;

procedure TfrmCadHstMovCota.edDataCloseUp(Sender: TObject);
begin
  if CmeCadastro.Operacao <> opInserir then
    FazerRefresh;

end;

function TfrmCadHstMovCota.VerificaPreenchimento: Boolean;
begin
  try
    if cmbAtivos.Text = '' then
      raise EValidacao.CreateVal('É necessário informar um ativo!',cmbAtivos)
    else if cmbPlano.Text = '' then
      raise EValidacao.CreateVal('É necessário informar um plano!',cmbPlano)
    else if cmbPatro.Text = '' then
      raise EValidacao.CreateVal('É necessário informar uma patro!',cmbPatro)
    else if cmbRecDes.Text = '' then
      raise EValidacao.CreateVal('É necessário informar um tipo de receita/despesa!',cmbRecDes)
    else if edData.Text = '' then
      raise EValidacao.createVal('É necessário informar uma data!',edData)
    else if edValor.Text = '0,00' then
      raise EValidacao.createVal('É necessário informar um valor!',edValor);

  except
     on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;

end;

procedure TfrmCadHstMovCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadHstMovCota.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin

  if cmbAtivos.Text <> '' then begin
    Cds.FieldByName('IDATIVOCOTA').AsInteger := CdsAtivos.FieldByName('IDATIVOCOTA').AsInteger;
  end;
  if cmbRecDes.Text <> '' then begin
    Cds.FieldByName('IDCOTATIPOOPER').AsInteger := CdsCotatipoOper.FieldByName('IDCOTATIPOOPER').AsInteger;
  end;
  if cmbPlano.Text <> '' then begin
    Cds.FieldByName('IDPLANOPREV').AsInteger := CdsPlano.FieldByName('IDPLANOPREV').AsInteger;
  end;
  if cmbPatro.Text <> '' then begin
    Cds.FieldByName('IDPATRO').AsInteger :=  CdsPatro.FieldByName('IDPATRO').AsInteger;
  end;

  Cds.FieldByName('DATA').AsString := edData.Text;
  edLote.Clear;
  Accept := CtrlHstMovCota.GravaHstMovCota;

  inherited;

end;

procedure TfrmCadHstMovCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  edValor.Text := '0';

end;


procedure TfrmCadHstMovCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    FazerRefresh;
    Cds.Data := CtrlHstMovCota.ListaHistMovAtivos(StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadHstMovCota.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadHstMovCota.btProcuraLoteClick(Sender: TObject);
begin
  if CmeCadastro.Operacao <> opInserir then begin
    MontaSelectLote.Executar;
    if MontaSelectLote.RetornouValor then  begin
      edLote.Text := MontaSelectLote.ValoresChave[0];
      FazerRefresh;
    end;
  end;
end;

procedure TfrmCadHstMovCota.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlHstMovCota.GravaHstMovCota;
end;

procedure TfrmCadHstMovCota.cmbAtivosExit(Sender: TObject);
begin
  if CmeCadastro.Operacao <> opInserir then
    FazerRefresh;
end;

procedure TfrmCadHstMovCota.btLimparLoteClick(Sender: TObject);
begin
  if CmeCadastro.Operacao <> opInserir then begin
    FazerRefresh;
    edLote.Clear;
  end;
end;

procedure TfrmCadHstMovCota.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if cmbAtivos.Text = '' then cmbAtivos.SetFocus
  else cmbRecDes.SetFocus;
end;

end.
