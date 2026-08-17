unit fCadParamEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet, MAHlpBtn,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,StdCtrls,
  uSistema, Buttons, uCtrlAtivoCOta, dBAseDados, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, CMDBLookupCombo, Mask,
  wwdbedit, uVerificaPreenchimento, uCtrlParametros, Wwdotdot, Wwdbcomb,
  DBCtrls, uMensErro, uCmSqlParams, DBTables, Wwquery;


type
  TfrmCadParamEmprestimo = class(TFrmCadastroGridMTCotas)
    pnlCriterios: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    CdsTipoContrEmptmo: TCMClientDataSet;
    CdsItemEmptmo: TCMClientDataSet;
    cmbTipoContrEmptmo: TCMDBLookupCombo;
    cmbItensContrato: TCMDBLookupCombo;
    cmbEvento: TwwDBComboBox;
    rdgrMovCota: TDBRadioGroup;
    CdsIDTIPOCONTREMPTMO: TFloatField;
    CdsFLGCOTARECDES: TStringField;
    CdsIDITEMEMPTMO: TFloatField;
    CdsTCEDESCRICAO: TStringField;
    CdsITCEVENTO: TFloatField;
    CdsITEDESCRICAO: TStringField;
    CdsFLGMOVCOTA: TStringField;
    CdsDESCEVENTO: TStringField;
    CdsDECITEMEVTO: TStringField;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbTipoContrEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbEventoCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure cmbTipoContrEmptmoExit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure cmbEventoExit(Sender: TObject);
    procedure cmbItensContratoExit(Sender: TObject);
    procedure cmbEventoClick(Sender: TObject);

  private
    { Private declarations }
  CtrlParametros : TCtrlParametros;
  procedure MensErroMt( sMsgInfo: string );
  procedure FiltraPesquisa;
  function  VerificaPreenchimento : Boolean;

  public
    { Public declarations }
  end;



var
  frmCadParamEmprestimo: TfrmCadParamEmprestimo;

implementation

{$R *.DFM}




procedure TfrmCadParamEmprestimo.FormCreate(Sender: TObject);
begin
  CtrlParametros :=  TCtrlParametros.Create;
  CtrlParametros.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);

  CtrlParametros.CdsItemxTipoContr := Cds;
  Cds.Data                         := CtrlParametros.ListaItemXTipoContr(0,0,-1,-1,-1);
  CdsTipoContrEmptmo.Data          := CtrlParametros.ListaTipoContrEmptmo;
  CdsItemEmptmo.Data               := CtrlParametros.ListaItemEmptmo;

  inherited;

end;

procedure TfrmCadParamEmprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlParametros);
end;

procedure TfrmCadParamEmprestimo.MensErroMt(sMsgInfo: string);
begin
//forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;




procedure TfrmCadParamEmprestimo.FiltraPesquisa;
var
iIdTipoContrEmptmo,iTcEvento, iIdItemEmptmo: integer;

begin
  if cmbTipoContrEmptmo.LookupValue <> '' then
    iIdTipoContrEmptmo := CdsTipoContrEmptmo.FieldByName('IDTIPOCONTREMPTMO').AsInteger
  else iIdTipoContrEmptmo := -1;

  if cmbEvento.Text <> '' then
    iTcEvento          := cmbEvento.ItemIndex
  else iTcEvento := -1;

  if cmbItensContrato.LookupValue <> '' then
    iIdItemEmptmo      := CdsItemEmptmo.FieldByName('IDITEMEMPTMO').AsInteger
  else iIdItemEmptmo := -1;

  Cds.Data := CtrlParametros.ListaItemXTipoContr(0,0,iIdItemEmptmo,iIdTipoContrEmptmo,iTcEvento);
end;


procedure TfrmCadParamEmprestimo.cmbTipoContrEmptmoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  FiltraPesquisa;
  inherited;
end;


procedure TfrmCadParamEmprestimo.cmbEventoCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  FiltraPesquisa;
  inherited;
end;


procedure TfrmCadParamEmprestimo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := false;
end;


procedure TfrmCadParamEmprestimo.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
FlgMovCota,FlgCotaRecDes : string;
iIDTipoCOntrEmptmo,iIdItemEmptmo : integer;

begin
  inherited;
  FlgMovCota         := Cds.FieldByName('FLGMOVCOTA').AsString;
  FlgCotaRecDes      := Cds.FieldByName('FLGCOTARECDES').AsString;
  iIDTipoContrEmptmo := Cds.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
  iIdItemEmptmo      := Cds.FieldByName('IDITEMEMPTMO').AsInteger;
  Accept := CtrlParametros.GravaMovCotaEmprestimo(FlgMovCota,FlgCotaRecDes,iIDTipoCOntrEmptmo,iIdItemEmptmo);
  pnlCriterios.Enabled := true;
  FiltraPesquisa;
end;


procedure TfrmCadParamEmprestimo.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadParamEmprestimo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := true;
end;

procedure TfrmCadParamEmprestimo.cmbTipoContrEmptmoExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamEmprestimo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    Cds.Data := CtrlParametros.ListaItemXTipoContr(0,0,-1,StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[2]));
  end;
end;


function TfrmCadParamEmprestimo.VerificaPreenchimento: Boolean;
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
     Result := false;
   end;
 end;

end;


procedure TfrmCadParamEmprestimo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;


procedure TfrmCadParamEmprestimo.cmbEventoExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamEmprestimo.cmbItensContratoExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamEmprestimo.cmbEventoClick(Sender: TObject);
begin
  inherited;
  cmbEvento.DropDown;
end;

end.
