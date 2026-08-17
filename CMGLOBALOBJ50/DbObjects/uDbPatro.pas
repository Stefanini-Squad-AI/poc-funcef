{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 04/09/2003                             }
{                                                       }
{*******************************************************}

unit uDbPatro;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbPatro = class(TCmDbObject)

   private
      FFlgeditaop1: TCmDbField;
      FFlgalteradados: TCmDbField;
      FIdregracalcop1: TCmDbField;
      FFlgeditaop6: TCmDbField;
      FMescobranca13: TCmDbField;
      FDiafolha: TCmDbField;
      FIdfundacao: TCmDbField;
      FNomevalorbase5: TCmDbField;
      FIdregracalcop3: TCmDbField;
      FNuminsinterf: TCmDbField;
      FCodmoeda: TCmDbField;
      FNumopcoes: TCmDbField;
      FFormaenvio: TCmDbField;
      FIdregracalcop6: TCmDbField;
      FFlgaceitanaoid: TCmDbField;
      FCodcentrorespon: TCmDbField;
      FUnidnegoc: TCmDbField;
      FIdrubsalauxdoenca: TCmDbField;
      FFormabaixa: TCmDbField;
      FIdregracalcop4: TCmDbField;
      FFlgeditaop4: TCmDbField;
      FIdrubdecterc: TCmDbField;
      FFlgmesfolha: TCmDbField;
      FIdregravalidaop2: TCmDbField;
      FIdregracalcbasei: TCmDbField;
      FIdregravalidaop3: TCmDbField;
      FIdregraremtotal: TCmDbField;
      FFlganteriorfolha: TCmDbField;
      FFlginfextrato: TCmDbField;
      FIdempresaprop: TCmDbField;
      FFlgobrigaop4: TCmDbField;
      FMesfechaemptmo: TCmDbField;
      FAnofechaemptmo: TCmDbField;
      FNomevalorbase1: TCmDbField;
      FFlgobrigaop5: TCmDbField;
      FCodsubconta: TCmDbField;
      FIdrubsalparticip: TCmDbField;
      FFlgobrigaop6: TCmDbField;
      FFlgpagamento: TCmDbField;
      FNomevalorbase2: TCmDbField;
      FNomevalorbase3: TCmDbField;
      FFlgrubatmant: TCmDbField;
      FFlgobrigaop1: TCmDbField;
      FMascmatricula: TCmDbField;
      FIdpessoa: TCmDbField;
      FFlgeditaop2: TCmDbField;
      FIdregracalcsalpa: TCmDbField;
      FFlgobrigaop2: TCmDbField;
      FFlgeditaop3: TCmDbField;
      FNomevalorbase4: TCmDbField;
      FIdregracalcop2: TCmDbField;
      FNomevalorbase6: TCmDbField;
      FIdrgsalario13: TCmDbField;
      FFlgplanosindiv: TCmDbField;
      FFlgobrigaop3: TCmDbField;
      FTippatro: TCmDbField;
      FCodigo: TCmDbField;
      FIdrubsalbeneficio: TCmDbField;
      FIdregravalidaop4: TCmDbField;
      FCodexterno: TCmDbField;
      FIdregracalcop5: TCmDbField;
      FPercmaxdesc: TCmDbField;
      FIdrubsalmanut: TCmDbField;
      FAnofechapatroep: TCmDbField;
      FFlgeditaop5: TCmDbField;
      FIdregramatricula: TCmDbField;
      FIdregravalidaop1: TCmDbField;
      FAnofechafolhaep: TCmDbField;
      FIdregrasalbenefi: TCmDbField;
      FIdrubremtotal: TCmDbField;
      FIdrubsalbaseinss: TCmDbField;
      FMesfechafolhaep: TCmDbField;
      FIdregravalidaop6: TCmDbField;
      FTipcodigo: TCmDbField;
      FIdregravalidaop5: TCmDbField;
      FCodportforma: TCmDbField;
      FNumupdinterf: TCmDbField;
      FFlgutilfolha: TCmDbField;
      FIdrubsalmanutparc: TCmDbField;
      FCodorcamento: TCmDbField;
      FMesfechapatroep: TCmDbField;
      FFlgano13: TCmDbField;
      FSiglaorcamento: TCmDbField;
      FCodspc: TCmDbField;

      procedure SetAnofechaemptmo(const Value: TCmDbField);
      procedure SetAnofechafolhaep(const Value: TCmDbField);
      procedure SetAnofechapatroep(const Value: TCmDbField);
      procedure SetCodcentrorespon(const Value: TCmDbField);
      procedure SetCodexterno(const Value: TCmDbField);
      procedure SetCodigo(const Value: TCmDbField);
      procedure SetCodmoeda(const Value: TCmDbField);
      procedure SetCodorcamento(const Value: TCmDbField);
      procedure SetCodportforma(const Value: TCmDbField);
      procedure SetCodsubconta(const Value: TCmDbField);
      procedure SetDiafolha(const Value: TCmDbField);
      procedure SetFlgaceitanaoid(const Value: TCmDbField);
      procedure SetFlgalteradados(const Value: TCmDbField);
      procedure SetFlgano13(const Value: TCmDbField);
      procedure SetFlganteriorfolha(const Value: TCmDbField);
      procedure SetFlgeditaop1(const Value: TCmDbField);
      procedure SetFlgeditaop2(const Value: TCmDbField);
      procedure SetFlgeditaop3(const Value: TCmDbField);
      procedure SetFlgeditaop4(const Value: TCmDbField);
      procedure SetFlgeditaop5(const Value: TCmDbField);
      procedure SetFlgeditaop6(const Value: TCmDbField);
      procedure SetFlginfextrato(const Value: TCmDbField);
      procedure SetFlgmesfolha(const Value: TCmDbField);
      procedure SetFlgobrigaop1(const Value: TCmDbField);
      procedure SetFlgobrigaop2(const Value: TCmDbField);
      procedure SetFlgobrigaop3(const Value: TCmDbField);
      procedure SetFlgobrigaop4(const Value: TCmDbField);
      procedure SetFlgobrigaop5(const Value: TCmDbField);
      procedure SetFlgobrigaop6(const Value: TCmDbField);
      procedure SetFlgpagamento(const Value: TCmDbField);
      procedure SetFlgplanosindiv(const Value: TCmDbField);
      procedure SetFlgrubatmant(const Value: TCmDbField);
      procedure SetFlgutilfolha(const Value: TCmDbField);
      procedure SetFormabaixa(const Value: TCmDbField);
      procedure SetFormaenvio(const Value: TCmDbField);
      procedure SetIdempresaprop(const Value: TCmDbField);
      procedure SetIdfundacao(const Value: TCmDbField);
      procedure SetIdpessoa(const Value: TCmDbField);
      procedure SetIdregracalcbasei(const Value: TCmDbField);
      procedure SetIdregracalcop1(const Value: TCmDbField);
      procedure SetIdregracalcop2(const Value: TCmDbField);
      procedure SetIdregracalcop3(const Value: TCmDbField);
      procedure SetIdregracalcop4(const Value: TCmDbField);
      procedure SetIdregracalcop5(const Value: TCmDbField);
      procedure SetIdregracalcop6(const Value: TCmDbField);
      procedure SetIdregracalcsalpa(const Value: TCmDbField);
      procedure SetIdregramatricula(const Value: TCmDbField);
      procedure SetIdregraremtotal(const Value: TCmDbField);
      procedure SetIdregrasalbenefi(const Value: TCmDbField);
      procedure SetIdregravalidaop1(const Value: TCmDbField);
      procedure SetIdregravalidaop2(const Value: TCmDbField);
      procedure SetIdregravalidaop3(const Value: TCmDbField);
      procedure SetIdregravalidaop4(const Value: TCmDbField);
      procedure SetIdregravalidaop5(const Value: TCmDbField);
      procedure SetIdregravalidaop6(const Value: TCmDbField);
      procedure SetIdrgsalario13(const Value: TCmDbField);
      procedure SetIdrubdecterc(const Value: TCmDbField);
      procedure SetIdrubremtotal(const Value: TCmDbField);
      procedure SetIdrubsalauxdoenca(const Value: TCmDbField);
      procedure SetIdrubsalbaseinss(const Value: TCmDbField);
      procedure SetIdrubsalbeneficio(const Value: TCmDbField);
      procedure SetIdrubsalmanut(const Value: TCmDbField);
      procedure SetIdrubsalmanutparc(const Value: TCmDbField);
      procedure SetIdrubsalparticip(const Value: TCmDbField);
      procedure SetMascmatricula(const Value: TCmDbField);
      procedure SetMescobranca13(const Value: TCmDbField);
      procedure SetMesfechaemptmo(const Value: TCmDbField);
      procedure SetMesfechafolhaep(const Value: TCmDbField);
      procedure SetMesfechapatroep(const Value: TCmDbField);
      procedure SetNomevalorbase1(const Value: TCmDbField);
      procedure SetNomevalorbase2(const Value: TCmDbField);
      procedure SetNomevalorbase3(const Value: TCmDbField);
      procedure SetNomevalorbase4(const Value: TCmDbField);
      procedure SetNomevalorbase5(const Value: TCmDbField);
      procedure SetNomevalorbase6(const Value: TCmDbField);
      procedure SetNuminsinterf(const Value: TCmDbField);
      procedure SetNumopcoes(const Value: TCmDbField);
      procedure SetNumupdinterf(const Value: TCmDbField);
      procedure SetPercmaxdesc(const Value: TCmDbField);
      procedure SetTipcodigo(const Value: TCmDbField);
      procedure SetTippatro(const Value: TCmDbField);
      procedure SetUnidnegoc(const Value: TCmDbField);
      procedure SetCodspc(const Value: TCmDbField);
      procedure SetSiglaorcamento(const Value: TCmDbField);

   public
      property Numopcoes            : TCmDbField   read FNumopcoes            write SetNumopcoes;
      property Nomevalorbase6       : TCmDbField   read FNomevalorbase6       write SetNomevalorbase6;
      property Nomevalorbase5       : TCmDbField   read FNomevalorbase5       write SetNomevalorbase5;
      property Nomevalorbase4       : TCmDbField   read FNomevalorbase4       write SetNomevalorbase4;
      property Nomevalorbase3       : TCmDbField   read FNomevalorbase3       write SetNomevalorbase3;
      property Nomevalorbase2       : TCmDbField   read FNomevalorbase2       write SetNomevalorbase2;
      property Nomevalorbase1       : TCmDbField   read FNomevalorbase1       write SetNomevalorbase1;
      property Mesfechapatroep      : TCmDbField   read FMesfechapatroep      write SetMesfechapatroep;
      property Mesfechafolhaep      : TCmDbField   read FMesfechafolhaep      write SetMesfechafolhaep;
      property Mesfechaemptmo       : TCmDbField   read FMesfechaemptmo       write SetMesfechaemptmo;
      property Mascmatricula        : TCmDbField   read FMascmatricula        write SetMascmatricula;
      property Idrubsalparticip     : TCmDbField   read FIdrubsalparticip     write SetIdrubsalparticip;
      property Idrubsalmanutparc    : TCmDbField   read FIdrubsalmanutparc    write SetIdrubsalmanutparc;
      property Idrubsalmanut        : TCmDbField   read FIdrubsalmanut        write SetIdrubsalmanut;
      property Idrubsalbeneficio    : TCmDbField   read FIdrubsalbeneficio    write SetIdrubsalbeneficio;
      property Idrubsalauxdoenca    : TCmDbField   read FIdrubsalauxdoenca    write SetIdrubsalauxdoenca;
      property Idrubremtotal        : TCmDbField   read FIdrubremtotal        write SetIdrubremtotal;
      property Idregravalidaop6     : TCmDbField   read FIdregravalidaop6     write SetIdregravalidaop6;
      property Idregravalidaop5     : TCmDbField   read FIdregravalidaop5     write SetIdregravalidaop5;
      property Idregravalidaop4     : TCmDbField   read FIdregravalidaop4     write SetIdregravalidaop4;
      property Idregravalidaop3     : TCmDbField   read FIdregravalidaop3     write SetIdregravalidaop3;
      property Idregravalidaop2     : TCmDbField   read FIdregravalidaop2     write SetIdregravalidaop2;
      property Idregravalidaop1     : TCmDbField   read FIdregravalidaop1     write SetIdregravalidaop1;
      property Idregrasalbenefi     : TCmDbField   read FIdregrasalbenefi     write SetIdregrasalbenefi;
      property Idregraremtotal      : TCmDbField   read FIdregraremtotal      write SetIdregraremtotal;
      property Idregramatricula     : TCmDbField   read FIdregramatricula     write SetIdregramatricula;
      property Idregracalcsalpa     : TCmDbField   read FIdregracalcsalpa     write SetIdregracalcsalpa;
      property Idregracalcop6       : TCmDbField   read FIdregracalcop6       write SetIdregracalcop6;
      property Idregracalcop5       : TCmDbField   read FIdregracalcop5       write SetIdregracalcop5;
      property Idregracalcop4       : TCmDbField   read FIdregracalcop4       write SetIdregracalcop4;
      property Idregracalcop3       : TCmDbField   read FIdregracalcop3       write SetIdregracalcop3;
      property Idregracalcop2       : TCmDbField   read FIdregracalcop2       write SetIdregracalcop2;
      property Idregracalcop1       : TCmDbField   read FIdregracalcop1       write SetIdregracalcop1;
      property Idpessoa             : TCmDbField   read FIdpessoa             write SetIdpessoa;
      property Idfundacao           : TCmDbField   read FIdfundacao           write SetIdfundacao;
      property Flgrubatmant         : TCmDbField   read FFlgrubatmant         write SetFlgrubatmant;
      property Flgobrigaop6         : TCmDbField   read FFlgobrigaop6         write SetFlgobrigaop6;
      property Flgobrigaop5         : TCmDbField   read FFlgobrigaop5         write SetFlgobrigaop5;
      property Flgobrigaop4         : TCmDbField   read FFlgobrigaop4         write SetFlgobrigaop4;
      property Flgobrigaop3         : TCmDbField   read FFlgobrigaop3         write SetFlgobrigaop3;
      property Flgobrigaop2         : TCmDbField   read FFlgobrigaop2         write SetFlgobrigaop2;
      property Flgobrigaop1         : TCmDbField   read FFlgobrigaop1         write SetFlgobrigaop1;
      property Flgeditaop6          : TCmDbField   read FFlgeditaop6          write SetFlgeditaop6;
      property Flgeditaop5          : TCmDbField   read FFlgeditaop5          write SetFlgeditaop5;
      property Flgeditaop4          : TCmDbField   read FFlgeditaop4          write SetFlgeditaop4;
      property Flgeditaop3          : TCmDbField   read FFlgeditaop3          write SetFlgeditaop3;
      property Flgeditaop2          : TCmDbField   read FFlgeditaop2          write SetFlgeditaop2;
      property Flgeditaop1          : TCmDbField   read FFlgeditaop1          write SetFlgeditaop1;
      property Flgano13             : TCmDbField   read FFlgano13             write SetFlgano13;
      property Flgalteradados       : TCmDbField   read FFlgalteradados       write SetFlgalteradados;
      property Flgaceitanaoid       : TCmDbField   read FFlgaceitanaoid       write SetFlgaceitanaoid;
      property Codsubconta          : TCmDbField   read FCodsubconta          write SetCodsubconta;
      property Codorcamento         : TCmDbField   read FCodorcamento         write SetCodorcamento;
      property Siglaorcamento       : TCmDbField   read FSiglaorcamento       write SetSiglaorcamento;
      property Codspc               : TCmDbField   read FCodspc               write SetCodspc;
      property Anofechapatroep      : TCmDbField   read FAnofechapatroep      write SetAnofechapatroep;
      property Anofechafolhaep      : TCmDbField   read FAnofechafolhaep      write SetAnofechafolhaep;
      property Anofechaemptmo       : TCmDbField   read FAnofechaemptmo       write SetAnofechaemptmo;

      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert: Boolean; override;
   end;



