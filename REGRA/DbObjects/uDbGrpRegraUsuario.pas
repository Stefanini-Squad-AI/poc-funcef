{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrpRegraUsuario;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbGrpRegraUsuario = class(TCmDbObject)

  private
    FFlginserir: TCmDbField;
    FFlgprocurar: TCmDbField;
    FFlgalterar: TCmDbField;
    FFlgexcluir: TCmDbField;
    FIdgruporegra: TCmDbField;
    FIdTiporegra: TCmDbField;
    FIdusuario: TCmDbField;
    fIdgruporegrausu: TCmDbField;

    procedure SetFlgalterar(const Value: TCmDbField);
    procedure SetFlgexcluir(const Value: TCmDbField);
    procedure SetFlginserir(const Value: TCmDbField);
    procedure SetFlgprocurar(const Value: TCmDbField);
    procedure SetIdgruporegra(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetIdTiporegra(const Value: TCmDbField);
    procedure SetIdgruporegrausu(const Value: TCmDbField);

    Function Insert :Boolean; Override;

  public


     Property Idgruporegrausu: TCmDbField read FIdgruporegrausu write SetIdgruporegrausu;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idgruporegra: TCmDbField read FIdgruporegra write SetIdgruporegra;
     Property IdTiporegra: TCmDbField read FIdTiporegra write SetIdTiporegra;
     Property Flgprocurar: TCmDbField read FFlgprocurar write SetFlgprocurar;
     Property Flginserir: TCmDbField read FFlginserir write SetFlginserir;
     Property Flgexcluir: TCmDbField read FFlgexcluir write SetFlgexcluir;
     Property Flgalterar: TCmDbField read FFlgalterar write SetFlgalterar;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbGrpRegraUsuario }

constructor TDbGrpRegraUsuario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _UpdateKeyFields      := True;

  TableName := 'GRUPOREGRAUSUARIO';

  fIdgruporegrausu := CreateCmDbField('IDGRUPOREGRAUSU',   ftfloat,True, True, False,False,'Usuário');

  fIdusuario    := CreateCmDbField('IDUSUARIO',   ftfloat, True,  True , False,False, 'Usuário');
  fIdgruporegra := CreateCmDbField('IDGRUPOREGRA',ftfloat, False, False, False,True,  'Grupo de Regra');
  fIdTiporegra  := CreateCmDbField('IDTIPOREGRA', ftfloat, False, False, False,True,  'Tipo de Regra');
  fFlgprocurar  := CreateCmDbField('FLGPROCURAR', ftfloat, False, False, False,False, 'Flag Procurar');
  fFlginserir   := CreateCmDbField('FLGINSERIR',  ftfloat, False, False, False,False, 'Flag Inserir');
  fFlgexcluir   := CreateCmDbField('FLGEXCLUIR',  ftfloat, False, False, False,False, 'Flag Excluir ');
  fFlgalterar   := CreateCmDbField('FLGALTERAR',  ftfloat, False, False, False,False, 'Flag Alterar');

end;

function TDbGrpRegraUsuario.Insert: Boolean;
begin

   fIdGruporegraUsu.AsFloat := GetSequence('GRUPOREGRAUSUARIO');
   Result := Inherited Insert;

end;

procedure TDbGrpRegraUsuario.SetFlgalterar(const Value: TCmDbField);
begin
  FFlgalterar := Value;
end;

procedure TDbGrpRegraUsuario.SetFlgexcluir(const Value: TCmDbField);
begin
  FFlgexcluir := Value;
end;

procedure TDbGrpRegraUsuario.SetFlginserir(const Value: TCmDbField);
begin
  FFlginserir := Value;
end;

procedure TDbGrpRegraUsuario.SetFlgprocurar(const Value: TCmDbField);
begin
  FFlgprocurar := Value;
end;

procedure TDbGrpRegraUsuario.SetIdgruporegra(const Value: TCmDbField);
begin
  FIdgruporegra := Value;
end;

procedure TDbGrpRegraUsuario.SetIdgruporegrausu(const Value: TCmDbField);
begin
  FIdgruporegrausu := Value;
end;

procedure TDbGrpRegraUsuario.SetIdTiporegra(const Value: TCmDbField);
begin
  FIdTiporegra := Value;
end;

procedure TDbGrpRegraUsuario.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



