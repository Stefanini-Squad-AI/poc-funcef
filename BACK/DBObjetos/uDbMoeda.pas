{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 18/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbMoeda;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbMoeda = class(TCmDbObject)

  private
    FFlgtipoprazo: TCmDbField;
    FFlgperiodo: TCmDbField;
    FDatainicio: TCmDbField;
    FDescunidadetaxa: TCmDbField;
    FDatafim: TCmDbField;
    FFlgpercvalor: TCmDbField;
    FMoesigla: TCmDbField;
    FMoeinativo: TCmDbField;
    FMoeperiodicidade: TCmDbField;
    FMoedareferencia: TCmDbField;
    FMoecodigo: TCmDbField;
    FFatorconversao: TCmDbField;
    FMoedesc: TCmDbField;
    FIdUsuarioInclusao: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDescunidadetaxa(const Value: TCmDbField);
    procedure SetFatorconversao(const Value: TCmDbField);
    procedure SetFlgpercvalor(const Value: TCmDbField);
    procedure SetFlgperiodo(const Value: TCmDbField);
    procedure SetFlgtipoprazo(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetMoedareferencia(const Value: TCmDbField);
    procedure SetMoedesc(const Value: TCmDbField);
    procedure SetMoeinativo(const Value: TCmDbField);
    procedure SetMoeperiodicidade(const Value: TCmDbField);
    procedure SetMoesigla(const Value: TCmDbField);
    procedure SetIdUsuarioInclusao(const Value: TCmDbField);

  public
     Property Moesigla: TCmDbField read FMoesigla write SetMoesigla;
     Property Moeperiodicidade: TCmDbField read FMoeperiodicidade write SetMoeperiodicidade;
     Property Moeinativo: TCmDbField read FMoeinativo write SetMoeinativo;
     Property Moedesc: TCmDbField read FMoedesc write SetMoedesc;
     Property Moedareferencia: TCmDbField read FMoedareferencia write SetMoedareferencia;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Flgtipoprazo: TCmDbField read FFlgtipoprazo write SetFlgtipoprazo;
     Property Flgperiodo: TCmDbField read FFlgperiodo write SetFlgperiodo;
     Property Flgpercvalor: TCmDbField read FFlgpercvalor write SetFlgpercvalor;
     Property Fatorconversao: TCmDbField read FFatorconversao write SetFatorconversao;
     Property Descunidadetaxa: TCmDbField read FDescunidadetaxa write SetDescunidadetaxa;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;
     Property IdUsuarioInclusao: TCmDbField read FIdUsuarioInclusao write SetIdUsuarioInclusao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbMoeda }

constructor TDbMoeda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MOEDA';

  fMoesigla          := CreateCmDbField('MOESIGLA',ftString,False,False,False,True,'Sigla');
  fMoeperiodicidade  := CreateCmDbField('MOEPERIODICIDADE',ftString,True,False,False,True,'Periodicidade');
  fMoeinativo        := CreateCmDbField('MOEINATIVO',ftString,True,False,False,True,'Moeda Inativa');
  fMoedesc           := CreateCmDbField('MOEDESC',ftString,False,False,False,True,'Descrição');
  fMoedareferencia   := CreateCmDbField('MOEDAREFERENCIA',ftfloat,False,False,False,True,'Moeda Referência');
  fMoecodigo         := CreateCmDbField('MOECODIGO',ftfloat,False,True,False,True,'Código Moeda');
  fFlgtipoprazo      := CreateCmDbField('FLGTIPOPRAZO',ftString,False,False,False,True,'Tipo Prazo');
  fFlgperiodo        := CreateCmDbField('FLGPERIODO',ftString,False,False,False,True,'Periodo');
  fFlgpercvalor      := CreateCmDbField('FLGPERCVALOR',ftString,True,False,False,True,'Tipo');
  fFatorconversao    := CreateCmDbField('FATORCONVERSAO',ftfloat,False,False,False,True,'Fator de Conversão');
  fDescunidadetaxa   := CreateCmDbField('DESCUNIDADETAXA',ftString,False,False,False,True,'Unidade Taxa');
  fDatainicio        := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'Data Início');
  fDatafim           := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'Data Fim');
  fIdUsuarioInclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'Usuário');
end;

function TDbMoeda.Insert: Boolean;
begin
   fMoeCodigo.AsFloat := GetSequence('MOEDA');
   Result := Inherited Insert;
end;

function TDbMoeda.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbMoeda.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbMoeda.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbMoeda.SetDescunidadetaxa(const Value: TCmDbField);
begin
  FDescunidadetaxa := Value;
end;

procedure TDbMoeda.SetFatorconversao(const Value: TCmDbField);
begin
  FFatorconversao := Value;
end;

procedure TDbMoeda.SetFlgpercvalor(const Value: TCmDbField);
begin
  FFlgpercvalor := Value;
end;

procedure TDbMoeda.SetFlgperiodo(const Value: TCmDbField);
begin
  FFlgperiodo := Value;
end;

procedure TDbMoeda.SetFlgtipoprazo(const Value: TCmDbField);
begin
  FFlgtipoprazo := Value;
end;

procedure TDbMoeda.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
  FIdUsuarioInclusao := Value;
end;

procedure TDbMoeda.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbMoeda.SetMoedareferencia(const Value: TCmDbField);
begin
  FMoedareferencia := Value;
end;

procedure TDbMoeda.SetMoedesc(const Value: TCmDbField);
begin
  FMoedesc := Value;
end;

procedure TDbMoeda.SetMoeinativo(const Value: TCmDbField);
begin
  FMoeinativo := Value;
end;

procedure TDbMoeda.SetMoeperiodicidade(const Value: TCmDbField);
begin
  FMoeperiodicidade := Value;
end;

procedure TDbMoeda.SetMoesigla(const Value: TCmDbField);
begin
  FMoesigla := Value;
end;

end.



