{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbGrupo;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbGrupo = class(TCmDbObject)
  private
    FDataUltDep: TCmDbField;
    FUltIdBem: TCmDbField;
    FTaxaDep2: TCmDbField;
    FNome: TCmDbField;
    FMoeCodigo: TCmDbField;
    FIdGrupo: TCmDbField;
    FValAluguel: TCmDbField;
    FTipo: TCmDbField;
    FStatus: TCmDbField;
    FTaxaDep3: TCmDbField;
    FDataRecalcDep: TCmDbField;
    FDepreciacao: TCmDbField;
    FFlgSemplaca: TCmDbField;
    FFlgImovel: TCmDbField;
    FClasse: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property ValAluguel: TCmDbField read FValAluguel write FValAluguel;
    property UltIdBem: TCmDbField read FUltIdBem write FUltIdBem;
    property Tipo: TCmDbField read FTipo write FTipo;
    property TaxaDep3: TCmDbField read FTaxaDep3 write FTaxaDep3;
    property TaxaDep2: TCmDbField read FTaxaDep2 write FTaxaDep2;
    property Status: TCmDbField read FStatus write FStatus;
    property Nome: TCmDbField read FNome write FNome;
    property MoeCodigo: TCmDbField read FMoeCodigo write FMoeCodigo;
    property IdGrupo: TCmDbField read FIdGrupo write FIdGrupo;
    property FlgSemPlaca: TCmDbField read FFlgSemPlaca write FFlgSemPlaca;
    property FlgImovel: TCmDbField read FFlgImovel write FFlgImovel;
    property Depreciacao: TCmDbField read FDepreciacao write FDepreciacao;
    property DataultDep: TCmDbField read FDataultDep write FDataultDep;
    property DataRecalcDep: TCmDbField read FDataRecalcDep write FDataRecalcDep;
    property Classe: TCmDbField read FClasse write FClasse;
  end;

implementation

{ TDbGrupo }

constructor TDbGrupo.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRUPO';

  FValAluguel := CreateCmDbField('VALALUGUEL',ftfloat,false,false,false,true,'');
  FUltIdBem := CreateCmDbField('ULTIDBEM',ftfloat,false,false,false,true,'');
  FTipo := CreateCmDbField('TIPO',ftString,true,false,false,true,'');
  FTaxaDep3 := CreateCmDbField('TAXADEP3',ftfloat,false,false,false,true,'');
  FTaxaDep2 := CreateCmDbField('TAXADEP2',ftfloat,false,false,false,true,'');
  FStatus := CreateCmDbField('STATUS',ftString,true,false,false,true,'');
  FNome := CreateCmDbField('NOME',ftString,true,false,false,true,'');
  FMoeCodigo := CreateCmDbField('MOECODIGO',ftfloat,false,false,false,true,'');
  FIdGrupo := CreateCmDbField('IDGRUPO',ftfloat,true,true,false,true,'');
  FFlgSemPlaca := CreateCmDbField('FLGSEMPLACA',ftfloat,false,false,false,true,'');
  FFlgImovel := CreateCmDbField('FLGIMOVEL',ftfloat,false,false,false,true,'');
  FDepreciacao := CreateCmDbField('DEPRECIACAO',ftfloat,false,false,false,true,'');
  FDataultDep := CreateCmDbField('DATAULTDEP',ftDateTime,false,false,false,true,'');
  FDataRecalcDep := CreateCmDbField('DATARECALCDEP',ftDateTime,false,false,false,true,'');
  FClasse := CreateCmDbField('CLASSE',ftString,true,false,false,true,'');
end;

function TDbGrupo.Insert: boolean;
begin
  FIdGrupo.asFloat := GetSequence('GRUPO');
  Result := inherited Insert;
end;

end.
