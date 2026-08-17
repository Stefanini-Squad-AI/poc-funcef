{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/05/2007                             }
{                                                       }
{*******************************************************}

unit uDBReservaXPlano;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBReservaXPlano = class(TCmDbObject)

  private
    FFlgcontrole: TCmDbField;
    FIdplanoprev: TCmDbField;
    FFlgtransferencia: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FCodsubconta: TCmDbField;
    FPlacontad: TCmDbField;
    FPlacontaatuc: TCmDbField;
    FFlgmodatualizacao: TCmDbField;
    FFlgreajustemensal: TCmDbField;
    FPlacontajurc: TCmDbField;
    FIndicecorrecao: TCmDbField;
    FUnidnegoc: TCmDbField;
    FFlgtitularcolet: TCmDbField;
    FFlgregressiva: TCmDbField;
    FIndicereajuste: TCmDbField;
    FPlacontaprovisd: TCmDbField;
    FPlacontaprovisc: TCmDbField;
    FPlacontaatud: TCmDbField;
    FPlacontajurd: TCmDbField;
    FPlano: TCmDbField;
    FIdbeneficio: TCmDbField;
    FIdempresaprop: TCmDbField;
    FAnaliticosinteti: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FIdtiporeserva: TCmDbField;
    FIdregracalculore: TCmDbField;
    FPercjurosres: TCmDbField;
    FFlgdescirrf: TCmDbField;
    FIdproduto: TCmDbField;
    FIdrescontroleexc: TCmDbField;
    FIdregrapagtorese: TCmDbField;
    FCodhierarquia: TCmDbField;
    FNome: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FPlacontac: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgtiporeserva: TCmDbField;
    FFlgmudperfil: TCmDbField;
    FFlgcoletiva: TCmDbField;
    FMesultreajuste: TCmDbField;
    procedure SetAnaliticosinteti(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodhierarquia(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetFlgcoletiva(const Value: TCmDbField);
    procedure SetFlgcontrole(const Value: TCmDbField);
    procedure SetFlgdescirrf(const Value: TCmDbField);
    procedure SetFlgmodatualizacao(const Value: TCmDbField);
    procedure SetFlgmudperfil(const Value: TCmDbField);
    procedure SetFlgreajustemensal(const Value: TCmDbField);
    procedure SetFlgregressiva(const Value: TCmDbField);
    procedure SetFlgtiporeserva(const Value: TCmDbField);
    procedure SetFlgtitularcolet(const Value: TCmDbField);
    procedure SetFlgtransferencia(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdproduto(const Value: TCmDbField);
    procedure SetIdregracalculore(const Value: TCmDbField);
    procedure SetIdregrapagtorese(const Value: TCmDbField);
    procedure SetIdrescontroleexc(const Value: TCmDbField);
    procedure SetIdtiporeserva(const Value: TCmDbField);
    procedure SetIndicecorrecao(const Value: TCmDbField);
    procedure SetIndicereajuste(const Value: TCmDbField);
    procedure SetMesultreajuste(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetPercjurosres(const Value: TCmDbField);
    procedure SetPlacontaatuc(const Value: TCmDbField);
    procedure SetPlacontaatud(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlacontajurc(const Value: TCmDbField);
    procedure SetPlacontajurd(const Value: TCmDbField);
    procedure SetPlacontaprovisc(const Value: TCmDbField);
    procedure SetPlacontaprovisd(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontaprovisd: TCmDbField read FPlacontaprovisd write SetPlacontaprovisd;
     Property Placontaprovisc: TCmDbField read FPlacontaprovisc write SetPlacontaprovisc;
     Property Placontajurd: TCmDbField read FPlacontajurd write SetPlacontajurd;
     Property Placontajurc: TCmDbField read FPlacontajurc write SetPlacontajurc;
     Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Placontaatud: TCmDbField read FPlacontaatud write SetPlacontaatud;
     Property Placontaatuc: TCmDbField read FPlacontaatuc write SetPlacontaatuc;
     Property Percjurosres: TCmDbField read FPercjurosres write SetPercjurosres;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Mesultreajuste: TCmDbField read FMesultreajuste write SetMesultreajuste;
     Property Indicereajuste: TCmDbField read FIndicereajuste write SetIndicereajuste;
     Property Indicecorrecao: TCmDbField read FIndicecorrecao write SetIndicecorrecao;
     Property Idtiporeserva: TCmDbField read FIdtiporeserva write SetIdtiporeserva;
     Property Idrescontroleexc: TCmDbField read FIdrescontroleexc write SetIdrescontroleexc;
     Property Idregrapagtorese: TCmDbField read FIdregrapagtorese write SetIdregrapagtorese;
     Property Idregracalculore: TCmDbField read FIdregracalculore write SetIdregracalculore;
     Property Idproduto: TCmDbField read FIdproduto write SetIdproduto;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Flgtransferencia: TCmDbField read FFlgtransferencia write SetFlgtransferencia;
     Property Flgtitularcolet: TCmDbField read FFlgtitularcolet write SetFlgtitularcolet;
     Property Flgtiporeserva: TCmDbField read FFlgtiporeserva write SetFlgtiporeserva;
     Property Flgregressiva: TCmDbField read FFlgregressiva write SetFlgregressiva;
     Property Flgreajustemensal: TCmDbField read FFlgreajustemensal write SetFlgreajustemensal;
     Property Flgmudperfil: TCmDbField read FFlgmudperfil write SetFlgmudperfil;
     Property Flgmodatualizacao: TCmDbField read FFlgmodatualizacao write SetFlgmodatualizacao;
     Property Flgdescirrf: TCmDbField read FFlgdescirrf write SetFlgdescirrf;
     Property Flgcontrole: TCmDbField read FFlgcontrole write SetFlgcontrole;
     Property Flgcoletiva: TCmDbField read FFlgcoletiva write SetFlgcoletiva;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codhierarquia: TCmDbField read FCodhierarquia write SetCodhierarquia;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
     Property Analiticosinteti: TCmDbField read FAnaliticosinteti write SetAnaliticosinteti;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReservaXPlano }

constructor TDBReservaXPlano.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESERVAXPLANO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontaprovisd := CreateCmDbField('PLACONTAPROVISD',ftString,False,False,False,True,'');
   fPlacontaprovisc := CreateCmDbField('PLACONTAPROVISC',ftString,False,False,False,True,'');
   fPlacontajurd := CreateCmDbField('PLACONTAJURD',ftString,False,False,False,True,'');
   fPlacontajurc := CreateCmDbField('PLACONTAJURC',ftString,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fPlacontaatud := CreateCmDbField('PLACONTAATUD',ftString,False,False,False,True,'');
   fPlacontaatuc := CreateCmDbField('PLACONTAATUC',ftString,False,False,False,True,'');
   fPercjurosres := CreateCmDbField('PERCJUROSRES',ftfloat,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fMesultreajuste := CreateCmDbField('MESULTREAJUSTE',ftString,False,False,False,True,'');
   fIndicereajuste := CreateCmDbField('INDICEREAJUSTE',ftfloat,False,False,False,True,'');
   fIndicecorrecao := CreateCmDbField('INDICECORRECAO',ftfloat,False,False,False,True,'');
   fIdtiporeserva := CreateCmDbField('IDTIPORESERVA',ftfloat,True,True,False,True,'');
   fIdrescontroleexc := CreateCmDbField('IDRESCONTROLEEXC',ftfloat,False,False,False,True,'');
   fIdregrapagtorese := CreateCmDbField('IDREGRAPAGTORESE',ftfloat,False,False,False,True,'');
   fIdregracalculore := CreateCmDbField('IDREGRACALCULORE',ftfloat,False,False,False,True,'');
   fIdproduto := CreateCmDbField('IDPRODUTO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,False,False,True,'');
   fFlgtransferencia := CreateCmDbField('FLGTRANSFERENCIA',ftfloat,False,False,False,True,'');
   fFlgtitularcolet := CreateCmDbField('FLGTITULARCOLET',ftString,False,False,False,True,'');
   fFlgtiporeserva := CreateCmDbField('FLGTIPORESERVA',ftfloat,False,False,False,True,'');
   fFlgregressiva := CreateCmDbField('FLGREGRESSIVA',ftfloat,False,False,False,True,'');
   fFlgreajustemensal := CreateCmDbField('FLGREAJUSTEMENSAL',ftfloat,False,False,False,True,'');
   fFlgmudperfil := CreateCmDbField('FLGMUDPERFIL',ftString,False,False,False,True,'');
   fFlgmodatualizacao := CreateCmDbField('FLGMODATUALIZACAO',ftfloat,False,False,False,True,'');
   fFlgdescirrf := CreateCmDbField('FLGDESCIRRF',ftfloat,False,False,False,True,'');
   fFlgcontrole := CreateCmDbField('FLGCONTROLE',ftfloat,False,False,False,True,'');
   fFlgcoletiva := CreateCmDbField('FLGCOLETIVA',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodhierarquia := CreateCmDbField('CODHIERARQUIA',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
   fAnaliticosinteti := CreateCmDbField('ANALITICOSINTETI',ftString,False,False,False,True,'');
end;

function TDBReservaXPlano.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDBReservaXPlano.SetAnaliticosinteti(const Value: TCmDbField);
begin
  FAnaliticosinteti := Value;
end;

procedure TDBReservaXPlano.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDBReservaXPlano.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDBReservaXPlano.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDBReservaXPlano.SetCodhierarquia(const Value: TCmDbField);
begin
  FCodhierarquia := Value;
end;

procedure TDBReservaXPlano.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDBReservaXPlano.SetFlgcoletiva(const Value: TCmDbField);
begin
  FFlgcoletiva := Value;
end;

procedure TDBReservaXPlano.SetFlgcontrole(const Value: TCmDbField);
begin
  FFlgcontrole := Value;
end;

procedure TDBReservaXPlano.SetFlgdescirrf(const Value: TCmDbField);
begin
  FFlgdescirrf := Value;
end;

procedure TDBReservaXPlano.SetFlgmodatualizacao(const Value: TCmDbField);
begin
  FFlgmodatualizacao := Value;
end;

procedure TDBReservaXPlano.SetFlgmudperfil(const Value: TCmDbField);
begin
  FFlgmudperfil := Value;
end;

procedure TDBReservaXPlano.SetFlgreajustemensal(const Value: TCmDbField);
begin
  FFlgreajustemensal := Value;
end;

procedure TDBReservaXPlano.SetFlgregressiva(const Value: TCmDbField);
begin
  FFlgregressiva := Value;
end;

procedure TDBReservaXPlano.SetFlgtiporeserva(const Value: TCmDbField);
begin
  FFlgtiporeserva := Value;
end;

procedure TDBReservaXPlano.SetFlgtitularcolet(const Value: TCmDbField);
begin
  FFlgtitularcolet := Value;
end;

procedure TDBReservaXPlano.SetFlgtransferencia(const Value: TCmDbField);
begin
  FFlgtransferencia := Value;
end;

procedure TDBReservaXPlano.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDBReservaXPlano.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBReservaXPlano.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDBReservaXPlano.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBReservaXPlano.SetIdproduto(const Value: TCmDbField);
begin
  FIdproduto := Value;
end;

procedure TDBReservaXPlano.SetIdregracalculore(const Value: TCmDbField);
begin
  FIdregracalculore := Value;
end;

procedure TDBReservaXPlano.SetIdregrapagtorese(const Value: TCmDbField);
begin
  FIdregrapagtorese := Value;
end;

procedure TDBReservaXPlano.SetIdrescontroleexc(const Value: TCmDbField);
begin
  FIdrescontroleexc := Value;
end;

procedure TDBReservaXPlano.SetIdtiporeserva(const Value: TCmDbField);
begin
  FIdtiporeserva := Value;
end;

procedure TDBReservaXPlano.SetIndicecorrecao(const Value: TCmDbField);
begin
  FIndicecorrecao := Value;
end;

procedure TDBReservaXPlano.SetIndicereajuste(const Value: TCmDbField);
begin
  FIndicereajuste := Value;
end;

procedure TDBReservaXPlano.SetMesultreajuste(const Value: TCmDbField);
begin
  FMesultreajuste := Value;
end;

procedure TDBReservaXPlano.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDBReservaXPlano.SetPercjurosres(const Value: TCmDbField);
begin
  FPercjurosres := Value;
end;

procedure TDBReservaXPlano.SetPlacontaatuc(const Value: TCmDbField);
begin
  FPlacontaatuc := Value;
end;

procedure TDBReservaXPlano.SetPlacontaatud(const Value: TCmDbField);
begin
  FPlacontaatud := Value;
end;

procedure TDBReservaXPlano.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDBReservaXPlano.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDBReservaXPlano.SetPlacontajurc(const Value: TCmDbField);
begin
  FPlacontajurc := Value;
end;

procedure TDBReservaXPlano.SetPlacontajurd(const Value: TCmDbField);
begin
  FPlacontajurd := Value;
end;

procedure TDBReservaXPlano.SetPlacontaprovisc(const Value: TCmDbField);
begin
  FPlacontaprovisc := Value;
end;

procedure TDBReservaXPlano.SetPlacontaprovisd(const Value: TCmDbField);
begin
  FPlacontaprovisd := Value;
end;

procedure TDBReservaXPlano.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDBReservaXPlano.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



