{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/07/2006                             }
{                                                       }
{*******************************************************}

unit uDbReservapart;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbReservapart = class(TCmDbObject)

  private
     FValorreserva: TCmDbField;
     FUnidnegoc: TCmDbField;
     FTrguserinclusao: TCmDbField;
     FTrgdtinclusao: TCmDbField;
     FSeqproposta: TCmDbField;
     FPlncodigoprev: TCmDbField;
     FPlncodigoefet: TCmDbField;
     FPlano: TCmDbField;
     FPlacontad: TCmDbField;
     FPlacontac: TCmDbField;
     FPercentualsaque: TCmDbField;
     FIdtiporeserva: TCmDbField;
     FIdplanoprev: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdpessjur: TCmDbField;
     FIdparticipante: TCmDbField;
     FIdempresaprop: TCmDbField;
     FIdempresa: TCmDbField;
     FFlginconsistencia: TCmDbField;
     FFlgativo: TCmDbField;
     FDataultatualiza: TCmDbField;
     FDataultalim: TCmDbField;
     FDatareferenciasa: TCmDbField;
     FDatadesativ: TCmDbField;
     FCodsubconta: TCmDbField;
     FCodportforma: TCmDbField;
     FCoddocumentoprev: TCmDbField;
     FCoddocumentoefet: TCmDbField;
     FCodcentrorespon: TCmDbField;
     FCodcentrocustod: TCmDbField;
     FCodcentrocustoc: TCmDbField;

     Procedure SetValorreserva(const Value: TCmDbField);
     Procedure SetUnidnegoc(const Value: TCmDbField);
     Procedure SetTrguserinclusao(const Value: TCmDbField);
     Procedure SetTrgdtinclusao(const Value: TCmDbField);
     Procedure SetSeqproposta(const Value: TCmDbField);
     Procedure SetPlncodigoprev(const Value: TCmDbField);
     Procedure SetPlncodigoefet(const Value: TCmDbField);
     Procedure SetPlano(const Value: TCmDbField);
     Procedure SetPlacontad(const Value: TCmDbField);
     Procedure SetPlacontac(const Value: TCmDbField);
     Procedure SetPercentualsaque(const Value: TCmDbField);
     Procedure SetIdtiporeserva(const Value: TCmDbField);
     Procedure SetIdplanoprev(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdpessjur(const Value: TCmDbField);
     Procedure SetIdparticipante(const Value: TCmDbField);
     Procedure SetIdempresaprop(const Value: TCmDbField);
     Procedure SetIdempresa(const Value: TCmDbField);
     Procedure SetFlginconsistencia(const Value: TCmDbField);
     Procedure SetFlgativo(const Value: TCmDbField);
     Procedure SetDataultatualiza(const Value: TCmDbField);
     Procedure SetDataultalim(const Value: TCmDbField);
     Procedure SetDatareferenciasa(const Value: TCmDbField);
     Procedure SetDatadesativ(const Value: TCmDbField);
     Procedure SetCodsubconta(const Value: TCmDbField);
     Procedure SetCodportforma(const Value: TCmDbField);
     Procedure SetCoddocumentoprev(const Value: TCmDbField);
     Procedure SetCoddocumentoefet(const Value: TCmDbField);
     Procedure SetCodcentrorespon(const Value: TCmDbField);
     Procedure SetCodcentrocustod(const Value: TCmDbField);
     Procedure SetCodcentrocustoc(const Value: TCmDbField);
  public

     Property Valorreserva: TCmDbField      Read FValorreserva      Write SetValorreserva;
     Property Unidnegoc: TCmDbField         Read FUnidnegoc         Write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField   Read FTrguserinclusao   Write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField     Read FTrgdtinclusao     Write SetTrgdtinclusao;
     Property Seqproposta: TCmDbField       Read FSeqproposta       Write SetSeqproposta;
     Property Plncodigoprev: TCmDbField     Read FPlncodigoprev     Write SetPlncodigoprev;
     Property Plncodigoefet: TCmDbField     Read FPlncodigoefet     Write SetPlncodigoefet;
     Property Plano: TCmDbField             Read FPlano             Write SetPlano;
     Property Placontad: TCmDbField         Read FPlacontad         Write SetPlacontad;
     Property Placontac: TCmDbField         Read FPlacontac         Write SetPlacontac;
     Property Percentualsaque: TCmDbField   Read FPercentualsaque   Write SetPercentualsaque;
     Property Idtiporeserva: TCmDbField     Read FIdtiporeserva     Write SetIdtiporeserva;
     Property Idplanoprev: TCmDbField       Read FIdplanoprev       Write SetIdplanoprev;
     Property Idpessoa: TCmDbField          Read FIdpessoa          Write SetIdpessoa;
     Property Idpessjur: TCmDbField         Read FIdpessjur         Write SetIdpessjur;
     Property Idparticipante: TCmDbField    Read FIdparticipante    Write SetIdparticipante;
     Property Idempresaprop: TCmDbField     Read FIdempresaprop     Write SetIdempresaprop;
     Property Idempresa: TCmDbField         Read FIdempresa         Write SetIdempresa;
     Property Flginconsistencia: TCmDbField Read FFlginconsistencia Write SetFlginconsistencia;
     Property Flgativo: TCmDbField          Read FFlgativo          Write SetFlgativo;
     Property Dataultatualiza: TCmDbField   Read FDataultatualiza   Write SetDataultatualiza;
     Property Dataultalim: TCmDbField       Read FDataultalim       Write SetDataultalim;
     Property Datareferenciasa: TCmDbField  Read FDatareferenciasa  Write SetDatareferenciasa;
     Property Datadesativ: TCmDbField       Read FDatadesativ       Write SetDatadesativ;
     Property Codsubconta: TCmDbField       Read FCodsubconta       Write SetCodsubconta;
     Property Codportforma: TCmDbField      Read FCodportforma      Write SetCodportforma;
     Property Coddocumentoprev: TCmDbField  Read FCoddocumentoprev  Write SetCoddocumentoprev;
     Property Coddocumentoefet: TCmDbField  Read FCoddocumentoefet  Write SetCoddocumentoefet;
     Property Codcentrorespon: TCmDbField   Read FCodcentrorespon   Write SetCodcentrorespon;
     Property Codcentrocustod: TCmDbField   Read FCodcentrocustod   Write SetCodcentrocustod;
     Property Codcentrocustoc: TCmDbField   Read FCodcentrocustoc   Write SetCodcentrocustoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbReservapart }

constructor TDbReservapart.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESERVAPART';

   fValorreserva := CreateCmDbField('VALORRESERVA',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fPlncodigoprev := CreateCmDbField('PLNCODIGOPREV',ftfloat,False,False,False,True,'');
   fPlncodigoefet := CreateCmDbField('PLNCODIGOEFET',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fPercentualsaque := CreateCmDbField('PERCENTUALSAQUE',ftfloat,False,False,False,True,'');
   fIdtiporeserva := CreateCmDbField('IDTIPORESERVA',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdparticipante := CreateCmDbField('IDPARTICIPANTE',ftfloat,True,True,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlginconsistencia := CreateCmDbField('FLGINCONSISTENCIA',ftfloat,False,False,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,False,False,False,True,'');
   fDataultatualiza := CreateCmDbField('DATAULTATUALIZA',ftDateTime,False,False,False,True,'');
   fDataultalim := CreateCmDbField('DATAULTALIM',ftDateTime,False,False,False,True,'');
   fDatareferenciasa := CreateCmDbField('DATAREFERENCIASA',ftDateTime,False,False,False,True,'');
   fDatadesativ := CreateCmDbField('DATADESATIV',ftDateTime,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCoddocumentoprev := CreateCmDbField('CODDOCUMENTOPREV',ftfloat,False,False,False,True,'');
   fCoddocumentoefet := CreateCmDbField('CODDOCUMENTOEFET',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
end;

function TDbReservapart.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

Procedure TDbReservapart.SetValorreserva(const Value: TCmDbField);
Begin
   FValorreserva := Value;
End;


Procedure TDbReservapart.SetUnidnegoc(const Value: TCmDbField);
Begin
   FUnidnegoc := Value; 
End;

Procedure TDbReservapart.SetTrguserinclusao(const Value: TCmDbField);
Begin
   FTrguserinclusao := Value; 
End;


Procedure TDbReservapart.SetTrgdtinclusao(const Value: TCmDbField);
Begin
   FTrgdtinclusao := Value; 
End;


Procedure TDbReservapart.SetSeqproposta(const Value: TCmDbField);
Begin
   FSeqproposta := Value; 
End;


Procedure TDbReservapart.SetPlncodigoprev(const Value: TCmDbField);
Begin
   FPlncodigoprev := Value; 
End;


Procedure TDbReservapart.SetPlncodigoefet(const Value: TCmDbField);
Begin
   FPlncodigoefet := Value; 
End;


Procedure TDbReservapart.SetPlano(const Value: TCmDbField);
Begin
   FPlano := Value; 
End;


Procedure TDbReservapart.SetPlacontad(const Value: TCmDbField);
Begin
   FPlacontad := Value;
End;


Procedure TDbReservapart.SetPlacontac(const Value: TCmDbField);
Begin
   FPlacontac := Value;
End;

Procedure TDbReservapart.SetPercentualsaque(const Value: TCmDbField);
Begin
   FPercentualsaque := Value;
End;

Procedure TDbReservapart.SetIdtiporeserva(const Value: TCmDbField);
Begin
   FIdtiporeserva := Value; 
End;

Procedure TDbReservapart.SetIdplanoprev(const Value: TCmDbField);
Begin
   FIdplanoprev := Value; 
End;

Procedure TDbReservapart.SetIdpessoa(const Value: TCmDbField);
Begin
   FIdpessoa := Value;
End;

Procedure TDbReservapart.SetIdpessjur(const Value: TCmDbField);
Begin
   FIdpessjur := Value;
End;

Procedure TDbReservapart.SetIdparticipante(const Value: TCmDbField);
Begin
   FIdparticipante := Value;
End;


Procedure TDbReservapart.SetIdempresaprop(const Value: TCmDbField);
Begin
   FIdempresaprop := Value; 
End;


Procedure TDbReservapart.SetIdempresa(const Value: TCmDbField);
Begin
   FIdempresa := Value; 
End;


Procedure TDbReservapart.SetFlginconsistencia(const Value: TCmDbField);
Begin
   FFlginconsistencia := Value; 
End;


Procedure TDbReservapart.SetFlgativo(const Value: TCmDbField);
Begin
   FFlgativo := Value; 
End;


Procedure TDbReservapart.SetDataultatualiza(const Value: TCmDbField);
Begin
   FDataultatualiza := Value;
End;


Procedure TDbReservapart.SetDataultalim(const Value: TCmDbField);
Begin
   FDataultalim := Value;
End;


Procedure TDbReservapart.SetDatareferenciasa(const Value: TCmDbField);
Begin
   FDatareferenciasa := Value;
End;


Procedure TDbReservapart.SetDatadesativ(const Value: TCmDbField);
Begin
   FDatadesativ := Value;
End;

Procedure TDbReservapart.SetCodsubconta(const Value: TCmDbField);
Begin
   FCodsubconta := Value;
End;

Procedure TDbReservapart.SetCodportforma(const Value: TCmDbField);
Begin
   FCodportforma := Value;
End;

Procedure TDbReservapart.SetCoddocumentoprev(const Value: TCmDbField);
Begin
   FCoddocumentoprev := Value;
End;

Procedure TDbReservapart.SetCoddocumentoefet(const Value: TCmDbField);
Begin
   FCoddocumentoefet := Value;
End;

Procedure TDbReservapart.SetCodcentrorespon(const Value: TCmDbField);
Begin
   FCodcentrorespon := Value;
End;

Procedure TDbReservapart.SetCodcentrocustod(const Value: TCmDbField);
Begin
   FCodcentrocustod := Value;
End;

Procedure TDbReservapart.SetCodcentrocustoc(const Value: TCmDbField);  
Begin
   FCodcentrocustoc := Value; 
End;


end.



