//********************************************************************************************************
// Autor     : Fabio Fagundes
// Data	     : 05/12/2007
// Codigo    : AL_1
// Pendência : 26483
// SOL       :
// Função    : Implementação da funcionalidade
//********************************************************************************************************
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/12/2007                             }
{                                                       }
{*******************************************************}

unit uDbOrdemrenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOrdemrenfix = class(TCmDbObject)

  private
    FIdtipooperacao: TCmDbField;
    FIdinvestimento: TCmDbField;
    //FTxjuros: TCmDbField;
    //FIdtipoinvest: TCmDbField;
    FDatavencimento: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FValor: TCmDbField;
    FDataliquidacao: TCmDbField;
    FIdusuario: TCmDbField;
    FIdemissor: TCmDbField;
    FDataordem: TCmDbField;
    FPuoperacao: TCmDbField;
    FStalancada: TCmDbField;
    FStaautoriza: TCmDbField;
    FQuantidade: TCmDbField;
    //FPercmoeda: TCmDbField;
    FIdordemrenfix: TCmDbField;
    //FPercjuros: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdforcli: TCmDbField;
    FStaconfirma: TCmDbField;
    FIdusuarioAut: TCmDbField;
    FIdusuarioConf: TCmDbField;
    FIdOperRenfixAplic: TCmDbField;
    FIdoperrenfix: TCmDbField;
    //FMoecodigo: TCmDbField;
    procedure SetDataliquidacao(const Value: TCmDbField);
    procedure SetDataordem(const Value: TCmDbField);
    procedure SetDatavencimento(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdemissor(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdordemrenfix(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    //procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    //procedure SetMoecodigo(const Value: TCmDbField);
    //procedure SetPercjuros(const Value: TCmDbField);
    // SetPercmoeda(const Value: TCmDbField);
    procedure SetPuoperacao(const Value: TCmDbField);
    procedure SetQuantidade(const Value: TCmDbField);
    procedure SetStaautoriza(const Value: TCmDbField);
    procedure SetStaconfirma(const Value: TCmDbField);
    procedure SetStalancada(const Value: TCmDbField);
    //procedure SetTxjuros(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetIdusuarioAut(const Value: TCmDbField);
    procedure SetIdusuarioConf(const Value: TCmDbField);
    procedure SetIdOperRenfixAplic(const Value: TCmDbField);
    procedure SetIdoperrenfix(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     //Property Txjuros: TCmDbField read FTxjuros write SetTxjuros;
     Property Stalancada: TCmDbField read FStalancada write SetStalancada;
     Property Staconfirma: TCmDbField read FStaconfirma write SetStaconfirma;
     Property Staautoriza: TCmDbField read FStaautoriza write SetStaautoriza;
     Property Quantidade: TCmDbField read FQuantidade write SetQuantidade;
     Property Puoperacao: TCmDbField read FPuoperacao write SetPuoperacao;
     //Property Percmoeda: TCmDbField read FPercmoeda write SetPercmoeda;
     //Property Percjuros: TCmDbField read FPercjuros write SetPercjuros;
     //Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     //Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idordemrenfix: TCmDbField read FIdordemrenfix write SetIdordemrenfix;
     Property Idoperrenfix: TCmDbField read FIdoperrenfix write SetIdoperrenfix;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idemissor: TCmDbField read FIdemissor write SetIdemissor;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Datavencimento: TCmDbField read FDatavencimento write SetDatavencimento;
     Property Dataordem: TCmDbField read FDataordem write SetDataordem;
     Property Dataliquidacao: TCmDbField read FDataliquidacao write SetDataliquidacao;
     Property IdusuarioConf: TCmDbField read FIdusuarioConf write SetIdusuarioConf;
     Property IdusuarioAut: TCmDbField read FIdusuarioAut write SetIdusuarioAut;
     Property IdOperRenfixAplic : TCmDbField read FIdOperRenfixAplic write SetIdOperRenfixAplic;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOrdemrenfix }

constructor TDbOrdemrenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ORDEMRENFIX';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,True,'');
   //fTxjuros := CreateCmDbField('TXJUROS',ftfloat,True,False,False,True,'');
   fStalancada := CreateCmDbField('STALANCADA',ftString,False,False,False,True,'');
   fStaconfirma := CreateCmDbField('STACONFIRMA',ftString,False,False,False,True,'');
   fStaautoriza := CreateCmDbField('STAAUTORIZA',ftString,False,False,False,True,'');
   fQuantidade := CreateCmDbField('QUANTIDADE',ftfloat,True,False,False,True,'');
   fPuoperacao := CreateCmDbField('PUOPERACAO',ftfloat,True,False,False,True,'');
   //fPercmoeda := CreateCmDbField('PERCMOEDA',ftfloat,True,False,False,True,'');
   //fPercjuros := CreateCmDbField('PERCJUROS',ftfloat,True,False,False,True,'');
   //fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,True,False,False,True,'');
   //fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,True,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,True,False,False,True,'');
   fIdordemrenfix := CreateCmDbField('IDORDEMRENFIX',ftfloat,True,True,False,True,'');
   fIdoperrenfix := CreateCmDbField('IDOPERRENFIX',ftfloat,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,True,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,False,False,True,'');
   fIdemissor := CreateCmDbField('IDEMISSOR',ftfloat,True,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,True,False,False,True,'');
   fDatavencimento := CreateCmDbField('DATAVENCIMENTO',ftDateTime,True,False,False,True,'');
   fDataordem := CreateCmDbField('DATAORDEM',ftDateTime,True,False,False,True,'');
   fDataliquidacao := CreateCmDbField('DATALIQUIDACAO',ftDateTime,True,False,False,True,'');
   fIdusuarioConf:= CreateCmDbField('IDUSUARIOCONF',ftfloat,False,False,False,True,'');
   fIdusuarioAut := CreateCmDbField('IDUSUARIOAUT',ftfloat,False,False,False,True,'');
   fIdOperRenfixAplic := CreateCmDbField('IDOPERRENFIXAPLIC',ftfloat,False,False,False,True,'');
end;

function TDbOrdemrenfix.Insert: Boolean;
begin

   fIdordemrenfix.AsFloat := GetSequence('ORDEMRENFIX');
   Result := Inherited Insert;

end;


procedure TDbOrdemrenfix.SetDataliquidacao(const Value: TCmDbField);
begin
  FDataliquidacao := Value;
end;

procedure TDbOrdemrenfix.SetDataordem(const Value: TCmDbField);
begin
  FDataordem := Value;
end;

procedure TDbOrdemrenfix.SetDatavencimento(const Value: TCmDbField);
begin
  FDatavencimento := Value;
end;

procedure TDbOrdemrenfix.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbOrdemrenfix.SetIdemissor(const Value: TCmDbField);
begin
  FIdemissor := Value;
end;

procedure TDbOrdemrenfix.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbOrdemrenfix.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbOrdemrenfix.SetIdoperrenfix(const Value: TCmDbField);
begin
  FIdoperrenfix := Value;
end;

procedure TDbOrdemrenfix.SetIdOperRenfixAplic(const Value: TCmDbField);
begin
  FIdOperRenfixAplic := Value;
end;

procedure TDbOrdemrenfix.SetIdordemrenfix(const Value: TCmDbField);
begin
  FIdordemrenfix := Value;
end;

procedure TDbOrdemrenfix.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

//procedure TDbOrdemrenfix.SetIdtipoinvest(const Value: TCmDbField);
//begin
//  FIdtipoinvest := Value;
//end;

procedure TDbOrdemrenfix.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOrdemrenfix.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

//procedure TDbOrdemrenfix.SetMoecodigo(const Value: TCmDbField);
//begin
//  FMoecodigo := Value;
//end;

//procedure TDbOrdemrenfix.SetPercjuros(const Value: TCmDbField);
//begin
//  FPercjuros := Value;
//end;

//procedure TDbOrdemrenfix.SetPercmoeda(const Value: TCmDbField);
//begin
//  FPercmoeda := Value;
//end;

procedure TDbOrdemrenfix.SetIdusuarioAut(const Value: TCmDbField);
begin
  FIdusuarioAut := Value;
end;

procedure TDbOrdemrenfix.SetIdusuarioConf(const Value: TCmDbField);
begin
  FIdusuarioConf := Value;
end;

procedure TDbOrdemrenfix.SetPuoperacao(const Value: TCmDbField);
begin
  FPuoperacao := Value;
end;

procedure TDbOrdemrenfix.SetQuantidade(const Value: TCmDbField);
begin
  FQuantidade := Value;
end;

procedure TDbOrdemrenfix.SetStaautoriza(const Value: TCmDbField);
begin
  FStaautoriza := Value;
end;

procedure TDbOrdemrenfix.SetStaconfirma(const Value: TCmDbField);
begin
  FStaconfirma := Value;
end;

procedure TDbOrdemrenfix.SetStalancada(const Value: TCmDbField);
begin
  FStalancada := Value;
end;

//procedure TDbOrdemrenfix.SetTxjuros(const Value: TCmDbField);
//begin
//  FTxjuros := Value;
//end;

procedure TDbOrdemrenfix.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



