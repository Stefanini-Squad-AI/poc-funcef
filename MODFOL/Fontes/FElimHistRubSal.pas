// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FElimHistRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb,
  wwdblook, checklst, Spin, IvDictio, IvMulti, IvEMulti, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TfrmElimHistRubSal = class(TfrmOkCancelar)
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    gbxTipoPag: TGroupBox;
    qryFunc: TwwQuery;
    dblkcbMotivo: TwwDBLookupCombo;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxAnoMesRef: TGroupBox;
    qryParamRH: TwwQuery;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxFunc: TGroupBox;
    Paginas: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure speAnoChange(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec,
    bTipContrTemp, bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    ListaFunc: TStringList;
    sCodEstab: string;

    procedure MudaListaFuncionarios;
    function  SelSitFunc: string;
    function  SelTipoContrato: string;
    procedure HabilitaBtOk;    
  public
    { Public declarations }
  end;

var
  frmElimHistRubSal: TfrmElimHistRubSal;

implementation

uses uSistema, uMensErro, uFuncoesUteis, UsoGeralRH, fAguarde;

{$R *.DFM}

procedure TfrmElimHistRubSal.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFunc := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;
  qryMotivo.Open;

  cmbMes.ItemIndex     := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text          := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);

  Paginas.ActivePage   := tbshListaFunc;

  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaFunc.Free;

  qryMotivo.Close;
  qryFunc.Close;
  qryEstab.Close;
  qryParamRH.Close;
  inherited;  
end;

function TfrmElimHistRubSal.SelSitFunc: string;
var
  sAux: string;
begin
  sAux := '';
  if (cbxDemitidos.Checked) then
    sAux := QuotedStr('D');

  if (cbxAtivos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  Result := sAux;
end;

function TfrmElimHistRubSal.SelTipoContrato: string;
var
  sAux: string;
begin
  sAux := '';
  if (cbxEfetivos.Checked) then
    sAux := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('S')
    else
      sAux := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('T')
    else
      sAux := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('3')
    else
      sAux := QuotedStr('3');

  if (cbxProprietarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('P')
    else
      sAux := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('G')
    else
      sAux := QuotedStr('G');

  Result := sAux;
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmElimHistRubSal.MudaListaFuncionarios;
var
  sAux: string;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    with (qryFunc.SQL) do
    begin
      Clear;
      Add ('SELECT DISTINCT');
      Add ('  PF.IDPESSOA, PF.NOME AS EMPREGADO');
      Add ('FROM');
      Add ('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add ('WHERE');
      Add ('  (F.IDESTAB         = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add ('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add ('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add ('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add ('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add ('ORDER BY');
      Add ('  UPPER(EMPREGADO)');
    end;
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      ListaFunc.Add(QryFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(qryFunc.FieldByName('EMPREGADO').asString);
      qryFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (dblkcbMotivo.Text <> '') and (Trim(speAno.Text) <> '');
end;

procedure TfrmElimHistRubSal.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmElimHistRubSal.speAnoChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.dblkcbEstabChange(Sender: TObject);
begin
  inherited;
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MudaListaFuncionarios;
    sCodEstab := dblkcbEstab.Text;

    if (Paginas.ActivePage = tbshListaFunc) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmElimHistRubSal.gbxSituacaoEnter(Sender: TObject);
begin
  inherited;
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmElimHistRubSal.gbxSituacaoExit(Sender: TObject);
begin
  inherited;
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmElimHistRubSal.gbxTipContraEnter(Sender: TObject);
begin
  inherited;
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxProprietarios.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmElimHistRubSal.gbxTipContraExit(Sender: TObject);
begin
  inherited;
  if not(cbxEfetivos.Checked)      and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)   and not(cbxTerceiros.Checked) and
     not(cbxProprietarios.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)     or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)   or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxProprietarios.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MudaListaFuncionarios;
  end;
end;

procedure TfrmElimHistRubSal.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmElimHistRubSal.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  iConta: integer;
  NomeTabela, sQueryFunc: string;
begin
  inherited;
  if MsgDlg('Você está prestes a executar um procedimento que vai apagar as ' +
            'rubricas já processadas para o(s) empregado(s) selecionado(s). ' +
            'Confirma a execução ? ','Confirmação ',
             mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
  then Exit;


  frmAguarde.Mostra ('Selecionando e Contando as Rubricas Salariais...');
  frmAguarde.Pos := 0;


  NomeTabela := ' HISTRUBSAL ';

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaFunc, sQueryFunc, ',', false);
  if (wNum = ListaFunc.Count) then
    sQueryFunc := '';

  // Monta Query Auxiliar
  qryAux.Close;
  with (qryAux.SQL) do
  begin
    Clear;
    Add ('SELECT COUNT(*) AS TOTREG ');
    Add ('FROM');
    Add ('  '+NomeTabela+ ' H ');
    Add ('WHERE');
    Add ('  (H.IDMODULO        = 21) AND');
    Add ('  (H.IDMOTIVO        = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    Add ('  (H.IDPESSJUR       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add ('  (H.MES             = '+QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') ');
    // Funcionário(s) selecionado(s) (para HISTRUBSAL)
    if (sQueryFunc <> '') then
      if (Pos(',',sQueryFunc) > 0) then
        Add ('  AND (H.IDPESSOA IN (' +sQueryFunc+ ')) ')
      else
        Add ('  AND (H.IDPESSOA  = ' +sQueryFunc+ ')');

    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

    qryAux.Open;
    iConta := qryAux.FieldByName('TOTREG').asInteger;
    qryAux.Close;
    frmAguarde.Apaga;

    if iConta = 0 then
    begin
       MsgDlg ('Nenhum registro a excluir foi encontrado !','Aviso', 
                mtInformation,[mbOk,mbHelp],0);
       exit;   
    end
    else if MsgDlg('Quantidade a Excluir = ' + IntToStr(iConta) + 
                   ' .Esta é uma segunda chance para se arrepender. Confirma mesmo a execução ? '
                   ,'Confirmação ',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
         then Exit;


    qryAux.Sql[0] :=  'DELETE ';

    frmAguarde.Mostra ('Excluindo as Rubricas Salariais...');
    frmAguarde.Pos := 0;

    try
      qryAux.ExecSQL;
    except
      MsgDlg('Não Foi Possível Eliminar os Registros. Processo Interrompido','Aviso', mtInformation,[mbOk,mbHelp],0);
    end;

    qryAux.Close;
    qryAux.Sql.Clear;

  end;

  frmAguarde.Apaga;


end;


end.
