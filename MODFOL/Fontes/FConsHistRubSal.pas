unit FConsHistRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, checklst, Spin, MontaSelect, wwdblook, Db,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, TREdit, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, fcLabel;

type
  TfrmConsHistRubSal = class(TfrmSairAjuda)
    pnlInformacoes: TPanel;
    MontaSelect: TMontaSelect;
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryProventos: TwwQuery;
    qryDescontos: TwwQuery;
    qryMotivo: TwwQuery;
    dsDescontos: TwwDataSource;
    dsProventos: TwwDataSource;
    fcLabel1: TfcLabel;
    Label22: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    fcLabel2: TfcLabel;
    gridDescontos: TwwDBGrid;
    dblcMotivo: TwwDBLookupCombo;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edTotProventos: TRealEdit;
    edTotDescontos: TRealEdit;
    edTotLiquido: TRealEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    rgRubApoio: TRadioGroup;
    rgProcesso: TRadioGroup;
    gridProventos: TwwDBGrid;
    edFuncionario: TEdit;
    edEmpresa: TEdit;
    edMatricula: TEdit;
    edTitulo: TEdit;
    bbtnProcurar: TBitBtn;
    qryParamRH: TwwQuery;
    qryProventosCODPROVDESC: TStringField;
    qryProventosMES: TStringField;
    qryProventosREFERENCIA: TStringField;
    qryProventosVALORPROVENTO: TFloatField;
    qryProventosDESCRICAO: TStringField;
    qryDescontosCODPROVDESC: TStringField;
    qryDescontosMES: TStringField;
    qryDescontosREFERENCIA: TStringField;
    qryDescontosVALORPROVENTO: TFloatField;
    qryDescontosDESCRICAO: TStringField;
    qryProventosFLGDESCONTO: TFloatField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcMotivoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sIdPessoa: string;
//    sIdEmpresa : string;
    dTotProventos,
    dTotDescontos : double;
    procedure AtualizaRubricas;
  public
    { Public declarations }
  end;

var
  frmConsHistRubSal: TfrmConsHistRubSal;

implementation

uses uSistema, uMensErro, uFuncoesUteis, uFuncoesFolha, dBaseDados, UsoGeralRH;

{$R *.DFM}

procedure TfrmConsHistRubSal.FormCreate(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelect.Filtro) do
  begin
    Clear;
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qryMotivo.Open;
  qryParamRH.Open;

  sIdPessoa:='-1'; //sIdEmpresa:='-1';

  DecodeDate(qryParamRH.FieldByName('NORMALINI').asDateTime, wAno, wMes, wDia);

  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;

  // Seleciono o motivo no PARAMRH como o Tipo de Pagamento Padrão
  if (qryMotivo.Locate('IDMOTIVO',qryParamRH.FieldByName('IDMOTIVO').asString,[loCaseInsensitive])) then
  begin
    dblcMotivo.LookUpValue := qryMotivo.FieldByName('IDMOTIVO').Value;
    dblcMotivo.UpDate;
  end;

  bbtnProcurarClick(Self);
end;

procedure TfrmConsHistRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryMotivo.Close;
  qryParamRH.Close;
  inherited;
end;

procedure TfrmConsHistRubSal.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  dblcMotivo.Text := qryMotivo.FieldByName('DESCRICAO').asString;
  edTotProventos.Value := 0;
  edTotDescontos.Value := 0;
  dTotProventos := 0;
  dTotDescontos := 0;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    // Carrega Campos
    edFuncionario.Text := '  '+MontaSelect.ValoresChave[0];
    edMatricula.Text   := '  '+MontaSelect.ValoresChave[1];
    edTitulo.Text      := '  '+MontaSelect.ValoresChave[3];
    edEmpresa.Text     := '  '+MontaSelect.ValoresChave[4];
//    sIdEmpresa         := MontaSelect.ValoresChave[5];
    sIdPessoa          := MontaSelect.ValoresChave[6];
  end;
  AtualizaRubricas;
end;

procedure TfrmConsHistRubSal.dblcMotivoChange(Sender: TObject);
begin
  AtualizaRubricas;
end;

procedure TfrmConsHistRubSal.AtualizaRubricas;
var
  i: integer;
  sMesPagto: string;
