{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 01/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbLogTabelas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLogTabelas = class(TCmDbObject)
  private
    FLotetransmissao: TCmDbField;
    FOperacao: TCmDbField;
    FNomecampo: TCmDbField;
    FDatahora: TCmDbField;
    FIdlogtabela: TCmDbField;
    FValoratual: TCmDbField;
    FUsuario: TCmDbField;
    FValoranterior: TCmDbField;
    FChaveprimaria: TCmDbField;
    FArquivo: TCmDbField;
    procedure SetArquivo(const Value: TCmDbField);
    procedure SetChaveprimaria(const Value: TCmDbField);
    procedure SetDatahora(const Value: TCmDbField);
    procedure SetIdlogtabela(const Value: TCmDbField);
    procedure SetLotetransmissao(const Value: TCmDbField);
    procedure SetNomecampo(const Value: TCmDbField);
    procedure SetOperacao(const Value: TCmDbField);
    procedure SetUsuario(const Value: TCmDbField);
    procedure SetValoranterior(const Value: TCmDbField);
    procedure SetValoratual(const Value: TCmDbField);

  public
    Property Valoratual: TCmDbField read FValoratual write SetValoratual;
    Property Valoranterior: TCmDbField read FValoranterior write SetValoranterior;
    Property Usuario: TCmDbField read FUsuario write SetUsuario;
    Property Operacao: TCmDbField read FOperacao write SetOperacao;
    Property Nomecampo: TCmDbField read FNomecampo write SetNomecampo;
    Property Lotetransmissao: TCmDbField read FLotetransmissao write SetLotetransmissao;
    Property Idlogtabela: TCmDbField read FIdlogtabela write SetIdlogtabela;
    Property Datahora: TCmDbField read FDatahora write SetDatahora;
    Property Chaveprimaria: TCmDbField read FChaveprimaria write SetChaveprimaria;
    Property Arquivo: TCmDbField read FArquivo write SetArquivo;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbLogTabelas }

constructor TDbLogTabelas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGTABELAS';

  fValoratual      := CreateCmDbField('VALORATUAL',ftString,False,False,False,True,'Valor Atual');
  fValoranterior   := CreateCmDbField('VALORANTERIOR',ftString,False,False,False,True,'Valor Anterior');
  fUsuario         := CreateCmDbField('USUARIO',ftString,False,False,False,True,'Usuário');
  fOperacao        := CreateCmDbField('OPERACAO',ftString,False,False,False,True,'Operação');
  fNomecampo       := CreateCmDbField('NOMECAMPO',ftString,False,False,False,True,'Nome do Campo');
  fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'Lote de Transmissão');
  fIdlogtabela     := CreateCmDbField('IDLOGTABELA',ftfloat,True,False,False,True,'Código');
  fDatahora        := CreateCmDbField('DATAHORA',ftDateTime,False,False,False,True,'Data e Hora');
  fChaveprimaria   := CreateCmDbField('CHAVEPRIMARIA',ftString,False,False,False,True,'Chave Primária');
  fArquivo         := CreateCmDbField('ARQUIVO',ftString,False,False,False,True,'Arquivo');
end;

function TDbLogTabelas.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbLogTabelas.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbLogTabelas.SetArquivo(const Value: TCmDbField);
begin
  FArquivo := Value;
end;

procedure TDbLogTabelas.SetChaveprimaria(const Value: TCmDbField);
begin
  FChaveprimaria := Value;
end;

procedure TDbLogTabelas.SetDatahora(const Value: TCmDbField);
begin
  FDatahora := Value;
end;

procedure TDbLogTabelas.SetIdlogtabela(const Value: TCmDbField);
begin
  FIdlogtabela := Value;
end;

procedure TDbLogTabelas.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbLogTabelas.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;

procedure TDbLogTabelas.SetOperacao(const Value: TCmDbField);
begin
  FOperacao := Value;
end;

procedure TDbLogTabelas.SetUsuario(const Value: TCmDbField);
begin
  FUsuario := Value;
end;

procedure TDbLogTabelas.SetValoranterior(const Value: TCmDbField);
begin
  FValoranterior := Value;
end;

procedure TDbLogTabelas.SetValoratual(const Value: TCmDbField);
begin
  FValoratual := Value;
end;

end.

