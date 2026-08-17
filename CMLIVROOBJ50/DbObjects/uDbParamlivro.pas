{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 02/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamlivro;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamlivro = class(TCmDbObject)

  private
    FNumlivrosaida: TCmDbField;
    FNomeanaresp: TCmDbField;
    FCodipientrada: TCmDbField;
    FCodicmsentrada: TCmDbField;
    FTelanaresp: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdinscrmunic: TCmDbField;
    FIcmsantecipado: TCmDbField;
    FCodvalorvarejo: TCmDbField;
    FNumlivroentrada: TCmDbField;
    FFlgaparthotel: TCmDbField;
    FIdicmshotel: TCmDbField;
    FFlgregimeespecial: TCmDbField;
    FCodicmsretido: TCmDbField;
    FNumlivroiss: TCmDbField;
    FIdisshotel: TCmDbField;
    FNomefuncresp: TCmDbField;
    FIdinscest: TCmDbField;
    FFlgtaxaservico: TCmDbField;
    FNumlivroapuracao: TCmDbField;
    FCoddificms: TCmDbField;
    FPercicmssubsttrib: TCmDbField;
    FCpffuncresp: TCmDbField;
    FIDPISHOTEL: TcmDbField;
    FFLGMOSTRAINATIVOS: TcmDbField;
    procedure SetCoddificms(const Value: TCmDbField);
    procedure SetCodicmsentrada(const Value: TCmDbField);
    procedure SetCodicmsretido(const Value: TCmDbField);
    procedure SetCodipientrada(const Value: TCmDbField);
    procedure SetCodvalorvarejo(const Value: TCmDbField);
    procedure SetCpffuncresp(const Value: TCmDbField);
    procedure SetFlgaparthotel(const Value: TCmDbField);
    procedure SetFlgregimeespecial(const Value: TCmDbField);
    procedure SetFlgtaxaservico(const Value: TCmDbField);
    procedure SetIcmsantecipado(const Value: TCmDbField);
    procedure SetIdicmshotel(const Value: TCmDbField);
    procedure SetIdinscest(const Value: TCmDbField);
    procedure SetIdinscrmunic(const Value: TCmDbField);
    procedure SetIdisshotel(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNomeanaresp(const Value: TCmDbField);
    procedure SetNomefuncresp(const Value: TCmDbField);
    procedure SetNumlivroapuracao(const Value: TCmDbField);
    procedure SetNumlivroentrada(const Value: TCmDbField);
    procedure SetNumlivroiss(const Value: TCmDbField);
    procedure SetNumlivrosaida(const Value: TCmDbField);
    procedure SetPercicmssubsttrib(const Value: TCmDbField);
    procedure SetTelanaresp(const Value: TCmDbField);
    procedure SetIDPISHOTEL(const Value: TcmDbField);
    procedure SetFLGMOSTRAINATIVOS(const Value: TcmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Telanaresp: TCmDbField read FTelanaresp write SetTelanaresp;
     Property Percicmssubsttrib: TCmDbField read FPercicmssubsttrib write SetPercicmssubsttrib;
     Property Numlivrosaida: TCmDbField read FNumlivrosaida write SetNumlivrosaida;
     Property Numlivroiss: TCmDbField read FNumlivroiss write SetNumlivroiss;
     Property Numlivroentrada: TCmDbField read FNumlivroentrada write SetNumlivroentrada;
     Property Numlivroapuracao: TCmDbField read FNumlivroapuracao write SetNumlivroapuracao;
     Property Nomefuncresp: TCmDbField read FNomefuncresp write SetNomefuncresp;
     Property Nomeanaresp: TCmDbField read FNomeanaresp write SetNomeanaresp;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idisshotel: TCmDbField read FIdisshotel write SetIdisshotel;
     Property Idinscrmunic: TCmDbField read FIdinscrmunic write SetIdinscrmunic;
     Property Idinscest: TCmDbField read FIdinscest write SetIdinscest;
     Property Idicmshotel: TCmDbField read FIdicmshotel write SetIdicmshotel;
     Property Icmsantecipado: TCmDbField read FIcmsantecipado write SetIcmsantecipado;
     Property Flgtaxaservico: TCmDbField read FFlgtaxaservico write SetFlgtaxaservico;
     Property Flgregimeespecial: TCmDbField read FFlgregimeespecial write SetFlgregimeespecial;
     Property Flgaparthotel: TCmDbField read FFlgaparthotel write SetFlgaparthotel;
     Property Cpffuncresp: TCmDbField read FCpffuncresp write SetCpffuncresp;
     Property Codvalorvarejo: TCmDbField read FCodvalorvarejo write SetCodvalorvarejo;
     Property Codipientrada: TCmDbField read FCodipientrada write SetCodipientrada;
     Property Codicmsretido: TCmDbField read FCodicmsretido write SetCodicmsretido;
     Property Codicmsentrada: TCmDbField read FCodicmsentrada write SetCodicmsentrada;
     Property Coddificms: TCmDbField read FCoddificms write SetCoddificms;
     Property IDPISHOTEL : TcmDbField read FIDPISHOTEL write SetIDPISHOTEL;
     Property FLGMOSTRAINATIVOS : TcmDbField read FFLGMOSTRAINATIVOS write SetFLGMOSTRAINATIVOS;

     Constructor Create (Aowner: TCmCustomCdbObject);  Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamlivro }

constructor TDbParamlivro.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMLIVRO';

   fTelanaresp := CreateCmDbField('TELANARESP',ftString,False,False,False,True,'');
   fPercicmssubsttrib := CreateCmDbField('PERCICMSSUBSTTRIB',ftfloat,False,False,False,True,'');
   fNumlivrosaida := CreateCmDbField('NUMLIVROSAIDA',ftfloat,False,False,False,True,'');
   fNumlivroiss := CreateCmDbField('NUMLIVROISS',ftfloat,False,False,False,True,'');
   fNumlivroentrada := CreateCmDbField('NUMLIVROENTRADA',ftfloat,False,False,False,True,'');
   fNumlivroapuracao := CreateCmDbField('NUMLIVROAPURACAO',ftfloat,False,False,False,True,'');
   fNomefuncresp := CreateCmDbField('NOMEFUNCRESP',ftString,False,False,False,True,'');
   fNomeanaresp := CreateCmDbField('NOMEANARESP',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdisshotel := CreateCmDbField('IDISSHOTEL',ftfloat,False,False,False,True,'');
   fIdinscrmunic := CreateCmDbField('IDINSCRMUNIC',ftfloat,False,False,False,True,'');
   fIdinscest := CreateCmDbField('IDINSCEST',ftfloat,False,False,False,True,'');
   fIdicmshotel := CreateCmDbField('IDICMSHOTEL',ftfloat,False,False,False,True,'');
   fFlgtaxaservico := CreateCmDbField('FLGTAXASERVICO',ftString,False,False,False,True,'');
   fFlgregimeespecial := CreateCmDbField('FLGREGIMEESPECIAL',ftString,False,False,False,True,'');
   fFlgaparthotel := CreateCmDbField('FLGAPARTHOTEL',ftString,False,False,False,True,'');
   fCpffuncresp := CreateCmDbField('CPFFUNCRESP',ftString,False,False,False,True,'');
   fCodvalorvarejo := CreateCmDbField('CODVALORVAREJO',ftfloat,False,False,False,True,'');
   fCodipientrada := CreateCmDbField('CODIPIENTRADA',ftfloat,False,False,False,True,'');
   fCodicmsretido := CreateCmDbField('CODICMSRETIDO',ftfloat,False,False,False,True,'');
   fCodicmsentrada := CreateCmDbField('CODICMSENTRADA',ftfloat,False,False,False,True,'');
   fCoddificms := CreateCmDbField('CODDIFICMS',ftfloat,False,False,False,True,'');
   FIDPISHOTEL := CreateCmDbField('IDPISHOTEL',ftfloat,False,False,False,True,'');
   FFLGMOSTRAINATIVOS := CreateCmDbField('FLGMOSTRAINATIVOS',ftString,False,False,False,True,'');
end;

function TDbParamlivro.GetSqlSelect: String;
begin
  Result := inherited GetSqlSelect;
end;

function TDbParamlivro.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbParamlivro.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbParamlivro.SetCoddificms(const Value: TCmDbField);
begin
  FCoddificms := Value;
end;

procedure TDbParamlivro.SetCodicmsentrada(const Value: TCmDbField);
begin
  FCodicmsentrada := Value;
end;

procedure TDbParamlivro.SetCodicmsretido(const Value: TCmDbField);
begin
  FCodicmsretido := Value;
end;

procedure TDbParamlivro.SetCodipientrada(const Value: TCmDbField);
begin
  FCodipientrada := Value;
end;

procedure TDbParamlivro.SetCodvalorvarejo(const Value: TCmDbField);
begin
  FCodvalorvarejo := Value;
end;

procedure TDbParamlivro.SetCpffuncresp(const Value: TCmDbField);
begin
  FCpffuncresp := Value;
end;

procedure TDbParamlivro.SetFlgaparthotel(const Value: TCmDbField);
begin
  FFlgaparthotel := Value;
end;

procedure TDbParamlivro.SetFLGMOSTRAINATIVOS(const Value: TcmDbField);
begin
  FFLGMOSTRAINATIVOS := Value;
end;

procedure TDbParamlivro.SetFlgregimeespecial(const Value: TCmDbField);
begin
  FFlgregimeespecial := Value;
end;

procedure TDbParamlivro.SetFlgtaxaservico(const Value: TCmDbField);
begin
  FFlgtaxaservico := Value;
end;

procedure TDbParamlivro.SetIcmsantecipado(const Value: TCmDbField);
begin
  FIcmsantecipado := Value;
end;

procedure TDbParamlivro.SetIdicmshotel(const Value: TCmDbField);
begin
  FIdicmshotel := Value;
end;

procedure TDbParamlivro.SetIdinscest(const Value: TCmDbField);
begin
  FIdinscest := Value;
end;

procedure TDbParamlivro.SetIdinscrmunic(const Value: TCmDbField);
begin
  FIdinscrmunic := Value;
end;

procedure TDbParamlivro.SetIdisshotel(const Value: TCmDbField);
begin
  FIdisshotel := Value;
end;

procedure TDbParamlivro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamlivro.SetIDPISHOTEL(const Value: TcmDbField);
begin
  FIDPISHOTEL := Value;
end;

procedure TDbParamlivro.SetNomeanaresp(const Value: TCmDbField);
begin
  FNomeanaresp := Value;
end;

procedure TDbParamlivro.SetNomefuncresp(const Value: TCmDbField);
begin
  FNomefuncresp := Value;
end;

procedure TDbParamlivro.SetNumlivroapuracao(const Value: TCmDbField);
begin
  FNumlivroapuracao := Value;
end;

procedure TDbParamlivro.SetNumlivroentrada(const Value: TCmDbField);
begin
  FNumlivroentrada := Value;
end;

procedure TDbParamlivro.SetNumlivroiss(const Value: TCmDbField);
begin
  FNumlivroiss := Value;
end;

procedure TDbParamlivro.SetNumlivrosaida(const Value: TCmDbField);
begin
  FNumlivrosaida := Value;
end;

procedure TDbParamlivro.SetPercicmssubsttrib(const Value: TCmDbField);
begin
  FPercicmssubsttrib := Value;
end;

procedure TDbParamlivro.SetTelanaresp(const Value: TCmDbField);
begin
  FTelanaresp := Value;
end;

end.



