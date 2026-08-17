unit FMTAnalEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlAnalEstoque,Mask, wwdbedit, CMDBLookupCombo, DBCtrls,
  Wwdbspin ,uCMTypes, CMProcuraSubTipo, wwdbdatetimepicker,
  CMDateTimePicker, CMProcuraMask, uCmSqlParams, ComCtrls, DBTables,
  Wwquery;

type
  TfrmMTAnalEstoque = class(TFrmCadastroMT)
    ToolbarSep972: TToolbarSep97;
    Label5: TLabel;
    dbedDataAnal: TCMDateTimePicker;
    grpTempo: TGroupBox;
    Label4: TLabel;
    dbedtempMedDF: TCMDateTimePicker;
    dbedtempMedDI: TCMDateTimePicker;
    rgTRM: TRadioGroup;
    grpConsumo: TGroupBox;
    Label2: TLabel;
    dbedConsMedDi: TCMDateTimePicker;
    dbedConsMedDF: TCMDateTimePicker;
    rgConsMed: TRadioGroup;
    RgPonto: TRadioGroup;
    GroupBox1: TGroupBox;
    lblPerc: TLabel;
    dbedPercMin: TDBRealEdit;
    rgPercMin: TRadioGroup;
    msGrupoProd: TMontaSelect;
    sqlGrupoProd: TCMSqlParams;
    cdsGrupoProd: TCMClientDataSet;
    cmpmGrupoProd: TCMProcuraMask;
    prgBarGera: TProgressBar;
    CdsDet: TCMClientDataSet;
    dsDet: TwwDataSource;
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
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    AnalEstoque : TCtrlAnalEstoque;
    Procedure Progresso(vParams : Array of Variant);
    Procedure SelecionaPai(iIdAnalEstoque : Double);
    Procedure SelecionaFilho(iIdAnalEstoque : Double);
  public
    { Public declarations }
  end;

var
  frmMTAnalEstoque: TfrmMTAnalEstoque;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados,FMTAnalSug, FTelaAut;

{$R *.DFM}

procedure TfrmMTAnalEstoque.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If rgPercMin.ItemIndex = 1 Then
     Begin
         If dbedPercMin.Value = 0 Then
            Begin
               MsgDlg('Percentual não foi digitado','Erro',mtError,[mbOk],0);
               dbedPercMin.SetFocus;
               Exit;
            End;
     End;
end;

procedure TfrmMTAnalEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  //
  AnalEstoque := TCtrlAnalEstoque.Create;
  AnalEstoque.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  AnalEstoque.Progresso := Progresso;
  AnalEstoque.CdsAnalEstoque := cds;
  AnalEstoque.CdsItensAnalEstoque := cdsDet;
  //
  cmpmGrupoProd.Mascara  := trim(Modulo.sMascaraGrupoProd);
  //
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.IDPESSOA = '+ IntToStr(Sistema.idEmpresa) );
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) );
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.FLGACEITA = ''N'' ');
  //
  SelecionaPai(-1);
  SelecionaFilho(-1);
  //
end;

procedure TfrmMTAnalEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AnalEstoque.Free;
end;

