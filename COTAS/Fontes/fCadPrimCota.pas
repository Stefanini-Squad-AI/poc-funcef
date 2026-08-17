unit fCadPrimCota;

interface

uses
   Windows, Messages, dBaseDados, uSistema, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, uMensErro, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ExtCtrls, uCtrlHstMovCota, uCtrlCotaCotacao, uCtrlAtivoCota, wwdblook, CMDBLookupCombo, TREdit,
   uCmSqlParams, Mask, uCtrlPlanPrevContabPatro, wwdbedit,
   wwdbdatetimepicker, uVerificaPreenchimento, CMDateTimePicker, DBTables, uCtrlParamCota;


type
   TfrmCadPrimCota = class(TFrmCadastroGridMTCotas)
      cmbPatrimonio: TCMDBLookupCombo;
      Label1: TLabel;
      cmbPlano: TCMDBLookupCombo;
      cmbPatro: TCMDBLookupCombo;
      edValorPatri: TDBRealEdit;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      CdsPatrimonio: TCMClientDataSet;
      CdsPlano: TCMClientDataSet;
      CdsPatro: TCMClientDataSet;
      edQtdCota: TwwDBEdit;
      Label6: TLabel;
      Label7: TLabel;
      CdsIDCOTACOTACAO: TFloatField;
      CdsDATA: TDateTimeField;
      CdsIDATIVOCOTA: TFloatField;
      CdsIDPATRO: TFloatField;
      CdsIDPLANO: TFloatField;
      CdsVLRCOTA: TFloatField;
      CdsVLRPATRIMONIO: TFloatField;
      CdsQTDCOTA: TFloatField;
      CdsNOMEPATRO: TStringField;
      CdsNOMEPLANO: TStringField;
      wwDBEdit2: TwwDBEdit;
      edValorCota: TwwDBEdit;
    CdsATIVO: TStringField;
    Query1: TQuery;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure cmbPlanoEnter(Sender: TObject);
      procedure cmbPatroEnter(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure edValorPatriExit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);

   private  // Private declarations

      CtrlHstMovCota          : TCtrlHstMovCota;
      CtrlCotaCotacao         : TCtrlCotaCotacao;
      CtrlAtivoCota           : TCtrlAtivoCota;
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
      CtrlParamCota           : TCtrlParamCota;

      procedure MensErroMt(sMsgInfo: string);
      procedure FazerRefresh; Override;
      function  VerificaPreenchimento : Boolean;


   public   // Public declarations

   end;

var
  frmCadPrimCota: TfrmCadPrimCota;

implementation

{$R *.DFM}

procedure TfrmCadPrimCota.FormCreate(Sender: TObject);
begin
   CtrlHstMovCota  :=  TCtrlHstMovCota.Create;
   CtrlHstMovCota.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                              MensErroMT);

   CtrlCotaCotacao := TCtrlCotaCotacao.Create;
   CtrlCotaCotacao.InitializeAs(CtrlHstMovCota);

   CtrlAtivoCota := TCtrlAtivoCota.Create;
   CtrlAtivoCota.InitializeAs(CtrlHstMovCota);

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlHstMovCota);

   CtrlCotaCotacao.CdsCotaCotacao   := Cds;
   Cds.Data                         := CtrlAtivoCota.ListaCotaCotacao;
   CdsPatrimonio.Data               := CtrlAtivoCota.ListaAtivoCota(-1, True);

   CtrlParamCota := TCtrlParamCota.Create;
   CtrlParamCota.InitializeAs(CtrlHstMovCota);
   CtrlParamCota.GetParams(Sistema.IDEmpresa);

   inherited;
end;



procedure TfrmCadPrimCota.MensErroMt(sMsgInfo: string);
begin
  //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmCadPrimCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlHstMovCota);
  FreeAndNil(CtrlCotaCotacao);
  FreeAndNil(CtrlAtivoCota);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlParamCota);
end;

procedure TfrmCadPrimCota.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Cds.FieldByName('IDATIVOCOTA').AsInteger :=  CdsPatrimonio.FieldByName('IDATIVOCOTA').AsInteger;
  Cds.FieldByName('IDPATRO').AsInteger     :=  CdsPatro.FieldByName('IDPATRO').AsInteger;
  Cds.FieldByName('IDPLANO').AsInteger     :=  CdsPlano.FieldByName('IDPLANOPREV').AsInteger;
  Accept := CtrlCotaCotacao.GravaCotaCotacao;
  inherited;
end;

procedure TfrmCadPrimCota.cmbPlanoEnter(Sender: TObject);
begin
  inherited;
   if cmbPatro.Text = '' then
    CdsPlano.Data := CtrlHstMovCota.ListaPlanoContabil
  else
    CdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,CdsPatro.FieldByName('IDPATRO').AsInteger,-1);
end;

procedure TfrmCadPrimCota.cmbPatroEnter(Sender: TObject);
begin
  inherited;
  if cmbPlano.Text = '' then
    CdsPatro.Data := CtrlHstMovCota.ListaPatro
  else
    CdsPatro.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(CdsPlano.FieldByName('IDPLANOPREV').AsInteger,-1,-1);
end;

procedure TfrmCadPrimCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  cds.FieldByName('DATA').AsDateTime := CtrlParamCota.DtPrimeira;
  cds.FieldByName('VLRCOTA').AsFloat := CtrlParamCota.VlrPrimeira;
  cmbPatrimonio.Clear;
  cmbPatro.Clear;
  cmbPlano.Clear;
end;

procedure TfrmCadPrimCota.edValorPatriExit(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('QTDCOTA').AsFloat :=
     Cds.FieldByName('VLRPATRIMONIO').AsFloat / Cds.FieldByName('VLRCOTA').AsFloat;
end;

procedure TfrmCadPrimCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    Cds.Data := CtrlAtivoCota.ListaCotaCotacao(StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadPrimCota.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlAtivoCota.ListaCotaCotacao;

end;

function TfrmCadPrimCota.VerificaPreenchimento: Boolean;
begin
   try
    if cmbPatrimonio.Text = '' then
      raise EValidacao.CreateVal('É necessário informar um patrimônio!',cmbPatrimonio)
    else if cmbPlano.Text = '' then
      raise EValidacao.CreateVal('É necessário informar um plano!',cmbPlano)
    else if cmbPatro.Text = '' then
      raise EValidacao.CreateVal('É necessário informar uma patro!',cmbPatro)
    else if edValorPatri.Text = '0,00' then
      raise EValidacao.createVal('É necessário informar o valor do patrimônio!',edValorPatri)
    else if (edQtdCota.Text = '') or (edQtdCota.Text = '0') then
      raise EValidacao.createVal('É necessário informar a quantidade de cotas!',edQtdCota);

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

procedure TfrmCadPrimCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadPrimCota.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCotaCotacao.GravaCotaCotacao;
end;

procedure TfrmCadPrimCota.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

end.
