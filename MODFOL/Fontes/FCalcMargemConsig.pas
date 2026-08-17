unit FCalcMargemConsig;
//**************************************************************************************
//Nº SOL...........: 214659
//Nº KINTANA.......: 2042762
//Data da Alteração: 21/08/2013
//Responsável......: Felipe A. Santos
//Descrição........: Correção do mês, estáva passando um zero que não precisava na
//                   consulta do relatório para o de Outubro até Dezembro.   
//**************************************************************************************
//Nº SOL...........: 192084
//Nº KINTANA.......: 1945985
//Data da Alteração: 13/06/2013
//Responsável......: Felipe A. Santos
//Descrição........: Criação da funcionalidade
//**************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, ImgList, ComCtrls, CheckLst,
  ColorCheckListBox, MontaSelect, uCtrlProvDesc, dCds, USistema, uCtrlPadroes, uCtrlFuncoesRH,
  uCtrlGlobalRH, IniFiles, UMensErro, CmParamReport, RCalcMargemConsig,
  FPreview;

type
  TfrmCalcMargemConsig = class(TfrmSairAjuda)
    rbtnGerar: TBitBtn;
    lblMatricula: TLabel;
    lblNome: TLabel;
    edtMatricula: TEdit;
    btnProcurar: TBitBtn;
    grpMesComp: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    edtNome: TEdit;
    pgctrlRubricas: TPageControl;
    tbshRemuneracao: TTabSheet;
    tbshDeducoes: TTabSheet;
    tbshDescontosFacul: TTabSheet;
    lblProcurarRub: TLabel;
    edtCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    pnlSeperacao: TPanel;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    chklstRubrica0: TColorCheckListBox;
    chklstRubrica1: TColorCheckListBox;
    bbtnSelTodos02: TBitBtn;
    bbtnInverteSel02: TBitBtn;
    chklstRubrica2: TColorCheckListBox;
    bbtnSelTodos03: TBitBtn;
    bbtnInverteSel03: TBitBtn;
    msFunc: TMontaSelect;
    cmpCalcMC: TCmParamReport;
    Label1: TLabel;
    procedure SelTodos(sender : TObject);
    procedure InvertSel(sender : TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure chklstRubrica0ClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure chklstRubrica2ClickCheck(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlProvDesc : TCtrlProvDesc;
    CtrlGlobalRH : TCtrlGlobalRH;
    ListaIdRubrica0, ListaIdRubrica1, ListaIdRubrica2 : TStringList;
    ListaIdRubricaSel : array[0..2] of string;
    ListaIdRubricaSelPliques: array[0..2] of string;
    IdPessoa, CodCentroCusto : string;
    procedure GravarRubricas;
    procedure LerRubricas;
    function ValidaCampos : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcMargemConsig: TfrmCalcMargemConsig;

implementation

{$R *.DFM}

{ TfrmCalcMargemConsig }

procedure TfrmCalcMargemConsig.InvertSel(sender: TObject);
var
   i : integer;
begin
  // Remuneração
  if TComponent(Sender).Name = 'bbtnInverteSel' then
  begin
       for i := 0 to chklstRubrica0.Items.Count - 1 do
       begin
            if not(chklstRubrica0.Checked[i]) then
               chklstRubrica0.Checked[i] := True
            else
               chklstRubrica0.Checked[i] := False;
       end;
       FU.CriaListaOpcoes(chklstRubrica0,ListaIdRubrica0, ListaIdRubricaSel[0], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[0];
       chklstRubrica0.Repaint;
  end
  // Deduções
  else if TComponent(Sender).Name = 'bbtnInverteSel02' then
  begin
       for i := 0 to chklstRubrica1.Items.Count - 1 do
       begin
            if not(chklstRubrica1.Checked[i]) then
               chklstRubrica1.Checked[i] := True
            else
               chklstRubrica1.Checked[i] := False;
       end;
       FU.CriaListaOpcoes(chklstRubrica1,ListaIdRubrica1, ListaIdRubricaSel[1], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[1];
       chklstRubrica1.Repaint;
  end
  // Descontos Facultativos
  else
  begin
       for i := 0 to chklstRubrica2.Items.Count - 1 do
       begin
            if not(chklstRubrica2.Checked[i]) then
               chklstRubrica2.Checked[i] := True
            else
               chklstRubrica2.Checked[i] := False;
       end;
       FU.CriaListaOpcoes(chklstRubrica2,ListaIdRubrica2, ListaIdRubricaSel[2], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[2];
       chklstRubrica2.Repaint;
  end;
end;

procedure TfrmCalcMargemConsig.SelTodos(sender: TObject);
var
   i : integer;
begin
  // Remuneração
  if TComponent(Sender).Name = 'bbtnSelTodos' then
  begin
       for i := 0 to chklstRubrica0.Items.Count - 1 do
       begin
            if not(chklstRubrica0.Checked[i]) then
               chklstRubrica0.Checked[i] := True;
       end;
       FU.CriaListaOpcoes(chklstRubrica0,ListaIdRubrica0, ListaIdRubricaSel[0], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[0];
       chklstRubrica0.Repaint;
  end
  // Deduções
  else if TComponent(Sender).Name = 'bbtnSelTodos02' then
  begin
       for i := 0 to chklstRubrica1.Items.Count - 1 do
       begin
            if not(chklstRubrica1.Checked[i]) then
               chklstRubrica1.Checked[i] := True;
       end;
       FU.CriaListaOpcoes(chklstRubrica1,ListaIdRubrica1, ListaIdRubricaSel[1], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[1];
       chklstRubrica1.Repaint;
  end
  // Descontos Facultativos
  else
  begin
       for i := 0 to chklstRubrica2.Items.Count - 1 do
       begin
            if not(chklstRubrica2.Checked[i]) then
               chklstRubrica2.Checked[i] := True;
       end;
       FU.CriaListaOpcoes(chklstRubrica2,ListaIdRubrica2, ListaIdRubricaSel[2], ',', false);
       edtCodRubricas.Text := ListaIdRubricaSel[2];
       chklstRubrica2.Repaint;
  end;

end;

procedure TfrmCalcMargemConsig.btnProcurarClick(Sender: TObject);
begin
  inherited;
  msFunc.Executar;

  if msFunc.RetornouValor then
  begin
       edtMatricula.Text :=  msFunc.ValoresChave[1];
       edtNome.Text := msFunc.ValoresChave[0];
       IdPessoa := msFunc.ValoresChave[5];
       CodCentroCusto := msFunc.ValoresChave[6];

       rbtnGerar.Enabled := True;
  end;

  edtMatricula.SetFocus;

end;

procedure TfrmCalcMargemConsig.FormCreate(Sender: TObject);
var
   NormalIni : TDate;
begin
  inherited;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaIdRubrica0 := TStringList.Create;
  ListaIdRubrica1 := TStringList.Create;
  ListaIdRubrica2 := TStringList.Create;

  rptCalcMargemConsig := TrptCalcMargemConsig.Create(self);

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // preencher o chklst remuneração
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa),-1,'',-1);
  dmCds.Cds.First;
  while not(dmCds.Cds.Eof) do
  begin
       ListaIdRubrica0.Add(dmCds.Cds.FieldByName('CODPROVDESC').AsString);
       chklstRubrica0.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
       dmCds.Cds.Next;
  end;

  // preencher o chklst deduções
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa),-1,'',-1);
  dmCds.Cds.First;
  while not(dmCds.Cds.Eof) do
  begin
       ListaIdRubrica1.Add(dmCds.Cds.FieldByName('CODPROVDESC').AsString);
       chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
       dmCds.Cds.Next;
  end;

  // preencher o chklst descontos facultativos
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa),-1,'',-1);
  dmCds.Cds.First;
  while not(dmCds.Cds.Eof) do
  begin
       ListaIdRubrica2.Add(dmCds.Cds.FieldByName('CODPROVDESC').AsString);
       chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
       dmCds.Cds.Next;
  end;

  LerRubricas;

end;

procedure TfrmCalcMargemConsig.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(ListaIdRubrica0);
  FreeAndNil(ListaIdRubrica1);
  FreeAndNil(ListaIdRubrica2);
  FreeAndNil(rptCalcMargemConsig);
  inherited;
end;

procedure TfrmCalcMargemConsig.sbtnMarcarRubClick(Sender: TObject);
var
   CheckListBox : TColorCheckListBox;
   ListaRubricas : TStringList;
begin
  inherited;

  CheckListBox := TColorCheckListBox(
    Self.FindComponent('chklstRubrica'+IntToStr(pgctrlRubricas.ActivePageIndex)));

  case pgctrlRubricas.ActivePageIndex of
         0 : ListaRubricas := ListaIdRubrica0;
         1 : ListaRubricas := ListaIdRubrica1;
         2 : ListaRubricas := ListaIdRubrica2;
  end;

  edtCodRubricas.Text := Trim(edtCodRubricas.Text);
  FU.VerificaOpcoes(CheckListBox, ListaRubricas, edtCodRubricas.Text, ',');
  ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex] := edtCodRubricas.Text;
  CheckListBox.Repaint;

