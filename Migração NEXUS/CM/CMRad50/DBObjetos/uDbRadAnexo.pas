{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbRadAnexo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadAnexo = class(TCmDbObject)

  private
    FIdradanexo: TCmDbField;
    FNomearquivo: TCmDbField;
    FConteudo: TCmDbField;
    FIdusuario: TCmDbField;
    FDescricao: TCmDbField;
    FIdprocesso: TCmDbField;
    FDatahora: TCmDbField;
    procedure SetConteudo(const Value: TCmDbField);
    procedure SetDatahora(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdradanexo(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetNomearquivo(const Value: TCmDbField);

  public

     Property Nomearquivo: TCmDbField read FNomearquivo write SetNomearquivo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idradanexo: TCmDbField read FIdradanexo write SetIdradanexo;
     Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datahora: TCmDbField read FDatahora write SetDatahora;
     Property Conteudo: TCmDbField read FConteudo write SetConteudo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRadAnexo }

constructor TDbRadAnexo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADANEXO';

   fNomearquivo := CreateCmDbField('NOMEARQUIVO',ftString,True,False,False,True,'Nome do arquivo');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Id. Usuário');
   fIdradanexo := CreateCmDbField('IDRADANEXO',ftfloat,True,True,False,True,'Id. RAD Anexo');
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,True,False,False,True,'Id. Processo');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
   fDatahora := CreateCmDbField('DATAHORA',ftDateTime,True,False,False,True,'Data e hora', -1, True);
   fConteudo := CreateCmDbField('CONTEUDO',ftBlob,False,False,False,True,'Conteúdo');
end;

procedure TDbRadAnexo.SetConteudo(const Value: TCmDbField);
begin
  FConteudo := Value;
end;

procedure TDbRadAnexo.SetDatahora(const Value: TCmDbField);
begin
  FDatahora := Value;
end;

procedure TDbRadAnexo.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRadAnexo.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbRadAnexo.SetIdradanexo(const Value: TCmDbField);
begin
  FIdradanexo := Value;
end;

procedure TDbRadAnexo.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbRadAnexo.SetNomearquivo(const Value: TCmDbField);
begin
  FNomearquivo := Value;
end;

end.



