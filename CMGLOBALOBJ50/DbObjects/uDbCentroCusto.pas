{-------------------------------------------------------------------------------
 ----------------------------- Alterações --------------------------------------
 -------------------------------------------------------------------------------
N. SIG..........   : 48344
Rotina             : Create
Data da Alteração: : 17/12/2018
Responsável:       : Everson Cunha
Descrição.......   : Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Rotina             : Create
N. SIG..........   : 59823.59824
Data da Alteração: : 07/12/2017
Alteração Form:    : uDbCentroCusto
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Remoção do campo CODLOTACAOESOCIAL da tabela CENTCUST
--------------------------------------------------------------------------------
 Autor......: Andre Imakawa
 Data.......: 06/01/2016
 Sol........: 258754/17869
 PPM........: 1136600
 Descrição..: Removido campo IdLotacao e criado o campo CodLotacaoeSocial.
--------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/12/2014
 Sol........: 229874/16591
 Kintana....: 544751
 Descrição..: inclusão do campo IdLotacao
--------------------------------------------------------------------------------
 Autor......: Mosé Pietro
 Data.......: 13/09/2012
 Sol........: 176165
 Kintana....: 1609814
 Descrição..: Inclusão do campo código de área (CODAREA)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 29/10/2003
Pendencia : 14802
Descrição : IDPLANCRESPON, CODEXTERNO, sequence: alterações decorrentes
            do De/Para
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbCentroCusto;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase, sysutils;

type
  TDbCentroCusto = class(TCmDbObject)

  private
    FCodcorresp: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FAtivo: TCmDbField;
    FResponsavel: TCmDbField;
    FStatusgrupocdc: TCmDbField;
    FCodreduzido: TCmDbField;
    FIdusuario: TCmDbField;
    FNome: TCmDbField;
    FIdempresa: TCmDbField;
    FIdprograma: TCmDbField;
    FIdUsuarioInclusao: TCmDbField;
    FIDPlanCentCust: TCmDbField;
    FCodExterno: TCmDbField;
    FCodArea: TCmDbField; //Mosé Pietro SOL 176165 KTN 1609814
    FFlgInventarioTI: TCmDbField;
    //FIdLotacao: TCmDbField; // Felipe A. Santos SOL 229874/16591 PPM 544751
    //Cássio Rovaroto - SIG nº 59823.59824 - Início
    //FCodLotacaoeSocial: TCmDbField; // Andre Imakawa SOL 258754/17869 PPM 1136600
    //Cássio Rovaroto - SIG nº 59823.59824 - Fim
    
    procedure SetAtivo(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodreduzido(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetResponsavel(const Value: TCmDbField);
    procedure SetStatusgrupocdc(const Value: TCmDbField);
    procedure SetIdUsuarioInclusao(const Value: TCmDbField);
    procedure SetCodExterno(const Value: TCmDbField);
    //Mosé Pietro SOL 176165 KTN 1609814 Inicio
    procedure SetCodArea(const Value: TCmDbField);
    //Mosé Pietro SOL 176165 KTN 1609814 Fim
    procedure SetIDPlanCentCust(const Value: TCmDbField);
    procedure SetFlgInventarioTI(const Value: TCmDbField);

    //procedure SetIdLotacao(const Value: TCmDbField); // Felipe A. Santos SOL 229874/16591 PPM 544751
    //Cássio Rovaroto - SIG nº 59823.59824 - Início
    //procedure SetCodLotacaoeSocial(const Value: TCmDbField); // Andre Imakawa SOL 258754/17869 PPM 1136600
    //Cássio Rovaroto - SIG nº 59823.59824 - Fim
    
  public
    property Idempresa: TCmDbField read FIdempresa write SetIdempresa;

   // pendência 14804 - 30/10/2003
    property IDPlanCentCust: TCmDbField read FIDPlanCentCust write SetIDPlanCentCust;
    property CodExterno: TCmDbField read FCodExterno write SetCodExterno;
    
   // FIM  pendência 14804 - 30/10/2003
    //Mosé Pietro SOL 176165 KTN 1609814 inicio
    property CodArea: TCmDbField read FCodArea write SetCodArea;
    //Mosé Pietro SOL 176165 KTN 1609814 fim
    property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
    property Nome: TCmDbField read FNome write SetNome;
    property Responsavel: TCmDbField read FResponsavel write SetResponsavel;
    property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
    property Codreduzido: TCmDbField read FCodreduzido write SetCodreduzido;
    property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
    property Ativo: TCmDbField read FAtivo write SetAtivo;
    property Statusgrupocdc: TCmDbField read FStatusgrupocdc write SetStatusgrupocdc;
    property IdUsuarioInclusao: TCmDbField read FIdUsuarioInclusao write SetIdUsuarioInclusao;
    //property IdLotacao : TCmDbField read FIdLotacao write SetIdLotacao; // Felipe A. Santos SOL 229874/16591 PPM 544751
    //Cássio Rovaroto - SIG nº 59823.59824 - Início
    //property CodLotacaoeSocial : TCmDbField read FCodLotacaoeSocial write SetCodLotacaoeSocial; // Andre Imakawa SOL 258754/17869 PPM 1136600
    //Cássio Rovaroto - SIG nº 59823.59824 - Fim
    Property FlgInventarioTI : TCmDbField read FFlgInventarioTI write SetFlgInventarioTI;  //Everson Cunha - SIG48344

    Constructor Create(Aowner: TCmCustomCdbObject); override;

    Function Insert :Boolean; override;
    Function LoadFromDb :Boolean; override;
  End;

implementation

{ TDbCentroCusto }

constructor TDbCentroCusto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CentCust';

  fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Empresa');

   //  pendência 14802 - 29/10/2003
   FIDPlanCentCust   := CreateCmDbField('IDPLANCENTCUST',ftfloat,False,False,False,True,'Plano');
   FCodExterno       := CreateCmDbField('CODEXTERNO',ftString,False,False,False,True,'Código');

   // FIM - pendência 14802 - 29/10/2003
   //p:22728 30/06/2006

   fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'Código');
  //fim
  //Mosé Pietro SOL 176165 KTN 1609814 inicio
   FCodArea          := CreateCmDbField('CODAREA',ftString,False,False,False,True,'CódigoArea');
   //Mosé Pietro SOL 176165 KTN 1609814 inicio
  fNome              := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
  fResponsavel       := CreateCmDbField('RESPONSAVEL',ftString,False,False,False,True,'Responsavel');
  fIdusuario         := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'Usuario');
  fIdprograma        := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'Programa');
  fCodreduzido       := CreateCmDbField('CODREDUZIDO',ftString,False,False,False,True,'Código Reduzido');
  fCodcorresp        := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'Código Correspondente');
  fAtivo             := CreateCmDbField('ATIVO',ftString,False,False,False,True,'Ativo');
  fStatusgrupocdc    := CreateCmDbField('STATUSGRUPOCDC',ftString,False,False,False,True,'Status');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'Usuário Inclusão');
  //fIdLotacao         := CreateCmDbField('IDLOTACAO',ftfloat,False,False,False,True,'Idlotação'); // Felipe A. Santos SOL 229874/16591 PPM 544751
  //Cássio Rovaroto - SIG nº 59823.59824 - Início
  //fCodLotacaoeSocial := CreateCmDbField('CODLOTACAOESOCIAL',ftString,False,False,False,True,'Codigo Lotacao'); // Andre Imakawa SOL 258754/17869 PPM 1136600
  //Cássio Rovaroto - SIG nº 59823.59824 - Fim
  FFlgInventarioTI := CreateCmDbField('FLGINVENTARIOTI',ftString,False,False,False,False,'');     //Everson Cunha - SIG48344

