unit fParamAdverteSuspensao;

{*******************************************************************************
Rotina...........: criação do relatório
Nº SOL...........: 193131-13143
Nº KINTANA.......: 1886157
Data da Alteração: 14/06/2013
Responsável......: Edilaine Ferraresi
Descrição........: relatório de advertências e suspensões
********************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dxCntner,
  dxExEdtr, dxEdLib, CheckLst, ColorCheckListBox, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlGlobalRH, uCtrlPessoaFuncionario, 
  uCtrlCargo, wwdblook, Db, DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa;



type
  TfrmParamAdverteSuspensao = class(TfrmParamReports_Padrao)
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelFuncTodos: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    chklstCCusto: TColorCheckListBox;
    bbtnSelCCTodos: TBitBtn;
    bbtnInverteSelCC: TBitBtn;
    pnlCargo: TPanel;
    cbxUndVinculada: TdxCheckEdit;
    rgCargos: TRadioGroup;
    cbxCargoAlter: TdxCheckEdit;
    GroupBox4: TGroupBox;
    rbDtAdv: TRadioButton;
    rbDtAto: TRadioButton;
    dblckCargo: TwwDBLookupCombo;
    CdsCargo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbDtAtoClick(Sender: TObject);
    procedure bbtnSelFuncTodosClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelCCTodosClick(Sender: TObject);
    procedure bbtnInverteSelCCClick(Sender: TObject);
    procedure rgCargosClick(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure cbxEfetivosClick(Sender: TObject);
    procedure gbxIntervRefExit(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
  private
    { Private declarations }
    sLstEstab : string;
    ListaIdFunc, ListaCodCCusto : TStringList;

    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa : TCtrlPessoaFilialPessoa;
    CtrlCargo : TCtrlCargo;

    procedure MontaListaFuncionarios;
    procedure MontaListaCentroCustos;
    function  ValidaDados : boolean;
  public
    { Public declarations }
  end;

var
  frmParamAdverteSuspensao: TfrmParamAdverteSuspensao;

implementation

uses uSistema, uMensErro, fAguarde, dCds, Mask, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;


{$R *.DFM}

procedure TfrmParamAdverteSuspensao.FormCreate(Sender: TObject);
begin
  inherited;

  ListaIdFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  dtedIni.Date := Date;
  dtedFim.Date := Date;

  // lista de cargos
  cdsCargo.Data := CtrlCargo.ListCargo();

  // lista Centros de Custos e marca todos
  MontaListaCentroCustos;
  bbtnSelCCTodos.Click;

  // lista de Funcionarios
  MontaListaFuncionarios

end;

procedure TfrmParamAdverteSuspensao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlCargo);

end;


procedure TfrmParamAdverteSuspensao.MontaListaFuncionarios;
var
  sListaSitFunc   : string;
  sListaTipoContr : string;
begin
  // Estabelecimentos selecionados
  if sLstEstab = '' then
  begin
    dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
    while not(dmCds.Cds.EOF) do
    begin
      sLstEstab := sLstEstab + dmCds.Cds.FieldByName('IDPESSOA').asString;
      dmCds.Cds.next;
      if not dmCds.Cds.eof then
         sLstEstab := sLstEstab + ', ';

    end;
  end;

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  sListaSitFunc := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked);

  sListaTipoContr := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
    cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked);

  if (sListaSitFunc <> EmptyStr) or (sListaTipoContr <> EmptyStr) then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
                      '', ''{sLstEstab}, sListaSitFunc, sListaTipoContr, '', '');

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
end;



procedure TfrmParamAdverteSuspensao.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodCCustoSel : string;
  sListaIdFuncSel    : string;
  sListaSitFuncSel   : string;
  sListaContratoSel  : String;
  sListaSitFuncExt   : string;
  sListaContratoExt  : String;
  wNum, opTipoData   : integer;
begin
  // Situação funcional extenso
  sListaSitFuncExt := FU.GerarListaSitFuncSelExt(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked);

  // Tipo de Contrato extenso
  sListaContratoExt := FU.GerarListaTipoContratoSelExt(cbxEfetivos.Checked,
    cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked);

  // Situação funcional
  sListaSitFuncSel := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked, TRUE);

  // Tipo de Contrato
  sListaContratoSel := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
    cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, TRUE);

  // Centros de Custos escolhidos
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true, true);
  if (wNum = ListaCodCCusto.Count) then
     sListaCodCCustoSel := '';

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  if rbDtAdv.checked then opTipoData := 0      // filtra pela data da Advertencia/Suspensao
                     else opTipoData := 1;     // filtra pela data do Ato

  Cmp_Padrao.ParamByName('DataInicio').asDateTime    := dtedIni.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime     := dtedFim.Date;
  Cmp_Padrao.ParamByName('SelDtAdvSusp').asInteger   := opTipoData;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString     := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaCCusto').asString     := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaSitFunc').asString    := sListaSitFuncSel;
  Cmp_Padrao.ParamByName('ListaContrato').asString   := sListaContratoSel;
  Cmp_Padrao.ParamByName('CargoAlter').asBoolean     := cbxCargoAlter.checked;
  Cmp_Padrao.ParamByName('CargoSel').asString        := dblckCargo.LookupValue;
  Cmp_Padrao.ParamByName('SitFuncExtenso').asString  := sListaSitFuncExt;
  Cmp_Padrao.ParamByName('ContratoExtenso').asString := sListaContratoExt;

  frmAguarde.Mostra('Advertências ou Suspensões');
  frmAguarde.Pos := 0;
