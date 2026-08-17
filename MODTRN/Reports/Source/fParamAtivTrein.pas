// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
-----------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 180854
Nº KINTANA..: 1675788
Data........: 30/05/2012
Responsável.: Fernando Xavier
Descrição...: Problema de invalid data packet quando vamos extrair o relatório
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 134702
Nº KINTANA..: 796136
Data........: 05/08/2010
Responsável.: Thaise Amaral Martins
Descrição...: Colocar chklstAtiv contendo os registros da tabela UNIDNEGOCIO para escolha
              no relatório. No Resumo, retirar o que era antes o Curso para trazer a
              Atividade/Projeto (Somente para imprimir a Atividade/Projeto):

              Antes da alteração:
              ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
              > Tipo de Curso
              > Centro de Custo
              > Tipo de Curso, Centro de Custo
              > Centro de Custo,Tipo de Curso

              Depois da Alteração:
              ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
              > Atividade / Projeto
              > Centro de Custo
              > Atividade / Projeto, Centro de Custo
              > Centro de Custo, Atividade / Projeto

-----------------------------------------------------------------------------------------------
}

unit fParamAtivTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlCurso,
  uCtrlGlobalRH, uCtrlHistPessoa, ColorCheckListBox;

type
  TfrmParamAtivTrein = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxCursos: TGroupBox;
    chklstCurso: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsCurso: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxSelCursos: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    cbxNaoRealNaoProgr: TCheckBox;
    rgTipoCusto: TRadioGroup;
    gbxResumo: TGroupBox;
    cmbResumo: TComboBox;
    rgIncluiExternos: TRadioGroup;
    gbxEntid: TGroupBox;
    chklstEntid: TColorCheckListBox;
    bbtnSelEntid: TBitBtn;
    bbtnInverteEntid: TBitBtn;
    CdsEntid: TCMClientDataSet;
    rgConsolida: TRadioGroup;
    gbxOrigem: TGroupBox;
    cmbOrigem: TComboBox;
    rgExibeConteudo: TRadioGroup;
    rgTipo: TRadioGroup;
    gbxAtiv: TGroupBox;
    chklstAtiv: TColorCheckListBox;
    bbtnSelAtivPro: TBitBtn;
    bbtnInverteAtivPro: TBitBtn;
    CdsAtivProj: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelEntidClick(Sender: TObject);
    procedure bbtnInverteEntidClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTipoClick(Sender: TObject);
    procedure rgConsolidaClick(Sender: TObject);
    procedure bbtnSelAtivProClick(Sender: TObject);
    procedure bbtnInverteAtivProClick(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;

    ListaIdCurso, ListaIdCurso1,  ListaIdEntid, ListaIdAtivProj: TStringList;// SOL 180854 KINTANA 1675788 criado a variavel ListaIdCurso1

    sTipo, sListaFunc, sCurso, sCursoTodos, sEntid, sAtivProj, NumRelat: string; // SOL 180854 KINTANA 1675788 criado a variavel sCurso1
    //ChkCurso, ChkCurso1 : TCheckListBox; // SOL 180854 KINTANA 1675788 criado a variavel sCurso1
  public

    constructor Create(AOwner: TComponent; TipoRelatorio, NRelat: string); reintroduce;

  end;

var
  frmParamAtivTrein: TfrmParamAtivTrein;
  NumRelat: String;
implementation

uses uCtrlPadroes, uCtrlFuncoesRH, dCds;

{$R *.DFM}

constructor TfrmParamAtivTrein.Create(AOwner: TComponent; TipoRelatorio, NRelat: string);
begin
  sTipo := TipoRelatorio;
  NumRelat:= NRelat;
  inherited Create(AOwner);
end;

procedure TfrmParamAtivTrein.FormCreate(Sender: TObject);
var x: integer;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  ListaIdCurso     := TStringList.Create;
  ListaIdCurso1    := TStringList.Create; // SOL 180854 KINTANA 1675788
//  Chkcurso         := TCheckListBox.Create(Nil); // SOL 180854 KINTANA 1675788
//  Chkcurso.Parent  := self;
//  Chkcurso1        := TCheckListBox.Create(Nil); // SOL 180854 KINTANA 1675788
//  Chkcurso1.Parent := self;
  ListaIdEntid     := TStringList.Create;
  ListaIdAtivProj  := TStringList.Create;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  Cmp_Padrao.ParamByName('AvalAluno').asBoolean := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);

  // Preenche ChkList dos Cursos
  CdsCurso.Data := CtrlCurso.ListGeral;
  chklstCurso.Items.Clear;
  while not(CdsCurso.EOF) do
  begin
     ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
     chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
     CdsCurso.Next;

