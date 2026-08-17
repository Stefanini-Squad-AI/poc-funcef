{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 22/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoagre;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTipoagre = class(TCmDbObject)

  private
    FVlrminimo: TCmDbField;
    FCodtratfiscd: TCmDbField;
    FValpordependente: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FFlglancaimposto: TCmDbField;
    FCodtratfisce: TCmDbField;
    FPercvalor: TCmDbField;
    FFlgacumula: TCmDbField;
    FIdforcli: TCmDbField;
    FFlgincidenfcompl: TCmDbField;
    FCodtipdoc: TCmDbField;
    FFlgincidereceb: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FUnidnegoc: TCmDbField;
    FFlgtipocalc: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FRecpag: TCmDbField;
    FCodalterador: TCmDbField;
    FLancamentoimposto: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgincidecompra: TCmDbField;
    FFlgchecatotal: TCmDbField;
    FVlrabatfixo: TCmDbField;
    FDesccustagreg: TCmDbField;
    FFlgbase: TCmDbField;
    FFlgsemprecalcula: TCmDbField;
    FTotalitem: TCmDbField;
    FFlgcalcvalbruto: TCmDbField;
    FFlgassociaclasfis: TCmDbField;
    FFlgalteraretencao: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetCodtratfiscd(const Value: TCmDbField);
    procedure SetCodtratfisce(const Value: TCmDbField);
    procedure SetDesccustagreg(const Value: TCmDbField);
    procedure SetFlgacumula(const Value: TCmDbField);
    procedure SetFlgalteraretencao(const Value: TCmDbField);
    procedure SetFlgassociaclasfis(const Value: TCmDbField);
    procedure SetFlgbase(const Value: TCmDbField);
    procedure SetFlgcalcvalbruto(const Value: TCmDbField);
    procedure SetFlgchecatotal(const Value: TCmDbField);
    procedure SetFlgincidecompra(const Value: TCmDbField);
    procedure SetFlgincidenfcompl(const Value: TCmDbField);
    procedure SetFlgincidereceb(const Value: TCmDbField);
    procedure SetFlglancaimposto(const Value: TCmDbField);
    procedure SetFlgsemprecalcula(const Value: TCmDbField);
    procedure SetFlgtipocalc(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetLancamentoimposto(const Value: TCmDbField);
    procedure SetPercvalor(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetTotalitem(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValpordependente(const Value: TCmDbField);
    procedure SetVlrabatfixo(const Value: TCmDbField);
    procedure SetVlrminimo(const Value: TCmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Vlrminimo: TCmDbField read FVlrminimo write SetVlrminimo;
     Property Vlrabatfixo: TCmDbField read FVlrabatfixo write SetVlrabatfixo;
     Property Valpordependente: TCmDbField read FValpordependente write SetValpordependente;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Totalitem: TCmDbField read FTotalitem write SetTotalitem;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Percvalor: TCmDbField read FPercvalor write SetPercvalor;
     Property Lancamentoimposto: TCmDbField read FLancamentoimposto write SetLancamentoimposto;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Flgtipocalc: TCmDbField read FFlgtipocalc write SetFlgtipocalc;
     Property Flgsemprecalcula: TCmDbField read FFlgsemprecalcula write SetFlgsemprecalcula;
     Property Flglancaimposto: TCmDbField read FFlglancaimposto write SetFlglancaimposto;
     Property Flgincidereceb: TCmDbField read FFlgincidereceb write SetFlgincidereceb;
     Property Flgincidenfcompl: TCmDbField read FFlgincidenfcompl write SetFlgincidenfcompl;
     Property Flgincidecompra: TCmDbField read FFlgincidecompra write SetFlgincidecompra;
     Property Flgchecatotal: TCmDbField read FFlgchecatotal write SetFlgchecatotal;
     Property Flgcalcvalbruto: TCmDbField read FFlgcalcvalbruto write SetFlgcalcvalbruto;
     Property Flgbase: TCmDbField read FFlgbase write SetFlgbase;
     Property Flgassociaclasfis: TCmDbField read FFlgassociaclasfis write SetFlgassociaclasfis;
     Property Flgalteraretencao: TCmDbField read FFlgalteraretencao write SetFlgalteraretencao;
     Property Flgacumula: TCmDbField read FFlgacumula write SetFlgacumula;
     Property Desccustagreg: TCmDbField read FDesccustagreg write SetDesccustagreg;
     Property Codtratfisce: TCmDbField read FCodtratfisce write SetCodtratfisce;
     Property Codtratfiscd: TCmDbField read FCodtratfiscd write SetCodtratfiscd;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoagre }

constructor TDbTipoagre.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOAGRE';

   fVlrminimo := CreateCmDbField('VLRMINIMO',ftfloat,False,False);
   fVlrabatfixo := CreateCmDbField('VLRABATFIXO',ftfloat,False,False);
   fValpordependente := CreateCmDbField('VALPORDEPENDENTE',ftfloat,False,False);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,);
   fTotalitem := CreateCmDbField('TOTALITEM',ftString,False,False);
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,);
   fPercvalor := CreateCmDbField('PERCVALOR',ftString,False,False);
   fLancamentoimposto := CreateCmDbField('LANCAMENTOIMPOSTO',ftString,False,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False);
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False);
   fFlgtipocalc := CreateCmDbField('FLGTIPOCALC',ftString,False,False);
   fFlgsemprecalcula := CreateCmDbField('FLGSEMPRECALCULA',ftString,False,False);
   fFlglancaimposto := CreateCmDbField('FLGLANCAIMPOSTO',ftString,False,False);
   fFlgincidereceb := CreateCmDbField('FLGINCIDERECEB',ftString,False,False);
   fFlgincidenfcompl := CreateCmDbField('FLGINCIDENFCOMPL',ftString,False,False);
   fFlgincidecompra := CreateCmDbField('FLGINCIDECOMPRA',ftString,False,False);
   fFlgchecatotal := CreateCmDbField('FLGCHECATOTAL',ftString,False,False);
   fFlgcalcvalbruto := CreateCmDbField('FLGCALCVALBRUTO',ftString,False,False);
   fFlgbase := CreateCmDbField('FLGBASE',ftString,False,False);
   fFlgassociaclasfis := CreateCmDbField('FLGASSOCIACLASFIS',ftString,False,False);
   fFlgalteraretencao := CreateCmDbField('FLGALTERARETENCAO',ftString,False,False);
   fFlgacumula := CreateCmDbField('FLGACUMULA',ftString,False,False);
   fDesccustagreg := CreateCmDbField('DESCCUSTAGREG',ftString,False,False);
   fCodtratfisce := CreateCmDbField('CODTRATFISCE',ftString,True,False);
   fCodtratfiscd := CreateCmDbField('CODTRATFISCD',ftString,True,False);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False);
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False);
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False);
end;

