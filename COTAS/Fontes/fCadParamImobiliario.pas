unit fCadParamImobiliario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, DBCtrls, Mask, StdCtrls, wwdblook, CMDBLookupCombo,
  ExtCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, dBAseDados, uSistema, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, uCtrlParametros, uMensErro, uVerificaPreenchimento,Grids, Wwdbigrd, Wwdbgrid,
  uCmSqlParams, DBTables, Wwquery;

type
  TfrmCadParamImobiliario = class(TFrmCadastroGridMTCotas)
    pnlCriterios: TPanel;
    rdgrTipoOper: TRadioGroup;
    cmbModulos: TCMDBLookupCombo;
    Label2: TLabel;
    cmbDesCusto: TCMDBLookupCombo;
    CdsModulos: TCMClientDataSet;
    CdsDescCusto: TCMClientDataSet;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    rdgrMovCota: TDBRadioGroup;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CdsIDTIPOCUSTORECIMO: TFloatField;
    CdsRECCUSTO: TStringField;
    CdsIDMODULO: TFloatField;
    CdsDESCMODULO: TStringField;
    CdsDESCCUSTORECIMO: TStringField;
    CdsFLGMOVCOTA: TStringField;
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure rdgrTipoOperClick(Sender: TObject);
    procedure cmbModulosCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbDesCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure rdgrTipoOperExit(Sender: TObject);
    procedure cmbModulosExit(Sender: TObject);
    procedure cmbDesCustoExit(Sender: TObject);
  private
    { Private declarations }

  CtrlParametros : TCtrlParametros;
  procedure MensErroMt( sMsgInfo: string );
  function VerificaPreenchimento : Boolean;
  procedure FiltraPesquisa;



  public
    { Public declarations }
  end;

var
  frmCadParamImobiliario: TfrmCadParamImobiliario;

implementation

{$R *.DFM}

procedure TfrmCadParamImobiliario.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
FlgMovCota, FlgCotaRecDes: string;
iIdTipoCustoRecImo : integer;

begin
  inherited;
  FlgMovCota         := Cds.FieldByName('FLGMOVCOTA').AsString;
  iIdTipoCustoRecImo := Cds.FieldbyName('IDTIPOCUSTORECIMO').AsInteger;
  pnlCriterios.Enabled := True;
  Accept := CtrlParametros.GravaMovCotaImobiliario(FlgMovCota,FlgCotaRecDes,iIdTipoCustoRecImo);
end;

procedure TfrmCadParamImobiliario.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadParamImobiliario.rdgrTipoOperClick(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamImobiliario.cmbModulosCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
    FiltraPesquisa;
  if cmbModulos.Text <> '' then
    CdsDescCusto.Data := CtrlParametros.ListaDescCustoRecImo
                        (CdsModulos.FieldByName('IDMODULO').AsInteger)
  else
    CdsDescCusto.Data    := CtrlParametros.ListaDescCustoRecImo(-1);

end;

procedure TfrmCadParamImobiliario.cmbDesCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamImobiliario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlParametros);
end;

procedure TfrmCadParamImobiliario.FormCreate(Sender: TObject);
begin
  CtrlParametros :=  TCtrlParametros.Create;
  CtrlParametros.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);

  CtrlParametros.CdsTipoCustoRecImov := Cds;

  Cds.Data := CtrlParametros.ListaTipoCustorecImov(-1,-1,-1);
  CdsModulos.Data   := CtrlParametros.ListaModulos;
  CdsDescCusto.Data := CtrlParametros.ListaDescCustoRecImo(-1);                      
  
  inherited;

end;

procedure TfrmCadParamImobiliario.MensErroMt(sMsgInfo: string);
begin
//forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

function TfrmCadParamImobiliario.VerificaPreenchimento: Boolean;
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

procedure TfrmCadParamImobiliario.FiltraPesquisa;
var
iTipoOper,iIdModulo, iIdDescCusto: integer;
begin
  if rdgrTipoOper.ItemIndex <> -1 then
    iTipoOper := rdgrTipoOper.ItemIndex
  else iTipoOper := -1;

  if cmbModulos.Text <> '' then
    iIdModulo := CdsModulos.FieldByName('IDMODULO').AsInteger
  else iIdModulo := -1;

  if cmbDesCusto.Text <> '' then
    iIdDescCusto := CdsDescCusto.FieldByName('IDTIPOCUSTORECIMO').AsInteger
  else
    iIdDescCusto := -1;  

  Cds.Data := CtrlParametros.ListaTipoCustorecImov(iTipoOper,iIdModulo,iIdDescCusto);
end;

procedure TfrmCadParamImobiliario.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := false;
end;

procedure TfrmCadParamImobiliario.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := True;
end;

procedure TfrmCadParamImobiliario.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlCriterios.Enabled := True;
end;

procedure TfrmCadParamImobiliario.CmeCadastroFind(Sender: TObject);
var
RecCusto : integer;

begin
  inherited;
  if MontaSelect.RetornouValor then begin
    if MontaSelect.ValoresChave[2] = 'R' then
      RecCusto := 0
    else
      RecCusto := 1;
    Cds.Data := CtrlParametros.ListaTipoCustorecImov
                (RecCusto,StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
  end;
end;

procedure TfrmCadParamImobiliario.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadParamImobiliario.rdgrTipoOperExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamImobiliario.cmbModulosExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

procedure TfrmCadParamImobiliario.cmbDesCustoExit(Sender: TObject);
begin
  inherited;
  FiltraPesquisa;
end;

end.
