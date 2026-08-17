unit fCadSegregaCotacao;

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 16/09/04
  Pendência    : 16858 - Corrigir o arredondamento do critério, avisa que não
                 bate 100% quando foi cadastrado 100% com 5 casas decimais.
                 Ocontece apenas no cliente.
  Metodo       : VerificaPreenchimento
  Solução      : Utilizando o método Floatsequal da jcl para tentar resolver
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 27/05/04
  Pendência    : 16858 - Corrigir o arredondamento do critério, avisa que não
                 bate 100% quando foi cadastrado 100% com 5 casas decimais.
                 Ocontece apenas no cliente.
  Metodo       : VerificaPreenchimento
  Solução      : Trocada a variável de extended para integer para verificar se
                 o problema persiste

------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 20/01/04
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : modificada a criação do uCtrlSegregacao

------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TREdit,
  uVerificaPreenchimento, dBaseDados, uSistema, uMensErroMT, uMensErro,
  uCtrlSegregacao, uCtrlPlanprevcontabil, uCtrlPatro,
  DBTables, Wwquery, Provider, JclMath;

type
  TfrmCadSegregaCotacao = class(TFrmCadastroMestreDetMTImob)
    cdsSegregaCriter: TCMClientDataSet;
    cdsSegregaCriterDESCRICAO: TStringField;
    cdsSegregaCriterORDEM: TFloatField;
    cdsSegregaCriterIDSEGREGACRITER: TFloatField;
    cdsSegregaCriterFLGTIPOSEGREGA: TStringField;
    cdsSegregaCriterFLGTIPOCOTACAO: TStringField;
    Label1: TLabel;
    dbCboCriterio: TwwDBLookupCombo;
    Label2: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    rdgTipoSegrega: TDBRadioGroup;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    Label4: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    Label3: TLabel;
    dblcPatroC: TwwDBLookupCombo;
    Label5: TLabel;
    dbEdtValor: TDBRealEdit;
    DBRadioGroup2: TDBRadioGroup;
    CdsDet: TCMClientDataSet;
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    CdsIDSEGREGACRITER: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsORDEM: TFloatField;
    CdsFLGTIPOSEGREGA: TStringField;
    CdsFLGTIPOCOTACAO: TStringField;
    CdsIDSEGREGADATA: TFloatField;
    CdsDATAINI: TDateTimeField;
    CdsDATAFIM: TDateTimeField;
    CdsDetIDSEGREGADATA: TFloatField;
    CdsDetIDSEGREGACOTACAO: TFloatField;
    CdsDetIDPLANOPREV: TFloatField;
    CdsDetIDPATRO: TFloatField;
    CdsDetCOTACAO: TFloatField;
    CdsDetPATRO: TStringField;
    CdsDetPLANPREVCONTABIL: TStringField;
    _CdsLocal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbgrdDetUpdateFooter(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbCboCriterioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

  private
    { Private declarations }
    CtrlSegregacao: TCtrlSegregacao;
    CtrlPlanprevcontabil: TCtrlPlanPrevContabil;
    CtrlPatro: TCtrlPatro;
    procedure SelecionaMestreDetalhe(const iIdSegregaData:Integer);
    function  VerificaPreenchimento       : Boolean;
    function  VerificaPreenchimentoRateio : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadSegregaCotacao: TfrmCadSegregaCotacao;

implementation

{$R *.DFM}

{ TfrmCadSegregaCotacao }

procedure TfrmCadSegregaCotacao.SelecionaMestreDetalhe(const iIdSegregaData: Integer);
begin
  Cds.Data := CtrlSegregacao.ListaSegregaData (-1, iIdSegregaData);
  CdsDet.Data := CtrlSegregacao.ListaSegregaCotacao (iIdSegregaData);

end;

function TfrmCadSegregaCotacao.VerificaPreenchimento: Boolean;
var
  fTot: Extended;

begin
  Result := False;
  try

    if dbCboCriterio.Text = '' then
      raise EValidacao.CreateVal('Informe o Critério para Segregação!', dbCboCriterio);

    if edtDataIni.Text = '' then
      raise EValidacao.CreateVal('Informe a Data início do Critério da Segregação!', edtDataIni);

    if edtDataFim.Text = '' then
      raise EValidacao.CreateVal('Informe a Data fim do Critério para Segregação!', edtDataFim);

    // verificar se a data ini do critério não conflita com outro critério do mesmo tipo
    _cdsLocal.Data := CtrlSegregacao.ListaSegregaCotacaoXData (CdsIDSEGREGACRITER.AsInteger, CdsDATAINI.AsDateTime, CdsIDSEGREGADATA.AsInteger);
    if not _cdsLocal.IsEmpty then
      raise EValidacao.CreateVal('A data de início está concorrendo com um critério cadastrado anteriormente!', edtDataIni);

    // verificar se a data fim do critério não conflita com outro critério do mesmo tipo
    _cdsLocal.Data := CtrlSegregacao.ListaSegregaCotacaoXData (CdsIDSEGREGACRITER.AsInteger, CdsDATAFIM.AsDateTime, CdsIDSEGREGADATA.AsInteger);
    if not _cdsLocal.IsEmpty then
      raise EValidacao.CreateVal('A data de fim está concorrendo com um critério cadastrado anteriormente!', edtDataFim);

    // verificar se o critério é por percentual e se fecha 100%
    if CdsFLGTIPOCOTACAO.AsString = 'P' then begin
      _cdsLocal.Data := CdsDet.Data;
      _cdsLocal.First;
      fTot := 0;
      while not _cdsLocal.Eof do begin
        fTot := fTot + _cdsLocal.fieldbyname('COTACAO').AsFloat;
        _cdsLocal.next;
      end;
      if not FloatsEqual(fTot, 100) then  
        raise EValidacao.CreateVal('O Rateio não fecha em 100%!', edtDataFim);
    end;


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

function TfrmCadSegregaCotacao.VerificaPreenchimentoRateio: Boolean;
begin
  Result := False;
  try
    if dblcPatroC.Text = '' then
      raise EValidacao.CreateVal('Informe a Patrocinadora!', dblcPatroC);

    if dblcPlanoPrevC.Text = '' then
      raise EValidacao.CreateVal('Informe o Plano de Benefícios!', dblcPlanoPrevC);

    if dbEdtValor.Value = 0 then
      raise EValidacao.CreateVal('Informe a Cota / Percentual do critério!', dbEdtValor);

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

procedure TfrmCadSegregaCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            MensErroMT.MensErroMT);
  cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);

  CtrlPatro := TCtrlPatro.Create;
  CtrlPatro.InitializeAs(CtrlSegregacao);
  CdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento(0, CtrlSegregacao.PatroComum);

  CtrlPlanprevcontabil := TCtrlPlanPrevContabil.Create;
  CtrlPlanprevcontabil.InitializeAs(CtrlSegregacao);
  CdsPlanoPrev.Data := CtrlPlanprevcontabil.ListaPlanPrevContabil(0, CtrlSegregacao.PlanoPrevComum);

  // associa o ds local com o do contrlolbject
  CtrlSegregacao.CdsSegregaData := Cds;
  CtrlSegregacao.CdsSegregaCotacao := CdsDet;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDet.CreateDataSet;

