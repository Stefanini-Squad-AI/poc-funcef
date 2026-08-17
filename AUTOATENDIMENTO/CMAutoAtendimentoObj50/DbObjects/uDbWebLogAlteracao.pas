{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebLogAlteracao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebLogAlteracao = class(TCmDbObject)

  private
    FLote: TCmDbField;
    FIdwebtransfdados: TCmDbField;
    FDatahora: TCmDbField;
    FValoratual: TCmDbField;
    FNomecampo: TCmDbField;
    FTabela: TCmDbField;
    FValoranterior: TCmDbField;
    FIdweblogalteracao: TCmDbField;
    FUsuario: TCmDbField;
    FOperacao: TCmDbField;
    FChaveprimaria: TCmDbField;
    procedure SetChaveprimaria(const Value: TCmDbField);
    procedure SetDatahora(const Value: TCmDbField);
    procedure SetIdweblogalteracao(const Value: TCmDbField);
    procedure SetIdwebtransfdados(const Value: TCmDbField);
    procedure SetLote(const Value: TCmDbField);
    procedure SetNomecampo(const Value: TCmDbField);
    procedure SetOperacao(const Value: TCmDbField);
    procedure SetTabela(const Value: TCmDbField);
    procedure SetUsuario(const Value: TCmDbField);
    procedure SetValoranterior(const Value: TCmDbField);
    procedure SetValoratual(const Value: TCmDbField);

  public

     Property Valoratual: TCmDbField read FValoratual write SetValoratual;
     Property Valoranterior: TCmDbField read FValoranterior write SetValoranterior;
     Property Usuario: TCmDbField read FUsuario write SetUsuario;
     Property Tabela: TCmDbField read FTabela write SetTabela;
     Property Operacao: TCmDbField read FOperacao write SetOperacao;
     Property Nomecampo: TCmDbField read FNomecampo write SetNomecampo;
     Property Lote: TCmDbField read FLote write SetLote;
     Property Idwebtransfdados: TCmDbField read FIdwebtransfdados write SetIdwebtransfdados;
     Property Idweblogalteracao: TCmDbField read FIdweblogalteracao write SetIdweblogalteracao;
     Property Datahora: TCmDbField read FDatahora write SetDatahora;
     Property Chaveprimaria: TCmDbField read FChaveprimaria write SetChaveprimaria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     function ProximoId : integer;
  End;

implementation

{ TDbWebLogAlteracao }

constructor TDbWebLogAlteracao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBLOGALTERACAO';

   fValoratual := CreateCmDbField('VALORATUAL',ftString,False,False,False,False,'Valor Atual');
   fValoranterior := CreateCmDbField('VALORANTERIOR',ftString,False,False,False,False,'Valor Anterior');
   fUsuario := CreateCmDbField('USUARIO',ftString,True,False,False,False,'Usuário');
   fTabela := CreateCmDbField('TABELA',ftString,True,False,False,False,'Tabela');
   fOperacao := CreateCmDbField('OPERACAO',ftString,True,False,False,False,'Operação');
   fNomecampo := CreateCmDbField('NOMECAMPO',ftString,False,False,False,False,'Nome do Campo');
   fLote := CreateCmDbField('LOTE',ftfloat,True,False,False,False,'Lote');
   fIdwebtransfdados := CreateCmDbField('IDWEBTRANSFDADOS',ftfloat,False,False,False,False,'Id. Transferência');
   fIdweblogalteracao := CreateCmDbField('IDWEBLOGALTERACAO',ftfloat,True,True,False,False,'Id. Alteração');
   fDatahora := CreateCmDbField('DATAHORA',ftDateTime,True,False,False,False,'Data/Hora');
   fChaveprimaria := CreateCmDbField('CHAVEPRIMARIA',ftString,True,False,False,False,'Chave Primária');
end;

function TDbWebLogAlteracao.ProximoId: integer;
begin
  Result := GetSequence( 'WEBLOGALTERACAO' );
end;

procedure TDbWebLogAlteracao.SetChaveprimaria(const Value: TCmDbField);
begin
  FChaveprimaria := Value;
end;

procedure TDbWebLogAlteracao.SetDatahora(const Value: TCmDbField);
begin
  FDatahora := Value;
end;

procedure TDbWebLogAlteracao.SetIdweblogalteracao(const Value: TCmDbField);
begin
  FIdweblogalteracao := Value;
end;

procedure TDbWebLogAlteracao.SetIdwebtransfdados(const Value: TCmDbField);
begin
  FIdwebtransfdados := Value;
end;

procedure TDbWebLogAlteracao.SetLote(const Value: TCmDbField);
begin
  FLote := Value;
end;

procedure TDbWebLogAlteracao.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;

procedure TDbWebLogAlteracao.SetOperacao(const Value: TCmDbField);
begin
  FOperacao := Value;
end;

procedure TDbWebLogAlteracao.SetTabela(const Value: TCmDbField);
begin
  FTabela := Value;
end;

procedure TDbWebLogAlteracao.SetUsuario(const Value: TCmDbField);
begin
  FUsuario := Value;
end;

procedure TDbWebLogAlteracao.SetValoranterior(const Value: TCmDbField);
begin
  FValoranterior := Value;
end;

procedure TDbWebLogAlteracao.SetValoratual(const Value: TCmDbField);
begin
  FValoratual := Value;
end;

end.



