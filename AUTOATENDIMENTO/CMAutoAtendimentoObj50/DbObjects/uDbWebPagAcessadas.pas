{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/09/2004                             }
{                                                       }
{*******************************************************}

unit uDbWebPagAcessadas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbWebPagAcessadas = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdpagina: TCmDbField;
    FSeqacesso: TCmDbField;
    FDatahora: TCmDbField;
    FSeqpagacess: TCmDbField;
    procedure SetDatahora(const Value: TCmDbField);
    procedure SetIdpagina(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetSeqacesso(const Value: TCmDbField);
    procedure SetSeqpagacess(const Value: TCmDbField);

  public

     Property Seqpagacess: TCmDbField read FSeqpagacess write SetSeqpagacess;
     Property Seqacesso: TCmDbField read FSeqacesso write SetSeqacesso;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpagina: TCmDbField read FIdpagina write SetIdpagina;
     Property Datahora: TCmDbField read FDatahora write SetDatahora;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbWebPagAcessadas }

constructor TDbWebPagAcessadas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBPAGACESSADAS';

   fSeqpagacess := CreateCmDbField('SEQPAGACESS',ftfloat,True,True,False,True,'Seq. Pagina Acessada');
   fSeqacesso := CreateCmDbField('SEQACESSO',ftfloat,True,True,False,True,'Seq. Acesso');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
   fIdpagina := CreateCmDbField('IDPAGINA',ftfloat,True,True,False,True,'Id. Pagina');
   fDatahora := CreateCmDbField('DATAHORA',ftDateTime,False,False,False,True,'Data e Hora');
end;

procedure TDbWebPagAcessadas.SetDatahora(const Value: TCmDbField);
begin
  FDatahora := Value;
end;

procedure TDbWebPagAcessadas.SetIdpagina(const Value: TCmDbField);
begin
  FIdpagina := Value;
end;

procedure TDbWebPagAcessadas.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbWebPagAcessadas.SetSeqacesso(const Value: TCmDbField);
begin
  FSeqacesso := Value;
end;

procedure TDbWebPagAcessadas.SetSeqpagacess(const Value: TCmDbField);
begin
  FSeqpagacess := Value;
end;

end.



