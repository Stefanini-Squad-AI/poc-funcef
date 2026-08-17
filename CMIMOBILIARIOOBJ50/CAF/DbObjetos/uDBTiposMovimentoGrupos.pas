{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBTiposMovimentoGrupos;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBTiposMovimentoGrupos = class(TCmDbObject)

  private
    FIdgrupo: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);

  public

     Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTiposMovimentoGrupos }

constructor TDBTiposMovimentoGrupos.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPOSMOVIMENTOGRUPOS';

   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,False,'');
end;

function TDBTiposMovimentoGrupos.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBTiposMovimentoGrupos.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTiposMovimentoGrupos.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdtipomovimentacao(const Value: TCmDbField);
begin
   FIdtipomovimentacao := Value;
end;

end.