end;

function TDbCentroCusto.Insert: Boolean;
begin
  fCodcentrocusto.AsString := FormatFloat('#0', GetSequence('CENTCUST'));
  Result := Inherited Insert;
end;

function TDbCentroCusto.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCentroCusto.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;
//Mosé Pietro SOL 176165 KTN 1609814 inicio
procedure TDbCentroCusto.SetCodArea(const Value: TCmDbField);
begin
  FCodArea := Value;
end;
//Mosé Pietro SOL 176165 KTN 1609814 FIM
procedure TDbCentroCusto.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbCentroCusto.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbCentroCusto.SetCodExterno(const Value: TCmDbField);
begin
  FCodExterno := Value;
end;

procedure TDbCentroCusto.SetCodreduzido(const Value: TCmDbField);
begin
  FCodreduzido := Value;
end;

procedure TDbCentroCusto.SetFlgInventarioTI(const Value: TCmDbField);
begin
  FFlgInventarioTI := Value;
end;

procedure TDbCentroCusto.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

// Felipe A. Santos SOL 229874/16591 PPM 544751 - início
{
procedure TDbCentroCusto.SetIdLotacao(const Value: TCmDbField);
begin
  FIdLotacao := Value;
end;
}
// Felipe A. Santos SOL 229874/16591 PPM 544751 - fim

// Andre Imakawa SOL 258754/17869 PPM 1136600 - início

//Cássio Rovaroto - SIG nº 59823.59824 - Início
//procedure TDbCentroCusto.SetCodLotacaoeSocial(const Value: TCmDbField);
//begin
//  FCodcentrocusto := Value;
//end;
// Andre Imakawa SOL 258754/17869 PPM 1136600 - fim
//Cássio Rovaroto - SIG nº 59823.59824 - FIm



procedure TDbCentroCusto.SetIDPlanCentCust(const Value: TCmDbField);
begin
  FIDPlanCentCust := Value;
end;

procedure TDbCentroCusto.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbCentroCusto.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbCentroCusto.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
  FIdUsuarioInclusao := Value;
end;

procedure TDbCentroCusto.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCentroCusto.SetResponsavel(const Value: TCmDbField);
begin
  FResponsavel := Value;
end;

procedure TDbCentroCusto.SetStatusgrupocdc(const Value: TCmDbField);
begin
  FStatusgrupocdc := Value;
end;

end.

