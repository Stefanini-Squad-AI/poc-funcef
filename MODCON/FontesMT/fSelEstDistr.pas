unit fSelEstDistr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst, wwdbdatetimepicker, DBClient,
  CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport, TREdit, OleCtrls, chartfx3,
  uCtrlCargo, uCtrlPessoaFilialPessoa, uCtrlListTerceirosRH, uCtrlPessoaSindicato,
  uCtrlProcessoTrab, uCtrlCustomProcTrab, ColorCheckListBox;

type
  TfrmSelEstDistr = class(TfrmSelProcessoMT)
    tbshGrafico: TTabSheet;
    rgValor: TRadioGroup;
    rgDistrib: TRadioGroup;
    gbxDistrib: TGroupBox;
    dblcDistrib: TwwDBLookupCombo;
    lstDistrib: TListBox;
    cbxDemais: TCheckBox;
    lstCodDistrib: TListBox;
    rgDistribPor: TRadioGroup;
    CdsDistrib: TCMClientDataSet;
    pgctrlGrafico: TPageControl;
    tbshQuantidade: TTabSheet;
    tbshCusto: TTabSheet;
    Chart1: TChartfx;
    Chart2: TChartfx;
    CdsObj: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcDistribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstDistribKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgDistribClick(Sender: TObject);
    procedure rgDistribPorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCargo: TCtrlCargo;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlCustomProcTrab: TCtrlCustomProcTrab;

    function MontarGrafico: boolean;
  end;

var
  frmSelEstDistr: TfrmSelEstDistr;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, fAguarde;

const
  NomeCampoCodigo: array[0..4] of string = ('IDCARGO', 'IDPESSOA', 'IDRAMOFORNECEDOR',
    'IDPESSOA', 'CODCENTROCUSTO');
  NomeCampoDesc: array[0..4] of string = ('TITULO', 'NOME', 'DESCRAMOFORNECEDOR',
    'NOME', 'NOME');

{$R *.DFM}

procedure TfrmSelEstDistr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  rgDistribPor.ItemIndex := 0;
  rgDistribPorClick(Sender);
  IrPaginaResult := false;
end;

procedure TfrmSelEstDistr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlCargo.Free;
  CtrlPessoaFilialPessoa.Free;
  CtrlListTerceirosRH.Free;
  CtrlPessoaSindicato.Free;
  CtrlProcessoTrab.Free;
  CtrlCustomProcTrab.Free;
  inherited;
end;

procedure TfrmSelEstDistr.lstDistribKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  SvItem: integer;
begin
  if (Key = VK_DELETE) and (lstDistrib.Items.Count > 0) then
  begin
    SvItem := lstDistrib.ItemIndex;
    lstDistrib.Items.Delete(SvItem);
    lstCodDistrib.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelEstDistr.dblcDistribCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; Modified: Boolean);
begin
  if (Modified) and (CdsDistrib.Fields[1].asString <> '') then
  begin
    lstDistrib.Items.Add(CdsDistrib.Fields[0].asString);
    lstCodDistrib.Items.Add(CdsDistrib.Fields[1].asString);
  end;
end;

procedure TfrmSelEstDistr.rgDistribClick(Sender: TObject);
begin
  gbxDistrib.Visible := (rgDistrib.ItemIndex = 1);
end;

procedure TfrmSelEstDistr.rgDistribPorClick(Sender: TObject);
begin
  lstDistrib.Clear;     
  lstCodDistrib.Clear;
  gbxDistrib.Caption := rgDistribPor.Items[rgDistribPor.ItemIndex];

  dblcDistrib.LookupTable := nil;
  dblcDistrib.LookupField := NomeCampoCodigo[rgDistribPor.ItemIndex];
  dblcDistrib.Selected.Clear;
  dblcDistrib.Selected.Add(NomeCampoDesc[rgDistribPor.ItemIndex] +#9+ '60' +#9+
    NomeCampoDesc[rgDistribPor.ItemIndex]);

  case (rgDistribPor.ItemIndex) of
    0 : CdsDistrib.Data := CtrlCargo.ListCargoXFunc;
    1 : CdsDistrib.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa);
    2 : CdsDistrib.Data := CtrlListTerceirosRH.ListRamoFornecedorDeEstabelecimento;
    3 : CdsDistrib.Data := CtrlPessoaSindicato.ListSindicatoComFuncionarios(false);
    4 : CdsDistrib.Data := CtrlListTerceirosRH.ListCCustoComFuncionarios(Sistema.IdEmpresa);
  end;
  dblcDistrib.LookupTable := CdsDistrib;
end;

