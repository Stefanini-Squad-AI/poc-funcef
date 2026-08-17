{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebTpUsuPagina;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebTpUsuPagina = class(TCmDbObject)

  private
    FIdpagina: TCmDbField;
    FIdtipousuario: TCmDbField;
    FTitulopagina: TCmDbField;
    FPagconteudo: TCmDbField;
    FFlgusapadrao: TCmDbField;
    FLayeracesso: TCmDbField;
    FIdwebinterface: TCmDbField;
    FFlgdisponivel: TCmDbField;
    FFlgcontaacesso: TCmDbField;
    //Pendência 18467 - 16/02/2007 
    FIdregraacesso: TCmDbField;
    procedure SetIdregraacesso(const Value: TCmDbField);
    //FIm Pendência 18467
    procedure SetIdpagina(const Value: TCmDbField);
    procedure SetIdtipousuario(const Value: TCmDbField);
    procedure SetTitulopagina(const Value: TCmDbField);
    procedure SetFlgusapadrao(const Value: TCmDbField);
    procedure SetPagconteudo(const Value: TCmDbField);
    procedure SetLayeracesso(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);
    procedure SetFlgdisponivel(const Value: TCmDbField);
    procedure SetFlgcontaacesso(const Value: TCmDbField);

  public

     Property Idtipousuario: TCmDbField read FIdtipousuario write SetIdtipousuario;
     Property Idpagina: TCmDbField read FIdpagina write SetIdpagina;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;
     Property Titulopagina: TCmDbField read FTitulopagina write SetTitulopagina;
     Property Flgusapadrao: TCmDbField read FFlgusapadrao write SetFlgusapadrao;
     Property Pagconteudo: TCmDbField read FPagconteudo write SetPagconteudo;
     Property Layeracesso: TCmDbField read FLayeracesso write SetLayeracesso;
     Property Flgdisponivel: TCmDbField read FFlgdisponivel write SetFlgdisponivel;
     Property Flgcontaacesso: TCmDbField read FFlgcontaacesso write SetFlgcontaacesso;
     //Pendência 18467 - 16/02/2007
     Property Idregraacesso: TCmDbField read FIdregraacesso write SetIdregraacesso;
     //Fim Pendência 18467

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWebTpUsuPagina }

constructor TDbWebTpUsuPagina.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBTPUSUPAGINA';

   fIdtipousuario  := CreateCmDbField('IDTIPOUSUARIO',ftfloat,True,True,False,False,'Tipo de Usuário da Web');
   fIdpagina       := CreateCmDbField('IDPAGINA',ftfloat,True,True,False,False,'Página da Web');
   FIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftfloat,True,True,False,False,'Interface');
   fTitulopagina   := CreateCmDbField('TITULOPAGINA',ftString,True,False,False,False,'Título da Página');
   fFlgusapadrao   := CreateCmDbField('FLGUSAPADRAO',ftString,True,False,False,False,'Usa página padrão?');
   fPagconteudo    := CreateCmDbField('PAGCONTEUDO',ftString,False,False,False,False,'Página de Conteúdo');
   fLayeracesso    := CreateCmDbField('LAYERACESSO',ftString,False,False,False,False,'Layer de acesso');
   fFlgdisponivel  := CreateCmDbField('FLGDISPONIVEL',ftString,False,False,False,False,'Disponível');
   fFlgcontaacesso := CreateCmDbField('FLGCONTAACESSO',ftString,False,False,False,False,'Contabiliza acessos');
   //Pendência 18467 - 16/02/2007
   fIdregraacesso  := CreateCmDbField('IDREGRAACESSO',ftfloat,False,False,False,True,'Regra de acesso');
   //Fim Pendência 18467
end;

function TDbWebTpUsuPagina.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbWebTpUsuPagina.SetIdpagina(const Value: TCmDbField);
begin
  FIdpagina := Value;
end;

procedure TDbWebTpUsuPagina.SetIdtipousuario(const Value: TCmDbField);
begin
  FIdtipousuario := Value;
end;

procedure TDbWebTpUsuPagina.SetLayeracesso(const Value: TCmDbField);
begin
  FLayeracesso := Value;
end;

procedure TDbWebTpUsuPagina.SetPagconteudo(const Value: TCmDbField);
begin
  FPagconteudo := Value;
end;

procedure TDbWebTpUsuPagina.SetTitulopagina(const Value: TCmDbField);
begin
  FTitulopagina := Value;
end;

procedure TDbWebTpUsuPagina.SetFlgusapadrao(const Value: TCmDbField);
begin
  FFlgusapadrao := Value;
end;


procedure TDbWebTpUsuPagina.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebTpUsuPagina.SetFlgdisponivel(const Value: TCmDbField);
begin
  FFlgdisponivel := Value;
end;

procedure TDbWebTpUsuPagina.SetFlgcontaacesso(const Value: TCmDbField);
begin
  FFlgcontaacesso := Value;
end;

//Pendência 18467 - 16/02/2007 
procedure TDbWebTpUsuPagina.SetIdregraacesso(const Value: TCmDbField);
begin
  FIdregraacesso := Value;
end;
//Fim Pendência 18467

end.