begin
  sMesPagto := spnedAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1);

  if (sIdPessoa <> '-1') {and (sIdEmpresa <> '-1') }then
  begin
    qryProventos.Close;
    qryDescontos.Close;
    dTotProventos := 0;
    dTotDescontos := 0;

    // Rubricas de Provento
    with (qryProventos) do
    begin
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('  H.CODPROVDESC, H.MES, H.REFERENCIA, H.VALORPROVENTO, RP.DESCRPROVDESC AS DESCRICAO, PV.FLGDESCONTO');
      SQL.Add('FROM');
      SQL.Add('  ' +IFF(rgProcesso.ItemIndex=0, 'PREVIAFOLPAG', 'HISTRUBSAL')+ ' H, RUBRICAXPESS RP, PROVDESC PV');
      SQL.Add('WHERE');
      SQL.Add('  (H.IDPESSOA         = ' +sIdPessoa+ ') AND');
      SQL.Add('  (H.MES              = ' +QuotedStr(sMesPagto)+ ') AND');
      SQL.Add('  (H.IDMOTIVO         = ' +qryMotivo.FieldByName('IdMotivo').asString+ ') AND');
//      SQL.Add('  (H.IDPESSJUR        = ' +sIdEmpresa+ ') AND');
      SQL.Add('  (((PV.FLGDESCONTO   = 2)  AND ('+IntToStr(rgRubApoio.ItemIndex)+ ' = 0)) OR');
      SQL.Add('    (PV.FLGDESCONTO   = 0)) AND');
      SQL.Add('  (PV.FLGTPRUBRICA LIKE ''%F%'') AND');
      SQL.Add('  (H.IDRUBRICA        = PV.IDPROVENTO) AND');
      SQL.Add('  (RP.IDPESSOA        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      SQL.Add('  (H.IDRUBRICA        = RP.IDRUBRICA)');
      SQL.Add('ORDER BY');
      SQL.Add('  H.MES, PV.FLGDESCONTO, PV.DESCRICAO');
      Open;

      if (RecordCount = 0) then
        edTotProventos.Value := dTotProventos
      else
      begin
        First;
        for i:=1 to RecordCount do
        begin
          if (FieldByName('FLGDESCONTO').asInteger = 0) then
            dTotProventos := dTotProventos + FieldByName('VALORPROVENTO').asFloat;
          Next;
        end;
        First;
      end;
    end;

    // Rubricas de Desconto
    with (qryDescontos) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('  H.CODPROVDESC, H.MES, H.REFERENCIA, H.VALORPROVENTO, RP.DESCRPROVDESC AS DESCRICAO');
      SQL.Add('FROM');
      SQL.Add('  ' +IFF(rgProcesso.ItemIndex=0, 'PREVIAFOLPAG', 'HISTRUBSAL')+ ' H, RUBRICAXPESS RP, PROVDESC PV');
      SQL.Add('WHERE');
      SQL.Add('  (H.IDPESSOA         = ' +sIdPessoa+ ') AND');
      SQL.Add('  (H.MES              = ' +QuotedStr(sMesPagto)+ ') AND');
      SQL.Add('  (H.IDMOTIVO         = ' +qryMotivo.FieldByName('IdMotivo').asString+ ') AND');
//      SQL.Add('  (H.IDPESSJUR        = ' +sIdEmpresa+ ') AND');
      SQL.Add('  (PV.FLGDESCONTO     = 1) AND');
      SQL.Add('  (PV.FLGTPRUBRICA LIKE ''%F%'') AND');
      SQL.Add('  (H.IDRUBRICA        = PV.IDPROVENTO) AND');
      SQL.Add('  (RP.IDPESSOA        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      SQL.Add('  (H.IDRUBRICA        = RP.IDRUBRICA)');
      SQL.Add('ORDER BY');
      SQL.Add('  H.MES, PV.DESCRICAO');
      Open;

      if (RecordCount > 0) then
      begin
        First;
        for i:=1 to RecordCount do
        begin
          dTotDescontos := dTotDescontos + FieldByName('VALORPROVENTO').asFloat;
          Next;
        end;
        First;
      end;
    end;
  end;

  edTotProventos.Value := dTotProventos;
  edTotDescontos.Value := dTotDescontos;
  edTotLiquido.Value   := dTotProventos - dTotDescontos;
end;

end.
