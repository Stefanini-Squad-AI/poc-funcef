{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpExecRot;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpExecRot = class(TCmDbObject)

  private
    FFlgstatus: TCmDbField;
    FDtexecucao: TCmDbField;
    FIdusuario: TCmDbField;
    FIdcpexecrot: TCmDbField;
    FDtref: TCmDbField;
    FIdcpativo: TCmDbField;
    FIdcpvalorcota: TCmDbField;
    procedure SetDtexecucao(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdcpexecrot(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetDtref(const Value: TCmDbField);
    procedure SetIdcpativo(const Value: TCmDbField);
    procedure SetIdcpvalorcota(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idcpativo: TCmDbField read FIdcpativo write SetIdcpativo;
     Property Idcpexecrot: TCmDbField read FIdcpexecrot write SetIdcpexecrot;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Dtexecucao: TCmDbField read FDtexecucao write SetDtexecucao;
     Property Dtref: TCmDbField read FDtref write SetDtref;
     Property Idcpvalorcota: TCmDbField read FIdcpvalorcota write SetIdcpvalorcota;

     constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbCpExecRot }

constructor TDbCpExecRot.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPEXECROT';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Id. Usuário');
   fIdcpexecrot := CreateCmDbField('IDCPEXECROT',ftfloat,True,True,False,True,'Id. Execução');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,True,False,False,True,'Status');
   fDtexecucao := CreateCmDbField('DTEXECUCAO',ftDateTime,True,False,False,True,'Data de Execução');
   fDtref := CreateCmDbField('DTREF',ftDateTime,True,False,False,True,'Data de referência' );
   fIdcpativo := CreateCmDbField('IDCPATIVO',ftfloat,True,False,False,True,'Id. Ativo');
   fIdcpvalorcota :=  CreateCmDbField('IDCPVALORCOTA',ftfloat,False,False,False,True,'Id. Valor Cota');
end;

procedure TDbCpExecRot.SetDtexecucao(const Value: TCmDbField);
begin
  FDtexecucao := Value;
end;

procedure TDbCpExecRot.SetDtref(const Value: TCmDbField);
begin
  FDtref := Value;
end;

procedure TDbCpExecRot.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbCpExecRot.SetIdcpativo(const Value: TCmDbField);
begin
  FIdcpativo := Value;
end;

procedure TDbCpExecRot.SetIdcpexecrot(const Value: TCmDbField);
begin
  FIdcpexecrot := Value;
end;

procedure TDbCpExecRot.SetIdcpvalorcota(const Value: TCmDbField);
begin
  FIdcpvalorcota := Value;
end;

procedure TDbCpExecRot.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



