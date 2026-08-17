// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFichaReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, Mask,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Spin, Wwdatsrc, uGImp, wwdblook,
  checklst, TREdit, IvDictio, IvMulti, IvEMulti, IniFiles, ComCtrls, fSairAjuda, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet, uCtrlParamFichaReg, uCtrlGlobalRH,
  uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmParamFichaReg = class(TfrmSairAjuda)
    btImprimir: TBitBtn;
    svdlgDialogo: TOpenDialog;
    GImp: TGImp;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgNomeEmpresa: TRadioGroup;
    ToolbarSep971: TToolbarSep97;
    CdsEstab: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImprimirClick(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlParamFichaReg: TCtrlParamFichaReg;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaIdFunc, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure Progresso(Arg: array of variant);
  end;

var
  frmParamFichaReg: TfrmParamFichaReg;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFichaReg.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  ListaIdFunc := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlParamFichaReg := TCtrlParamFichaReg.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamFichaReg.InitializeAs(Padroes);
  CtrlParamFichaReg.Progresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  // Preenche ChkList de Estabelecimentos
  c := 0;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(CdsEstab.EOF) do
  begin
    ListaIdEstab.Add(CdsEstab.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    CdsEstab.Next;
    Inc(c);
  end;

  dtedDataRef.Date := CtrlGlobalRH.GetNormalIni;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);

  FreeAndNil(CtrlParamFichaReg);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamFichaReg.dtedDataRefChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaReg.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.btImprimirClick(Sender: TObject);
var
  Arq: TStringList;
  FileName, sListaIdFuncSel: string;
begin
  FileName := Sistema.TempDir+'CmImpFolha.TXT';

  if (GImp.Inicializar) then
  begin
    GImp.EjetarPagina := false;
    GImp.SaltodeLinhaCondensado := false;
    GImp.TipoFonte := TfNormal;
    GImp.Condensado := true;
    GImp.Sublinhado := false;

    Arq := TStringList.Create;

    FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

    try
      frmAguarde.Mostra('Preparando dados...');
      frmAguarde.Pos := 0;

      CtrlParamFichaReg.CreateThreadProgresso;
      Arq.Text := FU.ConverteCar(CtrlParamFichaReg.GerarDadosImpressao(
        sListaIdEstabSel, sListaIdFuncSel,
        rgNomeEmpresa.ItemIndex = 1));
      CtrlParamFichaReg.FreeThreadProgresso;

      frmAguarde.Apaga;
      if (Arq.Text = '') then
        MsgDlg('Não há dados a serem impressos.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
      else
      begin
        Arq.SaveToFile(FileName);
        frmAguarde.Mostra('Imprimindo dados...');
        GImp.ImprimirArquivo(FileName);
        GImp.Finalizar;
        DeleteFile(FileName);
        frmAguarde.Apaga;
        MsgDlg('Dados impressos com sucesso.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      end;
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        GImp.Finalizar;
        MsgDlg('Ocorreu um Erro ao Imprimir'+CR_LF+
          'Verifique a Impressora e tente novamente.'+CR_LF+
          'Erro:'+CR_LF+CR_LF+E.Message, 'Erro', mtError, [mbOk, mbHelp], 0);
      end;
    end;
    Arq.Free;
  end;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamFichaReg.Progresso(Arg: array of variant);
begin
  if (Arg[0] <> 0) then
  begin
    //CtrlParamFichaReg.SQL.SaveToFile('C:\QRY.TXT');
    CtrlParamFichaReg.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    frmAguarde.Min := 0;
    frmAguarde.Max := Arg[0];
  end
  else
    frmAguarde.Pos := frmAguarde.Pos + 1;

  frmAguarde.Update;
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmParamFichaReg.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '',
      sListaIdEstabSel, 'A,F', '', '', '',
      FU.RetornaAnoMes(dtedDataRef.Date));

    while not(CdsFunc.EOF) do
    begin
      ListaIdFunc.Add(CdsFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(CdsFunc.FieldByName('NOME').asString);
      CdsFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  btImprimir.Enabled := (bSelFunc) and (Trim(dtedDataRef.Text) <> '') and
    (sListaIdEstabSel <> '');
end;

procedure TfrmParamFichaReg.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaReg.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaReg.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

end.
