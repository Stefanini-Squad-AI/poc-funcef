// 16/01/2006 - pendencia 18097 - Criada a opção de filtrar as atividades do usuário SUPER.
unit FConsultaLogAltExcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Mask, wwdbedit, Wwdotdot, Wwdbcomb, StdCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CMProcuraSubTipo, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  Menus, uCtrlLogTabelas, uCtrlUsuarioSistema, ComCtrls, ppDB, ppDBPipe,
  ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, uCmSqlParams, TXRB;

type
  TFrmConsultaLogAltExc = class(TfrmOkCancelar)
    Panel1: TPanel;
    dcmUsuario: TCMProcuraSubTipo;
    RgTabela: TRadioGroup;
    dbgInfoLog: TwwDBGrid;
    Panel2: TPanel;
    GbTabela: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtValAnterior: TEdit;
    EdtValAtual: TEdit;
    cmbCampos: TwwDBComboBox;
    EdtTabelas: TEdit;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    GbData: TGroupBox;
    dtpdatafim: TCMDateTimePicker;
    Label2: TLabel;
    dtpdatainicio: TCMDateTimePicker;
    Label1: TLabel;
    CdsUsuario: TCMClientDataSet;
    PpmLog: TPopupMenu;
    MenDetExclusao: TMenuItem;
    MnuUsuario: TMenuItem;
    CdsAux: TCMClientDataSet;
    RgOperacao: TRadioGroup;
    Toolbar971: TToolbar97;
    BtnImprimir: TBitBtn;
    rpLogTabelas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
    LblTitulo: TppLabel;
    LblDataIni: TppLabel;
    ppLabel4: TppLabel;
    LblConsulta: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    pplLogTabelas: TppBDEPipeline;
    LblDataFim: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    LblUsuario: TppLabel;
    ppLabel6: TppLabel;
    LblTabela: TppLabel;
    ppLabel7: TppLabel;
    LblColuna: TppLabel;
    ppLabel8: TppLabel;
    LblValorAnterior: TppLabel;
    ppLabel10: TppLabel;
    LblValorAtual: TppLabel;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    LblOperacao: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine4: TppLine;
    CrmRptCM: TCmRptManager;
    DevRptCM: TExtraOptions;
    ChkFiltraSuper: TCheckBox;
    CdsDATAHORA: TDateTimeField;
    CdsCHAVEPRIMARIA: TStringField;
    CdsARQUIVO: TStringField;
    CdsUSUARIO2: TStringField;
    CdsOPERACAO: TStringField;
    CdsNOMECAMPO: TStringField;
    CdsVALORATUAL: TStringField;
    CdsVALORANTERIOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PpmLogPopup(Sender: TObject);
    procedure cmbCamposEnter(Sender: TObject);
    procedure MenDetExclusaoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SqlParamsFormatParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure BtnImprimirClick(Sender: TObject);
    procedure ChkFiltraSuperClick(Sender: TObject);
  private
    { Private declarations }
    iOldIdPessoa: Integer;
  public
    { Public declarations }
    LogTabelas: TCtrlLogTabelas;
    Usuario: TCtrlUsuarioSistema;
    tabela, arquiv, chave1: String;
  end;

var
  FrmConsultaLogAltExc: TFrmConsultaLogAltExc;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil, FMostraLogExcMT, ftelaaut;

procedure TFrmConsultaLogAltExc.FormCreate(Sender: TObject);
begin
  inherited;
  Usuario := TCtrlUsuarioSistema.Create;
  Usuario.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  LogTabelas := TCtrlLogTabelas.Create;
  LogTabelas.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  LogTabelas.cds := cds;
  Cds.Data := LogTabelas.ListaLogTabelas( -1 );
  iOldIdPessoa := 0;
end;

procedure TFrmConsultaLogAltExc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Usuario.Free;
  LogTabelas.Free;
end;

procedure TFrmConsultaLogAltExc.PpmLogPopup(Sender: TObject);
begin
  inherited;
  MenDetExclusao.Enabled := ( Not Cds.IsEmpty ) And ( Cds.FieldByName( 'Operacao'{ivlm} ).AsString = 'D'{ivlm} );

  If ( Not Cds.IsEmpty ) And ( Not Cds.FieldByName( 'USUARIO'{ivlm} ).IsNull ) Then Begin
     If iOldIdPessoa <> StrToIntDef( Copy( Cds.FieldByName( 'USUARIO'{ivlm} ).AsString, 3, Length( Cds.FieldByName( 'USUARIO'{ivlm} ).AsString ) ), 0 ) Then Begin
        iOldIdPessoa := StrToIntDef( Copy( Cds.FieldByName( 'USUARIO'{ivlm} ).AsString, 3, Length( Cds.FieldByName( 'USUARIO'{ivlm} ).AsString ) ), 0 );
        CdsUsuario.Data := Usuario.ListaUsuarioSistema( iOldIdPessoa );

        If CdsUsuario.IsEmpty Then
           MnuUsuario.Caption := Translate('Usuário: ')
        Else
           MnuUsuario.Caption := Translate('Usuário: ') + CdsUsuario.FieldByName( 'NOMEUSUARIO'{ivlm} ).AsString;
     End;
  End Else
     MnuUsuario.Caption := Translate('Usuário: ');
