unit uFuncRel;

interface

uses Windows, Classes, forms, StdCtrls, CheckLst, dbtables, dbctrls, wwDBLook, IniFiles;

type
  TFuncRel = class
  protected
    FSelSitFunc: boolean;
  public
    qryFunc, qryCCusto, qryEstab, qryRubrica, qryTipoFolha: TQuery;

    CheckListBoxFunc, CheckListBoxCCusto, CheckListBoxRubrica, CheckListBoxTipoFolha: TColorCheckListBox;

    LookupComboEstab: TwwDBLookupCombo;

    IDEstab: integer;
    SitAtivo, SitAfast, SitDemit, TipContrEfet, TipContrEspec, TipContrTemp,
    TipContrEst, TipContrTerc, TipContrProp, TipContrAut: boolean;

    Ativos, Afastados, Demitidos, Efetivos, Especiais, Temporarios,
    Terceiros, PropDirSemVinc, Autonomos, Estagiarios: TCheckBox;

    constructor Create;
    destructor  Destroy; override;

    procedure Init(
      Estab: TQuery;
      LookupEstab: TwwDBLookupCombo;
      CheckListFunc, CheckListCCusto, CheckListRubrica, CheckListTipoFolha: TColorCheckListBox;
      cbxAtivos, cbxAfastados, cbxDemitidos, cbxEfetivos, cbxEspeciais, cbxTemporarios,
      cbxTerceiros, cbxPropDirSemVinc, cbxAutonomos, cbxEstagiarios: TCheckBox);

    procedure DrawItem(CheckListBox:TColorCheckListBox; Index:integer; Rect:TRect);

    function  SelecionaSitFunc: string;
    function  SelecionaTipCont: string;
    procedure SelecionaTodosItens(CheckListBox:TColorCheckListBox; Repaint:boolean);
    procedure InverteSelecaoItens(CheckListBox:TColorCheckListBox; Repaint:boolean);
    procedure EnterGroupTipContrato;
    procedure EnterGroupSituacao;
    procedure ExitGroupTipContrato;
    procedure ExitGroupSituacao;
    procedure MontaListaFuncionarios;
    procedure MontaListaCCusto;
    procedure MontaListaRubrica;
    procedure MontaListaTipoFolha;
  end;

var
  FuncRel: TFuncRel;
  ArqConfig: TIniFile;
  chkListAux: TColorCheckListBox;
  ListaFunc, ListaRubrica, ListaCCusto, ListaTipoFolha: TStringList;
  LinhasSQLSelFunc, CamposSQLSelFunc, TabelasSQLSelFunc, sAux,
  sFuncSel, sCCustoSel, sTipoFolhaSel, sRubricaSel: string;

implementation

uses Graphics, SysUtils, Dialogs, db, uSistema, uMensErro, UsoGeralRH, uFuncoesUteisRH;

constructor TFuncRel.Create;
begin
  inherited;
  qryFunc   := TQuery.Create(Application);
  ListaFunc := TStringList.Create;
  qryFunc.DatabaseName := 'BaseDados';
end;

destructor TFuncRel.Destroy;
begin
  inherited;
  if (Assigned(qryCCusto)) then
  begin
    qryCCusto.Close;
    qryCCusto.Free;
    ListaCCusto.Free;
  end;

  if (Assigned(qryRubrica)) then
  begin
    qryRubrica.Close;
    qryRubrica.Free;
    ListaRubrica.Free;
  end;

  if (Assigned(qryTipoFolha)) then
  begin
    qryTipoFolha.Close;
    qryTipoFolha.Free;
    ListaTipoFolha.Free;
  end;

  qryFunc.Close;
  qryFunc.Free;
  ListaFunc.Free;
end;

procedure TFuncRel.Init(
  Estab: TQuery;
  LookupEstab: TwwDBLookupCombo;
  CheckListFunc, CheckListCCusto, CheckListRubrica, CheckListTipoFolha: TColorCheckListBox;
  cbxAtivos, cbxAfastados, cbxDemitidos, cbxEfetivos, cbxEspeciais, cbxTemporarios,
  cbxTerceiros, cbxPropDirSemVinc, cbxAutonomos, cbxEstagiarios: TCheckBox);
