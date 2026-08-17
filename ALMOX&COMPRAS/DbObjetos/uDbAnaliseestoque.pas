{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbAnaliseestoque;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAnaliseestoque = class(TCmDbObject)

  private
    FDatafimconsmed: TCmDbField;
    FPercminimo: TCmDbField;
    FDataanalise: TCmDbField;
    FDatafimtrmed: TCmDbField;
    FFlgaceita: TCmDbField;
    FDatainitrmed: TCmDbField;
    FCodalmoxarifado: TCmDbField;
    FIdanaliseestoque: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumsolcompra: TCmDbField;
    FDatainiconsmed: TCmDbField;
    FCodgrupoprod: TCmDbField;
    procedure SetCodalmoxarifado(const Value: TCmDbField);
    procedure SetCodgrupoprod(const Value: TCmDbField);
    procedure SetDataanalise(const Value: TCmDbField);
    procedure SetDatafimconsmed(const Value: TCmDbField);
    procedure SetDatafimtrmed(const Value: TCmDbField);
    procedure SetDatainiconsmed(const Value: TCmDbField);
    procedure SetDatainitrmed(const Value: TCmDbField);
    procedure SetFlgaceita(const Value: TCmDbField);
    procedure SetIdanaliseestoque(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumsolcompra(const Value: TCmDbField);
    procedure SetPercminimo(const Value: TCmDbField);

  public

     Property Percminimo: TCmDbField read FPercminimo write SetPercminimo;
     Property Numsolcompra: TCmDbField read FNumsolcompra write SetNumsolcompra;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idanaliseestoque: TCmDbField read FIdanaliseestoque write SetIdanaliseestoque;
     Property Flgaceita: TCmDbField read FFlgaceita write SetFlgaceita;
     Property Datainitrmed: TCmDbField read FDatainitrmed write SetDatainitrmed;
     Property Datainiconsmed: TCmDbField read FDatainiconsmed write SetDatainiconsmed;
     Property Datafimtrmed: TCmDbField read FDatafimtrmed write SetDatafimtrmed;
     Property Datafimconsmed: TCmDbField read FDatafimconsmed write SetDatafimconsmed;
     Property Dataanalise: TCmDbField read FDataanalise write SetDataanalise;
     Property Codgrupoprod: TCmDbField read FCodgrupoprod write SetCodgrupoprod;
     Property Codalmoxarifado: TCmDbField read FCodalmoxarifado write SetCodalmoxarifado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAnaliseestoque }

constructor TDbAnaliseestoque.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ANALISEESTOQUE';

   fPercminimo := CreateCmDbField('PERCMINIMO',ftfloat,False,False,False,True,'');
   fNumsolcompra := CreateCmDbField('NUMSOLCOMPRA',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdanaliseestoque := CreateCmDbField('IDANALISEESTOQUE',ftfloat,True,True,False,True,'');
   fFlgaceita := CreateCmDbField('FLGACEITA',ftString,False,False,False,True,'');
   fDatainitrmed := CreateCmDbField('DATAINITRMED',ftDateTime,False,False,False,True,'');
   fDatainiconsmed := CreateCmDbField('DATAINICONSMED',ftDateTime,False,False,False,True,'');
   fDatafimtrmed := CreateCmDbField('DATAFIMTRMED',ftDateTime,False,False,False,True,'');
   fDatafimconsmed := CreateCmDbField('DATAFIMCONSMED',ftDateTime,False,False,False,True,'');
   fDataanalise := CreateCmDbField('DATAANALISE',ftDateTime,False,False,False,True,'');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,False,False,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,False,False,False,True,'');
end;

function TDbAnaliseestoque.Insert: Boolean;
begin

   fIdanaliseestoque.AsFloat := GetSequence('ANALISEESTOQUE');
   Result := Inherited Insert;

end;


procedure TDbAnaliseestoque.SetCodalmoxarifado(const Value: TCmDbField);
begin
  FCodalmoxarifado := Value;
end;

procedure TDbAnaliseestoque.SetCodgrupoprod(const Value: TCmDbField);
begin
  FCodgrupoprod := Value;
end;

procedure TDbAnaliseestoque.SetDataanalise(const Value: TCmDbField);
begin
  FDataanalise := Value;
end;

procedure TDbAnaliseestoque.SetDatafimconsmed(const Value: TCmDbField);
begin
  FDatafimconsmed := Value;
end;

procedure TDbAnaliseestoque.SetDatafimtrmed(const Value: TCmDbField);
begin
  FDatafimtrmed := Value;
end;

procedure TDbAnaliseestoque.SetDatainiconsmed(const Value: TCmDbField);
begin
  FDatainiconsmed := Value;
end;

procedure TDbAnaliseestoque.SetDatainitrmed(const Value: TCmDbField);
begin
  FDatainitrmed := Value;
end;

procedure TDbAnaliseestoque.SetFlgaceita(const Value: TCmDbField);
begin
  FFlgaceita := Value;
end;

procedure TDbAnaliseestoque.SetIdanaliseestoque(const Value: TCmDbField);
begin
  FIdanaliseestoque := Value;
end;

procedure TDbAnaliseestoque.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbAnaliseestoque.SetNumsolcompra(const Value: TCmDbField);
begin
  FNumsolcompra := Value;
end;

procedure TDbAnaliseestoque.SetPercminimo(const Value: TCmDbField);
begin
  FPercminimo := Value;
end;

end.