{    chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    if (CdsCurso.recno <= 900) then // SOL 180854 KINTANA 1675788 se lista for maior da erro na hora de criar o IN
    begin
       ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
       Chkcurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
       CdsCurso.Next;
    end
    else
    begin // SOL 180854 KINTANA 1675788
       ListaIdCurso1.Add(CdsCurso.FieldByName('IDCURSO').asString);
       ChkCurso1.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
       CdsCurso.Next;
    end;} // SOL 180854 KINTANA 1675788
  end;
  sCursoTodos := '';  // SOL 180854 KINTANA 1675788
  // Preenche ChkList das Entidades
  CdsEntid.Data := CtrlHistPessoa.ListEntidadeTreinamento;
  chklstEntid.Items.Clear;
  while not(CdsEntid.EOF) do
  begin
    ListaIdEntid.Add(CdsEntid.FieldByName('IDPESSOA').asString);
    chklstEntid.Items.Add(CdsEntid.FieldByName('NOME').asString);
    CdsEntid.Next;
  end;

  //Lista de Atividade/Projeto
  CdsAtivProj.Data := CtrlCurso.ListUnidNegoc;
  chklstAtiv.Items.Clear;
  while not(CdsAtivProj.EOF) do
  begin
    ListaIdAtivProj.Add(CdsAtivProj.FieldByName('UNIDNEGOC').asString);
    chklstAtiv.Items.Add(CdsAtivProj.FieldByName('NOME').asString);
    CdsAtivProj.Next;
  end;

  rgExibeConteudo.Visible := (sTipo = 'CURSO');
  rgTipo.Visible          := (sTipo = 'CURSO');
//Ádler Teodoro de Souza- INÍCIO - SOL N°116915 KTN N°559011
  rgConsolida.Visible     := (sTipo = 'False'); //Não se aplica em nenhum relatório
//Ádler Teodoro de Souza- FIM - SOL N°116915 KTN N°559011
  with (cmbSeqRel.Items) do
  begin
    Clear;
    if (sTipo = 'TREINANDO') then
    begin
      HelpContext := 720108;
      Add('Nome, Data, Curso');
      Add('Nome, Curso, Data');
      Add('Matrícula, Data, Curso');
      Add('Matrícula, Curso, Data');
      Add('C.Custo, Nome, Data, Curso');
      Add('C.Custo, Nome, Curso, Data');
      Add('C.Custo, Matrícula, Data, Curso');
      Add('C.Custo, Matrícula, Curso, Data');
    end
    else
    if (sTipo = 'CURSO') then
    begin
      HelpContext := 720106;
      Add('Curso, Nome, Data');
      Add('Curso, Data, Nome');
      Add('Curso, Matrícula, Data');
      Add('Curso, Data, Matrícula');
      Add('Curso, C.Custo, Nome, Data');
      Add('Curso, C.Custo, Data, Nome');
      Add('Curso, C.Custo, Matrícula, Data');
      Add('Curso, C.Custo, Data, Matrícula');
    end
    else
    begin
      HelpContext := 720107;
      Add('Entidade, Nome, Data');
      Add('Entidade, Data, Nome');
      Add('Entidade, Matrícula, Data');
      Add('Entidade, Data, Matrícula');
      Add('Entidade, Curso, Nome, Data');
      Add('Entidade, Curso, Data, Nome');
      Add('Entidade, Curso, Matrícula, Data');
      Add('Entidade, Curso, Data, Matrícula');
    end;
  end;

  cmbOrigem.ItemIndex := 0;
  cmbOrigem.Text := 'Qualquer Módulo';
  edData1.Date := Date - 365;
  edData2.Date := Date;
  cmbSeqRel.ItemIndex := 0;

  if NumRelat = '3670' then
  begin
    cmbResumo.Clear;
    cmbResumo.Items.Add('Atividade / Projeto');
    cmbResumo.Items.Add('Centro de Custo');
    cmbResumo.Items.Add('Atividade / Projeto, Centro de Custo');
    cmbResumo.Items.Add('Centro de Custo, Atividade / Projeto');
    cmbResumo.ItemIndex := 0;
    cmbResumo.Text := 'Atividade / Projeto';
  end else
  begin
    Cmp_Padrao.ParamByName('ListaAtiv').Destroy;
    Cmp_Padrao.ParamByName('NumRelat').Destroy;
    cmbResumo.Clear;
    cmbResumo.Items.Add('Tipo de Curso');
    cmbResumo.Items.Add('Centro de Custo');
    cmbResumo.Items.Add('Tipo de Curso, Centro de Custo');
    cmbResumo.Items.Add('Centro de Custo,Tipo de Curso');
    cmbResumo.ItemIndex := 0;
    cmbResumo.Text := 'Tipo de Curso';
    gbxAtiv.Enabled:= False;
  end;
end;

procedure TfrmParamAtivTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaIdCurso);
  FreeAndNil(ListaIdCurso1); //SOL 180854 KINTANA 1675788
//  FreeAndNil(Chkcurso); // SOL 180854 KINTANA 1675788
//  FreeAndNil(Chkcurso1); // SOL 180854 KINTANA 1675788
  FreeAndNil(ListaIdEntid);
  FreeAndNil(ListaIdAtivProj);
  inherited;
end;

