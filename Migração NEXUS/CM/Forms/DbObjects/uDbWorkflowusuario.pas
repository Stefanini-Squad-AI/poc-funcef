{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbWorkflowusuario;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWorkflowusuario = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdworkflow: TCmDbField;
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetIdworkflow(const Value: TCmDbField);

  public

     Property Idworkflow: TCmDbField read FIdworkflow write SetIdworkflow;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbWorkflowusuario }

constructor TDbWorkflowusuario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WORKFLOWUSUARIO';

   fIdworkflow := CreateCmDbField('IDWORKFLOW',ftfloat,True,True,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
end;

procedure TDbWorkflowusuario.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbWorkflowusuario.SetIdworkflow(const Value: TCmDbField);
begin
  FIdworkflow := Value;
end;

end.



