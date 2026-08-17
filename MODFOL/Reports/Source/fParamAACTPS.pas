unit fParamAACTPS;

{*******************************************************************************
Rotina...........: criação da tela de parâmetros
Nº SIG...........: 20695
Data da Alteração: 14/06/2013
Responsável......: William Santana
Descrição........: relatório de Ficha de anotações e atualizações da CTPS - modelo2
********************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dxCntner,
  dxExEdtr, dxEdLib, CheckLst, ColorCheckListBox, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlGlobalRH, uCtrlPessoaFuncionario, 
  uCtrlCargo, wwdblook, Db, DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa,
  DBTables, Wwquery;



type
  TfrmParamAACTPS = class(TfrmParamReports_Padrao)
    grpEmpregados: TGroupBox;
    grpCentroCust: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelFuncTodos: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    chklstCCusto: TColorCheckListBox;
    bbtnSelCCTodos: TBitBtn;
    bbtnInverteSelCC: TBitBtn;
    grpTipContrato: TGroupBox;
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
    grpCargo: TGroupBox;
    chklstCargo: TColorCheckListBox;
    bbtnSelCargoTodos: TBitBtn;
    bbtnInverteSelCargo: TBitBtn;
    edtSelEmpregados: TEdit;
    btnSelEmpregados: TBitBtn;
    lblMatricula: TLabel;
    grpSexo: TGroupBox;
    chkMasc: TCheckBox;
    chkFem: TCheckBox;
    grpEstCivil: TGroupBox;
    chkSolteiro: TCheckBox;
    chkCasado: TCheckBox;
    chkSeparadoJud: TCheckBox;
    chkOutros: TCheckBox;
    chkDivorciado: TCheckBox;
    chkViuvo: TCheckBox;
    grpOrdem: TGroupBox;
    cbbOrdem: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelFuncTodosClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelCCTodosClick(Sender: TObject);
    procedure bbtnInverteSelCCClick(Sender: TObject);
    procedure bbtnSelCargoTodosClick(Sender: TObject);
    procedure bbtnInverteSelCargoClick(Sender: TObject);
    procedure btnSelEmpregadosClick(Sender: TObject);
    procedure edtSelEmpregadosKeyPress(Sender: TObject; var Key: Char);
    procedure MontaListaClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);

  private
    { Private declarations }
    sLstEstab : string;
    ListaIdFunc, ListaCodCCusto, ListaIdCargo, ListaMatFunc : TStringList;

    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa : TCtrlPessoaFilialPessoa;
    CtrlCargo : TCtrlCargo;
    procedure MontaListaFuncionarios;
    procedure MontaListaCargoFuncao;
    procedure MontaListaCentroCustos;

  public
    { Public declarations }
  end;

var
  frmParamAACTPS: TfrmParamAACTPS;

implementation

uses uSistema, uMensErro, fAguarde, dCds, Mask, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;


{$R *.DFM}

procedure TfrmParamAACTPS.FormCreate(Sender: TObject);
begin
  inherited;

  ListaIdFunc := TStringList.Create;
  ListaMatFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdCargo := TStringList.Create;

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

  // lista Centros de Custos e marca todos
  MontaListaCentroCustos;
  
  // lista de Cargos
  MontaListaCargoFuncao;

  // lista de Funcionarios
  MontaListaFuncionarios;

  cbbOrdem.ItemIndex := 0;

end;

procedure TfrmParamAACTPS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaMatFunc);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdCargo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlCargo);

end;


procedure TfrmParamAACTPS.MontaListaCentroCustos;
begin

  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;

  dmCds.Cds.Data := FU.GetDataPacket('SELECT C.NOME ||'' ''||  ' +
                                     '   DECODE(NVL(C.ATIVO, ''S''), ''S'', ''(Ativo)'', '+
                                     ' ''(Inativo)'') DESCRICAO,' + #13#10 +
                                     '       C.CODCENTROCUSTO ' + #13#10 +
                                     '  FROM CENTCUST C' + #13#10 +
                                     ' WHERE C.STATUSGRUPOCDC = ''A''' + #13#10 +
                                     '   AND C.IDPLANCENTCUST = 3' + #13#10 +
                                     ' ORDER BY C.NOME');

  dmCds.Cds.First;
  while not(dmCds.Cds.EOF) do
  begin

    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

end;


