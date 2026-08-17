{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraAval;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraAval = class(TCmDbObject)
  private
    FIdcargo: TCmDbField;
    FIdresponsavel: TCmDbField;
    FIdcontato: TCmDbField;
    FIdaval: TCmDbField;
    FIdestab: TCmDbField;
    FIdempresa: TCmDbField;
    FDescricao: TCmDbField;
    FIdhorario: TCmDbField;
    FIdpessoa: TCmDbField;
    FIndabrangencia: TCmDbField;
    FTextocompl: TCmDbField;
    FDataaval: TCmDbField;
    FIndtipoaval: TCmDbField;
    FIdlocalizacao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property TextoCompl: TCmDbField read FTextocompl write FTextocompl;
    property IndTipoAval: TCmDbField read FIndtipoaval write FIndtipoaval;
    property IndAbrangencia: TCmDbField read FIndabrangencia write FIndabrangencia;
    property IdResponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
    property IdPessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property IdLocalizacao: TCmDbField read FIdlocalizacao write FIdlocalizacao;
    property IdHorario: TCmDbField read FIdhorario write FIdhorario;
    property IdEstab: TCmDbField read FIdestab write FIdestab;
    property IdEmpresa: TCmDbField read FIdempresa write FIdempresa;
    property IdContato: TCmDbField read FIdcontato write FIdcontato;
    property IdCargo: TCmDbField read FIdcargo write FIdcargo;
    property IdAval: TCmDbField read FIdaval write FIdaval;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property DataAval: TCmDbField read FDataaval write FDataaval;
  end;

implementation

{ TDbPpraAval }

constructor TDbPpraAval.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAAVAL';

  FTextocompl := CreateCmDbField('TEXTOCOMPL',ftString,false,false,false,true,'');
  FIndtipoaval := CreateCmDbField('INDTIPOAVAL',ftfloat,false,false,false,true,'');
  FIndabrangencia := CreateCmDbField('INDABRANGENCIA',ftfloat,false,false,false,true,'');
  FIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,false,false,false,true,'');
  FIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,false,false,false,true,'');
  FIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,false,false,false,true,'');
  FIdhorario := CreateCmDbField('IDHORARIO',ftfloat,false,false,false,true,'');
  FIdestab := CreateCmDbField('IDESTAB',ftfloat,false,false,false,true,'');
  FIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,false,false,false,true,'');
  FIdcontato := CreateCmDbField('IDCONTATO',ftfloat,false,false,false,true,'');
  FIdcargo := CreateCmDbField('IDCARGO',ftfloat,false,false,false,true,'');
  FIdaval := CreateCmDbField('IDAVAL',ftfloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
  FDataaval := CreateCmDbField('DATAAVAL',ftDateTime,false,false,false,true,'');
end;

function TDbPpraAval.Insert: boolean;
begin
  FIdaval.asFloat := GetSequence('PPRAAVAL');
  Result := inherited Insert;
end;

end.