end;

procedure TfrmCadSegregaCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlSegregacao);                       
  FreeAndNil (CtrlPatro);
  FreeAndNil (CtrlPlanprevcontabil);
  inherited;
end;

procedure TfrmCadSegregaCotacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // redesenha o form na volta do MontaSelect
  Repaint;
  // se houve busca, abre a query principal com apenas o registro selecionado
  if MontaSelect.RetornouValor then
    SelecionaMestreDetalhe(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadSegregaCotacao.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsDet.IndexFieldNames := AFieldName;
end;

procedure TfrmCadSegregaCotacao.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;

end;

procedure TfrmCadSegregaCotacao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlSegregacao.GravaSegregaCotacao;
end;

procedure TfrmCadSegregaCotacao.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Aplica Alterações de exclusão ( ordem inversa da inclusão - filho / pai )
  Accept := CtrlSegregacao.ExcluiSegregaCotacao;
  if Accept then begin
     SelecionaMestreDetalhe( -2 );
  end;
end;

procedure TfrmCadSegregaCotacao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if cds.State in dsEditModes then begin
    Accept := VerificaPreenchimento;
  end;
end;

procedure TfrmCadSegregaCotacao.CmeDetalheConfirma(Sender: TObject);
begin
  if cdsDet.State in dsEditModes then begin
    if VerificaPreenchimentoRateio then begin
      CdsDetPATRO.AsString := dblcPlanoPrevC.Text;
      CdsDetPLANPREVCONTABIL.AsString := dblcPatroC.Text;
      inherited;
    end;
  end else inherited;
end;

procedure TfrmCadSegregaCotacao.dbgrdDetUpdateFooter(Sender: TObject);
var fTotal : Extended;
    cdsTemp : TCMClientDataSet;
begin
  inherited;
  fTotal := 0;
  try
    try
       cdsTemp := TCMClientDataSet.Create( nil );
       cdsTemp.Data := CdsDet.Data;
       cdsTemp.First;
       while not cdsTemp.Eof do begin
         fTotal := fTotal + cdsTemp.FieldByName('COTACAO').AsFloat;
         cdsTemp.Next
       end;
       dbgrdDet.ColumnByName('COTACAO').FooterValue := FormatFloat('#,###0.000000000000', fTotal);
    except
       // Vinicius falou que é necessário o try except, pois estava dando uma exceção
       // que não precisa de tratamento.
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadSegregaCotacao.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Atualiza o total do grid de rateio
  dbgrdDetUpdateFooter( Self );
end;

procedure TfrmCadSegregaCotacao.dbCboCriterioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // atualizar os radios
  CdsFLGTIPOCOTACAO.AsString := cdsSegregaCriterFLGTIPOCOTACAO.AsString;
  CdsFLGTIPOSEGREGA.AsString := cdsSegregaCriterFLGTIPOSEGREGA.AsString;
end;

end.
