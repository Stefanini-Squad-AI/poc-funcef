{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/05/2002                             }
{                                                       }
{*******************************************************}

//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 103856
//Data da Alteração: : 30/06/2021 
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGRECCUSTCONTRATO.
//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 115585 
//Data da Alteração: : 18/05/2021
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retirada do campo FLGMAODEOBRA, para a definição de cessão de mão de obra.
//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 23656.59194
//Data da Alteração: : 27/11/2017
//Alteração Form:    : uDbTipocustoRecImov
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGMAODEOBRA na tabela TIPOCUSTORECIMOV, a fim
//										 de possibilitar a definição de cessão de mão de obra.
//***************************************************************************************

unit uDbTipocustoRecImov;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipocustoRecImov = class(TCmDbObject)

  private
    FReccusto: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FFlgobrigaorc: TCmDbField;
    FIdtipodespesa: TCmDbField;
    FCodtipdoc: TCmDbField;
    FDesccustorecimo: TCmDbField;
    FIdreceitareemb: TCmDbField;
    FIdmodulo: TCmDbField;
    FFlgreembolso: TCmDbField;
    FFlgobrigaorcprest: TCmDbField;
    FFlgdiario: TCmDbField;
    FIdOperContab: TCmDbField;
    FFlgRentab: TCmDbField;

    FFlgTipoOper :TCmDbField;
    FFlgBloqJudicial: TCmDbField;
    FFlgMaoDeObra: TCmDbField;
    FFlgRecCustContrato: TCmDbField;


    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetDesccustorecimo(const Value: TCmDbField);
    procedure SetFlgobrigaorc(const Value: TCmDbField);
    procedure SetFlgobrigaorcprest(const Value: TCmDbField);
    procedure SetFlgreembolso(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdreceitareemb(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetIdtipodespesa(const Value: TCmDbField);
    procedure SetReccusto(const Value: TCmDbField);
    procedure SetFlgdiario(const Value: TCmDbField);
    procedure SetIdOperContab(const Value: TCmDbField);
    procedure SetFlgRentab(const Value: TCmDbField);

    procedure SetFlgTipoOper(const Value: TCmDbField);
    procedure SetFlgBloqJudicial(const Value: TCmDbField);
    procedure SetFlgMaoDeObra(const Value: TCmDbField);
    procedure SetFlgRecCustContrato(const Value: TCmDbField);

  public

     Property Reccusto: TCmDbField read FReccusto write SetReccusto;
     Property Idtipodespesa: TCmDbField read FIdtipodespesa write SetIdtipodespesa;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idreceitareemb: TCmDbField read FIdreceitareemb write SetIdreceitareemb;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Flgreembolso: TCmDbField read FFlgreembolso write SetFlgreembolso;
     Property Flgobrigaorcprest: TCmDbField read FFlgobrigaorcprest write SetFlgobrigaorcprest;
     Property Flgobrigaorc: TCmDbField read FFlgobrigaorc write SetFlgobrigaorc;
     Property Desccustorecimo: TCmDbField read FDesccustorecimo write SetDesccustorecimo;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Flgdiario:  TCmDbField read FFlgdiario write SetFlgdiario;
     Property FlgRentab:  TCmDbField read FFlgRentab write SetFlgRentab;
     Property IdOperContab: TCmDbField read FIdOperContab write SetIdOperContab;
     property FlgBloqJudicial: TCmDbField read FFlgBloqJudicial write SetFlgBloqJudicial;

     Property FlgTipoOper:  TCmDbField read FFlgTipoOper write SetFlgTipoOper;

     //Cássio Rovaroto - SIG nº 23656.59194 - Início
     property FlgMaoDeObra: TCmDbField read FFlgMaoDeObra write SetFlgMaoDeObra;
     //Cássio Rovaroto - SIG nº 23656.59194 - Fim

     property FlgRecCustContrato: TCmDbField read FFlgRecCustContrato write SetFlgRecCustContrato; //Cássio Rovaroto - SIG nº 103856

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipocustoRecImov }

constructor TDbTipocustoRecImov.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOCUSTORECIMOV';

   fReccusto := CreateCmDbField('RECCUSTO',ftString,True,False,False,True,'Receber / Pagar');
   fIdtipodespesa := CreateCmDbField('IDTIPODESPESA',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,True,True,False,True,'');
   fIdreceitareemb := CreateCmDbField('IDRECEITAREEMB',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fFlgreembolso := CreateCmDbField('FLGREEMBOLSO',ftString,False,False,False,True,'');
   fFlgobrigaorcprest := CreateCmDbField('FLGOBRIGAORCPREST',ftfloat,False,False,False,True,'');
   fFlgobrigaorc := CreateCmDbField('FLGOBRIGAORC',ftfloat,False,False,False,True,'');
   fDesccustorecimo := CreateCmDbField('DESCCUSTORECIMO',ftString,True,False,False,True,'Descrição');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   FFlgdiario := CreateCmDbField('FLGDIARIO',ftString,False,False,False,True,'Periodicidade da contabilização diária');
   FFlgRentab := CreateCmDbField('FLGRENTAB',ftfloat,False,False,False,False,'Considera para calculo de Rentabilidade');
   fIdOperContab := CreateCmDbField('IDOPERCONTAB',ftfloat,False,False,False,True,'2a. Operação Contábil');

   FFlgTipoOper := CreateCmDbField('FLGTIPOOPER',ftString,False,False,False,True,'Identifica o tipo de operação');

   FFlgBloqJudicial := CreateCmDbField('FLGBLOQJUDICIAL',ftfloat,False,False,False,False,'');

   //Cássio Rovaroto - SIG nº 115585 - Início
   //Cássio Rovaroto -  SIG nº 23656.59194
   //FFlgMaoDeObra := CreateCmDbField('FLGMAODEOBRA', ftString, false, false, false, false, 'Identifica a cessão de mão de obra');
   //Cássio Rovaroto -  SIG nº 115585 - Fim
   FFlgRecCustContrato := CreateCmDbField('FLGRECCUSTCONTRATO', ftFloat, false, false, false, false, 'Lançamento apenas para contratos válidos'); //Cássio Rovaroto - SIG nº 103856 

end;

function TDbTipocustoRecImov.Insert: Boolean;
begin

   fIdtipocustorecimo.AsFloat := GetSequence('TIPOCUSTORECIMOV');
   Result := Inherited Insert;

end;

function TDbTipocustoRecImov.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipocustoRecImov.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbTipocustoRecImov.SetDesccustorecimo(const Value: TCmDbField);
begin
  FDesccustorecimo := Value;
end;

procedure TDbTipocustoRecImov.SetFlgdiario(const Value: TCmDbField);
begin
  FFlgdiario := Value;
end;

procedure TDbTipocustoRecImov.SetFlgobrigaorc(const Value: TCmDbField);
begin
  FFlgobrigaorc := Value;
end;

procedure TDbTipocustoRecImov.SetFlgobrigaorcprest(const Value: TCmDbField);
begin
  FFlgobrigaorcprest := Value;
end;

procedure TDbTipocustoRecImov.SetFlgreembolso(const Value: TCmDbField);
begin
  FFlgreembolso := Value;
end;

procedure TDbTipocustoRecImov.SetFlgRentab(const Value: TCmDbField);
begin
  FFlgRentab := Value;
end;

procedure TDbTipocustoRecImov.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbTipocustoRecImov.SetIdOperContab(const Value: TCmDbField);
begin
  FIdOperContab := Value;
end;

procedure TDbTipocustoRecImov.SetIdreceitareemb(const Value: TCmDbField);
begin
  FIdreceitareemb := Value;
end;

procedure TDbTipocustoRecImov.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbTipocustoRecImov.SetIdtipodespesa(const Value: TCmDbField);
begin
  FIdtipodespesa := Value;
end;

procedure TDbTipocustoRecImov.SetReccusto(const Value: TCmDbField);
begin
  FReccusto := Value;
end;


procedure TDbTipocustoRecImov.SetFlgTipoOper(const Value: TCmDbField);
begin
  FFlgTipoOper := Value;
end;


procedure TDbTipocustoRecImov.SetFlgBloqJudicial(const Value: TCmDbField);
begin
  FFlgBloqJudicial := Value;
end;

procedure TDbTipocustoRecImov.SetFlgMaoDeObra(const Value: TCmDbField);
begin
  FFlgMaoDeObra := Value;
end;

procedure TDbTipocustoRecImov.SetFlgRecCustContrato(
  const Value: TCmDbField);
begin
  FFlgRecCustContrato := Value;
end;

end.



