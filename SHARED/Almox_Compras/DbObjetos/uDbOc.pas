{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbOc;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOc = class(TCmDbObject)

  private
    FObsOC: TCmDbField;
    FOCAtendida: TCmDbField;
    FIdForCli: TCmDbField;
    FDataOC: TCmDbField;
    FNumOC: TCmDbField;
    FFlgComSemOC: TCmDbField;
    FFlgTipoFrete: TCmDbField;
    FContato: TCmDbField;
    FFlgImpressa: TCmDbField;
    FFlgComSemCot: TCmDbField;
    FIdProcesso: TCmDbField;
    FIdPessoa: TCmDbField;
    procedure SetContato(const Value: TCmDbField);
    procedure SetDataOC(const Value: TCmDbField);
    procedure SetFlgComSemCot(const Value: TCmDbField);
    procedure SetFlgComSemOC(const Value: TCmDbField);
    procedure SetFlgImpressa(const Value: TCmDbField);
    procedure SetFlgTipoFrete(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetNumOC(const Value: TCmDbField);
    procedure SetObsOC(const Value: TCmDbField);
    procedure SetOCAtendida(const Value: TCmDbField);

  public

     Property OCAtendida   : TCmDbField read FOCAtendida write SetOCAtendida;
     Property ObsOC        : TCmDbField read FObsOC write SetObsOC;
     Property NumOC        : TCmDbField read FNumOC write SetNumOC;
     Property IdProcesso   : TCmDbField read FIdProcesso write SetIdProcesso;
     Property IdPessoa     : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdForCli     : TCmDbField read FIdForCli write SetIdForCli;
     Property FlgTipoFrete : TCmDbField read FFlgTipoFrete write SetFlgTipoFrete;
     Property FlgImpressa  : TCmDbField read FFlgImpressa write SetFlgImpressa;
     Property FlgComSemOC  : TCmDbField read FFlgComSemOC write SetFlgComSemOC;
     Property FlgComSemCot : TCmDbField read FFlgComSemCot write SetFlgComSemCot;
     Property DataOC       : TCmDbField read FDataOC write SetDataOC;
     Property Contato      : TCmDbField read FContato write SetContato;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOc }

constructor TDbOc.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OC';

  fOcatendida   := CreateCmDbField('OCATENDIDA'   ,ftString,False,False,False,True,'');
  fObsoc        := CreateCmDbField('OBSOC'        ,ftString,False,False,False,True,'');
  fNumoc        := CreateCmDbField('NUMOC'        ,ftfloat,True,True,False,True,'');
  fIdprocesso   := CreateCmDbField('IDPROCESSO'   ,ftfloat,False,False,False,True,'');
  fIdpessoa     := CreateCmDbField('IDPESSOA'     ,ftfloat,False,False,False,True,'');
  fIdforcli     := CreateCmDbField('IDFORCLI'     ,ftfloat,False,False,False,True,'');
  fFlgtipofrete := CreateCmDbField('FLGTIPOFRETE' ,ftfloat,False,False,False,True,'');
  fFlgimpressa  := CreateCmDbField('FLGIMPRESSA'  ,ftString,False,False,False,True,'');
  fFlgcomsemoc  := CreateCmDbField('FLGCOMSEMOC'  ,ftString,False,False,False,True,'');
  fFlgcomsemcot := CreateCmDbField('FLGCOMSEMCOT' ,ftString,False,False,False,True,'');
  fDataoc       := CreateCmDbField('DATAOC'       ,ftDateTime,False,False,False,True,'');
  fContato      := CreateCmDbField('CONTATO'      ,ftString,False,False,False,True,'');
end;

function TDbOc.Insert: Boolean;
begin

   fNumoc.AsFloat := GetSequence('OC');
   Result := Inherited Insert;

end;

function TDbOc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbOc.SetContato(const Value: TCmDbField);
begin
  FContato := Value;
end;

procedure TDbOc.SetDataOC(const Value: TCmDbField);
begin
  FDataOC := Value;
end;

procedure TDbOc.SetFlgComSemCot(const Value: TCmDbField);
begin
  FFlgComSemCot := Value;
end;

procedure TDbOc.SetFlgComSemOC(const Value: TCmDbField);
begin
  FFlgComSemOC := Value;
end;

procedure TDbOc.SetFlgImpressa(const Value: TCmDbField);
begin
  FFlgImpressa := Value;
end;

procedure TDbOc.SetFlgTipoFrete(const Value: TCmDbField);
begin
  FFlgTipoFrete := Value;
end;

procedure TDbOc.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbOc.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbOc.SetIdProcesso(const Value: TCmDbField);
begin
  FIdProcesso := Value;
end;

procedure TDbOc.SetNumOC(const Value: TCmDbField);
begin
  FNumOC := Value;
end;

procedure TDbOc.SetObsOC(const Value: TCmDbField);
begin
  FObsOC := Value;
end;

procedure TDbOc.SetOCAtendida(const Value: TCmDbField);
begin
  FOCAtendida := Value;
end;

end.



