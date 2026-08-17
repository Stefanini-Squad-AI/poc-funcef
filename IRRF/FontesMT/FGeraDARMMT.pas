unit FGeraDARMMT;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 05/07/2007 e 06/07/2007
Autor     : André Pontes
Pendencia : 25721
Descrição : Crítica da seleção de pelo menos 1 documento na grid
----------------------------------------------------------------------------------------------------
Rotina    : (nova) MarcaRegistrosLancIRRF
Data      : 05/07/2007
Autor     : André Pontes
Pendencia : 25721
Descrição : Rotina para equalizar os registros selecionados entre os cds (de documento, exibido) e
            de lançamentos (oculta), mas no qual é baseado o processamento
----------------------------------------------------------------------------------------------------
Rotina    : - (novo) cdsDoc
Data      : 05/07/2007
Autor     : André Pontes
Pendencia : 25721
Descrição : Exibição da grid baseada nos documentos, natureza e codgps - "fechada" por documento:
            não mais listando LancIRRF ("aberta")
            O processamento permanece baseado na LancIRRF. A listagem de documentos é apenas para
            exibição ao usuário.
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 02/05/2007
Autor     : André Pontes
Pendencia : 24347
Descrição : Não permitir geração de guia para dia não útil
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 17/04/2007
Autor     : André Pontes
Pendencia : 23882
Descrição : Gravação de Centro de Responsabilidade sobrescrevendo o rateio dos documentos originais
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 17/04/2007
Autor     : André Pontes
Pendencia : 22657
Descrição : Gravação do campo "Competência"
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 23/03/2007
Autor     : André Pontes
Pendencia : 24837
Descrição : Tela completamente refeita, baseada na de GPS
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CMProcuraSubTipo,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, uCtrlGeraDARM, uCtrlUtil, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, uctrlParamIntegra, uCtrlCentRespon,
  Mask, fcLabel, ComCtrls;

type
  TfrmGeraDARMMT = class(TfrmSairAjuda)
    DBgrdLancIRRF: TwwDBGrid;
    dtsLancIRRF: TwwDataSource;
    cdsLancIRRF: TCMClientDataSet;
    bbtnGera: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    sqlLancIRRF: TCMSqlParams;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    pgc: TPageControl;
    tbsFiltro: TTabSheet;
    lblDataIni: TLabel;
    Label6: TLabel;
    fcLabel1: TfcLabel;
    rdgAgrupa: TRadioGroup;
    btnFiltra: TBitBtn;
    grpPeriodoApu: TGroupBox;
    Label4: TLabel;
    lblDataFim: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    chkPF: TCheckBox;
    chkPJ: TCheckBox;
    edtDataVenc: TCMDateTimePicker;
    mskCompetencia: TMaskEdit;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    fcLabel2: TfcLabel;
    CMProcuraForCli: TCMProcuraForCli;
    DBcboFormaPagto: TwwDBLookupCombo;
    DBcboTipoDoc: TwwDBLookupCombo;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBgrdDocumentos: TwwDBGrid;
    dtsDoc: TwwDataSource;
    cdsDoc: TCMClientDataSet;
    cdsDocFLAG: TStringField;
    cdsDocVLRBASE: TFloatField;
    cdsDocVALOR: TFloatField;
    cdsDocCODDOCUMENTO: TFloatField;
    cdsDocNODOCUMENTO: TFloatField;
    cdsDocDATALANCAMENTO: TDateTimeField;
    cdsDocCODNATUREZA: TStringField;
    cdsDocCODIGOGPS: TFloatField;
    cdsDocIDBENEFIRRF: TFloatField;
    cdsDocTIPO: TStringField;
    cdsDocTIPO_PES: TStringField;
    cdsDocNOME: TStringField;
    sqlDoc: TCMSqlParams;
    lblINSSPend: TLabel;

    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltraClick(Sender: TObject);
    procedure rdgAgrupaClick(Sender: TObject);


  private

    CtrlGeraDARM    : TCtrlGeraDARM;
    CtrlUtil        : TCtrlUtil;
    CtrlCentRespon  : TCtrlCentRespon;

    iPlano          : LongInt;

    function  VerificaPreenchimento: Boolean;

    procedure MarcaRegistrosLancIRRF;


  public

    constructor create(AOwner: Tcomponent; Plano : integer); reintroduce;


  end;



var
  frmGeraDARMMT: TfrmGeraDARMMT;



implementation
{$R *.DFM}
uses
  {$IFDEF VERSAO0505} uComum, DLookIRRF {$ELSE} uCMTypes {$ENDIF}, uMensErro, uSistema,
  uDataBase, DBaseDados, uVerificaPreenchimento, dLookIRRF, uDiasUteis;



