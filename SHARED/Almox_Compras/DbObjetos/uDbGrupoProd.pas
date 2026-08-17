{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoProd;

interface
Uses uCmDbObject, uSistema, DB, uDataBase,sysUtils, uCmCustomCdbObject;

Type
  TDbGrupoProd = class(TCmDbObject)

  private
    FIdPessoa: TCmDbField;
    FStatusGrupo: TCmDbField;
    FDescGrupoProd: TCmDbField;
    FRecPag: TCmDbField;
    FCodGrupoProd: TCmDbField;
    FIdGrupo: TCmDbField;
    FIdNaturezaEstoque: TCmDbField;
    FCodTipRecDes: TCmDbField;
    procedure SetCodGrupoProd(const Value: TCmDbField);
    procedure SetDescGrupoProd(const Value: TCmDbField);
    procedure SetIdGrupo(const Value: TCmDbField);
    procedure SetIdNaturezaEstoque(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetRecPag(const Value: TCmDbField);
    procedure SetStatusGrupo(const Value: TCmDbField);
    procedure SetCodTipRecDes(const Value: TCmDbField);

  Protected
       Function GetSqlSelect : String; Override;


  public

     Property StatusGrupo       : TCmDbField read FStatusGrupo write SetStatusGrupo;
     Property RecPag            : TCmDbField read FRecPag write SetRecPag;
     Property IdPessoa          : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdNaturezaEstoque : TCmDbField read FIdNaturezaEstoque write SetIdNaturezaEstoque;
     Property IdGrupo           : TCmDbField read FIdGrupo write SetIdGrupo;
     Property DescGrupoProd     : TCmDbField read FDescGrupoProd write SetDescGrupoProd;
     Property CodTipRecDes      : TCmDbField read FCodTipRecDes write SetCodTipRecDes;
     Property CodGrupoProd      : TCmDbField read FCodGrupoProd write SetCodGrupoProd;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrupoProd }

constructor TDbGrupoProd.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPPROD';

   fStatusgrupo       := CreateCmDbField('STATUSGRUPO'      ,ftString,False,False,False,True,'');
   fRecpag            := CreateCmDbField('RECPAG'           ,ftString,False,False,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA'         ,ftfloat ,True,False,False,True,'');
   fIdnaturezaestoque := CreateCmDbField('IDNATUREZAESTOQUE',ftfloat ,False,False,False,True,'');
   fIdgrupo           := CreateCmDbField('IDGRUPO'          ,ftfloat ,False,False,False,True,'');
   fDescgrupoprod     := CreateCmDbField('DESCGRUPOPROD'    ,ftString,True,False,False,True,'Descrição');
   fCodtiprecdes      := CreateCmDbField('CODTIPRECDES'     ,ftString,False,False,False,True,'');
   fCodgrupoprod      := CreateCmDbField('CODGRUPOPROD'     ,ftString,True,True,False,True,'Código');
end;

function TDbGrupoProd.GetSqlSelect: String;
begin
   If Trim(fCodGrupoProd.AsString) <> '' Then
      Result := Inherited GetSqlSelect
   Else
     Result := ' SELECT CODGRUPOPROD,DESCGRUPOPROD,IDGRUPO, '+
               '        CODTIPRECDES,RECPAG,STATUSGRUPO,CODPAI,'+
               '        IDPESSOA,IDNATUREZAESTOQUE '+
               ' FROM GRUPPROD ORDER BY CODGRUPOPROD';
end;

function TDbGrupoProd.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbGrupoProd.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbGrupoProd.SetCodGrupoProd(const Value: TCmDbField);
begin
  FCodGrupoProd := Value;
end;

procedure TDbGrupoProd.SetCodTipRecDes(const Value: TCmDbField);
begin
  FCodTipRecDes := Value;
end;

procedure TDbGrupoProd.SetDescGrupoProd(const Value: TCmDbField);
begin
  FDescGrupoProd := Value;
end;

procedure TDbGrupoProd.SetIdGrupo(const Value: TCmDbField);
begin
  FIdGrupo := Value;
end;

procedure TDbGrupoProd.SetIdNaturezaEstoque(const Value: TCmDbField);
begin
  FIdNaturezaEstoque := Value;
end;

procedure TDbGrupoProd.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbGrupoProd.SetRecPag(const Value: TCmDbField);
begin
  FRecPag := Value;
end;

procedure TDbGrupoProd.SetStatusGrupo(const Value: TCmDbField);
begin
  FStatusGrupo := Value;
end;

end.






