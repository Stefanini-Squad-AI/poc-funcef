{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbNflivro;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbNflivro = class(TCmDbObject)

  private
    FIdforcli: TCmDbField;
    FIdpessoa: TCmDbField;
    FSubstitutrib: TCmDbField;
    FContadorreducaoz: TCmDbField;
    FTotalizadorfim: TCmDbField;
    FTotalizadorini: TCmDbField;
    FTipocli: TCmDbField;
    FNomecli: TCmDbField;
    FContadorini: TCmDbField;
    FDataentradanf: TCmDbField;
    FContadorfim: TCmDbField;
    FCancelamento: TCmDbField;
    FCodmodelo: TCmDbField;
    FIdmaquinaecf: TCmDbField;
    FVlrtotalnf: TCmDbField;
    FNfcomplemento: TCmDbField;
    FNumnffim: TCmDbField;
    FDesconto: TCmDbField;
    FIdnflivro: TCmDbField;
    FNumfatura: TCmDbField;
    FDataemissaonf: TCmDbField;
    FFlgentradasaida: TCmDbField;
    FNumnfini: TCmDbField;
    FObservacao: TCmDbField;
    FDoccli: TCmDbField;
    FTotalizadorISS: TcmDbField;
    FContOrdOper: TcmDbField;
    FVlrSmartCard: TcmDbField;
    procedure SetCancelamento(const Value: TCmDbField);
    procedure SetCodmodelo(const Value: TCmDbField);
    procedure SetContadorfim(const Value: TCmDbField);
    procedure SetContadorini(const Value: TCmDbField);
    procedure SetContadorreducaoz(const Value: TCmDbField);
    procedure SetDataemissaonf(const Value: TCmDbField);
    procedure SetDataentradanf(const Value: TCmDbField);
    procedure SetDesconto(const Value: TCmDbField);
    procedure SetDoccli(const Value: TCmDbField);
    procedure SetFlgentradasaida(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdmaquinaecf(const Value: TCmDbField);
    procedure SetIdnflivro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNfcomplemento(const Value: TCmDbField);
    procedure SetNomecli(const Value: TCmDbField);
    procedure SetNumfatura(const Value: TCmDbField);
    procedure SetNumnffim(const Value: TCmDbField);
    procedure SetNumnfini(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetSubstitutrib(const Value: TCmDbField);
    procedure SetTipocli(const Value: TCmDbField);
    procedure SetTotalizadorfim(const Value: TCmDbField);
    procedure SetTotalizadorini(const Value: TCmDbField);
    procedure SetVlrtotalnf(const Value: TCmDbField);
    procedure SetTotalizadorISS(const Value: TcmDbField);
    procedure SetContOrdOper(const Value: TcmDbField);
    procedure SetVlrSmartCard(const Value: TcmDbField);

  public

     Property Vlrtotalnf: TCmDbField read FVlrtotalnf write SetVlrtotalnf;
     Property Totalizadorini: TCmDbField read FTotalizadorini write SetTotalizadorini;
     Property Totalizadorfim: TCmDbField read FTotalizadorfim write SetTotalizadorfim;
     Property Tipocli: TCmDbField read FTipocli write SetTipocli;
     Property Substitutrib: TCmDbField read FSubstitutrib write SetSubstitutrib;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numnfini: TCmDbField read FNumnfini write SetNumnfini;
     Property Numnffim: TCmDbField read FNumnffim write SetNumnffim;
     Property Numfatura: TCmDbField read FNumfatura write SetNumfatura;
     Property Nomecli: TCmDbField read FNomecli write SetNomecli;
     Property Nfcomplemento: TCmDbField read FNfcomplemento write SetNfcomplemento;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idnflivro: TCmDbField read FIdnflivro write SetIdnflivro;
     Property Idmaquinaecf: TCmDbField read FIdmaquinaecf write SetIdmaquinaecf;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Flgentradasaida: TCmDbField read FFlgentradasaida write SetFlgentradasaida;
     Property Doccli: TCmDbField read FDoccli write SetDoccli;
     Property Desconto: TCmDbField read FDesconto write SetDesconto;
     Property Dataentradanf: TCmDbField read FDataentradanf write SetDataentradanf;
     Property Dataemissaonf: TCmDbField read FDataemissaonf write SetDataemissaonf;
     Property Contadorreducaoz: TCmDbField read FContadorreducaoz write SetContadorreducaoz;
     Property Contadorini: TCmDbField read FContadorini write SetContadorini;
     Property Contadorfim: TCmDbField read FContadorfim write SetContadorfim;
     Property Codmodelo: TCmDbField read FCodmodelo write SetCodmodelo;
     Property Cancelamento: TCmDbField read FCancelamento write SetCancelamento;
     Property TotalizadorISS : TcmDbField read FTotalizadorISS write SetTotalizadorISS;
     Property VlrSmartCard : TcmDbField read FVlrSmartCard write SetVlrSmartCard;
     Property ContOrdOper : TcmDbField read FContOrdOper write SetContOrdOper;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbNflivro }

constructor TDbNflivro.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NFLIVRO';

   fVlrtotalnf := CreateCmDbField('VLRTOTALNF',ftfloat,False,False);
   fTotalizadorini := CreateCmDbField('TOTALIZADORINI',ftfloat,False,False);
   fTotalizadorfim := CreateCmDbField('TOTALIZADORFIM',ftfloat,False,False);
   fTipocli := CreateCmDbField('TIPOCLI',ftString,False,False);
   fSubstitutrib := CreateCmDbField('SUBSTITUTRIB',ftfloat,False,False);
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False);
   fNumnfini := CreateCmDbField('NUMNFINI',ftfloat,False,False);
   fNumnffim := CreateCmDbField('NUMNFFIM',ftfloat,False,False);
   fNumfatura := CreateCmDbField('NUMFATURA',ftString,False,False);
   fNomecli := CreateCmDbField('NOMECLI',ftString,False,False);
   fNfcomplemento := CreateCmDbField('NFCOMPLEMENTO',ftString,False,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False);
   fIdnflivro := CreateCmDbField('IDNFLIVRO',ftfloat,True,True);
   fIdmaquinaecf := CreateCmDbField('IDMAQUINAECF',ftfloat,False,False);
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False);
   fFlgentradasaida := CreateCmDbField('FLGENTRADASAIDA',ftString,False,False);
   fDoccli := CreateCmDbField('DOCCLI',ftString,False,False);
   fDesconto := CreateCmDbField('DESCONTO',ftfloat,False,False);
   fDataentradanf := CreateCmDbField('DATAENTRADANF',ftDateTime,False,False);
   fDataemissaonf := CreateCmDbField('DATAEMISSAONF',ftDateTime,False,False);
   fContadorreducaoz := CreateCmDbField('CONTADORREDUCAOZ',ftfloat,False,False);
   fContadorini := CreateCmDbField('CONTADORINI',ftfloat,False,False);
   fContadorfim := CreateCmDbField('CONTADORFIM',ftfloat,False,False);
   fCodmodelo := CreateCmDbField('CODMODELO',ftString,False,False);
   fCancelamento := CreateCmDbField('CANCELAMENTO',ftfloat,False,False);
   FTotalizadorISS := CreateCmDbField('TOTALIZADORISS',ftfloat,False,False);
   FVlrSmartCard := CreateCmDbField('VLRSMARTCARD',ftfloat,False,False);
   FContOrdOper  := CreateCmDbField('CONTORDOPER',ftfloat,False,False);
