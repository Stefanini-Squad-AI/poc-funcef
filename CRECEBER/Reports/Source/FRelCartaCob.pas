Unit FRelCartaCob;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlParamIntegra, wwdblook, Db,
  DBTables, TREdit, Wwdatsrc, ppCache, ppDB, ppDBBDE, ppComm, ppProd, ppClass,
  ppReport, ppBands, uMensErro, ComCtrls, wwriched, DBCtrls, MontaSelect,
  IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker,
  DBClient, uCMClientDataSet, uCmSqlParams,
  fParamReports_Padrao, CmParamReport;

Type
  TFrmRelCartaCob = Class(TfrmParamReports_Padrao)
    GpModelo: TGroupBox;
    DbLcModelo: TwwDBLookupCombo;
    RbEndereco: TRadioGroup;
    GpDataEmiss: TGroupBox;
    DteDataLancto: TCMDateTimePicker;
    GpNumDoc: TGroupBox;
    Label5: TLabel;
    EdFaixaIni: TEdit;
    EdFaixaFim: TEdit;
    GpDias: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    EdDiaAtraso: TEdit;
    EdLimiteAtraso: TEdit;
    GpJuros: TGroupBox;
    CkbImpValorJuros: TCheckBox;
    ReTaxaJuros: TRealEdit;
    MemReports: TMemo;
    GpTipoCobr: TGroupBox;
    CmbCobranca: TwwDBLookupCombo;
    Label2: TLabel;
    SqlModelo: TCMSqlParams;
    CdsModelo: TCMClientDataSet;
    CdsFormaPag: TCMClientDataSet;
    SqlFormaPag: TCMSqlParams;
    CdsTel: TCMClientDataSet;
    SqlTel: TCMSqlParams;
    CPForCli: TCMProcuraForCli;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure DbLcModeloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
  public
    { Public declarations }
  End;

Var
  FrmRelCartaCob: TFrmRelCartaCob;

Implementation

Uses uSistema, uModulo, uFuncaoGeral, uString, uModeloRelatCM, uDataBase;

{$R *.DFM}

Procedure TFrmRelCartaCob.FormCreate(Sender: TObject);
Begin
  Inherited;
  SqlModelo.Open;
  SqlFormaPag.SQL.Text := ' SELECT CODPORTFORMA, DESCRICAO ' +
    ' FROM PORTADORFORMA ' +
    ' WHERE (RECPAG = ''' + ParamIntegra.RecPag + ''')' +
    ' AND (IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ')' +
    ' ORDER BY DESCRICAO';
  SqlFormaPag.Open;
End;

Procedure TFrmRelCartaCob.bbtnConfirmarClick(Sender: TObject);
var idforcli : String;
Begin
  Inherited;
  If Trim(DbLcModelo.Text) = '' Then
  Begin
    Msgdlg('O Modelo da Carta de Cobrança não foi selecionado', 'Atenção', MtWarning, [MbOk], 0);
    DbLcModelo.SetFocus;
    Exit;
  End;
  if CPForCli.ForCliReg.Id = 0 then
     idforcli := ''
  else
     idforcli := IntToStr(CPForCli.ForCliReg.Id);


  Cmp_Padrao.ParamValues[0].AsString := DbLcModelo.Text; //Modelo da Carta de Cobrança '
  Cmp_Padrao.ParamValues[1].AsString := CmbCobranca.LookupValue; //Contas Caixas X  Tipo de Cobrança'
  Cmp_Padrao.ParamValues[2].AsString := idforcli; //Cliente'
  Cmp_Padrao.ParamValues[3].AsString := EdDiaAtraso.Text; //Dias de Atraso Inicial'
  Cmp_Padrao.ParamValues[4].AsString := EdLimiteAtraso.Text; //Dias de Atraso Máximo'
  Cmp_Padrao.ParamValues[5].AsString := DteDataLancto.Text; //Data de Emissão'
  Cmp_Padrao.ParamValues[6].AsString := EdFaixaIni.Text; //Número do Documento Inicial'
  Cmp_Padrao.ParamValues[7].AsString := EdFaixaFim.Text; //Número do Documento Final'
  Cmp_Padrao.ParamValues[8].AsInteger := RbEndereco.ItemIndex; //Endereço'
  Cmp_Padrao.ParamValues[9].AsBoolean := CkbImpValorJuros.Checked; //Imprime Valor de Juros Calculados Com a taxa de'
  Cmp_Padrao.ParamValues[10].AsFloat := ReTaxaJuros.Value; //Juros % ao Dia'
  Cmp_Padrao.ParamValues[11].AsInteger := CdsModelo.FieldByName('IDREPORTS').AsInteger;
  Cmp_Padrao.ParamValues[12].AsInteger := CdsModelo.FieldByName('ORIGEMCM').AsInteger;

End;

Procedure TFrmRelCartaCob.DbLcModeloCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If Modified Then
    DbLcModelo.LookupValue := DbLcModelo.LookupValue;
End;

End.

