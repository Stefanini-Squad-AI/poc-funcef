{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBReservaPart;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBReservaPart = class(TCmDbObject)

  private
    FCodsubconta: TCmDbField;
    FIdparticipante: TCmDbField;
    FSeqproposta: TCmDbField;
    FDataultatualiza: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FPercentualsaque: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdempresa: TCmDbField;
    FValorreserva: TCmDbField;
    FPlncodigoefet: TCmDbField;
    FUnidnegoc: TCmDbField;
    FFlginconsistencia: TCmDbField;
    FPlncodigoprev: TCmDbField;
    FIdempresaprop: TCmDbField;
    FPlacontac: TCmDbField;
    FFlgativo: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlacontad: TCmDbField;
    FDatadesativ: TCmDbField;
    FPlano: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FDataultalim: TCmDbField;
    FCodportforma: TCmDbField;
    FCoddocumentoefet: TCmDbField;
    FDatareferenciasa: TCmDbField;
    FCoddocumentoprev: TCmDbField;
    FIdtiporeserva: TCmDbField;
    FIdpessjur: TCmDbField;
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCoddocumentoefet(const Value: TCmDbField);
    procedure SetCoddocumentoprev(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetDatadesativ(const Value: TCmDbField);
    procedure SetDatareferenciasa(const Value: TCmDbField);
    procedure SetDataultalim(const Value: TCmDbField);
    procedure SetDataultatualiza(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlginconsistencia(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdparticipante(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdtiporeserva(const Value: TCmDbField);
    procedure SetPercentualsaque(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigoefet(const Value: TCmDbField);
    procedure SetPlncodigoprev(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValorreserva(const Value: TCmDbField);

  public

     Property Valorreserva      : TCmDbField read FValorreserva      write SetValorreserva;
     Property Unidnegoc         : TCmDbField read FUnidnegoc         write SetUnidnegoc;
     Property Seqproposta       : TCmDbField read FSeqproposta       write SetSeqproposta;
     Property Plncodigoprev     : TCmDbField read FPlncodigoprev     write SetPlncodigoprev;
     Property Plncodigoefet     : TCmDbField read FPlncodigoefet     write SetPlncodigoefet;
     Property Plano             : TCmDbField read FPlano             write SetPlano;
     Property Placontad         : TCmDbField read FPlacontad         write SetPlacontad;
     Property Placontac         : TCmDbField read FPlacontac         write SetPlacontac;
     Property Percentualsaque   : TCmDbField read FPercentualsaque   write SetPercentualsaque;
     Property Idtiporeserva     : TCmDbField read FIdtiporeserva     write SetIdtiporeserva;
     Property Idplanoprev       : TCmDbField read FIdplanoprev       write SetIdplanoprev;
     Property Idpessoa          : TCmDbField read FIdpessoa          write SetIdpessoa;
     Property Idpessjur         : TCmDbField read FIdpessjur         write SetIdpessjur;
     Property Idparticipante    : TCmDbField read FIdparticipante    write SetIdparticipante;
     Property Idempresaprop     : TCmDbField read FIdempresaprop     write SetIdempresaprop;
     Property Idempresa         : TCmDbField read FIdempresa         write SetIdempresa;
     Property Flginconsistencia : TCmDbField read FFlginconsistencia write SetFlginconsistencia;
     Property Flgativo          : TCmDbField read FFlgativo          write SetFlgativo;
     Property Dataultatualiza   : TCmDbField read FDataultatualiza   write SetDataultatualiza;
     Property Dataultalim       : TCmDbField read FDataultalim       write SetDataultalim;
     Property Datareferenciasa  : TCmDbField read FDatareferenciasa  write SetDatareferenciasa;
     Property Datadesativ       : TCmDbField read FDatadesativ       write SetDatadesativ;
     Property Codsubconta       : TCmDbField read FCodsubconta       write SetCodsubconta;
     Property Codportforma      : TCmDbField read FCodportforma      write SetCodportforma;
     Property Coddocumentoprev  : TCmDbField read FCoddocumentoprev  write SetCoddocumentoprev;
     Property Coddocumentoefet  : TCmDbField read FCoddocumentoefet  write SetCoddocumentoefet;
     Property Codcentrorespon   : TCmDbField read FCodcentrorespon   write SetCodcentrorespon;
     Property Codcentrocustod   : TCmDbField read FCodcentrocustod   write SetCodcentrocustod;
     Property Codcentrocustoc   : TCmDbField read FCodcentrocustoc   write SetCodcentrocustoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReservaPart }

constructor TDBReservaPart.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESERVAPART';

   fValorreserva      := CreateCmDbField('VALORRESERVA'     ,ftfloat   ,False,False,False,True,'');
   fUnidnegoc         := CreateCmDbField('UNIDNEGOC'        ,ftfloat   ,False,False,False,True,'');
   fSeqproposta       := CreateCmDbField('SEQPROPOSTA'      ,ftfloat   ,True,True,False,True,'');
   fPlncodigoprev     := CreateCmDbField('PLNCODIGOPREV'    ,ftfloat   ,False,False,False,True,'');
   fPlncodigoefet     := CreateCmDbField('PLNCODIGOEFET'    ,ftfloat   ,False,False,False,True,'');
   fPlano             := CreateCmDbField('PLANO'            ,ftfloat   ,False,False,False,True,'');
   fPlacontad         := CreateCmDbField('PLACONTAD'        ,ftString  ,False,False,False,True,'');
   fPlacontac         := CreateCmDbField('PLACONTAC'        ,ftString  ,False,False,False,True,'');
   fPercentualsaque   := CreateCmDbField('PERCENTUALSAQUE'  ,ftfloat   ,False,False,False,True,'');
   fIdtiporeserva     := CreateCmDbField('IDTIPORESERVA'    ,ftfloat   ,True,True,False,True,'');
   fIdplanoprev       := CreateCmDbField('IDPLANOPREV'      ,ftfloat   ,True,True,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA'         ,ftfloat   ,True,True,False,True,'');
   fIdpessjur         := CreateCmDbField('IDPESSJUR'        ,ftfloat   ,True,True,False,True,'');
   fIdparticipante    := CreateCmDbField('IDPARTICIPANTE'   ,ftfloat   ,True,True,False,True,'');
   fIdempresaprop     := CreateCmDbField('IDEMPRESAPROP'    ,ftfloat   ,False,False,False,True,'');
   fIdempresa         := CreateCmDbField('IDEMPRESA'        ,ftfloat   ,False,False,False,True,'');
   fFlginconsistencia := CreateCmDbField('FLGINCONSISTENCIA',ftfloat   ,False,False,False,True,'');
   fFlgativo          := CreateCmDbField('FLGATIVO'         ,ftfloat   ,False,False,False,True,'');
   fDataultatualiza   := CreateCmDbField('DATAULTATUALIZA'  ,ftDateTime,False,False,False,True,'');
   fDataultalim       := CreateCmDbField('DATAULTALIM'      ,ftDateTime,False,False,False,True,'');
   fDatareferenciasa  := CreateCmDbField('DATAREFERENCIASA' ,ftDateTime,False,False,False,True,'');
   fDatadesativ       := CreateCmDbField('DATADESATIV'      ,ftDateTime,False,False,False,True,'');
   fCodsubconta       := CreateCmDbField('CODSUBCONTA'      ,ftfloat   ,False,False,False,True,'');
   fCodportforma      := CreateCmDbField('CODPORTFORMA'     ,ftfloat   ,False,False,False,True,'');
   fCoddocumentoprev  := CreateCmDbField('CODDOCUMENTOPREV' ,ftfloat   ,False,False,False,True,'');
   fCoddocumentoefet  := CreateCmDbField('CODDOCUMENTOEFET' ,ftfloat   ,False,False,False,True,'');
   fCodcentrorespon   := CreateCmDbField('CODCENTRORESPON'  ,ftString  ,False,False,False,True,'');
   fCodcentrocustod   := CreateCmDbField('CODCENTROCUSTOD'  ,ftString  ,False,False,False,True,'');
   fCodcentrocustoc   := CreateCmDbField('CODCENTROCUSTOC'  ,ftString  ,False,False,False,True,'');
end;

function TDBReservaPart.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDBReservaPart.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDBReservaPart.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDBReservaPart.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDBReservaPart.SetCoddocumentoefet(const Value: TCmDbField);
begin
  FCoddocumentoefet := Value;
end;

procedure TDBReservaPart.SetCoddocumentoprev(const Value: TCmDbField);
begin
  FCoddocumentoprev := Value;
end;

procedure TDBReservaPart.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDBReservaPart.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDBReservaPart.SetDatadesativ(const Value: TCmDbField);
begin
  FDatadesativ := Value;
end;

procedure TDBReservaPart.SetDatareferenciasa(const Value: TCmDbField);
begin
  FDatareferenciasa := Value;
end;

procedure TDBReservaPart.SetDataultalim(const Value: TCmDbField);
begin
  FDataultalim := Value;
end;

procedure TDBReservaPart.SetDataultatualiza(const Value: TCmDbField);
begin
  FDataultatualiza := Value;
end;

procedure TDBReservaPart.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDBReservaPart.SetFlginconsistencia(const Value: TCmDbField);
begin
  FFlginconsistencia := Value;
end;

procedure TDBReservaPart.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBReservaPart.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDBReservaPart.SetIdparticipante(const Value: TCmDbField);
begin
  FIdparticipante := Value;
end;

procedure TDBReservaPart.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBReservaPart.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBReservaPart.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBReservaPart.SetIdtiporeserva(const Value: TCmDbField);
begin
  FIdtiporeserva := Value;
end;

procedure TDBReservaPart.SetPercentualsaque(const Value: TCmDbField);
begin
  FPercentualsaque := Value;
end;

procedure TDBReservaPart.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDBReservaPart.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDBReservaPart.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDBReservaPart.SetPlncodigoefet(const Value: TCmDbField);
begin
  FPlncodigoefet := Value;
end;

procedure TDBReservaPart.SetPlncodigoprev(const Value: TCmDbField);
begin
  FPlncodigoprev := Value;
end;

procedure TDBReservaPart.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBReservaPart.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDBReservaPart.SetValorreserva(const Value: TCmDbField);
begin
  FValorreserva := Value;
end;

end.