procedure TfrmSelEstDistr.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  inherited;

  if not(bSelOk) then
  begin
    frmAguarde.Apaga;
    exit;
  end;

  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
      mtWarning, [mbOk, mbHelp], 0);
    exit;
  end;

  frmAguarde.Mostra('Montando Gráfico...');
  frmAguarde.Update;

  // Selecionar TODOS os elementos da Distribuição selecionada
  if (rgDistrib.ItemIndex = 0) then
  begin
    lstDistrib.Clear;
    lstCodDistrib.Clear;
    CdsDistrib.First;
    while not(CdsDistrib.EOF) do
    begin
      lstCodDistrib.Items.Add(CdsDistrib.FieldByName(NomeCampoCodigo[rgDistribPor.ItemIndex]).asString);
      lstDistrib.Items.Add(CdsDistrib.FieldByName(NomeCampoDesc[rgDistribPor.ItemIndex]).asString);
      CdsDistrib.Next;
    end;
    CdsDistrib.First;
  end;

  if (MontarGrafico) then
  begin
    pgctrlGrafico.ActivePageIndex := 0;
    ExecutarIrPaginaResult;
  end;  
end;

function TfrmSelEstDistr.MontarGrafico: boolean;
const
  TITULO1: array[1..2] of string = ('da Distribuição de Processos', 'dos Valores');
  TITULO2: array[1..2] of string = ('Total de Processos: ', 'Valor Total: ');
var
  rToVal: real;
  DataHist1, DataHist2: TDateTime;
  iTamY, iTotQtd, Ind, Ind1, Vez: integer;
  dYMax, I3, dValorReclamado, dValorReal, dValorProcesso: double;
  DescTb, DescTb1, CharVal, CharVal1, CharQtd, CharQtd1: variant;
  LstTudo, LstCod: TStringList;
