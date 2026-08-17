{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbLanctodocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLanctodocum = class(TCmDbObject)

  private
    FOperacao: TCmDbField;
    FHistoricocompl: TCmDbField;
    FFlgrecebeunf: TCmDbField;
    FCodtipdoc: TCmDbField;
    FCoddocumento: TCmDbField;
    FNumnf: TCmDbField;
    FPlncodigo: TCmDbField;
    FDebcre: TCmDbField;
    FNumfatura: TCmDbField;
    FValor: TCmDbField;
    FNumlotemanual: TCmDbField;
    FCodalterador: TCmDbField;
    FEstorno: TCmDbField;
    FCoddocinss: TCmDbField;
    FVlrliquido: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FValoroutramoeda: TCmDbField;
    FDatalancto: TCmDbField;
    FFlgtipofatura: TCmDbField;
    FUnidnegoc: TCmDbField;
    FNumrecibo: TCmDbField;
    FIdnflivro: TCmDbField;
    FNumlancto: TCmDbField;
    FFlgfatemitida: TCmDbField;
    FIdpessoa: TCmDbField;
    FContabiliza: Boolean;
    FCodPortForna: Integer;
    FDiasFloat: Integer;
    FUsaPlanoPatro: Boolean;
    FIdModulo: Integer;
    FPlanoConta: Integer;
    FContaBaixa: String;
    FSubContaBaixa: Integer;
    FPlnAntecipa: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCoddocinss(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetDatalancto(const Value: TCmDbField);
    procedure SetDebcre(const Value: TCmDbField);
    procedure SetEstorno(const Value: TCmDbField);
    procedure SetFlgfatemitida(const Value: TCmDbField);
    procedure SetFlgrecebeunf(const Value: TCmDbField);
    procedure SetFlgtipofatura(const Value: TCmDbField);
    procedure SetHistoricocompl(const Value: TCmDbField);
    procedure SetIdnflivro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetNumfatura(const Value: TCmDbField);
    procedure SetNumlancto(const Value: TCmDbField);
    procedure SetNumlotemanual(const Value: TCmDbField);
    procedure SetNumnf(const Value: TCmDbField);
    procedure SetNumrecibo(const Value: TCmDbField);
    procedure SetOperacao(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetValoroutramoeda(const Value: TCmDbField);
    procedure SetVlrliquido(const Value: TCmDbField);
    procedure SetContabiliza(const Value: Boolean);
    procedure SetCodPortForna(const Value: Integer);
    procedure SetDiasFloat(const Value: Integer);
    procedure SetIdModulo(const Value: Integer);
    procedure SetUsaPlanoPatro(const Value: Boolean);
    procedure SetPlanoConta(const Value: Integer);
    procedure SetContaBaixa(const Value: String);
    procedure SetSubContaBaixa(const Value: Integer);
    procedure SetPlnAntecipa(const Value: TCmDbField);

  public
     procedure Clear; Override;
     
     property Contabiliza: Boolean read FContabiliza write SetContabiliza;
     property DiasFloat: Integer read FDiasFloat write SetDiasFloat;
     property CodPortForna: Integer read FCodPortForna write SetCodPortForna;
     property UsaPlanoPatro: Boolean read FUsaPlanoPatro write SetUsaPlanoPatro;
     property IdModulo: Integer read FIdModulo write SetIdModulo;
     property PlanoConta: Integer read FPlanoConta write SetPlanoConta;
     property ContaBaixa: String read FContaBaixa write SetContaBaixa;
     property SubContaBaixa: Integer read FSubContaBaixa write SetSubContaBaixa;

     Property Vlrliquido: TCmDbField read FVlrliquido write SetVlrliquido;
     Property Valoroutramoeda: TCmDbField read FValoroutramoeda write SetValoroutramoeda;
     Property Valor: TCmDbField read FValor write SetValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Operacao: TCmDbField read FOperacao write SetOperacao;
     Property Numrecibo: TCmDbField read FNumrecibo write SetNumrecibo;
     Property Numnf: TCmDbField read FNumnf write SetNumnf;
     Property Numlotemanual: TCmDbField read FNumlotemanual write SetNumlotemanual;
     Property Numlancto: TCmDbField read FNumlancto write SetNumlancto;
     Property Numfatura: TCmDbField read FNumfatura write SetNumfatura;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idnflivro: TCmDbField read FIdnflivro write SetIdnflivro;
     Property Historicocompl: TCmDbField read FHistoricocompl write SetHistoricocompl;
     Property Flgtipofatura: TCmDbField read FFlgtipofatura write SetFlgtipofatura;
     Property Flgrecebeunf: TCmDbField read FFlgrecebeunf write SetFlgrecebeunf;
     Property Flgfatemitida: TCmDbField read FFlgfatemitida write SetFlgfatemitida;
     Property Estorno: TCmDbField read FEstorno write SetEstorno;
     Property Debcre: TCmDbField read FDebcre write SetDebcre;
     Property Datalancto: TCmDbField read FDatalancto write SetDatalancto;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Coddocinss: TCmDbField read FCoddocinss write SetCoddocinss;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;


     //PLNANTECIPA
     Property PlnAntecipa: TCmDbField read FPlnAntecipa write SetPlnAntecipa;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     function Insert: Boolean; Override;
  End;

implementation

{ TDbLanctodocum }

procedure TDbLanctodocum.Clear;
begin
  inherited;
  FContabiliza := False;
  FCodPortForna := 0;
  FDiasFloat := 0;
  FIdModulo := 0;
  FUsaPlanoPatro := False;
  FPlanoConta := 0;
  FContaBaixa := '';
  FSubContaBaixa := 0;
end;

constructor TDbLanctodocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  FContabiliza := False;
  FCodPortForna := 0;
  FDiasFloat := 0;
  FIdModulo := 0;
  FUsaPlanoPatro := False;
  FPlanoConta := 0;
  FContaBaixa := '';
  FSubContaBaixa := 0;

  ErrorIfNoRowsAffected := False;

  TableName := 'LANCTODOCUM';

  fVlrliquido := CreateCmDbField('VLRLIQUIDO',ftfloat,False,False,False,False,'',2);
  fValoroutramoeda := CreateCmDbField('VALOROUTRAMOEDA',ftfloat,False,False,False,False,'',2);
  fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'',2);
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
  fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
  fOperacao := CreateCmDbField('OPERACAO',ftString,True,False,False,True,'');
  fNumrecibo := CreateCmDbField('NUMRECIBO',ftString,False,False,False,True,'');
  fNumnf := CreateCmDbField('NUMNF',ftString,False,False,False,True,'');
  fNumlotemanual := CreateCmDbField('NUMLOTEMANUAL',ftfloat,False,False,False,True,'');
  fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,True,True,False,True,'');
  fNumfatura := CreateCmDbField('NUMFATURA',ftString,False,False,False,True,'');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdnflivro := CreateCmDbField('IDNFLIVRO',ftfloat,False,False,False,True,'');
  fHistoricocompl := CreateCmDbField('HISTORICOCOMPL',ftString,False,False,False,True,'');
  fFlgtipofatura := CreateCmDbField('FLGTIPOFATURA',ftString,False,False,False,True,'');
  fFlgrecebeunf := CreateCmDbField('FLGRECEBEUNF',ftString,False,False,False,True,'');
  fFlgfatemitida := CreateCmDbField('FLGFATEMITIDA',ftString,False,False,False,True,'');
  fEstorno := CreateCmDbField('ESTORNO',ftfloat,False,False,False,True,'');
  fDebcre := CreateCmDbField('DEBCRE',ftString,False,False,False,True,'');
  fDatalancto := CreateCmDbField('DATALANCTO',ftDateTime,False,False,False,True,'',-1);
  fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
  fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,True,'');
  fCoddocinss := CreateCmDbField('CODDOCINSS',ftfloat,False,False,False,True,'');
  fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');

  fPlnAntecipa := CreateCmDbField('PLNANTECIPA',ftfloat,False,False,False,True,'');
