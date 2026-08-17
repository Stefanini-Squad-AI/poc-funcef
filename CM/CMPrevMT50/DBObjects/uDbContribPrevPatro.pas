{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbContribPrevPatro;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContribprevpatro = class(TCmDbObject)

  private
     fValorbase3        : TCmDbField;
     fValorbase2        : TCmDbField;
     fValorbase1        : TCmDbField;
     fUnidnegoc13       : TCmDbField;
     fUnidnegoc         : TCmDbField;
     fUltmespreparo     : TCmDbField;
     fTrguserinclusao   : TCmDbField;
     fTrgdtinclusao     : TCmDbField;
     fTipcodigo13       : TCmDbField;
     fTipcodigo         : TCmDbField;
     fRecpag13          : TCmDbField;
     fRecpag            : TCmDbField;
     fQtdeparcelas      : TCmDbField;
     fPlano13           : TCmDbField;
     fPlano             : TCmDbField;
     fPlacontaoutromes  : TCmDbField;
     fPlacontad13       : TCmDbField;
     fPlacontadevol     : TCmDbField;
     fPlacontadbanco13  : TCmDbField;
     fPlacontadbanco    : TCmDbField;
     fPlacontad         : TCmDbField;
     fPlacontac13       : TCmDbField;
     fPlacontac         : TCmDbField;
     fIdtpperiodicidade : TCmDbField;
     fIdplanprevcontab  : TCmDbField;
     fIdplanoprev       : TCmDbField;
     fIdpessoa          : TCmDbField;
     fIdempresa13       : TCmDbField;
     fIdempresaprop13   : TCmDbField;
     fIdempresaprop     : TCmDbField;
     fIdempresa         : TCmDbField;
     fIdcontribuicao    : TCmDbField;
     fFlgcobra          : TCmDbField;
     fDiavencimento     : TCmDbField;
     fDatainicio        : TCmDbField;
     fDatafinal         : TCmDbField;
     fCodtiprecdes13    : TCmDbField;
     fCodtiprecdes      : TCmDbField;
     fCodtipdoc13       : TCmDbField;
     fCodtipdoc         : TCmDbField;
     fCodsubconta13     : TCmDbField;
     fCodsubconta       : TCmDbField;
     fCodportforma13    : TCmDbField;
     fCodportforma      : TCmDbField;
     fCodcentrorespon13 : TCmDbField;
     fCodcentrorespon   : TCmDbField;
     fCodcentrocustod13 : TCmDbField;
     fCodcentrocustod   : TCmDbField;
     fCodcentrocustoc13 : TCmDbField;
     fCodcentrocustoc   : TCmDbField;
     fCodccustodevol    : TCmDbField;
     fCodalterajuros13  : TCmDbField;
     fCodalteracorr13   : TCmDbField;

     procedure SetCodalteracorr13(const Value: TCmDbField);
     procedure SetCodalterajuros13(const Value: TCmDbField);
     procedure SetCodccustodevol(const Value: TCmDbField);
     procedure SetCodcentrocustoc(const Value: TCmDbField);
     procedure SetCodcentrocustoc13(const Value: TCmDbField);
     procedure SetCodcentrocustod(const Value: TCmDbField);
     procedure SetCodcentrocustod13(const Value: TCmDbField);
     procedure SetCodcentrorespon(const Value: TCmDbField);
     procedure SetCodcentrorespon13(const Value: TCmDbField);
     procedure SetCodportforma(const Value: TCmDbField);
     procedure SetCodportforma13(const Value: TCmDbField);
     procedure SetCodsubconta(const Value: TCmDbField);
     procedure SetCodsubconta13(const Value: TCmDbField);
     procedure SetCodtipdoc(const Value: TCmDbField);
     procedure SetCodtipdoc13(const Value: TCmDbField);
     procedure SetCodtiprecdes(const Value: TCmDbField);
     procedure SetCodtiprecdes13(const Value: TCmDbField);
     procedure SetDatafinal(const Value: TCmDbField);
     procedure SetDatainicio(const Value: TCmDbField);
     procedure SetDiavencimento(const Value: TCmDbField);
     procedure SetFlgcobra(const Value: TCmDbField);
     procedure SetIdcontribuicao(const Value: TCmDbField);
     procedure SetIdempresa(const Value: TCmDbField);
     procedure SetIdempresa13(const Value: TCmDbField);
     procedure SetIdempresaprop(const Value: TCmDbField);
     procedure SetIdempresaprop13(const Value: TCmDbField);
     procedure SetIdpessoa(const Value: TCmDbField);
     procedure SetIdplanoprev(const Value: TCmDbField);
     procedure SetIdplanprevcontab(const Value: TCmDbField);
     procedure SetIdtpperiodicidade(const Value: TCmDbField);
     procedure SetPlacontac(const Value: TCmDbField);
     procedure SetPlacontac13(const Value: TCmDbField);
     procedure SetPlacontad(const Value: TCmDbField);
     procedure SetPlacontad13(const Value: TCmDbField);
     procedure SetPlacontadbanco(const Value: TCmDbField);
     procedure SetPlacontadbanco13(const Value: TCmDbField);
     procedure SetPlacontadevol(const Value: TCmDbField);
     procedure SetPlacontaoutromes(const Value: TCmDbField);
     procedure SetPlano(const Value: TCmDbField);
     procedure SetPlano13(const Value: TCmDbField);
     procedure SetQtdeparcelas(const Value: TCmDbField);
     procedure SetRecpag(const Value: TCmDbField);
     procedure SetRecpag13(const Value: TCmDbField);
     procedure SetTipcodigo(const Value: TCmDbField);
     procedure SetTipcodigo13(const Value: TCmDbField);
     procedure SetTrgdtinclusao(const Value: TCmDbField);
     procedure SetTrguserinclusao(const Value: TCmDbField);
     procedure SetUltmespreparo(const Value: TCmDbField);
     procedure SetUnidnegoc(const Value: TCmDbField);
     procedure SetUnidnegoc13(const Value: TCmDbField);
     procedure SetValorbase1(const Value: TCmDbField);
     procedure SetValorbase2(const Value: TCmDbField);
     procedure SetValorbase3(const Value: TCmDbField);

  public

     Property Valorbase3        : TCmDbField read fValorbase3        write SetValorbase3;
     Property Valorbase2        : TCmDbField read fValorbase2        write SetValorbase2;
     Property Valorbase1        : TCmDbField read fValorbase1        write SetValorbase1;
     Property Unidnegoc13       : TCmDbField read fUnidnegoc13       write SetUnidnegoc13;
     Property Unidnegoc         : TCmDbField read fUnidnegoc         write SetUnidnegoc;
     Property Ultmespreparo     : TCmDbField read fUltmespreparo     write SetUltmespreparo;
     Property Trguserinclusao   : TCmDbField read fTrguserinclusao   write SetTrguserinclusao;
     Property Trgdtinclusao     : TCmDbField read fTrgdtinclusao     write SetTrgdtinclusao;
     Property Tipcodigo13       : TCmDbField read fTipcodigo13       write SetTipcodigo13;
     Property Tipcodigo         : TCmDbField read fTipcodigo         write SetTipcodigo;
     Property Recpag13          : TCmDbField read fRecpag13          write SetRecpag13;
     Property Recpag            : TCmDbField read fRecpag            write SetRecpag;
     Property Qtdeparcelas      : TCmDbField read fQtdeparcelas      write SetQtdeparcelas;
     Property Plano13           : TCmDbField read fPlano13           write SetPlano13;
     Property Plano             : TCmDbField read fPlano             write SetPlano;
     Property Placontaoutromes  : TCmDbField read fPlacontaoutromes  write SetPlacontaoutromes;
     Property Placontad13       : TCmDbField read fPlacontad13       write SetPlacontad13;
     Property Placontadevol     : TCmDbField read fPlacontadevol     write SetPlacontadevol;
     Property Placontadbanco13  : TCmDbField read fPlacontadbanco13  write SetPlacontadbanco13;
     Property Placontadbanco    : TCmDbField read fPlacontadbanco    write SetPlacontadbanco;
     Property Placontad         : TCmDbField read fPlacontad         write SetPlacontad;
     Property Placontac13       : TCmDbField read fPlacontac13       write SetPlacontac13;
     Property Placontac         : TCmDbField read fPlacontac         write SetPlacontac;
     Property Idtpperiodicidade : TCmDbField read fIdtpperiodicidade write SetIdtpperiodicidade;
     Property Idplanprevcontab  : TCmDbField read fIdplanprevcontab  write SetIdplanprevcontab;
     Property Idplanoprev       : TCmDbField read fIdplanoprev       write SetIdplanoprev;
     Property Idpessoa          : TCmDbField read fIdpessoa          write SetIdpessoa;
     Property Idempresa13       : TCmDbField read fIdempresa13       write SetIdempresa13;
     Property Idempresaprop13   : TCmDbField read fIdempresaprop13   write SetIdempresaprop13;
     Property Idempresaprop     : TCmDbField read fIdempresaprop     write SetIdempresaprop;
     Property Idempresa         : TCmDbField read fIdempresa         write SetIdempresa;
     Property Idcontribuicao    : TCmDbField read fIdcontribuicao    write SetIdcontribuicao;
     Property Flgcobra          : TCmDbField read fFlgcobra          write SetFlgcobra;
     Property Diavencimento     : TCmDbField read fDiavencimento     write SetDiavencimento;
     Property Datainicio        : TCmDbField read fDatainicio        write SetDatainicio;
     Property Datafinal         : TCmDbField read fDatafinal         write SetDatafinal;
     Property Codtiprecdes13    : TCmDbField read fCodtiprecdes13    write SetCodtiprecdes13;
     Property Codtiprecdes      : TCmDbField read fCodtiprecdes      write SetCodtiprecdes;
     Property Codtipdoc13       : TCmDbField read fCodtipdoc13       write SetCodtipdoc13;
     Property Codtipdoc         : TCmDbField read fCodtipdoc         write SetCodtipdoc;
     Property Codsubconta13     : TCmDbField read fCodsubconta13     write SetCodsubconta13;
     Property Codsubconta       : TCmDbField read fCodsubconta       write SetCodsubconta;
     Property Codportforma13    : TCmDbField read fCodportforma13    write SetCodportforma13;
     Property Codportforma      : TCmDbField read fCodportforma      write SetCodportforma;
     Property Codcentrorespon13 : TCmDbField read fCodcentrorespon13 write SetCodcentrorespon13;
     Property Codcentrorespon   : TCmDbField read fCodcentrorespon   write SetCodcentrorespon;
     Property Codcentrocustod13 : TCmDbField read fCodcentrocustod13 write SetCodcentrocustod13;
     Property Codcentrocustod   : TCmDbField read fCodcentrocustod   write SetCodcentrocustod;
     Property Codcentrocustoc13 : TCmDbField read fCodcentrocustoc13 write SetCodcentrocustoc13;
     Property Codcentrocustoc   : TCmDbField read fCodcentrocustoc   write SetCodcentrocustoc;
     Property Codccustodevol    : TCmDbField read fCodccustodevol    write SetCodccustodevol;
     Property Codalterajuros13  : TCmDbField read fCodalterajuros13  write SetCodalterajuros13;
     Property Codalteracorr13   : TCmDbField read fCodalteracorr13   write SetCodalteracorr13;  

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContribprevpatro }

