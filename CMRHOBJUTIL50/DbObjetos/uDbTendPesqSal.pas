{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/10/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTendPesqSal;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbTendPesqSal = class(TCmDbObject)
  private
    FFreq: TCmDbField;
    FMediana: TCmDbField;
    FMediana_R: TCmDbField;
    FTercQua_R: TCmDbField;
    FPrimQua: TCmDbField;
    FIdPesqSalar: TCmDbField;
    FMenor: TCmDbField;
    FPrimQua_R: TCmDbField;
    FIdCargo: TCmDbField;
    FMedia_R: TCmDbField;
    FMedia: TCmDbField;
    FModa: TCmDbField;
    FModa_R: TCmDbField;
    FTercQua: TCmDbField;
    FMaior: TCmDbField;
    FMaior_R: TCmDbField;
    FMenor_R: TCmDbField;
    FIdEmpresaPartic: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPesqSalar: TCmDbField read FIdPesqSalar write FIdPesqSalar;
    property IdEmpresaPartic: TCmDbField read FIdEmpresaPartic write FIdEmpresaPartic;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Freq: TCmDbField read FFreq write FFreq;
    property PrimQua_R: TCmDbField read FPrimQua_R write FPrimQua_R;
    property PrimQua: TCmDbField read FPrimQua write FPrimQua;
    property TercQua_R: TCmDbField read FTercQua_R write FTercQua_R;
    property TercQua: TCmDbField read FTercQua write FTercQua;
    property Moda_R: TCmDbField read FModa_R write FModa_R;
    property Moda: TCmDbField read FModa write FModa;
    property Menor_R: TCmDbField read FMenor_R write FMenor_R;
    property Menor: TCmDbField read FMenor write FMenor;
    property Media_R: TCmDbField read FMedia_R write FMedia_R;
    property Mediana_R: TCmDbField read FMediana_R write FMediana_R;
    property Mediana: TCmDbField read FMediana write FMediana;
    property Media: TCmDbField read FMedia write FMedia;
    property Maior_R: TCmDbField read FMaior_R write FMaior_R;
    property Maior: TCmDbField read FMaior write FMaior;
  end;

implementation

{ TDbTendPesqSal }

constructor TDbTendPesqSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TENDPESQSAL';

  FIdPesqSalar := CreateCmDbField('IDPESQSALAR',ftFloat,true,true,false,true,'');
  FIdEmpresaPartic := CreateCmDbField('IDEMPRESAPARTIC',ftFloat,true,true,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FFreq := CreateCmDbField('FREQ',ftFloat,false,false,false,true,'');
  FPrimQua_R := CreateCmDbField('PRIMQUA_R',ftFloat,false,false,false,true,'');
  FPrimQua := CreateCmDbField('PRIMQUA',ftFloat,false,false,false,true,'');
  FTercQua_R := CreateCmDbField('TERCQUA_R',ftFloat,false,false,false,true,'');
  FTercQua := CreateCmDbField('TERCQUA',ftFloat,false,false,false,true,'');
  FModa_R := CreateCmDbField('MODA_R',ftFloat,false,false,false,true,'');
  FModa := CreateCmDbField('MODA',ftFloat,false,false,false,true,'');
  FMenor_R := CreateCmDbField('MENOR_R',ftFloat,false,false,false,true,'');
  FMenor := CreateCmDbField('MENOR',ftFloat,false,false,false,true,'');
  FMedia_R := CreateCmDbField('MEDIA_R',ftFloat,false,false,false,true,'');
  FMediana_R := CreateCmDbField('MEDIANA_R',ftFloat,false,false,false,true,'');
  FMediana := CreateCmDbField('MEDIANA',ftFloat,false,false,false,true,'');
  FMedia := CreateCmDbField('MEDIA',ftFloat,false,false,false,true,'');
  FMaior_R := CreateCmDbField('MAIOR_R',ftFloat,false,false,false,true,'');
  FMaior := CreateCmDbField('MAIOR',ftFloat,false,false,false,true,'');
end;

end.
