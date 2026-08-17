{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebTransfDados;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebTransfDados = class(TCmDbObject)

  private
    FDttransf: TCmDbField;
    FSituacao: TCmDbField;
    FIdwebtransfdados: TCmDbField;
    FNomebase: TCmDbField;
    procedure SetDttransf(const Value: TCmDbField);
    procedure SetIdwebtransfdados(const Value: TCmDbField);
    procedure SetSituacao(const Value: TCmDbField);
    procedure SetNomebase(const Value: TCmDbField);

  public

     Property Situacao: TCmDbField read FSituacao write SetSituacao;
     Property Idwebtransfdados: TCmDbField read FIdwebtransfdados write SetIdwebtransfdados;
     Property Dttransf: TCmDbField read FDttransf write SetDttransf;
     Property Nomebase: TCmDbField read FNomebase write SetNomebase;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbWebTransfDados }

constructor TDbWebTransfDados.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBTRANSFDADOS';

   fSituacao := CreateCmDbField('SITUACAO',ftString,True,False,False,False,'Situação');
   fIdwebtransfdados := CreateCmDbField('IDWEBTRANSFDADOS',ftfloat,True,True,False,False,'Id. da Transferência');
   fDttransf := CreateCmDbField('DTTRANSF',ftDateTime,True,False,False,False,'Data da Transferência');
   fNomebase := CreateCmDbField('NOMEBASE',ftString,True,False,False,False,'Nome da Base');   
end;

procedure TDbWebTransfDados.SetDttransf(const Value: TCmDbField);
begin
  FDttransf := Value;
end;

procedure TDbWebTransfDados.SetIdwebtransfdados(const Value: TCmDbField);
begin
  FIdwebtransfdados := Value;
end;

procedure TDbWebTransfDados.SetNomebase(const Value: TCmDbField);
begin
  FNomebase := Value;
end;

procedure TDbWebTransfDados.SetSituacao(const Value: TCmDbField);
begin
  FSituacao := Value;
end;

end.



