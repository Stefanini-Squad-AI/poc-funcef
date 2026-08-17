{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       )
{ Atualizado Em: 24/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbAvaliacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAvaliacao = class(TCmDbObject)

  private
    FNota: TCmDbField;
    FCodDocumento: TCmDbField;
    FIdNFRecebDevol: TCmDbField;
    FIdAvaliacao: TCmDbField;
    procedure SetCodDocumento(const Value: TCmDbField);
    procedure SetIdAvaliacao(const Value: TCmDbField);
    procedure SetIdNFRecebDevol(const Value: TCmDbField);
    procedure SetNota(const Value: TCmDbField);

  public

     Property Nota           : TCmDbField read FNota write SetNota;
     Property IdNFRecebDevol : TCmDbField read FIdNFRecebDevol write SetIdNFRecebDevol;
     Property IdAvaliacao    : TCmDbField read FIdAvaliacao write SetIdAvaliacao;
     Property CodDocumento   : TCmDbField read FCodDocumento write SetCodDocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvaliacao }

constructor TDbAvaliacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AVALIACAO';

   fNota := CreateCmDbField('NOTA',ftfloat,False,False,False,True,'');
   fIdnfrecebdevol := CreateCmDbField('IDNFRECEBDEVOL',ftfloat,False,False,False,True,'');
   fIdavaliacao := CreateCmDbField('IDAVALIACAO',ftfloat,True,True,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
end;

function TDbAvaliacao.Insert: Boolean;
begin
   fIdavaliacao.AsFloat := GetSequence('AVALIACAO');
   Result := Inherited Insert;
end;


procedure TDbAvaliacao.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDbAvaliacao.SetIdAvaliacao(const Value: TCmDbField);
begin
  FIdAvaliacao := Value;
end;

procedure TDbAvaliacao.SetIdNFRecebDevol(const Value: TCmDbField);
begin
  FIdNFRecebDevol := Value;
end;

procedure TDbAvaliacao.SetNota(const Value: TCmDbField);
begin
  FNota := Value;
end;

end.



