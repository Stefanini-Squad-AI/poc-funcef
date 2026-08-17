{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbPlanass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbPlanass = class(TCmDbObject)

  private
    FIdfornserv2: TCmDbField;
    FIdregraatrasocor: TCmDbField;
    FFlgativo: TCmDbField;
    FCodtipodochistpag: TCmDbField;
    FOpcaoaident: TCmDbField;
    FOpcaobdif: TCmDbField;
    FRecpaghistpag: TCmDbField;
    FIdregrabeneficia: TCmDbField;
    FTipofornserv2: TCmDbField;
    FComissfund: TCmDbField;
    FIdregradevolcorr: TCmDbField;
    FCodtiprechistpag: TCmDbField;
    FNumcontrato: TCmDbField;
    FFlgfechado: TCmDbField;
    FFlgopcaob: TCmDbField;
    FDatainiciocom: TCmDbField;
    FIdregradesistenc: TCmDbField;
    FDatainiciovigenc: TCmDbField;
    FIdregraatrasojur: TCmDbField;
    FFlgopcaoa: TCmDbField;
    FCodtiporechistrec: TCmDbField;
    FIdregrapagamento: TCmDbField;
    FIdregradevoljuros: TCmDbField;
    FNome: TCmDbField;
    FComissforn: TCmDbField;
    FIdregrageral: TCmDbField;
    FIdregracancelame: TCmDbField;
    FIdfornserv: TCmDbField;
    FIdregraadministr: TCmDbField;
    FCodtipodochistrec: TCmDbField;
    FIdplanass: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdregraadmissao: TCmDbField;
    FIdprodass: TCmDbField;
    FCodportforma: TCmDbField;
    FRecpaghistrec: TCmDbField;
    FIdregracomissao: TCmDbField;
    FIdregracobranca: TCmDbField;
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodtipodochistpag(const Value: TCmDbField);
    procedure SetCodtipodochistrec(const Value: TCmDbField);
    procedure SetCodtiporechistrec(const Value: TCmDbField);
    procedure SetCodtiprechistpag(const Value: TCmDbField);
    procedure SetComissforn(const Value: TCmDbField);
    procedure SetComissfund(const Value: TCmDbField);
    procedure SetDatainiciocom(const Value: TCmDbField);
    procedure SetDatainiciovigenc(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgfechado(const Value: TCmDbField);
    procedure SetFlgopcaoa(const Value: TCmDbField);
    procedure SetFlgopcaob(const Value: TCmDbField);
    procedure SetIdfornserv(const Value: TCmDbField);
    procedure SetIdfornserv2(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanass(const Value: TCmDbField);
    procedure SetIdprodass(const Value: TCmDbField);
    procedure SetIdregraadministr(const Value: TCmDbField);
    procedure SetIdregraadmissao(const Value: TCmDbField);
    procedure SetIdregraatrasocor(const Value: TCmDbField);
    procedure SetIdregraatrasojur(const Value: TCmDbField);
    procedure SetIdregrabeneficia(const Value: TCmDbField);
    procedure SetIdregracancelame(const Value: TCmDbField);
    procedure SetIdregracobranca(const Value: TCmDbField);
    procedure SetIdregracomissao(const Value: TCmDbField);
    procedure SetIdregradesistenc(const Value: TCmDbField);
    procedure SetIdregradevolcorr(const Value: TCmDbField);
    procedure SetIdregradevoljuros(const Value: TCmDbField);
    procedure SetIdregrageral(const Value: TCmDbField);
    procedure SetIdregrapagamento(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumcontrato(const Value: TCmDbField);
    procedure SetOpcaoaident(const Value: TCmDbField);
    procedure SetOpcaobdif(const Value: TCmDbField);
    procedure SetRecpaghistpag(const Value: TCmDbField);
    procedure SetRecpaghistrec(const Value: TCmDbField);
    procedure SetTipofornserv2(const Value: TCmDbField);

  public

     Property Tipofornserv2: TCmDbField read FTipofornserv2 write SetTipofornserv2;
     Property Recpaghistrec: TCmDbField read FRecpaghistrec write SetRecpaghistrec;
     Property Recpaghistpag: TCmDbField read FRecpaghistpag write SetRecpaghistpag;
     Property Opcaobdif: TCmDbField read FOpcaobdif write SetOpcaobdif;
     Property Opcaoaident: TCmDbField read FOpcaoaident write SetOpcaoaident;
     Property Numcontrato: TCmDbField read FNumcontrato write SetNumcontrato;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idregrapagamento: TCmDbField read FIdregrapagamento write SetIdregrapagamento;
     Property Idregrageral: TCmDbField read FIdregrageral write SetIdregrageral;
     Property Idregradevoljuros: TCmDbField read FIdregradevoljuros write SetIdregradevoljuros;
     Property Idregradevolcorr: TCmDbField read FIdregradevolcorr write SetIdregradevolcorr;
     Property Idregradesistenc: TCmDbField read FIdregradesistenc write SetIdregradesistenc;
     Property Idregracomissao: TCmDbField read FIdregracomissao write SetIdregracomissao;
     Property Idregracobranca: TCmDbField read FIdregracobranca write SetIdregracobranca;
     Property Idregracancelame: TCmDbField read FIdregracancelame write SetIdregracancelame;
     Property Idregrabeneficia: TCmDbField read FIdregrabeneficia write SetIdregrabeneficia;
     Property Idregraatrasojur: TCmDbField read FIdregraatrasojur write SetIdregraatrasojur;
     Property Idregraatrasocor: TCmDbField read FIdregraatrasocor write SetIdregraatrasocor;
     Property Idregraadmissao: TCmDbField read FIdregraadmissao write SetIdregraadmissao;
     Property Idregraadministr: TCmDbField read FIdregraadministr write SetIdregraadministr;
     Property Idprodass: TCmDbField read FIdprodass write SetIdprodass;
     Property Idplanass: TCmDbField read FIdplanass write SetIdplanass;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idfornserv2: TCmDbField read FIdfornserv2 write SetIdfornserv2;
     Property Idfornserv: TCmDbField read FIdfornserv write SetIdfornserv;
     Property Flgopcaob: TCmDbField read FFlgopcaob write SetFlgopcaob;
     Property Flgopcaoa: TCmDbField read FFlgopcaoa write SetFlgopcaoa;
     Property Flgfechado: TCmDbField read FFlgfechado write SetFlgfechado;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Datainiciovigenc: TCmDbField read FDatainiciovigenc write SetDatainiciovigenc;
     Property Datainiciocom: TCmDbField read FDatainiciocom write SetDatainiciocom;
     Property Comissfund: TCmDbField read FComissfund write SetComissfund;
     Property Comissforn: TCmDbField read FComissforn write SetComissforn;
     Property Codtiprechistpag: TCmDbField read FCodtiprechistpag write SetCodtiprechistpag;
     Property Codtiporechistrec: TCmDbField read FCodtiporechistrec write SetCodtiporechistrec;
     Property Codtipodochistrec: TCmDbField read FCodtipodochistrec write SetCodtipodochistrec;
     Property Codtipodochistpag: TCmDbField read FCodtipodochistpag write SetCodtipodochistpag;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanass }

constructor TDbPlanass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANASS';

   fTipofornserv2 := CreateCmDbField('TIPOFORNSERV2',ftString,False,False,False,True,'');
   fRecpaghistrec := CreateCmDbField('RECPAGHISTREC',ftString,False,False,False,True,'');
   fRecpaghistpag := CreateCmDbField('RECPAGHISTPAG',ftString,False,False,False,True,'');
   fOpcaobdif := CreateCmDbField('OPCAOBDIF',ftString,False,False,False,True,'');
   fOpcaoaident := CreateCmDbField('OPCAOAIDENT',ftString,False,False,False,True,'');
   fNumcontrato := CreateCmDbField('NUMCONTRATO',ftfloat,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdregrapagamento := CreateCmDbField('IDREGRAPAGAMENTO',ftfloat,False,False,False,True,'');
   fIdregrageral := CreateCmDbField('IDREGRAGERAL',ftfloat,False,False,False,True,'');
   fIdregradevoljuros := CreateCmDbField('IDREGRADEVOLJUROS',ftfloat,False,False,False,True,'');
   fIdregradevolcorr := CreateCmDbField('IDREGRADEVOLCORR',ftfloat,False,False,False,True,'');
   fIdregradesistenc := CreateCmDbField('IDREGRADESISTENC',ftfloat,False,False,False,True,'');
   fIdregracomissao := CreateCmDbField('IDREGRACOMISSAO',ftfloat,False,False,False,True,'');
   fIdregracobranca := CreateCmDbField('IDREGRACOBRANCA',ftfloat,False,False,False,True,'');
   fIdregracancelame := CreateCmDbField('IDREGRACANCELAME',ftfloat,False,False,False,True,'');
   fIdregrabeneficia := CreateCmDbField('IDREGRABENEFICIA',ftfloat,False,False,False,True,'');
   fIdregraatrasojur := CreateCmDbField('IDREGRAATRASOJUR',ftfloat,False,False,False,True,'');
   fIdregraatrasocor := CreateCmDbField('IDREGRAATRASOCOR',ftfloat,False,False,False,True,'');
   fIdregraadmissao := CreateCmDbField('IDREGRAADMISSAO',ftfloat,False,False,False,True,'');
   fIdregraadministr := CreateCmDbField('IDREGRAADMINISTR',ftfloat,False,False,False,True,'');
   fIdprodass := CreateCmDbField('IDPRODASS',ftfloat,False,False,False,True,'');
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdfornserv2 := CreateCmDbField('IDFORNSERV2',ftfloat,False,False,False,True,'');
   fIdfornserv := CreateCmDbField('IDFORNSERV',ftfloat,False,False,False,True,'');
   fFlgopcaob := CreateCmDbField('FLGOPCAOB',ftfloat,False,False,False,False,'');
   fFlgopcaoa := CreateCmDbField('FLGOPCAOA',ftfloat,False,False,False,False,'');
   fFlgfechado := CreateCmDbField('FLGFECHADO',ftfloat,False,False,False,False,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,False,False,False,False,'');
   fDatainiciovigenc := CreateCmDbField('DATAINICIOVIGENC',ftDateTime,False,False,False,True,'');
   fDatainiciocom := CreateCmDbField('DATAINICIOCOM',ftDateTime,False,False,False,True,'');
   fComissfund := CreateCmDbField('COMISSFUND',ftfloat,False,False,False,False,'');
   fComissforn := CreateCmDbField('COMISSFORN',ftfloat,False,False,False,False,'');
   fCodtiprechistpag := CreateCmDbField('CODTIPRECHISTPAG',ftString,False,False,False,True,'');
   fCodtiporechistrec := CreateCmDbField('CODTIPORECHISTREC',ftString,False,False,False,True,'');
   fCodtipodochistrec := CreateCmDbField('CODTIPODOCHISTREC',ftfloat,False,False,False,True,'');
   fCodtipodochistpag := CreateCmDbField('CODTIPODOCHISTPAG',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
end;

function TDbPlanass.Insert: Boolean;
begin

   fIdplanass.AsFloat := GetSequence('PLANASS');
   Result := Inherited Insert;

end;


procedure TDbPlanass.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbPlanass.SetCodtipodochistpag(const Value: TCmDbField);
begin
  FCodtipodochistpag := Value;
end;

procedure TDbPlanass.SetCodtipodochistrec(const Value: TCmDbField);
begin
  FCodtipodochistrec := Value;
end;

procedure TDbPlanass.SetCodtiporechistrec(const Value: TCmDbField);
begin
  FCodtiporechistrec := Value;
end;

procedure TDbPlanass.SetCodtiprechistpag(const Value: TCmDbField);
begin
  FCodtiprechistpag := Value;
end;

procedure TDbPlanass.SetComissforn(const Value: TCmDbField);
begin
  FComissforn := Value;
end;

procedure TDbPlanass.SetComissfund(const Value: TCmDbField);
begin
  FComissfund := Value;
end;

procedure TDbPlanass.SetDatainiciocom(const Value: TCmDbField);
begin
  FDatainiciocom := Value;
end;

procedure TDbPlanass.SetDatainiciovigenc(const Value: TCmDbField);
begin
  FDatainiciovigenc := Value;
end;

procedure TDbPlanass.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbPlanass.SetFlgfechado(const Value: TCmDbField);
begin
  FFlgfechado := Value;
end;

procedure TDbPlanass.SetFlgopcaoa(const Value: TCmDbField);
begin
  FFlgopcaoa := Value;
end;

procedure TDbPlanass.SetFlgopcaob(const Value: TCmDbField);
begin
  FFlgopcaob := Value;
end;

procedure TDbPlanass.SetIdfornserv(const Value: TCmDbField);
begin
  FIdfornserv := Value;
end;

procedure TDbPlanass.SetIdfornserv2(const Value: TCmDbField);
begin
  FIdfornserv2 := Value;
end;

procedure TDbPlanass.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanass.SetIdplanass(const Value: TCmDbField);
begin
  FIdplanass := Value;
end;

procedure TDbPlanass.SetIdprodass(const Value: TCmDbField);
begin
  FIdprodass := Value;
end;

procedure TDbPlanass.SetIdregraadministr(const Value: TCmDbField);
begin
  FIdregraadministr := Value;
end;

procedure TDbPlanass.SetIdregraadmissao(const Value: TCmDbField);
begin
  FIdregraadmissao := Value;
end;

procedure TDbPlanass.SetIdregraatrasocor(const Value: TCmDbField);
begin
  FIdregraatrasocor := Value;
end;

procedure TDbPlanass.SetIdregraatrasojur(const Value: TCmDbField);
begin
  FIdregraatrasojur := Value;
end;

procedure TDbPlanass.SetIdregrabeneficia(const Value: TCmDbField);
begin
  FIdregrabeneficia := Value;
end;

procedure TDbPlanass.SetIdregracancelame(const Value: TCmDbField);
begin
  FIdregracancelame := Value;
end;

procedure TDbPlanass.SetIdregracobranca(const Value: TCmDbField);
begin
  FIdregracobranca := Value;
end;

procedure TDbPlanass.SetIdregracomissao(const Value: TCmDbField);
begin
  FIdregracomissao := Value;
end;

procedure TDbPlanass.SetIdregradesistenc(const Value: TCmDbField);
begin
  FIdregradesistenc := Value;
end;

procedure TDbPlanass.SetIdregradevolcorr(const Value: TCmDbField);
begin
  FIdregradevolcorr := Value;
end;

procedure TDbPlanass.SetIdregradevoljuros(const Value: TCmDbField);
begin
  FIdregradevoljuros := Value;
end;

procedure TDbPlanass.SetIdregrageral(const Value: TCmDbField);
begin
  FIdregrageral := Value;
end;

procedure TDbPlanass.SetIdregrapagamento(const Value: TCmDbField);
begin
  FIdregrapagamento := Value;
end;

procedure TDbPlanass.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbPlanass.SetNumcontrato(const Value: TCmDbField);
begin
  FNumcontrato := Value;
end;

procedure TDbPlanass.SetOpcaoaident(const Value: TCmDbField);
begin
  FOpcaoaident := Value;
end;

procedure TDbPlanass.SetOpcaobdif(const Value: TCmDbField);
begin
  FOpcaobdif := Value;
end;

procedure TDbPlanass.SetRecpaghistpag(const Value: TCmDbField);
begin
  FRecpaghistpag := Value;
end;

procedure TDbPlanass.SetRecpaghistrec(const Value: TCmDbField);
begin
  FRecpaghistrec := Value;
end;

procedure TDbPlanass.SetTipofornserv2(const Value: TCmDbField);
begin
  FTipofornserv2 := Value;
end;

end.