constructor TDbContribprevpatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRIBPREVPATRO';

   fValorbase3        := CreateCmDbField( 'VALORBASE3',        ftfloat,    False, False, False, True, '' );
   fValorbase2        := CreateCmDbField( 'VALORBASE2',        ftfloat,    False, False, False, True, '' );
   fValorbase1        := CreateCmDbField( 'VALORBASE1',        ftfloat,    False, False, False, True, '' );
   fUnidnegoc13       := CreateCmDbField( 'UNIDNEGOC13',       ftfloat,    False, False, False, True, '' );
   fUnidnegoc         := CreateCmDbField( 'UNIDNEGOC',         ftfloat,    False, False, False, True, '' );
   fUltmespreparo     := CreateCmDbField( 'ULTMESPREPARO',     ftString,   False, False, False, True, '' );
   fTrguserinclusao   := CreateCmDbField( 'TRGUSERINCLUSAO',   ftString,   False, False, False, True, '' );
   fTrgdtinclusao     := CreateCmDbField( 'TRGDTINCLUSAO',     ftDateTime, False, False, False, True, '' );
   fTipcodigo13       := CreateCmDbField( 'TIPCODIGO13',       ftString,   False, False, False, True, '' );
   fTipcodigo         := CreateCmDbField( 'TIPCODIGO',         ftString,   False, False, False, True, '' );
   fRecpag13          := CreateCmDbField( 'RECPAG13',          ftString,   False, False, False, True, '' );
   fRecpag            := CreateCmDbField( 'RECPAG',            ftString,   False, False, False, True, '' );
   fQtdeparcelas      := CreateCmDbField( 'QTDEPARCELAS',      ftfloat,    False, False, False, True, '' );
   fPlano13           := CreateCmDbField( 'PLANO13',           ftfloat,    False, False, False, True, '' );
   fPlano             := CreateCmDbField( 'PLANO',             ftfloat,    False, False, False, True, '' );
   fPlacontaoutromes  := CreateCmDbField( 'PLACONTAOUTROMES',  ftString,   False, False, False, True, '' );
   fPlacontad13       := CreateCmDbField( 'PLACONTAD13',       ftString,   False, False, False, True, '' );
   fPlacontadevol     := CreateCmDbField( 'PLACONTADEVOL',     ftString,   False, False, False, True, '' );
   fPlacontadbanco13  := CreateCmDbField( 'PLACONTADBANCO13',  ftString,   False, False, False, True, '' );
   fPlacontadbanco    := CreateCmDbField( 'PLACONTADBANCO',    ftString,   False, False, False, True, '' );
   fPlacontad         := CreateCmDbField( 'PLACONTAD',         ftString,   False, False, False, True, '' );
   fPlacontac13       := CreateCmDbField( 'PLACONTAC13',       ftString,   False, False, False, True, '' );
   fPlacontac         := CreateCmDbField( 'PLACONTAC',         ftString,   False, False, False, True, '' );
   fIdtpperiodicidade := CreateCmDbField( 'IDTPPERIODICIDADE', ftfloat,    False, False, False, True, '' );
   fIdplanprevcontab  := CreateCmDbField( 'IDPLANPREVCONTAB',  ftfloat,    False, False, False, True, '' );
   fIdplanoprev       := CreateCmDbField( 'IDPLANOPREV',       ftfloat,    True,  True,  False, True, '' );
   fIdpessoa          := CreateCmDbField( 'IDPESSOA',          ftfloat,    True,  True,  False, True, '' );
   fIdempresa13       := CreateCmDbField( 'IDEMPRESA13',       ftfloat,    False, False, False, True, '' );
   fIdempresaprop13   := CreateCmDbField( 'IDEMPRESAPROP13',   ftfloat,    False, False, False, True, '' );
   fIdempresaprop     := CreateCmDbField( 'IDEMPRESAPROP',     ftfloat,    False, False, False, True, '' );
   fIdempresa         := CreateCmDbField( 'IDEMPRESA',         ftfloat,    False, False, False, True, '' );
   fIdcontribuicao    := CreateCmDbField( 'IDCONTRIBUICAO',    ftfloat,    True,  True,  False, True, '' );
   fFlgcobra          := CreateCmDbField( 'FLGCOBRA',          ftfloat,    False, False, False, True, '' );
   fDiavencimento     := CreateCmDbField( 'DIAVENCIMENTO',     ftfloat,    False, False, False, True, '' );
   fDatainicio        := CreateCmDbField( 'DATAINICIO',        ftDateTime, False, False, False, True, '' );
   fDatafinal         := CreateCmDbField( 'DATAFINAL',         ftDateTime, False, False, False, True, '' );
   fCodtiprecdes13    := CreateCmDbField( 'CODTIPRECDES13',    ftString,   False, False, False, True, '' );
   fCodtiprecdes      := CreateCmDbField( 'CODTIPRECDES',      ftString,   False, False, False, True, '' );
   fCodtipdoc13       := CreateCmDbField( 'CODTIPDOC13',       ftfloat,    False, False, False, True, '' );
   fCodtipdoc         := CreateCmDbField( 'CODTIPDOC',         ftfloat,    False, False, False, True, '' );
   fCodsubconta13     := CreateCmDbField( 'CODSUBCONTA13',     ftfloat,    False, False, False, True, '' );
   fCodsubconta       := CreateCmDbField( 'CODSUBCONTA',       ftfloat,    False, False, False, True, '' );
   fCodportforma13    := CreateCmDbField( 'CODPORTFORMA13',    ftfloat,    False, False, False, True, '' );
   fCodportforma      := CreateCmDbField( 'CODPORTFORMA',      ftfloat,    False, False, False, True, '' );
   fCodcentrorespon13 := CreateCmDbField( 'CODCENTRORESPON13', ftString,   False, False, False, True, '' );
   fCodcentrorespon   := CreateCmDbField( 'CODCENTRORESPON',   ftString,   False, False, False, True, '' );
   fCodcentrocustod13 := CreateCmDbField( 'CODCENTROCUSTOD13', ftString,   False, False, False, True, '' );
   fCodcentrocustod   := CreateCmDbField( 'CODCENTROCUSTOD',   ftString,   False, False, False, True, '' );
   fCodcentrocustoc13 := CreateCmDbField( 'CODCENTROCUSTOC13', ftString,   False, False, False, True, '' );
   fCodcentrocustoc   := CreateCmDbField( 'CODCENTROCUSTOC',   ftString,   False, False, False, True, '' );
   fCodccustodevol    := CreateCmDbField( 'CODCCUSTODEVOL',    ftString,   False, False, False, True, '' );
   fCodalterajuros13  := CreateCmDbField( 'CODALTERAJUROS13',  ftfloat,    False, False, False, True, '' );
   fCodalteracorr13   := CreateCmDbField( 'CODALTERACORR13',   ftfloat,    False, False, False, True, '' );
