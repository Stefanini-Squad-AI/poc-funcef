{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbHotel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbHotel = class(TCmDbObject)

  private
    FIdempresa: TCmDbField;
    FTextocomercing: TCmDbField;
    FPlano: TCmDbField;
    FMinasscobranca: TCmDbField;
    FOutrosservpor: TCmDbField;
    FObservacao: TCmDbField;
    FIdempcondominio: TCmDbField;
    FTransportepor: TCmDbField;
    FServicosing: TCmDbField;
    FMesfimcortesia: TCmDbField;
    FTextocomercpor: TCmDbField;
    FServicospor: TCmDbField;
    FCodsubcontar: TCmDbField;
    FCaixapostal: TCmDbField;
    FVlrassinatura: TCmDbField;
    FFlgusanosistema: TCmDbField;
    FIdcidades: TCmDbField;
    FIdredehotel: TCmDbField;
    FMesinicortesia: TCmDbField;
    FCodcontrato: TCmDbField;
    FAgpropertyid: TCmDbField;
    FRegembratur: TCmDbField;
    FMaxasscobranca: TCmDbField;
    FLocalizacaopor: TCmDbField;
    FLimitemultroom: TCmDbField;
    FCodsabre: TCmDbField;
    FTransporteing: TCmDbField;
    FPlacontaa: TCmDbField;
    FLimitepernoite: TCmDbField;
    FCodcancelamento: TCmDbField;
    FDatainccmnet: TCmDbField;
    FIdhotel: TCmDbField;
    FFacilidadespor: TCmDbField;
    FAtivo: TCmDbField;
    FCodcmnet: TCmDbField;
    FCodfaturamento: TCmDbField;
    FLimitegrupo: TCmDbField;
    FCodchave: TCmDbField;
    FFacilidadesing: TCmDbField;
    FFlgoutroshoteis: TCmDbField;
    FBloqueia: TCmDbField;
    FCodsubcontaa: TCmDbField;
    FOutrosserving: TCmDbField;
    FContato: TCmDbField;
    FPlacontar: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodvehs: TCmDbField;
    FUrl: TCmDbField;
    FCodcentrocustoa: TCmDbField;
    FCodcentrocustor: TCmDbField;
    FQtdestrelas: TCmDbField;
    FClasse: TCmDbField;
    FLocalizacaoing: TCmDbField;
    FNumcancelamento: TCmDbField;
    procedure SetAgpropertyid(const Value: TCmDbField);
    procedure SetAtivo(const Value: TCmDbField);
    procedure SetBloqueia(const Value: TCmDbField);
    procedure SetCaixapostal(const Value: TCmDbField);
    procedure SetClasse(const Value: TCmDbField);
    procedure SetCodcancelamento(const Value: TCmDbField);
    procedure SetCodcentrocustoa(const Value: TCmDbField);
    procedure SetCodcentrocustor(const Value: TCmDbField);
    procedure SetCodchave(const Value: TCmDbField);
    procedure SetCodcmnet(const Value: TCmDbField);
    procedure SetCodcontrato(const Value: TCmDbField);
    procedure SetCodfaturamento(const Value: TCmDbField);
    procedure SetCodsabre(const Value: TCmDbField);
    procedure SetCodsubcontaa(const Value: TCmDbField);
    procedure SetCodsubcontar(const Value: TCmDbField);
    procedure SetCodvehs(const Value: TCmDbField);
    procedure SetContato(const Value: TCmDbField);
    procedure SetDatainccmnet(const Value: TCmDbField);
    procedure SetFacilidadesing(const Value: TCmDbField);
    procedure SetFacilidadespor(const Value: TCmDbField);
    procedure SetFlgoutroshoteis(const Value: TCmDbField);
    procedure SetFlgusanosistema(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdempcondominio(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdhotel(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdredehotel(const Value: TCmDbField);
    procedure SetLimitegrupo(const Value: TCmDbField);
    procedure SetLimitemultroom(const Value: TCmDbField);
    procedure SetLimitepernoite(const Value: TCmDbField);
    procedure SetLocalizacaoing(const Value: TCmDbField);
    procedure SetLocalizacaopor(const Value: TCmDbField);
    procedure SetMaxasscobranca(const Value: TCmDbField);
    procedure SetMesfimcortesia(const Value: TCmDbField);
    procedure SetMesinicortesia(const Value: TCmDbField);
    procedure SetMinasscobranca(const Value: TCmDbField);
    procedure SetNumcancelamento(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetOutrosserving(const Value: TCmDbField);
    procedure SetOutrosservpor(const Value: TCmDbField);
    procedure SetPlacontaa(const Value: TCmDbField);
    procedure SetPlacontar(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetQtdestrelas(const Value: TCmDbField);
    procedure SetRegembratur(const Value: TCmDbField);
    procedure SetServicosing(const Value: TCmDbField);
    procedure SetServicospor(const Value: TCmDbField);
    procedure SetTextocomercing(const Value: TCmDbField);
    procedure SetTextocomercpor(const Value: TCmDbField);
    procedure SetTransporteing(const Value: TCmDbField);
    procedure SetTransportepor(const Value: TCmDbField);
    procedure SetUrl(const Value: TCmDbField);
    procedure SetVlrassinatura(const Value: TCmDbField);

  public

     Property Vlrassinatura: TCmDbField read FVlrassinatura write SetVlrassinatura;
     Property Url: TCmDbField read FUrl write SetUrl;
     Property Transportepor: TCmDbField read FTransportepor write SetTransportepor;
     Property Transporteing: TCmDbField read FTransporteing write SetTransporteing;
     Property Textocomercpor: TCmDbField read FTextocomercpor write SetTextocomercpor;
     Property Textocomercing: TCmDbField read FTextocomercing write SetTextocomercing;
     Property Servicospor: TCmDbField read FServicospor write SetServicospor;
     Property Servicosing: TCmDbField read FServicosing write SetServicosing;
     Property Regembratur: TCmDbField read FRegembratur write SetRegembratur;
     Property Qtdestrelas: TCmDbField read FQtdestrelas write SetQtdestrelas;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontar: TCmDbField read FPlacontar write SetPlacontar;
     Property Placontaa: TCmDbField read FPlacontaa write SetPlacontaa;
     Property Outrosservpor: TCmDbField read FOutrosservpor write SetOutrosservpor;
     Property Outrosserving: TCmDbField read FOutrosserving write SetOutrosserving;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numcancelamento: TCmDbField read FNumcancelamento write SetNumcancelamento;
     Property Minasscobranca: TCmDbField read FMinasscobranca write SetMinasscobranca;
     Property Mesinicortesia: TCmDbField read FMesinicortesia write SetMesinicortesia;
     Property Mesfimcortesia: TCmDbField read FMesfimcortesia write SetMesfimcortesia;
     Property Maxasscobranca: TCmDbField read FMaxasscobranca write SetMaxasscobranca;
     Property Localizacaopor: TCmDbField read FLocalizacaopor write SetLocalizacaopor;
     Property Localizacaoing: TCmDbField read FLocalizacaoing write SetLocalizacaoing;
     Property Limitepernoite: TCmDbField read FLimitepernoite write SetLimitepernoite;
     Property Limitemultroom: TCmDbField read FLimitemultroom write SetLimitemultroom;
     Property Limitegrupo: TCmDbField read FLimitegrupo write SetLimitegrupo;
     Property Idredehotel: TCmDbField read FIdredehotel write SetIdredehotel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idhotel: TCmDbField read FIdhotel write SetIdhotel;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idempcondominio: TCmDbField read FIdempcondominio write SetIdempcondominio;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Flgusanosistema: TCmDbField read FFlgusanosistema write SetFlgusanosistema;
     Property Flgoutroshoteis: TCmDbField read FFlgoutroshoteis write SetFlgoutroshoteis;
     Property Facilidadespor: TCmDbField read FFacilidadespor write SetFacilidadespor;
     Property Facilidadesing: TCmDbField read FFacilidadesing write SetFacilidadesing;
     Property Datainccmnet: TCmDbField read FDatainccmnet write SetDatainccmnet;
     Property Contato: TCmDbField read FContato write SetContato;
     Property Codvehs: TCmDbField read FCodvehs write SetCodvehs;
     Property Codsubcontar: TCmDbField read FCodsubcontar write SetCodsubcontar;
     Property Codsubcontaa: TCmDbField read FCodsubcontaa write SetCodsubcontaa;
     Property Codsabre: TCmDbField read FCodsabre write SetCodsabre;
     Property Codfaturamento: TCmDbField read FCodfaturamento write SetCodfaturamento;
     Property Codcontrato: TCmDbField read FCodcontrato write SetCodcontrato;
     Property Codcmnet: TCmDbField read FCodcmnet write SetCodcmnet;
     Property Codchave: TCmDbField read FCodchave write SetCodchave;
     Property Codcentrocustor: TCmDbField read FCodcentrocustor write SetCodcentrocustor;
     Property Codcentrocustoa: TCmDbField read FCodcentrocustoa write SetCodcentrocustoa;
     Property Codcancelamento: TCmDbField read FCodcancelamento write SetCodcancelamento;
     Property Classe: TCmDbField read FClasse write SetClasse;
     Property Caixapostal: TCmDbField read FCaixapostal write SetCaixapostal;
     Property Bloqueia: TCmDbField read FBloqueia write SetBloqueia;
     Property Ativo: TCmDbField read FAtivo write SetAtivo;
     Property Agpropertyid: TCmDbField read FAgpropertyid write SetAgpropertyid;

     Constructor Create(Aowner: TCmCustomCdbObject) ; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHotel }

constructor TDbHotel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HOTEL';

   fVlrassinatura := CreateCmDbField('VLRASSINATURA',ftfloat,False,False,False,False,'');
   fUrl := CreateCmDbField('URL',ftString,False,False,False,True,'');
   fTransportepor := CreateCmDbField('TRANSPORTEPOR',ftString,False,False,False,True,'');
   fTransporteing := CreateCmDbField('TRANSPORTEING',ftString,False,False,False,True,'');
   fTextocomercpor := CreateCmDbField('TEXTOCOMERCPOR',ftString,False,False,False,True,'');
   fTextocomercing := CreateCmDbField('TEXTOCOMERCING',ftString,False,False,False,True,'');
   fServicospor := CreateCmDbField('SERVICOSPOR',ftString,False,False,False,True,'');
   fServicosing := CreateCmDbField('SERVICOSING',ftString,False,False,False,True,'');
   fRegembratur := CreateCmDbField('REGEMBRATUR',ftString,False,False,False,True,'');
   fQtdestrelas := CreateCmDbField('QTDESTRELAS',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontar := CreateCmDbField('PLACONTAR',ftString,False,False,False,True,'');
   fPlacontaa := CreateCmDbField('PLACONTAA',ftString,False,False,False,True,'');
   fOutrosservpor := CreateCmDbField('OUTROSSERVPOR',ftString,False,False,False,True,'');
   fOutrosserving := CreateCmDbField('OUTROSSERVING',ftString,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumcancelamento := CreateCmDbField('NUMCANCELAMENTO',ftfloat,False,False,False,True,'');
   fMinasscobranca := CreateCmDbField('MINASSCOBRANCA',ftfloat,False,False,False,True,'');
   fMesinicortesia := CreateCmDbField('MESINICORTESIA',ftString,False,False,False,True,'');
   fMesfimcortesia := CreateCmDbField('MESFIMCORTESIA',ftString,False,False,False,True,'');
   fMaxasscobranca := CreateCmDbField('MAXASSCOBRANCA',ftfloat,False,False,False,True,'');
   fLocalizacaopor := CreateCmDbField('LOCALIZACAOPOR',ftString,False,False,False,True,'');
   fLocalizacaoing := CreateCmDbField('LOCALIZACAOING',ftString,False,False,False,True,'');
   fLimitepernoite := CreateCmDbField('LIMITEPERNOITE',ftfloat,False,False,False,False,'');
   fLimitemultroom := CreateCmDbField('LIMITEMULTROOM',ftfloat,False,False,False,False,'');
   fLimitegrupo := CreateCmDbField('LIMITEGRUPO',ftfloat,False,False,False,False,'');
   fIdredehotel := CreateCmDbField('IDREDEHOTEL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdhotel := CreateCmDbField('IDHOTEL',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdempcondominio := CreateCmDbField('IDEMPCONDOMINIO',ftfloat,False,False,False,True,'');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fFlgusanosistema := CreateCmDbField('FLGUSANOSISTEMA',ftString,False,False,False,True,'');
   fFlgoutroshoteis := CreateCmDbField('FLGOUTROSHOTEIS',ftString,False,False,False,True,'');
   fFacilidadespor := CreateCmDbField('FACILIDADESPOR',ftString,False,False,False,True,'');
   fFacilidadesing := CreateCmDbField('FACILIDADESING',ftString,False,False,False,True,'');
   fDatainccmnet := CreateCmDbField('DATAINCCMNET',ftDateTime,False,False,False,True,'');
   fContato := CreateCmDbField('CONTATO',ftString,False,False,False,True,'');
   fCodvehs := CreateCmDbField('CODVEHS',ftString,False,False,False,True,'');
   fCodsubcontar := CreateCmDbField('CODSUBCONTAR',ftfloat,False,False,False,True,'');
   fCodsubcontaa := CreateCmDbField('CODSUBCONTAA',ftfloat,False,False,False,True,'');
   fCodsabre := CreateCmDbField('CODSABRE',ftString,False,False,False,True,'');
   fCodfaturamento := CreateCmDbField('CODFATURAMENTO',ftString,False,False,False,True,'');
   fCodcontrato := CreateCmDbField('CODCONTRATO',ftfloat,False,False,False,True,'');
   fCodcmnet := CreateCmDbField('CODCMNET',ftString,False,False,False,True,'');
   fCodchave := CreateCmDbField('CODCHAVE',ftString,False,False,False,True,'');
   fCodcentrocustor := CreateCmDbField('CODCENTROCUSTOR',ftString,False,False,False,True,'');
   fCodcentrocustoa := CreateCmDbField('CODCENTROCUSTOA',ftString,False,False,False,True,'');
   fCodcancelamento := CreateCmDbField('CODCANCELAMENTO',ftString,False,False,False,True,'');
   fClasse := CreateCmDbField('CLASSE',ftString,False,False,False,True,'');
   fCaixapostal := CreateCmDbField('CAIXAPOSTAL',ftString,False,False,False,True,'');
   fBloqueia := CreateCmDbField('BLOQUEIA',ftString,False,False,False,True,'');
   fAtivo := CreateCmDbField('ATIVO',ftString,False,False,False,True,'');
   fAgpropertyid := CreateCmDbField('AGPROPERTYID',ftString,False,False,False,True,'');
end;

function TDbHotel.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbHotel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbHotel.SetAgpropertyid(const Value: TCmDbField);
begin
  FAgpropertyid := Value;
end;

procedure TDbHotel.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;

procedure TDbHotel.SetBloqueia(const Value: TCmDbField);
begin
  FBloqueia := Value;
end;

procedure TDbHotel.SetCaixapostal(const Value: TCmDbField);
begin
  FCaixapostal := Value;
end;

procedure TDbHotel.SetClasse(const Value: TCmDbField);
begin
  FClasse := Value;
end;

procedure TDbHotel.SetCodcancelamento(const Value: TCmDbField);
begin
  FCodcancelamento := Value;
end;

procedure TDbHotel.SetCodcentrocustoa(const Value: TCmDbField);
begin
  FCodcentrocustoa := Value;
end;

procedure TDbHotel.SetCodcentrocustor(const Value: TCmDbField);
begin
  FCodcentrocustor := Value;
end;

procedure TDbHotel.SetCodchave(const Value: TCmDbField);
begin
  FCodchave := Value;
end;

procedure TDbHotel.SetCodcmnet(const Value: TCmDbField);
begin
  FCodcmnet := Value;
end;

procedure TDbHotel.SetCodcontrato(const Value: TCmDbField);
begin
  FCodcontrato := Value;
end;

procedure TDbHotel.SetCodfaturamento(const Value: TCmDbField);
begin
  FCodfaturamento := Value;
end;

procedure TDbHotel.SetCodsabre(const Value: TCmDbField);
begin
  FCodsabre := Value;
end;

procedure TDbHotel.SetCodsubcontaa(const Value: TCmDbField);
begin
  FCodsubcontaa := Value;
end;

procedure TDbHotel.SetCodsubcontar(const Value: TCmDbField);
begin
  FCodsubcontar := Value;
end;

procedure TDbHotel.SetCodvehs(const Value: TCmDbField);
begin
  FCodvehs := Value;
end;

procedure TDbHotel.SetContato(const Value: TCmDbField);
begin
  FContato := Value;
end;

procedure TDbHotel.SetDatainccmnet(const Value: TCmDbField);
begin
  FDatainccmnet := Value;
end;

procedure TDbHotel.SetFacilidadesing(const Value: TCmDbField);
begin
  FFacilidadesing := Value;
end;

procedure TDbHotel.SetFacilidadespor(const Value: TCmDbField);
begin
  FFacilidadespor := Value;
end;

procedure TDbHotel.SetFlgoutroshoteis(const Value: TCmDbField);
begin
  FFlgoutroshoteis := Value;
end;

procedure TDbHotel.SetFlgusanosistema(const Value: TCmDbField);
begin
  FFlgusanosistema := Value;
end;

procedure TDbHotel.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbHotel.SetIdempcondominio(const Value: TCmDbField);
begin
  FIdempcondominio := Value;
end;

procedure TDbHotel.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbHotel.SetIdhotel(const Value: TCmDbField);
begin
  FIdhotel := Value;
end;

procedure TDbHotel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbHotel.SetIdredehotel(const Value: TCmDbField);
begin
  FIdredehotel := Value;
end;

procedure TDbHotel.SetLimitegrupo(const Value: TCmDbField);
begin
  FLimitegrupo := Value;
end;

procedure TDbHotel.SetLimitemultroom(const Value: TCmDbField);
begin
  FLimitemultroom := Value;
end;

procedure TDbHotel.SetLimitepernoite(const Value: TCmDbField);
begin
  FLimitepernoite := Value;
end;

procedure TDbHotel.SetLocalizacaoing(const Value: TCmDbField);
begin
  FLocalizacaoing := Value;
end;

procedure TDbHotel.SetLocalizacaopor(const Value: TCmDbField);
begin
  FLocalizacaopor := Value;
end;

procedure TDbHotel.SetMaxasscobranca(const Value: TCmDbField);
begin
  FMaxasscobranca := Value;
end;

procedure TDbHotel.SetMesfimcortesia(const Value: TCmDbField);
begin
  FMesfimcortesia := Value;
end;

procedure TDbHotel.SetMesinicortesia(const Value: TCmDbField);
begin
  FMesinicortesia := Value;
end;

procedure TDbHotel.SetMinasscobranca(const Value: TCmDbField);
begin
  FMinasscobranca := Value;
end;

procedure TDbHotel.SetNumcancelamento(const Value: TCmDbField);
begin
  FNumcancelamento := Value;
end;

procedure TDbHotel.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbHotel.SetOutrosserving(const Value: TCmDbField);
begin
  FOutrosserving := Value;
end;

procedure TDbHotel.SetOutrosservpor(const Value: TCmDbField);
begin
  FOutrosservpor := Value;
end;

procedure TDbHotel.SetPlacontaa(const Value: TCmDbField);
begin
  FPlacontaa := Value;
end;

procedure TDbHotel.SetPlacontar(const Value: TCmDbField);
begin
  FPlacontar := Value;
end;

procedure TDbHotel.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbHotel.SetQtdestrelas(const Value: TCmDbField);
begin
  FQtdestrelas := Value;
end;

procedure TDbHotel.SetRegembratur(const Value: TCmDbField);
begin
  FRegembratur := Value;
end;

procedure TDbHotel.SetServicosing(const Value: TCmDbField);
begin
  FServicosing := Value;
end;

procedure TDbHotel.SetServicospor(const Value: TCmDbField);
begin
  FServicospor := Value;
end;

procedure TDbHotel.SetTextocomercing(const Value: TCmDbField);
begin
  FTextocomercing := Value;
end;

procedure TDbHotel.SetTextocomercpor(const Value: TCmDbField);
begin
  FTextocomercpor := Value;
end;

procedure TDbHotel.SetTransporteing(const Value: TCmDbField);
begin
  FTransporteing := Value;
end;

procedure TDbHotel.SetTransportepor(const Value: TCmDbField);
begin
  FTransportepor := Value;
end;

procedure TDbHotel.SetUrl(const Value: TCmDbField);
begin
  FUrl := Value;
end;

procedure TDbHotel.SetVlrassinatura(const Value: TCmDbField);
begin
  FVlrassinatura := Value;
end;

end.



