{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/07/2002                             }
{                                                       }
{*******************************************************}

{
--------------------------------------------------------------------------------
Pendência   : SOL 144873 KINTANA 961354
Responsável : BRUNO AZEVEDO
Data        : 08/12/2010
Descrição   : Ajustes para atender as necessidades do cliente.
--------------------------------------------------------------------------------
}

unit uDb_Depentit;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDb_Depentit = class(TCmDbObject)

  private
    FIniciosalariof: TCmDbField;
    FMatricula: TCmDbField;
    FFlgcontaimpostor: TCmDbField;
    FInicioimpostor: TCmDbField;
    FValorbase1: TCmDbField;
    FFimimpostor: TCmDbField;
    FFimsalariof: TCmDbField;
    FValorbase3: TCmDbField;
    FFlgignoravalir: TCmDbField;
    FFlgdesignado: TCmDbField;
//    FFlgdesinado: TCmDbField;
    FNumsequencia: TCmDbField;
    FValorbase2: TCmDbField;
    FFlgbeneficiario: TCmDbField;
    FFlgdeplegal: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtitular: TCmDbField;
    FFlgcontasalariof: TCmDbField;
    FIddependencia: TCmDbField;
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    FFlgdepinvalido: TCmDbField;
    FFlgdepir: TCmDbField;
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    FDataCadastro: TCmDbField;
    procedure SetFimimpostor(const Value: TCmDbField);
    procedure SetFimsalariof(const Value: TCmDbField);
    procedure SetFlgbeneficiario(const Value: TCmDbField);
    procedure SetFlgcontaimpostor(const Value: TCmDbField);
    procedure SetFlgcontasalariof(const Value: TCmDbField);
    procedure SetFlgdeplegal(const Value: TCmDbField);
    procedure SetFlgdesignado(const Value: TCmDbField);
    procedure SetFlgignoravalir(const Value: TCmDbField);
    procedure SetIddependencia(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetInicioimpostor(const Value: TCmDbField);
    procedure SetIniciosalariof(const Value: TCmDbField);
    procedure SetMatricula(const Value: TCmDbField);
    procedure SetNumsequencia(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    procedure SetFlgdepinvalido(const Value: TCmDbField);
    procedure SetFlgdepir(const Value: TCmDbField);
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    procedure SetDataCadastro(const Value: TCmDbField);

  public

     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Numsequencia: TCmDbField read FNumsequencia write SetNumsequencia;
     Property Matricula: TCmDbField read FMatricula write SetMatricula;
     Property Iniciosalariof: TCmDbField read FIniciosalariof write SetIniciosalariof;
     Property Inicioimpostor: TCmDbField read FInicioimpostor write SetInicioimpostor;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Iddependencia: TCmDbField read FIddependencia write SetIddependencia;
     Property Flgignoravalir: TCmDbField read FFlgignoravalir write SetFlgignoravalir;
     Property Flgdesignado: TCmDbField read FFlgdesignado write SetFlgdesignado;
     Property Flgdeplegal: TCmDbField read FFlgdeplegal write SetFlgdeplegal;

     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     Property Flgdepir: TCmDbField read FFlgdepir write SetFlgdepir;
     Property Flgdepinvalido: TCmDbField read FFlgdepinvalido write SetFlgdepinvalido;
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     Property DataCadastro: TCmDbField read FDataCadastro write SetDataCadastro;

     Property Flgcontasalariof: TCmDbField read FFlgcontasalariof write SetFlgcontasalariof;
     Property Flgcontaimpostor: TCmDbField read FFlgcontaimpostor write SetFlgcontaimpostor;
     Property Flgbeneficiario: TCmDbField read FFlgbeneficiario write SetFlgbeneficiario;
     Property Fimsalariof: TCmDbField read FFimsalariof write SetFimsalariof;
     Property Fimimpostor: TCmDbField read FFimimpostor write SetFimimpostor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDb_Depentit }

constructor TDb_Depentit.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEPENTIT';

   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fNumsequencia := CreateCmDbField('NUMSEQUENCIA',ftfloat,False,False,False,True,'');
   fMatricula := CreateCmDbField('MATRICULA',ftString,False,False,False,True,'');
   fIniciosalariof := CreateCmDbField('INICIOSALARIOF',ftDateTime,False,False,False,True,'');
   fInicioimpostor := CreateCmDbField('INICIOIMPOSTOR',ftDateTime,False,False,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,True,False,True,'Id. Titular');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id.Pessoa');
   fIddependencia := CreateCmDbField('IDDEPENDENCIA',ftString,True,False,False,True,'');
   fFlgignoravalir := CreateCmDbField('FLGIGNORAVALIR',ftfloat,False,False,False,True,'');
   fFlgdesignado := CreateCmDbField('FLGDESIGNADO',ftfloat,False,False,False,True,'');
   fFlgdeplegal := CreateCmDbField('FLGDEPLEGAL',ftfloat,False,False,False,True,'');

   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   fFlgdepir := CreateCmDbField('FLGDEPIR',ftfloat,False,False,False,True,'');
   fFlgdepinvalido := CreateCmDbField('FLGDEPINVALIDO',ftfloat,False,False,False,True,'');
   //BRUNO AZEVEDO SOL 124179 KINTANA 651468
   fDataCadastro := CreateCmDbField('DATACADASTRO',ftDateTime,False,False,False,True,'');

   fFlgcontasalariof := CreateCmDbField('FLGCONTASALARIOF',ftfloat,False,False,False,True,'');
   fFlgcontaimpostor := CreateCmDbField('FLGCONTAIMPOSTOR',ftfloat,False,False,False,True,'');
   fFlgbeneficiario := CreateCmDbField('FLGBENEFICIARIO',ftfloat,False,False,False,True,'');
   fFimsalariof := CreateCmDbField('FIMSALARIOF',ftDateTime,False,False,False,True,'');
   fFimimpostor := CreateCmDbField('FIMIMPOSTOR',ftDateTime,False,False,False,True,'');
end;

procedure TDb_Depentit.SetFimimpostor(const Value: TCmDbField);
begin
  FFimimpostor := Value;
end;

procedure TDb_Depentit.SetFimsalariof(const Value: TCmDbField);
begin
  FFimsalariof := Value;
end;

procedure TDb_Depentit.SetFlgbeneficiario(const Value: TCmDbField);
begin
  FFlgbeneficiario := Value;
end;

procedure TDb_Depentit.SetFlgcontaimpostor(const Value: TCmDbField);
begin
  FFlgcontaimpostor := Value;
end;

procedure TDb_Depentit.SetFlgcontasalariof(const Value: TCmDbField);
begin
  FFlgcontasalariof := Value;
end;

//BRUNO AZEVEDO SOL 124179 KINTANA 651468
procedure TDb_Depentit.SetFlgdepinvalido(const Value: TCmDbField);
begin
  FFlgdepinvalido := Value;
end;

procedure TDb_Depentit.SetFlgdepir(const Value: TCmDbField);
begin
  FFlgdepir := Value;
end;
//BRUNO AZEVEDO SOL 124179 KINTANA 651468

procedure TDb_Depentit.SetDataCadastro(const Value: TCmDbField);
begin
  FDataCadastro := Value;
end;

procedure TDb_Depentit.SetFlgdeplegal(const Value: TCmDbField);
begin
  FFlgdeplegal := Value;
end;

procedure TDb_Depentit.SetFlgdesignado(const Value: TCmDbField);
begin
  FFlgdesignado := Value;
end;

procedure TDb_Depentit.SetFlgignoravalir(const Value: TCmDbField);
begin
  FFlgignoravalir := Value;
end;

procedure TDb_Depentit.SetIddependencia(const Value: TCmDbField);
begin
  FIddependencia := Value;
end;

procedure TDb_Depentit.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_Depentit.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDb_Depentit.SetInicioimpostor(const Value: TCmDbField);
begin
  FInicioimpostor := Value;
end;

procedure TDb_Depentit.SetIniciosalariof(const Value: TCmDbField);
begin
  FIniciosalariof := Value;
end;

procedure TDb_Depentit.SetMatricula(const Value: TCmDbField);
begin
  FMatricula := Value;
end;

procedure TDb_Depentit.SetNumsequencia(const Value: TCmDbField);
begin
  FNumsequencia := Value;
end;

procedure TDb_Depentit.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDb_Depentit.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDb_Depentit.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

end.



