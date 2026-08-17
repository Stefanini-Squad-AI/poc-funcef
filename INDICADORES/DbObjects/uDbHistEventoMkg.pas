{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbHistEventoMkg;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbHistEventoMkg = class(TCmDbObject)

  private
    FDatainicio: TCmDbField;
    FIdevento: TCmDbField;
    FDatafim: TCmDbField;
    FIdhistevento: TCmDbField;
    FIdimovel: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetIdevento(const Value: TCmDbField);
    procedure SetIdhistevento(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);

  public

     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idhistevento: TCmDbField read FIdhistevento write SetIdhistevento;
     Property Idevento: TCmDbField read FIdevento write SetIdevento;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHistEventoMkg }

constructor TDbHistEventoMkg.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDHISTEVENTO';

   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,False,False,True,'ID do Imóvel');
   fIdhistevento := CreateCmDbField('IDHISTEVENTO',ftfloat,True,True,False,True,'ID do Histórico');
   fIdevento := CreateCmDbField('IDEVENTO',ftfloat,True,False,False,True,'ID do Evento');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False,False,True,'Início do Evento');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'Término do Evento');
end;

function TDbHistEventoMkg.Insert: Boolean;
begin

   fIdhistevento.AsFloat := GetSequence('INDHISTEVENTO');
   Result := Inherited Insert;

end;

function TDbHistEventoMkg.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbHistEventoMkg.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbHistEventoMkg.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbHistEventoMkg.SetIdevento(const Value: TCmDbField);
begin
  FIdevento := Value;
end;

procedure TDbHistEventoMkg.SetIdhistevento(const Value: TCmDbField);
begin
  FIdhistevento := Value;
end;

procedure TDbHistEventoMkg.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

end.