end;

function TDbLanctodocum.Insert: Boolean;
begin

   fNumlancto.AsFloat := GetSequence('LANCTODOCUM');
   Result := Inherited Insert;

end;

procedure TDbLanctodocum.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbLanctodocum.SetCoddocinss(const Value: TCmDbField);
begin
  FCoddocinss := Value;
end;

procedure TDbLanctodocum.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbLanctodocum.SetCodPortForna(const Value: Integer);
begin
  FCodPortForna := Value;
end;

procedure TDbLanctodocum.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbLanctodocum.SetContaBaixa(const Value: String);
begin
  FContaBaixa := Value;
end;

procedure TDbLanctodocum.SetContabiliza(const Value: Boolean);
begin
  FContabiliza := Value;
end;

procedure TDbLanctodocum.SetDatalancto(const Value: TCmDbField);
begin
  FDatalancto := Value;
end;

procedure TDbLanctodocum.SetDebcre(const Value: TCmDbField);
begin
  FDebcre := Value;
end;

procedure TDbLanctodocum.SetDiasFloat(const Value: Integer);
begin
  FDiasFloat := Value;
end;

procedure TDbLanctodocum.SetEstorno(const Value: TCmDbField);
begin
  FEstorno := Value;
end;

procedure TDbLanctodocum.SetFlgfatemitida(const Value: TCmDbField);
begin
  FFlgfatemitida := Value;
