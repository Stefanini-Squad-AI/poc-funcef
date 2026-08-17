unit fConsOrcamPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  Mask, DBCtrls, OleCtrls, chartfx3, MontaSelect, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TB97, TB97Ctls, DBClient, uCMClientDataSet,
  uCtrlGrupFunc, uCtrlPessoaFilialPessoa, uCtrlCargo, uCtrlOrcamPessoal, uCtrlListTerceirosRH,
  CheckLst, ColorCheckListBox, ComCtrls, Spin;

type
  TfrmConsOrcamPessoal = class(TfrmSairAjuda)
    Panel2: TPanel;
    dsOrcamPessoal: TwwDataSource;
    MontaSelect: TMontaSelect;
    dbgrOrcam: TwwDBGrid;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlGrid: TPanel;
    pnlGrafico: TPanel;
    CdsOrcamPessoal: TCMClientDataSet;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstCargo: TColorCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    Chart1: TChartfx;
    Toolbar972: TToolbar97;
    sbtnImprimirRel: TSpeedButton;
    gbxAno: TGroupBox;
    speAno: TSpinEdit;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure sbtnImprimirRelClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCargo: TCtrlCargo;
    CtrlOrcamPessoal: TCtrlOrcamPessoal;

    chkListAux: TColorCheckListBox;
    ListaCodCCusto, ListaIdCargo, ListaIdEstab: TStringList;

    sListaIdEstabSel, sListaCodCCustoSel, sListaIdCargoSel: string;

  end;

var
  frmConsOrcamPessoal: TfrmConsOrcamPessoal;

implementation

uses uSistema, uMensErro, dCds, fAguarde, uCtrlPadroes, uCtrlUsoGeralRH,
     uCtrlFuncoesRH, ROrcamQuantPess;

{$R *.DFM}

procedure TfrmConsOrcamPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdCargo := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Centros de Custo
  chklstCCusto.Items.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Cargos
  chklstCargo.Items.Clear;
  dmCds.Cds.Data := CtrlCargo.ListCargo;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  CtrlOrcamPessoal := TCtrlOrcamPessoal.Create;
  CtrlOrcamPessoal.InitializeAs(Padroes);

  Chart1.Visible := false;
  Chart1.SendToBack;

  speAno.Value := FU.ExtraiAno(Date);
  pgctrlEmpregadosChange(nil);
end;

procedure TfrmConsOrcamPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlOrcamPessoal);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdCargo);
  inherited;
end;

procedure TfrmConsOrcamPessoal.bbtnConfirmarClick(Sender: TObject);
const
  DescSer: array[1..2] of string = ('Orçado', 'Realizado/Projetado');
var
  YMax, I3: double;
  I, I1, I2, Tam, TamY: integer;
  CharHor: variant;
begin
  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  // Cargos escolhidos
  FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  dbgrOrcam.Visible := false;
  Chart1.Visible := false;
  Chart1.SendToBack;

  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Update;
  CdsOrcamPessoal.Data := CtrlOrcamPessoal.ContaOrcamPessoal(
    sListaIdEstabSel, sListaCodCCustoSel, sListaIdCargoSel,
    Sistema.IdEmpresa, speAno.Value,
    '', //FU.GerarListaSitFuncSel(true, true, true),
    FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
    cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
    cbxAutonomos.Checked, cbxEstagiarios.Checked));

  frmAguarde.Mostra('Gerando Gráfico...');
  frmAguarde.Update;

  // Preenche os Dados do Gráfico
  Tam := 0;
  while not(CdsOrcamPessoal.EOF) do
  begin
    Inc(Tam);
    CdsOrcamPessoal.Next;
  end;
  CdsOrcamPessoal.First;

  if (Tam > 0) then
  begin
    TamY := 2;
    CharHor := VarArrayCreate([1, TamY, 1, Tam], varInteger);
    for I1:=1 to TamY do
      for I2:=1 to Tam do
        CharHor[I1,I2] := 0;

    I1 := 0;
    while not(CdsOrcamPessoal.EOF) do
    begin
      Inc(I1);
      CharHor[1, I1] := CdsOrcamPessoal.FieldByName('ORCADO').asInteger;
      CharHor[2, I1] := CdsOrcamPessoal.FieldByName('REALIZADO').asInteger;
      CdsOrcamPessoal.Next;
    end;

    CdsOrcamPessoal.First;
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
  dbgrOrcam.Visible := true;
  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;  
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmConsOrcamPessoal.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
end;

procedure TfrmConsOrcamPessoal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
end;

procedure TfrmConsOrcamPessoal.pgctrlEmpregadosChange(Sender: TObject);
begin
  inherited;
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,1,2]);
  bbtnInverteSel.Visible := (pgctrlEmpregados.ActivePageIndex in [0,1,2]);

  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstCargo;
    1 : chkListAux := chklstCCusto;
    2 : chkListAux := chklstEstab;
  end;
end;

procedure TfrmConsOrcamPessoal.sbtnImprimirRelClick(Sender: TObject);
var
  Rpt: TRptOrcamQuantPess;
begin
  frmAguarde.Mostra('Gerando Relatório...');
  
  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  // Cargos escolhidos
  FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  Rpt := TRptOrcamQuantPess.Create(Application);

  Rpt.sCusto := sListaCodCCustoSel;
  Rpt.sEstab := sListaIdEstabSel;
  Rpt.sCargo := sListaIdCargoSel;
  Rpt.bEfet  := cbxEfetivos.Checked;
  Rpt.bEspc  := cbxEspeciais.Checked;
  Rpt.bTemp  := cbxTemporarios.Checked;
  Rpt.bEstg  := cbxEstagiarios.Checked;
  Rpt.bTerc  := cbxTerceiros.Checked;
  Rpt.bProp  := cbxPropDirSemVinc.Checked;
  Rpt.bAuto  := cbxAutonomos.Checked;
  Rpt.bAfst  := true;
  Rpt.sAno   := IntToStr(speAno.Value);
  Rpt.IdEmpresa := Sistema.IdEmpresa;

  //Rpt.CrmRptCMBeforePrint(Sender);
  Rpt.CrmRptCM.IdReports := 4132;
  Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  Rpt.CrmRptCM.OrigemCM := 1;
  Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
  Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  Rpt.CrmRptCM.Print;
  FreeAndNil(Rpt);
end;

end.
