{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/09/2004                             }
{                                                       }
{*******************************************************}

unit uDbWebHstAcesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbWebHstAcesso = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FSeqacesso: TCmDbField;
    FDatahora: TCmDbField;
    FIdwebinterface: TCmDbField;
    procedure SetDatahora(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetSeqacesso(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);

  public

     Property Seqacesso: TCmDbField read FSeqacesso write SetSeqacesso;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Datahora: TCmDbField read FDatahora write SetDatahora;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbWebHstAcesso }

constructor TDbWebHstAcesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBHSTACESSO';

   fSeqacesso := CreateCmDbField('SEQACESSO',ftfloat,True,True,False,True,'Seq. Acesso');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
   fDatahora := CreateCmDbField('DATAHORA',ftDateTime,True,False,False,True,'Data e Hora');
   FIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftfloat,True,False,False,True,'Id. Interface');
end;

procedure TDbWebHstAcesso.SetDatahora(const Value: TCmDbField);
begin
  FDatahora := Value;
end;

procedure TDbWebHstAcesso.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbWebHstAcesso.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebHstAcesso.SetSeqacesso(const Value: TCmDbField);
begin
  FSeqacesso := Value;
end;

end.



