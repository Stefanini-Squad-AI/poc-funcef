unit uComparaVersoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, DBTables,
  Wwdatsrc, Wwquery, Math;

type
  TfrmComparaVersoes = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    DBLkpCmbBxVersaoAtu: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLkpCmbBxVersaoAnt: TDBLookupComboBox;
    DBEditVersaoAtu: TDBEdit;
    DBEditVersaoAnt: TDBEdit;
    GroupBox3: TGroupBox;
    BtBtnLimpar: TBitBtn;
    GroupBox2: TGroupBox;
    wwqryGrupoAtributoPartic: TwwQuery;
    wwqryGrupoAtributoParticNO_TABELA: TStringField;
    wwqryGrupoAtributoParticNO_ATRIBUTO_TABELA: TStringField;
    wwqryGrupoAtributoParticDS_ATRIBUTO_TABELA: TStringField;
    wwqryGrupoAtributoParticTP_ATRIBUTO: TStringField;
    wwqryGrupoAtributoParticNR_TAM_ATRIBUTO_TABELA: TFloatField;
    wwqryGrupoAtributoParticIR_MANDATORIO: TStringField;
    wwqryGrupoAtributoParticIR_CARGA_OBRIGATORIA: TStringField;
    wwqryGrupoAtributoParticNR_ORDEM: TFloatField;
    wwqryGrupoAtributoParticNO_TABELA_LOOKUP: TStringField;
    wwqryGrupoAtributoParticNO_ATRIBUTO_TABELA_LOOKUP: TStringField;
    wwqryGrupoAtributoParticCD_GRUPO: TFloatField;
    dsGrupoAtributoPartic: TwwDataSource;
    GroupBox4: TGroupBox;
    ComboBoxPartic: TComboBox;
    DBLookupComboBoxPartic: TDBLookupComboBox;
    GroupBoxDep: TGroupBox;
    ComboBoxDep: TComboBox;
    DBLkpCmbBxDep: TDBLookupComboBox;
    wwqryGrupoAtributoBenef: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField2: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField3: TFloatField;
    wwDsGrupoAtributoBenef: TwwDataSource;
    wwqryGrupoAtributoDep: TwwQuery;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField4: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField5: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField6: TFloatField;
    wwDsGrupoAtributoDep: TwwDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBLkpCmbBxValor: TDBLookupComboBox;
    wwDsTempo: TwwDataSource;
    wwQryTempo: TwwQuery;
    ComboBoxOper: TComboBox;
    ComboBoxComparacao: TComboBox;
    GroupBox7: TGroupBox;
    BitBtn5: TBitBtn;
    DBLkpCmbBxTempo: TDBLookupComboBox;
    EditValor: TEdit;
    ComboBoxTempo: TComboBox;
    wwQryValor: TwwQuery;
    wwDsValor: TwwDataSource;
    wwQryVesaoAnt: TwwQuery;
    wwDsVersaoAnt: TwwDataSource;
    wwDsVersaoAtu: TwwDataSource;
    wwQryVesaoAtu: TwwQuery;
    wwQryVesaoAtuCD_VERSAO: TFloatField;
    wwQryVesaoAtuDS_VERSAO: TStringField;
    wwQryVesaoAtuDT_GERACAO: TDateTimeField;
    wwQryVesaoAtuLOGIN: TStringField;
    wwQryVesaoAtuDT_REFER_BASE: TDateTimeField;
    wwQryVesaoAtuIR_BASE_HISTORICA: TStringField;
    wwQryVesaoAntCD_VERSAO: TFloatField;
    wwQryVesaoAntDS_VERSAO: TStringField;
    wwQryVesaoAntDT_GERACAO: TDateTimeField;
    wwQryVesaoAntLOGIN: TStringField;
    wwQryVesaoAntDT_REFER_BASE: TDateTimeField;
    wwQryVesaoAntIR_BASE_HISTORICA: TStringField;
    wwQryTempoCD_TIPO_TEMPO: TFloatField;
    wwQryTempoDS_TIPO_TEMPO: TStringField;
    wwQryTempoIR_DOMINIO_SISTEMA: TStringField;
    wwQryValorCD_TIPO_VALOR: TFloatField;
    wwQryValorDS_TIPO_VALOR: TStringField;
    ListBoxCondicao: TListBox;
    Memo1: TMemo;
    wwQryVersoes: TwwQuery;
    qryCriaTemp: TwwQuery;
    qryDelTemp: TwwQuery;
    qryInsTemp: TwwQuery;
    dtbsTemporario: TDatabase;
    qryParticipante: TwwQuery;
    Label3: TLabel;
    DBLkpCmbBxGrupo: TDBLookupComboBox;
    wwQryGrupo: TwwQuery;
    wwDSGrupo: TwwDataSource;
    wwQryGrupoCD_GRUPO_PARTIC: TFloatField;
    wwQryGrupoNO_GRUPO_PARTIC: TStringField;
    EditPrecisao: TEdit;
    wwQryTipoBenef: TwwQuery;
    wwQryTipoBenefDS_TIPO_BENEF: TStringField;
    RadioGroupCompara: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtBtnLimparClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure AtualizaTabela(nometab : string);
    procedure AtualizaCampos(campo   : string);
    procedure AtualizaCamposTempo(campo   : string);
    procedure AtualizaCamposValor(campo   : string);
    procedure AtualizaCamposDep  (campo   : string);
    procedure AtualizaCamposBenef(campo   : string);
    procedure AtualizaCondicao      (condicaoSQLL, condicaoL : string);
    procedure AtualizaCondicaoTempo (condicaoSQLL, condicaoL, tipo : string);
    procedure AtualizaCondicaoValor (condicaoSQLL, condicaoL, operacaoL, constanteL, tipo : string);
    procedure AtualizaCondicaoDep   (condicaoSQLL, condicaoL : string);
    procedure AtualizaCondicaoBenef  (condicaoSQLL, condicaoL : string);
    procedure AtualizaCondicaoWhereTempo (condicaoWhereL : string);
    procedure AtualizaCondicaoWhereValor (condicaoWhereL : string);
    function CalcValor(operacaoC, valorAtu, valorAnt : string) : real;

    procedure GravaCritica(Condicao : string; Versao, Partic : integer; ValCamposAtu, ValCamposAnt : string);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MontaParticipante;
    procedure MontaDependente;
    procedure MontaBenef;
    procedure MontaTempo;
    procedure MontaValor;
    function  RecuperaBenef(tipo : string) : string;
    procedure RadioGroupComparaClick(Sender: TObject);
    procedure MontaParticMatricula;
    procedure MontaBeneficioMatricula;
    procedure MontaTempoMatricula;
    procedure MontaValorMatricula;

  private
     NomeTabela    : tstringlist;
     Campos        : tstringlist;
     CamposTempo   : tstringlist;
     CamposValor   : tstringlist;
     CamposDep     : tstringlist;
     CamposBenef   : tstringlist;
     ValCamposAtu  : tstringlist;
     ValCamposAnt  : tstringlist;
     CondicaoSQL   : tstringlist;
     CondicaoSQLTempo : tstringlist;
     CondicaoSQLValor : tstringlist;
     CondicaoSQLDep   : tstringlist;
     CondicaoSQLBenef : tstringlist;
     CondicaoWhereTempo : tstringlist;
     CondicaoWhereValor : tstringlist;
     CondicaoWhereDep   : tstringlist;
     Condicao      : tstringlist;
     CondicaoValor : tstringlist;
     CondicaoTempo : tstringlist;
     CondicaoDep   : tstringlist;
     CondicaoBenef : tstringlist;
     TipoValor : tstringlist;
     TipoTempo : tstringlist;
     TipoBenef : tstringlist;
     Operacao      : tstringlist;
     Constante     : tstringlist;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComparaVersoes: TfrmComparaVersoes;
  SQL : string;
  cmdsql : string;
  CD_TIPO_TEMPO, CD_TIPO_VALOR, CD_VERSAO, CD_PARTIC, CD_DEPENDENTE: integer;
  nomecampo : string;


