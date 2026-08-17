unit FCadFeriadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, DBCtrls, 
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, Spin, wwdbdatetimepicker, CMDateTimePicker,
  Mask, uCtrlFeriado, uCtrlPais, uCtrlEstado, uCtrlCidade, uCtrlSindicato
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmCadFeriados = class(TFrmCadastroMT)
    Label1: TLabel;
    Label8: TLabel;
    DBrdgAmbito: TDBRadioGroup;
    DBedtFeriado: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    DBedtData: TCMDateTimePicker;
    spnRepeteAnos: TSpinEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBcboPais: TCMDBLookupCombo;
    DBcboEstado: TCMDBLookupCombo;
    DBcboCidade: TCMDBLookupCombo;
    DBrdgTipo: TDBRadioGroup;
    DBcboSindicato: TCMDBLookupCombo;
    CdsSindicato: TCMClientDataSet;
    CdsCidade: TCMClientDataSet;
    CdsEstado: TCMClientDataSet;
    CdsPais: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure DBcboPaisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBrdgAmbitoClick(Sender: TObject);
    procedure DBrdgTipoClick(Sender: TObject);
    procedure DBcboCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Feriado: TCtrlFeriado;
    Pais: TCtrlPais;
    Estado: TCtrlEstado;
    Cidade: TCtrlCidade;
    Sindicato: TCtrlSindicato;
    procedure RepeteFeriado( iAnos: word );
    procedure Seleciona( IDFeriado: Double = 0 );
  end;

var
  FrmCadFeriados: TFrmCadFeriados;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmCadFeriados.RepeteFeriado(iAnos: word);
var
   dData: TDateTime;
   iAno, iMes, iDia, i: word;
   iSindicato, iPais, iCidade, iEstado: Double;
   sFeriado, sTipo, sAmbito, sEstado: String;
begin
   dData := cds.FieldByName( 'DATAFERIADO'{ivlm} ).asDateTime;
   DecodeDate( dData, iAno, iMes, iDia );

   sFeriado   := cds.FieldByName( 'DESCFERIADO'{ivlm} ).asString;
   sTipo      := cds.FieldByName( 'FLGTIPO'{ivlm} ).asString;
   sAmbito    := cds.FieldByName( 'FLGAMBITO'{ivlm} ).asString;
   iSindicato := cds.FieldByName( 'IDSINDICATO'{ivlm} ).asFloat;
   iPais      := cds.FieldByName( 'IDPAIS'{ivlm} ).asFloat;
   iEstado    := cds.FieldByName( 'IDESTADO'{ivlm} ).asFloat;
   iCidade    := cds.FieldByName( 'IDCIDADES'{ivlm} ).asFloat;
   sEstado    := cds.FieldByName( 'CODESTADO'{ivlm} ).asString;

   For i := iAnos Downto 0 Do Begin
       cds.FieldByName( 'DESCFERIADO'{ivlm} ).asString   := sFeriado;
       cds.FieldByName( 'FLGTIPO'{ivlm} ).asString       := sTipo;
       cds.FieldByName( 'FLGAMBITO'{ivlm} ).asString     := sAmbito;
       cds.FieldByName( 'DATAFERIADO'{ivlm} ).asDateTime := EncodeDate( iAno + i, iMes, iDia );

       If iSindicato <> 0 Then
          cds.FieldByName( 'IDSINDICATO'{ivlm} ).asFloat := iSindicato;

       cds.FieldByName( 'IDPAIS'{ivlm} ).asFloat := iPais;

       If iEstado <> 0 Then
          cds.FieldByName( 'IDESTADO'{ivlm} ).asFloat := iEstado;

       If sEstado <> '' Then
          cds.FieldByName( 'CODESTADO'{ivlm} ).asString := sEstado;

       If iCidade <> 0 Then
          cds.FieldByName( 'IDCIDADES'{ivlm} ).asFloat := iCidade;

       If i <> 0 Then Begin
          // define logo o id do registro que se está inserindo, para poder gravar nos detalhes
          cds.Post;
          cds.Append;
       End;
   End;
end;

