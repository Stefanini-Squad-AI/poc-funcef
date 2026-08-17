//************************************************************************************************//
// Data      : 02/01/2008
// Código    : AL_2
// Pendencia : 26690
// SOL       : 71636
// Descrição : Melhora na seleção dos tipos de operação
//************************************************************************************************//
// Data      : 03/02/2007
// Código    : AL_1
// Pendencia : 22502
// SOL       : 43746
// Descrição : Ajustes na aparencia do form
//************************************************************************************************//
unit fCadParamInvestimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, uCtrlParametros, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uSistema, uVerificaPreenchimento, dBaseDados, uMensErro, wwdblook,
  CMDBLookupCombo, DBCtrls, Mask, DBTables, Wwquery, uCmSqlParams;

type
  TfrmCadParamInvestimento = class(TFrmCadastroGridMTCotas)
    pnlCriterios: TPanel;
    CdsTipoOper: TCMClientDataSet;
    cmbTipoOper: TCMDBLookupCombo;
    Label1: TLabel;
    CdsTipoInvest: TCMClientDataSet;
    cmbTipoInvest: TCMDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    rdgrMovCota: TDBRadioGroup;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    CdsIDTIPOINVEST: TFloatField;
    CdsIDTIPOOPERACAO: TFloatField;
    CdsDESCTIPOOPERACAO: TStringField;
    CdsDESCTIPOINVEST: TStringField;
    CdsFLGTRANSF: TStringField;
    CdsFLGMOVCOTA: TStringField;
    CdsFLGCOTA: TStringField;
    CMSqlParams1: TCMSqlParams;
    wwDBGrid1: TwwDBGrid;
    cdsDespXTipoOper: TCMClientDataSet;
    dsDespXTipoOper: TwwDataSource;
    sqpDespXTipoOper: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbTipoOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure cmbTipoOperExit(Sender: TObject);
    procedure cmbTipoInvestExit(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    CtrlParametros : TCtrlParametros;
    procedure MensErroMt( sMsgInfo: string );
    procedure FazerRefresh; Override;
    function VerificaPreenchimento : Boolean;




  public
    { Public declarations }
  end;

var
  frmCadParamInvestimento: TfrmCadParamInvestimento;

implementation

{$R *.DFM}

{ TfrmParamInvestimento }

procedure TfrmCadParamInvestimento.MensErroMt(sMsgInfo: string);
begin
//forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmCadParamInvestimento.FormCreate(Sender: TObject);
begin
  CtrlParametros :=  TCtrlParametros.Create;
  CtrlParametros.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);

  CtrlParametros.CdsTipoOperacao := Cds;

  Cds.Data           := CtrlParametros.ListaTipoOperFiltrado(-1,-1);
  CdsTipoOper.Data   := CtrlParametros.ListaTipoOper;
  CdsTipoInvest.Data := CtrlParametros.ListaTipoInvest;

  inherited;

end;

procedure TfrmCadParamInvestimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlParametros);
end;

procedure TfrmCadParamInvestimento.FazerRefresh;
var iIDTipoInvest, iIdTipoOper : integer;
begin
  if cmbTipoInvest.LookupValue <> '' then
    iIdTipoInvest := CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger
  else iIdTipoInvest := -1;

  if cmbTipoOper.Text <> '' then
    iIdTipoOper  := CdsTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger
  else iIdTipoOper := -1;

  Cds.Data := CtrlParametros.ListaTipoOperFiltrado(iIdTipoOper,iIdTipoInvest);

end;

procedure TfrmCadParamInvestimento.cmbTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadParamInvestimento.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var FlgMovCota: string;
    iIDTipoInvest, iIdTipoOperacao : integer;

begin
  inherited;
  FlgMovCota      := Cds.FieldByName('FLGMOVCOTA').AsString;
  iIdTipoInvest   := Cds.FieldByName('IDTIPOINVEST').AsInteger;
  iIdTipoOperacao := Cds.FieldByName('IDTIPOOPERACAO').AsInteger;
  Accept := CtrlParametros.GravaMovCotaInvestimento(FlgMovCota,iIDTipoInvest,iIdTipoOperacao);
end;


function TfrmCadParamInvestimento.VerificaPreenchimento: Boolean;
begin
  try
     if  not rdgrMovCota.ItemIndex in [0,1,2] then
       raise EValidacao.CreateVal('É necessário selecionar um tipo de movimentação da cota!', rdgrMovCota);
      Result := True;
   except
     on ev : EValidacao do begin
       if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Result := False;
     end;
   end;

end;

procedure TfrmCadParamInvestimento.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadParamInvestimento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    Cds.Data := CtrlParametros.ListaTipoOperFiltrado
                (StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
  end;
end;

procedure TfrmCadParamInvestimento.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadParamInvestimento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := false;
end;

procedure TfrmCadParamInvestimento.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := true;
end;

procedure TfrmCadParamInvestimento.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := true;
end;

procedure TfrmCadParamInvestimento.cmbTipoOperExit(Sender: TObject);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadParamInvestimento.cmbTipoInvestExit(Sender: TObject);
var iIDTipoInvest: integer;
begin
  inherited;
  FazerRefresh;

  //AL_2
  if cmbTipoInvest.LookupValue <> '' then
    iIdTipoInvest := CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger
  else iIdTipoInvest := -1;

  CdsTipoOper.Data   := CtrlParametros.ListaTipoOper(iIdTipoInvest);

end;

procedure TfrmCadParamInvestimento.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cdsDespXTipoOper.Data := CtrlParametros.ListaDespXTipoOper(DataSet.FieldByName('IDTIPOOPERACAO').AsInteger);
end;

end.
