{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoImovel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoImovel = class(TCmDbObject)

  private
    FIdgrupoar: TCmDbField;
    FCodaltcorrmon: TCmDbField;
    FDesctipoimovel: TCmDbField;
    FCodaltjuros: TCmDbField;
    FIdgrupomovel: TCmDbField;
    FIdgrupoinst: TCmDbField;
    FIdgrupoveiculo: TCmDbField;
    FCodaltjral: TCmDbField;
    FCodtipimovel: TCmDbField;
    FIdgrupoelet: TCmDbField;
    FIdgrupoedificacao: TCmDbField;
    FIdgrupoutilitario: TCmDbField;
    FIdgrupomaquina: TCmDbField;
    FCodaltcomissao: TCmDbField;
    FCodaltcmal: TCmDbField;
    FCodaltmtal: TCmDbField;
    FIdgrupoterreno: TCmDbField;
    FCodaltmulta: TCmDbField;
    FCodImovelSPC: TCmDbField;
    FIdCarteiraSpc: TCmDbField;
    FFlgTipoInterno: TCmDbField;
    FCodAltConfissao: TCmDbField;
    FFlgCtbConfissao: TCmDbField;
    procedure SetCodaltcmal(const Value: TCmDbField);
    procedure SetCodaltcomissao(const Value: TCmDbField);
    procedure SetCodaltcorrmon(const Value: TCmDbField);
    procedure SetCodaltjral(const Value: TCmDbField);
    procedure SetCodaltjuros(const Value: TCmDbField);
    procedure SetCodaltmtal(const Value: TCmDbField);
    procedure SetCodaltmulta(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetDesctipoimovel(const Value: TCmDbField);
    procedure SetIdgrupoar(const Value: TCmDbField);
    procedure SetIdgrupoedificacao(const Value: TCmDbField);
    procedure SetIdgrupoelet(const Value: TCmDbField);
    procedure SetIdgrupoinst(const Value: TCmDbField);
    procedure SetIdgrupomaquina(const Value: TCmDbField);
    procedure SetIdgrupomovel(const Value: TCmDbField);
    procedure SetIdgrupoterreno(const Value: TCmDbField);
    procedure SetIdgrupoutilitario(const Value: TCmDbField);
    procedure SetIdgrupoveiculo(const Value: TCmDbField);
    procedure SetCodImovelSPC(const Value: TCmDbField);
    procedure SetIdCarteiraSpc(const Value: TCmDbField);
    procedure SetFlgTipoInterno(const Value: TCmDbField);
    procedure SetCodAltConfissao(const Value: TCmDbField);
    procedure SetFlgCtbConfissao(const Value: TCmDbField);

  public

     Property Idgrupoveiculo: TCmDbField read FIdgrupoveiculo write SetIdgrupoveiculo;
     Property Idgrupoutilitario: TCmDbField read FIdgrupoutilitario write SetIdgrupoutilitario;
     Property Idgrupoterreno: TCmDbField read FIdgrupoterreno write SetIdgrupoterreno;
     Property Idgrupomovel: TCmDbField read FIdgrupomovel write SetIdgrupomovel;
     Property Idgrupomaquina: TCmDbField read FIdgrupomaquina write SetIdgrupomaquina;
     Property Idgrupoinst: TCmDbField read FIdgrupoinst write SetIdgrupoinst;
     Property Idgrupoelet: TCmDbField read FIdgrupoelet write SetIdgrupoelet;
     Property Idgrupoedificacao: TCmDbField read FIdgrupoedificacao write SetIdgrupoedificacao;
     Property Idgrupoar: TCmDbField read FIdgrupoar write SetIdgrupoar;
     Property Desctipoimovel: TCmDbField read FDesctipoimovel write SetDesctipoimovel;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Codaltmulta: TCmDbField read FCodaltmulta write SetCodaltmulta;
     Property Codaltmtal: TCmDbField read FCodaltmtal write SetCodaltmtal;
     Property Codaltjuros: TCmDbField read FCodaltjuros write SetCodaltjuros;
     Property Codaltjral: TCmDbField read FCodaltjral write SetCodaltjral;
     Property Codaltcorrmon: TCmDbField read FCodaltcorrmon write SetCodaltcorrmon;
     Property Codaltcomissao: TCmDbField read FCodaltcomissao write SetCodaltcomissao;
     Property Codaltcmal: TCmDbField read FCodaltcmal write SetCodaltcmal;
     Property CodImovelSPC: TCmDbField read FCodImovelSPC write SetCodImovelSPC;
     Property IdCarteiraSpc: TCmDbField read FIdCarteiraSpc write SetIdCarteiraSpc;
     Property FlgTipoInterno: TCmDbField read FFlgTipoInterno write SetFlgTipoInterno;
     property CodAltConfissao: TCmDbField read FCodAltConfissao write SetCodAltConfissao;
     property FlgCtbConfissao: TCmDbField read FFlgCtbConfissao write SetFlgCtbConfissao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoImovel }

constructor TDbTipoImovel.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPOIMOVEL';

   fIdgrupoveiculo := CreateCmDbField('IDGRUPOVEICULO',ftfloat,False,False,False,True,'');
   fIdgrupoutilitario := CreateCmDbField('IDGRUPOUTILITARIO',ftfloat,False,False,False,True,'');
   fIdgrupoterreno := CreateCmDbField('IDGRUPOTERRENO',ftfloat,False,False,False,True,'');
   fIdgrupomovel := CreateCmDbField('IDGRUPOMOVEL',ftfloat,False,False,False,True,'');
   fIdgrupomaquina := CreateCmDbField('IDGRUPOMAQUINA',ftfloat,False,False,False,True,'');
   fIdgrupoinst := CreateCmDbField('IDGRUPOINST',ftfloat,False,False,False,True,'');
   fIdgrupoelet := CreateCmDbField('IDGRUPOELET',ftfloat,False,False,False,True,'');
   fIdgrupoedificacao := CreateCmDbField('IDGRUPOEDIFICACAO',ftfloat,False,False,False,True,'');
   fIdgrupoar := CreateCmDbField('IDGRUPOAR',ftfloat,False,False,False,True,'');
   fDesctipoimovel := CreateCmDbField('DESCTIPOIMOVEL',ftString,True,False,False,True,'Descrição');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,True,True,False,True,'');
   fCodaltmulta := CreateCmDbField('CODALTMULTA',ftfloat,False,False,False,True,'');
   fCodaltmtal := CreateCmDbField('CODALTMTAL',ftfloat,False,False,False,True,'');
   fCodaltjuros := CreateCmDbField('CODALTJUROS',ftfloat,False,False,False,True,'');
   fCodaltjral := CreateCmDbField('CODALTJRAL',ftfloat,False,False,False,True,'');
   fCodaltcorrmon := CreateCmDbField('CODALTCORRMON',ftfloat,False,False,False,True,'');
   fCodaltcomissao := CreateCmDbField('CODALTCOMISSAO',ftfloat,False,False,False,True,'');
   fCodaltcmal := CreateCmDbField('CODALTCMAL',ftfloat,False,False,False,True,'');
   fCodImovelSpc := CreateCmDbField('CODIMOVELSPC',ftfloat,False,False,False,True,'');
   fIdCarteiraSpc := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'');
   fFlgTipoInterno := CreateCmDbField('FLGTIPOINTERNO',ftString,True,False,False,True,'');

   FCodAltConfissao := CreateCmDbField('CODALTCONFISSAO',ftfloat,False,False,False,True,'');
   FFlgCtbConfissao := CreateCmDbField('FLGCTBCONFISSAO',ftfloat,False,False,False,True,'');
