{-------------------------------------------------------------------------------
Desenvolvedor: Alex Pereira
Data         : 24/10/2007
Pendência    : 26705
Descrição    : Ao se clicar no botão para se procurar documentos em aberto, a
               query que monta docs vazios estava demorando muito para abrir.
               Apesar de existir uma cláusula 1=2, foram criados os joins para
               otimizar a mesma.
               Query: SqlDocVazio
{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 24/08/2007
Pendência    : 23738
Descrição    : Criado uma opção para trazer apenas documentos aprovados pelo
               RAD(Ultima Etapa)
{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 12/04/2007
Pendência    : 24823
Descrição    : Passei o FlgAtivo para a SqlUmPortadorForma
{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 31/01/2007
Pendência    : 24363
Descrição    : Removido o owner CM. 
{-------------------------------------------------------------------------------
Rotina    : FormCreate
Data      : 17/01/2007
Pendencia : 24132
Autor     : Marcus Oliveira
Descrição : Alterar o Caption do CPForCli de acordo com RecPag.
{-------------------------------------------------------------------------------
Rotinas   : Diversas
Data      : 28/11/2006
Autor     : Rodolpho da Silva
Descrição : Corrigir filtros da tela, que não estavam funcionando
{-------------------------------------------------------------------------------
Rotinas   : bbtnSelecionaDocClick
Data      : 06/11/2006
Autor     : andré tavares
Pendência : 23658
Descrição : adaptação para filtar os documento de conta corrente do mesmo banco do portador forma,
bem como a exibição dos dados das contas corrente dos mesmos.
-------------------------------------------------------------------------------}
unit FParamGeraLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, CMProcuraSubTipo, IvDictio, IvMulti,uMensErro,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdbdatetimepicker, uCtrlImportaLancamento,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,uModulo,
  Db, CmParamReport, Wwdatsrc, MontaSelect, DBClient, uCMClientDataSet ,
  uCmSqlParams, ComCtrls, uSistema,  DBCtrls, uCMTypes, uFuncaoGeral, JclMath,
  DBGrids, uctrlpadroes, uctrlParamIntegra;

type
  TEventoGetParam = Procedure of object;

  TFrmParamGeraLote = class(TfrmOkCancelar)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    CPForCli: TCMProcuraForCli;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdDoc: TEdit;
    CmbSistema: TCMDBLookupCombo;
    CmbTipo: TCMDBLookupCombo;
    CmbFormas: TCMDBLookupCombo;
    Cmbcontas: TCMDBLookupCombo;
    DtIni: TCMDateTimePicker;
    DtFim: TCMDateTimePicker;
    SqlUmPortadorForma: TCMSqlParams;
    CdsUmPortadorForma: TCMClientDataSet;
    SqlTipoDocRecPag: TCMSqlParams;
    CdsTipoDocRecPag: TCMClientDataSet;
    SqlFormaRecPag: TCMSqlParams;
    CdsFormaRecPag: TCMClientDataSet;
    SqlModulo: TCMSqlParams;
    CdsModulo: TCMClientDataSet;
    MsDoc: TMontaSelect;
    SqlSelecionados: TCMSqlParams;
    CdsSelecionados: TCMClientDataSet;
    DsSelecionados: TwwDataSource;
    SqlDocVazio: TCMSqlParams;
    DsPendentes: TwwDataSource;
    cdsaux: TCMClientDataSet;
    sqlaux: TCMSqlParams;
    SqlPortadorForma: TCMSqlParams;
    CdsPlanoPrev: TCMClientDataSet;
    dsPlanoPrev: TDataSource;
    sqlplanoprev: TCMSqlParams;
    grpPlanoPrev: TGroupBox;
    dbgrPlanoPrev: TwwDBGrid;
    Label9: TLabel;
    EdCompl: TEdit;
    CmpDadosParaBaixa: TCmParamReport;
    CdsLoteXDocumento: TCMClientDataSet;
    CdsLoteXDocumentoNOME: TStringField;
    CdsLoteXDocumentoDATAPROGRAMADA: TDateTimeField;
    CdsLoteXDocumentoDATAVENCTO: TDateTimeField;
    CdsLoteXDocumentoNODOCUMENTO: TFloatField;
    CdsLoteXDocumentoCOMPLDOCUMENTO: TStringField;
    CdsLoteXDocumentoVALOR: TFloatField;
    CdsLoteXDocumentoDOCUMENTO: TStringField;
    CdsLoteXDocumentoCODDOCUMENTO: TFloatField;
    CdsLoteXDocumentoNUMLOTE: TFloatField;
    CdsLoteXDocumentoCODBARRA: TStringField;
    CdsLoteXDocumentoCODBARRAVALOR: TStringField;
    CdsLoteXDocumentoOPERACAO: TStringField;
    CdsLoteXDocumentoIDFORCLI: TFloatField;
    CdsLoteXDocumentoIDPESSOA: TFloatField;
    CdsLoteXDocumentoVLRLIQUIDO: TFloatField;
    CdsLoteXDocumentoIDPROCESSO: TFloatField;
    CMClientDataSet1: TCMClientDataSet;
    DateTimeField1: TDateTimeField;
    CdsDocPendentesDOCUMENTO: TStringField;
    DateTimeField2: TDateTimeField;
    CdsDocPendentesSALDO: TFloatField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    CdsDocPendentesNUMLEITCODBARRAS: TStringField;
    CdsDocPendentesNUMDIGCODBARRAS: TStringField;
    FloatField5: TFloatField;
    CdsDocPendentesRAZAOSOCIAL: TStringField;
    CdsDocPendentesFORNECEDOR: TStringField;
    StringField5: TStringField;
    CdsDocPendentesTIPO: TStringField;
    CdsSaldoLoteNaoEmitido: TCMClientDataSet;
    CdsSaldoLoteNaoEmitidoVALORLOTE: TFloatField;
    Cdsseladiantpendent: TCMClientDataSet;
    CMClientDataSet2: TCMClientDataSet;
    CMClientDataSet3: TCMClientDataSet;
    CdsTipoDocRecPagDESCRICAO: TStringField;
    CdsTipoDocRecPagCODTIPDOC: TFloatField;
    CdsDescPortadorForma: TCMClientDataSet;
    CdsDescPortadorFormaDESCRICAO: TStringField;
    CdsDescPortadorFormaCODPORTFORMA: TFloatField;
    CdsDescPortadorFormaIDTEMPLCHEQUE: TFloatField;
    CdsDescPortadorFormaRAZAOSOCIAL: TStringField;
    CdsDescPortadorFormaCODFORMA: TFloatField;
    CdsDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField;
    CdsDescPortadorFormaFLGOBRIGAFAV: TStringField;
    cdsPortForma: TCMClientDataSet;
    CdsModulos: TCMClientDataSet;
    CdsModulosNOMEMODULO: TStringField;
    CdsModulosIDMODULO: TFloatField;
    CdsRateio: TCMClientDataSet;
    CdsNumlancto: TCMClientDataSet;
    CdsNumlanctoNUMLANCTO: TFloatField;
    CdsNumlanctoDEBCRE: TStringField;
    CdsFormadePagto: TCMClientDataSet;
    CdsFormaPagDESCRICAO: TStringField;
    CdsFormaPagCODFORMA: TFloatField;
    CdsFormaPagRECPAG: TStringField;
    dsDocPendentes: TwwDataSource;
    dsLoteXDocum: TwwDataSource;
    dsLotePagto: TwwDataSource;
    CdsLotePagto: TCMClientDataSet;
    CdsLotePagtoNUMLOTE: TFloatField;
    CdsLotePagtoCODPORTFORMA: TFloatField;
    CdsLotePagtoDATAEMISSAO: TDateTimeField;
    CdsLotePagtoNUMCHQBORDERO: TStringField;
    CdsLotePagtoFAVORECIDO: TStringField;
    CdsLotePagtoFLAGEMISSAO: TStringField;
    CdsLotePagtoFLAGCANCEL: TStringField;
    CdsLotePagtoOBSERVACAO: TStringField;
    CdsLotePagtoIDPESSOA: TFloatField;
    CdsLotePagtoIDUSUARIOINCLUSAO: TFloatField;
    CdsLotePagtoIDPROCESSO: TFloatField;
    CdsLotePagtoDATADIFERIDO: TDateTimeField;
    CdsLotePagtoFLGRADLOTEDOC: TStringField;
    CdsDocPendentes: TCMClientDataSet;
    DateTimeField3: TDateTimeField;
    StringField6: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField7: TStringField;
    FloatField9: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField10: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField11: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    SqldocPendentes: TCMSqlParams;
    GroupBox1: TGroupBox;
    cbListaPortForma: TCheckBox;
    cbListaFormaPagto: TCheckBox;
    cbListaMesmoBanco: TCheckBox;
    cbListaCPMF: TCheckBox;
    Label10: TLabel;
    dtLancto: TCMDateTimePicker;
    rdgTpSelecao: TRadioGroup;
    btSelecionar: TBitBtn;
    btLimpar: TBitBtn;
    chkDocAprovados: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CdsPlanoPrevAfterOpen(DataSet: TDataSet);
    procedure dbGrdPlanoTopRowChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrPlanoPrevCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrPlanoPrevTopRowChanged(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure CPForCliExit(Sender: TObject);
    private
    { Private declarations }
    FUsaPlanoPatro  : Boolean;
    FIntegraContab  : Boolean;
    FPartidaDobrada : Boolean;
    FIdPlanoConta   : Double;
    FIdEspAcesso    : Double;
    FIdModulo       : Double;
    FIdEmpresa      : Double;
    FIdUsuario      : Double;
    FRecPag         : String;
    FValorZero      : Double;
    FIdTipoProcRad  : Double;
    FRADValMinimo   : Double;
    FRadLote        : Double;
    FVlrRetencao    : Double;
    FEmiteLancaBaixa: Boolean;
    FEventoGetParam: TEventoGetParam;
    FbGeraLote: Boolean;

    procedure AbreQueries;
    procedure LimpaSelecao;
    procedure SetEventoGetParam(const Value: TEventoGetParam);
    procedure SetbGeraLote(const Value: Boolean);

  public
    { Public declarations }

    Property EventoGetParam   : TEventoGetParam read FEventoGetParam write SetEventoGetParam; //evento para pegar os parâmetros - andre tavares
    Property IdEmpresa        : Double  Read FIdEmpresa       Write FIdEmpresa;
    Property IdUsuario        : Double  Read FIdUsuario       Write FIdUsuario;
    Property IdModulo         : Double  Read FIdModulo        Write FIdModulo;
    Property UsaPlanoPatro    : Boolean Read FUsaPlanoPatro   Write FUsaPlanoPatro;
    Property IdPlanoConta     : Double  Read FIdPlanoConta    Write FIdPlanoConta;
    Property IdEspAcesso      : Double  Read FIdEspAcesso     Write FIdEspAcesso;
    Property RecPag           : String  Read FRecPag          Write FRecPag;
    Property IntegraContab    : Boolean Read FIntegraContab   Write FIntegraContab;
    Property PartidaDobrada   : Boolean Read FPartidaDobrada  Write FPartidaDobrada;
    Property ValorZero        : Double  Read FValorZero       Write FValorZero;
    Property IdTipoProcRad    : Double  Read FIdTipoProcRad   Write FIdTipoProcRad;
    Property RADValMinimo     : Double  Read FRADValMinimo    Write FRADValMinimo;
    Property RadLote          : Double  Read FRadLote         Write FRadLote;
    Property VlrRetencao      : Double  Read FVlrRetencao     Write FVlrRetencao;
    Property EmiteLancaBaixa  : Boolean Read FEmiteLancaBaixa Write FEmiteLancaBaixa;
    Property bGeraLote        : Boolean read FbGeraLote       write SetbGeraLote;

    // Rodolpho da Silva - 28/11/2006
    procedure ExibirCheckBox(bTelaDeBaixaManual: boolean);

  end;

var
  FrmParamGeraLote: TFrmParamGeraLote;


implementation



{$R *.DFM}

procedure TFrmParamGeraLote.AbreQueries;
begin
   if not(SqlUmPortadorForma.Prepared) then SqlUmPortadorForma.Prepare;
   begin
     SqlUmPortadorForma.ParamByName('IDPESSOA').AsFloat := Sistema.IDEmpresa;
     SqlUmPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlUmPortadorForma.Open;
   end;
   if not(SqlTipoDocRecPag.Prepared) then SqlTipoDocRecPag.Prepare;
   begin
     SqlTipoDocRecPag.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;
     SqlTipoDocRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlTipoDocRecPag.Open;
   end;
   if not(SqlFormaRecPag.Prepared) then SqlFormaRecPag.Prepare;
   begin
     SqlFormaRecPag.ParamByName('IDPESSOA').AsFloat := Sistema.IDEmpresa;
     SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlFormaRecPag.Open;
   end;
   
   SqlModulo.Open;
   cbListaCPMF.Checked := false;

end;




procedure TFrmParamGeraLote.FormShow(Sender: TObject);
begin
  inherited;
  Abrequeries;
end;




procedure TFrmParamGeraLote.FormCreate(Sender: TObject);
Var
  ParamCapCar: TCollectionItem;
begin
  inherited;
  //Marcus Oliveira P. 24132 17/01/2007 inicio
  If ( ParamIntegra.RecPag = 'P' ) then
  begin
     CPForCli.Caption := 'Fornecedor' ;
  //Marcus Oliveira P. 25458 11/07/2007
     CPForCLi.ForCli := fcFornecedor;
  end
  else
  begin
     CPForCli.Caption := 'Cliente' ;
  //Marcus Oliveira P. 24132 17/01/2007 fim

  //Marcus Oliveira P. 25458 11/07/2007
     CPForCLi.ForCli := fcCliente;
  end;

  PageControl.ActivePageIndex := 0;
  
  FbGeraLote := true;
  If ( ParamIntegra.RecPag = 'R' ) Then Begin
    CmpDadosParaBaixa.ParamByName( 'dblkcmbDescricao' ).Caption := 'Contas/Caixas x Forma Cobrança';
    CmpDadosParaBaixa.ParamByName( 'DblCodForma' ).Caption      := 'Tipo de Cobrança';
  End Else Begin
    CmpDadosParaBaixa.ParamByName( 'dblkcmbDescricao' ).Caption := 'Contas/Caixas x Forma Pagamento';
    CmpDadosParaBaixa.ParamByName( 'DblCodForma' ).Caption      := 'Forma de Pagamento';
  End;

  CmpDadosParaBaixa.ParamValues[ 0 ].LookupSettings.SQL.Text := 'SELECT DESCRICAO, CODPORTFORMA FROM PORTADORFORMA WHERE RECPAG   = '+QuotedStr(Paramintegra.RecPag);
  CmpDadosParaBaixa.ParamValues[ 4 ].LookupSettings.SQL.Text := 'SELECT CODFORMA, RECPAG, DESCRICAO FROM FORMARECPAG WHERE RECPAG = '+QuotedStr(Paramintegra.RecPag);
  CmpDadosParaBaixa.ParamValues[ 5 ].LookupSettings.SQL.Text := 'SELECT CODTIPDOC,DESCRICAO  FROM TIPODOCRECPAG WHERE RECPAG      = '+QuotedStr(Paramintegra.RecPag);

  sqlplanoprev.Open;

  SqlPortadorForma.Prepare;
  SqlPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlPortadorForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlFormaRecPag.Prepare;
  SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaRecPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlTipoDocRecPag.Prepare;
  SqlTipoDocRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDocRecPag.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;

  LimpaSelecao;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30032;
    bbtnAjuda.HelpContext := 30032;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
end;


procedure TFrmParamGeraLote.LimpaSelecao;
begin
  CdsSelecionados.Data := SqlDocVazio.Data;
end;

procedure TFrmParamGeraLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaSelecao;
end;

procedure TFrmParamGeraLote.bbtnConfirmarClick(Sender: TObject);
var
  idforcli,splano : String;
  SelectedParam: Array [1..9] of boolean;
  DocPend, iplano : Integer;
  ValtotSel       : Double;
begin
  inherited;
  // nilton
  if ((EdCompl.Text     = '')and
     (EdDoc.Text        = '')and
     (CmbContas.Text    = '')and
     (CPForCli.Text     = '')and
     (cmbFormas.Text    = '')and
     (CmbTipo.Text      = '')and
     (CmbSistema.Text   = '')and
     (DtIni.Date        = 0) and
     (DtFim.Date        = 0) and
     (dtLancto.Date     = 0))then
    MessageDlg('Atenção: uma consulta sem a informação de algum parâmetro' +
      ' (filtro), poderá incorrer na recuperação'+#13+#10+
      'de muitos registros com conseqüente demora nesta recuperação.',
      mtWarning, [mbOK], 0);
  //

  if chkDocAprovados.Checked then


  Screen.Cursor := CrHourGlass;
  CdsDocPendentes.DisableControls;
  CdsLoteXDocumento.DisableControls;

  if CPForCli.ForCliReg.Id = 0 then
    idforcli := ''
  else
    idforcli := IntToStr(CPForCli.ForCliReg.Id);

   //*** passa os paramentos para o componente padrao ***
  CmpDadosParaBaixa.ParamValues[0].AsString   := Cmbcontas.LookupValue;
  CmpDadosParaBaixa.ParamValues[1].AsString   := idforcli;
  CmpDadosParaBaixa.ParamValues[2].AsString   := Eddoc.Text;
  CmpDadosParaBaixa.ParamValues[3].AsString   := Edcompl.Text;
  CmpDadosParaBaixa.ParamValues[4].AsString   := Cmbformas.LookupValue;
  CmpDadosParaBaixa.ParamValues[5].asString   := '';
  CmpDadosParaBaixa.ParamValues[6].AsString   := CmbSistema.LookupValue;
  CmpDadosParaBaixa.ParamValues[7].AsString   := DtIni.text;
  CmpDadosParaBaixa.ParamValues[8].AsString   := DtFim.text;
  CmpDadosParaBaixa.ParamValues[10].AsBoolean := cbListaPortForma.Checked;
  CmpDadosParaBaixa.ParamValues[11].AsBoolean := cbListaFormaPagto.Checked;
  CmpDadosParaBaixa.ParamValues[12].AsBoolean := cbListaMesmoBanco.Checked; //andre tavares -  pendência 23658 - 05/11/2006
  CmpDadosParaBaixa.ParamValues[13].AsBoolean := cbListaCPMF.Checked; //andre tavares -  pendência 23658 - 05/11/2006

  if cbListaCPMF.Checked then
    CmpDadosParaBaixa.ParamValues[5].asInteger := Modulo.CodDocCPMF
  else
  begin
    if trim(CmbTipo.text) <> '' then
      CmpDadosParaBaixa.ParamValues[5].asString := CmbTipo.LookupValue
    else
      CmpDadosParaBaixa.ParamValues[5].asString := '';
  end;

  CmpDadosParaBaixa.ParamValues[18].asInteger := rdgTpSelecao.ItemIndex;

  //Marcus Oliveira p.23738 24/08/2007
  CmpDadosParaBaixa.ParamValues[19].AsBoolean := chkDocAprovados.Checked;


  Screen.Cursor := CrDefault;
  CdsDocPendentes.EnableControls;
  CdsLoteXDocumento.EnableControls;

   //Testa se foi escolhido o Plano Previdenciário
  CdsPlanoPrev.DisableControls;
  CdsPlanoPrev.First;
  while not CdsPlanoPrev.EOF do
  begin
   if CdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
   begin
      if (sPlano) = '' Then
        sPlano := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger))
      else
        sPlano := sPlano + ',' + trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
    End;
    cdsPlanoPrev.Next;
  End;//while
  CdsPlanoPrev.EnableControls;

  CmpDadosParaBaixa.ParamValues[14].AsString := sPlano;
  CmpDadosParaBaixa.ParamValues[15].AsString := dtLancto.text;

  if assigned(EventoGetParam) then
    EventoGetParam;

end;



procedure TFrmParamGeraLote.CdsPlanoPrevAfterOpen(DataSet: TDataSet);
begin
  inherited;
   TStringField(DataSet.FieldByName('NOME')).ReadOnly := True;
end;

procedure TFrmParamGeraLote.dbGrdPlanoTopRowChanged(Sender: TObject);
begin
  inherited;
    (sender as TwwDBGrid).Invalidate;
end;


procedure TFrmParamGeraLote.SetEventoGetParam(const Value: TEventoGetParam);
begin
  FEventoGetParam := Value;
end;

procedure TFrmParamGeraLote.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  If (Trim(cmbcontas.Text) = '') and (self.ModalResult = mrOk) and (FbGeraLote) Then
  Begin
    Msgdlg('Favor Indicar a  Contas/Caixas x Forma Pagamento ','Atenção!',mtInformation,[mbOk],0);
    CanClose := false;
  end
end;

procedure TFrmParamGeraLote.SetbGeraLote(const Value: Boolean);
begin
  FbGeraLote := Value;
end;




procedure TFrmParamGeraLote.dbgrPlanoPrevCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TFrmParamGeraLote.dbgrPlanoPrevTopRowChanged(Sender: TObject);
begin
  inherited;
  (Sender as TwwDBGrid).Invalidate;
end;




procedure TFrmParamGeraLote.btSelecionarClick(Sender: TObject);
begin
  inherited;
  msDoc.Executar;
  if msDoc.RetornouValor then
  begin
    EdDoc.Text   := msDoc.Valoreschave[2];
    EdCompl.Text := msDoc.Valoreschave[3];
    CmpDadosParaBaixa.ParamValues[16].AsInteger := strToInt(msDoc.Valoreschave[0]);
  end;
end;




procedure TFrmParamGeraLote.ExibirCheckBox(bTelaDeBaixaManual: boolean);
begin
   cbListaPortForma.Visible  := not bTelaDeBaixaManual;
   cbListaFormaPagto.Visible := not bTelaDeBaixaManual;
   cbListaMesmoBanco.Visible := not bTelaDeBaixaManual;
end;




procedure TFrmParamGeraLote.btLimparClick(Sender: TObject);
begin
  inherited;
  EdDoc.Text   := '';
  EdCompl.Text := '';
  MsDoc.ValoresChave.Clear;
end;

procedure TFrmParamGeraLote.CPForCliExit(Sender: TObject);
begin
  inherited;
  if not ( CPForCli.Valida = VcOk ) then
  begin
    CPForCli.Text := '';
    exit;
  end;  
end;

end.