end;

procedure TfrmCalcMargemConsig.pgctrlRubricasChange(Sender: TObject);
begin
  inherited;
  edtCodRubricas.Text := ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex];
end;

procedure TfrmCalcMargemConsig.GravarRubricas;
var
  ArqConfig  : TIniFile;
  i : integer;
begin

  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');

  for i := 0 to 2 do
  begin
     ArqConfig.WriteString('CALCMARGEMCONSIG','Rubricas' +IntToStr(i), ListaIdRubricaSel[i]);
  end;
end;

procedure TfrmCalcMargemConsig.LerRubricas;
var
  ArqConfig  : TIniFile;
  i : integer;
  CheckListBox: TColorCheckListBox;
  ListaRubricas : TStringList;
begin

  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');

  for i := 0 to 2 do
  begin
    CheckListBox := TColorCheckListBox(Self.FindComponent('chklstRubrica' + IntToStr(i)));

    case i of
         0 : ListaRubricas := ListaIdRubrica0;
         1 : ListaRubricas := ListaIdRubrica1;
         2 : ListaRubricas := ListaIdRubrica2;
    end;

    ListaIdRubricaSel[i] := ArqConfig.ReadString('CALCMARGEMCONSIG','Rubricas' +IntToStr(i), '');
    edtCodRubricas.Text := ListaIdRubricaSel[i];
    FU.VerificaOpcoes(CheckListBox, ListaRubricas, edtCodRubricas.Text, ',');
  end;

