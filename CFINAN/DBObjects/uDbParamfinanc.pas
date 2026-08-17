{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamfinanc;
{-----------------------------------------------------------------------------------------
Data      : 27/08/2007
Autor     : Marcus Oliveira
Pendência : 25994
Descrição : Implementado 
{-----------------------------------------------------------------------------------------
Data      : 07/03/2007
Autor     : Fabio Fagundes
Código    : AL_2
Pendência : 24131
SOL       : 51290
Descrição : Implemetação do parâmetro PERIODDISPONIB  para trazer intervalo default de
            refresh da Disponibilidade Financeira.
-----------------------------------------------------------------------------------------
Data      : 13/11/2006
Autor     : Fabio Fagundes
Código    : AL_1
Pendência : 21865
SOL       :
Descrição : Implemetação do parâmetro FLGDISPDOCBX  para trazer somente documentos baixados
            na Disponibilidade Financeira
-----------------------------------------------------------------------------------------
  Data      : 21/02/2006
  Pendência : 21608
  Autor     : Antonio Marcos (amf)
  Descrição : Alteração do tipo do CMDBField para TDateTime. Antes estava TDate e provocava
              erro de conversão, caso a data não estivesse preenchida.
------------------------------------------------------------------------------------------
  Data      : 13/01/2006
  Pendência : 21198
  Autor     : André Tavares
  Descrição : Criação do parâmetro FLGALTDTBAIXA.
------------------------------------------------------------------------------------------
  Data      : 09/06/2005
  Pendência : 16669
  Autor     : Rodolpho da Silva
  Descrição : Implementado um novo campo, denominado DATAINIDISPFINANC
-----------------------------------------------------------------------------------------}

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbParamfinanc = class(TCmDbObject)

  private
    FFlgdesverm: TCmDbField;
    FFlgcalcimposto: TCmDbField;
    FDatabloqdispfinan: TCmDbField;
    FCodcormonet: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodvarcambial: TCmDbField;
    FFlgseparadata: TCmDbField;
    FFlgexibecolexp: TCmDbField;
    FFlgconfirmarecpag: TCmDbField;
    FFlgimpcheque: TCmDbField;
    FIntegracontab: TCmDbField;
    FCoddirjurere: TCmDbField;
    FCodempjurere: TCmDbField;
    FTrdfinalcap: TCmDbField;
    FTipoaplicacao: TCmDbField;
    FCodtipdocinvest: TCmDbField;
    FFlgorcadoprevisto: TCmDbField;
    FTrdfinalcar: TCmDbField;
    FTitsaldotransp: TCmDbField;
    FCodjuros: TCmDbField;
    FPlano: TCmDbField;
    FFlgatualflx: TCmDbField;
    FDiasbloqorclp: TCmDbField;
    FDiasbloqorcmp: TCmDbField;
    FSubcontanaoident: TCmDbField;
    FContalancnaoident: TCmDbField;
    FTitsaldoant: TCmDbField;
    FDiasbloqorccp: TCmDbField;
    FCcustolancnaoid: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgDispBloq : TCmDbField;
    FFlgIntDispFin : TCmDbField;
    //Catia p: 22510   - 02/06/2006   - anulada pela pendência 19904   -29/11/06
   // FFlgOrcxDtDisp : TCmDbField;

    FCodtipocustagreg :TCmDbField;

    //  Rodolpho da Silva - 25/02/2005
    FIdPrograma: TCmDbField;
    FCodCentroCusto: TCmDbField;

    //  Rodolpho da Silva - P: 18551 - 14/03/2005
    FExibeLancNaoIdent: TCmDbField;

    //  Rodolpho da Silva - P: 16669 - 09/06/2005
    FDataIniDispFinanc: TCmDbField;

    Fflgaltdtbaixa: TCmDbField;
    FFlgCtaTpRecDes: TCmDbField;
    FFlgCpmfValPos: TCmDbField;
    Fvalmintrasnfdia: TCmDbField; //andre tavares - 13/01/2006 - pendência 21198
    //AL_1
    FFlgDispDocBx : TCmDbField;
    //AL_2
    FPerioddisponib : TCmDbField;

     // catia - 19904 - 29/11/06
     FDataCurtoPrazo: TCmDbField;
     FDataMedioPrazo: TCmDbField;
     FDataLongoPrazo: TCmDbField;
     FTipoDesemb :    TCmDbField;
     FTipoReceb :     TCmDbField;
    FCODCRTRANF: TCmDbField;
{
    Ftransfcodtipdoc: TCmDbField;
    FTRANSFCRESPON: TCmDbField;
    FTransfidFloat: TCmDbField;
    FTransfFloat: TCmDbField;
    FTransfUnidNegoc: TCmDbField;
    FTrasfIDPatro: TCmDbField;
    FTransfIdProg: TCmDbField;
    FTransfPlano: TCmDbField;
    FTransfTipRecDes: TCmDbField;
    FTransfCCusto: TCmDbField;
    FTransfValMax: TCmDbField;
    FTransfIDPatro: TCmDbField;
}
     //
    procedure Setflgaltdtbaixa(const Value: TCmDbField);
    procedure SetFlgCtaTpRecDes(const Value: TCmDbField);
    procedure SetFlgCpmfValPos(const Value: TCmDbField);
    procedure Setvalmintrasnfdia(const Value: TCmDbField);
    procedure SetFlgDispDocBx(const Value: TCmDbField);
{
    procedure Settransfcodtipdoc(const Value: TCmDbField);
    procedure SetTRANSFCRESPON(const Value: TCmDbField);
    procedure SetTransfFloat(const Value: TCmDbField);
    procedure SetTransfUnidNegoc(const Value: TCmDbField);
    procedure SetTrasfIDPatro(const Value: TCmDbField);
    procedure SetTransfIdProg(const Value: TCmDbField);
    procedure SetTransfPlano(const Value: TCmDbField);
    procedure SetTransfTipRecDes(const Value: TCmDbField);
    procedure SetTransfCCusto(const Value: TCmDbField);
    procedure SetTransfValMax(const Value: TCmDbField);
    procedure SetTransfIDPatro(const Value: TCmDbField); //andre tavares - 13/01/2005 - pendência 21198
}

    //AL_2
    procedure SetPerioddisponib(const Value: TCmDbField);
    procedure SetCODCRTRANF(const Value: TCmDbField);

  public

     Property Trdfinalcar: TCmDbField read FTrdfinalcar write FTrdfinalcar;
     Property Trdfinalcap: TCmDbField read FTrdfinalcap write FTrdfinalcap;
     Property Titsaldotransp: TCmDbField read FTitsaldotransp write FTitsaldotransp;
     Property Titsaldoant: TCmDbField read FTitsaldoant write FTitsaldoant;
     Property Tipoaplicacao: TCmDbField read FTipoaplicacao write FTipoaplicacao;
     Property Subcontanaoident: TCmDbField read FSubcontanaoident write FSubcontanaoident;
     Property Plano: TCmDbField read FPlano write FPlano;
     Property Integracontab: TCmDbField read FIntegracontab write FIntegracontab;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Flgseparadata: TCmDbField read FFlgseparadata write FFlgseparadata;
     Property Flgorcadoprevisto: TCmDbField read FFlgorcadoprevisto write FFlgorcadoprevisto;
     Property Flgimpcheque: TCmDbField read FFlgimpcheque write FFlgimpcheque;
     Property Flgexibecolexp: TCmDbField read FFlgexibecolexp write FFlgexibecolexp;
     Property Flgdesverm: TCmDbField read FFlgdesverm write FFlgdesverm;
     Property Flgconfirmarecpag: TCmDbField read FFlgconfirmarecpag write FFlgconfirmarecpag;
     Property Flgcalcimposto: TCmDbField read FFlgcalcimposto write FFlgcalcimposto;
     Property Flgatualflx: TCmDbField read FFlgatualflx write FFlgatualflx;
     Property Diasbloqorcmp: TCmDbField read FDiasbloqorcmp write FDiasbloqorcmp;
     Property Diasbloqorclp: TCmDbField read FDiasbloqorclp write FDiasbloqorclp;
     Property Diasbloqorccp: TCmDbField read FDiasbloqorccp write FDiasbloqorccp;
     Property Databloqdispfinan: TCmDbField read FDatabloqdispfinan write FDatabloqdispfinan;
     Property Contalancnaoident: TCmDbField read FContalancnaoident write FContalancnaoident;
     Property Codvarcambial: TCmDbField read FCodvarcambial write FCodvarcambial;
     Property Codtipdocinvest: TCmDbField read FCodtipdocinvest write FCodtipdocinvest;
     Property Codjuros: TCmDbField read FCodjuros write FCodjuros;
     Property Codempjurere: TCmDbField read FCodempjurere write FCodempjurere;
     Property Coddirjurere: TCmDbField read FCoddirjurere write FCoddirjurere;
     Property Codcormonet: TCmDbField read FCodcormonet write FCodcormonet;
     Property Ccustolancnaoid: TCmDbField read FCcustolancnaoid write FCcustolancnaoid;
     Property FlgDispBloq: TCmDbField read FFlgDispBloq write FFlgDispBloq;
     Property FlgIntDispFin: TCmDbField read FFlgIntDispFin write FFlgIntDispFin;
     //Catia p: 22510   - 02/06/2006   - anulada pela pendência 19904   -29/11/06
     // Property FlgOrcxDtDisp: TCmDbField read FFlgOrcxDtDisp write FFlgOrcxDtDisp;
     //catia - 29/11/2006 - 19904
      Property DataCurtoPrazo: TCmDbField read FDataCurtoPrazo write FDataCurtoPrazo;
      Property DataMedioPrazo: TCmDbField read FDataMedioPrazo write FDataMedioPrazo;
      Property DataLongoPrazo: TCmDbField read FDataLongoPrazo write FDataLongoPrazo;
      Property Tiporeceb: TCmDbField read FTiporeceb write FTiporeceb;
     //  Rodolpho da Silva - 25/02/2005
     Property IdPrograma: TCmDbField read FIdPrograma write FIdPrograma;
     Property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
     //  Rodolpho da Silva - 25/02/2005

     //  Rodolpho da Silva - P: 18551 - 14/03/2005
     Property ExibeLancNaoIdent: TCmDbField read FExibeLancNaoIdent write FExibeLancNaoIdent;

     //  Rodolpho da Silva - P: 16669 - 09/06/2005
     Property DataIniDispFinanc: TCmDbField read FDataIniDispFinanc write FDataIniDispFinanc;
     //AL_1
     Property FlgDispDocBx: TCmDbField read FFlgDispDocBx write FFlgDispDocBx;
     //AL_2
     Property Perioddisponib : TCmDbField read FPerioddisponib write SetPerioddisponib;

     // Marchetti

     property Codtipocustagreg: TCmDbField read FCodtipocustagreg  write FCodtipocustagreg;
     // Fim Marchetti

     property flgaltdtbaixa: TCmDbField read Fflgaltdtbaixa write Setflgaltdtbaixa; //andre tavares - 13/01/2005 - pendência 21198

     property FlgCtaTpRecDes: TCmDbField read FFlgCtaTpRecDes write SetFlgCtaTpRecDes; //andre tavares - 07/04/2006 - pendência 21111

     property FlgCpmfValPos: TCmDbField read FFlgCpmfValPos write SetFlgCpmfValPos; //andre tavares - 19/09/2006 - pendência 22485
     property valmintrasnfdia: TCmDbField read Fvalmintrasnfdia write Setvalmintrasnfdia;

     //Marcus Oliveria P.25994 27/08/2007
     property CODCRTRANF : TCmDbField read FCODCRTRANF write SetCODCRTRANF;
     //mARCUS oLIVEIRA 02/02/2007
{
     property TRANSFCODTIPDOC : TCmDbField read Ftransfcodtipdoc write Settransfcodtipdoc;
     property TRANSFCRESPON : TCmDbField read FTRANSFCRESPON write SetTRANSFCRESPON;
     property TransfUnidNegoc : TCmDbField  read FTransfUnidNegoc write SetTransfUnidNegoc;
//     property TransfFloat : TCmDbField   read FTransfFloat write SetTransfFloat;
//    property TransfIDPatro : TCmDbField read FTransfIDPatro write SetTransfIDPatro;
     property TransfIdProg  : TCmDbField  read FTransfIdProg write SetTransfIdProg;
//     property TransfPlano :  TCmDbField read FTransfPlano write SetTransfPlano;
//     property TransfTipRecDes : TCmDbField  read FTransfTipRecDes write SetTransfTipRecDes;
     property TransfCCusto : TCmDbField read FTransfCCusto write SetTransfCCusto;
//     property TransfValMax : TCmDbField read FTransfValMax write SetTransfValMax;
}
     constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function PegaCampos : String;
  End;

implementation

{ TDbParamfinanc }

constructor TDbParamfinanc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMFINANC';

   fTrdfinalcar := CreateCmDbField('TRDFINALCAR',ftString,False,False,False,True,'');
   fTrdfinalcap := CreateCmDbField('TRDFINALCAP',ftString,False,False,False,True,'');
   fTitsaldotransp := CreateCmDbField('TITSALDOTRANSP',ftString,False,False,False,True,'');
   fTitsaldoant := CreateCmDbField('TITSALDOANT',ftString,False,False,False,True,'');
   fTipoaplicacao := CreateCmDbField('TIPOAPLICACAO',ftfloat,False,False,False,True,'');
   fSubcontanaoident := CreateCmDbField('SUBCONTANAOIDENT',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fIntegracontab := CreateCmDbField('INTEGRACONTAB',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgseparadata := CreateCmDbField('FLGSEPARADATA',ftString,False,False,False,True,'');
   fFlgorcadoprevisto := CreateCmDbField('FLGORCADOPREVISTO',ftString,False,False,False,True,'');
   fFlgimpcheque := CreateCmDbField('FLGIMPCHEQUE',ftString,False,False,False,True,'');
   fFlgexibecolexp := CreateCmDbField('FLGEXIBECOLEXP',ftString,False,False,False,True,'');
   fFlgdesverm := CreateCmDbField('FLGDESVERM',ftString,False,False,False,True,'');
   fFlgconfirmarecpag := CreateCmDbField('FLGCONFIRMARECPAG',ftString,False,False,False,True,'');
   fFlgcalcimposto := CreateCmDbField('FLGCALCIMPOSTO',ftString,False,False,False,True,'');
   fFlgatualflx := CreateCmDbField('FLGATUALFLX',ftString,False,False,False,True,'');
   fDiasbloqorcmp := CreateCmDbField('DIASBLOQORCMP',ftfloat,False,False,False,True,'');
   fDiasbloqorclp := CreateCmDbField('DIASBLOQORCLP',ftfloat,False,False,False,True,'');
   fDiasbloqorccp := CreateCmDbField('DIASBLOQORCCP',ftfloat,False,False,False,True,'');
   fDatabloqdispfinan := CreateCmDbField('DATABLOQDISPFINAN',ftDateTime,False,False,False,True,'');
   //catia - 29/11/06 - 19904
   fDatacurtoprazo := CreateCmDbField('DTCURTOPZ',ftDateTime,False,False,False,True,'');
   fDatamedioprazo := CreateCmDbField('DTMEDIOPZ',ftDateTime,False,False,False,True,'');
   fDatalongoprazo := CreateCmDbField('DTLONGOPZ',ftDateTime,False,False,False,True,'');
   fTipoReceb := CreateCmDbField('TIPORECEB',ftstring,False,False,False,True,'');
   fTipoDesemb:= CreateCmDbField('TIPODESEMB',ftstring,False,False,False,True,'');
   //
   fContalancnaoident := CreateCmDbField('CONTALANCNAOIDENT',ftString,False,False,False,True,'');
   fCodvarcambial := CreateCmDbField('CODVARCAMBIAL',ftfloat,False,False,False,True,'');
   fCodtipdocinvest := CreateCmDbField('CODTIPDOCINVEST',ftfloat,False,False,False,True,'');
   fCodjuros := CreateCmDbField('CODJUROS',ftfloat,False,False,False,True,'');
   fCodempjurere := CreateCmDbField('CODEMPJURERE',ftString,False,False,False,True,'');
   fCoddirjurere := CreateCmDbField('CODDIRJURERE',ftString,False,False,False,True,'');
   fCodcormonet := CreateCmDbField('CODCORMONET',ftfloat,False,False,False,True,'');
   fCcustolancnaoid := CreateCmDbField('CCUSTOLANCNAOID',ftString,False,False,False,True,'');
   flgDispBloq := CreateCmDbField('FLGDISPBLOQ',ftString,False,False,False,True,'');
   flgIntDispFin := CreateCmDbField('FLGINTDISPFIN',ftString,False,False,False,True,'');
   //Catia p: 22510   - 02/06/2006   - anulada pela pendência 19904   -29/11/06
   //FlgOrcxDtDisp := CreateCmDbField('FLGORCXDTDISP',ftString,False,False,False,True,'');
   FCodtipocustagreg :=CreateCmDbField('CODTIPOCUSTAGREG',ftFloat,False,False,False,True,'');

   //  Rodolpho da Silva - 25/02/2005
   FIdPrograma :=CreateCmDbField('IDPROGRAMA',ftFloat,False,False,False,True,'');
   FCodCentroCusto :=CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   //  Rodolpho da Silva - 25/02/2005

   //  Rodolpho da Silva - P: 18551 - 14/03/2005
   FExibeLancNaoIdent :=CreateCmDbField('EXIBELANCNAOIDENT',ftString,False,False,False,True,'');

   //  Rodolpho da Silva - P: 16669 - 09/06/2005
   //amf 21.02.2006 p:21553 FDataIniDispFinanc := CreateCmDbField('DATAINIDISPFINANC',ftDate,False,False,False,False,'');

   //amf 21.02.2006 p:21553
   FDataIniDispFinanc := CreateCmDbField('DATAINIDISPFINANC',ftDateTime,False,False,False,False,'');

   //andre tavares - 13/01/2005 - pendência 21198
   Fflgaltdtbaixa := CreateCmDbField('FLGALTDTBAIXA',ftString,False,False,False,True,'');

   //andre tavares - 13/01/2005 - pendência 21111
   FlgCtaTpRecDes := CreateCmDbField('FLGCTATPRECDES',ftString,False,False,False,True,'');

   FFlgCpmfValPos := CreateCmDbField('FLGCPMFVALPOS',ftString,False,False,False,True,'');
   Fvalmintrasnfdia := CreateCmDbField('VALMINTRASNFDIA',ftFloat,False,False,False,True,'');
   //AL_1
   FlgDispDocBx := CreateCmDbField('FLGDISPDOCBX',ftString,False,False,False,True,'');
//AL_2
   FPerioddisponib := CreateCmDbField('PERIODDISPONIB',ftString,False,False,False,True,'');

   //Marcus Oliveria P.25994 27/08/2007
   FCODCRTRANF := CreateCmDbField('CODCRTRANF',ftString,False,False,False,True,'');

   //Marcus Oliveira 02/02/2007 Inicio
   {
   Ftransfcodtipdoc := CreateCmDbField('TRANSFCODTIPDOC',ftFloat,False,False,False,True,'');
   Transfcrespon    := CreateCmDbField('TRANSFCRESPON',ftString,False,False,False,True,'');
   TransfUnidNegoc  := CreateCmDbField('TRANSFUNIDNEGOC',ftFloat,False,False,False,True,'');
//   TransfFloat      := CreateCmDbField('TRANSFFLOAT',ftFloat,False,False,False,True,'');
//   TransfIDPatro    := CreateCmDbField('TRANSFIDPATRO',ftFloat,False,False,False,True,'');
   TransfIdProg     := CreateCmDbField('TRANSFIDPROG',ftFloat,False,False,False,True,'');
//   TransfPlano      := CreateCmDbField('TRANSFPLANO',ftFloat,False,False,False,True,'');
//   TransfTipRecDes  := CreateCmDbField('TRANSFTIPRECDES',ftString,False,False,False,True,'');
   TransfCCusto     := CreateCmDbField('TRANSFCCUSTO',ftString,False,False,False,True,'');
//   TransfValMax     := CreateCmDbField('TRANSFVALMAX',ftFloat,False,False,False,True,'');
   }
end;

function TDbParamfinanc.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbParamfinanc.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

function TDbParamfinanc.PegaCampos: String;
begin
  Result := GetFieldsForSelect;

end;

procedure TDbParamfinanc.Setflgaltdtbaixa(const Value: TCmDbField); //andre tavares - 13/01/2005 - pendência 21198
begin
  Fflgaltdtbaixa := Value;
end;

procedure TDbParamfinanc.SetFlgCpmfValPos(const Value: TCmDbField);
begin
  FFlgCpmfValPos := Value;
end;

procedure TDbParamfinanc.SetFlgCtaTpRecDes(const Value: TCmDbField);
begin
  FFlgCtaTpRecDes := Value;
end;

procedure TDbParamfinanc.SetFlgDispDocBx(const Value: TCmDbField);
begin
  FFlgDispDocBx := Value;
end;
{
procedure TDbParamfinanc.SetTransfCCusto(const Value: TCmDbField);
begin
  FTransfCCusto := Value;
end;

procedure TDbParamfinanc.Settransfcodtipdoc(const Value: TCmDbField);
begin
  Ftransfcodtipdoc := Value;
end;

procedure TDbParamfinanc.SetTRANSFCRESPON(const Value: TCmDbField);
begin
  FTRANSFCRESPON := Value;
end;

procedure TDbParamfinanc.SetTransfFloat(const Value: TCmDbField);
begin
  FTransfFloat := Value;
end;


procedure TDbParamfinanc.SetTransfIDPatro(const Value: TCmDbField);
begin
  FTransfIDPatro := Value;
end;

procedure TDbParamfinanc.SetTransfIdProg(const Value: TCmDbField);
begin
  FTransfIdProg := Value;
end;

procedure TDbParamfinanc.SetTransfPlano(const Value: TCmDbField);
begin
  FTransfPlano := Value;
end;

procedure TDbParamfinanc.SetTransfTipRecDes(const Value: TCmDbField);
begin
  FTransfTipRecDes := Value;
end;

procedure TDbParamfinanc.SetTransfUnidNegoc(const Value: TCmDbField);
begin
  FTransfUnidNegoc := Value;
end;

procedure TDbParamfinanc.SetTransfValMax(const Value: TCmDbField);
begin
  FTransfValMax := Value;
end;

procedure TDbParamfinanc.SetTrasfIDPatro(const Value: TCmDbField);
begin
  FTrasfIDPatro := Value;
end;
}
procedure TDbParamfinanc.Setvalmintrasnfdia(const Value: TCmDbField);
begin
  Fvalmintrasnfdia := Value;
end;

//AL_2
procedure TDbParamfinanc.SetPerioddisponib(const Value: TCmDbField);
begin
  FPerioddisponib := Value;
end;


procedure TDbParamfinanc.SetCODCRTRANF(const Value: TCmDbField);
begin
  FCODCRTRANF := Value;
end;

end.



