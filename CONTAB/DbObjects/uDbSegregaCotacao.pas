{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alex Pereira                    }
{ Atualizado Em: 16/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbSegregaCotacao;

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 09/01/04
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Retirando campo IDSEGREGACRITER
                 Se necessário, fazer join com IDSEGREGADATA
------------------------------------------------------------------------------}


interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSegregaCotacao = class(TCmDbObject)

  private
    FIdsegregadata: TCmDbField;
    FCotacao: TCmDbField;
    FIdpatro: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdsegregacotacao: TCmDbField;
    procedure SetCotacao(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsegregacotacao(const Value: TCmDbField);
    procedure SetIdsegregadata(const Value: TCmDbField);

  public

     Property Idsegregadata: TCmDbField read FIdsegregadata write SetIdsegregadata;
// Alex 011/02/04 14451       Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idsegregacotacao: TCmDbField read FIdsegregacotacao write SetIdsegregacotacao;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Cotacao: TCmDbField read FCotacao write SetCotacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSegregaCotacao }

constructor TDbSegregaCotacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGREGACOTACAO';

   fIdsegregadata := CreateCmDbField('IDSEGREGADATA',ftfloat,False,False,False,True,'');
   fIdsegregacotacao := CreateCmDbField('IDSEGREGACOTACAO',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fCotacao := CreateCmDbField('COTACAO',ftfloat,False,False,False,True,'');
end;

function TDbSegregaCotacao.Insert: Boolean;
begin

   fIdsegregacotacao.AsFloat := GetSequence('SEGREGACOTACAO');
   Result := Inherited Insert;

end;


procedure TDbSegregaCotacao.SetCotacao(const Value: TCmDbField);
begin
  FCotacao := Value;
end;

procedure TDbSegregaCotacao.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbSegregaCotacao.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbSegregaCotacao.SetIdsegregacotacao(const Value: TCmDbField);
begin
  FIdsegregacotacao := Value;
end;

procedure TDbSegregaCotacao.SetIdsegregadata(const Value: TCmDbField);
begin
  FIdsegregadata := Value;
end;

end.



