{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/02/2006                             }
{                                                       }
{*******************************************************}

unit uDbBeneficio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBeneficio = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FIdtpbeneficio: TCmDbField;
    FFlgresgate: TCmDbField;
    FCodbeneficio: TCmDbField;
    FFlgusadtprevisao: TCmDbField;
    FTipobeneficio: TCmDbField;
    FFlgassocbenefref: TCmDbField;
    FFlgdestbenef: TCmDbField;
    FFlgbenefprov: TCmDbField;
    FFlgcobertvitalic: TCmDbField;
    FFlgbenefobrigato: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdeventogerador: TCmDbField;
    FIdregralinhaspc: TCmDbField;
    FIdbeneficio: TCmDbField;
    FIdtppagtobenefic: TCmDbField;
    FFlgbeneftemp: TCmDbField;
    FPrazoprovisorio: TCmDbField;
    FFlgvoltasitant: TCmDbField;
    FFlgpeculio: TCmDbField;
    FDescrub: TCmDbField;
    FNumordemevento: TCmDbField;
    FCodnatureza: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FFlgrubsregra: TCmDbField;
    FCodbenefspc: TCmDbField;
    procedure SetCodbeneficio(const Value: TCmDbField);
    procedure SetCodbenefspc(const Value: TCmDbField);
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetDescrub(const Value: TCmDbField);
    procedure SetFlgassocbenefref(const Value: TCmDbField);
    procedure SetFlgbenefobrigato(const Value: TCmDbField);
    procedure SetFlgbenefprov(const Value: TCmDbField);
    procedure SetFlgbeneftemp(const Value: TCmDbField);
    procedure SetFlgcobertvitalic(const Value: TCmDbField);
    procedure SetFlgdestbenef(const Value: TCmDbField);
    procedure SetFlgpeculio(const Value: TCmDbField);
    procedure SetFlgresgate(const Value: TCmDbField);
    procedure SetFlgrubsregra(const Value: TCmDbField);
    procedure SetFlgusadtprevisao(const Value: TCmDbField);
    procedure SetFlgvoltasitant(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdeventogerador(const Value: TCmDbField);
    procedure SetIdregralinhaspc(const Value: TCmDbField);
    procedure SetIdtpbeneficio(const Value: TCmDbField);
    procedure SetIdtppagtobenefic(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumordemevento(const Value: TCmDbField);
    procedure SetPrazoprovisorio(const Value: TCmDbField);
    procedure SetTipobeneficio(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipobeneficio: TCmDbField read FTipobeneficio write SetTipobeneficio;
     Property Prazoprovisorio: TCmDbField read FPrazoprovisorio write SetPrazoprovisorio;
     Property Numordemevento: TCmDbField read FNumordemevento write SetNumordemevento;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtppagtobenefic: TCmDbField read FIdtppagtobenefic write SetIdtppagtobenefic;
     Property Idtpbeneficio: TCmDbField read FIdtpbeneficio write SetIdtpbeneficio;
     Property Idregralinhaspc: TCmDbField read FIdregralinhaspc write SetIdregralinhaspc;
     Property Ideventogerador: TCmDbField read FIdeventogerador write SetIdeventogerador;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Flgvoltasitant: TCmDbField read FFlgvoltasitant write SetFlgvoltasitant;
     Property Flgusadtprevisao: TCmDbField read FFlgusadtprevisao write SetFlgusadtprevisao;
     Property Flgrubsregra: TCmDbField read FFlgrubsregra write SetFlgrubsregra;
     Property Flgresgate: TCmDbField read FFlgresgate write SetFlgresgate;
     Property Flgpeculio: TCmDbField read FFlgpeculio write SetFlgpeculio;
     Property Flgdestbenef: TCmDbField read FFlgdestbenef write SetFlgdestbenef;
     Property Flgcobertvitalic: TCmDbField read FFlgcobertvitalic write SetFlgcobertvitalic;
     Property Flgbeneftemp: TCmDbField read FFlgbeneftemp write SetFlgbeneftemp;
     Property Flgbenefprov: TCmDbField read FFlgbenefprov write SetFlgbenefprov;
     Property Flgbenefobrigato: TCmDbField read FFlgbenefobrigato write SetFlgbenefobrigato;
     Property Flgassocbenefref: TCmDbField read FFlgassocbenefref write SetFlgassocbenefref;
     Property Descrub: TCmDbField read FDescrub write SetDescrub;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Codbenefspc: TCmDbField read FCodbenefspc write SetCodbenefspc;
     Property Codbeneficio: TCmDbField read FCodbeneficio write SetCodbeneficio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBeneficio }

constructor TDbBeneficio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFICIO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipobeneficio := CreateCmDbField('TIPOBENEFICIO',ftfloat,False,False,False,True,'');
   fPrazoprovisorio := CreateCmDbField('PRAZOPROVISORIO',ftfloat,False,False,False,True,'');
   fNumordemevento := CreateCmDbField('NUMORDEMEVENTO',ftfloat,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdtppagtobenefic := CreateCmDbField('IDTPPAGTOBENEFIC',ftfloat,False,False,False,True,'');
   fIdtpbeneficio := CreateCmDbField('IDTPBENEFICIO',ftfloat,False,False,False,True,'');
   fIdregralinhaspc := CreateCmDbField('IDREGRALINHASPC',ftfloat,False,False,False,True,'');
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,True,False,True,'');
   fFlgvoltasitant := CreateCmDbField('FLGVOLTASITANT',ftfloat,False,False,False,True,'');
   fFlgusadtprevisao := CreateCmDbField('FLGUSADTPREVISAO',ftfloat,False,False,False,True,'');
   fFlgrubsregra := CreateCmDbField('FLGRUBSREGRA',ftfloat,False,False,False,True,'');
   fFlgresgate := CreateCmDbField('FLGRESGATE',ftfloat,False,False,False,True,'');
   fFlgpeculio := CreateCmDbField('FLGPECULIO',ftfloat,False,False,False,True,'');
   fFlgdestbenef := CreateCmDbField('FLGDESTBENEF',ftString,False,False,False,True,'');
   fFlgcobertvitalic := CreateCmDbField('FLGCOBERTVITALIC',ftfloat,False,False,False,True,'');
   fFlgbeneftemp := CreateCmDbField('FLGBENEFTEMP',ftfloat,False,False,False,True,'');
   fFlgbenefprov := CreateCmDbField('FLGBENEFPROV',ftfloat,False,False,False,True,'');
   fFlgbenefobrigato := CreateCmDbField('FLGBENEFOBRIGATO',ftfloat,True,False,False,True,'');
   fFlgassocbenefref := CreateCmDbField('FLGASSOCBENEFREF',ftfloat,False,False,False,True,'');
   fDescrub := CreateCmDbField('DESCRUB',ftString,False,False,False,True,'');
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,False,False,False,True,'');
   fCodbenefspc := CreateCmDbField('CODBENEFSPC',ftString,False,False,False,True,'');
   fCodbeneficio := CreateCmDbField('CODBENEFICIO',ftString,False,False,False,True,'');
end;

function TDbBeneficio.Insert: Boolean;
begin

   fIdbeneficio.AsFloat := GetSequence('BENEFICIO');
   Result := Inherited Insert;

end;


procedure TDbBeneficio.SetCodbeneficio(const Value: TCmDbField);
begin
  FCodbeneficio := Value;
end;

procedure TDbBeneficio.SetCodbenefspc(const Value: TCmDbField);
begin
  FCodbenefspc := Value;
end;

procedure TDbBeneficio.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbBeneficio.SetDescrub(const Value: TCmDbField);
begin
  FDescrub := Value;
end;

procedure TDbBeneficio.SetFlgassocbenefref(const Value: TCmDbField);
begin
  FFlgassocbenefref := Value;
end;

procedure TDbBeneficio.SetFlgbenefobrigato(const Value: TCmDbField);
begin
  FFlgbenefobrigato := Value;
end;

procedure TDbBeneficio.SetFlgbenefprov(const Value: TCmDbField);
begin
  FFlgbenefprov := Value;
end;

procedure TDbBeneficio.SetFlgbeneftemp(const Value: TCmDbField);
begin
  FFlgbeneftemp := Value;
end;

procedure TDbBeneficio.SetFlgcobertvitalic(const Value: TCmDbField);
begin
  FFlgcobertvitalic := Value;
end;

procedure TDbBeneficio.SetFlgdestbenef(const Value: TCmDbField);
begin
  FFlgdestbenef := Value;
end;

procedure TDbBeneficio.SetFlgpeculio(const Value: TCmDbField);
begin
  FFlgpeculio := Value;
end;

procedure TDbBeneficio.SetFlgresgate(const Value: TCmDbField);
begin
  FFlgresgate := Value;
end;

procedure TDbBeneficio.SetFlgrubsregra(const Value: TCmDbField);
begin
  FFlgrubsregra := Value;
end;

procedure TDbBeneficio.SetFlgusadtprevisao(const Value: TCmDbField);
begin
  FFlgusadtprevisao := Value;
end;

procedure TDbBeneficio.SetFlgvoltasitant(const Value: TCmDbField);
begin
  FFlgvoltasitant := Value;
end;

procedure TDbBeneficio.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbBeneficio.SetIdeventogerador(const Value: TCmDbField);
begin
  FIdeventogerador := Value;
end;

procedure TDbBeneficio.SetIdregralinhaspc(const Value: TCmDbField);
begin
  FIdregralinhaspc := Value;
end;

procedure TDbBeneficio.SetIdtpbeneficio(const Value: TCmDbField);
begin
  FIdtpbeneficio := Value;
end;

procedure TDbBeneficio.SetIdtppagtobenefic(const Value: TCmDbField);
begin
  FIdtppagtobenefic := Value;
end;

procedure TDbBeneficio.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbBeneficio.SetNumordemevento(const Value: TCmDbField);
begin
  FNumordemevento := Value;
end;

procedure TDbBeneficio.SetPrazoprovisorio(const Value: TCmDbField);
begin
  FPrazoprovisorio := Value;
end;

procedure TDbBeneficio.SetTipobeneficio(const Value: TCmDbField);
begin
  FTipobeneficio := Value;
end;

procedure TDbBeneficio.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbBeneficio.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