procedure TFrmCadFeriados.Seleciona( IdFeriado: Double );
begin
  cds.Data := Feriado.ListaFeriadoFeriado( IdFeriado );
end;

procedure TFrmCadFeriados.FormCreate(Sender: TObject);
begin
  inherited;
  Pais := TCtrlPais.Create;
  Pais.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Estado := TCtrlEstado.Create;
  Estado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Cidade := TCtrlCidade.Create;
  Cidade.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Sindicato := TCtrlSindicato.Create;
  Sindicato.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Feriado := TCtrlFeriado.Create;
  Feriado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Feriado.cds := cds;

  CdsPais.Data := Pais.ListaPais;
  CdsEstado.Data := Estado.ListaEstado;
  CdsCidade.Data := Cidade.ListaCidade;
  CdsSindicato.Data := Sindicato.ListaSindicato;
  Seleciona( -1 );
end;

procedure TFrmCadFeriados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Feriado.Free;
  Sindicato.Free;
  Cidade.Free;
  Estado.Free;
  Pais.Free;
end;

procedure TFrmCadFeriados.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TFrmCadFeriados.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If spnRepeteAnos.Value > 0 then
     RepeteFeriado( spnRepeteAnos.Value );

  Accept := Feriado.Gravar;
end;

procedure TFrmCadFeriados.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Feriado.Gravar;
end;

procedure TFrmCadFeriados.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Feriado.Gravar;
end;

procedure TFrmCadFeriados.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Estado.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadFeriados.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DBcboSindicato.Enabled := ( DBrdgTipo.ItemIndex = 1 );
  DBcboPais.Enabled   := ( DBrdgAmbito.ItemIndex = 0 );
  DBcboEstado.Enabled := ( DBrdgAmbito.ItemIndex = 1 );
  DBcboCidade.Enabled := ( DBrdgAmbito.ItemIndex = 2 );
  dbedtFeriado.SetFocus;
end;

procedure TFrmCadFeriados.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName( 'CODESTADO'{ivlm} ).AsString := '';
  dbedtFeriado.SetFocus;
end;

procedure TFrmCadFeriados.DBcboPaisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cds.FieldByName( 'IDESTADO'{ivlm} ).Clear;
  cds.FieldByName( 'CODESTADO'{ivlm} ).AsString := '';
  cds.FieldByName( 'IDCIDADES'{ivlm} ).Clear;
end;

procedure TFrmCadFeriados.DBcboEstadoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cds.FieldByName( 'IDPAIS'{ivlm} ).AsFloat     := cdsEstado.FieldByName( 'IDPAIS'{ivlm} ).AsFloat;
  cds.FieldByName( 'CODESTADO'{ivlm} ).AsString := cdsEstado.FieldByName( 'CODESTADO'{ivlm} ).AsString;
  cds.FieldByName( 'IDCIDADES'{ivlm} ).Clear;
end;

procedure TFrmCadFeriados.DBrdgAmbitoClick(Sender: TObject);
begin
  inherited;
  DBcboPais.Enabled   := ( DBrdgAmbito.ItemIndex = 0 );
  DBcboEstado.Enabled := ( DBrdgAmbito.ItemIndex = 1 );
  DBcboCidade.Enabled := ( DBrdgAmbito.ItemIndex = 2 );

  If DBrdgAmbito.ItemIndex < 2 Then Begin
     cds.FieldByName('IDCIDADES'{ivlm}).Clear;

     If DBrdgAmbito.ItemIndex < 1 Then Begin
        cds.FieldByName('IDESTADO'{ivlm}).Clear;
        cds.FieldByName('CODESTADO'{ivlm}).AsString := '';
     End;
  End;
end;

procedure TFrmCadFeriados.DBrdgTipoClick(Sender: TObject);
begin
  inherited;
  DBcboSindicato.Enabled := ( DBrdgTipo.ItemIndex = 1 );
end;