implementation
{ TDbPatro }



constructor TDbPatro.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PATRO';

   fNumopcoes           := CreateCmDbField('NUMOPCOES',           ftfloat,  False,  False,   False,   True,    '');
   fNomevalorbase6      := CreateCmDbField('NOMEVALORBASE6',      ftString, False,  False,   False,   True,    '');
   fNomevalorbase5      := CreateCmDbField('NOMEVALORBASE5',      ftString, False,  False,   False,   True,    '');
   fNomevalorbase4      := CreateCmDbField('NOMEVALORBASE4',      ftString, False,  False,   False,   True,    '');
   fNomevalorbase3      := CreateCmDbField('NOMEVALORBASE3',      ftString, False,  False,   False,   True,    '');
   fNomevalorbase2      := CreateCmDbField('NOMEVALORBASE2',      ftString, False,  False,   False,   True,    '');
   fNomevalorbase1      := CreateCmDbField('NOMEVALORBASE1',      ftString, False,  False,   False,   True,    '');
   fMesfechapatroep     := CreateCmDbField('MESFECHAPATROEP',     ftfloat,  False,  False,   False,   True,    '');
   fMesfechafolhaep     := CreateCmDbField('MESFECHAFOLHAEP',     ftfloat,  False,  False,   False,   True,    '');
   fMesfechaemptmo      := CreateCmDbField('MESFECHAEMPTMO',      ftfloat,  False,  False,   False,   True,    '');
   fMascmatricula       := CreateCmDbField('MASCMATRICULA',       ftString, False,  False,   False,   True,    '');
   fIdrubsalparticip    := CreateCmDbField('IDRUBSALPARTICIP',    ftfloat,  False,  False,   False,   True,    '');
   fIdrubsalmanutparc   := CreateCmDbField('IDRUBSALMANUTPARC',   ftfloat,  False,  False,   False,   True,    '');
   fIdrubsalmanut       := CreateCmDbField('IDRUBSALMANUT',       ftfloat,  False,  False,   False,   True,    '');
   fIdrubsalbeneficio   := CreateCmDbField('IDRUBSALBENEFICIO',   ftfloat,  False,  False,   False,   True,    '');
   fIdrubsalauxdoenca   := CreateCmDbField('IDRUBSALAUXDOENCA',   ftfloat,  False,  False,   False,   True,    '');
   fIdrubremtotal       := CreateCmDbField('IDRUBREMTOTAL',       ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop6    := CreateCmDbField('IDREGRAVALIDAOP6',    ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop5    := CreateCmDbField('IDREGRAVALIDAOP5',    ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop4    := CreateCmDbField('IDREGRAVALIDAOP4',    ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop3    := CreateCmDbField('IDREGRAVALIDAOP3',    ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop2    := CreateCmDbField('IDREGRAVALIDAOP2',    ftfloat,  False,  False,   False,   True,    '');
   fIdregravalidaop1    := CreateCmDbField('IDREGRAVALIDAOP1',    ftfloat,  False,  False,   False,   True,    '');
   fIdregrasalbenefi    := CreateCmDbField('IDREGRASALBENEFI',    ftfloat,  False,  False,   False,   True,    '');
   fIdregraremtotal     := CreateCmDbField('IDREGRAREMTOTAL',     ftfloat,  False,  False,   False,   True,    '');
   fIdregramatricula    := CreateCmDbField('IDREGRAMATRICULA',    ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcsalpa    := CreateCmDbField('IDREGRACALCSALPA',    ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop6      := CreateCmDbField('IDREGRACALCOP6',      ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop5      := CreateCmDbField('IDREGRACALCOP5',      ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop4      := CreateCmDbField('IDREGRACALCOP4',      ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop3      := CreateCmDbField('IDREGRACALCOP3',      ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop2      := CreateCmDbField('IDREGRACALCOP2',      ftfloat,  False,  False,   False,   True,    '');
   fIdregracalcop1      := CreateCmDbField('IDREGRACALCOP1',      ftfloat,  False,  False,   False,   True,    '');
   fIdpessoa            := CreateCmDbField('IDPESSOA',            ftfloat,  True,   True,    False,   True,    '');
   fIdfundacao          := CreateCmDbField('IDFUNDACAO',          ftfloat,  False,  False,   False,   True,    '');
   fFlgrubatmant        := CreateCmDbField( 'FLGRUBATMANT',       ftfloat,  True,   False,   False,   False,   '');
   fFlgobrigaop6        := CreateCmDbField('FLGOBRIGAOP6',        ftfloat,  False,  False,   False,   True,    '');
   fFlgobrigaop5        := CreateCmDbField('FLGOBRIGAOP5',        ftfloat,  False,  False,   False,   True,    '');
   fFlgobrigaop4        := CreateCmDbField('FLGOBRIGAOP4',        ftfloat,  False,  False,   False,   True,    '');
   fFlgobrigaop3        := CreateCmDbField('FLGOBRIGAOP3',        ftfloat,  False,  False,   False,   True,    '');
   fFlgobrigaop2        := CreateCmDbField('FLGOBRIGAOP2',        ftfloat,  False,  False,   False,   True,    '');
   fFlgobrigaop1        := CreateCmDbField('FLGOBRIGAOP1',        ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop6         := CreateCmDbField('FLGEDITAOP6',         ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop5         := CreateCmDbField('FLGEDITAOP5',         ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop4         := CreateCmDbField('FLGEDITAOP4',         ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop3         := CreateCmDbField('FLGEDITAOP3',         ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop2         := CreateCmDbField('FLGEDITAOP2',         ftfloat,  False,  False,   False,   True,    '');
   fFlgeditaop1         := CreateCmDbField('FLGEDITAOP1',         ftfloat,  False,  False,   False,   True,    '');
   fFlgano13            := CreateCmDbField('FLGANO13',            ftString, False,  False,   False,   True,    '');
   fFlgalteradados      := CreateCmDbField('FLGALTERADADOS',      ftfloat,  False,  False,   False,   True,    '');
   fFlgaceitanaoid      := CreateCmDbField('FLGACEITANAOID',      ftfloat,  False,  False,   False,   True,    '');
   fCodsubconta         := CreateCmDbField('CODSUBCONTA',         ftfloat,  False,  False,   False,   True,    '');
   fCodorcamento        := CreateCmDbField('CODORCAMENTO',        ftString, False,  False,   False,   True,    '');
   FSiglaorcamento      := CreateCmDbField('SIGLAORCAMENTO',      ftString, False,  False,   False,   True,    'Sigla SPC');
   FCodspc              := CreateCmDbField('CODSPC',              ftString, False,  False,   False,   True,    'Cód. SPC');
   fAnofechapatroep     := CreateCmDbField('ANOFECHAPATROEP',     ftfloat,  False,  False,   False,   True,    '');
   fAnofechafolhaep     := CreateCmDbField('ANOFECHAFOLHAEP',     ftfloat,  False,  False,   False,   True,    '');
   fAnofechaemptmo      := CreateCmDbField('ANOFECHAEMPTMO',      ftfloat,  False,  False,   False,   True,    '');
end;

function TDbPatro.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbPatro.SetAnofechaemptmo(const Value: TCmDbField);
begin
  FAnofechaemptmo := Value;
end;

procedure TDbPatro.SetAnofechafolhaep(const Value: TCmDbField);
begin
  FAnofechafolhaep := Value;
end;

procedure TDbPatro.SetAnofechapatroep(const Value: TCmDbField);
begin
  FAnofechapatroep := Value;
end;

procedure TDbPatro.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbPatro.SetCodexterno(const Value: TCmDbField);
begin
  FCodexterno := Value;
end;

procedure TDbPatro.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbPatro.SetCodmoeda(const Value: TCmDbField);
begin
  FCodmoeda := Value;
end;

procedure TDbPatro.SetCodorcamento(const Value: TCmDbField);
begin
  FCodorcamento := Value;
end;

procedure TDbPatro.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbPatro.SetCodspc(const Value: TCmDbField);
begin
  FCodspc := Value;
end;

procedure TDbPatro.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPatro.SetDiafolha(const Value: TCmDbField);
begin
  FDiafolha := Value;
end;

procedure TDbPatro.SetFlgaceitanaoid(const Value: TCmDbField);
begin
  FFlgaceitanaoid := Value;
end;

procedure TDbPatro.SetFlgalteradados(const Value: TCmDbField);
begin
  FFlgalteradados := Value;
end;

procedure TDbPatro.SetFlgano13(const Value: TCmDbField);
begin
  FFlgano13 := Value;
end;

procedure TDbPatro.SetFlganteriorfolha(const Value: TCmDbField);
begin
  FFlganteriorfolha := Value;
end;

procedure TDbPatro.SetFlgeditaop1(const Value: TCmDbField);
begin
  FFlgeditaop1 := Value;
end;

procedure TDbPatro.SetFlgeditaop2(const Value: TCmDbField);
begin
  FFlgeditaop2 := Value;
end;

procedure TDbPatro.SetFlgeditaop3(const Value: TCmDbField);
begin
  FFlgeditaop3 := Value;
end;

procedure TDbPatro.SetFlgeditaop4(const Value: TCmDbField);
begin
  FFlgeditaop4 := Value;
end;

procedure TDbPatro.SetFlgeditaop5(const Value: TCmDbField);
begin
  FFlgeditaop5 := Value;
end;

procedure TDbPatro.SetFlgeditaop6(const Value: TCmDbField);
begin
  FFlgeditaop6 := Value;
end;

procedure TDbPatro.SetFlginfextrato(const Value: TCmDbField);
begin
  FFlginfextrato := Value;
end;

procedure TDbPatro.SetFlgmesfolha(const Value: TCmDbField);
begin
  FFlgmesfolha := Value;
end;

procedure TDbPatro.SetFlgobrigaop1(const Value: TCmDbField);
begin
  FFlgobrigaop1 := Value;
end;

procedure TDbPatro.SetFlgobrigaop2(const Value: TCmDbField);
begin
  FFlgobrigaop2 := Value;
end;

procedure TDbPatro.SetFlgobrigaop3(const Value: TCmDbField);
begin
  FFlgobrigaop3 := Value;
end;

procedure TDbPatro.SetFlgobrigaop4(const Value: TCmDbField);
begin
  FFlgobrigaop4 := Value;
end;

procedure TDbPatro.SetFlgobrigaop5(const Value: TCmDbField);
begin
  FFlgobrigaop5 := Value;
end;

procedure TDbPatro.SetFlgobrigaop6(const Value: TCmDbField);
begin
  FFlgobrigaop6 := Value;
end;

procedure TDbPatro.SetFlgpagamento(const Value: TCmDbField);
begin
  FFlgpagamento := Value;
end;

procedure TDbPatro.SetFlgplanosindiv(const Value: TCmDbField);
begin
  FFlgplanosindiv := Value;
end;

procedure TDbPatro.SetFlgrubatmant(const Value: TCmDbField);
begin
  FFlgrubatmant := Value;
end;

procedure TDbPatro.SetFlgutilfolha(const Value: TCmDbField);
begin
  FFlgutilfolha := Value;
end;

procedure TDbPatro.SetFormabaixa(const Value: TCmDbField);
begin
  FFormabaixa := Value;
end;

procedure TDbPatro.SetFormaenvio(const Value: TCmDbField);
begin
  FFormaenvio := Value;
end;

procedure TDbPatro.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbPatro.SetIdfundacao(const Value: TCmDbField);
begin
  FIdfundacao := Value;
end;

procedure TDbPatro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPatro.SetIdregracalcbasei(const Value: TCmDbField);
begin
  FIdregracalcbasei := Value;
end;

procedure TDbPatro.SetIdregracalcop1(const Value: TCmDbField);
begin
  FIdregracalcop1 := Value;
end;

procedure TDbPatro.SetIdregracalcop2(const Value: TCmDbField);
begin
  FIdregracalcop2 := Value;
end;

procedure TDbPatro.SetIdregracalcop3(const Value: TCmDbField);
begin
  FIdregracalcop3 := Value;
end;

procedure TDbPatro.SetIdregracalcop4(const Value: TCmDbField);
begin
  FIdregracalcop4 := Value;
end;

procedure TDbPatro.SetIdregracalcop5(const Value: TCmDbField);
begin
  FIdregracalcop5 := Value;
end;

procedure TDbPatro.SetIdregracalcop6(const Value: TCmDbField);
begin
  FIdregracalcop6 := Value;
end;

procedure TDbPatro.SetIdregracalcsalpa(const Value: TCmDbField);
begin
  FIdregracalcsalpa := Value;
end;

procedure TDbPatro.SetIdregramatricula(const Value: TCmDbField);
begin
  FIdregramatricula := Value;
end;

procedure TDbPatro.SetIdregraremtotal(const Value: TCmDbField);
begin
  FIdregraremtotal := Value;
end;

procedure TDbPatro.SetIdregrasalbenefi(const Value: TCmDbField);
begin
  FIdregrasalbenefi := Value;
end;

procedure TDbPatro.SetIdregravalidaop1(const Value: TCmDbField);
begin
  FIdregravalidaop1 := Value;
end;

procedure TDbPatro.SetIdregravalidaop2(const Value: TCmDbField);
begin
  FIdregravalidaop2 := Value;
end;

procedure TDbPatro.SetIdregravalidaop3(const Value: TCmDbField);
begin
  FIdregravalidaop3 := Value;
end;

procedure TDbPatro.SetIdregravalidaop4(const Value: TCmDbField);
begin
  FIdregravalidaop4 := Value;
end;

procedure TDbPatro.SetIdregravalidaop5(const Value: TCmDbField);
begin
  FIdregravalidaop5 := Value;
end;

procedure TDbPatro.SetIdregravalidaop6(const Value: TCmDbField);
begin
  FIdregravalidaop6 := Value;
end;

procedure TDbPatro.SetIdrgsalario13(const Value: TCmDbField);
begin
  FIdrgsalario13 := Value;
end;

procedure TDbPatro.SetIdrubdecterc(const Value: TCmDbField);
begin
  FIdrubdecterc := Value;
end;

procedure TDbPatro.SetIdrubremtotal(const Value: TCmDbField);
begin
  FIdrubremtotal := Value;
end;

procedure TDbPatro.SetIdrubsalauxdoenca(const Value: TCmDbField);
begin
  FIdrubsalauxdoenca := Value;
end;

procedure TDbPatro.SetIdrubsalbaseinss(const Value: TCmDbField);
begin
  FIdrubsalbaseinss := Value;
end;

procedure TDbPatro.SetIdrubsalbeneficio(const Value: TCmDbField);
begin
  FIdrubsalbeneficio := Value;
end;

procedure TDbPatro.SetIdrubsalmanut(const Value: TCmDbField);
begin
  FIdrubsalmanut := Value;
end;

procedure TDbPatro.SetIdrubsalmanutparc(const Value: TCmDbField);
begin
  FIdrubsalmanutparc := Value;
end;

procedure TDbPatro.SetIdrubsalparticip(const Value: TCmDbField);
begin
  FIdrubsalparticip := Value;
end;

procedure TDbPatro.SetMascmatricula(const Value: TCmDbField);
begin
  FMascmatricula := Value;
end;

procedure TDbPatro.SetMescobranca13(const Value: TCmDbField);
begin
  FMescobranca13 := Value;
end;

procedure TDbPatro.SetMesfechaemptmo(const Value: TCmDbField);
begin
  FMesfechaemptmo := Value;
end;

procedure TDbPatro.SetMesfechafolhaep(const Value: TCmDbField);
begin
  FMesfechafolhaep := Value;
end;

procedure TDbPatro.SetMesfechapatroep(const Value: TCmDbField);
begin
  FMesfechapatroep := Value;
end;

procedure TDbPatro.SetNomevalorbase1(const Value: TCmDbField);
begin
  FNomevalorbase1 := Value;
end;

procedure TDbPatro.SetNomevalorbase2(const Value: TCmDbField);
begin
  FNomevalorbase2 := Value;
end;

procedure TDbPatro.SetNomevalorbase3(const Value: TCmDbField);
begin
  FNomevalorbase3 := Value;
end;

procedure TDbPatro.SetNomevalorbase4(const Value: TCmDbField);
begin
  FNomevalorbase4 := Value;
end;

procedure TDbPatro.SetNomevalorbase5(const Value: TCmDbField);
begin
  FNomevalorbase5 := Value;
end;

procedure TDbPatro.SetNomevalorbase6(const Value: TCmDbField);
begin
  FNomevalorbase6 := Value;
end;

procedure TDbPatro.SetNuminsinterf(const Value: TCmDbField);
begin
  FNuminsinterf := Value;
end;

procedure TDbPatro.SetNumopcoes(const Value: TCmDbField);
begin
  FNumopcoes := Value;
end;

procedure TDbPatro.SetNumupdinterf(const Value: TCmDbField);
begin
  FNumupdinterf := Value;
end;

procedure TDbPatro.SetPercmaxdesc(const Value: TCmDbField);
begin
  FPercmaxdesc := Value;
end;

procedure TDbPatro.SetSiglaorcamento(const Value: TCmDbField);
begin
  FSiglaorcamento := Value;
end;

procedure TDbPatro.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbPatro.SetTippatro(const Value: TCmDbField);
begin
  FTippatro := Value;
end;

procedure TDbPatro.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



