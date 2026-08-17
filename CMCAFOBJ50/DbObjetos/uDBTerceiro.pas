{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 12/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBTerceiro;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBTerceiro = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FTipoterceiro: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetTipoterceiro(const Value: TCmDbField);

  public
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Tipoterceiro: TCmDbField read FTipoterceiro write SetTipoterceiro;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDBTerceiro }

constructor TDBTerceiro.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TERCEIRO';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fTipoterceiro := CreateCmDbField('TIPOTERCEIRO',ftfloat,True,False,False,False,'');
end;

function TDBTerceiro.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBTerceiro.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTerceiro.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBTerceiro.SetTipoterceiro(const Value: TCmDbField);
begin
   FTipoterceiro := Value;
end;

end.