implementation

uses dBaseDados, DRelatsAtuarial;

{$R *.DFM}

procedure TfrmComparaVersoes.FormCreate(Sender: TObject);
begin
  dtbsTemporario.Params.Strings[0] := '';
  dtbsTemporario.Params.Strings[0] := 'PATH = ' + ExtractFileDir(Application.ExeName);
  dtbsTemporario.Open;

  inherited;
  wwQryVesaoAtu.close;
  wwQryVesaoAnt.close;
  wwQryGrupo.close;
  wwqryGrupoAtributoPartic.close;
  wwqryGrupoAtributoDep.close;
  wwqryGrupoAtributoBenef.close;
  wwqryTempo.close;
  wwqryValor.close;

  wwQryVesaoAtu.open;
  wwQryVesaoAnt.open;
  wwQryGrupo.open;
  wwqryGrupoAtributoPartic.open;
  wwqryGrupoAtributoDep.open;
  wwqryGrupoAtributoBenef.open;
  wwqryTempo.open;
  wwqryValor.open;

  NomeTabela    := tstringlist.Create;
  Campos        := tstringlist.Create;
  CamposTempo   := tstringlist.Create;
  CamposValor   := tstringlist.Create;
  CamposDep     := tstringlist.Create;
  CamposBenef   := tstringlist.Create;
  ValCamposAtu  := tstringlist.Create;
  ValCamposAnt  := tstringlist.Create;
  CondicaoSQL   := tstringlist.Create;
  CondicaoSQLTempo := tstringlist.Create;
  CondicaoSQLValor := tstringlist.Create;
  CondicaoSQLDep := tstringlist.Create;
  CondicaoSQLBenef := tstringlist.Create;
  CondicaoWhereTempo := tstringlist.Create;
  CondicaoWhereValor := tstringlist.Create;
  Condicao      := tstringlist.Create;
  CondicaoTempo := tstringlist.Create;
  CondicaoValor := tstringlist.Create;
  CondicaoDep := tstringlist.Create;
  CondicaoBenef := tstringlist.Create;
  TipoTempo := tstringlist.Create;
  TipoBenef := tstringlist.Create;
  TipoValor := tstringlist.Create;
  Operacao      := tstringlist.Create;
  Constante     := tstringlist.Create;

  DBLkpCmbBxGrupo.KeyValue := -1;

end;

procedure TfrmComparaVersoes.BitBtn1Click(Sender: TObject);
begin
   if (DBLookupComboBoxPartic.Text = '') or
      (ComboBoxPartic.Text = '') then
      raise exception.Create ('Falta selecionar condição para Participante');

  //--  Campo Selecionado

  AtualizaCampos(wwqryGrupoAtributoPartic.FieldByName('NO_TABELA').asstring + '.' +
                 wwqryGrupoAtributoPartic.FieldByName('NO_ATRIBUTO_TABELA').asstring);

  ListBoxCondicao.Items.Add( 'Participante.' + wwqryGrupoAtributoPartic.FieldByName('DS_ATRIBUTO_TABELA').asstring
                   + ' >> ' + ComboBoxPartic.Text);

  //-- Condição SQL
  SQL := '';
  SQL := 'Participante.' + wwqryGrupoAtributoPartic.FieldByName('DS_ATRIBUTO_TABELA').asstring
                         + ' >> ' + ComboBoxPartic.Text;
  AtualizaCondicao(SQL, ComboBoxPartic.Text);


  //-- Atualiza Tabela
  AtualizaTabela(wwqryGrupoAtributoPartic.FieldByName('NO_TABELA').asstring);

end;

procedure TfrmComparaVersoes.BtBtnLimparClick(Sender: TObject);
begin

 DBLkpCmbBxGrupo.keyvalue := -1;
 DBLookupComboBoxPartic.keyvalue := '';
 ComboBoxPartic.Text := '';
 DBLkpCmbBxDep.keyvalue := '';
 ComboBoxDep.Text := '';
 DBLkpCmbBxTempo.keyvalue := -1;
 ComboBoxTempo.Text := '';
 DBLkpCmbBxValor.keyvalue := -1;
 ComboBoxOper.Text := '';
 ComboBoxComparacao.Text := '';
 EditValor.Text := '';
 EditPrecisao.text := '2';

 ListBoxCondicao.clear;

 CondicaoSQL.Clear;
 CondicaoSQLTempo.Clear;
 CondicaoSQLValor.Clear;
 CondicaoSQLDep.Clear;
 CondicaoSQLBenef.Clear;
 CondicaoWhereTempo.Clear;
 CondicaoWhereValor.Clear;
 Condicao.Clear;
 CondicaoTempo.Clear;
 CondicaoValor.Clear;
 CondicaoDep.Clear;
 CondicaoBenef.Clear;
 TipoTempo.Clear;
 TipoBenef.Clear;
 TipoValor.Clear;
 Operacao.Clear;
 Constante.Clear;
 Campos.Clear;
 CamposTempo.Clear;
 CamposValor.Clear;
 CamposDep.Clear;
 CamposBenef.Clear;
 ValCamposAtu.Clear;
 ValCamposAnt.Clear;
 NomeTabela.Clear;

end;

procedure TfrmComparaVersoes.BitBtn2Click(Sender: TObject);
begin
   if (DBLkpCmbBxDep.Text = '') or
      (ComboBoxDep.Text = '') then
      raise exception.Create ('Falta selecionar condição para Dependente');


  //--  Campo Selecionado

  AtualizaCamposDep(wwqryGrupoAtributoDep.FieldByName('NO_TABELA').asstring + '.' +
                    wwqryGrupoAtributoDep.FieldByName('NO_ATRIBUTO_TABELA').asstring);


  ListBoxCondicao.Items.Add( 'Dependente.' + wwqryGrupoAtributoDep.FieldByName('DS_ATRIBUTO_TABELA').asstring
                   + ' >> ' + ComboBoxDep.Text);

  //-- Condição SQL
  SQL := '';
  SQL := 'Dependente.' + wwqryGrupoAtributoDep.FieldByName('DS_ATRIBUTO_TABELA').asstring
                   + ' >> ' + ComboBoxDep.Text;
  AtualizaCondicaoDep(SQL, ComboBoxDep.Text);


