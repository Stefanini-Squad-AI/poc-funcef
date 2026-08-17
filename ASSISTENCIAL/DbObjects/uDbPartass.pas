{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbPartass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPartass = class(TCmDbObject)

  private
    FTipofornserv2: TCmDbField;
    FSeqproposta: TCmDbField;
    FOpcaobdif: TCmDbField;
    FOpcaob: TCmDbField;
    FOpcaoaident: TCmDbField;
    FOpcaoa: TCmDbField;
    FObscancel: TCmDbField;
    FInscricaotipo: TCmDbField;
    FInscricaonumero: TCmDbField;
    FIdsitpart: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdplanass: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdpessjur: TCmDbField;
    FIdnucleo: TCmDbField;
    FIdfornserv2: TCmDbField;
    FFlgpartbenef: TCmDbField;
    FFlgopcaob: TCmDbField;
    FFlgopcaoa: TCmDbField;
    FFlginscricaocanc: TCmDbField;
    FDataentrada: TCmDbField;
    FDatacancelamento: TCmDbField;
    FComissfund: TCmDbField;
    FComissforn: TCmDbField;
    procedure SetTipoFornServ2(const Value: TCmDbField);
    procedure SetSeqProposta(const Value: TCmDbField);
    procedure SetOpcaoBDif(const Value: TCmDbField);
    procedure SetOpcaoB(const Value: TCmDbField);
    procedure SetOpcaoAIdent(const Value: TCmDbField);
    procedure SetOpcaoA(const Value: TCmDbField);
    procedure SetObsCancel(const Value: TCmDbField);
    procedure SetInscricaoTipo(const Value: TCmDbField);
    procedure SetInscricaoNumero(const Value: TCmDbField);
    procedure SetIdSitPart(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);
    procedure SetIdPlanass(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdPessJur(const Value: TCmDbField);
    procedure SetIdNucleo(const Value: TCmDbField);
    procedure SetIdFornServ2(const Value: TCmDbField);
    procedure SetFlgPartBenef(const Value: TCmDbField);
    procedure SetFlgOpcaoB(const Value: TCmDbField);
    procedure SetFlgOpcaoA(const Value: TCmDbField);
    procedure SetFlgInscricaoCanc(const Value: TCmDbField);
    procedure SetDataEntrada(const Value: TCmDbField);
    procedure SetDataCancelamento(const Value: TCmDbField);
    procedure SetComissFund(const Value: TCmDbField);
    procedure SetComissForn(const Value: TCmDbField);

  public
     Property TipoFornServ2: TCmDbField read FTipoFornServ2 write SetTipoFornServ2;
     Property SeqProposta: TCmDbField read FSeqProposta write SetSeqProposta;
     Property OpcaoBDif: TCmDbField read FOpcaoBDif write SetOpcaoBDif;
     Property OpcaoB: TCmDbField read FOpcaoB write SetOpcaoB;
     Property OpcaoAIdent: TCmDbField read FOpcaoAIdent write SetOpcaoAIdent;
     Property OpcaoA: TCmDbField read FOpcaoA write SetOpcaoA;
     Property ObsCancel: TCmDbField read FObsCancel write SetObsCancel;
     Property InscricaoTipo: TCmDbField read FInscricaoTipo write SetInscricaoTipo;
     Property InscricaoNumero: TCmDbField read FInscricaoNumero write SetInscricaoNumero;
     Property IdSitPart: TCmDbField read FIdSitPart write SetIdSitPart;
     Property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     Property IdPlanAss: TCmDbField read FIdPlanAss write SetIdPlanAss;
     Property IdPessoa: TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdPessJur: TCmDbField read FIdPessJur write SetIdPessJur;
     Property IdNucleo: TCmDbField read FIdNucleo write SetIdNucleo;
     Property IdFornServ2: TCmDbField read FIdFornServ2 write SetIdFornServ2;
     Property FlgPartBenef: TCmDbField read FFlgPartBenef write SetFlgPartBenef;
     Property FlgOpcaoB: TCmDbField read FFlgOpcaoB write SetFlgOpcaoB;
     Property FlgOpcaoA: TCmDbField read FFlgOPcaoA write SetFlgOPcaoA;
     Property FlgInscricaoCanc: TCmDbField read FFlgInscricaoCanc write SetFlgInscricaoCanc;
     Property DataEntrada: TCmDbField read FDataEntrada write SetDataEntrada;
     Property DataCancelamento: TCmDbField read FDataCancelamento write SetDataCancelamento;
     Property ComissFund: TCmDbField read FComissFund write SetComissFund;
     Property ComissForn: TCmDbField read FComissForn write SetComissForn;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPartass }

constructor TDbPartass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARTASS';

  fTipofornserv2 := CreateCmDbField('TIPOFORNSERV2',ftString,True,False);
  fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True);
  fOpcaobdif := CreateCmDbField('OPCAOBDIF',ftString,True,False);
  fOpcaob := CreateCmDbField('OPCAOB',ftString,True,False);
  fOpcaoaident := CreateCmDbField('OPCAOAIDENT',ftString,True,False);
  fOpcaoa := CreateCmDbField('OPCAOA',ftString,True,False);
  fObscancel := CreateCmDbField('OBSCANCEL',ftString,True,False);
  fInscricaotipo := CreateCmDbField('INSCRICAOTIPO',ftString,True,False);
  fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftString,True,False);
  fIdsitpart := CreateCmDbField('IDSITPART',ftfloat,True,False);
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
  fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
  fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
  fIdnucleo := CreateCmDbField('IDNUCLEO',ftfloat,True,False);
  fIdfornserv2 := CreateCmDbField('IDFORNSERV2',ftfloat,True,False);
  fFlgpartbenef := CreateCmDbField('FLGPARTBENEF',ftString,True,False);
  fFlgopcaob := CreateCmDbField('FLGOPCAOB',ftfloat,True,False);
  fFlgopcaoa := CreateCmDbField('FLGOPCAOA',ftfloat,True,False);
  fFlginscricaocanc := CreateCmDbField('FLGINSCRICAOCANC',ftfloat,True,False);
  fDataentrada := CreateCmDbField('DATAENTRADA',ftDateTime,True,False);
  fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,True,False);
  fComissfund := CreateCmDbField('COMISSFUND',ftfloat,True,False);
  fComissforn := CreateCmDbField('COMISSFORN',ftfloat,True,False);

  FLGINSCRICAOCANC.NullIfZero:=True;
  IDFORNSERV2.NullIfZero:=True;
  COMISSFORN.NullIfZero:=True;
  COMISSFUND.NullIfZero:=True;
  FLGOPCAOA.NullIfZero:=True;
  FLGOPCAOB.NullIfZero:=True;
  IDNUCLEO.NullIfZero:=True;

  IDPESSJUR.Required:=True;
  SEQPROPOSTA.Required:=True;
  IDPLANOPREV.Required:=True;
  IDPESSOA.Required:=True;
  IDPLANASS.Required:=True;
  IDSITPART.Required:=False;
  DATAENTRADA.Required:=False;
  FLGINSCRICAOCANC.Required:=False;
  INSCRICAONUMERO.Required:=False;
  DATACANCELAMENTO.Required:=False;
  INSCRICAOTIPO.Required:=False;
  OBSCANCEL.Required:=False;
  FLGPARTBENEF.Required:=False;
  OPCAOA.Required:=False;
  OPCAOB.Required:=False;
  IDFORNSERV2.Required:=False;
  COMISSFORN.Required:=False;
  COMISSFUND.Required:=False;
  FLGOPCAOA.Required:=False;
  TIPOFORNSERV2.Required:=False;
  FLGOPCAOB.Required:=False;
  IDNUCLEO.Required:=False;
  OPCAOBDIF.Required:=False;
  OPCAOAIDENT.Required:=False;
