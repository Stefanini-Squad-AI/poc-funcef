{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbTaberrosccp;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase, uCMSqlParams;

Type
  TDbTaberrosccp = class(TCmDbObject)

  private
    FIdcontrole: TCmDbField;
    FIdsitfunc: TCmDbField;
    FNomepatroc: TCmDbField;
    FDescsitpart: TCmDbField;
    FMatricula: TCmDbField;
    FIdpessjur: TCmDbField;
    FMsgexplicativa: TCmDbField;
    FMescobranca: TCmDbField;
    FCodprovento: TCmDbField;
    FDataref: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FIdsitpart: TCmDbField;
    FDescprovento: TCmDbField;
    FValor: TCmDbField;
    FDescsitfunc: TCmDbField;
    procedure SetCodprovento(const Value: TCmDbField);
    procedure SetDataref(const Value: TCmDbField);
    procedure SetDescprovento(const Value: TCmDbField);
    procedure SetDescsitfunc(const Value: TCmDbField);
    procedure SetDescsitpart(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdcontrole(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdsitfunc(const Value: TCmDbField);
    procedure SetIdsitpart(const Value: TCmDbField);
    procedure SetMatricula(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetMsgexplicativa(const Value: TCmDbField);
    procedure SetNomepatroc(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Nomepatroc: TCmDbField read FNomepatroc write SetNomepatroc;
     Property Msgexplicativa: TCmDbField read FMsgexplicativa write SetMsgexplicativa;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Matricula: TCmDbField read FMatricula write SetMatricula;
     Property Idsitpart: TCmDbField read FIdsitpart write SetIdsitpart;
     Property Idsitfunc: TCmDbField read FIdsitfunc write SetIdsitfunc;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idcontrole: TCmDbField read FIdcontrole write SetIdcontrole;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Descsitpart: TCmDbField read FDescsitpart write SetDescsitpart;
     Property Descsitfunc: TCmDbField read FDescsitfunc write SetDescsitfunc;
     Property Descprovento: TCmDbField read FDescprovento write SetDescprovento;
     Property Dataref: TCmDbField read FDataref write SetDataref;
     Property Codprovento: TCmDbField read FCodprovento write SetCodprovento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     

  End;

implementation

{ TDbTaberrosccp }

constructor TDbTaberrosccp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABERROSCCP';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fNomepatroc := CreateCmDbField('NOMEPATROC',ftString,False,False,False,True,'');
   fMsgexplicativa := CreateCmDbField('MSGEXPLICATIVA',ftString,False,False,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,False,False,True,'');
   fMatricula := CreateCmDbField('MATRICULA',ftString,False,False,False,True,'');
   fIdsitpart := CreateCmDbField('IDSITPART',ftfloat,False,False,False,True,'');
   fIdsitfunc := CreateCmDbField('IDSITFUNC',ftfloat,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,False,False,True,'');
   fIdcontrole := CreateCmDbField('IDCONTROLE',ftfloat,True,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,False,False,True,'');
   fDescsitpart := CreateCmDbField('DESCSITPART',ftString,False,False,False,True,'');
   fDescsitfunc := CreateCmDbField('DESCSITFUNC',ftString,False,False,False,True,'');
   fDescprovento := CreateCmDbField('DESCPROVENTO',ftString,False,False,False,True,'');
   fDataref := CreateCmDbField('DATAREF',ftString,False,False,False,True,'');
   fCodprovento := CreateCmDbField('CODPROVENTO',ftString,False,False,False,True,'');
end;

function TDbTaberrosccp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;





procedure TDbTaberrosccp.SetCodprovento(const Value: TCmDbField);
begin
  FCodprovento := Value;
end;

procedure TDbTaberrosccp.SetDataref(const Value: TCmDbField);
begin
  FDataref := Value;
end;

procedure TDbTaberrosccp.SetDescprovento(const Value: TCmDbField);
begin
  FDescprovento := Value;
end;

procedure TDbTaberrosccp.SetDescsitfunc(const Value: TCmDbField);
begin
  FDescsitfunc := Value;
end;

procedure TDbTaberrosccp.SetDescsitpart(const Value: TCmDbField);
begin
  FDescsitpart := Value;
end;

procedure TDbTaberrosccp.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDbTaberrosccp.SetIdcontrole(const Value: TCmDbField);
begin
  FIdcontrole := Value;
end;

procedure TDbTaberrosccp.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbTaberrosccp.SetIdsitfunc(const Value: TCmDbField);
begin
  FIdsitfunc := Value;
end;

procedure TDbTaberrosccp.SetIdsitpart(const Value: TCmDbField);
begin
  FIdsitpart := Value;
end;

procedure TDbTaberrosccp.SetMatricula(const Value: TCmDbField);
begin
  FMatricula := Value;
end;

procedure TDbTaberrosccp.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDbTaberrosccp.SetMsgexplicativa(const Value: TCmDbField);
begin
  FMsgexplicativa := Value;
end;

procedure TDbTaberrosccp.SetNomepatroc(const Value: TCmDbField);
begin
  FNomepatroc := Value;
end;

procedure TDbTaberrosccp.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;



end.