end;

function TDbNflivro.Insert: Boolean;
begin

   fIdnflivro.AsFloat := GetSequence('NFLIVRO');
   Result := Inherited Insert;

end;

function TDbNflivro.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbNflivro.SetCancelamento(const Value: TCmDbField);
begin
  FCancelamento := Value;
end;

procedure TDbNflivro.SetCodmodelo(const Value: TCmDbField);
begin
  FCodmodelo := Value;
end;

procedure TDbNflivro.SetContadorfim(const Value: TCmDbField);
begin
  FContadorfim := Value;
end;

procedure TDbNflivro.SetContadorini(const Value: TCmDbField);
begin
  FContadorini := Value;
end;

procedure TDbNflivro.SetContadorreducaoz(const Value: TCmDbField);
begin
  FContadorreducaoz := Value;
end;

procedure TDbNflivro.SetContOrdOper(const Value: TcmDbField);
begin
  FContOrdOper := Value;
end;

procedure TDbNflivro.SetDataemissaonf(const Value: TCmDbField);
begin
  FDataemissaonf := Value;
end;

procedure TDbNflivro.SetDataentradanf(const Value: TCmDbField);
begin
  FDataentradanf := Value;
end;

procedure TDbNflivro.SetDesconto(const Value: TCmDbField);
begin
  FDesconto := Value;
end;

procedure TDbNflivro.SetDoccli(const Value: TCmDbField);
begin
  FDoccli := Value;
end;

procedure TDbNflivro.SetFlgentradasaida(const Value: TCmDbField);
begin
  FFlgentradasaida := Value;
end;

procedure TDbNflivro.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbNflivro.SetIdmaquinaecf(const Value: TCmDbField);
begin
  FIdmaquinaecf := Value;
end;

procedure TDbNflivro.SetIdnflivro(const Value: TCmDbField);
begin
  FIdnflivro := Value;
end;

procedure TDbNflivro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbNflivro.SetNfcomplemento(const Value: TCmDbField);
begin
  FNfcomplemento := Value;
end;

procedure TDbNflivro.SetNomecli(const Value: TCmDbField);
begin
  FNomecli := Value;
end;

procedure TDbNflivro.SetNumfatura(const Value: TCmDbField);
begin
  FNumfatura := Value;
end;

procedure TDbNflivro.SetNumnffim(const Value: TCmDbField);
begin
  FNumnffim := Value;
end;

procedure TDbNflivro.SetNumnfini(const Value: TCmDbField);
begin
  FNumnfini := Value;
end;

procedure TDbNflivro.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbNflivro.SetSubstitutrib(const Value: TCmDbField);
begin
  FSubstitutrib := Value;
end;

procedure TDbNflivro.SetTipocli(const Value: TCmDbField);
begin
  FTipocli := Value;
end;

procedure TDbNflivro.SetTotalizadorfim(const Value: TCmDbField);
begin
  FTotalizadorfim := Value;
end;

procedure TDbNflivro.SetTotalizadorini(const Value: TCmDbField);
begin
  FTotalizadorini := Value;
end;

procedure TDbNflivro.SetTotalizadorISS(const Value: TcmDbField);
begin
  FTotalizadorISS := Value;
end;

procedure TDbNflivro.SetVlrSmartCard(const Value: TcmDbField);
begin
  FVlrSmartCard := Value;
end;

procedure TDbNflivro.SetVlrtotalnf(const Value: TCmDbField);
begin
  FVlrtotalnf := Value;
end;

end.