procedure TfrmParamAtivTrein.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := true;
  sCursoTodos := 'TODOS';
//  for c:=0 to chkCurso.Items.Count-1 do // SOL 180854 KINTANA 1675788
//    chkCurso.Checked[c] := true;

//  for c:=0 to chkCurso1.Items.Count-1 do // SOL 180854 KINTANA 1675788
//    chkCurso1.Checked[c] := true;

  chklstCurso.Repaint;
end;

procedure TfrmParamAtivTrein.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := not(chklstCurso.Checked[c]);
    
  sCursoTodos := 'TODOS';
//  for c:=0 to chkCurso.Items.Count-1 do // SOL 180854 KINTANA 1675788
//    chkCurso.Checked[c] := not(chklstCurso.Checked[c]);

//  for c:=0 to chkCurso1.Items.Count-1 do // SOL 180854 KINTANA 1675788
//    chkCurso1.Checked[c] := not(chklstCurso.Checked[c]);

  chklstCurso.Repaint;
end;

procedure TfrmParamAtivTrein.bbtnSelEntidClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEntid.Items.Count-1 do
    chklstEntid.Checked[c] := true;
  chklstEntid.Repaint;
end;

procedure TfrmParamAtivTrein.bbtnInverteEntidClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEntid.Items.Count-1 do
    chklstEntid.Checked[c] := not(chklstEntid.Checked[c]);
  chklstEntid.Repaint;
end;

procedure TfrmParamAtivTrein.rgTipoClick(Sender: TObject);
begin
  if (rgTipo.ItemIndex = 1) then
  begin
    rgExibeConteudo.Caption := 'Exibe Conteúdo/Observações';
    rgConsolida.ItemIndex := 1;
    cmbResumo.ItemIndex := 0;
  end
  else
    rgExibeConteudo.Caption := 'Exibe Conteúdo e Local';
end;

procedure TfrmParamAtivTrein.rgConsolidaClick(Sender: TObject);
begin
  if (rgConsolida.ItemIndex = 0) then
    rgTipo.ItemIndex := 0;
end;

procedure TfrmParamAtivTrein.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  FU.CriaListaOpcoes(Chklstcurso, ListaIdCurso,     sCurso,     ',', false);
//  FU.CriaListaOpcoes(Chkcurso1, ListaIdCurso1,    sCurso1,    ',', false); //SOL 180854 KINTANA 1675788
  FU.CriaListaOpcoes(chklstEntid, ListaIdEntid,     sEntid,     ',', false);
  FU.CriaListaOpcoes(chklstAtiv,  ListaIdAtivProj,  sAtivProj,  ',', false);

  c:=0;
  while not(CdsPrincipal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := CdsPrincipal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  if sCursoTodos <> 'TODOS' then
     Cmp_Padrao.ParamByName('ListaCurso').asString      := sCurso;


  Cmp_Padrao.ParamByName('ListaEntid').asString      := sEntid;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString     := sListaFunc;
  Cmp_Padrao.ParamByName('DataIni').asDateTime       := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime       := EdData2.Date;
  Cmp_Padrao.ParamByName('IncPorConta').asInteger    := rgIncluiExternos.ItemIndex;
  Cmp_Padrao.ParamByName('TipoCusto').asInteger      := rgTipoCusto.ItemIndex;
  Cmp_Padrao.ParamByName('TipoResumo').asInteger     := cmbResumo.ItemIndex;
  Cmp_Padrao.ParamByName('Origem').asInteger         := cmbOrigem.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger       := cmbSeqRel.ItemIndex;
  Cmp_Padrao.ParamByName('Consolida').asInteger      := rgConsolida.ItemIndex;
  Cmp_Padrao.ParamByName('ExibeConteudo').asInteger  := rgExibeConteudo.ItemIndex;
  Cmp_Padrao.ParamByName('Tipo').asInteger           := rgTipo.ItemIndex;
  Cmp_Padrao.ParamByName('SelCurso1').asBoolean      := cbxRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso2').asBoolean      := cbxRealNaoProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso3').asBoolean      := cbxNaoRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso4').asBoolean      := cbxNaoRealNaoProgr.Checked;
  Cmp_Padrao.ParamByName('Candidatos').asBoolean     := cbxCandidatos.Checked;
  if NumRelat = '3670' then
  begin
    Cmp_Padrao.ParamByName('ListaAtiv').AsString       := sAtivProj;
    Cmp_Padrao.ParamByName('NumRelat').AsString        := NumRelat;
  end;

end;

procedure TfrmParamAtivTrein.bbtnSelAtivProClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstAtiv.Items.Count-1 do
    chklstAtiv.Checked[c] := true;
  chklstAtiv.Repaint;
end;

procedure TfrmParamAtivTrein.bbtnInverteAtivProClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstAtiv.Items.Count-1 do
    chklstAtiv.Checked[c] := not(chklstAtiv.Checked[c]);
  chklstAtiv.Repaint;
end;

end.