end;

procedure TDbLanctodocum.SetFlgrecebeunf(const Value: TCmDbField);
begin
  FFlgrecebeunf := Value;
end;

procedure TDbLanctodocum.SetFlgtipofatura(const Value: TCmDbField);
begin
  FFlgtipofatura := Value;
end;

procedure TDbLanctodocum.SetHistoricocompl(const Value: TCmDbField);
begin
  FHistoricocompl := Value;
end;

procedure TDbLanctodocum.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TDbLanctodocum.SetIdnflivro(const Value: TCmDbField);
begin
  FIdnflivro := Value;
end;

procedure TDbLanctodocum.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbLanctodocum.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbLanctodocum.SetNumfatura(const Value: TCmDbField);
begin
  FNumfatura := Value;
end;

procedure TDbLanctodocum.SetNumlancto(const Value: TCmDbField);
begin
  FNumlancto := Value;
end;

procedure TDbLanctodocum.SetNumlotemanual(const Value: TCmDbField);
begin
  FNumlotemanual := Value;
end;

procedure TDbLanctodocum.SetNumnf(const Value: TCmDbField);
begin
  FNumnf := Value;
end;

procedure TDbLanctodocum.SetNumrecibo(const Value: TCmDbField);
begin
  FNumrecibo := Value;
end;

procedure TDbLanctodocum.SetOperacao(const Value: TCmDbField);
begin
  FOperacao := Value;
end;

procedure TDbLanctodocum.SetPlanoConta(const Value: Integer);
begin
  FPlanoConta := Value;
end;

procedure TDbLanctodocum.SetPlnAntecipa(const Value: TCmDbField);
begin
  FPlnAntecipa := Value;
end;

procedure TDbLanctodocum.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbLanctodocum.SetSubContaBaixa(const Value: Integer);
begin
  FSubContaBaixa := Value;
end;

procedure TDbLanctodocum.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbLanctodocum.SetUsaPlanoPatro(const Value: Boolean);
begin
  FUsaPlanoPatro := Value;
end;

procedure TDbLanctodocum.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbLanctodocum.SetValoroutramoeda(const Value: TCmDbField);
begin
  FValoroutramoeda := Value;
end;

procedure TDbLanctodocum.SetVlrliquido(const Value: TCmDbField);
begin
  FVlrliquido := Value;
end;

end.



