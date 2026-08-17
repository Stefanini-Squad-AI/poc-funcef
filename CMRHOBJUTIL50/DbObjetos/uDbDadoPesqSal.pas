{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Criado Em: 24/10/2002                                 }
{                                                       }
{*******************************************************}

unit uDbDadoPesqSal;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbDadoPesqSal = class(TCmDbObject)
  private
    FFreq: TCmDbField;
    FNumSeq: TCmDbField;
    FIdEmprPart: TCmDbField;
    FIdPesqSalar: TCmDbField;
    FIdCargo: TCmDbField;
    FReal: TCmDbField;
    FNominal: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;
    function Insert: boolean; override;

    property IdPesqSalar: TCmDbField read FIdPesqSalar write FIdPesqSalar;
    property IdEmprPart: TCmDbField read FIdEmprPart write FIdEmprPart;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property Freq: TCmDbField read FFreq write FFreq;
    property Real: TCmDbField read FReal write FReal;
    property Nominal: TCmDbField read FNominal write FNominal;
  end;

implementation

{ TDbDadoPesqSal }

constructor TDbDadoPesqSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DADOPESQSAL';

  FIdPesqSalar := CreateCmDbField('IDPESQSALAR',ftFloat,true,true,false,true,'');
  FIdEmprPart := CreateCmDbField('IDEMPRPART',ftFloat,true,true,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FFreq := CreateCmDbField('FREQ',ftFloat,false,false,false,true,'');
  FReal := CreateCmDbField('REAL',ftFloat,false,false,false,true,'');
  FNominal := CreateCmDbField('NOMINAL',ftFloat,false,false,false,true,'');
end;

function TDbDadoPesqSal.Insert: boolean;
begin
  FNumSeq.asFloat := GetSequence('DADOPESQSAL');
  Result := inherited Insert;
end;

end.
