unit uQueryCondicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids, DBGrids,
  DBCtrls;

type
  TfrmQueryCondicao = class(TfrmOkCancelar)
    qryGrupoLogico: TwwQuery;
    qryGrupoLogicoCD_GRUPO: TFloatField;
    qryGrupoLogicoNO_GRUPO: TStringField;
    qryGrupoLogicoNR_ORDEM: TFloatField;
    dsGrupoLogico: TwwDataSource;
    qryGrupoAtributo: TwwQuery;
    dsGrupoAtributo: TwwDataSource;
    GroupBox1: TGroupBox;
    SpdBttn1: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    GroupBox3: TGroupBox;
    EditExpressao: TMemo;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    wwQryLookUp: TwwQuery;
    wwDtSrcLookUp: TwwDataSource;
    DBComboBoxTipoAtributo: TDBLookupComboBox;
    qryGrupoAtributoNO_TABELA: TStringField;
    qryGrupoAtributoNO_ATRIBUTO_TABELA: TStringField;
    qryGrupoAtributoDS_ATRIBUTO_TABELA: TStringField;
    qryGrupoAtributoTP_ATRIBUTO: TStringField;
    qryGrupoAtributoNR_TAM_ATRIBUTO_TABELA: TFloatField;
    qryGrupoAtributoIR_MANDATORIO: TStringField;
    qryGrupoAtributoIR_CARGA_OBRIGATORIA: TStringField;
    qryGrupoAtributoNR_ORDEM: TFloatField;
    qryGrupoAtributoNO_TABELA_LOOKUP: TStringField;
    qryGrupoAtributoNO_ATRIBUTO_TABELA_LOOKUP: TStringField;
    qryGrupoAtributoCD_GRUPO: TFloatField;
    BtBtnLimpar: TBitBtn;
    EditSQLExpressao: TMemo;
    QryQuery: TQuery;
    wwQryPkAtributo: TwwQuery;
    QryPkTabela: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1Enter(Sender: TObject);
    procedure Lookup;
    procedure DBGrid2Enter(Sender: TObject);
    procedure BtBtnLimparClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure SetFormText(Texto : String);
    procedure SpdBttn1Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditExpressaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQueryCondicao: TfrmQueryCondicao;

implementation

uses uBuilderQuery, UGrupoParticipante;

{$R *.DFM}

procedure TfrmQueryCondicao.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupoLogico.close;
  qryGrupoLogico.open;
  qryGrupoAtributo.close;
  qryGrupoAtributo.open;
end;

procedure TfrmQueryCondicao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmQueryCondicao.DBGrid1CellClick(Column: TColumn);
begin
  DBComboBoxTipoAtributo.Enabled := False;
  DBComboBoxTipoAtributo.KeyValue := '';
  bbtnConfirmar.Enabled := false;

end;

procedure TfrmQueryCondicao.DBGrid2CellClick(Column: TColumn);
begin
   lookup;

end;

procedure TfrmQueryCondicao.DBGrid1Enter(Sender: TObject);
begin
  DBComboBoxTipoAtributo.Enabled := False;
  DBComboBoxTipoAtributo.KeyValue := '';
  bbtnConfirmar.Enabled := false;

end;
procedure TfrmQueryCondicao.Lookup;

begin

    DBComboBoxTipoAtributo.Enabled := False;

    if qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').AsString <> '' then
      begin
       //-- Recupera Lookup

{ Pegar o código do atributo Lookup }
       QryPkTabela.Close;
       QryPkTabela.ParamByName('NO_TABELA').asString := qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asstring;
       QryPkTabela.Open;

       wwQryLookup.close;
       wwQryLookup.SQL.Clear;
       wwQryLookup.SQL.Add ('Select ' +
          QryPkTabela.FieldByName('NO_ATRIBUTO_TABELA').asString + ' as Codigo, ' +
          qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString + ' as Campo from ' +
          qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asstring  + ' order by 1');
       wwQryLookup.open;

       DBComboBoxTipoAtributo.ListField := 'Campo';
       DBComboBoxTipoAtributo.keyField  := 'Campo';

       QryPkTabela.Close;
       wwQryLookup.close;
       wwQryLookup.open;

       DBComboBoxTipoAtributo.Enabled := True;

      end;

      bbtnConfirmar.Enabled := true;

end;

procedure TfrmQueryCondicao.DBGrid2Enter(Sender: TObject);
begin
 Lookup;
end;

procedure TfrmQueryCondicao.BtBtnLimparClick(Sender: TObject);
begin
 EditExpressao.Text := '';