end;

function TDbTipoImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbTipoImovel.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTipoImovel.SetCodaltcmal(const Value: TCmDbField);
begin
  FCodaltcmal := Value;
end;

procedure TDbTipoImovel.SetCodaltcomissao(const Value: TCmDbField);
begin
  FCodaltcomissao := Value;
end;

procedure TDbTipoImovel.SetCodAltConfissao(const Value: TCmDbField);
begin
  FCodAltConfissao := Value;
end;

procedure TDbTipoImovel.SetCodaltcorrmon(const Value: TCmDbField);
begin
  FCodaltcorrmon := Value;
end;

procedure TDbTipoImovel.SetCodaltjral(const Value: TCmDbField);
begin
  FCodaltjral := Value;
end;

procedure TDbTipoImovel.SetCodaltjuros(const Value: TCmDbField);
begin
  FCodaltjuros := Value;
end;

procedure TDbTipoImovel.SetCodaltmtal(const Value: TCmDbField);
begin
  FCodaltmtal := Value;
end;

procedure TDbTipoImovel.SetCodaltmulta(const Value: TCmDbField);
begin
  FCodaltmulta := Value;
end;

procedure TDbTipoImovel.SetCodImovelSPC(const Value: TCmDbField);
begin
  FCodImovelSPC := Value;
end;

procedure TDbTipoImovel.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbTipoImovel.SetDesctipoimovel(const Value: TCmDbField);
begin
  FDesctipoimovel := Value;
end;

procedure TDbTipoImovel.SetFlgCtbConfissao(const Value: TCmDbField);
begin
  FFlgCtbConfissao := Value;
end;

procedure TDbTipoImovel.SetFlgTipoInterno(const Value: TCmDbField);
begin
  FFlgTipoInterno := Value;
end;

procedure TDbTipoImovel.SetIdCarteirasPC(const Value: TCmDbField);
begin
  FIdCarteirasPC := Value;
end;

procedure TDbTipoImovel.SetIdgrupoar(const Value: TCmDbField);
begin
  FIdgrupoar := Value;
end;

procedure TDbTipoImovel.SetIdgrupoedificacao(const Value: TCmDbField);
begin
  FIdgrupoedificacao := Value;
end;

procedure TDbTipoImovel.SetIdgrupoelet(const Value: TCmDbField);
begin
  FIdgrupoelet := Value;
end;

procedure TDbTipoImovel.SetIdgrupoinst(const Value: TCmDbField);
begin
  FIdgrupoinst := Value;
end;

procedure TDbTipoImovel.SetIdgrupomaquina(const Value: TCmDbField);
begin
  FIdgrupomaquina := Value;
end;

procedure TDbTipoImovel.SetIdgrupomovel(const Value: TCmDbField);
begin
  FIdgrupomovel := Value;
end;

procedure TDbTipoImovel.SetIdgrupoterreno(const Value: TCmDbField);
begin
  FIdgrupoterreno := Value;
end;

procedure TDbTipoImovel.SetIdgrupoutilitario(const Value: TCmDbField);
begin
  FIdgrupoutilitario := Value;
end;

procedure TDbTipoImovel.SetIdgrupoveiculo(const Value: TCmDbField);
begin
  FIdgrupoveiculo := Value;
end;

end.