procedure TfrmGeraDARMMT.btnTodasClick(Sender: TObject);
begin
  inherited;
  cdsDoc.DisableControls;
  cdsDoc.First;
  while not(cdsDoc.EOF) do
  begin
    cdsDoc.Edit;
    if cdsDoc.FieldByName('FLAG').AsString = 'N' then
       cdsDoc.FieldByName('FLAG').AsString := 'S';
    cdsDoc.Post;
    cdsDoc.Next;
  end;

  cdsDoc.First;
  cdsDoc.EnableControls;
end;



procedure TfrmGeraDARMMT.btnInverterClick(Sender: TObject);
begin
  inherited;
  cdsDoc.DisableControls;
  cdsDoc.First;
  while not(cdsDoc.EOF) do
  begin
    cdsDoc.Edit;
    if cdsDoc.FieldByName('FLAG').AsString = 'S' then
       cdsDoc.FieldByName('FLAG').AsString := 'N'
    else
       cdsDoc.FieldByName('FLAG').AsString := 'S';

    cdsDoc.Post;
    cdsDoc.Next;
  end;

  cdsDoc.First;
  cdsDoc.EnableControls;
end;



procedure TfrmGeraDARMMT.FormCreate(Sender: TObject);
begin
  inherited;

  pgc.ActivePageIndex := 0;

  cdsLancIRRF.Close;
  cdsDoc.Close;

  CtrlGeraDARM    := TCtrlGeraDARM.Create;
  CtrlUtil        := TCtrlUtil.Create;
  CtrlCentRespon  := TCtrlCentRespon.Create;

  CtrlGeraDARM.Initialize(DtmBaseDados.dbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          nil,
                          nil,
                          False
                         );

  CtrlUtil.InitializeAs(CtrlGeraDARM);
  CtrlCentRespon.InitializeAs(CtrlGeraDARM);

  dtmLookIRRF.cdsLookTipoDesemb.Data    := CtrlUtil.ListTipoDesemb;
  dtmLookIRRF.cdsLookFormaPagto.Data    := CtrlUtil.ListFormaPagto;
  dtmLookIRRF.cdsLookTipoDoc.Data       := CtrlUtil.ListTipoDoc;

  dtmLookIRRF.cdsLookCentroRespon.Data  := CtrlCentRespon.ListaCentRespon(Sistema.IdEmpresa,  // IDPessoa
                                                                          '',                 // IDCentRespon
                                                                          0,                  // iOrdem
                                                                          'A',                // sSintetAnalit
                                                                          ParamIntegra.PlanoCentroRespon,
                                                                          True,               //  bListaCRpadrao
                                                                          True                // bSoAtivos
                                                                          );
  CtrlGeraDARM.cdsLancIRRF  := cdsLancIRRF;
  CtrlGeraDARM.cdsDocLancIRRF  := cdsDoc;
end;



