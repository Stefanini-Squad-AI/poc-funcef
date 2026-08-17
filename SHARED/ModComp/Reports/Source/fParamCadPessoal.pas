// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{--------------------------------------------------------------------------------------------------
Nº SIG......: 24879
Data........: 30/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campos Tipo de Deficiência e Estabilidade no Relatório de Cadastro de Pessoal
Alterações..: Alterações DFM e PAS - Criado campos e condições/funções de acordo com as regras (ER358).
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142862
Nº KINTANA..: 917813
Data........: 29/11/2010
Responsável.: Renan Cristiano
Descrição...: incluido a opção "selecionar unidades vinculadas", somente quando o campo
              "selecionar unidades vinculadas" estiver marcado, o sistema vai selecionar
              todos os centros de custo vinculados.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 126380
Nº KINTANA..: 659768
Data........: 20/04/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da data de referência e Lista dos centros de custos
---------------------------------------------------------------------------------------------------}

{Nome     : Henrique Massão
SOL       : 117141
Kintana   : 594895
Data:     : 20/08/2009
Rotina    : gbxTipContra
Descrição :  Alterar os tipos de contrato no módulo conforme segue: Efetivo - manter o mesmo
  Efetivo Especial - alterar para LEF
  Temporário - alterar para Terceirizado
  Estagiário - manter o mesmo
  Terceiro - alterar para Cessão
  Prop/Dir s/Vinc - manter o mesmo
  Autônomo - - manter o mesmo
  Não é necessário alterar a nomenclatura utilizada nas fórmulas de cálculo das rubricas,
  mas em todos os relatórios e telas em que a informação aparece.}
unit fParamCadPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  TB97, ComCtrls, FTelaAut, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet, CheckLst, ColorCheckListBox,
  CmParamReport,uMensErro;

