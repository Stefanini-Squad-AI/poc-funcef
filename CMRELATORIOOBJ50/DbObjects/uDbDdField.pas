{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbDdField;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDdField = class(TCmDbObject)

  private
    FDisplayformat: TCmDbField;
    FDescricao: TCmDbField;
    FIdddfield: TCmDbField;
    FTipodedado: TCmDbField;
    FCampodobanco: TCmDbField;
    FTamanho: TCmDbField;
    FSortable: TCmDbField;
    FFieldname: TCmDbField;
    FTipochave: TCmDbField;
    FChave: TCmDbField;
    FIdddtable: TCmDbField;
    FSearchable: TCmDbField;
    FSelectable: TCmDbField;
    FFlgobrigatorio: TCmDbField;
    FFieldalias: TCmDbField;
    procedure SetCampodobanco(const Value: TCmDbField);
    procedure SetChave(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetDisplayformat(const Value: TCmDbField);
    procedure SetFieldalias(const Value: TCmDbField);
    procedure SetFieldname(const Value: TCmDbField);
    procedure SetFlgobrigatorio(const Value: TCmDbField);
    procedure SetIdddfield(const Value: TCmDbField);
    procedure SetIdddtable(const Value: TCmDbField);
    procedure SetSearchable(const Value: TCmDbField);
    procedure SetSelectable(const Value: TCmDbField);
    procedure SetSortable(const Value: TCmDbField);
    procedure SetTamanho(const Value: TCmDbField);
    procedure SetTipochave(const Value: TCmDbField);
    procedure SetTipodedado(const Value: TCmDbField);

  public
    Property Tipodedado: TCmDbField read FTipodedado write SetTipodedado;
    Property Tipochave: TCmDbField read FTipochave write SetTipochave;
    Property Tamanho: TCmDbField read FTamanho write SetTamanho;
    Property Sortable: TCmDbField read FSortable write SetSortable;
    Property Selectable: TCmDbField read FSelectable write SetSelectable;
    Property Searchable: TCmDbField read FSearchable write SetSearchable;
    Property Idddtable: TCmDbField read FIdddtable write SetIdddtable;
    Property Idddfield: TCmDbField read FIdddfield write SetIdddfield;
    Property Flgobrigatorio: TCmDbField read FFlgobrigatorio write SetFlgobrigatorio;
    Property Fieldname: TCmDbField read FFieldname write SetFieldname;
    Property Fieldalias: TCmDbField read FFieldalias write SetFieldalias;
    Property Displayformat: TCmDbField read FDisplayformat write SetDisplayformat;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;
    Property Chave: TCmDbField read FChave write SetChave;
    Property Campodobanco: TCmDbField read FCampodobanco write SetCampodobanco;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbDdField }

constructor TDbDdField.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DDFIELD';

  fTipodedado     := CreateCmDbField('TIPODEDADO',ftString,False,False,False,True,'Tipo de Dado');
  fTipochave      := CreateCmDbField('TIPOCHAVE',ftfloat,False,False,False,True,'Tipo de Chave');
  fTamanho        := CreateCmDbField('TAMANHO',ftfloat,False,False,False,True,'Tamanho');
  fSortable       := CreateCmDbField('SORTABLE',ftfloat,True,False,False,True,'Ordenavel');
  fSelectable     := CreateCmDbField('SELECTABLE',ftfloat,True,False,False,True,'Selecionavel');
  fSearchable     := CreateCmDbField('SEARCHABLE',ftfloat,True,False,False,True,'Pesquisavel');
  fIdddtable      := CreateCmDbField('IDDDTABLE',ftfloat,False,False,False,True,'Tabela');
  fIdddfield      := CreateCmDbField('IDDDFIELD',ftfloat,True,True,False,True,'Código');
  fFlgobrigatorio := CreateCmDbField('FLGOBRIGATORIO',ftString,False,False,False,True,'Obrigatório');
  fFieldname      := CreateCmDbField('FIELDNAME',ftString,True,False,False,True,'Nome do Campo');
  fFieldalias     := CreateCmDbField('FIELDALIAS',ftString,True,False,False,True,'Alias do Campo');
  fDisplayformat  := CreateCmDbField('DISPLAYFORMAT',ftString,False,False,False,True,'Formato de Exibição');
  fDescricao      := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
  fChave          := CreateCmDbField('CHAVE',ftfloat,False,False,False,True,'Chave');
  fCampodobanco   := CreateCmDbField('CAMPODOBANCO',ftfloat,False,False,False,True,'Campo do Banco');
end;

function TDbDdField.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

procedure TDbDdField.SetCampodobanco(const Value: TCmDbField);
begin
  FCampodobanco := Value;
end;

procedure TDbDdField.SetChave(const Value: TCmDbField);
begin
  FChave := Value;
end;

procedure TDbDdField.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbDdField.SetDisplayformat(const Value: TCmDbField);
begin
  FDisplayformat := Value;
end;

procedure TDbDdField.SetFieldalias(const Value: TCmDbField);
begin
  FFieldalias := Value;
end;

procedure TDbDdField.SetFieldname(const Value: TCmDbField);
begin
  FFieldname := Value;
end;

procedure TDbDdField.SetFlgobrigatorio(const Value: TCmDbField);
begin
  FFlgobrigatorio := Value;
end;

procedure TDbDdField.SetIdddfield(const Value: TCmDbField);
begin
  FIdddfield := Value;
end;

procedure TDbDdField.SetIdddtable(const Value: TCmDbField);
begin
  FIdddtable := Value;
end;

procedure TDbDdField.SetSearchable(const Value: TCmDbField);
begin
  FSearchable := Value;
end;

procedure TDbDdField.SetSelectable(const Value: TCmDbField);
begin
  FSelectable := Value;
end;

procedure TDbDdField.SetSortable(const Value: TCmDbField);
begin
  FSortable := Value;
end;

procedure TDbDdField.SetTamanho(const Value: TCmDbField);
begin
  FTamanho := Value;
end;

procedure TDbDdField.SetTipochave(const Value: TCmDbField);
begin
  FTipochave := Value;
end;

procedure TDbDdField.SetTipodedado(const Value: TCmDbField);
begin
  FTipodedado := Value;
end;

end.