end;

procedure TfrmCalcMargemConsig.chklstRubrica0ClickCheck(Sender: TObject);
begin

  FU.CriaListaOpcoes(chklstRubrica0, ListaIdRubrica0, ListaIdRubricaSel[0], ',', false);
  edtCodRubricas.Text := ListaIdRubricaSel[0];
end;

procedure TfrmCalcMargemConsig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GravarRubricas;
end;

procedure TfrmCalcMargemConsig.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;

  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica1, ListaIdRubricaSel[1], ',', false);
  edtCodRubricas.Text := ListaIdRubricaSel[1];
end;

procedure TfrmCalcMargemConsig.chklstRubrica2ClickCheck(Sender: TObject);
begin
  inherited;

  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica2, ListaIdRubricaSel[2], ',', false);
  edtCodRubricas.Text := ListaIdRubricaSel[2];
end;

function TfrmCalcMargemConsig.ValidaCampos: boolean;
begin
  result := False;

  if (edtNome.Text = '') then
  begin
       MsgDlg('Selecione um empregado.', 'informação',mtInformation,[mbOk],0);
       btnProcurar.SetFocus;
       Exit;
  end
  else if (cmbMes.Text = '') then
  begin
       MsgDlg('Informe o mês de competência', 'informação',mtInformation,[mbOk],0);
       cmbMes.SetFocus;
       Exit;
  end;

  result := True;
  
end;

procedure TfrmCalcMargemConsig.rbtnGerarClick(Sender: TObject);
var
   i : integer;
   CheckListBox : TColorCheckListBox;
   ListaRubricas : TStringList;
begin
  inherited;

  if not(ValidaCampos) then
     Exit;

   // Lista de Parâmetros
   {
   0 - Matrícula
   1 - Nome
   2 - Mês (competencia)
   3 - Ano
   4 - Idpessoa
   5 - Mes/Ano
   6 - CodCentroCusto
   }

   // coloca o pliques('') no cod das rubricas selecionadas
   for i := 0 to 2 do
   begin
        CheckListBox := TColorCheckListBox(Self.FindComponent('chklstRubrica' + intToStr(i)));
        case i of
          0 : ListaRubricas := ListaIdRubrica0;
          1 : ListaRubricas := ListaIdRubrica1;
          2 : ListaRubricas := ListaIdRubrica2;
        end;
        FU.CriaListaOpcoes(CheckListBox, ListaRubricas, ListaIdRubricaSelPliques[i],',',True);
        if Trim(ListaIdRubricaSelPliques[i]) = '' then
           ListaIdRubricaSelPliques[i] := QuotedStr('-1');
   end;

   cmpCalcMC.ParamValues[0].AsString := edtMatricula.Text;
   cmpCalcMC.ParamValues[1].AsString := edtNome.Text;

   if (cmbMes.ItemIndex + 1 < 10) then // Felipe A. Santos SOL 214659 KTN 2042762
      cmpCalcMC.ParamValues[2].AsString := '0' + IntToSTr(cmbMes.ItemIndex + 1)
   else
      cmpCalcMC.ParamValues[2].AsString := IntToSTr(cmbMes.ItemIndex + 1);

   cmpCalcMC.ParamValues[3].AsString := speAno.Text;
   cmpCalcMC.ParamValues[4].AsString := IdPessoa;
   cmpCalcMC.ParamValues[5].AsString := UpperCase(cmbMes.Text + '/' + speAno.Text);
   cmpCalcMC.ParamValues[6].AsString := CodCentroCusto;

   rptCalcMargemConsig.Parametros := cmpCalcMC;

   // abri todas as querys to relatórios passando as rubricas selecionadas
   rptCalcMargemConsig.AbrirQueriesRelat(ListaIdRubricaSelPliques);

   TFrmPreview.CreateModalPreview(Application,rptCalcMargemConsig.rpCalcMC, 'Cálculo da Margem Consignável - 30%');
end;

procedure TfrmCalcMargemConsig.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlRubricas.ActivePageIndex := 0; 
  edtCodRubricas.Text := ListaIdRubricaSel[0];
end;

end.






