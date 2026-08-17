{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemPedi;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbItemPedi = class(TCmDbObject)

  private
    FCodArtigo: TCmDbField;
    FValorUn: TCmDbField;
    FQtdePendente: TCmDbField;
    FCodMedida: TCmDbField;
    FFlgSCI: TCmDbField;
    FQtdePedida: TCmDbField;
    FNumRequisicao: TCmDbField;
    FObs: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetFlgSCI(const Value: TCmDbField);
    procedure SetNumRequisicao(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetQtdePedida(const Value: TCmDbField);
    procedure SetQtdePendente(const Value: TCmDbField);
    procedure SetValorUn(const Value: TCmDbField);

  public

     Property ValorUn       : TCmDbField read FValorUn write SetValorUn;
     Property QtdePendente  : TCmDbField read FQtdePendente write SetQtdePendente;
     Property QtdePedida    : TCmDbField read FQtdePedida write SetQtdePedida;
     Property Obs           : TCmDbField read FObs write SetObs;
     Property NumRequisicao : TCmDbField read FNumRequisicao write SetNumRequisicao;
     Property FlgSCI        : TCmDbField read FFlgSCI write SetFlgSCI;
     Property CodMedida     : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo     : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbItemPedi }

constructor TDbItemPedi.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMPEDI';
  
  _UpdateKeyFields := True;

   fValorun       := CreateCmDbField('VALORUN'       ,ftfloat,False,False,False,True,'Valor Unitário');
   fQtdependente  := CreateCmDbField('QTDEPENDENTE'  ,ftfloat,False,False,False,True,'Quantidade Pendente');
   fQtdepedida    := CreateCmDbField('QTDEPEDIDA'    ,ftfloat,True,False,False,True,'Quantidade Pedida');
   fObs           := CreateCmDbField('OBS'           ,ftString,False,False,False,True,'Observação');
   fNumrequisicao := CreateCmDbField('NUMREQUISICAO' ,ftfloat,True,True,False,True,'Nº da requisição');
   fFlgsci        := CreateCmDbField('FLGSCI'        ,ftString,False,False,False,True,'');
   fCodmedida     := CreateCmDbField('CODMEDIDA'     ,ftString,True,False,False,True,'Unidade de Medida');
   fCodartigo     := CreateCmDbField('CODARTIGO'     ,ftString,True,True,False,True,'Código do Artigo');
end;

function TDbItemPedi.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbItemPedi.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbItemPedi.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbItemPedi.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbItemPedi.SetFlgSCI(const Value: TCmDbField);
begin
  FFlgSCI := Value;
end;

procedure TDbItemPedi.SetNumRequisicao(const Value: TCmDbField);
begin
  FNumRequisicao := Value;
end;

procedure TDbItemPedi.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbItemPedi.SetQtdePedida(const Value: TCmDbField);
begin
  FQtdePedida := Value;
end;

procedure TDbItemPedi.SetQtdePendente(const Value: TCmDbField);
begin
  FQtdePendente := Value;
end;

procedure TDbItemPedi.SetValorUn(const Value: TCmDbField);
begin
  FValorUn := Value;
end;

end.