procedure TFrmCadFeriados.DBcboCidadeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cds.FieldByName( 'IDPAIS'{ivlm} ).AsFloat     := cdsCidade.FieldByName( 'IDPAIS'{ivlm} ).AsFloat;
  cds.FieldByName( 'IDESTADO'{ivlm} ).AsFloat   := cdsCidade.FieldByName( 'IDESTADO'{ivlm} ).AsFloat;
  cds.FieldByName( 'CODESTADO'{ivlm} ).AsString := cdsEstado.FieldByName( 'CODESTADO'{ivlm} ).AsString;
end;

procedure TFrmCadFeriados.bbtnConfirmarClick(Sender: TObject);
begin
  If cds.FieldByName( 'DESCFERIADO'{ivlm} ).IsNull Then Begin
     MsgDlg( 'É necessário preencher o nome do Feriado!', 'Aviso', mtWarning, [mbOk], 0 );
     DBedtFeriado.SetFocus;
     Exit;
  End;

  If cds.FieldByName( 'FLGTIPO'{ivlm} ).IsNull Then Begin
     MsgDlg( 'É necessário selecionar o Tipo do Feriado!', 'Aviso', mtWarning, [mbOk], 0 );
     DBrdgTipo.SetFocus;
     Exit;
  End;

  If cds.FieldByName( 'FLGAMBITO'{ivlm} ).IsNull Then Begin
     MsgDlg( 'É necessário selecionar o Âmbito do Feriado!', 'Aviso', mtWarning, [mbOk], 0 );
     DBrdgAmbito.SetFocus;
     Exit;
  End;

  If cds.FieldByName( 'DATAFERIADO'{ivlm} ).IsNull Then Begin
     MsgDlg( 'É necessário preencher a Data do Feriado!', 'Aviso', mtWarning, [mbOk], 0 );
     DBedtData.SetFocus;
     Exit;
  End;

  If cds.FieldByName( 'FLGTIPO'{ivlm} ).AsString = 'C'{ivlm} Then Begin
     If cds.FieldByName( 'IDSINDICATO'{ivlm} ).IsNull Then Begin
        MsgDlg( 'É necessário selecionar o Sindicato de Classe!', 'Aviso', mtWarning, [mbOk], 0 );
        DBcboSindicato.SetFocus;
        Exit;
     End;
  End;

  If ( DBcboPais.LookupValue = '' ) Or ( cds.FieldByName( 'IDPAIS'{ivlm} ).IsNull ) Then Begin
     MsgDlg( 'É necessário selecionar o País!', 'Aviso', mtWarning, [mbOk], 0 );
     DBcboPais.SetFocus;
     Exit;
  End;

  If ( cds.FieldByName( 'FLGAMBITO'{ivlm} ).AsString = 'E'{ivlm} ) Or ( cds.FieldByName( 'FLGAMBITO'{ivlm} ).AsString = 'M'{ivlm} ) Then Begin
     If ( DBcboEstado.LookupValue = '' ) Or ( cds.FieldByName( 'IDESTADO'{ivlm} ).IsNull ) Then Begin
        MsgDlg( 'É necessário selecionar o Estado!', 'Aviso', mtWarning, [mbOk], 0 );
        DBcboEstado.SetFocus;
        Exit;
     End;
  End;

  If cds.FieldByName( 'FLGAMBITO'{ivlm} ).AsString = 'M'{ivlm} Then Begin
     If ( DBcboCidade.LookupValue = '' ) Or ( cds.FieldByName( 'IDCIDADES'{ivlm} ).IsNull ) Then Begin
        MsgDlg( 'É necessário selecionar a Cidade!', 'Aviso', mtWarning, [mbOk], 0 );
        DBcboCidade.SetFocus;
        Exit;
     End;
  End;

  Inherited;

  If CmeCadastro.Operacao In [opInserir, opAlterar] Then Begin
     If DBcboSindicato.LookupValue = '' Then
        cds.FieldByName( Translate('IDSINDICATO') ).Clear;

     If DBcboEstado.LookupValue = '' Then Begin
        cds.FieldByName( Translate('IDESTADO') ).Clear;
        cds.FieldByName( Translate('CODESTADO') ).AsString := '';
     End;

     If DBcboCidade.LookupValue = '' Then
        cds.FieldByName( Translate('IDCIDADES') ).Clear;
  End;
end;

end.