end;

procedure TfrmQueryCondicao.bbtnConfirmarClick(Sender: TObject);
begin

   if qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString = '' then
      if (qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'A') or
         (qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'M') then
           SetFormText(qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
          + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString + ' = ' + '''' + '______' + '''')
      else
       if qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'D' then
         SetFormText(qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
          + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString  + ' = ' +
          ' @Data[' + '''' + 'DD/MM/AAAA' + '''' + ']')
       else
        SetFormText(qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
          + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString  + ' = ' + '______')
   else
    begin
      if qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'D' then
         SetFormText(qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString
                 + ' = ' + ' @Data[' + '''' + 'DD/MM/AAAA' + '''' + ']' + ' and '
                 + qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString + ' = '
                 + '''' +
                   wwQryLookup.fieldbyname('Campo').asString + '''')

      else
       begin

        //-- Acessa chave primaria do arquivo para montar condição
        wwQryPkAtributo.Close;
        wwQryPkAtributo.ParamByName('no_tabela').asstring:=
                            qryGrupoAtributo.fieldbyname('NO_TABELA').asString;
        wwQryPkAtributo.ParamByName('no_atributo_tabela').asstring:=
                            qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString;
        wwQryPkAtributo.open;

        if wwQryPkAtributo.recordcount = 0 then

         if (qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'N') or
            (qryGrupoAtributo.fieldbyname('TP_ATRIBUTO').asString = 'F') then
            SetFormText(
                   qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString
                 + ' = '  +  wwQryLookup.fieldbyname('Codigo').asString + ' and '
                 + qryGrupoAtributo.fieldbyname('NO_TABELA').asString  + '['
                 + qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString + ' = '
                 + '''' + wwQryLookup.fieldbyname('Campo').asString + '''' + ']')
          else
             SetFormText(
                   qryGrupoAtributo.fieldbyname('NO_TABELA').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA').asString
                 + ' = ' + '''' + wwQryLookup.fieldbyname('Codigo').asString + '''' + ' and '
                 + qryGrupoAtributo.fieldbyname('NO_TABELA').asString  + '['
                 + qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString + ' = '
                 + '''' + wwQryLookup.fieldbyname('Campo').asString + '''' + ']')

        else
         SetFormText(qryGrupoAtributo.fieldbyname('NO_TABELA').asString  + '['
                 + qryGrupoAtributo.fieldbyname('NO_TABELA_LOOKUP').asString + '.'
                 + qryGrupoAtributo.fieldbyname('NO_ATRIBUTO_TABELA_LOOKUP').asString + ' = '
                 + '''' + wwQryLookup.fieldbyname('Campo').asString + '''' + ']');

      end;

    end;

end;

{Move conteúdo dos operadores para edição}

Procedure TfrmQueryCondicao.SetFormText(Texto : String);
Begin

    if Pos(Texto, '.0123456789') > 0 then
       EditExpressao.Text := EditExpressao.Text + Texto
    else
       EditExpressao.Text := EditExpressao.Text + Texto + ' ';

    EditExpressao.SetFocus;
    EditExpressao.SelStart := Length(EditExpressao.Text) + 1;

End;
procedure TfrmQueryCondicao.SpdBttn1Click(Sender: TObject);
begin
  SetFormText((Sender As TSpeedButton).Caption);
end;

procedure TfrmQueryCondicao.bbtnSairClick(Sender: TObject);
var
  w_j, w_i : integer;
  w_BuilderQuery : TBuilderQuery;

begin
  Try
    bbtnSair.modalresult := mryes;
    w_BuilderQuery := TBuilderQuery.create(self);

    //-- Monta Query a partir da condição informada
    qryQuery := w_BuilderQuery.Monta_Query(1, EditExpressao);

    EditSQLExpressao.lines.Clear;
    w_j := qryQuery.sql.Count;
    for w_i := 0 to (w_j-1) do
       EditSQLExpressao.lines.add(qryQuery.sql[w_i]);
  Finally
    w_BuilderQuery.Free;
    inherited;
  End;
end;

procedure TfrmQueryCondicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryGrupoLogico.close;
  qryGrupoAtributo.close;
  wwQryLookUp.Close;
  wwQryPkAtributo.Close;
  QryQuery.Close;
  
  inherited;
end;

procedure TfrmQueryCondicao.EditExpressaoChange(Sender: TObject);
begin
  inherited;
  if not bbtnConfirmar.Enabled then
    bbtnConfirmar.Enabled := True;
end;

end.
