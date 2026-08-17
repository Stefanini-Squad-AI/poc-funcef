{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbPredetalhe;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPredetalhe = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FPanccustobase: TCmDbField;
    FPancodigo: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FPannumlanc: TCmDbField;
    FIdempresa: TCmDbField;
    FPantipo: TCmDbField;
    FPanorigem: TCmDbField;
    FTipcodigo: TCmDbField;
    FPlaconta: TCmDbField;
    FPanperc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPanbase: TCmDbField;
    FHitcodhist: TCmDbField;
    FPlano: TCmDbField;
    FIdpatro: TCmDbField;
    FPantipobase: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPancontabase: TCmDbField;
    FNumdoc: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FIdSegregaCriter: TCmDbField;
    FNumOrdem: TCmDbField;
    FDataVigPrePlanilha: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetNumdoc(const Value: TCmDbField);
    procedure SetPanbase(const Value: TCmDbField);
    procedure SetPanccustobase(const Value: TCmDbField);
    procedure SetPancodigo(const Value: TCmDbField);
    procedure SetPancontabase(const Value: TCmDbField);
    procedure SetPannumlanc(const Value: TCmDbField);
    procedure SetPanorigem(const Value: TCmDbField);
    procedure SetPanperc(const Value: TCmDbField);
    procedure SetPantipo(const Value: TCmDbField);
    procedure SetPantipobase(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetIdSegregaCriter(const Value: TCmDbField);
    procedure SetNumOrdem(const Value: TCmDbField);
    procedure SetDataVigPrePlanilha(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Pantipobase: TCmDbField read FPantipobase write SetPantipobase;
     Property Pantipo: TCmDbField read FPantipo write SetPantipo;
     Property Panperc: TCmDbField read FPanperc write SetPanperc;
     Property Panorigem: TCmDbField read FPanorigem write SetPanorigem;
     Property Pannumlanc: TCmDbField read FPannumlanc write SetPannumlanc;
     Property Pancontabase: TCmDbField read FPancontabase write SetPancontabase;
     Property Pancodigo: TCmDbField read FPancodigo write SetPancodigo;
     Property Panccustobase: TCmDbField read FPanccustobase write SetPanccustobase;
     Property Panbase: TCmDbField read FPanbase write SetPanbase;
     Property Numdoc: TCmDbField read FNumdoc write SetNumdoc;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Hitcodhist: TCmDbField read FHitcodhist write SetHitcodhist;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property IdSegregaCriter: TCmDbField read FIdSegregaCriter write SetIdSegregaCriter;
     Property NumOrdem: TCmDbField read FNumOrdem write SetNumOrdem;
     //Cássio - SOL Nº 116466 KINTANA Nº 550163
     //Criação do campo DATAVIGPREPLANILHA
     property DataVigPrePlanilha : TCmDbField read FDataVigPrePlanilha write SetDataVigPrePlanilha;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPredetalhe }

constructor TDbPredetalhe.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PREDETALHE';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fPantipobase := CreateCmDbField('PANTIPOBASE',ftString,False,False,False,True,'');
   fPantipo := CreateCmDbField('PANTIPO',ftString,False,False,False,True,'');
   fPanperc := CreateCmDbField('PANPERC',ftfloat,False,False,False,True,'');
   fPanorigem := CreateCmDbField('PANORIGEM',ftString,False,False,False,True,'');
   fPannumlanc := CreateCmDbField('PANNUMLANC',ftfloat,True,True,False,True,'');
   fPancontabase := CreateCmDbField('PANCONTABASE',ftString,False,False,False,True,'');
   fPancodigo := CreateCmDbField('PANCODIGO',ftfloat,True,True,False,True,'');
   fPanccustobase := CreateCmDbField('PANCCUSTOBASE',ftString,False,False,False,True,'');
   fPanbase := CreateCmDbField('PANBASE',ftString,False,False,False,True,'');
   fNumdoc := CreateCmDbField('NUMDOC',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fHitcodhist := CreateCmDbField('HITCODHIST',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   // início - André Tavares - pendência 16618 - 14/05/2004
   fIdSegregaCriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
   fNumOrdem := CreateCmDbField('NUMORDEM',ftfloat,False,False,False,True,'');
   // fim - André Tavares - pendência 16618 - 14/05/2004
   //Cássio - SOL Nº 116466 KINTANA Nº 550163
   FDataVigPrePlanilha := CreateCmDbField('DATAVIGPREPLANILHA', ftDate, True, False, False, False, '',-1,True);
end;

function TDbPredetalhe.Insert: Boolean;
begin

   fPannumlanc.AsFloat := GetSequence('PREDETALHE');
   Result := Inherited Insert;

end;

function TDbPredetalhe.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPredetalhe.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbPredetalhe.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPredetalhe.SetDataVigPrePlanilha(const Value: TCmDbField);
begin
  FDataVigPrePlanilha := Value;
end;

procedure TDbPredetalhe.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist := Value;
end;

procedure TDbPredetalhe.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbPredetalhe.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbPredetalhe.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPredetalhe.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPredetalhe.SetIdSegregaCriter(const Value: TCmDbField);
begin
  FIdSegregaCriter := Value;
end;

procedure TDbPredetalhe.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPredetalhe.SetNumdoc(const Value: TCmDbField);
begin
  FNumdoc := Value;
end;

procedure TDbPredetalhe.SetNumOrdem(const Value: TCmDbField);
begin
  FNumOrdem := Value;
end;

procedure TDbPredetalhe.SetPanbase(const Value: TCmDbField);
begin
  FPanbase := Value;
end;

procedure TDbPredetalhe.SetPanccustobase(const Value: TCmDbField);
begin
  FPanccustobase := Value;
end;

procedure TDbPredetalhe.SetPancodigo(const Value: TCmDbField);
begin
  FPancodigo := Value;
end;

procedure TDbPredetalhe.SetPancontabase(const Value: TCmDbField);
begin
  FPancontabase := Value;
end;

procedure TDbPredetalhe.SetPannumlanc(const Value: TCmDbField);
begin
  FPannumlanc := Value;
end;

procedure TDbPredetalhe.SetPanorigem(const Value: TCmDbField);
begin
  FPanorigem := Value;
end;

procedure TDbPredetalhe.SetPanperc(const Value: TCmDbField);
begin
  FPanperc := Value;
end;

procedure TDbPredetalhe.SetPantipo(const Value: TCmDbField);
begin
  FPantipo := Value;
end;

procedure TDbPredetalhe.SetPantipobase(const Value: TCmDbField);
begin
  FPantipobase := Value;
end;

procedure TDbPredetalhe.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPredetalhe.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPredetalhe.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;



procedure TDbPredetalhe.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