procedure TfrmMTAnalEstoque.CmeCadastroInsert(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  prgBarGera.Position := 0;
  SelecionaFilho(-1);
   With cds Do
     Begin
        FieldByName('DATAINICONSMED').AsDateTime :=  Date;
        FieldByName('DATAFIMCONSMED').AsDateTime :=  Date;
        FieldByName('DATAINITRMED').AsDateTime   :=  Date;
        FieldByName('DATAFIMTRMED').AsDateTime   :=  Date;
        FieldByName('DATAANALISE').AsDateTime    :=  Date;
        FieldByName('IDPESSOA').AsFloat          := Sistema.idEmpresa;
        FieldByName('CODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
        FieldByName('FLGACEITA').asString        := 'N';
        dbedtempMedDI.Date := Date;
        dbedtempMedDF.Date := Date;
        dbedConsMedDi.Date := Date;
        dbedConsMedDF.Date := Date;
        dbedDataAnal.Date  := Date;
     End;
   dbedDataAnal.SetFocus;
end;

procedure TfrmMTAnalEstoque.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.SetFocus;
end;

procedure TfrmMTAnalEstoque.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     SelecionaPai(StrToFloat(MontaSelect.ValoresChave[0]));
     SelecionaFilho(StrToFloat(MontaSelect.ValoresChave[0]));
  end;

end;

procedure TfrmMTAnalEstoque.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AnalEstoque.AplicaOperacaoAnalEstoque(AnalEstoque.ProgressFileName,opApagar,(rgTRM.ItemIndex = 0),(rgConsMed.ItemIndex = 0),(rgPercMin.ItemIndex = 1),(RgPonto.ItemIndex = 1));
end;

procedure TfrmMTAnalEstoque.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := AnalEstoque.AplicaOperacaoAnalEstoque(AnalEstoque.ProgressFileName,opAlterar,(rgTRM.ItemIndex = 0),(rgConsMed.ItemIndex = 0),(rgPercMin.ItemIndex = 1),(RgPonto.ItemIndex = 1));

end;

procedure TfrmMTAnalEstoque.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AnalEstoque.AplicaOperacaoAnalEstoque(AnalEstoque.ProgressFileName,opInserir,(rgTRM.ItemIndex = 0),(rgConsMed.ItemIndex = 0),(rgPercMin.ItemIndex = 1),(RgPonto.ItemIndex = 1));
end;

procedure TfrmMTAnalEstoque.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if AnalEstoque.MessageInfo <> '' then
     MsgDlg(AnalEstoque.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmMTAnalEstoque.CmeCadastroAfterConfirma(Sender: TObject);
begin
  AbrirFormModal(FrmMTAnalSug,TFrmMTAnalSug);

  SelecionaPai(AnalEstoque.iAnaliseEstoque);
  SelecionaFilho(AnalEstoque.iAnaliseEstoque);
 //inherited;
end;


procedure TfrmMTAnalEstoque.Progresso(vParams: array of Variant);
begin
   Try
     prgBarGera.Max      := vParams[1];
     prgBarGera.Position := vParams[2];
   finally
     Repaint;
   End;
end;

procedure TfrmMTAnalEstoque.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if cmeCadastro.Operacao = opAlterar then
     pnlFundo.Enabled := False;
end;

procedure TfrmMTAnalEstoque.SelecionaFilho(iIdAnalEstoque : Double);
begin
  cdsDet.Data  := AnalEstoque.ProcurarDetAnalEstoque(iIdAnalEstoque);

  TFloatField(cdsDet.FieldByName('TRMEDCALCULADO')).DisplayFormat    := '#,##0.00';
  TFloatField(cdsDet.FieldByName('TRMEDINFORMADO')).DisplayFormat    := '#,##0.00';
  TFloatField(cdsDet.FieldByName('CONSMEDCALCULADO')).DisplayFormat  := '#,##0.00';
  TFloatField(cdsDet.FieldByName('CONSMEDINFORMADO')).DisplayFormat  := '#,##0.00';
  TFloatField(cdsDet.FieldByName('PONTOREPCALCULADO')).DisplayFormat := '#,##0.00';
  TFloatField(cdsDet.FieldByName('PONTOREPINFORMADO')).DisplayFormat := '#,##0.00';
  TFloatField(cdsDet.FieldByName('QTDEMINCALCULADA')).DisplayFormat  := '#,##0.00';
  TFloatField(cdsDet.FieldByName('QTDEMININFORMADA')).DisplayFormat  := '#,##0.00';
  TFloatField(cdsDet.FieldByName('QTDESUGAUTO')).DisplayFormat       := '#,##0.00';
  TFloatField(cdsDet.FieldByName('QTDESUGCALCULADA')).DisplayFormat  := '#,##0.00';
  TFloatField(cdsDet.FieldByName('QTDECOMPRAR')).DisplayFormat       := '#,##0.00';
  TFloatField(cdsDet.FieldByName('SALDOESTOQUE')).DisplayFormat      := '#,##0.00';
end;

procedure TfrmMTAnalEstoque.SelecionaPai(iIdAnalEstoque : Double);
begin
  cds.Data := AnalEstoque.ProcurarAnalEstoque(iIdAnalEstoque);
end;

end.