type
  TfrmParamCadPessoal = class(TfrmSelPessoalMT)
    tbsConfiguracoes: TTabSheet;
    rgOpcaoColuna1: TRadioGroup;
    rgOpcaoColuna2: TRadioGroup;
    Label9: TLabel;
    EdDataRef: TCMDateTimePicker;
    gbxLstCCusto: TGroupBox;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodosCC: TBitBtn;
    bbtnInverteSelCC: TBitBtn;
    cbVinculados: TCheckBox;
    Label10: TLabel;
    grpDtFimEstab: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dtDeFimEstab: TCMDateTimePicker;
    dtAteFimEstab: TCMDateTimePicker;
    grpTipoDef: TGroupBox;
    chkTodosTipoDef: TCheckBox;
    chkPortadorTipoDef: TCheckBox;
    chkNaoPortadorTipoDef: TCheckBox;
    rbCargosTodos: TRadioButton;
    rbCargosSeleciona: TRadioButton;
    rbEstabTodos: TRadioButton;
    rbEstabSeleciona: TRadioButton;
    rbSindiTodos: TRadioButton;
    rbSindiSeleciona: TRadioButton;
    rbSegTodos: TRadioButton;
    rbSegSeleciona: TRadioButton;
    rbMotivoTodos: TRadioButton;
    rbMotivoSeleciona: TRadioButton;
    grpDataDesliga: TGroupBox;
    lblDeDesliga: TLabel;
    lblADesliga: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosCCClick(Sender: TObject);
    procedure bbtnInverteSelCCClick(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure cbxDemitidosClick(Sender: TObject);
    procedure rgOpcaoColuna2Click(Sender: TObject);
    procedure rgSelRamoClick(Sender: TObject);
    procedure rgSelEstabClick(Sender: TObject);
    procedure rgSelSindiClick(Sender: TObject);
    procedure rgSelMotivoClick(Sender: TObject);
    procedure rgSelCargoClick(Sender: TObject);
    procedure rbCargosTodosClick(Sender: TObject);
    procedure rbCargosSelecionaClick(Sender: TObject);
    procedure rbEstabTodosClick(Sender: TObject);
    procedure rbEstabSelecionaClick(Sender: TObject);
    procedure rbSindiTodosClick(Sender: TObject);
    procedure rbSindiSelecionaClick(Sender: TObject);
    procedure rbSegTodosClick(Sender: TObject);
    procedure rbSegSelecionaClick(Sender: TObject);
    procedure rbMotivoTodosClick(Sender: TObject);
    procedure rbMotivoSelecionaClick(Sender: TObject);
  private
    // Alterado por FHBS - SOL: 126380 KTN: 659768 - 12/04/2010
    ListaCodCCusto: TStringList;
  end;

var
  frmParamCadPessoal: TfrmParamCadPessoal;

implementation

uses uSistema, fAguarde, Mask, dCds, uCtrlFuncoesRH; //, , uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamCadPessoal.FormCreate(Sender: TObject);
var
  sMascCCusto: String;
  sCodExterno: String;
begin
  inherited;

  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    rgOpcaoColuna1.Items.Add('Salário Cargo Altern.');
  IrPaginaResult := false;

  {Início - Michelle Mota - SIG 24879}
  chkTodosTipoDef.Checked := True;
  chkPortadorTipoDef.Checked := False;
  chkNaoPortadorTipoDef.Checked := False;
  tbsDemit.TabVisible := False;
  pgctrlPrincipal.ActivePage := tbsConfiguracoes;
  
  case rgOpcaoColuna2.ItemIndex of //ER358 - RNG02
    0:
    begin
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
    1:
    begin
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
    2:
    begin     // tipo de deficiencia
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := True;
      chkTodosTipoDef.Enabled := True;
      chkPortadorTipoDef.Enabled := True;
      chkNaoPortadorTipoDef.Enabled := True;
    end;
    3:
    begin   // estabilidade
      dtDeFimEstab.ReadOnly := False;
      dtAteFimEstab.ReadOnly := False;
      dtDeFimEstab.Color := clWhite;
      dtAteFimEstab.Color := clWhite;
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
  end;
  {Término - Michelle Mota - SIG 24879}

  //-----------------------------------------------------------------------------
  // Alterado por FHBS - SOL: 126380 KTN: 659768 - 12/04/2010
  //-----------------------------------------------------------------------------
  EdDataRef.Date := Now;

  ListaCodCCusto := TStringList.Create;

  // Mascara do Centro de Custo
  dmCds.Cds.Data := FU.GetDataPacket('SELECT MASCARACC FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  dmCds.Cds.First;
  sMascCCusto := dmCds.Cds.FieldByName('MASCARACC').AsString;

  // Monto a Lista de C. Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;

  dmCds.Cds.Data := FU.GetDataPacket('SELECT ' + #13 +
                                     '  RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO, ' + #13 +
                                     '  RTRIM(NOME) AS NOME, ' + #13 +
                                     '  RTRIM(CODEXTERNO) AS CODEXTERNO, ' + #13 +
                                     '  ATIVO ' + #13 +
                                     'FROM ' + #13 +
                                     '  CENTCUST ' + #13 +
                                     'WHERE ' + #13 +
                                     '  IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + #13 +
                                     'ORDER BY ' + #13 +
                                     '  NOME');

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
  // Fim - SOL: 126380 KTN: 659768 - 12/04/2010
  
end;

procedure TfrmParamCadPessoal.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFunc: string;
  QtdeFunc : Integer;
  sDataReferencia{Início - Michelle Mota - SIG 24879}, sTipoDeficiencia, sEstabilidade{Término - Michelle Mota - SIG 24879}: String;
  bMarcouFuncionario, bMarcouCandidato: boolean; // Michelle Mota - SIG 24879
begin
  {Início - Michelle Mota - SIG 24879}
  if (dtAteFimEstab.Date < dtDeFimEstab.Date) then
    begin
      MsgDlg('Preenchimento incorreto do campo Dt. Fim Estabilidade.', 'Aviso', mtWarning, [mbOk], 0);
      pgctrlPrincipal.ActivePage := tsDadosFunc;
      ModalResult := mrNone;
      Abort;
    end
  else
    ModalResult := mrOk;

  if (rgOpcaoColuna2.ItemIndex = 2) and ((chkTodosTipoDef.Checked = False) and
  (chkPortadorTipoDef.Checked = False) and (chkNaoPortadorTipoDef.Checked = False))   then
    begin
      MsgDlg('Selecione o Tipo de Deficiência.', 'Aviso', mtWarning, [mbOk], 0);
      pgctrlPrincipal.ActivePage := tsDadosPess;
      ModalResult := mrNone;
      Abort;
    end
  else
    ModalResult := mrOk;

  bMarcouFuncionario := (cbxEfetivos.Checked) or (cbxEspeciais.Checked) or
    (cbxTemporarios.Checked) or (cbxEstagiarios.Checked) or (cbxTerceiros.Checked) or
    (cbxPropDirSemVinc.Checked) or (cbxAutonomos.Checked);

  bMarcouCandidato := (cbxCandidatos.Checked);

  if not(bMarcouFuncionario) and not(bMarcouCandidato) then
    begin
      MsgDlg('Selecione o Tipo de Contrato.', 'Aviso', mtWarning, [mbOk], 0);
      pgctrlPrincipal.ActivePage := tsDadosFunc;
      ModalResult := mrNone;
      Abort;
    end
  else
    ModalResult := mrOk;

  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and
     not(cbxDemitidos.Checked) and not(cbxCandidatos.Checked) then
    begin
      MsgDlg('Selecione a Situação Funcional.', 'Aviso', mtWarning, [mbOk], 0);
      pgctrlPrincipal.ActivePage := tsDadosFunc;
      ModalResult := mrNone;
      Abort;
    end
  else
    ModalResult := mrOk;

  if not(cbxMensalistas.Checked) and not(cbxDiaristas.Checked) and not(cbxHoristas.Checked) then
    begin
      MsgDlg('Selecione o Tipo de Salário.', 'Aviso', mtWarning, [mbOk], 0);
      pgctrlPrincipal.ActivePage := tsDadosFunc;
      ModalResult := mrNone;
      Abort;
    end
  else
    ModalResult := mrOk;
  {Término - Michelle Mota - SIG 24879}

  frmAguarde.Mostra('Cadastro de Pessoal');
  frmAguarde.Pos := 0;
  
  // Alterado por FHBS - SOL: 126380 KTN: 659768 - 12/04/2010
  // Definindo o sListaCodCCustoSel e o sDataReferencia para que seja feito o
  // filtro na SQL dos Centros de Custo escolhidos
  sDataReferencia := FormatDateTime('dd/mm/yyyy', EdDataRef.Date);
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true, true);

  inherited;

  sListaIdFunc := '';
  QtdeFunc :=0;
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFunc = '') then
      sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;
    Inc(QtdeFunc);
    CdsPrincipal.Next;
  end;

  {Início - Michelle Mota - SIG 24879}
  sTipoDeficiencia := 'Vazio';
  sEstabilidade := 'Vazio';
  case rgOpcaoColuna2.ItemIndex of
    2: sTipoDeficiencia := FU.IFF(chkTodosTipoDef.Checked, 'Todos', FU.IFF(chkPortadorTipoDef.Checked, 'Portador', FU.IFF(chkNaoPortadorTipoDef.Checked, 'NaoPortador', 'Vazio')));
    3: sEstabilidade := ' ( ESTAB.DATAFIM >= ' + QuotedStr(dtDeFimEstab.Text) + ' AND ESTAB.DATAFIM <= ' + QuotedStr(dtAteFimEstab.Text) + ') AND ';
  end;
  if ((dtDeFimEstab.Text = '') and (dtAteFimEstab.Text = '')) and (rgOpcaoColuna2.ItemIndex = 3) then
    sEstabilidade := 'SemFiltro';
  {Término - Michelle Mota - SIG 24879}

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFunc;
  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('PorFuncionario').asBoolean := not(cbxCandidatos.Checked);
  Cmp_Padrao.ParamByName('BuscarCargoAlternativo').asBoolean := cbxCargoAltern.Checked;
  Cmp_Padrao.ParamByName('OpcaoColuna1').asInteger := rgOpcaoColuna1.ItemIndex;
  Cmp_Padrao.ParamByName('OpcaoColuna2').asInteger := rgOpcaoColuna2.ItemIndex;
  Cmp_Padrao.ParamByName('SelDemitidos').asBoolean := cbxDemitidos.Checked;
  Cmp_Padrao.ParamByName('SelAfastados').asBoolean := cbxAfastados.Checked;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbSequencia.ItemIndex;
  Cmp_Padrao.ParamByName('DataReferencia').asString := sDataReferencia;
  Cmp_Padrao.ParamByName('QtdeFunc').asInteger := QtdeFunc;
  {Início - Michelle Mota - SIG 24879}
  Cmp_Padrao.ParamByName('TipoDeficiencia').AsString := sTipoDeficiencia;
  Cmp_Padrao.ParamByName('Estabilidade').AsString := sEstabilidade;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Alterado por FHBS - SOL: 126380 KTN: 659768 - 12/04/2010
  FreeAndNil(ListaCodCCusto);
