{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebTpUsuCampo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebTpUsuCampo = class(TCmDbObject)

  private
    FIdtipousuario: TCmDbField;
    FIdcampo: TCmDbField;
    FTitulocampo: TCmDbField;
    FIdwebinterface: TCmDbField;
    FFlgdisponivel: TCmDbField;
    //Pendência 18467 - 16/02/2007 
    FIdregraacesso: TCmDbField;
    procedure SetIdregraacesso(const Value: TCmDbField);
    //Fim Pendência 18467
    procedure SetIdcampo(const Value: TCmDbField);
    procedure SetIdtipousuario(const Value: TCmDbField);
    procedure SetTitulocampo(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);
    procedure SetFlgdisponivel(const Value: TCmDbField);

  public

     Property Idtipousuario: TCmDbField read FIdtipousuario write SetIdtipousuario;
     Property Idcampo: TCmDbField read FIdcampo write SetIdcampo;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;
     Property Titulocampo: TCmDbField read FTitulocampo write SetTitulocampo;
     Property Flgdisponivel: TCmDbField read FFlgdisponivel write SetFlgdisponivel;
     //Pendência 18467 - 16/02/2007
     Property Idregraacesso: TCmDbField read FIdregraacesso write SetIdregraacesso;
     //FIm Pendência 18467

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWebTpUsuCampo }

constructor TDbWebTpUsuCampo.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBTPUSUCAMPO';

   fIdtipousuario  := CreateCmDbField('IDTIPOUSUARIO',ftfloat,True,True,False,False,'Tipo de Usuário da Web');
   fIdcampo        := CreateCmDbField('IDCAMPO',ftfloat,True,True,False,False,'Campo da Web');
   FIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftfloat,True,True,False,False,'Interface');
   fTitulocampo    := CreateCmDbField('TITULOCAMPO',ftString,True,False,False,False,'Título do Campo');
   fFlgdisponivel  := CreateCmDbField('FLGDISPONIVEL',ftString,False,False,False,False,'Disponível');
   //Pendência 18467 - 16/02/2007
   fIdregraacesso  := CreateCmDbField('IDREGRAACESSO',ftfloat,False,False,False,True,'Regra de acesso');
   //Fim Pendência 18467
end;

function TDbWebTpUsuCampo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbWebTpUsuCampo.SetFlgdisponivel(const Value: TCmDbField);
begin
  FFlgdisponivel := Value;
end;

procedure TDbWebTpUsuCampo.SetIdcampo(const Value: TCmDbField);
begin
  FIdcampo := Value;
end;

procedure TDbWebTpUsuCampo.SetIdtipousuario(const Value: TCmDbField);
begin
  FIdtipousuario := Value;
end;

procedure TDbWebTpUsuCampo.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebTpUsuCampo.SetTitulocampo(const Value: TCmDbField);
begin
  FTitulocampo := Value;
end;

//Pendência 18467 - 16/02/2007 
procedure TDbWebTpUsuCampo.SetIdregraacesso(const Value: TCmDbField);
begin
  FIdregraacesso := Value;
end;
//FIm Pendência 18467

end.