end;

function TDbPartass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbPartass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbPartass.SetTipoFornServ2(const Value: TCmDbField);
begin
  FTipoFornServ2:=Value;
end;

procedure TDbPartass.SetSeqProposta(const Value: TCmDbField);
begin
  FSeqProposta:=Value;
end;

procedure TDbPartass.SetOpcaoBDif(const Value: TCmDbField);
begin
  FOpcaoBDif:=Value;
end;

procedure TDbPartass.SetOpcaoB(const Value: TCmDbField);
begin
  FOpcaoB:=Value;
end;

procedure TDbPartass.SetOpcaoAIdent(const Value: TCmDbField);
begin
  FOpcaoAIdent:=Value;
end;

procedure TDbPartass.SetOpcaoA(const Value: TCmDbField);
begin
  FOpcaoA:=Value;
end;

procedure TDbPartass.SetObsCancel(const Value: TCmDbField);
begin
  FObsCancel:=Value;
end;

procedure TDbPartass.SetInscricaoTipo(const Value: TCmDbField);
begin
  FInscricaoTipo:=Value;
end;

procedure TDbPartass.SetInscricaoNumero(const Value: TCmDbField);
begin
  FInscricaoNumero:=Value;
end;

procedure TDbPartass.SetIdSitPart(const Value: TCmDbField);
begin
  FIdSitPart:=Value;
end;

procedure TDbPartass.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev:=Value;
end;

procedure TDbPartass.SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure TDbPartass.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa:=Value;
end;

procedure TDbPartass.SetIdPessJur(const Value: TCmDbField);
begin
  FIdPessJur :=Value;
end;

procedure TDbPartass.SetIdNucleo(const Value: TCmDbField);
begin
  FIdNucleo :=Value;
end;

procedure TDbPartass.SetIdFornServ2(const Value: TCmDbField);
begin
  FIdFornServ2 :=Value;
end;

procedure TDbPartass.SetFlgPartBenef(const Value: TCmDbField);
begin
  FFlgPartBenef:=Value;
end;

procedure TDbPartass.SetFlgOpcaoB(const Value: TCmDbField);
begin
  FFlgOpcaoB:=Value;
end;

procedure TDbPartass.SetFlgOpcaoA(const Value: TCmDbField);
begin
  FFlgOpcaoA :=Value;
end;

procedure TDbPartass.SetFlgInscricaoCanc(const Value: TCmDbField);
begin
  FFlgInscricaoCanc:=Value;
end;

procedure TDbPartass.SetDataEntrada(const Value: TCmDbField);
begin
  FDataEntrada:=Value;
end;

procedure TDbPartass.SetDataCancelamento(const Value: TCmDbField);
begin
  FDataCancelamento:=Value;
end;

procedure TDbPartass.SetComissFund(const Value: TCmDbField);
begin
  FComissFund:=Value;
end;

procedure TDbPartass.SetComissForn(const Value: TCmDbField);
begin
  FComissForn:=Value;
end;

end.



