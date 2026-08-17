{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBParamCAF;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBParamCAF = class(TCmDbObject)

  private
    FProximaplaca: TCmDbField;
    FTipoconjunto: TCmDbField;
    FPatropadrao: TCmDbField;
    FMoedaoficial: TCmDbField;
    FFlgnovohistmovim: TCmDbField;
    FUlttxtcontab: TCmDbField;
    FMoedafiscal: TCmDbField;
    FDtanovohistmovim: TCmDbField;
    FPlanprevpadrao: TCmDbField;
    FCdveloc: TCmDbField;
    FFlgcalccm: TCmDbField;
    FTipoperctb: TCmDbField;
    FColetordados: TCmDbField;
    FFlgreaval: TCmDbField;
    FFlgtipocalc: TCmDbField;
    FDatarecalcdep: TCmDbField;
    FIntegracap: TCmDbField;
    FCdpath: TCmDbField;
    FMoedagerencialb: TCmDbField;
    FEditacodbem: TCmDbField;
    FDtaultalug: TCmDbField;
    FSeqbememp: TCmDbField;
    FMasccodgrupo: TCmDbField;
    FAluguelinterno: TCmDbField;
    FMascaraclasse: TCmDbField;
    FDataultdep: TCmDbField;
    FSistemas: TCmDbField;
    FNumtaxadep: TCmDbField;
    FMoedagerencial: TCmDbField;
    FDtarecsldcontabil: TCmDbField;
    FFlgclsdesbem: TCmDbField;
    FFlgremoveplanctb: TCmDbField;
    FGerarreqmat: TCmDbField;
    FDigmascplaca: TCmDbField;
    FMoedagerencialc: TCmDbField;
    FTipatusaldocontab: TCmDbField;
    FDatainicial: TCmDbField;
    FIntegracontab: TCmDbField;
    FNumdiasano: TCmDbField;
    FPlanovigente: TCmDbField;
    FCdporta: TCmDbField;
    FIntegracar: TCmDbField;
    FIdpessoa: TCmDbField;
    FDtancaf: TCmDbField;
    FEditacodgrupo: TCmDbField;
    FAtivprojeto: TCmDbField;
    procedure SetAluguelinterno(const Value: TCmDbField);
    procedure SetAtivprojeto(const Value: TCmDbField);
    procedure SetCdpath(const Value: TCmDbField);
    procedure SetCdporta(const Value: TCmDbField);
    procedure SetCdveloc(const Value: TCmDbField);
    procedure SetColetordados(const Value: TCmDbField);
    procedure SetDatainicial(const Value: TCmDbField);
    procedure SetDatarecalcdep(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDigmascplaca(const Value: TCmDbField);
    procedure SetDtancaf(const Value: TCmDbField);
    procedure SetDtanovohistmovim(const Value: TCmDbField);
    procedure SetDtarecsldcontabil(const Value: TCmDbField);
    procedure SetDtaultalug(const Value: TCmDbField);
    procedure SetEditacodbem(const Value: TCmDbField);
    procedure SetEditacodgrupo(const Value: TCmDbField);
    procedure SetFlgcalccm(const Value: TCmDbField);
    procedure SetFlgclsdesbem(const Value: TCmDbField);
    procedure SetFlgnovohistmovim(const Value: TCmDbField);
    procedure SetFlgreaval(const Value: TCmDbField);
    procedure SetFlgremoveplanctb(const Value: TCmDbField);
    procedure SetFlgtipocalc(const Value: TCmDbField);
    procedure SetGerarreqmat(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIntegracap(const Value: TCmDbField);
    procedure SetIntegracar(const Value: TCmDbField);
    procedure SetIntegracontab(const Value: TCmDbField);
    procedure SetMascaraclasse(const Value: TCmDbField);
    procedure SetMasccodgrupo(const Value: TCmDbField);
    procedure SetMoedafiscal(const Value: TCmDbField);
    procedure SetMoedagerencial(const Value: TCmDbField);
    procedure SetMoedagerencialb(const Value: TCmDbField);
    procedure SetMoedagerencialc(const Value: TCmDbField);
    procedure SetMoedaoficial(const Value: TCmDbField);
    procedure SetNumdiasano(const Value: TCmDbField);
    procedure SetNumtaxadep(const Value: TCmDbField);
    procedure SetPatropadrao(const Value: TCmDbField);
    procedure SetPlanovigente(const Value: TCmDbField);
    procedure SetPlanprevpadrao(const Value: TCmDbField);
    procedure SetProximaplaca(const Value: TCmDbField);
    procedure SetSeqbememp(const Value: TCmDbField);
    procedure SetSistemas(const Value: TCmDbField);
    procedure SetTipatusaldocontab(const Value: TCmDbField);
    procedure SetTipoconjunto(const Value: TCmDbField);
    procedure SetTipoperctb(const Value: TCmDbField);
    procedure SetUlttxtcontab(const Value: TCmDbField);

  public

     Property Ulttxtcontab: TCmDbField read FUlttxtcontab write SetUlttxtcontab;
     Property Tipoperctb: TCmDbField read FTipoperctb write SetTipoperctb;
     Property Tipoconjunto: TCmDbField read FTipoconjunto write SetTipoconjunto;
     Property Tipatusaldocontab: TCmDbField read FTipatusaldocontab write SetTipatusaldocontab;
     Property Sistemas: TCmDbField read FSistemas write SetSistemas;
     Property Seqbememp: TCmDbField read FSeqbememp write SetSeqbememp;
     Property Proximaplaca: TCmDbField read FProximaplaca write SetProximaplaca;
     Property Planprevpadrao: TCmDbField read FPlanprevpadrao write SetPlanprevpadrao;
     Property Planovigente: TCmDbField read FPlanovigente write SetPlanovigente;
     Property Patropadrao: TCmDbField read FPatropadrao write SetPatropadrao;
     Property Numtaxadep: TCmDbField read FNumtaxadep write SetNumtaxadep;
     Property Numdiasano: TCmDbField read FNumdiasano write SetNumdiasano;
     Property Moedaoficial: TCmDbField read FMoedaoficial write SetMoedaoficial;
     Property Moedagerencialc: TCmDbField read FMoedagerencialc write SetMoedagerencialc;
     Property Moedagerencialb: TCmDbField read FMoedagerencialb write SetMoedagerencialb;
     Property Moedagerencial: TCmDbField read FMoedagerencial write SetMoedagerencial;
     Property Moedafiscal: TCmDbField read FMoedafiscal write SetMoedafiscal;
     Property Masccodgrupo: TCmDbField read FMasccodgrupo write SetMasccodgrupo;
     Property Mascaraclasse: TCmDbField read FMascaraclasse write SetMascaraclasse;
     Property Integracontab: TCmDbField read FIntegracontab write SetIntegracontab;
     Property Integracar: TCmDbField read FIntegracar write SetIntegracar;
     Property Integracap: TCmDbField read FIntegracap write SetIntegracap;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Gerarreqmat: TCmDbField read FGerarreqmat write SetGerarreqmat;
     Property Flgtipocalc: TCmDbField read FFlgtipocalc write SetFlgtipocalc;
     Property Flgremoveplanctb: TCmDbField read FFlgremoveplanctb write SetFlgremoveplanctb;
     Property Flgreaval: TCmDbField read FFlgreaval write SetFlgreaval;
     Property Flgnovohistmovim: TCmDbField read FFlgnovohistmovim write SetFlgnovohistmovim;
     Property Flgclsdesbem: TCmDbField read FFlgclsdesbem write SetFlgclsdesbem;
     Property Flgcalccm: TCmDbField read FFlgcalccm write SetFlgcalccm;
     Property Editacodgrupo: TCmDbField read FEditacodgrupo write SetEditacodgrupo;
     Property Editacodbem: TCmDbField read FEditacodbem write SetEditacodbem;
     Property Dtaultalug: TCmDbField read FDtaultalug write SetDtaultalug;
     Property Dtarecsldcontabil: TCmDbField read FDtarecsldcontabil write SetDtarecsldcontabil;
     Property Dtanovohistmovim: TCmDbField read FDtanovohistmovim write SetDtanovohistmovim;
     Property Dtancaf: TCmDbField read FDtancaf write SetDtancaf;
     Property Digmascplaca: TCmDbField read FDigmascplaca write SetDigmascplaca;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Datarecalcdep: TCmDbField read FDatarecalcdep write SetDatarecalcdep;
     Property Datainicial: TCmDbField read FDatainicial write SetDatainicial;
     Property Coletordados: TCmDbField read FColetordados write SetColetordados;
     Property Cdveloc: TCmDbField read FCdveloc write SetCdveloc;
     Property Cdporta: TCmDbField read FCdporta write SetCdporta;
     Property Cdpath: TCmDbField read FCdpath write SetCdpath;
     Property Ativprojeto: TCmDbField read FAtivprojeto write SetAtivprojeto;
     Property Aluguelinterno: TCmDbField read FAluguelinterno write SetAluguelinterno;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBParamCAF }

constructor TDBParamCAF.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMETROSCAFMANUT';

   fUlttxtcontab := CreateCmDbField('ULTTXTCONTAB',ftDateTime,False,False,False,True,'');
   fTipoperctb := CreateCmDbField('TIPOPERCTB',ftString,False,False,False,False,'');
   fTipoconjunto := CreateCmDbField('TIPOCONJUNTO',ftfloat,False,False,False,False,'');
   fTipatusaldocontab := CreateCmDbField('TIPATUSALDOCONTAB',ftfloat,False,False,False,False,'');
   fSistemas := CreateCmDbField('SISTEMAS',ftString,False,False,False,False,'');
   fSeqbememp := CreateCmDbField('SEQBEMEMP',ftfloat,True,False,False,False,'');
   fProximaplaca := CreateCmDbField('PROXIMAPLACA',ftfloat,False,False,False,False,'');
   fPlanprevpadrao := CreateCmDbField('PLANPREVPADRAO',ftfloat,False,False,False,True,'');
   fPlanovigente := CreateCmDbField('PLANOVIGENTE',ftfloat,False,False,False,True,'');
   fPatropadrao := CreateCmDbField('PATROPADRAO',ftfloat,False,False,False,True,'');
   fNumtaxadep := CreateCmDbField('NUMTAXADEP',ftfloat,False,False,False,False,'');
   fNumdiasano := CreateCmDbField('NUMDIASANO',ftfloat,False,False,False,True,'');
   fMoedaoficial := CreateCmDbField('MOEDAOFICIAL',ftfloat,False,False,False,True,'');
   fMoedagerencialc := CreateCmDbField('MOEDAGERENCIALC',ftfloat,False,False,False,True,'');
   fMoedagerencialb := CreateCmDbField('MOEDAGERENCIALB',ftfloat,False,False,False,True,'');
   fMoedagerencial := CreateCmDbField('MOEDAGERENCIAL',ftfloat,False,False,False,True,'');
   fMoedafiscal := CreateCmDbField('MOEDAFISCAL',ftfloat,False,False,False,True,'');
   fMasccodgrupo := CreateCmDbField('MASCCODGRUPO',ftString,False,False,False,True,'');
   fMascaraclasse := CreateCmDbField('MASCARACLASSE',ftString,False,False,False,True,'');
   fIntegracontab := CreateCmDbField('INTEGRACONTAB',ftString,False,False,False,False,'');
   fIntegracar := CreateCmDbField('INTEGRACAR',ftString,False,False,False,False,'');
   fIntegracap := CreateCmDbField('INTEGRACAP',ftString,False,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fGerarreqmat := CreateCmDbField('GERARREQMAT',ftfloat,True,False,False,False,'');
   fFlgtipocalc := CreateCmDbField('FLGTIPOCALC',ftString,False,False,False,False,'');
   fFlgremoveplanctb := CreateCmDbField('FLGREMOVEPLANCTB',ftString,False,False,False,False,'');
   fFlgreaval := CreateCmDbField('FLGREAVAL',ftString,False,False,False,False,'');
   fFlgnovohistmovim := CreateCmDbField('FLGNOVOHISTMOVIM',ftfloat,False,False,False,False,'');
   fFlgclsdesbem := CreateCmDbField('FLGCLSDESBEM',ftfloat,False,False,False,False,'');
   fFlgcalccm := CreateCmDbField('FLGCALCCM',ftfloat,False,False,False,False,'');
   fEditacodgrupo := CreateCmDbField('EDITACODGRUPO',ftfloat,True,False,False,True,'');
   fEditacodbem := CreateCmDbField('EDITACODBEM',ftfloat,True,False,False,True,'');
   fDtaultalug := CreateCmDbField('DTAULTALUG',ftDateTime,False,False,False,True,'');
   fDtarecsldcontabil := CreateCmDbField('DTARECSLDCONTABIL',ftDateTime,False,False,False,True,'');
   fDtanovohistmovim := CreateCmDbField('DTANOVOHISTMOVIM',ftDateTime,False,False,False,True,'');
   fDtancaf := CreateCmDbField('DTANCAF',ftDateTime,False,False,False,True,'');
   fDigmascplaca := CreateCmDbField('DIGMASCPLACA',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDatarecalcdep := CreateCmDbField('DATARECALCDEP',ftDateTime,False,False,False,True,'');
   fDatainicial := CreateCmDbField('DATAINICIAL',ftDateTime,False,False,False,True,'');
   fColetordados := CreateCmDbField('COLETORDADOS',ftfloat,False,False,False,True,'');
   fCdveloc := CreateCmDbField('CDVELOC',ftString,False,False,False,True,'');
   fCdporta := CreateCmDbField('CDPORTA',ftfloat,False,False,False,True,'');
   fCdpath := CreateCmDbField('CDPATH',ftString,False,False,False,True,'');
   fAtivprojeto := CreateCmDbField('ATIVPROJETO',ftfloat,False,False,False,True,'');
   fAluguelinterno := CreateCmDbField('ALUGUELINTERNO',ftfloat,True,False,False,True,'');
end;

function TDBParamCAF.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBParamCAF.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBParamCAF.SetAluguelinterno(const Value: TCmDbField);
begin
  FAluguelinterno := Value;
end;

procedure TDBParamCAF.SetAtivprojeto(const Value: TCmDbField);
begin
  FAtivprojeto := Value;
end;

procedure TDBParamCAF.SetCdpath(const Value: TCmDbField);
begin
  FCdpath := Value;
end;

procedure TDBParamCAF.SetCdporta(const Value: TCmDbField);
begin
  FCdporta := Value;
end;

procedure TDBParamCAF.SetCdveloc(const Value: TCmDbField);
begin
  FCdveloc := Value;
end;

procedure TDBParamCAF.SetColetordados(const Value: TCmDbField);
begin
  FColetordados := Value;
end;

procedure TDBParamCAF.SetDatainicial(const Value: TCmDbField);
begin
  FDatainicial := Value;
end;

procedure TDBParamCAF.SetDatarecalcdep(const Value: TCmDbField);
begin
  FDatarecalcdep := Value;
end;

procedure TDBParamCAF.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDBParamCAF.SetDigmascplaca(const Value: TCmDbField);
begin
  FDigmascplaca := Value;
end;

procedure TDBParamCAF.SetDtancaf(const Value: TCmDbField);
begin
  FDtancaf := Value;
end;

procedure TDBParamCAF.SetDtanovohistmovim(const Value: TCmDbField);
begin
  FDtanovohistmovim := Value;
end;

procedure TDBParamCAF.SetDtarecsldcontabil(const Value: TCmDbField);
begin
  FDtarecsldcontabil := Value;
end;

procedure TDBParamCAF.SetDtaultalug(const Value: TCmDbField);
begin
  FDtaultalug := Value;
end;

procedure TDBParamCAF.SetEditacodbem(const Value: TCmDbField);
begin
  FEditacodbem := Value;
end;

procedure TDBParamCAF.SetEditacodgrupo(const Value: TCmDbField);
begin
  FEditacodgrupo := Value;
end;

procedure TDBParamCAF.SetFlgcalccm(const Value: TCmDbField);
begin
  FFlgcalccm := Value;
end;

procedure TDBParamCAF.SetFlgclsdesbem(const Value: TCmDbField);
begin
  FFlgclsdesbem := Value;
end;

procedure TDBParamCAF.SetFlgnovohistmovim(const Value: TCmDbField);
begin
  FFlgnovohistmovim := Value;
end;

procedure TDBParamCAF.SetFlgreaval(const Value: TCmDbField);
begin
  FFlgreaval := Value;
end;

procedure TDBParamCAF.SetFlgremoveplanctb(const Value: TCmDbField);
begin
  FFlgremoveplanctb := Value;
end;

procedure TDBParamCAF.SetFlgtipocalc(const Value: TCmDbField);
begin
  FFlgtipocalc := Value;
end;

procedure TDBParamCAF.SetGerarreqmat(const Value: TCmDbField);
begin
  FGerarreqmat := Value;
end;

procedure TDBParamCAF.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBParamCAF.SetIntegracap(const Value: TCmDbField);
begin
  FIntegracap := Value;
end;

procedure TDBParamCAF.SetIntegracar(const Value: TCmDbField);
begin
  FIntegracar := Value;
end;

procedure TDBParamCAF.SetIntegracontab(const Value: TCmDbField);
begin
  FIntegracontab := Value;
end;

procedure TDBParamCAF.SetMascaraclasse(const Value: TCmDbField);
begin
  FMascaraclasse := Value;
end;

procedure TDBParamCAF.SetMasccodgrupo(const Value: TCmDbField);
begin
  FMasccodgrupo := Value;
end;

procedure TDBParamCAF.SetMoedafiscal(const Value: TCmDbField);
begin
  FMoedafiscal := Value;
end;

procedure TDBParamCAF.SetMoedagerencial(const Value: TCmDbField);
begin
  FMoedagerencial := Value;
end;

procedure TDBParamCAF.SetMoedagerencialb(const Value: TCmDbField);
begin
  FMoedagerencialb := Value;
end;

procedure TDBParamCAF.SetMoedagerencialc(const Value: TCmDbField);
begin
  FMoedagerencialc := Value;
end;

procedure TDBParamCAF.SetMoedaoficial(const Value: TCmDbField);
begin
  FMoedaoficial := Value;
end;

procedure TDBParamCAF.SetNumdiasano(const Value: TCmDbField);
begin
  FNumdiasano := Value;
end;

procedure TDBParamCAF.SetNumtaxadep(const Value: TCmDbField);
begin
  FNumtaxadep := Value;
end;

procedure TDBParamCAF.SetPatropadrao(const Value: TCmDbField);
begin
  FPatropadrao := Value;
end;

procedure TDBParamCAF.SetPlanovigente(const Value: TCmDbField);
begin
  FPlanovigente := Value;
end;

procedure TDBParamCAF.SetPlanprevpadrao(const Value: TCmDbField);
begin
  FPlanprevpadrao := Value;
end;

procedure TDBParamCAF.SetProximaplaca(const Value: TCmDbField);
begin
  FProximaplaca := Value;
end;

procedure TDBParamCAF.SetSeqbememp(const Value: TCmDbField);
begin
  FSeqbememp := Value;
end;

procedure TDBParamCAF.SetSistemas(const Value: TCmDbField);
begin
  FSistemas := Value;
end;

procedure TDBParamCAF.SetTipatusaldocontab(const Value: TCmDbField);
begin
  FTipatusaldocontab := Value;
end;

procedure TDBParamCAF.SetTipoconjunto(const Value: TCmDbField);
begin
  FTipoconjunto := Value;
end;

procedure TDBParamCAF.SetTipoperctb(const Value: TCmDbField);
begin
  FTipoperctb := Value;
end;

procedure TDBParamCAF.SetUlttxtcontab(const Value: TCmDbField);
begin
  FUlttxtcontab := Value;
end;

end.



