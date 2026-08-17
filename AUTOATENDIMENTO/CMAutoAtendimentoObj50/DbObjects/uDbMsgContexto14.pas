{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/02/2007                             }
{                                                       }
{*******************************************************}

unit uDbMsgContexto14;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMsgContexto = class(TCmDbObject)

  private
    FFlgtipoenvio: TCmDbField;
    FIdmodulo: TCmDbField;
    FDescricao: TCmDbField;
    FFlgconfigpropria: TCmDbField;
    FIdmsgcontexto: TCmDbField;
    FIdemailconexao: TCmDbField;
    FAssuntomsg: TCmDbField;
    FIdmsgpredef: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgconfigpropria(const Value: TCmDbField);
    procedure SetFlgtipoenvio(const Value: TCmDbField);
    procedure SetIdemailconexao(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmsgcontexto(const Value: TCmDbField);
    procedure SetAssuntomsg(const Value: TCmDbField);
    procedure SetIdmsgpredef(const Value: TCmDbField);

  public

     Property Idmsgcontexto: TCmDbField read FIdmsgcontexto write SetIdmsgcontexto;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idemailconexao: TCmDbField read FIdemailconexao write SetIdemailconexao;
     Property Flgtipoenvio: TCmDbField read FFlgtipoenvio write SetFlgtipoenvio;
     Property Flgconfigpropria: TCmDbField read FFlgconfigpropria write SetFlgconfigpropria;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Assuntomsg: TCmDbField read FAssuntomsg write SetAssuntomsg;
     Property Idmsgpredef: TCmDbField read FIdmsgpredef write SetIdmsgpredef;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMsgContexto }

constructor TDbMsgContexto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MSGCONTEXTO';

   fIdmsgcontexto := CreateCmDbField('IDMSGCONTEXTO',ftfloat,True,True,False,True,'Id. Contexto');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'Id. Módulo');
   fIdemailconexao := CreateCmDbField('IDEMAILCONEXAO',ftfloat,False,False,False,True,'Id. Conexão E-mail');
   fFlgtipoenvio := CreateCmDbField('FLGTIPOENVIO',ftfloat,False,False,False,False,'Tipo de Envio');
   fFlgconfigpropria := CreateCmDbField('FLGCONFIGPROPRIA',ftfloat,True,False,False,False,'Configuração Própria');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
   FAssuntomsg := CreateCmDbField('ASSUNTOMSG',ftString,False,False,False,True,'Assunto da Mensagem');
   FIdmsgpredef := CreateCmDbField('IDMSGPREDEF',ftfloat,False,False,False,True,'Id. Mensagem Pré-definida');
end;

function TDbMsgContexto.Insert: Boolean;
begin
   fIdmsgcontexto.AsFloat := GetSequence('MSGCONTEXTO');
   Result := Inherited Insert;
end;


procedure TDbMsgContexto.SetAssuntomsg(const Value: TCmDbField);
begin
  FAssuntomsg := Value;
end;

procedure TDbMsgContexto.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbMsgContexto.SetFlgconfigpropria(const Value: TCmDbField);
begin
  FFlgconfigpropria := Value;
end;

procedure TDbMsgContexto.SetFlgtipoenvio(const Value: TCmDbField);
begin
  FFlgtipoenvio := Value;
end;

procedure TDbMsgContexto.SetIdemailconexao(const Value: TCmDbField);
begin
  FIdemailconexao := Value;
end;

procedure TDbMsgContexto.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbMsgContexto.SetIdmsgcontexto(const Value: TCmDbField);
begin
  FIdmsgcontexto := Value;
end;

procedure TDbMsgContexto.SetIdmsgpredef(const Value: TCmDbField);
begin
  FIdmsgpredef := Value;
end;

end.



