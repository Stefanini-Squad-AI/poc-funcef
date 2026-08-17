{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 28/01/2002                             }
{                                                       }
{*******************************************************}
//  pendencia 19455 14/09/2005 - inclui o campo observacao

unit uDbCotacaomoeda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCotacaomoeda = class(TCmDbObject)

  private
    FCotdata: TCmDbField;
    FIdcotacaomoeda: TCmDbField;
    FIndicebase: TCmDbField;
    FCotmesref: TCmDbField;
    FNumdiasprazo: TCmDbField;
    FMoecodigo: TCmDbField;
    FCotvalor: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCotdatafim: TCmDbField;
    FObservacao: TCmDbField;
    procedure SetCotdata(const Value: TCmDbField);
    procedure SetCotdatafim(const Value: TCmDbField);
    procedure SetCotmesref(const Value: TCmDbField);
    procedure SetCotvalor(const Value: TCmDbField);
    procedure SetIdcotacaomoeda(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetIndicebase(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNumdiasprazo(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);

  public
    Property Numdiasprazo: TCmDbField read FNumdiasprazo write SetNumdiasprazo;
    Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
    Property Indicebase: TCmDbField read FIndicebase write SetIndicebase;
    Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
    Property Idcotacaomoeda: TCmDbField read FIdcotacaomoeda write SetIdcotacaomoeda;
    Property Cotvalor: TCmDbField read FCotvalor write SetCotvalor;
    Property Cotmesref: TCmDbField read FCotmesref write SetCotmesref;
    Property Cotdatafim: TCmDbField read FCotdatafim write SetCotdatafim;
    Property Cotdata: TCmDbField read FCotdata write SetCotdata;
    Property Observacao: TCmDbField read FObservacao write SetObservacao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbCotacaomoeda }

constructor TDbCotacaomoeda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  TableName := 'COTACAOMOEDA';

  fIdcotacaomoeda    := CreateCmDbField('IDCOTACAOMOEDA',ftfloat,True,True,False,True,'Id Cotação');
  fNumdiasprazo      := CreateCmDbField('NUMDIASPRAZO',ftfloat,False,False,False,True,'Dias Prazo');
  fMoecodigo         := CreateCmDbField('MOECODIGO',ftfloat,True,False,False,True,'Código Moeda');
  fIndicebase        := CreateCmDbField('INDICEBASE',ftfloat,False,False,False,True,'Índice');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'Usuário Inclusão');
  fCotvalor          := CreateCmDbField('COTVALOR',ftfloat,True,False,False,False,'Valor');
  fCotmesref         := CreateCmDbField('COTMESREF',ftString,True,False,False,True,'Mes Referência');
  fCotdatafim        := CreateCmDbField('COTDATAFIM',ftDateTime,False,False,False,True,'Data Fim');
  fCotdata           := CreateCmDbField('COTDATA',ftDateTime,True,False,False,True,'Data');
  fObservacao        := CreateCmDbField('OBSERVACAO',ftString,False,False,False,False,'Observação');
end;

function TDbCotacaomoeda.Insert: Boolean;
begin
  fIdcotacaomoeda.AsFloat := GetSequence('COTACAOMOEDA');
  Result := Inherited Insert;
end;

function TDbCotacaomoeda.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCotacaomoeda.SetCotdata(const Value: TCmDbField);
begin
  FCotdata := Value;
end;

procedure TDbCotacaomoeda.SetCotdatafim(const Value: TCmDbField);
begin
  FCotdatafim := Value;
end;

procedure TDbCotacaomoeda.SetCotmesref(const Value: TCmDbField);
begin
  FCotmesref := Value;
end;

procedure TDbCotacaomoeda.SetCotvalor(const Value: TCmDbField);
begin
  FCotvalor := Value;
end;

procedure TDbCotacaomoeda.SetIdcotacaomoeda(const Value: TCmDbField);
begin
  FIdcotacaomoeda := Value;
end;

procedure TDbCotacaomoeda.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbCotacaomoeda.SetIndicebase(const Value: TCmDbField);
begin
  FIndicebase := Value;
end;

procedure TDbCotacaomoeda.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbCotacaomoeda.SetNumdiasprazo(const Value: TCmDbField);
begin
  FNumdiasprazo := Value;
end;

procedure TDbCotacaomoeda.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

end.