procedure TfrmGeraDARMMT.bbtnGeraClick(Sender: TObject);
begin
  inherited;

  if not(VerificaPreenchimento) then Exit;

  MarcaRegistrosLancIRRF;

  try
    if not(CtrlGeraDARM.GeraGuia(Sistema.IDEmpresa,
                                 rdgAgrupa.ItemIndex,
                                 CMProcuraForCli.ForCliReg.ID,
                                 StrToIntDef(CMProcuraForCli.ForCliReg.SubConta, 0),
                                 StrToIntDef(DBcboFormaPagto.LookupValue, 0),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario,
                                 StrToIntDef(DBcboTipoDoc.LookupValue, 0),
                                 Sistema.IdEspAcesso,
                                 ParamIntegra.Plano,
                                 CMProcuraForCli.ForCliReg.CentroCusto,
                                 edtDataVenc.Date,
                                 mskCompetencia.EditText,
                                 DBcboCentroRespon.LookupValue
                                )) then
    begin
      MsgDlg(CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Exit;
    end
    else
    begin
      MsgDlg('Geração Efetuada com Sucesso', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Repaint;

      // -------------------------------------------------------------------------------------------

      cdsLancIRRF.Data := CtrlGeraDARM.ListLancPendentes(edtDataIni.Date,
                                                         edtDataFim.Date,
                                                         rdgAgrupa.ItemIndex,
                                                         chkPF.Checked,
                                                         chkPJ.Checked
                                                        );

      cdsDoc.Data := CtrlGeraDARM.ListDocPendentes(edtDataIni.Date,
                                                  edtDataFim.Date,
                                                  rdgAgrupa.ItemIndex,
                                                  chkPF.Checked,
                                                  chkPJ.Checked
                                                 );

    // -------------------------------------------------------------------------------------------
    end;

  except
    MsgDlg('Geração não efetuada: ' + CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtWarning, [mbOk], 0);
    Repaint;
    Raise;
    Repaint;
  end;
end;



constructor TfrmGeraDARMMT.create(AOwner: Tcomponent; Plano: integer);
begin
end;



procedure TfrmGeraDARMMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CtrlUtil.Free;
  CtrlGeraDARM.Free;
  CtrlCentRespon.Free;
end;



procedure TfrmGeraDARMMT.btnFiltraClick(Sender: TObject);
begin
  inherited;

  // -----------------------------------------------------------------------------------------------
  cdsLancIRRF.Data := CtrlGeraDARM.ListLancPendentes(edtDataIni.Date,
                                                     edtDataFim.Date,
                                                     rdgAgrupa.ItemIndex,
                                                     chkPF.Checked,
                                                     chkPJ.Checked
                                                    );

  cdsDoc.Data := CtrlGeraDARM.ListDocPendentes(edtDataIni.Date,
                                              edtDataFim.Date,
                                              rdgAgrupa.ItemIndex,
                                              chkPF.Checked,
                                              chkPJ.Checked
                                             );

  // -----------------------------------------------------------------------------------------------
end;



function TfrmGeraDARMMT.VerificaPreenchimento: Boolean;
var
  bMarcado : Boolean;
begin
	Result := False;

  // -----------------------------------------------------------------------------------------------

	try
    if length(trim(mskCompetencia.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Competência para a guia a gerar!', mskCompetencia);

    if length(trim(edtDataVenc.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento do documento a gerar!', edtDataVenc);

    if not(DiasUteis.DiaUtil(Sistema.IdEmpresa, edtDataVenc.Date, True, True, False)) then
      raise EValidacao.CreateVal('A data de vencimento do documento precisa ser dia útil!', edtDataVenc);

  except

    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      pgc.ActivePageIndex := 0;
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;

  // -----------------------------------------------------------------------------------------------

	try
    if CMProcuraForCli.Valida <> vcOK then
      raise EValidacao.CreateVal('É necessário indicar o Favorecido do documento a gerar!', CMProcuraForCli);

    if DBcboFormaPagto.LookupValue = '' then
      raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento do documento a gerar!', DBcboFormaPagto);

    if DBcboTipoDoc.LookupValue = '' then
      raise EValidacao.CreateVal('É necessário indicar Tipo de Documento a gerar!', DBcboTipoDoc);

    // ---------------------------------------------------------------------------------------------

    if not(cdsDoc.Active) or (cdsDoc.IsEmpty) then
      raise EValidacao.CreateVal('Não há Documentos selecionados!', btnFiltra);

    bMarcado := False;

    cdsDoc.DisableControls;
    cdsDoc.First;
    while not(cdsDoc.EOF)do
    begin
      if cdsDoc.FieldByName('FLAG').AsString = 'S' then
      begin
        bMarcado := True;
        Break;
      end;
      cdsDoc.Next;
    end;
    cdsDoc.EnableControls;

    if not(bMarcado) then
      raise EValidacao.CreateVal('Não há Documentos selecionados!', btnFiltra);

  except

    on ev : EValidacao do
    begin
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      pgc.ActivePageIndex := 1;
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;

  // -----------------------------------------------------------------------------------------------

  Result := True;
end;



procedure TfrmGeraDARMMT.rdgAgrupaClick(Sender: TObject);
begin
  inherited;

  cdsLancIRRF.Close;
  cdsDoc.Close;
end;



procedure TfrmGeraDARMMT.MarcaRegistrosLancIRRF;
var
  bMarcado : Boolean;
begin
  // -----------------------------------------------------------------------------------------------

  cdsLancIRRF.DisableControls;
  cdsLancIRRF.First;
  while not(cdsLancIRRF.EOF) do
  begin
    bMarcado := False;

    cdsDoc.DisableControls;
    cdsDoc.First;
    while not(cdsDoc.EOF)do
    begin
      if (cdsDoc.FieldByName('FLAG').AsString             = 'S') and
         (cdsDoc.FieldByName('CODDOCUMENTO').AsInteger    = cdsLancIRRF.FieldByName('CODDOCUMENTO').AsInteger) and
         (cdsDoc.FieldByName('DATALANCAMENTO').AsDateTime = cdsLancIRRF.FieldByName('DATALANCAMENTO').AsDateTime) and
         (cdsDoc.FieldByName('CODNATUREZA').AsString      = cdsLancIRRF.FieldByName('CODNATUREZA').AsString) and
         (cdsDoc.FieldByName('CODIGOGPS').AsString        = cdsLancIRRF.FieldByName('CODIGOGPS').AsString) then
      begin
        bMarcado := True;
        Break;
      end;

      cdsDoc.Next;
    end;
    cdsDoc.EnableControls;

    // ---------------------------------------------------------------------------------------------

    cdsLancIRRF.Edit;

    if bMarcado then
      cdsLancIRRF.FieldByName('FLAG').AsString := 'S'
    else
      cdsLancIRRF.FieldByName('FLAG').AsString := 'N';

    cdsLancIRRF.Post;

    // ---------------------------------------------------------------------------------------------

    cdsLancIRRF.Next;
  end;

  cdsDoc.First;
  cdsLancIRRF.First;

  cdsLancIRRF.EnableControls;

  // -----------------------------------------------------------------------------------------------
end;
end.
