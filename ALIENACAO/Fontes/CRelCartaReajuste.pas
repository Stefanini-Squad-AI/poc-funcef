{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelCartaReajuste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Menus, ppBands, ppClass, ppProd, ppReport, Db,
  Wwdatsrc, ppEndUsr, ppComm, ppCache, ppDB, ppDBBDE, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  fcButton, fcImgBtn, fcShapeBtn, MontaSelect, TB97Ctls,
  cmseldlg, wwidlg, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, wwdblook, Pptypes, Wwdbspin, ppPrvDlg, ppforms, CRel, TREdit,
  uExtensoCM, ppRelatv, ppDBPipe, mContrato, wwdbdatetimepicker,
  CMDateTimePicker, mProposta, CMDBLookupCombo;

const
   ArqCMCartaReaj = 'CartaReajuste.tmp';

   vNomeMes : array[1..12] of string = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');
   vNumMes  : array[1..12] of string = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');

type
  TcfgRelCartaReajuste = class(TcfgRel)
    pplconsulta: TppBDEPipeline;
    rptImprime: TppReport;
    RpImprimeHeaderBand1: TppHeaderBand;
    RpImprimeDetailBand1: TppDetailBand;
    RpImprimeFooterBand1: TppFooterBand;
    dsSql: TwwDataSource;
    qryTemplate: TwwQuery;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    Label2: TLabel;
    DBcboModeloCarta: TwwDBLookupCombo;
    memReports: TMemo;
    qrySql: TwwQuery;
    qryTemplateIDCARTACOBRANCA: TFloatField;
    qryTemplateMODELOCARTA: TStringField;
    qryTemplateIDREPORTS: TFloatField;
    qryTemplateORIGEMCM: TFloatField;
    qryTemplateFLGTIPOCARTA: TStringField;
    Extenso: TExtensoCM;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    lblMesVencimento: TLabel;
    Label9: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    molProposta: TmolProposta;
    dblcCondPag: TCMDBLookupCombo;
    Label1: TLabel;
    qryCondPag: TwwQuery;
    qryCondPagDSCCOND: TStringField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qrySqlNOME: TStringField;
    qrySqlRAZAOSOCIAL: TStringField;
    qrySqlENDERECO: TStringField;
    qrySqlBAIRRO: TStringField;
    qrySqlCIDADE: TStringField;
    qrySqlCEP: TStringField;
    qrySqlCODESTADO: TStringField;
    qrySqlNUMERO_CONTRATO: TStringField;
    qrySqlNOME_CONTRATO: TStringField;
    qrySqlCONDICAO_PAGAMENTO: TStringField;
    qrySqlVALOR_FINANCIADO: TFloatField;
    qrySqlNUMERO_PARCELAS: TFloatField;
    qrySqlPERIODICIDADE_MESES: TFloatField;
    qrySqlPRAZO: TStringField;
    qrySqlPARCELA_ATUAL: TFloatField;
    qrySqlDATAVENCIMENTO: TDateTimeField;
    qrySqlVALOR_PRESTACAO: TFloatField;
    qrySqlVALOR_AMORTIZACAO: TFloatField;
    qrySqlVALOR_PRESTACAO_ATUALIZADA: TFloatField;
    qrySqlVALOR_RESIDUO: TFloatField;
    qrySqlVALOR_RESIDUO_ATUALIZADO: TFloatField;
    qrySqlINDICE: TStringField;
    qrySqlFATOR_CORRECAO: TFloatField;
    qrySqlFATOR_ACUMULADO: TFloatField;
    qrySqlPROX_PARCELA: TFloatField;
    qrySqlPROX_DATAVENCIMENTO: TDateTimeField;
    qrySqlPROX_PRESTACAO: TFloatField;
    qrySqlPROX_AMORTIZACAO: TFloatField;
    qrySqlPROX_PREST_ATUALIZADA: TFloatField;
    qrySqlPROX_RESID: TFloatField;
    qrySqlPROX_RESID_ATUALIZADO: TFloatField;
    qrySqlMesAno: TStringField;
    qrySqlProxPrestacaoExtenso: TStringField;
    qrySqlUltPrestacaoExtenso: TStringField;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;
    procedure FechaQueries; override;

    // outros procedimentos
    procedure qrySqlCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure molPropostabtnLimpaPropClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;


var
  cfgRelCartaReajuste: TcfgRelCartaReajuste;


implementation
{$R *.DFM}
uses
   uDataBase, uSistema, uMensErro, uModeloRelatCM, uDiasInUteis, UComunsImobiliario, uVerificaPreenchimento,
   uFuncoesImob, dLookImobiliario, DMS;


function TcfgRelCartaReajuste.VerificaPreenchimento: boolean;
begin
	Result := False;

  try
     if molProposta.edtNumProp.Text = '' then
       raise EValidacao.CreateVal('É necessário indicar a proposta!', molProposta.edtNumProp );

     if (dblcCondPag.LookupValue = '') then
        raise EValidacao.CreateVal('É necessário indicar a condição de pagamento!', dblcCondPag);

     if (DBcboModeloCarta.LookupValue = '') then
        raise EValidacao.CreateVal('É necessário indicar o Modelo de Carta de Reajuste!', DBcboModeloCarta);

     if (cboMes.Text <> '') and (dbSpnAno.Text = '') then
        raise EValidacao.CreateVal('Informe o ANO do reajuste!', cboMes);

     if (cboMes.Text = '') and (dbSpnAno.Text <> '') then
        raise EValidacao.CreateVal('Informe o MÊS do reajuste!', cboMes);

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



procedure TcfgRelCartaReajuste.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;
end;



procedure TcfgRelCartaReajuste.qrySqlCalcFields(DataSet: TDataSet);
begin
   inherited;
   qrySqlMesAno.AsString := FormatDateTime( 'mmm/yyyy', qrySqlDATAVENCIMENTO.AsDateTime );

   if not qrySqlVALOR_PRESTACAO_ATUALIZADA.IsNull then
   begin
     Extenso.Valor := qrySqlVALOR_PRESTACAO_ATUALIZADA.AsFloat;
     Extenso.Escreve;
     qrySqlUltPrestacaoExtenso.AsString := '( ' + Extenso.Extenso + ' )';
   end;

   if not qrySqlPROX_PRESTACAO.IsNull then
   begin
     Extenso.Valor := qrySqlPROX_PRESTACAO.AsFloat;
     Extenso.Escreve;
     qrySqlProxPrestacaoExtenso.AsString := '( ' + Extenso.Extenso + ' )';
   end;
end;



procedure TcfgRelCartaReajuste.bbtnConfirmarClick(Sender: TObject);
var
  sMensagem : string;
begin
  if VerificaPreenchimento then
  begin
    qryReports.Close;
    qryReports.ParamByName('PIDREPORTS').asInteger  := qryTemplate.FieldByName('IDREPORTS').asInteger;
    qryReports.ParamByName('PORIGEMCM').asInteger   := qryTemplate.FieldByName('ORIGEMCM').asInteger;
    qryReports.Open;

    memReports.Lines.Clear;
    memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
    memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaReaj);

    // acha e troca as referências ao pipeline antigo
    ModeloRelatCM.SetaDataPipeline('cfgRelCartaReajuste', 'pplConsulta', 'frmDesenhoRelCartaReajuste', 'ppConsulta', memReports);

    // salva em disco o arquivo com as alteracões
    memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaReaj);

    // carrega o template e imprime o relatório
    rptImprime.Template.FileName := Sistema.TempDir + ArqCMCartaReaj;
    rptImprime.Template.LoadFromFile;

    ModeloRelatCM.SetaDadosRpt(rptImprime, pplConsulta, ArqCMCartaReaj);

    LimpaParametros( qrySql );
    qrySql.ParamByName('IDCONTRATOIMOVEL').AsInteger := molProposta.iProposta;
    qrySql.ParamByName('IDCONDINICIAL').AsString     := dblcCondPag.LookupValue;
    qrySql.ParamByName('ANOMES').AsString            := DBspnAno.Text + FormatFloat( '00', cboMes.ItemIndex + 1 );
    qrySql.Open;

    if qrySql.isEmpty then
    begin
      qrySql.Close;
      sMensagem   := 'Não houve contratos reajustados em ' +
                      FormatFloat( '00', cboMes.ItemIndex + 1 ) + '/' + DBspnAno.Text + '.';
      MsgDlg(sMensagem, 'Aviso', mtWarning, [mbOk], 0);
      Exit;
    end;

    DesabilitaBotoes;

    rptImprime.Device := dvScreen;
    rptImprime.Print;

    HabilitaBotoes;

  end;