end;

procedure TFrmConsultaLogAltExc.cmbCamposEnter(Sender: TObject);
begin
  inherited;
  If Trim( EdtTabelas.text ) <> '' Then Begin
     CdsAux.Data := LogTabelas.ListaCamposTabela( EdtTabelas.text );
     CdsAux.GetFieldNames( cmbCampos.Items );
  End Else
    cmbCampos.Items.Clear;
end;

procedure TFrmConsultaLogAltExc.MenDetExclusaoClick(Sender: TObject);
begin
  inherited;
  Case RgTabela.ItemIndex Of
       0: tabela := 'LOGTABELAS'{ivlm};
       1: tabela := 'LOGTABELASINDX'{ivlm};
       2: tabela := 'RETLOGTABELAS'{ivlm};
  End;

  arquiv := Cds.FieldByName( 'ARQUIVO'{ivlm} ).AsString;
  chave1 := Cds.FieldByName( 'CHAVEPRIMARIA'{ivlm} ).AsString;
  AbrirFormModal( FrmMostraLogExcMT, TFrmMostraLogExcMT );
end;

procedure TFrmConsultaLogAltExc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dcmusuario.Text      := '';
  dtpdatainicio.Text   := '';
  dtpdatafim.Text      := '';
  EdtTabelas.Text      := '';
  edtvalatual.Text     := '';
  edtvalanterior.Text  := '';
  cmbCampos.Text       := '';
  RgOperacao.ItemIndex := 0;
  BtnImprimir.Enabled  := False;
  Cds.EmptyDataSet;
end;

procedure TFrmConsultaLogAltExc.bbtnConfirmarClick(Sender: TObject);
var
  operacao, sIdUsuario: String;
begin
  inherited;
  {Checa campos selecionados  }

  If ( dtpdatainicio.Text <> '' ) And ( dtpdatafim.Text <> '' ) And
         ( StrToDate( dtpdatafim.Text ) < StrToDate( dtpdatainicio.Text ) ) then begin
     MsgDlg( 'Data final menor que inicial!', 'Informação', mtInformation, [mbOk, mbHelp], 0 );
     dtpdatainicio.SetFocus;
     exit;
  End;

  { Seleciona os campos alterados e excluídos do Sistema, fornecidos pela Tabela LOGTABELAS }
  { Critérios: Data, Usuário e Tabela }
  Case RgOperacao.ItemIndex Of
       0: Operacao := 'T'{ivlm};
       1: Operacao := 'I'{ivlm};
       2: Operacao := 'U'{ivlm};
       3: Operacao := 'D'{ivlm};
  End;

  Cds.DisableControls;
  //início - 16/01/2006 - pendencia 18097
  sIdUsuario := '';
  if (trim(dcmusuario.text) <> '') then
    sIdUsuario := intToStr(dcmusuario.SubTipoReg.Id)
  else if (ChkFiltraSuper.checked) then
    sIdUsuario := '0';
  //fim - 16/01/2006 - pendencia 18097

  Cds.Data := LogTabelas.ListaAltExcLogTabelas( RgTabela.Items[ RgTabela.ItemIndex ],
                         cmbCampos.text, dtpdatainicio.Text, dtpdatafim.Text,
                         EdtValAnterior.text, EdtValAtual.text, sIdUsuario,
                         EdtTabelas.Text, operacao );
  Cds.EnableControls;
  BtnImprimir.enabled := ( Not Cds.IsEmpty );
end;

procedure TFrmConsultaLogAltExc.SqlParamsFormatParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TFrmConsultaLogAltExc.BtnImprimirClick(Sender: TObject);
begin
  inherited;
  LblDataIni.Caption := dtpdatainicio.Text;
  LblDataFim.Caption := dtpdatafim.Text;
  LblValorAtual.Caption    := edtvalatual.Text;
  LblValorAnterior.Caption := edtvalanterior.Text;
  LblUsuario.Caption := dcmusuario.Text;
  LblTabela.Caption  := EdtTabelas.Text;
  LblColuna.Caption  := cmbCampos.Text;

  Case RgOperacao.ItemIndex Of
       0: LblOperacao.Caption := Translate('Todas');
       1: LblOperacao.Caption := Translate('Inclusão');
       2: LblOperacao.Caption := Translate('Alteração');
       3: LblOperacao.Caption := Translate('Exclusão');
  End;

  Cds.DisableControls;
  CrmRptCM.LabelEmpresa.Caption := Sistema.NomeEmpresa;
  CrmRptCM.LabelSistema.Caption := Sistema.NomeModulo;
  rpLogTabelas.Print;
  Cds.EnableControls;
end;

//início - 16/01/2006 - pendencia 18097
procedure TFrmConsultaLogAltExc.ChkFiltraSuperClick(Sender: TObject);
begin
  inherited;
  if ChkFiltraSuper.Checked then
  begin
    dcmusuario.text := '';
    dcmUsuario.Enabled := false;
  end
  else dcmUsuario.Enabled := true;
end;
//fim - 16/01/2006 - pendencia 18097

end.