end;


procedure TfrmParamAdverteSuspensao.rbDtAtoClick(Sender: TObject);
begin
//  dtedIni.Text := '';
//  dtedFim.Text := '';
end;

procedure TfrmParamAdverteSuspensao.bbtnSelFuncTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;


procedure TfrmParamAdverteSuspensao.bbtnInverteSelFuncClick(
  Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamAdverteSuspensao.bbtnSelCCTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmParamAdverteSuspensao.bbtnInverteSelCCClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;


procedure TfrmParamAdverteSuspensao.MontaListaCentroCustos;
var
  sMascCCusto: String;
  sCodExterno: String;
begin
  // Mascara do Centro de Custo
  dmCds.Cds.Data := FU.GetDataPacket('SELECT MASCARACC FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  dmCds.Cds.First;
  sMascCCusto := dmCds.Cds.FieldByName('MASCARACC').AsString;

  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;

  dmCds.Cds.Data := FU.GetDataPacket('SELECT ' + #13 +
                                     '  RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO, ' + #13 +
                                     '  RTRIM(NOME) AS NOME, ' + #13 +
                                     '  RTRIM(CODEXTERNO) AS CODEXTERNO, ' + #13 +
                                     '  ATIVO ' + #13 +
                                     'FROM ' + #13 +
                                     '  CENTCUST ' + #13 +
                                     'WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + #13 +
                                     '  AND NOME is not null ' + #13 +
                                     'ORDER BY CODEXTERNO, NOME');

  dmCds.Cds.FieldByName('CODEXTERNO').EditMask := sMascCCusto + ';' + MaskNoSave + '; ';
  dmCds.Cds.First;
  while not(dmCds.Cds.EOF) do
  begin
    sCodExterno := dmCds.Cds.FieldByName('CODEXTERNO').DisplayText;
    if Pos('. ', sCodExterno) > 0 then sCodExterno := Copy(sCodExterno, 1, Pos('. ', sCodExterno)-1);

    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString+'='+dmCds.Cds.FieldByName('CODEXTERNO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString + ' ' +
                           sCodExterno+
                           FU.IFF(dmCds.Cds.FieldByName('ATIVO').AsString = 'S', '', ' (Inativo)'));
    dmCds.Cds.Next;
  end;
{
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;
}  
end;


procedure TfrmParamAdverteSuspensao.rgCargosClick(Sender: TObject);
begin
  dblckCargo.Enabled := (rgCargos.ItemIndex = 1);
end;

procedure TfrmParamAdverteSuspensao.chklstCCustoClickCheck(
  Sender: TObject);
var
  c   : Integer;
  sCC : String;
begin
  if chklstCCusto.Checked[chklstCCusto.ItemIndex] then
  begin
    if (cbxUndVinculada.Checked) then
    begin
      sCC := Trim(ListaCodCCusto.Values[ListaCodCCusto.Names[chklstCCusto.ItemIndex]]);
      for c := 0 to chklstCCusto.Items.Count-1 do
        if (Length(ListaCodCCusto.Values[ListaCodCCusto.Names[c]]) > Length(sCC)) and (Copy(ListaCodCCusto.Values[ListaCodCCusto.Names[c]],1,Length(sCC)) = sCC) then
          chklstCCusto.Checked[c] := True;
    end;  
    chklstCCusto.Repaint;
  end;
end;

function TfrmParamAdverteSuspensao.ValidaDados : boolean;
begin
  result := true;
  
  if (dtedIni.Text = '') or (dtedFim.Text = '') then
  begin
    MsgDlg ('Obrigatório o preenchimento dos campos De e Até.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    gbxIntervRef.SetFocus;
    result := false;
  end;

  if (Result) and (dtedIni.date > dtedFim.date) then
  begin
    MsgDlg ('A data no campo DE não pode ser maior que a data no campo ATÉ.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedIni.SetFocus;
    result := false;
  end;

  if not(cbxEfetivos.Checked)       and not (cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not (cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not (cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked)    and (Result) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
    result := false;
  end;

  if (Result) and not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
    result := false;
  end;
end;

procedure TfrmParamAdverteSuspensao.cbxEfetivosClick(Sender: TObject);
begin
  MontaListaFuncionarios();
end;

procedure TfrmParamAdverteSuspensao.gbxIntervRefExit(Sender: TObject);
begin
  ValidaDados();
end;

procedure TfrmParamAdverteSuspensao.gbxTipContraExit(Sender: TObject);
begin
  ValidaDados();
end;

procedure TfrmParamAdverteSuspensao.gbxSituacaoExit(Sender: TObject);
begin
  ValidaDados();
end;

end.