end;

procedure TfrmComparaVersoes.BitBtn5Click(Sender: TObject);
begin
  if (DBLkpCmbBxTempo.Text = '') or
     (ComboBoxTempo.Text = '') then
      raise exception.Create ('Falta selecionar condição para Tempo');

  AtualizaCondicaoWhereTempo ( wwQryTempo.FieldByName('CD_TIPO_TEMPO').asstring );

  ListBoxCondicao.Items.Add( 'Tempo.' + wwQryTempo.FieldByName('DS_TIPO_TEMPO').asstring
                   + ' >> ' + ComboBoxTempo.Text );

  //-- Condição SQL
  SQL := 'Tempo.' + wwQryTempo.FieldByName('DS_TIPO_TEMPO').asstring
                   + ' >> ' + ComboBoxTempo.Text;
  AtualizaCondicaoTempo(SQL, ComboBoxTempo.Text, wwQryTempo.FieldByName('CD_TIPO_TEMPO').asstring );


  //--  Campo Selecionado

  AtualizaCamposTempo('FI_TEMPO_PARTICIPANTE' + '.' + 'DT_TEMPO');

end;

procedure TfrmComparaVersoes.BitBtn3Click(Sender: TObject);
var
  s : string;
  valor : real;
  valint : integer;

begin
  if (DBLkpCmbBxValor.Text = '') or
     (ComboBoxOper.Text = '')  or
     (ComboBoxComparacao.Text = '')  or
     (EditValor.Text = '')  or
     (EditPrecisao.Text = '')   then
      raise exception.Create ('Falta selecionar condição para Valor');

  s := EditValor.text;

  while Pos('.', S) > 0 do
    S[Pos('.', S)] := ',';

  try
    valor := strtofloat(trim(S));
  except
    raise exception.Create('Valor Inválido');
  end;

  EditValor.text := S;

  try
    valint := floor(strtofloat(trim(EditPrecisao.text)));
  except
    raise exception.Create('Precisão Inválida');
  end;

  EditPrecisao.text := inttostr(valint);

  AtualizaCondicaoWhereValor( wwQryValor.FieldByName('CD_TIPO_VALOR').asstring );

  ListBoxCondicao.Items.Add( 'Valor.' + wwQryValor.FieldByName('DS_TIPO_VALOR').asstring
                   + ' >> ' + ' Operação: ' + ComboBoxOper.text
                   + ' - Condição: ' + ComboBoxComparacao.Text + ' ' + EditValor.Text );


  //-- Condição SQL
  SQL := 'Valor.' + wwQryValor.FieldByName('DS_TIPO_VALOR').asstring
                   + ' >> ' + ' Operação: ' + ComboBoxOper.text
                   + ' - Condição: ' + ComboBoxComparacao.Text + ' ' + EditValor.Text;
  AtualizaCondicaoValor(SQL, ComboBoxComparacao.Text, ComboBoxOper.text, trim(EditValor.Text),
                              wwQryValor.FieldByName('CD_TIPO_VALOR').asstring );


  //--  Campo Selecionado

  AtualizaCamposValor('FI_VALOR_PARTICIPANTE' + '.' + 'VL_PARTICIPANTE');

end;

procedure TfrmComparaVersoes.bbtnConfirmarClick(Sender: TObject);

begin
 //-- Tabela Temporaria utilizada no Relatório
  try
   qryDelTemp.ExecSQL;
  except  end;
  try
   qryCriaTemp.ExecSQL;
  except  end;


//-- Monta campos de resultado - Participante
if Campos.Count > 0 then
   MontaParticipante;

//-- Monta campos de resultado - Dependente

if CamposDep.Count > 0 then
   MontaDependente;

   //-- Monta campos de resultado - Beneficio

if CamposBenef.Count > 0 then
   MontaBenef;

//-- Monta campos de resultado -  Tempo

if CamposTempo.Count > 0 then
   MontaTempo;

//-- Monta campos de resultado - Valor

if CamposValor.Count > 0 then
   MontaValor;

   //-- Emite Relatorio
   dtmRelatsAtuarial.qryComparaVersao.Open;
   dtmRelatsAtuarial.QrlVersaoAtual.Caption := DBLkpCmbBxVersaoAtu.text;
   dtmRelatsAtuarial.QrlVersaoAnterior.Caption := DBLkpCmbBxVersaoAnt.text;
   dtmRelatsAtuarial.QrlGrupoExportacao.Caption := DBLkpCmbBxGrupo.text;
   dtmRelatsAtuarial.rpComparaVersao.print;
   dtmRelatsAtuarial.qryComparaVersao.Close;
      dtmRelatsAtuarial.QrlVersaoAtual.Caption := '';
   dtmRelatsAtuarial.QrlVersaoAnterior.Caption := '';
   dtmRelatsAtuarial.QrlGrupoExportacao.Caption := '';


  try
   qryDelTemp.ExecSQL;
  except  end;
end;
//-- Monta Paricipante -------------------------------------------------------------
procedure TfrmComparaVersoes.MontaParticipante;
var
 i : integer;

