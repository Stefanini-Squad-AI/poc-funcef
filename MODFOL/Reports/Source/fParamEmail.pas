unit fParamEmail;

{*******************************************************************************
Rotina...........: criação do relatório
Nº WO ...........: 11539
Data da Alteração: 14/06/2013 
Responsável......: Helen V Bianchi
Descrição........: Relatório Email pessoal, corporativo e demais dados
********************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dxCntner,
  dxExEdtr, dxEdLib, CheckLst, ColorCheckListBox, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlGlobalRH,  wwdblook, Db, DBClient, uCMClientDataSet,
  uCtrlPessoaFuncionario;



type
  TfrmParamEmail = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxIntervDem: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure cbxDemitidosClick(Sender: TObject);
  private
    { Private declarations }
    ListaIdFunc : TStringList;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    function  ValidaDados : boolean;
    procedure MontaListaFuncionarios;

  public
    { Public declarations }
  end;

var
  frmParamEmail: TfrmParamEmail;
  bSitAtivo, bSitAfast, bSitDemit: boolean;
implementation

uses uSistema, uMensErro, fAguarde, dCds, Mask, uCtrlPadroes, uCtrlFuncoesRH,uCtrlUsoGeralRH;


{$R *.DFM}

procedure TfrmParamEmail.FormCreate(Sender: TObject);
begin
  inherited;
 CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;

  dtedIni.Date := Date;
  dtedFim.Date := Date;

  // lista de Funcionarios
  MontaListaFuncionarios;
end;

procedure TfrmParamEmail.bbtnConfirmarClick(Sender: TObject);
var
  wNum, opTipoData   : integer;
  sListaIdFuncSel    : string;
  sListaSitFuncSel   : string;
begin
   if not(ValidaDados) then
      exit;
   // Situação funcional
  sListaSitFuncSel := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked, TRUE);

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  if cbxDemitidos.Checked then
  begin
    Cmp_Padrao.ParamByName('DataInicio').asDateTime    := dtedIni.Date;
    Cmp_Padrao.ParamByName('DataFinal').asDateTime     := dtedFim.Date;
  end
  else
  begin
    Cmp_Padrao.ParamByName('DataInicio').asDateTime    := 0;
    Cmp_Padrao.ParamByName('DataFinal').asDateTime     := 0;
  end;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString     := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaSitFunc').asString    := sListaSitFuncSel;

  frmAguarde.Mostra('Gerando Relatório Email pessoal e corporativo');
  frmAguarde.Pos := 0;
end;

function TfrmParamEmail.ValidaDados : boolean;
begin
  result := true;
  if cbxDemitidos.Checked then
  begin
      if (dtedIni.Text = '') or (dtedFim.Text = '') then
      begin
        MsgDlg ('Obrigatório o preenchimento dos campos De e Até.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        gbxIntervDem.SetFocus;
        result := false;
        exit;
      end;

      if (Result) and (dtedIni.date > dtedFim.date) then
      begin
        MsgDlg ('A data no campo DE não pode ser maior que a data no campo ATÉ.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        dtedIni.SetFocus;
        result := false;
        exit;
      end;
  end;
  if (Result) and not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
    result := false;
    exit;
  end;
end;

procedure TfrmParamEmail.gbxSituacaoEnter(Sender: TObject);
begin
  inherited;
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamEmail.gbxSituacaoExit(Sender: TObject);
begin
  inherited;
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end ;
 { else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;     }
end;
procedure TfrmParamEmail.MontaListaFuncionarios;
var
   sListaSitFunc   : string;
begin

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  sListaSitFunc := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked);


  if (sListaSitFunc <> EmptyStr)  then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
                      '', ''{sLstEstab}, sListaSitFunc, '', '', '');

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  //HabilitaBtOk;
end;

procedure TfrmParamEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ListaIdFunc);
  FreeAndNil(CtrlPessoaFuncionario);
end;

procedure TfrmParamEmail.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamEmail.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;

end;

procedure TfrmParamEmail.cbxDemitidosClick(Sender: TObject);
begin
  inherited;
  if cbxDemitidos.Checked then
     gbxIntervDem.Visible := true
  else
     gbxIntervDem.Visible := False;

end;

end.
