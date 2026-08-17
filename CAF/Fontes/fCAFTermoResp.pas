// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   : Thiago Melo
// Data       : 26/06/2013
// SOL        : 209737
// KTN        : 2024099
// Alteração  : Unidades não apresentadas nos combos
//------------------------------------------------------------------------------
// Autor(a)   : Arnaldo V. Scarin
// Data       : 04/12/2009
// SOL        : 126066
// KTN        : 656022
// Alteração  : Criacao de Numeração Sequencial para o Termo de Responsabilidade
//------------------------------------------------------------------------------
// Autor(a)   : Ádler Teodoro de Souza
// Rotina     : Todas
// Data       : 30/06/2009
// SOL        : 58194
// KTN        : 537571
// Alteração  : Criação de tela conforme RM.
//------------------------------------------------------------------------------
unit fCAFTermoResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, CheckLst, Mask, wwdbedit, wwdblook,
  ExtCtrls, TXComp, TXRB, uCmRptManager, MontaSelect, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, RCAFTermoResp,
  DBTables, Wwquery;

type
  TfrmCAFTermoResp = class(TfrmParamReports_Padrao)
    sqlRespon: TCMSqlParams;
    cdsRespon: TCMClientDataSet;
    sqlTermoResp: TCMSqlParams;
    dsTermoResp: TwwDataSource;
    cdsTermoResp: TCMClientDataSet;
    MSBem: TMontaSelect;
    rgBensOrdenados: TRadioGroup;
    rgExibir: TRadioGroup;
    lblLocalizacao: TLabel;
    Label1: TLabel;
    lblRespon: TLabel;
    cmbResponsavel: TwwDBLookupCombo;
    lblConjunto: TLabel;
    cmbConjunto: TwwDBLookupCombo;
    lblPlaca: TLabel;
    dbeTombamento: TwwDBEdit;
    bbtnIncluiBenef: TBitBtn;
    bbtnExcluiTudo: TBitBtn;
    bbtnSelConjunto: TBitBtn;
    clbLista: TCheckListBox;
    cboxIndividual: TCheckBox;
    cmbLocalizacao: TwwDBLookupCombo;
    qryLocalizacao: TwwQuery;
    dsLocalizacao: TwwDataSource;
    dsConjunto: TwwDataSource;
    qryConjunto: TwwQuery;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    qryLocalizacaoIDPESSOA: TFloatField;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnIncluiBenefClick(Sender: TObject);
    procedure bbtnExcluiTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaLista;
    function LocalizaNumeroTermoResponsabilidade: Integer;
  public
    { Public declarations }
    ListaId : TStringList;
    Check : Integer;
  end;

var
  frmCAFTermoResp: TfrmCAFTermoResp;

implementation

{$R *.DFM}

procedure TfrmCAFTermoResp.bbtnSelConjuntoClick(Sender: TObject);
begin
  inherited;
  MSBem.Executar;
//==========================
  if MSBem.RetornouValor then
    carregalista;
end;

procedure TFrmCAFTermoResp.CarregaLista;
begin
  dbeTombamento.Text := MSBem.ValoresChave[2];
end;

procedure TfrmCAFTermoResp.bbtnIncluiBenefClick(Sender: TObject);
begin
  inherited;
  if dbeTombamento.Text <> '' then
  begin
    clbLista.Items.Add(MSBem.ValoresChave[2]);
    ListaId.Add(MSBem.ValoresChave[1]); //Preenche a Lista de ID's.
    dbeTombamento.Clear;
    MSBem.ValoresChave.Clear;
    clbLista.Checked[Check] := true;
    Inc(Check);
  end
  else
    exit;
end;

procedure TfrmCAFTermoResp.bbtnExcluiTudoClick(Sender: TObject);
begin
  inherited;
  Check := 0;
  clbLista.Clear;
  ListaId.Clear;
end;

procedure TfrmCAFTermoResp.bbtnConfirmarClick(Sender: TObject);
var bTudo : boolean;
        I : integer;
   sLista :  string;
begin
  inherited;
  sLista := '';
  bTudo  := true;

//========== INÍCIO DA VERIFICAÇÃO =============================================

  for I := 0 to clbLista.Items.Count - 1 do
    if clbLista.Checked[I] then
    begin
      if sLista = '' then
        sLista := ListaId[I]
      else
        sLista := sLista + ', ' + ListaId[I];
    end
    else
      bTudo := False;

//========== FIM DA VERIFICAÇÃO ================================================