end;

function TDbContribprevpatro.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbContribprevpatro.SetCodalteracorr13(const Value: TCmDbField);
begin
  fCodalteracorr13 := Value;
end;

procedure TDbContribprevpatro.SetCodalterajuros13(const Value: TCmDbField);
begin
  fCodalterajuros13 := Value;
end;

procedure TDbContribprevpatro.SetCodccustodevol(const Value: TCmDbField);
begin
  fCodccustodevol := Value;
end;

procedure TDbContribprevpatro.SetCodcentrocustoc(const Value: TCmDbField);
begin
  fCodcentrocustoc := Value;
end;

procedure TDbContribprevpatro.SetCodcentrocustoc13(
  const Value: TCmDbField);
begin
  fCodcentrocustoc13 := Value;
end;

procedure TDbContribprevpatro.SetCodcentrocustod(const Value: TCmDbField);
begin
  fCodcentrocustod := Value;
end;

procedure TDbContribprevpatro.SetCodcentrocustod13(
  const Value: TCmDbField);
begin
  fCodcentrocustod13 := Value;
end;

procedure TDbContribprevpatro.SetCodcentrorespon(const Value: TCmDbField);
begin
  fCodcentrorespon := Value;
end;

procedure TDbContribprevpatro.SetCodcentrorespon13(
  const Value: TCmDbField);