end;

procedure TfrmParamCadPessoal.bbtnSelTodosCCClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmParamCadPessoal.bbtnInverteSelCCClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;

procedure TfrmParamCadPessoal.chklstCCustoClickCheck(Sender: TObject);
var
  c: Integer;
  sCC: String;
begin
  inherited;
  if chklstCCusto.Checked[chklstCCusto.ItemIndex] then
  begin
    if (cbVinculados.Checked) then begin    //Renan Cristiano 142862 | Kintana 917813
      sCC := Trim(ListaCodCCusto.Values[ListaCodCCusto.Names[chklstCCusto.ItemIndex]]);
      for c := 0 to chklstCCusto.Items.Count-1 do
        if (Length(ListaCodCCusto.Values[ListaCodCCusto.Names[c]]) > Length(sCC)) and (Copy(ListaCodCCusto.Values[ListaCodCCusto.Names[c]],1,Length(sCC)) = sCC) then
          chklstCCusto.Checked[c] := True;
    end;  
    chklstCCusto.Repaint;
  end;
end;

procedure TfrmParamCadPessoal.Label10Click(Sender: TObject);
begin
  inherited;
  //Renan Cristiano 142862 | Kintana 917813 inicio.
  if cbVinculados.Checked then
    cbVinculados.Checked := False
  else
    cbVinculados.Checked := True;
  //Renan Cristiano 142862 | Kintana 917813 fim.
