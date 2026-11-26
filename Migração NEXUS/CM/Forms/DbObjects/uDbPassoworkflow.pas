{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbPassoworkflow;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPassoworkflow = class(TCmDbObject)

  private
    FDescpasso: TCmDbField;
    FItemmenu: TCmDbField;
    FNomepasso: TCmDbField;
    FIdform: TCmDbField;
    FOrdem: TCmDbField;
    FIdworkflow: TCmDbField;
    procedure SetDescpasso(const Value: TCmDbField);
    procedure SetIdform(const Value: TCmDbField);
    procedure SetIdworkflow(const Value: TCmDbField);
    procedure SetItemmenu(const Value: TCmDbField);
    procedure SetNomepasso(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);
  public

     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Nomepasso: TCmDbField read FNomepasso write SetNomepasso;
     Property Itemmenu: TCmDbField read FItemmenu write SetItemmenu;
     Property Idworkflow: TCmDbField read FIdworkflow write SetIdworkflow;
     Property Idform: TCmDbField read FIdform write SetIdform;
     Property Descpasso: TCmDbField read FDescpasso write SetDescpasso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbPassoworkflow }

constructor TDbPassoworkflow.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PASSOWORKFLOW';

   fOrdem := CreateCmDbField('ORDEM',ftfloat,True,True,False,True,'');
   fNomepasso := CreateCmDbField('NOMEPASSO',ftString,False,False,False,True,'');
   fItemmenu := CreateCmDbField('ITEMMENU',ftString,False,False,False,True,'');
   fIdworkflow := CreateCmDbField('IDWORKFLOW',ftfloat,True,True,False,True,'');
   fIdform := CreateCmDbField('IDFORM',ftfloat,False,False,False,True,'');
   fDescpasso := CreateCmDbField('DESCPASSO',ftString,False,False,False,True,'');
end;

procedure TDbPassoworkflow.SetDescpasso(const Value: TCmDbField);
begin
  FDescpasso := Value;
end;

procedure TDbPassoworkflow.SetIdform(const Value: TCmDbField);
begin
  FIdform := Value;
end;

procedure TDbPassoworkflow.SetIdworkflow(const Value: TCmDbField);
begin
  FIdworkflow := Value;
end;

procedure TDbPassoworkflow.SetItemmenu(const Value: TCmDbField);
begin
  FItemmenu := Value;
end;

procedure TDbPassoworkflow.SetNomepasso(const Value: TCmDbField);
begin
  FNomepasso := Value;
end;

procedure TDbPassoworkflow.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

end.