procedure TfrmParamAACTPS.MontaListaCargoFuncao;
begin

  dmCds.Cds.Data := CtrlCargo.ListCargo();

  chklstCargo.Items.Clear;
  ListaIdCargo.Clear;

  dmCds.Cds.First;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString  );
    dmCds.Cds.Next;
  end;

end;

procedure TfrmParamAACTPS.MontaListaFuncionarios;
var
  sListaSitFunc,
  sListaTipoContr,
  sListaSexo,
  sListaEstCivil,
  sListaCodCCusto,
  sListaIdCargo: string;
  i: Integer;
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
  ListaMatFunc.Clear;
  chklstFunc.Items.Clear;

  sListaSitFunc := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.checked);

  sListaTipoContr := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
    cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked);

  sListaSexo := FU.GerarListaSexoSel(chkMasc.Checked, chkFem.Checked);

  sListaEstCivil := FU.GerarListaEstadoCivilSel(chkSolteiro.Checked,chkCasado.Checked,chkDivorciado.Checked,
                                                chkSeparadoJud.Checked,False,chkViuvo.Checked,chkOutros.Checked);

  sListaCodCCusto := '';
  for i := 0  to chklstCCusto.Items.Count -1 do
  begin
    if (chklstCCusto.Checked[i] ) then
    sListaCodCCusto := sListaCodCCusto + ListaCodCCusto.Strings[i] + ',';
  end;
    sListaCodCCusto := Copy(sListaCodCCusto,0,Length(sListaCodCCusto)-1);

  sListaIdCargo := '';
  for i := 0  to chklstCargo.Items.Count -1 do
  begin
    if (chklstCargo.Checked[i] ) then
    sListaIdCargo := sListaIdCargo + ListaIdCargo.Strings[i] + ',';
  end;
    sListaIdCargo := Copy(sListaIdCargo,0,Length(sListaIdCargo)-1);

  dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
                    '', ''{sLstEstab}, sListaSitFunc, sListaTipoContr, sListaSexo,
                    sListaCodCCusto,'','','',false,0,0,-1,-1,'',0,0,0,0,false,'','',0,0,0,true,0,
                    sListaEstCivil,sListaIdCargo);

  while not(dmCds.Cds.EOF) do
  begin
    ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    ListaMatFunc.Add(dmCds.Cds.FieldByName('MATRICULA').asString);
    chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  bbtnConfirmar.Enabled := False;
end;


procedure TfrmParamAACTPS.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel   : string;
  //wNum              : integer;
begin

  // Funcionários escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  //if (wNum = ListaIdFunc.Count) then
  //  sListaIdFuncSel := '';

  Cmp_Padrao.ParamByName('ListaIdFuncSel').AsString    := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('Ordem').AsInteger            := cbbOrdem.ItemIndex;

end;


procedure TfrmParamAACTPS.bbtnSelFuncTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;

  bbtnConfirmar.Enabled := True;
end;