begin

  cmdsql := 'Select ';
  cmdsql := cmdsql +  NomeTabela[0] + '.CD_VERSAO, ';
  cmdsql := cmdsql +  NomeTabela[0] + '.CD_PARTIC, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  NomeTabela[0] + '.NR_MATRICULA, ';

  for i := 0 to   Campos.Count-1  do
    if i = Campos.Count-1 then
      cmdsql := cmdsql +  Campos[i] + ' from '
    else
      cmdsql := cmdsql +  Campos[i] + ', ';


 //-- Monta Juncao

  for i := 0 to   NomeTabela.Count-1  do
    if i = NomeTabela.Count-1 then
       if DBLkpCmbBxGrupo.KeyValue = -1 then
          cmdsql := cmdsql +  NomeTabela[i] + ' ' +  NomeTabela[i]  +    '  where '
       else
          cmdsql := cmdsql + ' FI_PARTICIPANTE FI_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
  else
       cmdsql := cmdsql +  NomeTabela[i] + ' ' +  NomeTabela[i] + ', ';

   cmdsql := cmdsql +  ' FI_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAtu.fieldbyname('CD_VERSAO').asstring;


   if DBLkpCmbBxGrupo.KeyValue = -1 then
   else
     begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
      cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
     end;

  //-- Monta campos de resultado - Segunda Versao - Participante

  cmdsql := cmdsql + ' union Select ';
  cmdsql := cmdsql +  NomeTabela[0] + '.CD_VERSAO, ';
  cmdsql := cmdsql +  NomeTabela[0] + '.CD_PARTIC, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  NomeTabela[0] + '.NR_MATRICULA, ';

  for i := 0 to   Campos.Count-1  do
    if i = Campos.Count-1 then
      cmdsql := cmdsql +  Campos[i] + ' from '
    else
      cmdsql := cmdsql +  Campos[i] + ', ';


 //-- Monta Juncao

  for i := 0 to   NomeTabela.Count-1  do
    if i = NomeTabela.Count-1 then
       if DBLkpCmbBxGrupo.KeyValue = -1 then
         cmdsql := cmdsql +  NomeTabela[i] + ' ' +  NomeTabela[i]  +    '  where '
       else
         cmdsql := cmdsql + ' FI_PARTICIPANTE FI_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
    else
       cmdsql := cmdsql +  NomeTabela[i] + ' ' +  NomeTabela[i] + ', ';

   cmdsql := cmdsql +  ' FI_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAnt.fieldbyname('CD_VERSAO').asstring;

   if DBLkpCmbBxGrupo.KeyValue = -1 then
   else
     begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
      cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
     end;

   if RadioGroupCompara.ItemIndex = 0 then
     cmdsql := cmdsql + ' order by 2,1 desc '
   else
     cmdsql := cmdsql + ' order by 3,1 desc ';

   Memo1.Text := cmdsql;

   //-----------

   //-- Executar query e gerar arquivo temporaio com as criticas
   wwQryVersoes.close;
   wwQryVersoes.SQL.Text := cmdsql;
   wwQryVersoes.open;

   if RadioGroupCompara.ItemIndex = 0 then
   else
    begin
      MontaParticMatricula;
      exit;
    end;

   while not  wwQryVersoes.eof do
    begin

      CD_PARTIC := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_VERSAO := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('CD_PARTIC').asinteger = CD_PARTIC) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to Campos.Count-1 do
          begin

           NomeCampo := copy(Campos[i], pos('.', Campos[i])+1, 40);

           if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname(NomeCampo).asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname(NomeCampo).asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to Campos.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to Campos.Count-1 do
                 ValCamposAtu.add('');


       //-- Comparar campos

        for i := 0 to Campos.Count-1 do
         begin

          if  Condicao[i] = 'É diferente da versão anterior' then
              if  (ValCamposAtu[i] <> ValCamposAnt[i]) and
                  (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'É igual a versão anterior' then
              if  (ValCamposAtu[i] =  ValCamposAnt[i])  and
                  (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

         end;

     end;

end;
procedure TfrmComparaVersoes.MontaParticMatricula;
var
 CD_VERSAO, CD_PARTIC, i : integer;
 NR_MATRICULA : STRING;

begin

   while not  wwQryVersoes.eof do
    begin

      CD_PARTIC := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      NR_MATRICULA := wwQryVersoes.fieldbyname('NR_MATRICULA').asstring;
      CD_VERSAO := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('NR_MATRICULA').asstring = NR_MATRICULA) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to Campos.Count-1 do
          begin

           NomeCampo := copy(Campos[i], pos('.', Campos[i])+1, 40);

           if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname(NomeCampo).asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname(NomeCampo).asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to Campos.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to Campos.Count-1 do
                 ValCamposAtu.add('');


       //-- Comparar campos

        for i := 0 to Campos.Count-1 do
         begin

          if  Condicao[i] = 'É diferente da versão anterior' then
              if  (ValCamposAtu[i] <> ValCamposAnt[i]) and
                  (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'É igual a versão anterior' then
              if  (ValCamposAtu[i] =  ValCamposAnt[i])  and
                  (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  Condicao[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQL[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

         end;

     end;


end;

//-- Monta Dependente -------------------------------------------------------------
procedure TfrmComparaVersoes.MontaDependente;
var
 i : integer;

begin

  cmdsql := 'Select ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_VERSAO, ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_PARTIC, ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_DEPENDENTE, ';

  for i := 0 to   CamposDep.Count-1  do
    if i = CamposDep.Count-1 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
         cmdsql := cmdsql +  CamposDep[i] + ' from FI_DEPENDENTE  where '
      else
         cmdsql := cmdsql +  CamposDep[i] + ' from FI_DEPENDENTE FI_DEPENDENTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
    else
      cmdsql := cmdsql +  CamposDep[i] + ', ';


  //-- Monta Juncao
   cmdsql := cmdsql +  'FI_DEPENDENTE.CD_VERSAO = ' + wwQryVesaoAtu.fieldbyname('CD_VERSAO').asstring;

   if DBLkpCmbBxGrupo.KeyValue = -1 then
   else
     begin
      cmdsql := cmdsql +  ' and FI_DEPENDENTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_DEPENDENTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
      cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
     end;

 //-- Monta campos de resultado - Segunda Versao

  cmdsql := cmdsql + ' union Select ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_VERSAO, ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_PARTIC, ';
  cmdsql := cmdsql + 'FI_DEPENDENTE.CD_DEPENDENTE, ';

  for i := 0 to   CamposDep.Count-1  do
    if i = CamposDep.Count-1 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
         cmdsql := cmdsql +  CamposDep[i] + ' from FI_DEPENDENTE  where '
      else
         cmdsql := cmdsql +  CamposDep[i] + ' from FI_DEPENDENTE FI_DEPENDENTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
      cmdsql := cmdsql +  CamposDep[i] + ', ';

 //-- Monta Juncao
   cmdsql := cmdsql +  'FI_DEPENDENTE.CD_VERSAO = ' + wwQryVesaoAnt.fieldbyname('CD_VERSAO').asstring;

   if DBLkpCmbBxGrupo.KeyValue = -1 then
   else
     begin
      cmdsql := cmdsql +  ' and FI_DEPENDENTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_DEPENDENTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
      cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
     end;

   cmdsql := cmdsql + ' order by 2, 3, 1 desc ';
   Memo1.Text := cmdsql;

   //-----------

   //-- Executar query e gerar arquivo temporaio com as criticas
   wwQryVersoes.close;
   wwQryVersoes.SQL.Text := cmdsql;
   wwQryVersoes.open;

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_DEPENDENTE := wwQryVersoes.fieldbyname('CD_DEPENDENTE').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('CD_PARTIC').asinteger = CD_PARTIC) and
         (wwQryVersoes.fieldbyname('CD_DEPENDENTE').asinteger = CD_DEPENDENTE) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposDep.Count-1 do
          begin

           NomeCampo := copy(CamposDep[i], pos('.', CamposDep[i])+1, 40);

           if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname(NomeCampo).asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname(NomeCampo).asstring);

          end;


          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposDep.Count-1 do
                 ValCamposAnt.add('');

       if ValCamposAtu.count > 0 then
       else
             for i := 0 to CamposDep.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos

       for i := 0 to CamposDep.Count-1 do
        begin

         if  CondicaoDep[i] = 'É diferente da versão anterior' then
           if  (ValCamposAtu[i] <> ValCamposAnt[i]) and
               (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQLDep[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

         if  CondicaoDep[i] = 'É igual a versão anterior' then
           if  (ValCamposAtu[i] = ValCamposAnt[i]) and
               (ValCamposAnt[i] <> '')              then
                  begin
                   GravaCritica(CondicaoSQLDep[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  CondicaoDep[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLDep[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;

          if  CondicaoDep[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLDep[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[i], ValCamposAnt[i]);
                   continue;
                  end;


        end;

    end;

end;

//-- Monta Benefício --------------------------------------------------------------

procedure TfrmComparaVersoes.MontaBenef;
var
 CD_TIPO_BENEF : integer;
 i : integer;

begin

  cmdsql := 'Select ';
  cmdsql := cmdsql + 'FI_BENEFICIO_CONCEDIDO.CD_VERSAO, ';
  cmdsql := cmdsql + 'FI_BENEFICIO_CONCEDIDO.CD_PARTIC, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';


  for i := 0 to   CamposBenef.Count-1  do
    if i = CamposBenef.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
        if DBLkpCmbBxGrupo.KeyValue = -1 then
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_BENEFICIO_CONCEDIDO  where '
        else
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
        if DBLkpCmbBxGrupo.KeyValue = -1 then
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO where '
        else
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

    else
      cmdsql := cmdsql +  CamposBenef[i] + ', ';


 //-- Monta Juncao
   cmdsql := cmdsql +  'FI_BENEFICIO_CONCEDIDO.CD_VERSAO = ' + wwQryVesaoAtu.fieldbyname('CD_VERSAO').asstring;

   if RadioGroupCompara.ItemIndex = 0 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end
   else
    begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_BENEFICIO_CONCEDIDO.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_BENEFICIO_CONCEDIDO.CD_PARTIC';

      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end;
    end;

 //-- Monta campos de resultado - Segunda Versao

  cmdsql := cmdsql + ' union Select ';
  cmdsql := cmdsql + 'FI_BENEFICIO_CONCEDIDO.CD_VERSAO, ';
  cmdsql := cmdsql + 'FI_BENEFICIO_CONCEDIDO.CD_PARTIC, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';

  for i := 0 to   CamposBenef.Count-1  do
    if i = CamposBenef.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
        if DBLkpCmbBxGrupo.KeyValue = -1 then
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_BENEFICIO_CONCEDIDO  where '
        else
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
        if DBLkpCmbBxGrupo.KeyValue = -1 then
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO where '
        else
           cmdsql := cmdsql +  CamposBenef[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

    else
      cmdsql := cmdsql +  CamposBenef[i] + ', ';


  //-- Monta Juncao
  cmdsql := cmdsql +  'FI_BENEFICIO_CONCEDIDO.CD_VERSAO = ' + wwQryVesaoAnt.fieldbyname('CD_VERSAO').asstring;

   if RadioGroupCompara.ItemIndex = 0 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end
   else
    begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_BENEFICIO_CONCEDIDO.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_BENEFICIO_CONCEDIDO.CD_PARTIC';

      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_BENEFICIO_CONCEDIDO.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end;
    end;

   if RadioGroupCompara.ItemIndex = 0 then
      cmdsql := cmdsql + ' order by 2, 3, 1 desc '
   else
      cmdsql := cmdsql + ' order by 3, 1 desc ';

   Memo1.Text := cmdsql;

   //-----------

   //-- Executar query e gerar arquivo temporaio com as criticas
   wwQryVersoes.close;
   wwQryVersoes.SQL.Text := cmdsql;
   wwQryVersoes.open;

   if RadioGroupCompara.ItemIndex = 0 then
   else
     begin
      MontaBeneficioMatricula;
      exit;
     end;

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_TIPO_BENEF := wwQryVersoes.fieldbyname('CD_TIPO_BENEF').asinteger;

      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('CD_PARTIC').asinteger = CD_PARTIC)   do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposBenef.Count-1 do
          begin

           NomeCampo := copy(CamposBenef[i], pos('.', CamposBenef[i])+1, 40);

           if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname(NomeCampo).asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname(NomeCampo).asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposBenef.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposBenef.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos
       i := 0;

       if  CondicaoBenef[i] = 'É diferente da versão anterior' then
             if  (ValCamposAtu[i] <> ValCamposAnt[i])  and
                 (ValCamposAtu[i] <> '')               and
                 (ValCamposAnt[i] <> '')               then
                 begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;


        if  CondicaoBenef[i] = 'É igual a versão anterior' then
             if  (ValCamposAtu[i] = ValCamposAnt[i]) and
                 (ValCamposAnt[i] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

        if  CondicaoBenef[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

        if  CondicaoBenef[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

    end;

end;

procedure TfrmComparaVersoes.MontaBeneficioMatricula;
var
   CD_VERSAO, CD_TIPO_BENEF,  CD_PARTIC, i : integer;
   NR_MATRICULA  : string;

begin

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      NR_MATRICULA     := wwQryVersoes.fieldbyname('NR_MATRICULA').asstring;
      CD_TIPO_BENEF := wwQryVersoes.fieldbyname('CD_TIPO_BENEF').asinteger;

      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('NR_MATRICULA').asstring = NR_MATRICULA)  do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposBenef.Count-1 do
          begin

           NomeCampo := copy(CamposBenef[i], pos('.', CamposBenef[i])+1, 40);

           if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname(NomeCampo).asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname(NomeCampo).asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposBenef.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposBenef.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos
       i := 0;

       if  CondicaoBenef[i] = 'É diferente da versão anterior' then
             if  (ValCamposAtu[i] <> ValCamposAnt[i]) and
                 (ValCamposAtu[i] <> '')              and
                 (ValCamposAnt[i] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;


        if  CondicaoBenef[i] = 'É igual a versão anterior' then
             if  (ValCamposAtu[i] = ValCamposAnt[i]) and
                 (ValCamposAnt[i] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

        if  CondicaoBenef[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

        if  CondicaoBenef[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[i] = ''      then
                  begin
                   GravaCritica(CondicaoSQLBenef[i], CD_VERSAO, CD_PARTIC, RecuperaBenef(ValCamposAtu[i]), RecuperaBenef(ValCamposAnt[i]));
                   continue;
                  end;

    end;

end;

//-- Monta Tempo --------------------------------------------------------------------
procedure TfrmComparaVersoes.MontaTempo;
var
 i : integer;

begin

  cmdsql := 'Select ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_VERSAO, ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_PARTIC, ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';

  for i := 0 to   CamposTempo.Count-1  do
    if i = CamposTempo.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
         if DBLkpCmbBxGrupo.KeyValue = -1 then
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_TEMPO_PARTICIPANTE  where '
         else
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
         if DBLkpCmbBxGrupo.KeyValue = -1 then
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE where '
         else
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

    else
      cmdsql := cmdsql +  CamposTempo[i] + ', ';


 //-- Monta Juncao
  cmdsql := cmdsql +  ' FI_TEMPO_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAtu.fieldbyname('CD_VERSAO').asstring;

 //-- Condição Where
  cmdsql := cmdsql + ' and FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO  in ( ';

  for i := 0  to   CondicaoWhereTempo.Count-1  do
       cmdsql := cmdsql + CondicaoWhereTempo[i] + ', ';

  cmdsql := cmdsql + ' 0 ) ';

  if RadioGroupCompara.ItemIndex = 0 then
     if DBLkpCmbBxGrupo.KeyValue = -1 then
     else
       begin
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
        cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
       end
  else
    begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_TEMPO_PARTICIPANTE.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_TEMPO_PARTICIPANTE.CD_PARTIC';

      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
       begin
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
        cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
       end;
    end;

  //-- Monta campos de resultado - Segunda Versao  - Tempo

  cmdsql := cmdsql + ' union Select ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_VERSAO, ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_PARTIC, ';
  cmdsql := cmdsql +  'FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';

  for i := 0 to   CamposTempo.Count-1  do
    if i = CamposTempo.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
         if DBLkpCmbBxGrupo.KeyValue = -1 then
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_TEMPO_PARTICIPANTE  where '
         else
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
         if DBLkpCmbBxGrupo.KeyValue = -1 then
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE where '
         else
            cmdsql := cmdsql +  CamposTempo[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_TEMPO_PARTICIPANTE FI_TEMPO_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

    else
      cmdsql := cmdsql +  CamposTempo[i] + ', ';


  //-- Monta Juncao
  cmdsql := cmdsql +  ' FI_TEMPO_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAnt.fieldbyname('CD_VERSAO').asstring;

  //-- Condição Where

   cmdsql := cmdsql + ' and FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO  in ( ';

   for i := 0  to   CondicaoWhereTempo.Count-1  do
       cmdsql := cmdsql + CondicaoWhereTempo[i] + ', ';

   cmdsql := cmdsql + ' 0 ) ';

  if RadioGroupCompara.ItemIndex = 0 then
     if DBLkpCmbBxGrupo.KeyValue = -1 then
     else
       begin
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
        cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
       end
  else
    begin
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_TEMPO_PARTICIPANTE.CD_VERSAO';
      cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_TEMPO_PARTICIPANTE.CD_PARTIC';

      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
       begin
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
        cmdsql := cmdsql +  ' and FI_TEMPO_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
        cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
       end;
    end;

  if RadioGroupCompara.ItemIndex = 0 then
     cmdsql := cmdsql + ' order by 2, 3, 1 desc '
  else
     cmdsql := cmdsql + ' order by 4, 3, 1 desc ';

   //-- Executar query e gerar arquivo temporaio com as criticas
   wwQryVersoes.close;
   wwQryVersoes.SQL.Text := cmdsql;
   wwQryVersoes.open;

   if RadioGroupCompara.ItemIndex = 0 then
   else
      begin
        MontaTempoMatricula;
        exit;
      end;

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_TIPO_TEMPO := wwQryVersoes.fieldbyname('CD_TIPO_TEMPO').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('CD_PARTIC').asinteger = CD_PARTIC) and
         (wwQryVersoes.fieldbyname('CD_TIPO_TEMPO').asinteger = CD_TIPO_TEMPO) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposTempo.Count-1 do
          begin

          if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname('DT_TEMPO').asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname('DT_TEMPO').asstring);

          end;

           wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposTempo.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposTempo.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos

       i := TipoTempo.indexof(inttostr(CD_TIPO_TEMPO));

         if  CondicaoTempo[i] = 'É diferente da versão anterior' then
           if  (ValCamposAtu[0] <> ValCamposAnt[0]) and
               (ValCamposAtu[0] <> '')              and
               (ValCamposAnt[0] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

         if  CondicaoTempo[i] = 'É igual a versão anterior' then
           if  (ValCamposAtu[0] = ValCamposAnt[0]) and
               (ValCamposAnt[0] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

          if  CondicaoTempo[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[0] = ''      then
                  begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

          if  CondicaoTempo[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[0] = ''      then
                  begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;


    end;

end;

procedure TfrmComparaVersoes.MontaTempoMatricula;
var
 CD_VERSAO,  CD_PARTIC,  CD_TIPO_TEMPO, i : integer;
 NR_MATRICULA   : string;

begin

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      NR_MATRICULA  := wwQryVersoes.fieldbyname('NR_MATRICULA').asstring;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_TIPO_TEMPO := wwQryVersoes.fieldbyname('CD_TIPO_TEMPO').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('NR_MATRICULA').asstring = NR_MATRICULA) and
         (wwQryVersoes.fieldbyname('CD_TIPO_TEMPO').asinteger = CD_TIPO_TEMPO) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposTempo.Count-1 do
          begin

          if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname('DT_TEMPO').asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname('DT_TEMPO').asstring);

          end;

           wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposTempo.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposTempo.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos

       i := TipoTempo.indexof(inttostr(CD_TIPO_TEMPO));

         if  CondicaoTempo[i] = 'É diferente da versão anterior' then
           if  (ValCamposAtu[0] <> ValCamposAnt[0]) and
               (ValCamposAtu[0] <> '')              and
               (ValCamposAnt[0] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

         if  CondicaoTempo[i] = 'É igual a versão anterior' then
           if  (ValCamposAtu[0] = ValCamposAnt[0]) and
               (ValCamposAnt[0] <> '')              then
                 begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

          if  CondicaoTempo[i] = 'Não existe na versão anterior' then
              if  ValCamposAnt[0] = ''      then
                  begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;

          if  CondicaoTempo[i] = 'Não existe na versão atual' then
              if  ValCamposAtu[0] = ''      then
                  begin
                   GravaCritica(CondicaoSQLTempo[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
                   continue;
                  end;


    end;

end;

//-- Monta Valor --------------------------------------------------------------------
procedure TfrmComparaVersoes.MontaValor;
var
  constanteC, valor : real;
  i : integer;

begin

  cmdsql := 'Select ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_VERSAO, ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_PARTIC, ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';

  for i := 0 to   CamposValor.Count-1  do
    if i = CamposValor.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
          if DBLkpCmbBxGrupo.KeyValue = -1 then
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_VALOR_PARTICIPANTE  where '
          else
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
          if DBLkpCmbBxGrupo.KeyValue = -1 then
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE  where '
          else
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

    else
      cmdsql := cmdsql +  CamposValor[i] + ', ';


 //-- Monta Juncao
   cmdsql := cmdsql +  ' FI_VALOR_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAtu.fieldbyname('CD_VERSAO').asstring;

 //-- Condição Where
   cmdsql := cmdsql + ' and FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR  in ( ';

   for i := 0  to   CondicaoWhereValor.Count-1  do
       cmdsql := cmdsql + CondicaoWhereValor[i] + ', ';

   cmdsql := cmdsql + ' 0 ) ';

   if RadioGroupCompara.ItemIndex = 0 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end
   else
    begin
       cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_VALOR_PARTICIPANTE.CD_VERSAO';
       cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_VALOR_PARTICIPANTE.CD_PARTIC';

       if DBLkpCmbBxGrupo.KeyValue = -1 then
       else
        begin
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end;
    end;


  //-- Monta campos de resultado - Segunda Versao  - Tempo

  cmdsql := cmdsql + ' union Select ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_VERSAO, ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_PARTIC, ';
  cmdsql := cmdsql +  'FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR, ';

  if RadioGroupCompara.ItemIndex = 0 then
  else
     cmdsql := cmdsql +  'FI_PARTICIPANTE.NR_MATRICULA, ';

  for i := 0 to   CamposValor.Count-1  do
    if i = CamposValor.Count-1 then

      if RadioGroupCompara.ItemIndex = 0 then
          if DBLkpCmbBxGrupo.KeyValue = -1 then
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_VALOR_PARTICIPANTE  where '
          else
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '
      else
          if DBLkpCmbBxGrupo.KeyValue = -1 then
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE  where '
          else
             cmdsql := cmdsql +  CamposValor[i] + ' from FI_PARTICIPANTE FI_PARTICIPANTE, FI_VALOR_PARTICIPANTE FI_VALOR_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC FI_GRUPO_EXPORT_PARTIC  where '

     else
      cmdsql := cmdsql +  CamposValor[i] + ', ';


 //-- Monta Juncao
  cmdsql := cmdsql +  ' FI_VALOR_PARTICIPANTE.CD_VERSAO = ' + wwQryVesaoAnt.fieldbyname('CD_VERSAO').asstring;

 //-- Condição Where
   cmdsql := cmdsql + ' and FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR  in ( ';

   for i := 0  to   CondicaoWhereValor.Count-1  do
       cmdsql := cmdsql + CondicaoWhereValor[i] + ', ';

   cmdsql := cmdsql + ' 0 ) ';

   if RadioGroupCompara.ItemIndex = 0 then
      if DBLkpCmbBxGrupo.KeyValue = -1 then
      else
        begin
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end
   else
    begin
       cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_VERSAO = FI_VALOR_PARTICIPANTE.CD_VERSAO';
       cmdsql := cmdsql +  ' and FI_PARTICIPANTE.CD_PARTIC = FI_VALOR_PARTICIPANTE.CD_PARTIC';

       if DBLkpCmbBxGrupo.KeyValue = -1 then
       else
        begin
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO';
         cmdsql := cmdsql +  ' and FI_VALOR_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC';
         cmdsql := cmdsql +  ' and FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC = ' + wwQryGrupo.fieldbyname('CD_GRUPO_PARTIC').asstring;
        end;
    end;

   if RadioGroupCompara.ItemIndex = 0 then
      cmdsql := cmdsql + ' order by 2, 3, 1 desc '
   else
      cmdsql := cmdsql + ' order by 4, 3, 1 desc ';


 //-- Executar query e gerar arquivo temporaio com as criticas

   wwQryVersoes.close;
   wwQryVersoes.SQL.Text := cmdsql;
   wwQryVersoes.open;

   if RadioGroupCompara.ItemIndex = 0 then
   else
     begin
      MontaValorMatricula;
      exit;
     end;

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_TIPO_VALOR := wwQryVersoes.fieldbyname('CD_TIPO_VALOR').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('CD_PARTIC').asinteger = CD_PARTIC) and
         (wwQryVersoes.fieldbyname('CD_TIPO_VALOR').asinteger = CD_TIPO_VALOR) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposValor.Count-1 do
          begin

          if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname('VL_PARTICIPANTE').asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname('VL_PARTICIPANTE').asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposValor.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposValor.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos

        i := TipoValor.indexof(INTTOSTR(CD_TIPO_VALOR));

        if  CondicaoValor[i] = 'Maior que' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
               end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
              if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) > ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        if  CondicaoValor[i] = 'Menor que' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
               end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
              if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) < ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        if  CondicaoValor[i] = 'Igual' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
                end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
               if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) = ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        end;

end;

procedure TfrmComparaVersoes.MontaValorMatricula;
var
  CD_VERSAO, CD_PARTIC, CD_TIPO_VALOR, i : integer;
  NR_MATRICULA  : string;
  constanteC : real;

begin

   while not  wwQryVersoes.eof do
    begin

      CD_VERSAO     := wwQryVersoes.fieldbyname('CD_VERSAO').asinteger;
      NR_MATRICULA  := wwQryVersoes.fieldbyname('NR_MATRICULA').asstring;
      CD_PARTIC     := wwQryVersoes.fieldbyname('CD_PARTIC').asinteger;
      CD_TIPO_VALOR := wwQryVersoes.fieldbyname('CD_TIPO_VALOR').asinteger;
      ValCamposAtu.clear;
      ValCamposAnt.clear;

      while not  wwQryVersoes.eof and
         (wwQryVersoes.fieldbyname('NR_MATRICULA').asstring = NR_MATRICULA) and
         (wwQryVersoes.fieldbyname('CD_TIPO_VALOR').asinteger = CD_TIPO_VALOR) do
        begin
          //-- Guardar campos a serem comparados
          for i := 0 to CamposValor.Count-1 do
          begin

          if wwQryVersoes.fieldbyname('CD_VERSAO').asinteger = wwQryVesaoAtu.fieldbyname('CD_VERSAO').asinteger then
              ValCamposAtu.add(wwQryVersoes.fieldbyname('VL_PARTICIPANTE').asstring)
           else
              ValCamposAnt.add(wwQryVersoes.fieldbyname('VL_PARTICIPANTE').asstring);

          end;

          wwQryVersoes.next;

        end;

        if ValCamposAnt.count > 0 then
        else
             for i := 0 to CamposValor.Count-1 do
                 ValCamposAnt.add('');

        if ValCamposAtu.count > 0 then
        else
             for i := 0 to CamposValor.Count-1 do
                 ValCamposAtu.add('');

       //-- Comparar campos

        i := TipoValor.indexof(INTTOSTR(CD_TIPO_VALOR));

        if  CondicaoValor[i] = 'Maior que' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
               end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
              if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) > ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        if  CondicaoValor[i] = 'Menor que' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
               end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
              if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) < ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        if  CondicaoValor[i] = 'Igual' then
            begin
             constanteC := strtofloat(trim(Constante[i]));

             if (Operacao[i] = 'Subtração') or
                (Operacao[i] = 'Soma')      then
               begin
                 if (ValCamposAtu[0] <> '') or
                    (ValCamposAnt[0] <> '') then
                   begin
                    if ValCamposAtu[0] = '' then ValCamposAtu[0] := '0';
                    if ValCamposAnt[0] = '' then ValCamposAnt[0] := '0';
                   end;
                end;

             if (ValCamposAtu[0] <> '') and
                (ValCamposAnt[0] <> '') then
               if (CalcValor (Operacao[i], ValCamposAtu[0], ValCamposAnt[0]) = ConstanteC) then
                  GravaCritica(CondicaoSQLValor[i], CD_VERSAO, CD_PARTIC, ValCamposAtu[0], ValCamposAnt[0]);
              continue;
            end;

        end;

end;

//--------------------------------------------------------------------------------------
function TfrmComparaVersoes.CalcValor(operacaoC, valorAtu, valorAnt : string) : real;
var
 valorAtuC, valorAntC, Valor : real;
 i, precisao : integer;
 valor_arred, valor_txt : string;

begin
  //-- Calcula Valor
  valorAtuC := strtofloat(valorAtu);
  valorAntC := strtofloat(valorAnt);

  if  operacaoC = 'Subtração' then
      Valor :=  valorAtuC - valorAntC
  else
  if  operacaoC = 'Soma' then
      Valor :=  valorAtuC + valorAntC
  else
  if  operacaoC = 'Multiplicação' then
      Valor :=  valorAtuC * valorAntC
  else
      if valorAntC = 0 then
         Valor := 0.00
      else
         Valor :=  valorAtuC / valorAntC;

  //-- Arredonda valor conforme precisão

  precisao := floor(strtofloat(trim(EditPrecisao.text)));

  valor_txt := floattostr(Valor);
  valor_txt := copy(valor_txt, 1, Pos(',', valor_txt) + precisao+1);

  valor_arred := '0,';
  for i := 1 to precisao do
      valor_arred := valor_arred + '0';
  valor_arred := valor_arred + '5';

  valor := strtofloat( valor_txt );
  valor := valor + strtofloat(valor_arred);

  valor_txt      := floattostr(Valor);
  valor_txt      := copy(valor_txt, 1, Pos(',', valor_txt) + precisao);

  valor := strtofloat( valor_txt );

  CalcValor := Valor;

end;

procedure TfrmComparaVersoes.AtualizaTabela(nometab : string);
begin
  if NomeTabela.IndexOf(nometab) = -1 then
     NomeTabela.Add(nometab);

end;
procedure TfrmComparaVersoes.AtualizaCampos(campo: string);
begin
  if Campos.IndexOf(campo) = -1 then
     Campos.Add(campo)
  else
    raise exception.Create('Campo já selecionado para comparação');

end;
procedure TfrmComparaVersoes.AtualizaCamposDep(campo: string);
begin
  if CamposDep.IndexOf(campo) = -1 then
     CamposDep.Add(campo)
  else
    raise exception.Create('Campo já selecionado para comparação');

end;
procedure TfrmComparaVersoes.AtualizaCamposBenef(campo: string);
begin
  if CamposBenef.IndexOf(campo) = -1 then
     CamposBenef.Add(campo)
  else
    raise exception.Create('Campo já selecionado para comparação');

end;
procedure TfrmComparaVersoes.AtualizaCamposTempo(campo: string);
begin
  if CamposTempo.IndexOf(campo) = -1 then
     CamposTempo.Add(campo); 

end;
procedure TfrmComparaVersoes.AtualizaCamposValor(campo: string);
begin
  if CamposValor.IndexOf(campo) = -1 then
     CamposValor.Add(campo);

end;
procedure TfrmComparaVersoes.AtualizaCondicao(condicaoSQLL, condicaoL : string);
begin
  CondicaoSQL.Add(condicaoSQLL);
  Condicao.Add(condicaoL);

end;
procedure TfrmComparaVersoes.AtualizaCondicaoDep(condicaoSQLL, condicaoL : string);
begin
  CondicaoSQLDep.Add(condicaoSQLL);
  CondicaoDep.Add(condicaoL);

end;
procedure TfrmComparaVersoes.AtualizaCondicaoBenef(condicaoSQLL, condicaoL : string);
begin
  CondicaoSQLBenef.Add(condicaoSQLL);
  CondicaoBenef.Add(condicaoL);
 
end;
procedure TfrmComparaVersoes.AtualizaCondicaoTempo(condicaoSQLL, condicaoL, tipo  : string);
begin
  CondicaoSQLTempo.Add(condicaoSQLL);
  CondicaoTempo.Add(condicaoL);
  TipoTempo.Add(tipo);

end;
procedure TfrmComparaVersoes.AtualizaCondicaoValor(condicaoSQLL, condicaoL, operacaoL, constanteL, tipo  : string);
begin
  CondicaoSQLValor.Add(condicaoSQLL);
  CondicaoValor.Add(condicaoL);
  Operacao.Add(operacaoL);
  Constante.Add(constanteL);
  TipoValor.Add(tipo);

end;
procedure TfrmComparaVersoes.AtualizaCondicaoWhereTempo(condicaoWhereL : string);
begin
  if CondicaoWhereTempo.IndexOf(condicaoWhereL) = -1 then
     CondicaoWhereTempo.Add(condicaoWhereL)
  else
    raise exception.Create('Campo já selecionado para comparação');
end;
procedure TfrmComparaVersoes.AtualizaCondicaoWhereVAlor(condicaoWhereL : string);
begin
  if CondicaoWhereValor.IndexOf(condicaoWhereL) = -1 then
     CondicaoWhereValor.Add(condicaoWhereL)
  else
    raise exception.Create('Campo já selecionado para comparação');

end;
function TfrmComparaVersoes.RecuperaBenef(tipo : string) : string;
begin

  if trim(tipo) = '' then
     begin
      RecuperaBenef := ' ';
      exit;
     end;

  wwQryTipoBenef.close;
  wwQryTipoBenef.parambyname('CD_TIPO_BENEF').asinteger := strtoint(trim(tipo));
  wwQryTipoBenef.open;

  if  wwQryTipoBenef.eof then
      RecuperaBenef := ' '
  else
      RecuperaBenef := wwQryTipoBenef.fieldbyname('DS_TIPO_BENEF').asstring;

end;
procedure TfrmComparaVersoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtbsTemporario.Close;
  inherited;
  NomeTabela.Free;
  CondicaoSQL.Free;
  CondicaoSQLDep.Free;
  CondicaoSQLBenef.Free;
  CondicaoSQLValor.Free;
  CondicaoSQLTempo.Free;
  CondicaoWhereTempo.Free;
  CondicaoWhereValor.Free;
  Condicao.Free;
  CondicaoTempo.Free;
  CondicaoValor.Free;
  CondicaoDep.Free;
  CondicaoBenef.Free;
  Operacao.Free;
  Constante.Free;
  Campos.Free;
  CamposTempo.Free;
  CamposValor.Free;
  CamposDep.Free;
  CamposBenef.Free;
  TipoTempo.Free;
  TipoBenef.Free;
  TipoValor.Free;
  ValCamposAtu.Free;
  ValCamposAnt.Free;

end;

procedure TfrmComparaVersoes.GravaCritica(Condicao : string; Versao, Partic : Integer; ValCamposAtu, ValCamposAnt : string);
begin
  //-- Grava Critica
  with dtmBaseDados.dbBaseDados do
   begin
    if not InTransaction then
       StartTransaction;
    try
     qryParticipante.Close;
     qryParticipante.ParamByName('CD_PARTIC').asInteger := Partic;
     qryParticipante.ParamByName('CD_VERSAO').asInteger := Versao;
     qryParticipante.Open;                       

     qryInsTemp.ParamByName('Condicao').asString := Condicao;
     qryInsTemp.ParamByName('Matricula').asstring := qryParticipante.fieldByName('nr_matricula').asstring;
     qryInsTemp.ParamByName('Partic').asinteger := Partic;
     qryInsTemp.ParamByName('ValCampoAtual').asString := ValCamposAtu;
     qryInsTemp.ParamByName('ValCampoAnterior').asString := ValCamposAnt;
     qryInsTemp.ExecSQL;
     Commit;
    except on EDatabaseError do
     begin
       Raise Exception.Create
       ('Erro na geração dos dados para o Relatório. ');
       Rollback;
     end; //except
    end; //try-except
   end; //with
end;

procedure TfrmComparaVersoes.RadioGroupComparaClick(Sender: TObject);
begin

  if RadioGroupCompara.ItemIndex = 0 then
     GroupBoxDep.Enabled := true
  else
     GroupBoxDep.Enabled := false;

end;

end.
