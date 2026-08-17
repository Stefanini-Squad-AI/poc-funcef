{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbPadrLancImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPadrLancImovel = class(TCmDbObject)

  private
    FCentrocustoresult: TCmDbField;
    FTipcodigo: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdimovel: TCmDbField;
    FFlgintegracontab: TCmDbField;
    FDescpadrlancimo: TCmDbField;
    FCentrocustodebcre: TCmDbField;
    FRecpag: TCmDbField;
    FFlgintegracapcar: TCmDbField;
    FIdmodulo: TCmDbField;
    FSubcontaresult: TCmDbField;
    FContadebcre: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FPlano: TCmDbField;
    FFlgresppagamento: TCmDbField;
    FContaresult: TCmDbField;
    FUnidnegoc: TCmDbField;
    FSubcontadebcre: TCmDbField;
    FIdpadrlancimovel: TCmDbField;
    FCodtipimovel: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgdiario: TCmDbField;
    FCodCentroCusto: TCmDbField;

    FPlaContaAnt: TCmDbField;

    procedure SetCentrocustodebcre(const Value: TCmDbField);
    procedure SetCentrocustoresult(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetContadebcre(const Value: TCmDbField);
    procedure SetContaresult(const Value: TCmDbField);
    procedure SetDescpadrlancimo(const Value: TCmDbField);
    procedure SetFlgdiario(const Value: TCmDbField);
    procedure SetFlgintegracapcar(const Value: TCmDbField);
    procedure SetFlgintegracontab(const Value: TCmDbField);
    procedure SetFlgresppagamento(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpadrlancimovel(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetSubcontadebcre(const Value: TCmDbField);
    procedure SetSubcontaresult(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetPlaContaAnt(const Value: TcmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Subcontaresult: TCmDbField read FSubcontaresult write SetSubcontaresult;
     Property Subcontadebcre: TCmDbField read FSubcontadebcre write SetSubcontadebcre;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpadrlancimovel: TCmDbField read FIdpadrlancimovel write SetIdpadrlancimovel;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Flgresppagamento: TCmDbField read FFlgresppagamento write SetFlgresppagamento;
     Property Flgintegracontab: TCmDbField read FFlgintegracontab write SetFlgintegracontab;
     Property Flgintegracapcar: TCmDbField read FFlgintegracapcar write SetFlgintegracapcar;
     Property Flgdiario: TCmDbField read FFlgdiario write SetFlgdiario;
     Property Descpadrlancimo: TCmDbField read FDescpadrlancimo write SetDescpadrlancimo;
     Property Contaresult: TCmDbField read FContaresult write SetContaresult;
     Property Contadebcre: TCmDbField read FContadebcre write SetContadebcre;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Centrocustoresult: TCmDbField read FCentrocustoresult write SetCentrocustoresult;
     Property Centrocustodebcre: TCmDbField read FCentrocustodebcre write SetCentrocustodebcre;
     Property CodCentroCusto: TCmDbField read FCodCentroCusto write SetCodCentroCusto;

     Property PlaContaAnt: TcmDbField read FPlaContaAnt write SetPlaContaAnt;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPadrLancImovel }

constructor TDbPadrLancImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PADRLANCIMOVEL';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fSubcontaresult := CreateCmDbField('SUBCONTARESULT',ftfloat,False,False,False,True,'');
   fSubcontadebcre := CreateCmDbField('SUBCONTADEBCRE',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpadrlancimovel := CreateCmDbField('IDPADRLANCIMOVEL',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fFlgresppagamento := CreateCmDbField('FLGRESPPAGAMENTO',ftString,False,False,False,True,'');
   fFlgintegracontab := CreateCmDbField('FLGINTEGRACONTAB',ftfloat,False,False,False,False,'');
   fFlgintegracapcar := CreateCmDbField('FLGINTEGRACAPCAR',ftfloat,False,False,False,False,'');
   fFlgdiario := CreateCmDbField('FLGDIARIO',ftString,False,False,False,True,'');
   fDescpadrlancimo := CreateCmDbField('DESCPADRLANCIMO',ftString,False,False,False,True,'');
   fContaresult := CreateCmDbField('CONTARESULT',ftString,False,False,False,True,'');
   fContadebcre := CreateCmDbField('CONTADEBCRE',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCentrocustoresult := CreateCmDbField('CENTROCUSTORESULT',ftString,False,False,False,True,'');
   fCentrocustodebcre := CreateCmDbField('CENTROCUSTODEBCRE',ftString,False,False,False,True,'');
   fCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');

   FPlaContaAnt := CreateCmDbField('PLACONTAANT',ftString,False,False,False,True,'');
end;

function TDbPadrLancImovel.Insert: Boolean;
begin

   fIdpadrlancimovel.AsFloat := GetSequence('PADRLANCIMOVEL');
   Result := Inherited Insert;

end;


procedure TDbPadrLancImovel.SetCentrocustodebcre(const Value: TCmDbField);
begin
  FCentrocustodebcre := Value;
end;

procedure TDbPadrLancImovel.SetCentrocustoresult(const Value: TCmDbField);
begin
  FCentrocustoresult := Value;
end;

procedure TDbPadrLancImovel.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbPadrLancImovel.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbPadrLancImovel.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbPadrLancImovel.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbPadrLancImovel.SetContadebcre(const Value: TCmDbField);
begin
  FContadebcre := Value;
end;

procedure TDbPadrLancImovel.SetContaresult(const Value: TCmDbField);
begin
  FContaresult := Value;
end;

procedure TDbPadrLancImovel.SetDescpadrlancimo(const Value: TCmDbField);
begin
  FDescpadrlancimo := Value;
end;

procedure TDbPadrLancImovel.SetFlgdiario(const Value: TCmDbField);
begin
  FFlgdiario := Value;
end;

procedure TDbPadrLancImovel.SetFlgintegracapcar(const Value: TCmDbField);
begin
  FFlgintegracapcar := Value;
end;

procedure TDbPadrLancImovel.SetFlgintegracontab(const Value: TCmDbField);
begin
  FFlgintegracontab := Value;
end;

procedure TDbPadrLancImovel.SetFlgresppagamento(const Value: TCmDbField);
begin
  FFlgresppagamento := Value;
end;

procedure TDbPadrLancImovel.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbPadrLancImovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbPadrLancImovel.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbPadrLancImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbPadrLancImovel.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbPadrLancImovel.SetIdpadrlancimovel(const Value: TCmDbField);
begin
  FIdpadrlancimovel := Value;
end;

procedure TDbPadrLancImovel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPadrLancImovel.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbPadrLancImovel.SetPlaContaAnt(const Value: TcmDbField);
begin
  FPlaContaAnt := Value;
end;

procedure TDbPadrLancImovel.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPadrLancImovel.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbPadrLancImovel.SetSubcontadebcre(const Value: TCmDbField);
begin
  FSubcontadebcre := Value;
end;

procedure TDbPadrLancImovel.SetSubcontaresult(const Value: TCmDbField);
begin
  FSubcontaresult := Value;
end;

procedure TDbPadrLancImovel.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbPadrLancImovel.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