procedure TfrmParamAACTPS.bbtnInverteSelFuncClick(
  Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;

  bbtnConfirmar.Enabled := False;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
      bbtnConfirmar.Enabled := true;

end;

procedure TfrmParamAACTPS.bbtnSelCCTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;

  MontaListaFuncionarios();
end;

procedure TfrmParamAACTPS.bbtnInverteSelCCClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;

  MontaListaFuncionarios();
end;

procedure TfrmParamAACTPS.bbtnSelCargoTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := true;
  chklstCargo.Repaint;

  MontaListaFuncionarios();
end;

procedure TfrmParamAACTPS.bbtnInverteSelCargoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := not(chklstCargo.Checked[c]);
  chklstCargo.Repaint;

  MontaListaFuncionarios();
end;

procedure TfrmParamAACTPS.MontaListaClick(Sender: TObject);
begin
  MontaListaFuncionarios();
end;

procedure TfrmParamAACTPS.btnSelEmpregadosClick(Sender: TObject);
  var
  slLista: TStringList;
  x, i: Integer;
  sLin, sIni, sFim: String;
  bIni, bFim, bMarcou: Boolean;
  sMatErro: String;
                    
  function StrCount(SubStr, S: String): Integer;
  begin
    Result := 0;
    while Pos(SubStr, S) > 0 do
    begin
      Delete(S, Pos(SubStr, S), 1);
      Result := Result + 1;
    end;

  end;

begin
  inherited;

  if Trim(edtSelEmpregados.Text) <> '' then
  begin
    slLista := TStringList.Create;
    try             

      slLista.Text := StringReplace(edtSelEmpregados.Text,',', #13#10, [rfReplaceAll]);

      for x := 0 to slLista.Count-1 do
      begin
        sLin := slLista[x];

        if (Trim(sLin) <> '') then
        begin

          case StrCount(',', sLin) of
            0: begin
                 sIni := sLin;
                 sFim := sLin;
               end;
            1: begin
                 sIni := Copy(sLin, 1, Pos(',', sLin)-1);
                 Delete(sLin, 1, Pos(',', sLin));
                 sFim := sLin;
               end;
          else
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados em branco
          if (Trim(sIni) = '') or (Trim(sFim) = '') then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados não numéricos com mais de um caracter: A e A;A;A;A;... e A-A
          if (( (Length(sIni) > 1) and not(sIni[2] in ['0'..'9']) ) or
              ( (Length(sFim) > 1) and not(sFim[2] in ['0'..'9']) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados numéricos: NNN e NNN;NNN;NNN;... e NNN-NNN
          if (( (sIni[1] in ['0'..'9']) and (StrToIntDef(sIni, -1) = -1) ) or
              ( (sFim[1] in ['0'..'9']) and (StrToIntDef(sFim, -1) = -1) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

        end;
      end;

      sMatErro := '';

      // Selecionando....
      for x := 0 to slLista.Count-1 do
      begin
        sLin := AnsiUpperCase(slLista[x]);

        if StrCount(',', sLin) > 0 then
        begin
          sIni := Copy(sLin, 1, Pos(',', sLin)-1);
          Delete(sLin, 1, Pos(',', sLin));
          sFim := sLin;
        end
        else
        begin
          sIni := sLin;
          sFim := sLin;
        end;

        if (sIni <> '') then
        begin
          if (sIni[1] in ['0'..'9']) then
          begin
            bIni := False;
            bFim := (StrToIntDef(sIni,0) = StrToIntDef(sFim,0));  // se for igual só vai validar se existe o sIni
            bMarcou := False;
            for i := 0 to chklstFunc.Items.Count-1 do
              if ( (StrToIntDef(ListaMatFunc[i],-1) >= StrToIntDef(sIni,0) ) and
                   (StrToIntDef(ListaMatFunc[i],-1) <= StrToIntDef(sFim,0) ) ) then
              begin
                if not(bIni) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sIni,0)) then bIni := True;
                if not(bFim) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sFim,0)) then bFim := True;
                chklstFunc.Checked[i] := True;
                bbtnConfirmar.Enabled := True;
                bMarcou := True;
              end;

            if not(bMarcou) then
              sMatErro := sMatErro + ', ' + sFim;

          end
          else
          begin

            bMarcou := False;
            for i := 0 to chklstFunc.Items.Count-1 do
              if ( (Copy(ListaMatFunc[i], 1, Length(sIni)) >= sIni) and
                   (Copy(ListaMatFunc[i], 1, Length(sFim)) <= sFim) ) then
              Begin
                chklstFunc.Checked[i] := True;
                bbtnConfirmar.Enabled := True;
                bMarcou := True;
              End;

             if not(bMarcou) then
              sMatErro := sMatErro + ', ' + sFim;
          end;
        end;
      end;

      if Trim(sMatErro) <> '' then
      begin
        Delete(sMatErro, 1, 2);
        MsgDlg('Matrícula(s) '+sMatErro+' não existe(m) na lista', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      end;

    finally
      FreeAndNil(slLista);
      chklstFunc.Repaint;
    end;
  end;
end;

procedure TfrmParamAACTPS.edtSelEmpregadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if not(key in ['0'..'9', #8]) and (Key <> 'E')  and (Key <> 'e')
   and (Key <> 'C') and (Key <> 'c')  and (Key <> ',') and (Key <> 'BACKSPACE]')  then
        key:=#0;        
end;

procedure TfrmParamAACTPS.chklstFuncClickCheck(Sender: TObject);
var
  i : Integer;
  sel : Boolean;
begin
  inherited;

  sel := false;
  for i := 0  to chklstFunc.Items.Count -1 do
  begin
    if (chklstFunc.Checked[i] ) then
     sel := True;
  end;

   bbtnConfirmar.Enabled := sel;
end;

end.