begin
  Result := true;
  LstTudo := TStringList.Create;
  LstCod := TStringList.Create;

  try
    frmAguarde.Max := CdsProcesso.RecordCount;
    frmAguarde.Update;

    TITULO1[2] := 'dos Valores ' + rgValor.Items[rgValor.ItemIndex];

    iTamY := lstDistrib.Items.Count;
    if (cbxDemais.Checked) and (rgDistrib.ItemIndex = 1) then
      Inc(iTamY);

    DescTb := VarArrayCreate([1, iTamY], varOleStr);

    for Ind:=1 to iTamY do
    begin
      if (cbxDemais.Checked) and (rgDistrib.ItemIndex = 1) and (Ind = iTamY) then
        break;
      DescTb[Ind] := lstDistrib.Items[Ind-1];
    end;

    if (cbxDemais.Checked) and (rgDistrib.ItemIndex = 1) then
      DescTb[iTamY] := 'Demais ' + rgDistribPor.Items[rgDistribPor.ItemIndex];

    CharQtd := VarArrayCreate([1,iTamY], varInteger);
    CharVal := VarArrayCreate([1,iTamY], varDouble);

    for Ind:=1 to iTamY do
    begin
      CharQtd[Ind] := 0;
      CharVal[Ind] := 0;
      LstTudo.Add(DescTb[Ind]);
      if (cbxDemais.Checked) and (Ind = iTamY) and (rgDistrib.ItemIndex = 1)  then
        LstCod.Add('XXXXXX')
      else
        LstCod.Add(lstCodDistrib.Items[Ind-1]);
    end;

    CdsProcesso.First;
    while not(CdsProcesso.EOF) do
    begin
      dValorProcesso := 0;

      // Rotina para determinar o ponteiro onde vai somar
      case (rgDistribPor.ItemIndex) of
        1 :  Ind := lstCod.IndexOf(CdsProcesso.FieldByName('IDESTAB').asString) + 1;
        2 :  Ind := lstCod.IndexOf(CdsProcesso.FieldByName('IDRAMOFORNECEDOR').asString) + 1;
        3 :  Ind := lstCod.IndexOf(CdsProcesso.FieldByName('IDSINDICATO').asString) + 1;
        4 :  Ind := lstCod.IndexOf(CdsProcesso.FieldByName('CODCENTROCUSTO_1').asString) + 1;
        else Ind := lstCod.IndexOf(CdsProcesso.FieldByName('IDCARGO').asString) + 1;
      end;
    
      if (cbxDemais.Checked) and (rgDistrib.ItemIndex = 1) and (Ind = 0) then
        Ind := iTamY;

      if (Ind <= iTamY) and (iTamY > 0) and (Ind > 0) then
      begin
        CharQtd[Ind] := CharQtd[Ind] + 1;

        if (CdsProcesso.FieldByName('DATADESLIGAMENTO').asString <> '') then
          DataHist1 := StrToDate(Copy(CdsProcesso.FieldByName('DATADESLIGAMENTO').asString,1,Length(ShortDateFormat)))
        else
        if (CdsProcesso.FieldByName('DATANOTIF').asString <> '') then
          DataHist1 := StrToDate(Copy(CdsProcesso.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
        else
          DataHist1 := 0;

        if (CdsProcesso.FieldByName('DATAEFETENC').asString <> '') then
          DataHist2 := StrToDate(Copy(CdsProcesso.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)))
        else
          DataHist2 := 0;

        CdsObj.Data := CtrlProcessoTrab.ListObjeto(CdsProcesso.FieldByName('NUMPROCTRAB').asFloat);
        while not(CdsObj.EOF) do
        begin
          dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
            CdsObj.FieldByName('VALORRECL').asFloat,
            DataHist1,
            CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
            CdsProcesso.FieldByName('IDREGRA').asFloat,
            CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
            CdsProcesso.FieldByName('INDTAXACONV').asInteger);

          dValorReal := CtrlCustomProcTrab.GetValorAtual(
            CdsObj.FieldByName('VALORSENTENCA').asFloat,
            DataHist2,
            CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
            CdsProcesso.FieldByName('IDREGRA').asFloat,
            CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
            CdsProcesso.FieldByName('INDTAXACONV').asInteger);

          if (CdsProcesso.FieldByName('FLGSITPROC').asInteger = 0) then
            dValorProcesso := dValorProcesso + dValorReclamado - (rgValor.ItemIndex *
              (100 - CdsObj.FieldByName('PERCPROB').asFloat) * dValorReclamado / 100)
          else
            dValorProcesso := dValorProcesso + (1 - rgValor.ItemIndex) * dValorReclamado +
              rgValor.ItemIndex * dValorReal;

          CdsObj.Next;
        end;
        CharVal[Ind] := CharVal[Ind] + dValorProcesso;
      end;
      CdsProcesso.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
      frmAguarde.Update;
    end;

    Ind1 := 0;
    for Ind:=1 to iTamY do
      if (CharQtd[Ind] = 0) then
        Ind1 := Ind1 + 1;

    Vez := iTamY;
    iTamY := iTamY - Ind1;

    if (iTamY = 0) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
        mtWarning, [mbOk, mbHelp], 0);
      Result := false;  
      exit;
    end;

    DescTb1  := VarArrayCreate([1,iTamY], varOleStr);
    CharQtd1 := VarArrayCreate([1,iTamY], varInteger);
    CharVal1 := VarArrayCreate([1,iTamY], varDouble);

    Ind1 := 0;
    for Ind:=1 to Vez do
      if (CharQtd[Ind] > 0) then
      begin
        Inc(Ind1);
        DescTb1[Ind1] := DescTb[Ind];
        CharQtd1[Ind1] := CharQtd[Ind];
        CharVal1[Ind1] := CharVal[Ind];
      end;

    // Gráfico de Quantidades
    Chart1.OpenDataEx(1,1,iTamY);
    Chart1.ChartType := 5;

    Chart1.Decimals := 0;
    Chart1.Title[2] := 'Estatística ' + TITULO1[1];

    dYMax := 0;
    iTotQtd := 0;
    Chart1.ThisSerie := 0;
    for Ind:=0 to (iTamY-1) do
    begin
      Chart1.Value[Ind] := CharQtd1[Ind+1];
      iTotQtd := iTotQtd + CharQtd1[Ind+1];
      if (Chart1.Value[Ind] > dYMax) then
        dYMax := Chart1.Value[Ind];
    end;

    Chart1.Title[3] := TITULO2[1] + IntToStr(iTotQtd);

    I3 := 1;
    while (dYMax > I3) do
      I3 := I3*10;
    I3 := Int(I3 / 20); // Escala de Y

    Chart1.Adm[1] := dYMax; // Valor Máximo de Y
    Chart1.Adm[4] := I3;    // Escala de Y
    Chart1.CloseData(1);

    // Gráfico de Valores
    Chart2.OpenDataEx(1,1,iTamY);
    Chart2.ChartType := 5;

    for Ind:=0 to (iTamY-1) do
      Chart1.Legend[Ind] := DescTb1[Ind+1];

    for Ind:=0 to (iTamY-1) do
      Chart2.Legend[Ind] := DescTb1[Ind+1];

    Chart2.Decimals := 0;
    Chart2.Title[2] := 'Estatística ' + TITULO1[2];

    dYMax := 0;
    rToVal := 0;
    Chart2.ThisSerie := 0;
    for Ind:=0 to (iTamY-1) do
    begin
      Chart2.Value[Ind] := CharVal1[Ind+1];
      rToVal := rToVal + CharVal1[Ind+1];
      if (Chart2.Value[Ind] > dYMax) then
        dYMax := Chart2.Value[Ind];
    end;

    Chart2.Title[3] := TITULO2[2] +FloatToStrF(rToVal,ffFixed,12,2)+ ' em ' +
      IntToStr(iTotQtd)+ ' Processos';

    I3 := 1;
    while (dYMax > I3) do
      I3 := I3*10;
    I3 := int(I3 / 20); // Escala de Y

    Chart2.Adm[1] := dYMax; // Valor Máximo de Y
    Chart2.Adm[4] := I3;    // Escala de Y
    Chart2.CloseData(1);

    frmAguarde.Apaga;
  except
    Result := false;
  end;

  LstTudo.Free;
  LstCod.Free;
end;

end.