begin
  if Assigned(CheckListCCusto) then
  begin
    if not(Assigned(ListaCCusto)) then
      ListaCCusto := TStringList.Create;

    if not(Assigned(qryCCusto)) then
    begin
      qryCCusto := TQuery.Create(Application);
      qryCCusto.DatabaseName := 'BaseDados';

      with (qryCCusto.SQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  CODCENTROCUSTO, NOME');
        Add('FROM');
        Add('  CENTCUST');
        Add('');
        Add('ORDER BY');
        Add('  UPPER(NOME)');
      end;
    end;
  end;

  if Assigned(CheckListRubrica) then
  begin
    if not(Assigned(ListaRubrica)) then
      ListaRubrica := TStringList.Create;

    if not(Assigned(qryRubrica)) then
    begin
      qryRubrica := TQuery.Create(Application);
      qryRubrica.DatabaseName := 'BaseDados';

      with (qryRubrica.SQL) do
      begin
        Add('SELECT');
        Add('  RP.CODPROVDESC, RP.DESCRPROVDESC');
        Add('FROM');
        Add('  RUBRICAXPESS RP, PROVDESC PD');
        Add('WHERE');
        Add('  (RP.IDPESSOA    = :IDEMPRESA) AND');
        Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
        Add('  (PD.IDPROVENTO  = RP.IDRUBRICA)');
        Add('ORDER BY');
        Add('  UPPER(DESCRPROVDESC)');
      end;
      qryRubrica.Params[0].DataType := ftInteger;
    end;
  end;

  if Assigned(CheckListTipoFolha) then
  begin
    if not(Assigned(ListaTipoFolha)) then
      ListaTipoFolha := TStringList.Create;

    if not(Assigned(qryTipoFolha)) then
    begin
      qryTipoFolha := TQuery.Create(Application);
      qryTipoFolha.DatabaseName := 'BaseDados';

      with (qryTipoFolha.SQL) do
      begin
        Add('SELECT');
        Add('  IDMOTIVO, DESCRICAO');
        Add('FROM');
        Add('  MOTIVO');
        Add('WHERE');
        Add('  (GRUPOMOTIVO IN (''F'',''D''))');
        Add('ORDER BY');
        Add('  UPPER(DESCRICAO)');
      end;
    end;
  end;

  LookupComboEstab      := LookupEstab;
  CheckListBoxCCusto    := CheckListCCusto;
  CheckListBoxFunc      := CheckListFunc;
  CheckListBoxRubrica   := CheckListRubrica;
  CheckListBoxTipoFolha := CheckListTipoFolha;

  FSelSitFunc    := Assigned(cbxAtivos) or Assigned(cbxAfastados) or Assigned(cbxDemitidos);
  qryEstab       := Estab;
  Ativos         := cbxAtivos;
  Afastados      := cbxAfastados;
  Demitidos      := cbxDemitidos;
  Efetivos       := cbxEfetivos;
  Especiais      := cbxEspeciais;
  Temporarios    := cbxTemporarios;
  Terceiros      := cbxTerceiros;
  PropDirSemVinc := cbxPropDirSemVinc;
  Autonomos      := cbxAutonomos;
  Estagiarios    := cbxEstagiarios;

  IDEstab := 0;
  if Assigned(cbxAtivos) then
    SitAtivo := cbxAtivos.Checked;
  if Assigned(cbxAfastados) then
    SitAfast := cbxAfastados.Checked;
  if Assigned(cbxDemitidos) then
    SitDemit := cbxDemitidos.Checked;
  if Assigned(cbxEfetivos) then
    TipContrEfet := cbxEfetivos.Checked;
  if Assigned(cbxEspeciais) then
    TipContrEspec := cbxEspeciais.Checked;
  if Assigned(cbxTemporarios) then
    TipContrTemp := cbxTemporarios.Checked;
  if Assigned(cbxTerceiros) then
    TipContrTerc := cbxTerceiros.Checked;
  if Assigned(cbxPropDirSemVinc) then
    TipContrProp := cbxPropDirSemVinc.Checked;
  if Assigned(cbxAutonomos) then
    TipContrAut := cbxAutonomos.Checked;
  if Assigned(cbxEstagiarios) then
    TipContrEst := cbxEstagiarios.Checked;
end;

function TFuncRel.SelecionaSitFunc: string;
begin
  sAux := '';
  if Assigned(Ativos) and (Ativos.Checked) then
    sAux := QuotedStr('A');

  if Assigned(Afastados) and (Afastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  if Assigned(Demitidos) and (Demitidos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('D')
    else
      sAux := QuotedStr('D');

  Result := sAux;
end;

function TFuncRel.SelecionaTipCont: string;
begin
  sAux := '';
  if Assigned(Efetivos) and (Efetivos.Checked) then
    sAux := QuotedStr('E');

  if Assigned(Especiais) and (Especiais.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('S')
    else
      sAux := QuotedStr('S');

  if Assigned(Temporarios) and (Temporarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('T')
    else
      sAux := QuotedStr('T');

  if Assigned(Terceiros) and (Terceiros.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('3')
    else
      sAux := QuotedStr('3');

  if Assigned(PropDirSemVinc) and (PropDirSemVinc.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('P')
    else
      sAux := QuotedStr('P');

  if Assigned(Autonomos) and (Autonomos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if Assigned(Estagiarios) and (Estagiarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('G')
    else
      sAux := QuotedStr('G');

  Result := sAux;
end;

procedure TFuncRel.DrawItem(CheckListBox:TColorCheckListBox; Index:integer; Rect:TRect);
begin
  with (CheckListBox.Canvas) do
  begin
    if (CheckListBox.Checked[Index]) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, CheckListBox.Items[Index]);
  end;
end;

procedure TFuncRel.SelecionaTodosItens(CheckListBox:TColorCheckListBox; Repaint:boolean);
var
  C: integer;
begin
  for C:=0 to CheckListBox.Items.Count-1 do
    CheckListBox.Checked[C] := true;

  if (Repaint) then
    CheckListBox.Repaint;
end;

procedure TFuncRel.InverteSelecaoItens(CheckListBox:TColorCheckListBox; Repaint:boolean);
var
  C: integer;
begin
  for C:=0 to CheckListBox.Items.Count-1 do
    CheckListBox.Checked[C] := not(CheckListBox.Checked[C]);

  if (Repaint) then
    CheckListBox.Repaint;
end;

procedure TFuncRel.EnterGroupTipContrato;
begin
  TipContrEfet  := Efetivos.Checked;
  TipContrEspec := Especiais.Checked;
  TipContrTemp  := Temporarios.Checked;
  TipContrEst   := Estagiarios.Checked;
  TipContrTerc  := Terceiros.Checked;
  TipContrProp  := PropDirSemVinc.Checked;
  TipContrAut   := Autonomos.Checked;
end;

procedure TFuncRel.EnterGroupSituacao;
begin
  SitAtivo := Assigned(Ativos) and (Ativos.Checked);
  SitAfast := Assigned(Afastados) and (Afastados.Checked);
  SitDemit := Assigned(Demitidos) and (Demitidos.Checked);
end;

procedure TFuncRel.ExitGroupTipContrato;
begin
  if not(Efetivos.Checked)       and not(Especiais.Checked) and
     not(Temporarios.Checked)    and not(Terceiros.Checked) and
     not(PropDirSemVinc.Checked) and not(Autonomos.Checked) and
     not(Estagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso',
      mtInformation,[mbOk,mbHelp],0);
    Efetivos.SetFocus;
  end
  else
  begin
    if (TipContrEfet <> Efetivos.Checked)    or (TipContrEspec <> Especiais.Checked)      or
       (TipContrTemp <> Temporarios.Checked) or (TipContrEst   <> Estagiarios.Checked)    or
       (TipContrTerc <> Terceiros.Checked)   or (TipContrProp  <> PropDirSemVinc.Checked) or
       (TipContrAut  <> Autonomos.Checked) then
      MontaListaFuncionarios;
  end;
end;

procedure TFuncRel.ExitGroupSituacao;
begin
  if not(Ativos.Checked) and not(Afastados.Checked) and not(Demitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    Ativos.SetFocus;
  end
  else
  if (SitAtivo <> Ativos.Checked) or (SitAfast <> Afastados.Checked) or
     (SitDemit <> Demitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TFuncRel.MontaListaFuncionarios;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  CheckListBoxFunc.Items.Clear;

  if (LookupComboEstab.Text <> '') then
  begin
    with (qryFunc.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PF.IDPESSOA, PF.NOME' +CamposSQLSelFunc);
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F' +IFF(FSelSitFunc,', SITFUNC ST','') +TabelasSQLSelFunc);
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      if (FSelSitFunc) then
      begin
        sAux := SelecionaSitFunc;
        if (sAux <> '') then
          if (Pos(',',sAux) > 0) then
            Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
          else
            Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');
      end;

      sCCustoSel := '';
      if Assigned(CheckListBoxCCusto) then
      begin
        CriaListaOpcoes (CheckListBoxCCusto, ListaCCusto, sCCustoSel, ',', true);
        if (sCCustoSel <> '') then
        begin
          if (Pos(',',sCCustoSel) > 0) then
            Add('  (F.CODCENTROCUSTO IN (' +sCCustoSel+ ')) AND')
          else
            Add('  (F.CODCENTROCUSTO  = ' +sCCustoSel+ ') AND');
        end;
      end;

      if Assigned(CheckListBoxCCusto) or (sCCustoSel = '') then
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
        begin
          if (Pos(',',sUsuXccusto) > 0) then
            Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
        end;
      end;

      sAux := SelecionaTipCont;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add(LinhasSQLSelFunc);

      if (FSelSitFunc) then
        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');

      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      ListaFunc.Add(qryFunc.FieldByName('IDPESSOA').asString);
      CheckListBoxFunc.Items.Add(qryFunc.FieldByName('NOME').asString);
      qryFunc.Next;
    end;
  end;
end;

procedure TFuncRel.MontaListaCCusto;
begin
  CheckListBoxCCusto.Items.Clear;
  ListaCCusto.Clear;
  with (qryCCusto) do
  begin
    Close;
    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
    begin
      if (Pos(',',sUsuXccusto) > 0) then
        SQL[4] := 'WHERE (CODCENTROCUSTO IN ' +sUsuXccusto+ ')'
      else
        SQL[4] := 'WHERE (CODCENTROCUSTO  = ' +sUsuXccusto+ ')';
    end;
    Open;
    while not(EOF) do
    begin
      ListaCCusto.Add(FieldByName('CODCENTROCUSTO').asString);
      CheckListBoxCCusto.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;
end;

procedure TFuncRel.MontaListaRubrica;
begin
  CheckListBoxRubrica.Items.Clear;
  ListaRubrica.Clear;

  qryRubrica.Close;
  qryRubrica.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryRubrica.Open;
  while not(qryRubrica.EOF) do
  begin
    ListaRubrica.Add(qryRubrica.FieldByName('CODPROVDESC').asString);
    CheckListBoxRubrica.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
    qryRubrica.Next;
  end;
end;

procedure TFuncRel.MontaListaTipoFolha;
begin
  CheckListBoxTipoFolha.Items.Clear;
  ListaTipoFolha.Clear;
  qryTipoFolha.Close;
  qryTipoFolha.Open;
  while not(qryTipoFolha.EOF) do
  begin
    ListaTipoFolha.Add(qryTipoFolha.FieldByName('IDMOTIVO').asString);
    CheckListBoxTipoFolha.Items.Add(qryTipoFolha.FieldByName('DESCRICAO').asString);
    qryTipoFolha.Next;
  end;
end;

end.
