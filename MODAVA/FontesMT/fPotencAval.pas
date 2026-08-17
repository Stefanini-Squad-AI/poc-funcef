unit fPotencAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  Mask, DBCtrls, OleCtrls, chartfx3, MontaSelect, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TB97, TB97Ctls, DBClient, uCMClientDataSet,
  uCtrlGrupFunc, uCtrlPessoaFuncionario, uCtrlCargo, uCtrlRegDesemp;

type
  TfrmPotencAval = class(TfrmSairAjuda)
    Panel2: TPanel;
    dsEmpregado: TwwDataSource;
    dsAvaliacao: TwwDataSource;
    sbtnProcurar: TSpeedButton;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    edDataInicial: TCMDateTimePicker;
    edDataFinal: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    dbedMatric: TDBEdit;
    dbedNome: TDBEdit;
    dsCargo: TwwDataSource;
    dbedSitFunc: TDBEdit;
    dbedCargo: TDBEdit;
    gbxPotenc: TGroupBox;
    dblckGrupo: TwwDBLookupCombo;
    Chart1: TChartfx;
    MontaSelect: TMontaSelect;
    dbgrAval: TwwDBGrid;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlGrid: TPanel;
    pnlGrafico: TPanel;
    CdsGrupo: TCMClientDataSet;
    CdsEmpregado: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsAvaliacao: TCMClientDataSet;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGrupFunc: TCtrlGrupFunc;
    CtrlCargo: TCtrlCargo;
    CtrlRegDesemp: TCtrlRegDesemp;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure Sel(IdPessoa: double);
  end;

var
  frmPotencAval: TfrmPotencAval;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmPotencAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlRegDesemp := TCtrlRegDesemp.Create;
  CtrlRegDesemp.InitializeAs(Padroes);

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

    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  CdsGrupo.Data := CtrlGrupFunc.ListGrupoFunc;

  edDataInicial.Date := (Date - 3652);
  edDataFinal.Date := Date;
  Chart1.Visible := false;
  Chart1.SendToBack;

  dblckGrupo.LookupValue := CdsGrupo.FieldByName('CODGRPFUNC').asString;
  dblckGrupo.Update;
end;

procedure TfrmPotencAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrupFunc);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlRegDesemp);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmPotencAval.sbtnProcurarClick(Sender: TObject);
begin
  Chart1.SendToBack;
  Chart1.Visible := false;
  dbgrAval.Visible := false;
  sbtnProcurar.Down := false;

  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmPotencAval.bbtnConfirmarClick(Sender: TObject);
const
  DescSer: array[1..2] of string = ('Avaliação', 'Potencial');
var
  YMax, I3: double;
  I, I1, I2, Tam, TamY: integer;
  CharHor: variant;
begin
  dbgrAval.Visible := false;
  Chart1.Visible := false;
  Chart1.SendToBack;

  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Update;
  CdsAvaliacao.Data := CtrlRegDesemp.ListRegDesempPotencial(
    CdsEmpregado.FieldByName('IDPESSOA').asFloat, CdsGrupo.FieldByName('CODGRPFUNC').asString,
    edDataInicial.Date, edDataFinal.Date);

  frmAguarde.Mostra('Gerando Gráfico...');
  frmAguarde.Update;

  // Preenche os Dados do Gráfico
  Tam := 0;
  while not(CdsAvaliacao.EOF) do
  begin
    Inc(Tam);
    CdsAvaliacao.Next;
  end;
  CdsAvaliacao.First;

  if (Tam > 0) then
  begin
    TamY := 2;
    CharHor := VarArrayCreate([1, TamY, 1, Tam], varInteger);
    for I1:=1 to TamY do
      for I2:=1 to Tam do
        CharHor[I1,I2] := 0;

    I1 := 0;
    while not(CdsAvaliacao.EOF) do
    begin
      Inc(I1);
      CharHor[1, I1] := CdsAvaliacao.FieldByName('AVALIACAO').asInteger;
      CharHor[2, I1] := CdsAvaliacao.FieldByName('POTENCIAL').asInteger;
      CdsAvaliacao.Next;
    end;

    CdsAvaliacao.First;
    Chart1.ChartType := 1;
    Chart1.Decimals := 0;
    Chart1.OpenDataEx(1, 2, Tam);

    Ymax := 0;
    for I1:=0 to TamY-1 do
    begin
      Chart1.ThisSerie := I1;
      Chart1.SerLeg[I1] := DescSer[I1+1];

      for I:=0 to Tam-1 do
      begin
        Chart1.Value[I] := CharHor[I1+1,I+1];

        if (Chart1.Value[I] > Ymax) then
          Ymax := Chart1.Value[I];
      end;
    end;

    I3 := 1;
    while (Ymax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20); // Escala de Y
    Chart1.Adm[1] := Ymax; // Valor Máximo de Y
    Chart1.Adm[4] := I3; // Escala de Y
    Chart1.CloseData(1); // Fecha o canal VALUES
    Chart1.Visible := true;
    Chart1.BringToFront;
  end;
  dbgrAval.Visible := true;
  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;  
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmPotencAval.Sel(IdPessoa: double);
begin
  CdsEmpregado.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
    'F.IDPESSOA, F.MATRICULA, P.NOME, ST.DESCRICAO AS SITUACAO, F.IDCARGO');
  CdsCargo.Data := CtrlCargo.ListCargo(CdsEmpregado.FieldByName('IDCARGO').asFloat);
end;

end.