begin
  fCodcentrorespon13 := Value;
end;

procedure TDbContribprevpatro.SetCodportforma(const Value: TCmDbField);
begin
  fCodportforma := Value;
end;

procedure TDbContribprevpatro.SetCodportforma13(const Value: TCmDbField);
begin
  fCodportforma13 := Value;
end;

procedure TDbContribprevpatro.SetCodsubconta(const Value: TCmDbField);
begin
  fCodsubconta := Value;
end;

procedure TDbContribprevpatro.SetCodsubconta13(const Value: TCmDbField);
begin
  fCodsubconta13 := Value;
end;

procedure TDbContribprevpatro.SetCodtipdoc(const Value: TCmDbField);
begin
  fCodtipdoc := Value;
end;

procedure TDbContribprevpatro.SetCodtipdoc13(const Value: TCmDbField);
begin
  fCodtipdoc13 := Value;
end;

procedure TDbContribprevpatro.SetCodtiprecdes(const Value: TCmDbField);
begin
  fCodtiprecdes := Value;
end;

procedure TDbContribprevpatro.SetCodtiprecdes13(const Value: TCmDbField);
begin
  fCodtiprecdes13 := Value;
end;

procedure TDbContribprevpatro.SetDatafinal(const Value: TCmDbField);
begin
  fDatafinal := Value;