function TDbTipoagre.GetSqlSelect: String;
begin
  Result := inherited GetSqlSelect;
end;

function TDbTipoagre.Insert: Boolean;
begin

   fCodtipocustagreg.AsFloat := GetSequence('TIPOAGRE');
   Result := Inherited Insert;

end;

function TDbTipoagre.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoagre.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbTipoagre.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbTipoagre.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbTipoagre.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbTipoagre.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTipoagre.SetCodtratfiscd(const Value: TCmDbField);
begin
  FCodtratfiscd := Value;
end;

procedure TDbTipoagre.SetCodtratfisce(const Value: TCmDbField);
begin
  FCodtratfisce := Value;
end;

procedure TDbTipoagre.SetDesccustagreg(const Value: TCmDbField);
begin
  FDesccustagreg := Value;
end;

procedure TDbTipoagre.SetFlgacumula(const Value: TCmDbField);
begin
  FFlgacumula := Value;
end;

procedure TDbTipoagre.SetFlgalteraretencao(const Value: TCmDbField);
begin
  FFlgalteraretencao := Value;
end;

procedure TDbTipoagre.SetFlgassociaclasfis(const Value: TCmDbField);
begin
  FFlgassociaclasfis := Value;
end;

procedure TDbTipoagre.SetFlgbase(const Value: TCmDbField);
begin
  FFlgbase := Value;
end;

procedure TDbTipoagre.SetFlgcalcvalbruto(const Value: TCmDbField);
begin
  FFlgcalcvalbruto := Value;
end;

procedure TDbTipoagre.SetFlgchecatotal(const Value: TCmDbField);
begin
  FFlgchecatotal := Value;
end;

procedure TDbTipoagre.SetFlgincidecompra(const Value: TCmDbField);
begin
  FFlgincidecompra := Value;
end;

procedure TDbTipoagre.SetFlgincidenfcompl(const Value: TCmDbField);
begin
  FFlgincidenfcompl := Value;
end;

procedure TDbTipoagre.SetFlgincidereceb(const Value: TCmDbField);
begin
  FFlgincidereceb := Value;
end;

procedure TDbTipoagre.SetFlglancaimposto(const Value: TCmDbField);
begin
  FFlglancaimposto := Value;
end;

procedure TDbTipoagre.SetFlgsemprecalcula(const Value: TCmDbField);
begin
  FFlgsemprecalcula := Value;
end;

procedure TDbTipoagre.SetFlgtipocalc(const Value: TCmDbField);
begin
  FFlgtipocalc := Value;
end;

procedure TDbTipoagre.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbTipoagre.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTipoagre.SetLancamentoimposto(const Value: TCmDbField);
begin
  FLancamentoimposto := Value;
end;

procedure TDbTipoagre.SetPercvalor(const Value: TCmDbField);
begin
  FPercvalor := Value;
end;

procedure TDbTipoagre.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbTipoagre.SetTotalitem(const Value: TCmDbField);
begin
  FTotalitem := Value;
end;

procedure TDbTipoagre.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbTipoagre.SetValpordependente(const Value: TCmDbField);
begin
  FValpordependente := Value;
end;

procedure TDbTipoagre.SetVlrabatfixo(const Value: TCmDbField);
begin
  FVlrabatfixo := Value;
end;

procedure TDbTipoagre.SetVlrminimo(const Value: TCmDbField);
begin
  FVlrminimo := Value;
end;

end.