end;

procedure TfrmParamCadPessoal.cbxDemitidosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if cbxDemitidos.Checked then
    tbsDemit.TabVisible := True
  else
    tbsDemit.TabVisible := False;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgOpcaoColuna2Click(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  case rgOpcaoColuna2.ItemIndex of //ER358 - RNG02
    0:
    begin
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
    1:
    begin
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
    2:
    begin     // tipo de deficiencia
      dtDeFimEstab.ReadOnly := True;
      dtAteFimEstab.ReadOnly := True;
      dtDeFimEstab.Color := clSilver;
      dtAteFimEstab.Color := clSilver;
      dtDeFimEstab.Text := '';
      dtAteFimEstab.Text := '';
      grpTipoDef.Enabled := True;
      chkTodosTipoDef.Enabled := True;
      chkPortadorTipoDef.Enabled := True;
      chkNaoPortadorTipoDef.Enabled := True;
    end;
    3:
    begin   // estabilidade
      dtDeFimEstab.ReadOnly := False;
      dtAteFimEstab.ReadOnly := False;
      dtDeFimEstab.Color := clWhite;
      dtAteFimEstab.Color := clWhite;
      grpTipoDef.Enabled := False;
      chkTodosTipoDef.Enabled := False;
      chkTodosTipoDef.Checked := True;
      chkPortadorTipoDef.Enabled := False;
      chkPortadorTipoDef.Checked := False;
      chkNaoPortadorTipoDef.Enabled := False;
      chkNaoPortadorTipoDef.Checked := False;
    end;
  end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgSelRamoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  gbxRamo.Visible := True;
  if (rgSelRamo.ItemIndex = 0) then
    begin
      dblckRamo.Color := clSilver;
      lstRamo.Color := clSilver;
      lstCodRamo.Color := clSilver;
      lstRamo.Enabled := False;
      lstCodRamo.Enabled := False;
      dblckRamo.Text := '';
      lstRamo.Clear;
      lstCodRamo.Clear;
    end
  else
    begin
      dblckRamo.Color := clWhite;
      lstRamo.Color := clWhite;
      lstCodRamo.Color := clWhite;
      lstRamo.Enabled := True;
      lstCodRamo.Enabled := True;
    end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgSelEstabClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  gbxEstab.Visible := True;
  if (rgSelEstab.ItemIndex = 0) then
    begin
      dblckEstab.Color := clSilver;
      lstEstab.Color := clSilver;
      lstCodEstab.Color := clSilver;
      dblckEstab.ReadOnly := True;
      lstEstab.Enabled := False;
      lstCodEstab.Enabled := False;
      dblckEstab.Text := '';
      lstEstab.Clear;
      lstCodEstab.Clear;
    end
  else
    begin
      dblckEstab.Color := clWhite;
      lstEstab.Color := clWhite;
      lstCodEstab.Color := clWhite;
      dblckEstab.ReadOnly := False;
      lstEstab.Enabled := True;
      lstCodEstab.Enabled := True;
    end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgSelSindiClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  gbxSindi.Visible := True;
  if (rgSelSindi.ItemIndex = 0) then
    begin
      dblckSindicato.Color := clSilver;
      lstSindicato.Color := clSilver;
      lstCodSindicato.Color := clSilver;
      dblckSindicato.ReadOnly := True;
      lstSindicato.Enabled := False;
      lstCodSindicato.Enabled := False;
      dblckSindicato.Text := '';
      lstSindicato.Clear;
      lstCodSindicato.Clear;
    end
  else
    begin
      dblckSindicato.Color := clWhite;
      lstSindicato.Color := clWhite;
      lstCodSindicato.Color := clWhite;
      dblckSindicato.ReadOnly := False;
      lstSindicato.Enabled := True;
      lstCodSindicato.Enabled := True;
    end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgSelMotivoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  gbxMotivo.Visible := True;
  if (rgSelMotivo.ItemIndex = 0) then
    begin
      dblckMotivo.Color := clSilver;
      lstMotivo.Color := clSilver;
      lstCodMotivo.Color := clSilver;
      dblckMotivo.ReadOnly := True;
      lstMotivo.Enabled := False;
      lstCodMotivo.Enabled := False;
      dblckMotivo.Text := '';
      lstMotivo.Clear;
      lstCodMotivo.Clear;
    end
  else
    begin
      dblckMotivo.Color := clWhite;
      lstMotivo.Color := clWhite;
      lstCodMotivo.Color := clWhite;
      dblckMotivo.ReadOnly := False;
      lstMotivo.Enabled := True;
      lstCodMotivo.Enabled := True;
    end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rgSelCargoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  gbxCargo.Visible := True;
  if (rgSelCargo.ItemIndex = 0) then
    begin
      dblckCargo.Color := clSilver;
      lstCargo.Color := clSilver;
      lstCodCargo.Color := clSilver;
      dblckCargo.ReadOnly := True;
      lstCargo.Enabled := False;
      lstCodCargo.Enabled := False;
      dblckCargo.Text := '';
      lstCargo.Clear;
      lstCodCargo.Clear;
    end
  else
    begin
      dblckCargo.Color := clWhite;
      lstCargo.Color := clWhite;
      lstCodCargo.Color := clWhite;
      dblckCargo.ReadOnly := False;
      lstCargo.Enabled := True;
      lstCodCargo.Enabled := True;
    end;
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbCargosTodosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if (rbCargosTodos.Checked) then
    rbCargosSeleciona.Checked := False
  else
    rbCargosSeleciona.Checked := True;

  rgSelCargo.ItemIndex := 0;
  rgSelCargoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbCargosSelecionaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  rgSelCargo.ItemIndex := 1;
  rgSelCargoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbEstabTodosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if (rbEstabTodos.Checked) then
    rbEstabSeleciona.Checked := False
  else
    rbEstabSeleciona.Checked := True;

  rgSelEstab.ItemIndex := 0;
  rgSelEstabClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbEstabSelecionaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  rgSelEstab.ItemIndex := 1;
  rgSelEstabClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbSindiTodosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if (rbSindiTodos.Checked) then
    rbSindiSeleciona.Checked := False
  else
    rbSindiSeleciona.Checked := True;

  rgSelSindi.ItemIndex := 0;
  rgSelSindiClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbSindiSelecionaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  rgSelSindi.ItemIndex := 1;
  rgSelSindiClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbSegTodosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if (rbSegTodos.Checked) then
    rbSegSeleciona.Checked := False
  else
    rbSegSeleciona.Checked := True;

  rgSelRamo.ItemIndex := 0;
  rgSelRamoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbSegSelecionaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  rgSelRamo.ItemIndex := 1;
  rgSelRamoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbMotivoTodosClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  if (rbMotivoTodos.Checked) then
    rbMotivoSeleciona.Checked := False
  else
    rbMotivoSeleciona.Checked := True;

  rgSelMotivo.ItemIndex := 0;
  rgSelMotivoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

procedure TfrmParamCadPessoal.rbMotivoSelecionaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG 24879}
  rgSelMotivo.ItemIndex := 1;
  rgSelMotivoClick(Sender);
  {Término - Michelle Mota - SIG 24879}
end;

end.