//========== ATRIBUIÇÕES =======================================================

  if cmbLocalizacao.LookupValue = '' then
    cmbLocalizacao.LookupValue := '0';

  if cmbResponsavel.LookupValue = '' then
    cmbResponsavel.LookupValue := '0';

  if cmbConjunto.LookupValue = '' then
    cmbConjunto.LookupValue := '0';

  if bTudo then
  begin
    Cmp_Padrao.ParamValues[0].AsInteger  := rgBensOrdenados.ItemIndex;
    Cmp_Padrao.ParamValues[1].AsInteger  := rgExibir.ItemIndex;
    Cmp_Padrao.ParamValues[2].AsInteger  := strtoint(cmbLocalizacao.LookupValue);
    Cmp_Padrao.ParamValues[3].AsInteger  := strtoint(cmbResponsavel.LookupValue);
    Cmp_Padrao.ParamValues[4].AsInteger  := strtoint(cmbConjunto.LookupValue);
    Cmp_Padrao.ParamValues[5].AsString   := sLista;
    Cmp_Padrao.ParamValues[6].AsBoolean  := cboxIndividual.Checked;
    // Alterado por Arnaldo V. Scarin em 04/12/2009
    // SOL: 126066 KTN : 656022
    // Criacao de Numeração Sequencial para o Termo de Responsabilidade
    Cmp_Padrao.ParamValues[8].AsDateTime := Date;
    Cmp_Padrao.ParamValues[7].AsInteger  := LocalizaNumeroTermoResponsabilidade;
  end;
end;

// Alterado por Arnaldo V. Scarin em 04/12/2009
// SOL: 126066 KTN : 656022
// Criacao de Numeração Sequencial para o Termo de Responsabilidade
function TFrmCAFTermoResp.LocalizaNumeroTermoResponsabilidade : Integer;
var sExercicio : String;
    oQry : TQuery;

     Procedure _Localiza();
     begin
       with oQry do
       begin
         DataBaseName := 'BaseDados';
         Sql.Text := 'Select IdNumTermo'+#13+
                     'from NumTermoResp'+#13+
                     'Where IdBensOrdenados = :BensOrdenados'+#13+
                     '  and IdExibir        = :Exibir'+#13+
                     '  and IdLocalizacao   = :Localizacao'+#13+
                     '  and IdResponsavel   = :Responsavel'+#13+
                     '  and IdConjunto      = :Conjunto'+#13+
                     '  and IdExercicio     = :Exercicio';
         Prepare;
         ParamByName('Exercicio').asString      := sExercicio;
         ParamByName('BensOrdenados').asInteger := Cmp_Padrao.ParamValues[0].AsInteger;
         ParamByName('Exibir').asInteger        := Cmp_Padrao.ParamValues[1].AsInteger;
         ParamByName('Localizacao').asInteger   := Cmp_Padrao.ParamValues[2].AsInteger;
         ParamByName('Responsavel').asInteger   := Cmp_Padrao.ParamValues[3].AsInteger;
         ParamByName('Conjunto').asInteger      := Cmp_Padrao.ParamValues[4].AsInteger;
         Open;
       end;
     end;

     Function _Insere : Integer;
     begin
       with oQry do
       begin
         Close;
         Sql.Text := 'Select Max(IdNumTermo) as IdNumTermo'+#13+
                     'From NumTermoResp Where idExercicio = '+sExercicio;
         Open;
         Result   := FieldByName('IdNumTermo').asInteger + 1;
         Sql.Text := 'Insert into NumTermoResp(IdExercicio,IdNumTermo,IdBensOrdenados,'+
                     'IdExibir,IdLocalizacao,IdResponsavel,IdConjunto)'+#13+
                     'Values(:Data,:IdNumTermo,:BensOrdenados,:Exibir,'+
                     ':Localizacao,:Responsavel,:Conjunto)';
         Prepare;
         ParamByName('Data').asInteger          := StrToInt(sExercicio);
         ParamByName('IdNumTermo').asFloat      := Result;
         ParamByName('BensOrdenados').asInteger := Cmp_Padrao.ParamValues[0].AsInteger;
         ParamByName('Exibir').asInteger        := Cmp_Padrao.ParamValues[1].AsInteger;
         ParamByName('Localizacao').asInteger   := Cmp_Padrao.ParamValues[2].AsInteger;
         ParamByName('Responsavel').asInteger   := Cmp_Padrao.ParamValues[3].AsInteger;
         ParamByName('Conjunto').asInteger      := Cmp_Padrao.ParamValues[4].AsInteger;
         ExecSQL;
         Sql.Text := 'Commit';
         ExecSql;
       end;
     end;

begin
  sExercicio := FormatDateTime('YYYY',Cmp_Padrao.ParamValues[8].AsDateTime);
  oQry := TQuery.Create(Nil);
  try
    with oQry do
    begin
      _Localiza;
      If Not IsEmpty then
        Result := FieldByName('IdNumTermo').AsInteger
      Else
        Result := _Insere;
    end;
  Finally
    FreeAndNil(oQry);
  End;
end;

procedure TfrmCAFTermoResp.FormShow(Sender: TObject);
begin
  inherited;
  Check := 0;
  ListaId := TStringList.Create;

  MSBem.Filtro.Add('BEM.IDPESSOA = 1');
  MSBem.Filtro.Add('BEM.IDMODULO = 7');
end;

end.
