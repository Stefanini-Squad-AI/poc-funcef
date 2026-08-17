{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÃO -------------------------------------
--------------------------------------------------------------------------------

Autor(a)..: Everson Cunha
Data......: 01/06/2020
Nº SIG....: 99768
Descricao.: Alteração na cor das caixas de totais para facilitar a visualização
--------------------------------------------------------------------------------
Pendência   : SOL 178578 KINTANA 1897389
Responsável : Monica Gonzaga
Data        : 08/01/2013
Descrição   : Criado o Campo Salario Total(edSalatioTotal)
--------------------------------------------------------------------------------}

unit fConsHistRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, checklst, Spin, MontaSelect, wwdblook, Db,
  DBTables, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, TREdit, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, fcLabel, DBClient, uCMClientDataSet, uCtrlHistPessoa, uCtrlGlobalRH, uCtrlMotivo,
  uCtrlListTerceirosRH, Wwquery;

type
  TfrmConsHistRubSal = class(TfrmSairAjuda)
    pnlInformacoes: TPanel;
    MontaSelect: TMontaSelect;
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
    CdsMotivo: TCMClientDataSet;
    CdsProventos: TCMClientDataSet;
    CdsDescontos: TCMClientDataSet;
    Label1: TLabel;
    edFuncionario: TEdit;
    Label8: TLabel;
    edCargo: TEdit;
    Label7: TLabel;
    edMatricula: TEdit;
    Label3: TLabel;
    edCCusto: TEdit;
    Label2: TLabel;
    edEmpresa: TEdit;
    bbtnProcurar: TBitBtn;
    cbxAlternativo: TCheckBox;
    Label4: TLabel;
    edSalarioTotal: TRealEdit;
    qry: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcMotivoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxAlternativoClick(Sender: TObject);
  private
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure Sel(IdPessoa: double);
  end;

var
  frmConsHistRubSal: TfrmConsHistRubSal;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmConsHistRubSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH.DbParamRH.LoadFromDb;
  cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime) - 1;
  spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime);

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA');
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO');
    if (CtrlGlobalRH.DbParamRH.FLGDOISCARGOS.AsInteger = 1) then // Cargo Alternativo
    begin
      MontaSelect.Tabelas.Add('CARGO CARGO2');
      MontaSelect.Colunas.Add('CARGO2.TITULO');
      MontaSelect.CamposChave.Add('CARGO2.TITULO');
      MontaSelect.Descricao.Add('Cargo Alternativo');
      MontaSelect.TipodeDado.Add('C');
      MontaSelect.Larguras.Add('40');
      MontaSelect.SensivelACaixa.Add('N');
      MontaSelect.Mascaras.Add('');
      Add('FUNCIONARIO.IDFUNCAO  = CARGO2.IDCARGO(+)');
    end;
  end;

  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');

  // Seleciono o motivo no PARAMRH como o Tipo de Pagamento Padrão
  if (CdsMotivo.Locate('IDMOTIVO', CtrlGlobalRH.DbParamRH.IdMotivo.asInteger, [])) then
  begin
    dblcMotivo.LookUpValue := CdsMotivo.FieldByName('IDMOTIVO').Value;
    dblcMotivo.Update;
  end;

  bbtnProcurarClick(Self);
end;

procedure TfrmConsHistRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmConsHistRubSal.dblcMotivoChange(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmConsHistRubSal.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    edFuncionario.Text := '  '+MontaSelect.ValoresChave[1];
    edMatricula.Text := MontaSelect.ValoresChave[2];
    edCargo.Text := '  '+MontaSelect.ValoresChave[3];
    edEmpresa.Text := '  '+MontaSelect.ValoresChave[4];

    dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa),
      MontaSelect.ValoresChave[5]);
    edCCusto.Text := '  '+ dmCds.Cds.FieldByName('NOME').asString;

    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
    if (CtrlGlobalRH.DbParamRH.FLGDOISCARGOS.AsInteger = 1) and (MontaSelect.ValoresChave[6] <> '') then
    begin
      cbxAlternativo.Visible := true;
      if cbxAlternativo.Checked then
        edCargo.Text := '  '+MontaSelect.ValoresChave[6];
    end
    else
      cbxAlternativo.Visible := false;
  end
  else
  if not(CdsProventos.Active) then
    Sel(-1);
end;

procedure TfrmConsHistRubSal.Sel(IdPessoa: double);
var
  rTotProventos, rTotDescontos: double;
  AnoMesCobranca: string;
  qry : TwwQuery;
begin
  // Rubricas de Provento
  CdsProventos.Data := CtrlHistPessoa.ListProventos(
    IdPessoa,
    rgProcesso.ItemIndex=0,
    rgRubApoio.ItemIndex=0,
    spnedAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
    CdsMotivo.FieldByName('IdMotivo').asInteger,
    Sistema.IdEmpresa,
    rTotProventos);

  // Rubricas de Desconto
  CdsDescontos.Data := CtrlHistPessoa.ListDescontos(
    IdPessoa,
    rgProcesso.ItemIndex=0,
    spnedAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
    CdsMotivo.FieldByName('IdMotivo').asInteger,
    Sistema.IdEmpresa,
    rTotDescontos);

  edTotProventos.Value := rTotProventos;
  edTotDescontos.Value := rTotDescontos;
  edTotLiquido.Value := rTotProventos - rTotDescontos;

  //Monica Gonzaga - SOL178578 - INICIO
  AnoMesCobranca:= spnedAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);

  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    Qry.Close;
    Qry.SQl.Clear;
    Qry.SQL.Add('SELECT VALORPROVENTO');
    Qry.SQL.Add('  FROM HISTRUBSAL');
    Qry.SQL.Add(' WHERE CODPROVDESC = ' + QuotedStr('08200'));
    Qry.SQL.Add('   AND IDPESSOA = ' + FloatToStr(IdPessoa));
    Qry.SQL.Add('   AND MESCOBRANCA = ' + QuotedStr(AnoMesCobranca));
    Qry.Open;

    if not Qry.IsEmpty then begin
      edSalarioTotal.Value :=  Qry.FieldByName('VALORPROVENTO').AsFloat;
    end
    else begin
      edSalarioTotal.Value := 0;    
    end;
  finally
    FreeAndNil(Qry);
  end;

  //Monica Gonzaga - SOL178578 - FIM

  TFloatField(CdsProventos.FieldByName('VALORPROVENTO')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDescontos.FieldByName('VALORPROVENTO')).DisplayFormat := '###,###,##0.00';
end;

procedure TfrmConsHistRubSal.cbxAlternativoClick(Sender: TObject);
begin
  inherited;
  if cbxAlternativo.Checked then
    edCargo.Text := '  '+MontaSelect.ValoresChave[6]
  else
    edCargo.Text := '  '+MontaSelect.ValoresChave[3];


end;

end.