end;

procedure TDbContribprevpatro.SetDatainicio(const Value: TCmDbField);
begin
  fDatainicio := Value;
end;

procedure TDbContribprevpatro.SetDiavencimento(const Value: TCmDbField);
begin
  fDiavencimento := Value;
end;

procedure TDbContribprevpatro.SetFlgcobra(const Value: TCmDbField);
begin
  fFlgcobra := Value;
end;

procedure TDbContribprevpatro.SetIdcontribuicao(const Value: TCmDbField);
begin
  fIdcontribuicao := Value;
end;

procedure TDbContribprevpatro.SetIdempresa(const Value: TCmDbField);
begin
  fIdempresa := Value;
end;

procedure TDbContribprevpatro.SetIdempresa13(const Value: TCmDbField);
begin
  fIdempresa13 := Value;
end;

procedure TDbContribprevpatro.SetIdempresaprop(const Value: TCmDbField);
begin
  fIdempresaprop := Value;
end;

procedure TDbContribprevpatro.SetIdempresaprop13(const Value: TCmDbField);
begin
  fIdempresaprop13 := Value;
end;

procedure TDbContribprevpatro.SetIdpessoa(const Value: TCmDbField);
begin
  fIdpessoa := Value;
end;

procedure TDbContribprevpatro.SetIdplanoprev(const Value: TCmDbField);
begin
  fIdplanoprev := Value;
