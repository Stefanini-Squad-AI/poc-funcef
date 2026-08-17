unit fCadPrevisaoDiariaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, wwdbedit, mImovel, Wwdbspin, StdCtrls, Mask, Wwdotdot,
  Wwdbcomb, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Provider, DBTables, Wwquery, uCMTypes,
  mImovelAtivo, uCtrlPrevImob,dBaseDados, uSistema, uComunsImobiliario,
  uVerificaPreenchimento, uMensErro, uModuloImobiliario, wwdblook, uCtrlTipoCustoRecImov,
  TREdit;

type
  TfrmCadPrevisaoDiariaMT = class(TfrmCadastroMtImob)
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    CdsIDPREVIMOB: TFloatField;
    CdsCODTIPIMOVEL: TStringField;
    CdsIDIMOVEL: TFloatField;
    CdsIDTIPOCUSTORECIMO: TFloatField;
    CdsMESCOMPETENCIA: TFloatField;
    CdsANOCOMPETENCIA: TFloatField;
    molImovelAtivo1: TmolImovelAtivo;
    CdsDESCCUSTORECIMO: TStringField;
    Label3: TLabel;
    DBcboTipoCustoRecImo: TwwDBLookupCombo;
    CdsTipoCustoRecImo: TCMClientDataSet;
    CdsTipoCustoRecImoIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImoDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImoRECCUSTO: TStringField;
    CdsTipoCustoRecImoFLGDIARIO: TStringField;
    Label4: TLabel;
    dbEdtValor: TDBRealEdit;
    CdsVLRMES: TFloatField;
    CdsVLRANO: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlPrevImob: TCtrlPrevImob;
    CtrlTipoCustoRecImov: TCtrlTipoCustoRecImov;
    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  frmCadPrevisaoDiariaMT: TfrmCadPrevisaoDiariaMT;

implementation

{$R *.DFM}

procedure TfrmCadPrevisaoDiariaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPrevImob := TCtrlPrevImob.Create( Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        Sistema.UsaPlanoPatro );
  CtrlPrevImob.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPrevImob.CdsPrevImob := Cds;

  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoCustoRecImov.InitializeAs(CtrlPrevImob);
  CdsTipoCustoRecImo.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov (Sistema.IdModulo, '', -1, 'S');

  // Adiciona filtro por módulo no monta select
  MontaSelect.Filtro.Add('T.IDMODULO = ' + IntToStr(Sistema.IdModulo) );
end;

procedure TfrmCadPrevisaoDiariaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPrevImob);
  FreeAndNil(CtrlTipoCustoRecImov);
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molImovelAtivo1.iImovel := StrToInt(MontaSelect.ValoresChave[3]);
    molImovelAtivo1.edtImovel.Text := MontaSelect.ValoresChave[1] + ' - ' + MontaSelect.ValoresChave[2];
    molImovelAtivo1.sCodTipoImo := MontaSelect.ValoresChave[4];

    Cds.Data := CtrlPrevImob.LookupPrevImob (StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsInteger := molImovelAtivo1.iImovel;
  CdsCODTIPIMOVEL.AsString := molImovelAtivo1.sCodTipoImo;
  Accept := CtrlPrevImob.GravaPrevImob;
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPrevImob.GravaPrevImob;
end;

function TfrmCadPrevisaoDiariaMT.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    // Imovel
    if CdsIDIMOVEL.IsNull then
      raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelAtivo1.btnBuscaImovel);

    // Valor
    if CdsVLRMES.isNULL then
      raise EValidacao.CreateVal('É necessário indicar o valor da Previsão!', dbEdtValor);

  except
    on ev : EValidacao do begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsANOCOMPETENCIA.AsInteger := ModuloImobiliario.AdminImob.iAnoCompetencia;
  CdsMESCOMPETENCIA.AsInteger := ModuloImobiliario.AdminImob.iMesCompetencia;
  molImovelAtivo1.btnLimpaImovelClick(self);
end;

procedure TfrmCadPrevisaoDiariaMT.sbtnAlterarClick(Sender: TObject);
var
  dCompetencia, dLancamento: Tdate;
begin
  DBcboTipoCustoRecImo.Enabled := false;
  dCompetencia := EncodeDate (ModuloImobiliario.AdminImob.iAnoCompetencia,
                              ModuloImobiliario.AdminImob.iMesCompetencia, 1);
  dLancamento  := EncodeDate (CdsANOCOMPETENCIA.AsInteger, CdsMESCOMPETENCIA.AsInteger, 1);
  if dLancamento < dCompetencia then begin
    MsgDlg ('A Previsão somente pode ser editada dento da competência de trabalho!', 'Aviso', mtWarning, [mbok], 0);
    sbtnAlterar.Down := false;
  end else
    inherited;
end;

procedure TfrmCadPrevisaoDiariaMT.sbtnApagarClick(Sender: TObject);
var
  dCompetencia, dLancamento: Tdate;
begin
  dCompetencia := EncodeDate (ModuloImobiliario.AdminImob.iAnoCompetencia,
                              ModuloImobiliario.AdminImob.iMesCompetencia, 1);
  dLancamento  := EncodeDate (CdsANOCOMPETENCIA.AsInteger, CdsMESCOMPETENCIA.AsInteger, 1);
  if dLancamento < dCompetencia then begin
    MsgDlg ('A Previsão somente pode ser editada dento da competência de trabalho!', 'Aviso', mtWarning, [mbok], 0);
    sbtnApagar.Down := false;
  end else
    inherited;
end;

procedure TfrmCadPrevisaoDiariaMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBcboTipoCustoRecImo.Enabled := true;
end;

procedure TfrmCadPrevisaoDiariaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o cds com o registro após a edição
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlPrevImob.LookupPrevImob( CdsIDPREVIMOB.AsInteger );
end;

end.
