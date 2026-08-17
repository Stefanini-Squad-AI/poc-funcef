{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRadEtapaNovo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadEtapa = class(TCmDbObject)

  private
    FFlgacaoaprova: TCmDbField;
    FIdgrprespon: TCmDbField;
    FNumetapaelse: TCmDbField;
    FIdradetapa: TCmDbField;
    FFlgetaparetorno: TCmDbField;
    FFlgavisogrupo: TCmDbField;
    FDescricao: TCmDbField;
    FFlgavisos: TCmDbField;
    FFlgavisosolic: TCmDbField;
    FFlgpoderetornar: TCmDbField;
    FAvisooutros: TCmDbField;
    FNumetaparet: TCmDbField;
    FPrazoestimado: TCmDbField;
    FFlgpoderecusar: TCmDbField;
    FNumero: TCmDbField;
    FIdradtipoproc: TCmDbField;
    FQtdeautoriza: TCmDbField;
    FFlgelse: TCmDbField;
    FNumetapadest: TCmDbField;
    FFlgqtdeautoriza: TCmDbField;
    procedure SetAvisooutros(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgacaoaprova(const Value: TCmDbField);
    procedure SetFlgavisogrupo(const Value: TCmDbField);
    procedure SetFlgavisos(const Value: TCmDbField);
    procedure SetFlgavisosolic(const Value: TCmDbField);
    procedure SetFlgelse(const Value: TCmDbField);
    procedure SetNumetapadest(const Value: TCmDbField);
    procedure SetFlgetaparetorno(const Value: TCmDbField);
    procedure SetFlgpoderecusar(const Value: TCmDbField);
    procedure SetFlgpoderetornar(const Value: TCmDbField);
    procedure SetIdgrprespon(const Value: TCmDbField);
    procedure SetIdradetapa(const Value: TCmDbField);
    procedure SetIdradtipoproc(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetNumetapaelse(const Value: TCmDbField);
    procedure SetNumetaparet(const Value: TCmDbField);
    procedure SetPrazoestimado(const Value: TCmDbField);
    procedure SetQtdeautoriza(const Value: TCmDbField);
    procedure SetFlgqtdeautoriza(const Value: TCmDbField);

  public

     Property Flgqtdeautoriza: TCmDbField read FFlgqtdeautoriza write SetFlgqtdeautoriza;
     Property Qtdeautoriza: TCmDbField read FQtdeautoriza write SetQtdeautoriza;
     Property Prazoestimado: TCmDbField read FPrazoestimado write SetPrazoestimado;
     Property Numetaparet: TCmDbField read FNumetaparet write SetNumetaparet;
     Property Numetapaelse: TCmDbField read FNumetapaelse write SetNumetapaelse;
     Property Numero: TCmDbField read FNumero write SetNumero;
     Property Idradtipoproc: TCmDbField read FIdradtipoproc write SetIdradtipoproc;
     Property Idradetapa: TCmDbField read FIdradetapa write SetIdradetapa;
     Property Idgrprespon: TCmDbField read FIdgrprespon write SetIdgrprespon;
     Property Flgpoderetornar: TCmDbField read FFlgpoderetornar write SetFlgpoderetornar;
     Property Flgpoderecusar: TCmDbField read FFlgpoderecusar write SetFlgpoderecusar;
     Property Flgetaparetorno: TCmDbField read FFlgetaparetorno write SetFlgetaparetorno;
     Property Numetapadest: TCmDbField read FNumetapadest write SetNumetapadest;
     Property Flgelse: TCmDbField read FFlgelse write SetFlgelse;
     Property Flgavisosolic: TCmDbField read FFlgavisosolic write SetFlgavisosolic;
     Property Flgavisos: TCmDbField read FFlgavisos write SetFlgavisos;
     Property Flgavisogrupo: TCmDbField read FFlgavisogrupo write SetFlgavisogrupo;
     Property Flgacaoaprova: TCmDbField read FFlgacaoaprova write SetFlgacaoaprova;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Avisooutros: TCmDbField read FAvisooutros write SetAvisooutros;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRadEtapa }

constructor TDbRadEtapa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADETAPA';

   fFlgqtdeautoriza := CreateCmDbField('FLGQTDEAUTORIZA',ftfloat,False,False,False,True,'Quantidade necessária de autorizações');
   fQtdeautoriza := CreateCmDbField('QTDEAUTORIZA',ftfloat,False,False,False,True,'Quantidade de autorizações');
   fPrazoestimado := CreateCmDbField('PRAZOESTIMADO',ftString,False,False,False,False,'Prazo estimado');
   fNumetaparet := CreateCmDbField('NUMETAPARET',ftFloat,False,False,False,True,'Etapa de retorno');
   fNumetapaelse := CreateCmDbField('NUMETAPAELSE',ftfloat,False,False,False,True,'Etapa caso não haja condição atendida');
   fNumero := CreateCmDbField('NUMERO',ftfloat,True,False,False,False,'Número');
   fIdradtipoproc := CreateCmDbField('IDRADTIPOPROC',ftfloat,True,False,False,True,'Id. Tipo de Processo');
   fIdradetapa := CreateCmDbField('IDRADETAPA',ftfloat,True,True,False,True,'Id. Etapa');
   fIdgrprespon := CreateCmDbField('IDGRPRESPON',ftfloat,False,False,False,True,'Id. Grupo Responsabilidade');
   fFlgpoderetornar := CreateCmDbField('FLGPODERETORNAR',ftfloat,False,False,False,False,'Pode retornar');
   fFlgpoderecusar := CreateCmDbField('FLGPODERECUSAR',ftfloat,False,False,False,False,'Pode recusar');
   fFlgetaparetorno := CreateCmDbField('FLGETAPARETORNO',ftFloat,False,False,False,False,'Retornar para etapa');
   fNumetapadest := CreateCmDbField('NUMETAPADEST',ftfloat,False,False,False,True,'Etapa destino');
   fFlgelse := CreateCmDbField('FLGELSE',ftfloat,False,False,False,True,'Ação caso não haja condição atendida');
   fFlgavisosolic := CreateCmDbField('FLGAVISOSOLIC',ftfloat,False,False,False,False,'Avisa solicitante');
   fFlgavisos := CreateCmDbField('FLGAVISOS',ftfloat,False,False,False,True,'Avisos');
   fFlgavisogrupo := CreateCmDbField('FLGAVISOGRUPO',ftfloat,False,False,False,False,'Avisa grupo');
   fFlgacaoaprova := CreateCmDbField('FLGACAOAPROVA',ftfloat,True,False,False,True,'Ação na aprovação');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,False,'Descrição da etapa');
   fAvisooutros := CreateCmDbField('AVISOOUTROS',ftString,False,False,False,False,'Outros destinatários de avisos');
end;

procedure TDbRadEtapa.SetAvisooutros(const Value: TCmDbField);
begin
  FAvisooutros := Value;
end;

procedure TDbRadEtapa.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRadEtapa.SetFlgacaoaprova(const Value: TCmDbField);
begin
  FFlgacaoaprova := Value;
end;

procedure TDbRadEtapa.SetFlgavisogrupo(const Value: TCmDbField);
begin
  FFlgavisogrupo := Value;
end;

procedure TDbRadEtapa.SetFlgavisos(const Value: TCmDbField);
begin
  FFlgavisos := Value;
end;

procedure TDbRadEtapa.SetFlgavisosolic(const Value: TCmDbField);
begin
  FFlgavisosolic := Value;
end;

procedure TDbRadEtapa.SetFlgelse(const Value: TCmDbField);
begin
  FFlgelse := Value;
end;

procedure TDbRadEtapa.SetNumetapadest(const Value: TCmDbField);
begin
  FNumetapadest := Value;
end;

procedure TDbRadEtapa.SetFlgetaparetorno(const Value: TCmDbField);
begin
  FFlgetaparetorno := Value;
end;

procedure TDbRadEtapa.SetFlgpoderecusar(const Value: TCmDbField);
begin
  FFlgpoderecusar := Value;
end;

procedure TDbRadEtapa.SetFlgpoderetornar(const Value: TCmDbField);
begin
  FFlgpoderetornar := Value;
end;

procedure TDbRadEtapa.SetIdgrprespon(const Value: TCmDbField);
begin
  FIdgrprespon := Value;
end;

procedure TDbRadEtapa.SetIdradetapa(const Value: TCmDbField);
begin
  FIdradetapa := Value;
end;

procedure TDbRadEtapa.SetIdradtipoproc(const Value: TCmDbField);
begin
  FIdradtipoproc := Value;
end;

procedure TDbRadEtapa.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDbRadEtapa.SetNumetapaelse(const Value: TCmDbField);
begin
  FNumetapaelse := Value;
end;

procedure TDbRadEtapa.SetNumetaparet(const Value: TCmDbField);
begin
  FNumetaparet := Value;
end;

procedure TDbRadEtapa.SetPrazoestimado(const Value: TCmDbField);
begin
  FPrazoestimado := Value;
end;

procedure TDbRadEtapa.SetQtdeautoriza(const Value: TCmDbField);
begin
  FQtdeautoriza := Value;
end;

procedure TDbRadEtapa.SetFlgqtdeautoriza(const Value: TCmDbField);
begin
  FFlgqtdeautoriza := Value;
end;

end.