end;



procedure TcfgRelCartaReajuste.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os Frames (MOL)
   molProposta.btnLimpaPropClick(Self);
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelCartaReajuste.FormShow(Sender: TObject);
begin
   inherited;
   qryTemplate.Open;
   qryTemplate.First;
   DBcboModeloCarta.LookupValue := IntToStr(qryTemplate.FieldByName('IDCARTACOBRANCA').AsInteger);

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;

procedure TcfgRelCartaReajuste.molProposta1btnBuscaPropClick(Sender: TObject);
begin
  inherited;
  molProposta.btnBuscaPropClick( 2, True, Sender );
  if molProposta.edtNumProp.Text <> '' then
  begin
    qryCondPag.Close;
    qryCondPag.ParamByName('IDCONTRATOIMOVEL').AsInteger := molProposta.iProposta;
    qryCondPag.Open;
    qryCondPag.First;
    dblcCondPag.Enabled := True;
  end;
end;

procedure TcfgRelCartaReajuste.molPropostabtnLimpaPropClick(Sender: TObject);
begin
  inherited;
  molProposta.iProposta    := -1;
  molProposta.iComprador   := -1;
  molProposta.sComprador   := '';
  molProposta.sNumContrato := '';
  molProposta.edtNumProp.Clear;
  molProposta.edtNomProp.Clear;
  dblcCondPag.LookupValue := '';
  qryCondPag.Close;
  dblcCondPag.Enabled := False;
end;

end.
