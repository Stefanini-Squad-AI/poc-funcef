{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbOutroDado;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOutroDado = class(TCmDbObject)

  private
    FOdodescricao: TCmDbField;
    FIdoutrodado: TCmDbField;

    // Daniel - 23516
    FAnaSint: TCmDbField;
    FCodCompl: TCmDbField;
    FTipoDado: TCmDbField;
    FOpcoes: TCmDbField;
    FFlgOrigem: TCmDbField;
    // Daniel - 23516


    procedure SetIdoutrodado(const Value: TCmDbField);
    procedure SetOdodescricao(const Value: TCmDbField);
    procedure SetCodCompl(const Value: TCmDbField);
    procedure SetTipoDado(const Value: TCmDbField);
    procedure SetOpcoes(const Value: TCmDbField);
    procedure SetAnaSint(const Value: TCmDbField);
    procedure SetFlgOrigem(const Value: TCmDbField);

  public

     Property Ododescricao: TCmDbField read FOdodescricao write SetOdodescricao;
     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;

     // Daniel - 23516
     property CodCompl: TCmDbField read FCodCompl  write SetCodCompl;
     property AnaSint:  TCmDbField read FAnaSint   write SetAnaSint;
     property TipoDado: TCmDbField read FTipoDado  write SetTipoDado;
     property Opcoes:   TCmDbField read FOpcoes    write SetOpcoes;
     property FlgOrigem:TCmDbField read FFlgOrigem write SetFlgOrigem;
     // Daniel - 23516

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOutroDado }

constructor TDbOutroDado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADO';

   fOdodescricao := CreateCmDbField('ODODESCRICAO',ftString,False,False,False,True,'Descrição');
   fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,True,False,True,'');

   // Daniel - 23516
   FCodCompl  := CreateCmDbField('CODCOMPL',ftString,False,False,False,True,'');
   FAnaSint   := CreateCmDbField('ANASINT',ftString,False,False,False,True,'');
   FTipoDado  := CreateCmDbField('TIPODADO',ftString,False,False,False,True,'');
   FOpcoes   := CreateCmDbField('OPCOES',ftString,False,False,False,True,'');
   FFlgOrigem:= CreateCmDbField('FLGORIGEM',ftString,False,False,False,True,'');   
   // Daniel - 23516

end;

function TDbOutroDado.Insert: Boolean;
begin

   fIdoutrodado.AsFloat := GetSequence('OUTRODADO');
   Result := Inherited Insert;

end;

function TDbOutroDado.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbOutroDado.SetAnaSint(const Value: TCmDbField);
begin
  FAnaSint := Value;
end;

procedure TDbOutroDado.SetCodCompl(const Value: TCmDbField);
begin
  FCodCompl := Value;
end;

procedure TDbOutroDado.SetFlgOrigem(const Value: TCmDbField);
begin
  FFlgOrigem := Value;
end;

procedure TDbOutroDado.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

procedure TDbOutroDado.SetOdodescricao(const Value: TCmDbField);
begin
  FOdodescricao := Value;
end;

procedure TDbOutroDado.SetOpcoes(const Value: TCmDbField);
begin
  FOpcoes := Value;
end;

procedure TDbOutroDado.SetTipoDado(const Value: TCmDbField);
begin
  FTipoDado := Value;
end;

end.



