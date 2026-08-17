{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maffei                     }
{ Atualizado Em: 27/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemEntr;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbItemEntr = class(TCmDbObject)

  private
    FIdItemEntrega: TCmDbField;
    FFlgStatus: TCmDbField;
    FNumRequisicao: TCmDbField;
    FQtdeEntrega: TCmDbField;
    FCodArtigo: TCmDbField;
    FIdUsuarioConfDev: TCmDbField;
    FDataEntrega: TCmDbField;
    FValorUn: TCmDbField;
    FCodMedida: TCmDbField;
    FIdAtendente: TCmDbField;
    FDataReceb: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetDataEntrega(const Value: TCmDbField);
    procedure SetDataReceb(const Value: TCmDbField);
    procedure SetFlgStatus(const Value: TCmDbField);
    procedure SetIdAtendente(const Value: TCmDbField);
    procedure SetIdItemEntrega(const Value: TCmDbField);
    procedure SetIdUsuarioConfDev(const Value: TCmDbField);
    procedure SetNumRequisicao(const Value: TCmDbField);
    procedure SetQtdeEntrega(const Value: TCmDbField);
    procedure SetValorUn(const Value: TCmDbField);

  public

     Property ValorUn          : TCmDbField read FValorUn write SetValorUn;
     Property QtdeEntrega      : TCmDbField read FQtdeEntrega write SetQtdeEntrega;
     Property NumRequisicao    : TCmDbField read FNumRequisicao write SetNumRequisicao;
     Property IdUsuarioConfDev : TCmDbField read FIdUsuarioConfDev write SetIdUsuarioConfDev;
     Property IdItemEntrega    : TCmDbField read FIdItemEntrega write SetIdItemEntrega;
     Property IdAtendente      : TCmDbField read FIdAtendente write SetIdAtendente;
     Property FlgStatus        : TCmDbField read FFlgStatus write SetFlgStatus;
     Property DataReceb        : TCmDbField read FDataReceb write SetDataReceb;
     Property DataEntrega      : TCmDbField read FDataEntrega write SetDataEntrega;
     Property CodMedida        : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo        : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbItemEntr }

constructor TDbItemEntr.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMENTR';

   fValorun          := CreateCmDbField('VALORUN',ftfloat,False,False,False,True,'');
   fQtdeentrega      := CreateCmDbField('QTDEENTREGA',ftfloat,False,False,False,True,'');
   fNumrequisicao    := CreateCmDbField('NUMREQUISICAO',ftfloat,True,False,False,True,'');
   fIdusuarioconfdev := CreateCmDbField('IDUSUARIOCONFDEV',ftfloat,False,False,False,True,'');
   fIditementrega    := CreateCmDbField('IDITEMENTREGA',ftfloat,True,True,False,True,'');
   fIdatendente      := CreateCmDbField('IDATENDENTE',ftfloat,False,False,False,True,'');
   fFlgstatus        := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fDatareceb        := CreateCmDbField('DATARECEB',ftDateTime,False,False,False,True,'');
   fDataentrega      := CreateCmDbField('DATAENTREGA',ftDateTime,False,False,False,True,'');
   fCodmedida        := CreateCmDbField('CODMEDIDA',ftString,True,False,False,True,'');
   fCodartigo        := CreateCmDbField('CODARTIGO',ftString,True,False,False,True,'');
end;

function TDbItemEntr.Insert: Boolean;
begin

   fIditementrega.AsFloat := GetSequence('ITEMENTR');
   Result := Inherited Insert;

end;

function TDbItemEntr.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbItemEntr.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbItemEntr.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbItemEntr.SetDataEntrega(const Value: TCmDbField);
begin
  FDataEntrega := Value;
end;

procedure TDbItemEntr.SetDataReceb(const Value: TCmDbField);
begin
  FDataReceb := Value;
end;

procedure TDbItemEntr.SetFlgStatus(const Value: TCmDbField);
begin
  FFlgStatus := Value;
end;

procedure TDbItemEntr.SetIdAtendente(const Value: TCmDbField);
begin
  FIdAtendente := Value;
end;

procedure TDbItemEntr.SetIdItemEntrega(const Value: TCmDbField);
begin
  FIdItemEntrega := Value;
end;

procedure TDbItemEntr.SetIdUsuarioConfDev(const Value: TCmDbField);
begin
  FIdUsuarioConfDev := Value;
end;

procedure TDbItemEntr.SetNumRequisicao(const Value: TCmDbField);
begin
  FNumRequisicao := Value;
end;

procedure TDbItemEntr.SetQtdeEntrega(const Value: TCmDbField);
begin
  FQtdeEntrega := Value;
end;

procedure TDbItemEntr.SetValorUn(const Value: TCmDbField);
begin
  FValorUn := Value;
end;

end.



