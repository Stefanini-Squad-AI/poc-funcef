{===============================================================================
Unit    :  uGeraTabuaServico
Form    :  frmGeraTabuaServico

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 02/08/2000

Objetivo: Gerar Tábuas de Serviço

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uGeraTabuaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, FileCtrl,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, DBCtrls, uCalculaTabuaServico;

type
  TfrmGeraTabuaServico = class(TfrmSairAjuda)
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EdtIdadeMinima: TEdit;
    EdtIdadeMaxima: TEdit;
    GroupBox1: TGroupBox;
    Editfator: TEdit;
    DsTabMorte: TDataSource;
    QryTabMorte: TQuery;
    DsTabInvalidez: TDataSource;
    QryTabInvalidez: TQuery;
    DsTabEntrInvalidez: TDataSource;
    QryTabEntrInvalidez: TQuery;
    QryTabEntrInvalidezCD_TABUA: TFloatField;
    QryTabEntrInvalidezDS_TABUA: TStringField;
    QryTabInvalidezCD_TABUA: TFloatField;
    QryTabInvalidezDS_TABUA: TStringField;
    QryTabMorteCD_TABUA: TFloatField;
    QryTabMorteDS_TABUA: TStringField;
    DBCmbBxTabuaGeral: TDBLookupComboBox;
    DBCmbBxTabuaInvalidez: TDBLookupComboBox;
    DBCmbBxTabuaEntradaInv: TDBLookupComboBox;
    bbtnApaga: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnGera: TSpeedButton;
    procedure DBCmbBxTabuaGeralCloseUp(Sender: TObject);
    procedure DBCmbBxTabuaInvalidezCloseUp(Sender: TObject);
    procedure DBCmbBxTabuaEntradaInvCloseUp(Sender: TObject);
    procedure bbtnApagaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeraClick(Sender: TObject);
    procedure GeraTabelaComutacao;
    procedure GeraTabelaComutacaoInv;
    procedure EditfatorChange(Sender: TObject);
    procedure EdtIdadeMinimaChange(Sender: TObject);
    procedure EdtIdadeMaximaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraTabuaServico: TfrmGeraTabuaServico;
  Tabua_Servs : TList; {Tabela com valores calculados}
  reg_tabua_Servico : Treg_tabua_Servico;             
  {Definição de variáveis auxiliares}
  w_idade_maxima,
  w_idade_ini_MortGeral, w_idade_fim_MortGeral,
  w_idade_ini_Invalidez, w_idade_fim_Invalidez,
  w_idade_ini_EntradaInv,w_idade_fim_EntradaInv : integer;
  w_TabInvalidez, w_TabEntrada : integer;

implementation

uses uDtMdlSat, DRelatsAtuarial;
                 
{$R *.DFM}

procedure TfrmGeraTabuaServico.DBCmbBxTabuaGeralCloseUp(Sender: TObject);
begin
  if ((DBCmbBxTabuaGeral.Text <> '') and
     (DBCmbBxTabuaInvalidez.Text = '') and
     (DBCmbBxTabuaEntradaInv.Text = '')) or
   ((DBCmbBxTabuaGeral.Text <> '') and
   (DBCmbBxTabuaInvalidez.Text <> '') and
   (DBCmbBxTabuaEntradaInv.Text <> '')) then
    bbtnGera.Enabled := true
  else
    bbtnGera.Enabled := false;
end;

procedure TfrmGeraTabuaServico.DBCmbBxTabuaInvalidezCloseUp(
  Sender: TObject);
begin
  if DBCmbBxTabuaInvalidez.Text = '' then
    exit;

  if (DBCmbBxTabuaGeral.Text <> '') and
     (DBCmbBxTabuaInvalidez.Text <> '') and
     (DBCmbBxTabuaEntradaInv.Text <> '') then
    bbtnGera.Enabled := true
  else
    bbtnGera.Enabled := false;
end;

procedure TfrmGeraTabuaServico.DBCmbBxTabuaEntradaInvCloseUp(
  Sender: TObject);
begin
  if DBCmbBxTabuaEntradaInv.Text = '' then
    exit;

  if (DBCmbBxTabuaGeral.Text <> '') and
     (DBCmbBxTabuaInvalidez.Text <> '') and
     (DBCmbBxTabuaEntradaInv.Text <> '') then
    bbtnGera.Enabled := true
  else
    bbtnGera.Enabled := false;
end;

procedure TfrmGeraTabuaServico.bbtnApagaClick(Sender: TObject);
begin
   DBCmbBxTabuaGeral.KeyValue := null;
   DBCmbBxTabuaInvalidez.KeyValue := null;
   DBCmbBxTabuaEntradaInv.KeyValue := null;
   bbtnGera.Enabled := false;
end;

procedure TfrmGeraTabuaServico.FormCreate(Sender: TObject);
begin
  inherited;
  QryTabMorte.Open;
  QryTabInvalidez.Open;
  QryTabEntrInvalidez.Open;

  if dtmdlSat = nil then
    dtmdlSat := TdtmdlSat.create(application);

  DtmdlSat.BdTmp.Params.Strings[0] := '';
  DtmdlSat.BdTmp.Params.Strings[0] := 'PATH = ' + ExtractFileDir(Application.ExeName);
  DtmdlSat.BdTmp.Open;
end;

procedure TfrmGeraTabuaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryTabMorte.Close;
  QryTabInvalidez.Close;
  QryTabEntrInvalidez.Close;

  DtmdlSat.BdTmp.Close;
end;

procedure TfrmGeraTabuaServico.bbtnGeraClick(Sender: TObject);
begin

end;

//------------------------
{Gera arquivo para emissão da tabua de comutação s/ tabela de Invalidez}
procedure TfrmGeraTabuaServico.GeraTabelaComutacao;
var
 FTable : tTable;
 FDtSrc : tDataSource;

 w_tam, w_i : integer;
 w_juros    : extended;
begin
  try
  //-- Cria tabela
  FTable := tTable.Create (owner);
  FTable.DatabaseName := 'BdTmp';
  FTable.TableName    := 'Rel_TabComutacao.db';

  //-- Cria data source
  FDtSrc := tDataSource.Create (owner);
  FDtSrc.Name := 'FDtSrc';
  FDtSrc.DataSet := FTable;

  //-- Cria campos do Relatório
  FTable.FieldDefs.Create(FDtSrc.DataSet);
  FTable.FieldDefs.Add('idade', ftinteger, 0, true);
  FTable.FieldDefs.Add('l_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('d_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('DD_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('N_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('S_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('C_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('M_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('R_x',  ftfloat,   0, true);

  //-- Cria tabela fisicamente
  FTable.CreateTable;

  //-- Gera conteúdo para impressão
  FTable.open;

  //-- Calculo da tabela de comutação
  w_juros := strtofloat(Editfator.text);

  Tabua_Servs := calcula_tabua_servico
                 (frmGeraTabuaServico.QryTabMortecd_TABUA.AsInteger,
                  -1,
                  -1,
                  strtoint(EdtIdadeMinima.text),
                  strtoint(EdtIdadeMaxima.text),
                  w_juros);

  w_tam := Tabua_Servs.count; {Recupera numero de ocorrencias}

  //-- Cria form do relatório

  for w_i := 0 to (w_tam - 1) do
   begin
     FTable.insert;

     reg_tabua_Servico := Tabua_Servs.items[w_i];
     Ftable.FieldByName('idade').asinteger := reg_tabua_servico.idade;
     Ftable.FieldByName('l_x').asfloat     := reg_tabua_servico.l_x;
     Ftable.FieldByName('p_x').asfloat     := reg_tabua_servico.p_x;
     Ftable.FieldByName('d_x').asfloat     :=
                     reg_tabua_servico.l_x *  reg_tabua_servico.q_x;
     Ftable.FieldByName('q_x').asfloat     := reg_tabua_servico.q_x;
     Ftable.FieldByName('q_x').asfloat     := reg_tabua_servico.q_x;
     Ftable.FieldByName('N_x').asfloat     := reg_tabua_servico.N_x;
     Ftable.FieldByName('DD_x').asfloat     := reg_tabua_servico.D_x;
     Ftable.FieldByName('S_x').asfloat     := reg_tabua_servico.S_x;
     Ftable.FieldByName('C_x').asfloat     := reg_tabua_servico.C_x;
     Ftable.FieldByName('M_x').asfloat     := reg_tabua_servico.M_x;
     Ftable.FieldByName('R_x').asfloat     := reg_tabua_servico.R_x;

     FTable.post;
   end;

  Tabua_Servs.free;
  FTable.close;

  //-- emite
  dtmRelatsAtuarial.QryTabComutacao.close;
  dtmRelatsAtuarial.QryTabComutacao.open;

  dtmRelatsAtuarial.pRLabelmorte.Caption := QryTabMorteDS_TABUA.AsSTRING;

  dtmRelatsAtuarial.pRLabelfator.Caption := Editfator.text;
  dtmRelatsAtuarial.rpTabComutacao.Print;

  finally
   begin
     //-- Libera tabela
     FTable.Close;
     FTable.DeleteTable;
     FTable.Free;
     FDtSrc.Free;
   end;
  end;
end;

//------------------------
{Gera arquivo para emissão da tabua de comutação com tabela de Invalidez}
procedure TFrmGeraTabuaServico.GeraTabelaComutacaoInv;
var
 FTable : tTable;
 FDtSrc : tDataSource;

 w_tam, w_i : integer;
 w_juros    : extended;
begin
  try
  //-- Cria tabela
  FTable := tTable.Create (owner);
  FTable.DatabaseName := 'BdTmp';
  FTable.TableName    := 'Rel_TabComutacaoInv.db';

  //-- Cria data source
  FDtSrc := tDataSource.Create (owner);
  FDtSrc.Name := 'FDtSrc';
  FDtSrc.DataSet := FTable;

  //-- Cria campos do Relatório
  FTable.FieldDefs.Create(FDtSrc.DataSet);
  FTable.FieldDefs.Add('idade', ftinteger, 0, true);
  FTable.FieldDefs.Add('l_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('d_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x_ai',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x_ai',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x_a',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x_a',  ftfloat,   0, true);
  FTable.FieldDefs.Add('i_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('p_x_i',  ftfloat,   0, true);
  FTable.FieldDefs.Add('q_x_i',  ftfloat,   0, true);
  FTable.FieldDefs.Add('l_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('ll_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('l_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('N_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('DD_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('S_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('C_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('M_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('R_x',  ftfloat,   0, true);
  FTable.FieldDefs.Add('N_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('D_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('S_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('C_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('M_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('R_x_aa',  ftfloat,   0, true);
  FTable.FieldDefs.Add('N_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('D_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('S_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('C_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('M_x_ii',  ftfloat,   0, true);
  FTable.FieldDefs.Add('R_x_ii',  ftfloat,   0, true);

  //-- Cria tabela fisicamente
  FTable.CreateTable;

  //-- Gera conteúdo para impressão
  FTable.open;

  //-- Calculo da tabela de comutação
  w_juros := strtofloat(Editfator.text);

  Tabua_Servs := calcula_tabua_servico
                 (frmGeraTabuaServico.QryTabMortecd_TABUA.AsInteger,
                  w_TabInvalidez,
                  w_TabEntrada,
                  strtoint(EdtIdadeMinima.text),
                  strtoint(EdtIdadeMaxima.text),
                  w_juros);

  w_tam := Tabua_Servs.count; {Recupera numero de ocorrencias}

  //-- Cria form do relatório

  for w_i := 0 to (w_tam - 1) do
   begin
     FTable.insert;

     reg_tabua_Servico := Tabua_Servs.items[w_i];
     Ftable.FieldByName('idade').asinteger := reg_tabua_servico.idade;
     Ftable.FieldByName('l_x').asfloat     := reg_tabua_servico.l_x;
     Ftable.FieldByName('p_x').asfloat     := reg_tabua_servico.p_x;
     Ftable.FieldByName('q_x').asfloat     := reg_tabua_servico.q_x;
     Ftable.FieldByName('d_x').asfloat     :=
                     reg_tabua_servico.l_x *  reg_tabua_servico.q_x;
     Ftable.FieldByName('p_x_aa').asfloat  := reg_tabua_servico.p_x_aa;
     Ftable.FieldByName('q_x_aa').asfloat  := reg_tabua_servico.q_x_aa;
     Ftable.FieldByName('p_x_ai').asfloat  := reg_tabua_servico.p_x_ai;
     Ftable.FieldByName('q_x_ai').asfloat  := reg_tabua_servico.q_x_ai;
     Ftable.FieldByName('p_x_a').asfloat   := reg_tabua_servico.p_x_a;
     Ftable.FieldByName('q_x_a').asfloat   := reg_tabua_servico.q_x_a;
     Ftable.FieldByName('i_x').asfloat     := reg_tabua_servico.i_x;
     Ftable.FieldByName('p_x_i').asfloat   := reg_tabua_servico.p_x_i;
     Ftable.FieldByName('q_x_i').asfloat   := reg_tabua_servico.q_x_i;
     Ftable.FieldByName('l_x_aa').asfloat  := reg_tabua_servico.l_x_aa;
     Ftable.FieldByName('ll_x_aa').asfloat := reg_tabua_servico.ll_x_aa;
     Ftable.FieldByName('l_x_ii').asfloat := reg_tabua_servico.l_x_ii;
     Ftable.FieldByName('N_x').asfloat     := reg_tabua_servico.N_x;
     Ftable.FieldByName('DD_x').asfloat    := reg_tabua_servico.D_x;
     Ftable.FieldByName('S_x').asfloat     := reg_tabua_servico.S_x;
     Ftable.FieldByName('C_x').asfloat     := reg_tabua_servico.C_x;
     Ftable.FieldByName('M_x').asfloat     := reg_tabua_servico.M_x;
     Ftable.FieldByName('R_x').asfloat     := reg_tabua_servico.R_x;
     Ftable.FieldByName('N_x_aa').asfloat  := reg_tabua_servico.N_x_aa;
     Ftable.FieldByName('D_x_aa').asfloat  := reg_tabua_servico.D_x_aa;
     Ftable.FieldByName('S_x_aa').asfloat  := reg_tabua_servico.S_x_aa;
     Ftable.FieldByName('C_x_aa').asfloat  := reg_tabua_servico.C_x_aa;
     Ftable.FieldByName('M_x_aa').asfloat  := reg_tabua_servico.M_x_aa;
     Ftable.FieldByName('R_x_aa').asfloat  := reg_tabua_servico.R_x_aa;
     Ftable.FieldByName('N_x_ii').asfloat  := reg_tabua_servico.N_x_ii;
     Ftable.FieldByName('D_x_ii').asfloat  := reg_tabua_servico.D_x_ii;
     Ftable.FieldByName('S_x_ii').asfloat  := reg_tabua_servico.S_x_ii;
     Ftable.FieldByName('C_x_ii').asfloat  := reg_tabua_servico.C_x_ii;
     Ftable.FieldByName('M_x_ii').asfloat  := reg_tabua_servico.M_x_ii;
     Ftable.FieldByName('R_x_ii').asfloat  := reg_tabua_servico.R_x_ii;

     FTable.post;
   end;

  Tabua_Servs.free;

  FTable.close;

  //-- emite
  dtmRelatsAtuarial.QryTabComutInv.close;
  dtmRelatsAtuarial.QryTabComutInv.open;

  dtmRelatsAtuarial.pRLabelmorteInv.Caption := QryTabMorteDS_TABUA.AsSTRING;
  dtmRelatsAtuarial.pRLabelinval.Caption := QryTabInvalidezDS_TABUA.AsSTRING;
  dtmRelatsAtuarial.pRLabelentri.Caption := QryTabEntrInvalidezDS_TABUA.AsSTRING;
  dtmRelatsAtuarial.pRLabelfatorInv.Caption := Editfator.text;

  dtmRelatsAtuarial.rpTabComutInv.Print;

  finally
   begin
     //-- Libera tabela
     FTable.Close;
     FTable.DeleteTable;
     FTable.Free;
     FDtSrc.Free;
   end;
  end;
end;

procedure TfrmGeraTabuaServico.EditfatorChange(Sender: TObject);
begin
   try
     strtofloat(Editfator.text)
   except
     ShowMessage('Informe um valor numérico');
     Editfator.SetFocus;
   end;
end;

procedure TfrmGeraTabuaServico.EdtIdadeMinimaChange(Sender: TObject);
begin
   try
     strtoint(EdtIdadeMinima.text)
   except
     ShowMessage('Informe um valor numérico inteiro');
     EdtIdadeMinima.SetFocus;
   end;
end;

procedure TfrmGeraTabuaServico.EdtIdadeMaximaChange(Sender: TObject);
begin
   try
     strtoint(EdtIdadeMaxima.text)
   except
     ShowMessage('Informe um valor numérico inteiro');
     EdtIdadeMaxima.SetFocus;
   end;
end;

procedure TfrmGeraTabuaServico.SpeedButton1Click(Sender: TObject);
begin
  if VarIsNull(DBCmbBxTabuaGeral.keyvalue) then
    begin
       ShowMessage('Informe a Tábua de Mortalidade');
       DBCmbBxTabuaGeral.SetFocus;
       exit;
    end;

   w_TabInvalidez := -1;
   w_TabEntrada   := -1;

   if VarIsNull(DBCmbBxTabuaInvalidez.keyvalue) then
     {Gera arquivo para emissão da tabua de comutação s/ tabela de Invalidez}
      GeraTabelaComutacao
   else
     begin
      w_TabInvalidez := QryTabInvalidezcd_TABUA.AsInteger;

      if VarIsNull(DBCmbBxTabuaEntradaInv.keyvalue) then
        ShowMessage('Informe a Tábua de Entrada em Invalidez');

      w_TabEntrada := QryTabEntrInvalidezcd_TABUA.AsInteger;

     {Gera arquivo para emissão da tabua de comutação com tabela de Invalidez}
      GeraTabelaComutacaoInv;
     end;
end;

end.
