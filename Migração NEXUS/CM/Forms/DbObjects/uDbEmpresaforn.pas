{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : fCadForne
 N. SIG..........   : 38475/84797
 Data da Alteração: : 12/04/2019
 Alteração Form:    : frmCadForne
 Responsável:       : Everson Cunha
 Descrição.......   : Inclusão dos campos DATAINIVINCULO e DATAFIMVINCULO.
--------------------------------------------------------------------------------
 Rotina             : Criação da classe
 N. SIG..........   : 23656.57136
 Data da Alteração: : 27/10/2017
 Alteração Form:    : uDbEmpresaForn
 Responsável:       : Cássio Rovaroto
 Descrição.......   : Inclusão dos campos FLGCPRB e ALIQCPRB.
--------------------------------------------------------------------------------
 Nº SOL............: 229878.16779
 Nº PPM............: 610132
 Data da Alteração.: 10/07/2015
 Alteração Form....: inclusão de campos
 Responsável.......: William Santana
 Descrição.........: Desenvolvimento do produto referente ao SOL 229878.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbEmpresaforn;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbEmpresaforn = class(TCmDbObject)

  private
    FCodcorresp: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgstatus: TCmDbField;
    FIdforcli: TCmDbField;
    FContacforn: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FUltcontato: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodsubconta: TCmDbField;
    FContacadiantamento: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FContacdespesa: TCmDbField;
    FCriaSubConta: Boolean;
    //Início - William Santana - SOL 229878.16779 PPM 610132
    FTpfornecedor : TCmDbField;
    //FFlgsofthouse : TCmDbField; //Everson Cunha - SIG38475
    FCbo : TCmDbField;
    FIdcategtrabaesocial : TCmDbField;
    FIdgrauexpagentesocial : TCmDbField;
    //Término - William Santana - SOL 229878.16779 PPM 610132
    //Cássio - SIG 57136 - Início
    FFlgCPRB: TCmDbField;
    FAliqCPRB: TCmDbField;
    //Cássio - SIG 57136 - Fim
    //SIG38475-84797 - Everson Cunha - Início
    FDataIniVinculo: TCmDbField;
    FDataFimVinculo: TCmDbField;
    //SIG38475-84797 - Everson Cunha - Fim

    FCargoFuncao: TCmDbField; //Everson Cunha - SIG38475

    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetContacadiantamento(const Value: TCmDbField);
    procedure SetContacdespesa(const Value: TCmDbField);
    procedure SetContacforn(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUltcontato(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetCriaSubConta(const Value: Boolean);

    //Início - William Santana - SOL 229878.16779 PPM 610132
    procedure SetTpfornecedor(const Value: TCmDbField);
    //procedure SetFlgsofthouse(const Value: TCmDbField); //Everson Cunha - SIG38475
    procedure SetCbo(const Value: TCmDbField);
    procedure SetIdcategtrabaesocial(const Value: TCmDbField);
    procedure SetIdgrauexpagentesocial(const Value: TCmDbField);
    //Término - William Santana - SOL 229878.16779 PPM 610132

    function InsereSubConta: Boolean;
    //Cássio - SIG 57136 - Início
    procedure SetFlgCPRB(const Value: TCmDbField);
    procedure SetAliqCPRB(const Value: TCmDbField);
    //Cássio - SIG 57136 - Fim
    //SIG38475-84797 - Everson Cunha - Início
    procedure SetDataIniVinculo(const Value: TCmDbField);
    procedure SetDataFimVinculo(const Value: TCmDbField);
    //SIG38475-84797 - Everson Cunha - Fim
    procedure SetCargoFuncao(const Value: TCmDbField);    

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Ultcontato: TCmDbField read FUltcontato write SetUltcontato;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Contacforn: TCmDbField read FContacforn write SetContacforn;
     Property Contacdespesa: TCmDbField read FContacdespesa write SetContacdespesa;
     Property Contacadiantamento: TCmDbField read FContacadiantamento write SetContacadiantamento;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     property CriaSubConta: Boolean read FCriaSubConta write SetCriaSubConta;

     //Início - William Santana - SOL 229878.16779 PPM 610132
     Property Tpfornecedor: TCmDbField read FTpfornecedor write FTpfornecedor;
     //Property Flgsofthouse: TCmDbField read FFlgsofthouse write FFlgsofthouse; //Everson Cunha - SIG38475
     Property Cbo: TCmDbField read FCbo write FCbo;
     Property Idcategtrabaesocial: TCmDbField read FIdcategtrabaesocial write FIdcategtrabaesocial;
     Property Idgrauexpagentesocial: TCmDbField read FIdgrauexpagentesocial write FIdgrauexpagentesocial;
     //Término - William Santana - SOL 229878.16779 PPM 610132

     //Cássio - SIG 57136 - Início
     Property FlgCPRB : TCmDbField read FFlgCPRB write SetFlgCPRB;
     Property AliqCPRB: TCmDbField read FAliqCPRB write SetAliqCPRB;
     //Cássio - SIG 57136 - Fim

     //SIG38475-84797 - Everson Cunha - Início
     property DataIniVinculo: TCmDbField read FDataIniVinculo write SetDataIniVinculo;
     property DataFimVinculo: TCmDbField read FDataFimVinculo write SetDataFimVinculo;
     //SIG38475-84797 - Everson Cunha - Fim

     property CargoFuncao: TCmDbField read FCargoFuncao write SetCargoFuncao; //Everson Cunha - SIG38475

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     destructor Destroy; Override;

     Function Insert: Boolean; Override;
     function Update: Boolean; Override;
     Function LoadFromDb: Boolean; Override;
  End;

implementation

Uses uDbSubcontaPadrao;

{ TDbEmpresaforn }

constructor TDbEmpresaforn.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EMPRESAFORN';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fUltcontato := CreateCmDbField('ULTCONTATO',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fContacforn := CreateCmDbField('CONTACFORN',ftString,False,False,False,True,'');
   fContacdespesa := CreateCmDbField('CONTACDESPESA',ftString,False,False,False,True,'');
   fContacadiantamento := CreateCmDbField('CONTACADIANTAMENTO',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   //Início - William Santana - SOL 229878.16779 PPM 610132
   fTpfornecedor := CreateCmDbField('TPFORNECEDOR',ftString,False,False,False,True,'');
   //fFlgsofthouse := CreateCmDbField('FLGSOFTHOUSE',ftString,False,False,False,True,''); //Everson Cunha - SIG38475
   fCbo := CreateCmDbField('CBO',ftfloat,False,False,False,True,'');
   fIdcategtrabaesocial := CreateCmDbField('IDCATEGTRABAESOCIAL',ftfloat,False,False,False,True,'');
   fIdgrauexpagentesocial := CreateCmDbField('IDGRAUEXPAGENTESOCIAL',ftfloat,False,False,False,True,'');
   //Término - William Santana - SOL 229878.16779 PPM 610132              
   //Cássio - SIG 57136 - Início
   fFlgCPRB := CreateCmDbField('FLGCPRB',ftfloat,False,False,False,False,'');
   fAliqCPRB := CreateCmDbField('ALIQCPRB', ftFloat, False, False, False, True, '');
   //Cássio - SIG 57136 - Fim
   //SIG38475-84797 - Everson Cunha - Início
   FDataIniVinculo := CreateCmDbField('DATAINIVINCULO',ftDateTime,False,False,False,True,'');
   FDataFimVinculo := CreateCmDbField('DATAFIMVINCULO',ftDateTime,False,False,False,True,'');
   //SIG38475-84797 - Everson Cunha - Fim

   FCargoFuncao := CreateCmDbField('CARGO_FUNCAO',ftString,False,False,False,True,''); //Everson Cunha - SIG38475
end;

destructor TDbEmpresaforn.Destroy;
begin
  inherited;
end;

function TDbEmpresaforn.InsereSubConta: Boolean;
Var
   dbSubConta: TDbSubcontaPadrao;
begin
   if FCriaSubConta and fCodsubconta.IsNull then
   begin
      dbSubConta := TDbSubcontaPadrao.Create(Owner);

      try
         dbSubConta.DataBaseName := Self.DataBaseName;
         result := dbSubConta.InsereSubContaForCli(FIdforcli.AsFloat, FIdPessoa.AsFloat);

         if result then
            Self.FCodsubconta.AsFloat := dbSubConta.Codsubconta.AsFloat
         else
            Self.MessageInfo := dbSubConta.MessageInfo;
      finally
         dbSubConta.free;
      end;
   end
   else
      result := true;
end;

function TDbEmpresaforn.Insert: Boolean;
begin
   result := InsereSubConta;
   
   if result then
      Result := Inherited Insert;
end;

function TDbEmpresaforn.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbEmpresaforn.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbEmpresaforn.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbEmpresaforn.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbEmpresaforn.SetContacadiantamento(const Value: TCmDbField);
begin
  FContacadiantamento := Value;
end;

procedure TDbEmpresaforn.SetContacdespesa(const Value: TCmDbField);
begin
  FContacdespesa := Value;
end;

procedure TDbEmpresaforn.SetContacforn(const Value: TCmDbField);
begin
  FContacforn := Value;
end;

procedure TDbEmpresaforn.SetCriaSubConta(const Value: Boolean);
begin
  FCriaSubConta := Value;
end;

procedure TDbEmpresaforn.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbEmpresaforn.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbEmpresaforn.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbEmpresaforn.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbEmpresaforn.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbEmpresaforn.SetUltcontato(const Value: TCmDbField);
begin
  FUltcontato := Value;
end;

procedure TDbEmpresaforn.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

function TDbEmpresaforn.Update: Boolean;
begin
  result := InsereSubConta;

  if result then
     Result := Inherited Update;
end;

//Início - William Santana - SOL 229878.16779 PPM 610132
procedure TDbEmpresaforn.SetTpfornecedor(const Value: TCmDbField);
begin
  FTpfornecedor := Value;
end;

//Everson Cunha - SIG38475 - Ini
{procedure TDbEmpresaforn.SetFlgsofthouse(const Value: TCmDbField);
begin
  FFlgsofthouse := Value;
end;}
//Everson Cunha - SIG38475 - Fim

procedure TDbEmpresaforn.SetCbo(const Value: TCmDbField);
begin
  FCbo := Value;
end;

procedure TDbEmpresaforn.SetIdcategtrabaesocial(const Value: TCmDbField);
begin
  FIdcategtrabaesocial := Value;
end;

procedure TDbEmpresaforn.SetIdgrauexpagentesocial(const Value: TCmDbField);
begin
  FIdgrauexpagentesocial := Value;
end;
//Término - William Santana - SOL 229878.16779 PPM 610132

procedure TDbEmpresaforn.SetFlgCPRB(const Value: TCmDbField);
begin
  FFlgCPRB := Value;
end;

procedure TDbEmpresaforn.SetAliqCPRB(const Value: TCmDbField);
begin
  FAliqCPRB := Value;
end;

procedure TDbEmpresaforn.SetDataIniVinculo(const Value: TCmDbField);
begin
  FDataIniVinculo := Value;
end;

procedure TDbEmpresaforn.SetDataFimVinculo(const Value: TCmDbField);
begin
  FDataFimVinculo := Value;
end;

procedure TDbEmpresaforn.SetCargoFuncao(const Value: TCmDbField);
begin
  FCargoFuncao := Value;
end;

end.



