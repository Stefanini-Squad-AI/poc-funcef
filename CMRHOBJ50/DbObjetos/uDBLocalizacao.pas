{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBLocalizacao;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBLocalizacao = class(TCmDbObject)

  private
    FIdresponsavel: TCmDbField;
    FFlglocsaitemp: TCmDbField;
    FIdempresa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FNome: TCmDbField;
    FIdtipoarea: TCmDbField;
    FIdpessoa: TCmDbField;
    FEndereco: TCmDbField;
    FIdlocalizacao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property Nome: TCmDbField read FNome write FNome;
    property IdTipoArea: TCmDbField read FIdtipoarea write FIdtipoarea;
    property IdResponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
    property IdPessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property IdLocalizacao: TCmDbField read FIdlocalizacao write FIdlocalizacao;
    property IdEmpresa: TCmDbField read FIdempresa write FIdempresa;
    property FlgLocSaiTemp: TCmDbField read FFlglocsaitemp write FFlglocsaitemp;
    property Endereco: TCmDbField read FEndereco write FEndereco;
    property CodCentroCusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
  end;

implementation

{ TDBLocalizacao }

constructor TDBLocalizacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'LOCALIZACAO';

  FNome := CreateCmDbField('NOME',ftString,true,false,false,true,'');
  FIdtipoarea := CreateCmDbField('IDTIPOAREA',ftfloat,true,false,false,true,'');
  FIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,false,false,false,true,'');
  FIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,true,true,false,false,''); // Atenção
  FIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,true,true,false,true,'');
  FIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,false,false,false,true,'');
  FFlglocsaitemp := CreateCmDbField('FLGLOCSAITEMP',ftfloat,false,false,false,false,''); // Atenção
  FEndereco := CreateCmDbField('ENDERECO',ftString,false,false,false,true,'');
  FCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
end;

function TDBLocalizacao.Insert: boolean;
begin
  FIdlocalizacao.asFloat := GetSequence('LOCALIZACAO');
  Result := inherited Insert;
end;

end.
