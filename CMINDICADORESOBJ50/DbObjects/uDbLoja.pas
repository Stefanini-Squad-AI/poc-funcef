{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbLoja;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbloja = class(TCmDbObject)

  private
    FPiso: TCmDbField;
    FQtdeabl: TCmDbField;
    FIdimovel: TCmDbField;
    FIdloja: TCmDbField;
    FNumloja: TCmDbField;
    FFlgSituacao: TcmDbField;
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdloja(const Value: TCmDbField);
    procedure SetNumloja(const Value: TCmDbField);
    procedure SetPiso(const Value: TCmDbField);
    procedure SetQtdeabl(const Value: TCmDbField);
    procedure SetFlgSituacao(const Value: TCmDbField);

  public

     Property Qtdeabl: TCmDbField read FQtdeabl write SetQtdeabl;
     Property Piso: TCmDbField read FPiso write SetPiso;
     Property Numloja: TCmDbField read FNumloja write SetNumloja;
     Property Idloja: TCmDbField read FIdloja write SetIdloja;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property FlgSituacao: TCmDbField read FFlgSituacao write SetFlgSituacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbloja }

constructor TDbloja.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDLOJA';

   fQtdeabl := CreateCmDbField('QTDEABL',ftfloat,False,False,False,True,'Quantidade de ABL da Loja');
   fPiso := CreateCmDbField('PISO',ftString,False,False,False,True,'Piso da Loja');
   fNumloja := CreateCmDbField('NUMLOJA',ftString,True,False,False,True,'Nr. da Loja');
   fIdloja := CreateCmDbField('IDLOJA',ftfloat,True,True,False,True,'ID da Loja');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,False,False,True,'ID do Shopping');
   fFlgSituacao := CreateCmDbField('FLGSITUACAO',ftString,True,False,False,True,'Situação da Loja');
end;

function TDbloja.Insert: Boolean;
begin

   fIdloja.AsFloat := GetSequence('INDLOJA');
   Result := Inherited Insert;

end;

function TDbloja.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbloja.SetFlgSituacao(const Value: TCmDbField);
begin
  FFlgSituacao := Value;
end;

procedure TDbloja.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbloja.SetIdloja(const Value: TCmDbField);
begin
  FIdloja := Value;
end;

procedure TDbloja.SetNumloja(const Value: TCmDbField);
begin
  FNumloja := Value;
end;

procedure TDbloja.SetPiso(const Value: TCmDbField);
begin
  FPiso := Value;
end;

procedure TDbloja.SetQtdeabl(const Value: TCmDbField);
begin
  FQtdeabl := Value;
end;

end.



