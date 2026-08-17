{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbLancOperDiaImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancOperDiaImob = class(TCmDbObject)

  private
    FCodtipimovel: TCmDbField;
    FVlrdia: TCmDbField;
    FIdoperacao: TCmDbField;
    FCoddocumento: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FVlracum: TCmDbField;
    FDataoper: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdlancoperdiaimob: TCmDbField;
    FIdForCli: TCmDbField;
    FDataBaixa: TCmDbField;
    FIDParcFinancImov: TCmDbField;
    FIDCONDPAGIMOVEL: TCmDbField;
    FFlgTipo: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FIdPatro: TCmDbField;

    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetDataoper(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdlancoperdiaimob(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperacao(const Value: TCmDbField);
    procedure SetVlracum(const Value: TCmDbField);
    procedure SetVlrdia(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetDataBaixa(const Value: TCmDbField);
    procedure SetIDParcFinancImov(const Value: TCmDbField);
    procedure SetIDCONDPAGIMOVEL(const Value: TCmDbField);
    procedure SetFlgTipo(const Value: TCmDbField);
    procedure SetIdPatro(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);

  public

     property Vlrdia             : TCmDbField read FVlrdia              write SetVlrdia;
     property Vlracum            : TCmDbField read FVlracum             write SetVlracum;
     property Idoperacao         : TCmDbField read FIdoperacao          write SetIdoperacao;
     property Idmodulo           : TCmDbField read FIdmodulo            write SetIdmodulo;
     property Idlancoperdiaimob  : TCmDbField read FIdlancoperdiaimob   write SetIdlancoperdiaimob;
     property Idcontratoimovel   : TCmDbField read FIdcontratoimovel    write SetIdcontratoimovel;
     property IdForCli           : TCmDbField read FIdForCli            write SetIdForCli;
     property Dataoper           : TCmDbField read FDataoper            write SetDataoper;
     property DataBaixa          : TCmDbField read FDataBaixa           write SetDataBaixa;
     property Codtipimovel       : TCmDbField read FCodtipimovel        write SetCodtipimovel;
     property Coddocumento       : TCmDbField read FCoddocumento        write SetCoddocumento;
     property IDCondPagImovel    : TCmDbField read FIDCONDPAGIMOVEL     write SetIDCONDPAGIMOVEL;
     property FlgTipo            : TCmDbField read FFlgTipo             write SetFlgTipo;

     // André Pontes - 21/07/2005
     property IDParcFinancImov   : TCmDbField read FIDParcFinancImov    write SetIDParcFinancImov;
     // FIM André Pontes - 21/07/2005

     //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
     property IdPatro            : TCmDbField read FIdPatro write SetIdPatro;
     property IdPlanoPrev        : TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert :Boolean; override;
  end;

implementation

{ TDbLancOperDiaImob }

constructor TDbLancOperDiaImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCOPERDIAIMOB';

   fVlrdia              := CreateCmDbField('VLRDIA',              ftfloat,    False, False, False, True,  '');
   fVlracum             := CreateCmDbField('VLRACUM',             ftfloat,    False, False, False, False, '');
   fIdoperacao          := CreateCmDbField('IDOPERACAO',          ftfloat,    False, False, False, True,  '');
   fIdmodulo            := CreateCmDbField('IDMODULO',            ftfloat,    True,  False, False, True, '');
   fIdlancoperdiaimob   := CreateCmDbField('IDLANCOPERDIAIMOB',   ftfloat,    True,  True,  False, True, '');
   fIdcontratoimovel    := CreateCmDbField('IDCONTRATOIMOVEL',    ftfloat,    False, False, False, True, '');
   fIdForCli            := CreateCmDbField('IDFORCLI',            ftfloat,    False, False, False, True, '');
   fDataoper            := CreateCmDbField('DATAOPER',            ftDateTime, False, False, False, True, '');
   fDataBaixa           := CreateCmDbField('DATABAIXA',           ftDateTime, False, False, False, True, '');
   fCodtipimovel        := CreateCmDbField('CODTIPIMOVEL',        ftString,   False, False, False, True, '');
   fCoddocumento        := CreateCmDbField('CODDOCUMENTO',        ftfloat,    False, False, False, True, '');
   FIDParcFinancImov    := CreateCmDbField('IDPARCFINANCIMOV',    ftfloat,    False, False, False, True, '');
   FIDCondPagImovel     := CreateCmDbField('IDCONDPAGIMOVEL',     ftfloat,    False, False, False, True, '');
   fFlgTipo             := CreateCmDbField('FLGTIPO',             ftString,   False, False, False, True, '');
   //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
   fIdPatro             := CreateCmDbField('IDPATRO',             ftFloat,   False, False, False, True, '');
   fIdPlanoPrev         := CreateCmDbField('IDPLANOPREV',         ftFloat,   False, False, False, True, '');
   //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
end;

function TDbLancOperDiaImob.Insert: Boolean;
begin

   fIdlancoperdiaimob.AsFloat := GetSequence('LANCOPERDIAIMOB');
   Result := Inherited Insert;

end;


procedure TDbLancOperDiaImob.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbLancOperDiaImob.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbLancOperDiaImob.SetDataBaixa(const Value: TCmDbField);
begin
  FDataBaixa := Value;
end;

procedure TDbLancOperDiaImob.SetDataoper(const Value: TCmDbField);
begin
  FDataoper := Value;
end;

procedure TDbLancOperDiaImob.SetFlgTipo(const Value: TCmDbField);
begin
  FFlgTipo := Value;
end;

procedure TDbLancOperDiaImob.SetIDCONDPAGIMOVEL(const Value: TCmDbField);
begin
  FIDCONDPAGIMOVEL := Value;
end;

procedure TDbLancOperDiaImob.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbLancOperDiaImob.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbLancOperDiaImob.SetIdlancoperdiaimob(const Value: TCmDbField);
begin
  FIdlancoperdiaimob := Value;
end;

procedure TDbLancOperDiaImob.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLancOperDiaImob.SetIdoperacao(const Value: TCmDbField);
begin
  FIdoperacao := Value;
end;

procedure TDbLancOperDiaImob.SetIDParcFinancImov(const Value: TCmDbField);
begin
  FIDParcFinancImov := Value;
end;

procedure TDbLancOperDiaImob.SetIdPatro(const Value: TCmDbField);
begin
  FIdPatro := Value;
end;

procedure TDbLancOperDiaImob.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev := Value;
end;

procedure TDbLancOperDiaImob.SetVlracum(const Value: TCmDbField);
begin
  FVlracum := Value;
end;

procedure TDbLancOperDiaImob.SetVlrdia(const Value: TCmDbField);
begin
  FVlrdia := Value;
end;

end.



