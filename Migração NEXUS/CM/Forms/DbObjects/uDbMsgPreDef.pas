{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/01/2007                             }
{                                                       }
{*******************************************************}

unit uDbMsgPreDef;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMsgPreDef = class(TCmDbObject)

  private
    FIdmsgpredef: TCmDbField;
    FIdmsgcontexto: TCmDbField;
    FDescricao: TCmDbField;
    FObs: TCmDbField;
    FTexto: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdmsgcontexto(const Value: TCmDbField);
    procedure SetIdmsgpredef(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetTexto(const Value: TCmDbField);

  public

     Property Texto: TCmDbField read FTexto write SetTexto;
     Property Obs: TCmDbField read FObs write SetObs;
     Property Idmsgpredef: TCmDbField read FIdmsgpredef write SetIdmsgpredef;
     Property Idmsgcontexto: TCmDbField read FIdmsgcontexto write SetIdmsgcontexto;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMsgPreDef }

constructor TDbMsgPreDef.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MSGPREDEF';

  fIdmsgpredef   := CreateCmDbField('IDMSGPREDEF',ftfloat,True,True,False,True,'Id. Msg. Pre. Def.');
  fDescricao     := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
  fObs           := CreateCmDbField('OBS',ftString,False,False,False,True,'Observação');
  fIdmsgcontexto := CreateCmDbField('IDMSGCONTEXTO',ftfloat,True,False,False,True,'Id. Msg. Contexto');  
  fTexto         := CreateCmDbField('TEXTO',ftString,True,False,False,True,'Texto');
end;

function TDbMsgPreDef.Insert: Boolean;
begin

   fIdmsgpredef.AsFloat := GetSequence('MSGPREDEF');
   Result := Inherited Insert;

end;


procedure TDbMsgPreDef.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbMsgPreDef.SetIdmsgcontexto(const Value: TCmDbField);
begin
  FIdmsgcontexto := Value;
end;

procedure TDbMsgPreDef.SetIdmsgpredef(const Value: TCmDbField);
begin
  FIdmsgpredef := Value;
end;

procedure TDbMsgPreDef.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbMsgPreDef.SetTexto(const Value: TCmDbField);
begin
  FTexto := Value;
end;

end.