end;

procedure TDbContribprevpatro.SetIdplanprevcontab(const Value: TCmDbField);
begin
  fIdplanprevcontab := Value;
end;

procedure TDbContribprevpatro.SetIdtpperiodicidade(
  const Value: TCmDbField);
begin
  fIdtpperiodicidade := Value;
end;

procedure TDbContribprevpatro.SetPlacontac(const Value: TCmDbField);
begin
  fPlacontac := Value;
end;

procedure TDbContribprevpatro.SetPlacontac13(const Value: TCmDbField);
begin
  fPlacontac13 := Value;
end;

procedure TDbContribprevpatro.SetPlacontad(const Value: TCmDbField);
begin
  fPlacontad := Value;
end;

procedure TDbContribprevpatro.SetPlacontad13(const Value: TCmDbField);
begin
  fPlacontad13 := Value;
end;

procedure TDbContribprevpatro.SetPlacontadbanco(const Value: TCmDbField);
begin
  fPlacontadbanco := Value;
end;

procedure TDbContribprevpatro.SetPlacontadbanco13(const Value: TCmDbField);
begin
  fPlacontadbanco13 := Value;
end;

procedure TDbContribprevpatro.SetPlacontadevol(const Value: TCmDbField);
begin
  fPlacontadevol := Value;
end;

procedure TDbContribprevpatro.SetPlacontaoutromes(const Value: TCmDbField);
begin
  fPlacontaoutromes := Value;
end;

procedure TDbContribprevpatro.SetPlano(const Value: TCmDbField);
begin
  fPlano := Value;
end;

procedure TDbContribprevpatro.SetPlano13(const Value: TCmDbField);
begin
  fPlano13 := Value;
end;

procedure TDbContribprevpatro.SetQtdeparcelas(const Value: TCmDbField);
begin
  fQtdeparcelas := Value;
end;

procedure TDbContribprevpatro.SetRecpag(const Value: TCmDbField);
begin
  fRecpag := Value;
end;

procedure TDbContribprevpatro.SetRecpag13(const Value: TCmDbField);
begin
  fRecpag13 := Value;
end;

procedure TDbContribprevpatro.SetTipcodigo(const Value: TCmDbField);
begin
  fTipcodigo := Value;
end;

procedure TDbContribprevpatro.SetTipcodigo13(const Value: TCmDbField);
begin
  fTipcodigo13 := Value;
end;

procedure TDbContribprevpatro.SetTrgdtinclusao(const Value: TCmDbField);
begin
  fTrgdtinclusao := Value;
end;

procedure TDbContribprevpatro.SetTrguserinclusao(const Value: TCmDbField);
begin
  fTrguserinclusao := Value;
end;

procedure TDbContribprevpatro.SetUltmespreparo(const Value: TCmDbField);
begin
  fUltmespreparo := Value;
end;

procedure TDbContribprevpatro.SetUnidnegoc(const Value: TCmDbField);
begin
  fUnidnegoc := Value;
end;

procedure TDbContribprevpatro.SetUnidnegoc13(const Value: TCmDbField);
begin
  fUnidnegoc13 := Value;
end;

procedure TDbContribprevpatro.SetValorbase1(const Value: TCmDbField);
begin
  fValorbase1 := Value;
end;

procedure TDbContribprevpatro.SetValorbase2(const Value: TCmDbField);
begin
  fValorbase2 := Value;
end;

procedure TDbContribprevpatro.SetValorbase3(const Value: TCmDbField);
begin
  fValorbase3 := Value;
end;

end.



